Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 04:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOKG1TbwprfXOOyYM6S6EnC5yj9WY5E8epKUKrrcJyE=; b=3bFTxa9bflkbuK
	L69lIC+fra7AxoHKQNHQr39BLvVqgXr73o4vIkpCUVLF0Mgwsk+C1uee4MRwXyLcLweICyRnfHTqq
	kSv+Wa7bckA1/OG6JSwRWUZDW1r6qz16cd90R/T1GfO1651nYTGBm8k2tHlQGVY3QX4Hipc2SiBeh
	r31RVmQsmblBChVGsIpYpqFqaGS96/qiti9BYFWXmqij3ARXcUavfDRp6Hyrwr5LghTz0JsKELP62
	n0/YFA6wJNJldQkUA5dgSUtnSOHXgI6Sk6eGvMu8sKnP1jrHFcEB/ckfcEy7u4qMAgiaigJH2VUlL
	WtaAw8sSAxJsvk2ka4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbm-00GZxs-Iu; Fri, 27 May 2022 04:29:54 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbk-00GZwy-8o
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 04:29:53 +0000
Received: by mail-pf1-x434.google.com with SMTP id b135so3355605pfb.12
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 21:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nR9+lFDVWdG+A4IFcYjo6WmhDE582l71q5vLoqIpBj4=;
        b=62xDO5IB4clHRS64CC/NW1NkIku48BMqmgn/77ptmXH/0phmqWwYEjuqlSxKo4TopR
         UZpWEb9vx8561TtxrVLtvv3+53/e2ImY9Ep9j2At8bVUmgTHfjqbM7Hd61Wycp/ZDabl
         mBxR83pkyVSWffv5K90+ii/yyPQ0A3PuvLSGJu+q4qsfLgYq8ofHCdFGiNOT0q8L13YK
         qvQY75RW7DuVBnVKXHLrNZ2qPYOuDeSZVb43p+eu1mAICjo8TConZOVMcCuDhtV9Kud/
         FHmrEKJx4QYRAplRkkBy0oh+JZJxQwuPJIPK/1Ui8QqitmiaEiVvhzwG07qRTu8C6ciJ
         FmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nR9+lFDVWdG+A4IFcYjo6WmhDE582l71q5vLoqIpBj4=;
        b=WftxkLJqV8PfdBo1webftXi/SEj341VFMnZejzaWYL5iHqwZUF7QpCP9UIkEoIiqs9
         0ztiIR2nChKSL2g5u76KmLVyhAOTmrxRpXodG562vPXIo3pZENnztQnyj/Om+TmTysu7
         lCgWioyk0jl4RMqUVluHL+Qkb6aTG6Om6QdmL08M2QJ6FpQKXCk15gm4/+pPuhZ/BnxO
         gRXsFZ2m9Iz3TuviP/SP5JNKOGnjyn5ivoWKW2vsHc3mbtLZc2EPfw5R8LhpBeYmtqsD
         YkPsr0ujVr1v98iuSUwGGqGSiNvFhzit9UUXUx34u4iJIo3J1L/vLlV3n8sjrTb6Gtna
         QmKQ==
X-Gm-Message-State: AOAM532DaTJ1SRU0lkqcUT3gvnPBAXkDwWkRD0YND6VflFaYR2FHE/SJ
	zfKstituE8/toXsO3WuxEmLnP6zCfn03Kg==
X-Google-Smtp-Source: ABdhPJxsxHivtXd3dZpXsXY5uBossZvXRjKhw57nDDKiHoqjVeDwvonR4ougYayiJMDZJTdPbmx8Lw==
X-Received: by 2002:aa7:9047:0:b0:519:36a2:9f63 with SMTP id n7-20020aa79047000000b0051936a29f63mr1461473pfo.60.1653625791220;
        Thu, 26 May 2022 21:29:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y63-20020a638a42000000b003fadfd7be5asm2352307pgd.18.2022.05.26.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:29:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/4] RISC-V: Add SSTC extension CSR details
Date: Thu, 26 May 2022 21:29:34 -0700
Message-Id: <20220527042937.1124009-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527042937.1124009-1-atishp@rivosinc.com>
References: <20220527042937.1124009-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_212952_347623_E62B73DC 
X-CRM114-Status: UNSURE (   8.05  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
