Return-Path: <SRS0=xysQ=M7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4758AC4338F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 17:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BED60E76
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0BED60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVGY8V5sYOet22DPZAuhOeIeDo/HT/RdDnJV3BRvyQQ=; b=oEOIuYMn5P5/Hm
	QhOPvtuouW/K0L8oWtJ9P25pIrsP06VGpDM1oRn+KG9aE0j/jTgCM7nXa8p371TBi7UgzKjV1K1pN
	PVHcdknBENfwGEGl7fEh3rqjyxI9iUBZhO4B2C0wtjk6W6FArtAPXjqJ6Wca509O73PrE2mUnOnVr
	fvHcSNbvdKhk9Vabo57xqky2IbLFvbHzoTjwFHGkvYXNQ3qcGxhlZ3dr+iAevOY0QJXkZyugQiO0m
	bihUqQ/7S0EL0ohI1SQnqKLZIZCVT1xg5vO7j/G4uU3aDCZ/Mt2C/PZ0/T4MJs5F/+j5om1ykZKcD
	9XGYT4DewAiZpvtYO9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCmfK-00GBYs-Kf; Sun, 08 Aug 2021 17:32:50 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCmfH-00GBY8-Vt
 for linux-riscv@lists.infradead.org; Sun, 08 Aug 2021 17:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=mEBPb7uJhspwGBVzHQeQ07LejInNjVQaJw
 9WxmbgQEs=; b=TPKkmskwOMPg67nmXGR1Vnz6baRH3PIwnNm23XA4ZJxi8mZj3u
 RhQtXazh2X+w/3v+Ctic81Z/YmiA8/BQa7i64hLAc6YSBfL1LpKF1c9phJVEmxR7
 iZ/0SyyWdzc7XGInAnpJ9DjjYvofbMG/l74DEOmPJK+ukrS6D499bjsO8=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBH+Pw+FRBhcvgMAA--.3365S2; 
 Mon, 09 Aug 2021 01:32:46 +0800 (CST)
Date: Mon, 9 Aug 2021 01:26:41 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: Move EXCEPTION_TABLE to RO_DATA segment
Message-ID: <20210809012641.1b7916a9@xhacker>
In-Reply-To: <20210809012509.4983c1d6@xhacker>
References: <20210809012509.4983c1d6@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBH+Pw+FRBhcvgMAA--.3365S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyxtrWfKw15Xr1kArWDurg_yoWkKFc_G3
 Z7Ww4fWryfCw4Sva4UGw4fWr90yayrKFyvvw1jvrWxWFy3Xrs0q3s5JF43Z3s8CryxCrs3
 AF12kr97Cr12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFkYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
 k0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcj2MUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_103248_526376_034F7A08 
X-CRM114-Status: UNSURE (   9.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jisheng Zhang <jszhang@kernel.org>

The _ex_table section is read-only, so move it to RO_DATA.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
 arch/riscv/kernel/vmlinux.lds.S     | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index af776555ded9..9c9f35091ef0 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -121,7 +121,6 @@ SECTIONS
 	}
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
-	EXCEPTION_TABLE(0x10)
 
 	.rel.dyn : AT(ADDR(.rel.dyn) - LOAD_OFFSET) {
 		*(.rel.dyn*)
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 502d0826ecb1..5104f3a871e3 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -4,6 +4,8 @@
  * Copyright (C) 2017 SiFive
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
 #else
@@ -112,8 +114,6 @@ SECTIONS
 		*(.srodata*)
 	}
 
-	EXCEPTION_TABLE(0x10)
-
 	. = ALIGN(SECTION_ALIGN);
 	_data = .;
 
-- 
2.32.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
