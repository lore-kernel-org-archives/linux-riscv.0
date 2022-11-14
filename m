Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068D8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysgmKz7NW7KfdsMi08e3DToJPY10FwUPG3Jf0OoTCw=; b=tUgAMZFJ9DDDAe
	V6uMKx6/vuXJwy4hc+5gOdiBDd3To9nmGToI/KD5/XYwxXC6iFitbdXbC/XcqZg97XShuzb413+X9
	R/OsejY+7XAekN6fhkkvExQNZiflLvEAMWGDUKBSboFHGd0hlQPZRUGvMNieJ9dveLXcfxGBx/Q9F
	EA0IjM8ACJxTQ1gQK8JDjZRSoQtgF8PlLhXhBEN2cb4cmYr8e0148cXqMkh3NTcDXHmUMGskpIyJO
	nG7V2jJkJk9tW8XkFXdPncjGOQpmQ6ZqqcTsK2NhKEuILhRxHbsFfyoAhfaC8ovGLuT1LA4vRg7sx
	3Ku7DcKtf27kDtpsUjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVx9-00HF6d-39; Mon, 14 Nov 2022 09:40:31 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwq-00HErK-4G
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:40:13 +0000
Received: by mail-ot1-x32c.google.com with SMTP id p10-20020a9d76ca000000b0066d6c6bce58so3271179otl.7
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=mYE+ec9IXB6vAxMkqvnDohJnignWzN6sP+uMuCmmjqMF+LN7t8mFcaVk7M/IUujQQQ
         QpMlpGljTQMKtQMDU3t8ud4Q/NRM7Xv6atQp2CVvv7sfAc6rErDtSkcYOBiWVkBwNw7V
         4RmUJ8o75a6ssu5twmDTth2IRViiHPXo/ICejPp24KRzDf3S9UCYbblReHoDtHPODOE2
         ub5hSzx8RGHlhfyaeQk2gUFDvhx2uyGBiuNuIVlf8lDV25wXQXQxHnFXaav0kCB3ltzr
         ia86Z9pdVyMViCKaidGZfx6q1Si7pyHtno+aPhr5shTjhXhLmD1sLdI9miWUhaHRNSHC
         jpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=LyJBB1mAuvkNbTF+EDi64Qiys3qMfPlabJJXGXlG3GMPZIhxQWZQQ+ycvhIF/aOGUA
         ElKlsYThO08fUPhjhHmI7AhvX6Zinn7YnnlLvK9L5JYQvg3Mhe/rJ3aRKJKY1OoBL18C
         8BalqPqTFSqeSxeDAW/EoLgmy0bYi9x8OuogTwGmd5Ti4w+wmNV0JoOjk4H5tN7Ze/BX
         UKQxyt33PU1PzMCL+jI+s+nWPlrCrSk6My1T6DcTjJ0VVevVcRJSRwejvUv0q/UZwoRt
         H2dHib2Eu2k5quR7JCe79UuCz0DG0FCsevJiYxRDHqOPXWYJ2jtPDJE5TsaysR6XTbwE
         2b5g==
X-Gm-Message-State: ANoB5plY2blqrMBYKDAcXMy/n7uWic/sevCviw50iyDesiR4+qFXYdEo
	NfR/XihTo4n4eFI5KP1yKsBfHg==
X-Google-Smtp-Source: AA0mqf5PWFamSHkt6BWY3FBYrOVdIwJqVj5bAOC0u2eHqPfK+YFGfVO1f3M0sLrDjrE+6PUeGz3JSA==
X-Received: by 2002:a9d:4f10:0:b0:66c:5232:b9d1 with SMTP id d16-20020a9d4f10000000b0066c5232b9d1mr5855911otl.224.1668418807264;
        Mon, 14 Nov 2022 01:40:07 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id l12-20020a4ae38c000000b0049f3bdd791esm3222677oov.26.2022.11.14.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:40:07 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v11 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Mon, 14 Nov 2022 15:09:04 +0530
Message-Id: <20221114093904.1669461-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114093904.1669461-1-apatel@ventanamicro.com>
References: <20221114093904.1669461-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_014012_254306_FA61DC3E 
X-CRM114-Status: GOOD (  10.73  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 57b40a350420..f10cb47eac3a 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
