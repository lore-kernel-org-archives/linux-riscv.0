Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980C5C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suff1Jpj1LXRIuVQmSO/caSz3KtYHjJ61b0JTyJ4h9c=; b=y/Pyts4kRR2ahI
	Tv14SvEyXE+No5bDy3WSD/c/zJryERcEzQha+CwZjNtADMFKACdCxtiXkujDhtgN4SpV781X1CUep
	1QvU5uUaMWBWvI6mD1/qM64JCpOGNUSGWDJdpKWaFPGc60JPhCi8HU8uX13yvbVhhlE0Cq4LcqXym
	SRUj4QWboapXrluSrTmtWLqCK0+hHJIDPpIfxXbiEfEN+jQD/eDmUBt05vfzD+2loRc0hWfEgGi7X
	Rp7DZiwtiDHaRhkjgzhAD798j5Fs9/yqeh6lISVfxTvUASM1GQs/S5x6LgMSRYSjGcjU6avseeesR
	7dxJ4DSxga5NsritKPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQJQ-00FrFE-9U; Tue, 26 Apr 2022 18:53:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQJB-00Fr7R-QP
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 18:53:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id e24so2372716pjt.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Abl0bfYYrLlQ27vYh6a3IKNxFiISaIZQZeWkMU0B+HY=;
 b=vBrOC+clk/14uoGOtUn6c44gW3HFg6+QeB4YEt2tbdI3Rg4yeq77I+oddnQCUvlydX
 iqg0VvE+xjRD4sWxZ1mmoMfRyrVxDPrUtXKkDrNRWGiibUU5SffVNYDCOpqXJjxDdfm+
 /rqFvZzeeyDfpQ76ca7H7LzTLOeXPvHCD/pCuz5pOO8kXPjiAwdv46d+k1hN/PFWNd+S
 LE/PYTA7+dKF64/xYYMYdLWJgicaGpcdpGKTGGfp30OgMWLTSJq6OCxzp2iLWkNNeiSk
 DE2Xcjq/QTbTVXOE/59QHyVR17aRUr04hI760rCpzv0eJ487aQJHQthEkwcuJ3xj55vm
 C22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Abl0bfYYrLlQ27vYh6a3IKNxFiISaIZQZeWkMU0B+HY=;
 b=F1gPrpMHfwLG+8mQ2bNT9YpV2ta7rArqEWyvFr7cYvzsR3XAINfEi4Mq4t0tutXV8Y
 Gcq5MB37rKNXu5m+cCAdCK/rc7moalWcf90h7cgrQdiJ9b36LG3qjb2smsr46wxV9Nkv
 uWohJxPn7FvDnOeixHGL1OfcS9TESAsqcgPcfDkIzmHXe9BpSM4o8PbZSg2JEIQDFkKA
 +iqQd/HeFQAE+aSLaL8ZRA01/hLPpTdQcpexGt1FNI0Gs5+K/D1TfNE8aOC45R0NMuYq
 qvJJ1ZVCwjNxe0KH4D6zEXnPGP2Ap1ieSnY/gJiDeNoEApEVVAQHmQNBjDqh4Y02ftIA
 8Dmw==
X-Gm-Message-State: AOAM530awEyHC8Kp/MJk8UVqGOt1FNDl6xFQEd2pRylfS/j0x3uqhOZL
 ywPM2EmhH+yhaukaPMAfmIuxOw==
X-Google-Smtp-Source: ABdhPJx/bBDnaGbhRf26Abl87DpdzPlrl9/ustlrU9hsLHOANPcCs60CUmoMIuPL0ZgfMH86wSd+tw==
X-Received: by 2002:a17:90a:884:b0:1d9:531c:9cd6 with SMTP id
 v4-20020a17090a088400b001d9531c9cd6mr16498367pjc.211.1650999188661; 
 Tue, 26 Apr 2022 11:53:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 cl18-20020a17090af69200b001cd4989ff5asm3839664pjb.33.2022.04.26.11.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:53:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/4] RISC-V: Add SSTC extension CSR details
Date: Tue, 26 Apr 2022 11:52:42 -0700
Message-Id: <20220426185245.281182-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426185245.281182-1-atishp@rivosinc.com>
References: <20220426185245.281182-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_115309_906432_3706B3B6 
X-CRM114-Status: UNSURE (   8.75  )
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

This patch just introduces the required CSR fields related to the
SSTC extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e935f27b10fd..10f4e1c36908 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -227,6 +227,9 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_STIMECMP		0x14D
+#define CSR_STIMECMPH		0x15D
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -236,6 +239,8 @@
 #define CSR_VSTVAL		0x243
 #define CSR_VSIP		0x244
 #define CSR_VSATP		0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 #define CSR_HSTATUS		0x600
 #define CSR_HEDELEG		0x602
@@ -251,6 +256,8 @@
 #define CSR_HTINST		0x64a
 #define CSR_HGATP		0x680
 #define CSR_HGEIP		0xe12
+#define CSR_HENVCFG		0x60A
+#define CSR_HENVCFGH		0x61A
 
 #define CSR_MSTATUS		0x300
 #define CSR_MISA		0x301
@@ -312,6 +319,10 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+/* ENVCFG related bits */
+#define HENVCFG_STCE	63
+#define HENVCFGH_STCE	31
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
