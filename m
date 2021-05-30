Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15D5C47089
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CEC6102A
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CEC6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/gap8K0w1ve2xvPMUL+S9lgiHPqiwvc0hbaPBschXI=; b=iwjjtfkf8TA+7S
	qCXPE6b+kDlcufW6AD6FMnID46HbIGx6/v2HaAMHbcysGNBXs2CuMpT9ls1w8+LRCA7cchJsw6l6I
	ODas+wnXs3wCwvFevCdr+Iun8b4xoyh7rz+ElfGigpHMe8CM5u95sLNVYG4wuXZYyxsbzvGzfX4kj
	LBzgKRdfQrfGFYV2DYHEpe8HbS/DnpJHq2q2GUntU6jP3xHX/0DKAX1AI5pKjiMEvg+jMiKJsWzlL
	tVXvHQViV0xa1lUI+u++iHmqChVdXDiGZSduuEQUzexwT2XtSsIKvrDUIPE+/42dq2Ta4QbPTOq3r
	50ODflffvS6+ct64iASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnDSy-008z4z-Hm; Sun, 30 May 2021 04:54:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnDSw-008z4S-P7
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 04:54:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86B9F61107;
 Sun, 30 May 2021 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622350462;
 bh=ld9Tfr3N3Uv38Fxhir93icz1umeDF3KkC8aAIxDQbwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XOIfg7mlMFZ1nQjdb4dqKXiGjWv4ZyQCW5AnwlKX6jwR73kWxxyGvpdHy5IQzeaBD
 IEzoWQrCygRhksdK7aK5cMQKinDPutXSMAHrAwbkGOLxOeDx8/tb+dOmendeBqkkDZ
 ieD8GayYjH0sb0/1H7KbridiCWa01JtL9eb11ox3sQ8j4zIipLtZZaFy3SZHNB9rkR
 RIgRwDYwp0jpwcFYar1ima3HLNARvxAEv11BDw/T+2AToUFlgU6JupO+Dbm5fN+CRK
 zBAoP7A57auTr3bwrq6C3F2/udTLN6gxgnvtghKzPjKhZlVuUFmOIhmwpq0aI+ewnt
 qYKfgTpAJA5AA==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/2] riscv: Cleanup unused functions
Date: Sun, 30 May 2021 04:53:27 +0000
Message-Id: <1622350408-44875-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622350408-44875-1-git-send-email-guoren@kernel.org>
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_215422_856274_94D521B2 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

These functions haven't been used, so just remove them. The patch
has been tested with riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/page.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 6a7761c..a1b888f 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,16 +37,6 @@
 
 #ifndef __ASSEMBLY__
 
-#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
-#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
-
-/* align addr on a size boundary - adjust address up/down if needed */
-#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
-#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
-
-/* align addr on a size boundary - adjust address up if needed */
-#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
-
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
