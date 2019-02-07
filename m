Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711C1C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 14:44:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC4121872
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 14:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNfMMcd0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC4121872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3Yf5dmByKkBqYpnOytrm9DEJ/bPuYyyGpkQXZjgMD8=; b=DNfMMcd0WOTVZ4
	LctNHpNqnBVen14t6OQbjVU8+9eG1ktEewgQGC0sl5S+/XukkIADaGyNTCwkUEYibaGBFwOUdJvt3
	tA+FStl7Zyp+DbidMSBZmw7llmuLcodhcJI3KEQvvY2Mz2tP5tADxypkamw/OGXDggy5rIOOhXmnO
	78BDtKubpprcswUm55UaaC5cf4/X24fe6N4O7C0UE6c3imznyJNaKQSThIwxW13BP7dxVB5dcBfLn
	syhivW1oJlSC7CKVhnucRdHBgcra0epzVq3sTb1YfNLWRH6W6V0crxv4Hj9++HrxpmF9h3Fxv/PRw
	/WrNNU58K+73LoFVxzfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grkup-0008Pe-NT; Thu, 07 Feb 2019 14:44:35 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkun-0008NY-8Y
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 14:44:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84374AD38;
 Thu,  7 Feb 2019 14:44:27 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] arch: riscv: fix logic error in parse_dtb
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
X-Yow: Why was I BORN?
Date: Thu, 07 Feb 2019 15:44:26 +0100
In-Reply-To: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com> (Paul
 Walmsley's message of "Mon, 17 Dec 2018 19:15:12 -0800 (PST)")
Message-ID: <mvmr2cjy7xx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_064433_448239_AB556DFF 
X-CRM114-Status: GOOD (  12.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, paul@pwsan.com, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The function early_init_dt_scan returns true if a DTB was detected.

Fixes: 8fd6e05c7463 ("arch: riscv: support kernel command line forcing when no DTB passed")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45e9a2f053dc..84f19ca6d88b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -140,7 +140,7 @@ asmlinkage void __init setup_vm(void)
 
 void __init parse_dtb(unsigned int hartid, void *dtb)
 {
-	if (!early_init_dt_scan(__va(dtb)))
+	if (early_init_dt_scan(__va(dtb)))
 		return;
 
 	pr_err("No DTB passed to the kernel\n");
-- 
2.20.1

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
