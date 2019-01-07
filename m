Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB01C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 14:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFFA2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 14:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4+E56dR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFFA2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GqcNnxv5PRtHRFJx9eb1fZiDSFgYvGegS/IiHVrXTU=; b=o4+E56dRgO1O9q
	02JoenQbvn6fXkyvQGL1f7691ylU2LNPPmp3EMkgKFjgUmZFaOzEIJ2C8Vp1sc2OsWGHmryXbaH3h
	3EQ92fh+BUYIwGovCvU38I6X28fzD4gNd6v8Q3cca6hA/uYNFhFKI5ZLUO/q6GoywXhshUJasJvKd
	NEvQeuuWqcVulPbPX7yvg1bnnQ6FUCUW1zo1wZqaJ2D1VCP+tEiwS8AvXzjxsbA5hUqxuj1i/i95o
	nl7/8drcjT48pXkyJx4lfsS88m3fch16NKMVfIlLKP0DhIRH4pHC+wDuopZMj03Rbm42TQb4oJCKf
	vnC0KGKFj/u8AY/Zg2vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggVhp-0002a7-7A; Mon, 07 Jan 2019 14:16:41 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggVhm-0002ZH-C9
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 14:16:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EAEA5AC4E;
 Mon,  7 Jan 2019 14:16:36 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH] RISC-V: fix bad use of of_node_put
References: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
X-Yow: I will establish the first SHOPPING MALL in NUTLEY, New Jersey...
Date: Mon, 07 Jan 2019 15:16:35 +0100
In-Reply-To: <1542755270-10433-1-git-send-email-atish.patra@wdc.com> (Atish
 Patra's message of "Tue, 20 Nov 2018 15:07:50 -0800")
Message-ID: <mvm8szwwo1o.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_061638_562359_4219B0A1 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

of_find_node_by_type already calls of_node_put, don't call it again.

Fixes: 94f9bf118f ("RISC-V: Fix of_node_* refcount")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/smpboot.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index fc185ecabb..18cda0e8cf 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -57,15 +57,12 @@ void __init setup_smp(void)
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
-		if (hart < 0) {
-			of_node_put(dn);
+		if (hart < 0)
 			continue;
-		}
 
 		if (hart == cpuid_to_hartid_map(0)) {
 			BUG_ON(found_boot_cpu);
 			found_boot_cpu = 1;
-			of_node_put(dn);
 			continue;
 		}
 
@@ -73,7 +70,6 @@ void __init setup_smp(void)
 		set_cpu_possible(cpuid, true);
 		set_cpu_present(cpuid, true);
 		cpuid++;
-		of_node_put(dn);
 	}
 
 	BUG_ON(!found_boot_cpu);
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
