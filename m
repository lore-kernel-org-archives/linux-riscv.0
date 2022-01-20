Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B718BC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFncRjFZjNArRgP0g1XjHnkaR1jXGAFO57rkg+GkaWg=; b=Th0JCVS4dpk6j7
	Tgb92Y1bcpQ+PF1jaagJVzN6zVX71Svjkwx5iSY5/B2CH9o78wEUYNemsVn7Txpy/DLOB8LhKC1WH
	bBh27aF+FUDZ+Y/lrXMbZjm0CfINRhzPhC/b4e5IUD/5zmeTF5FgsW2Nda0uVoMTyuTg/xc7xHWnp
	uEE0Cy19huoSSy94m539ETOQz2HPbrP3lZjNg1V/H9ZnIPYGkQKUf++ITkTunQYyQq7NCINqGKldI
	jWndmACbkMf+cWpzs79UtFA6wz0WBLNKylW6Dn6OmqsdwFyXmtHypxe2Ga4DH5mXRNlckXAUjDAcB
	NYgAPI56/6JA3rgTvogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATSl-00A5oC-Kc; Thu, 20 Jan 2022 09:10:35 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATSe-00A5gd-Qp
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:10:30 +0000
Received: by mail-oi1-x231.google.com with SMTP id w188so8372356oiw.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cregLPA9Ld5NCM+ESP6I6PGf0cEcVokWvRnadp+uE5w=;
 b=AVVW5i2DnqsKPhcjMEuvlpQ5ybWEiyBiINpec3ZW0rns1/rhNaA0UKnSYB8LZLDMWA
 s9nxpRYZPrsGxugJ60t8TXCvZCetYlc8Rpr6wGzt90i/pPtMJeMiSUvTC2pSG/YuE9/y
 FOg5HEGliaR8Lp5dni6/4A3yvgglot+LVyVHDs73LZkH/swvZvkuOxh7YyZg8zkisVzb
 WM/N7spqELk+EK0DyG6PWwHhCyS/lfauUExsKbE/xxpraL5Boo3fg5KtZ3r5FHUarUpx
 Z/djAU706XhYXOvfgLHKIM1HdsoY/1aI8KYggV3VLXoa/T59Ew4sT3soqaSrvHLhaojV
 2lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cregLPA9Ld5NCM+ESP6I6PGf0cEcVokWvRnadp+uE5w=;
 b=LhOkoRdIY6rg1XUo9hWGk8l7588wXBiRgLQa5VFJ9cS64QA4kKD4D9uYxagDsFrSHl
 jXtMhX3a3eQC8oQmzhYhkMx+TDovL8UdTUttnH9iRmZiAi0sl+K/A7APmoST+eCK0Qbc
 /Dvkuc4Kh1tCMg14Zhzd0V9jXEkYOLuDkHju87/G3SXYMbSOtuvzHSQU6bt58Vam4jUE
 FwXOUzTPgHtKtWHcy9tJVsbHIId5pn6Nh5VIXeOgQhVlOypmVwiC/Nx4PLGPNuiBWoj+
 ERX3ZB8uPG80UzIIqwP++x2lWwwQAW0YoL8XvW27qW/w7RGbkAijwQasduU9ww0+upi/
 eHHA==
X-Gm-Message-State: AOAM5312jX8QvoxWWSzSz35mU6h8VgJggf/1P2uFamk74XhyYespBzEw
 D9mrIR+07MJtjyl1L62UR8bkkQ==
X-Google-Smtp-Source: ABdhPJxH63yr6YhuQLRDgWOHYoe9D+xhnb0fWV7h1aJXp7AyriFCAkY7FwCdmh0RA21buP2kABE3mw==
X-Received: by 2002:a05:6808:2018:: with SMTP id
 q24mr6878003oiw.117.1642669828022; 
 Thu, 20 Jan 2022 01:10:28 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i12sm944766oot.25.2022.01.20.01.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:10:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/6] RISC-V: Move the entire hart selection via lottery to
 SMP
Date: Thu, 20 Jan 2022 01:09:16 -0800
Message-Id: <20220120090918.2646626-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120090918.2646626-1-atishp@rivosinc.com>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_011028_905464_50119A52 
X-CRM114-Status: UNSURE (   9.79  )
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

The booting hart selection via lottery is only useful for SMP systems.
Moreover, the lottery selection is only necessary for systems using
spinwait booting method. It is better to keep the entire lottery
selection together so that it can be disabled in future.

Move the lottery selection code to under CONFIG_SMP.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/head.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1f11de45df9c..824aaeb5b951 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -263,8 +263,8 @@ pmp_done:
 	blt a0, t0, .Lgood_cores
 	tail .Lsecondary_park
 .Lgood_cores:
-#endif
 
+	/* The lottery system is only required for spinwait booting method */
 #ifndef CONFIG_XIP_KERNEL
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
@@ -283,6 +283,10 @@ pmp_done:
 	/* first time here if hart_lottery in RAM is not set */
 	beq t0, t1, .Lsecondary_start
 
+#endif /* CONFIG_XIP */
+#endif /* CONFIG_SMP */
+
+#ifdef CONFIG_XIP_KERNEL
 	la sp, _end + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 	mv s0, a0
@@ -339,8 +343,8 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-.Lsecondary_start:
 #ifdef CONFIG_SMP
+.Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
 	csrw CSR_TVEC, a3
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
