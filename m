Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827A9C54E71
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dstrh3lzlVGLVSABDCHsoac3fbOlftN3PKYAFygIrK4=; b=rgHaLZWLrVyulu
	d+x7xrh/0rDEEe1bi7u/N4H3IwltGVamuBhjuFotVx//UKUADQhu1yjRQsV1M0/536jIOAbpjednZ
	OY8BXgM5Mtcs136hQJDBvVHDLN13CJM3x80BsJbEi6wJ6yDyn7dHpV9rQUeQ1cLFRjOBG//w4800Y
	x3qIYs6pgnFBBxmzDgFN6GGM4EeK3FCWJYpyoN0SEf9RD0s6NCIiAdp1EL3fp7RvXb//Ej0Hx/UPT
	Oghpta9+G8VH2qXh1LJePuUKhZuTltdDij0QY3hQpG7ltgHzQYRQvgu4StTu9psXWPU+zAnDTlLVX
	BNEjTCHd1JE5u8/dfhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUg-0000000EMoB-0jo0;
	Tue, 19 Mar 2024 21:59:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUV-0000000EMee-3xV0
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e6b54a28ebso5898712b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885560; x=1711490360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw7AaJXdckjCcYy8ru8KTiHIANuUIN3Ni5CiYoljsMY=;
        b=RI9LjRLE5al2SBuDYBQksj+czIe+q8fo1gbMl28JpoDeT0DxxR0SFntih9BANEsyVU
         clIcF9kjeCE8VndaUNPJiPYDeH6N4C4hL0780etzCtYXi4Df+tp5Jft+RMpIgZbX6Nsh
         2NPa6DCKij0ckznJ+hGO1mWHv8y2NLcqKwdv1/1mT6/X4hNwwSL4vazU/JAilE0XWe73
         Cnj3J9GImfDonllzFmH1xmO29EvMo2ARbsFJ5zpruR1oYlXWaH5EMhyEmhaP2ywcAU91
         nUKG4f94GMjtHQXunHYNRZKDVyKxul2eX04BWY9h6J3aFO+7WH2wfDLnkImJwWkvpIGr
         fOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885560; x=1711490360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw7AaJXdckjCcYy8ru8KTiHIANuUIN3Ni5CiYoljsMY=;
        b=VwNKyJh0Uyp9clceU5PozSaOcG1K0EuHlQaqzNcqILrb/FgkUwLbbflMAX8hXTjBMp
         uVImFGeB7NcT2JknibiyffxDFPx5gtwy8K4nD0SNdrInQjFgXr/hmmpkuzuo2/mj8sSQ
         EfGfNUrrCq7q7qJpg238H955eeglGlVZVlj/Ti9D8cAKCCAMPAajaeUsPojJg6T1aHu5
         4XFhUjO6Jzc+a4V8MXEcPPp04HLAnDNUr5wa32WpZPMM7R/ekHTHCfa0cRsXU3OoQKri
         BuqciAjctbsMFq5irESfi33umOBCYkRpmgXuriz/ATLD1rqgGoGtGWEXsmP754J3BIUz
         cgnA==
X-Forwarded-Encrypted: i=1; AJvYcCV5WAS47u8rFgWs8Fx/t2QADpVLE+9ctmCEzUXi4i4+T+8Ma7F5UQf+v5QUdW89EKH5HlNN3haLrbNHiYrO8NHy00K7kEoONKFXfHyeKvg+
X-Gm-Message-State: AOJu0YzSDqfsUgzdG3l6Suk2vHHQP9Q7nFsYMCv7M9iIhRLVKmfu3Wpw
	je86MI98DqUJgwD2N0doYWWzDGXgT7S+UKimZyr8gnaSI/MMaJP2EViNDsi998A=
X-Google-Smtp-Source: AGHT+IGDkK4VMEEzpfRCSNThBGjrgCcpdqf0s10wRrEBrgNVgbv2+4UnRTUBfVw5XKDLPYKeaCEdMQ==
X-Received: by 2002:a05:6a00:1701:b0:6e7:8047:96f0 with SMTP id h1-20020a056a00170100b006e7804796f0mr796041pfc.28.1710885560589;
        Tue, 19 Mar 2024 14:59:20 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:20 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [RFC PATCH 3/9] riscv: Add CSR definitions for pointer masking
Date: Tue, 19 Mar 2024 14:58:29 -0700
Message-ID: <20240319215915.832127-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145928_186200_93E7747B 
X-CRM114-Status: UNSURE (   8.59  )
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

Pointer masking is controlled via a two-bit PMM field, which appears in
various CSRs depending on which extensions are implemented. Smmpm
defines the field in mseccfg; Smnpm defines the field in menvcfg; Ssnpm
defines the field in senvcfg and (if present) henvcfg and hstatus.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..1d5a6d73482c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -119,6 +119,10 @@
 
 /* HSTATUS flags */
 #ifdef CONFIG_64BIT
+#define HSTATUS_PMM		_AC(0x3000000000000, UL)
+#define HSTATUS_PMM_PMLEN_0	_AC(0x0000000000000, UL)
+#define HSTATUS_PMM_PMLEN_7	_AC(0x2000000000000, UL)
+#define HSTATUS_PMM_PMLEN_16	_AC(0x3000000000000, UL)
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
@@ -194,6 +198,10 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_PMM			_AC(0x300000000, ULL)
+#define ENVCFG_PMM_PMLEN_0		_AC(0x000000000, ULL)
+#define ENVCFG_PMM_PMLEN_7		_AC(0x200000000, ULL)
+#define ENVCFG_PMM_PMLEN_16		_AC(0x300000000, ULL)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
@@ -215,6 +223,12 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* mseccfg bits */
+#define MSECCFG_PMM			ENVCFG_PMM
+#define MSECCFG_PMM_PMLEN_0		ENVCFG_PMM_PMLEN_0
+#define MSECCFG_PMM_PMLEN_7		ENVCFG_PMM_PMLEN_7
+#define MSECCFG_PMM_PMLEN_16		ENVCFG_PMM_PMLEN_16
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -381,6 +395,8 @@
 #define CSR_MIP			0x344
 #define CSR_PMPCFG0		0x3a0
 #define CSR_PMPADDR0		0x3b0
+#define CSR_MSECCFG		0x747
+#define CSR_MSECCFGH		0x757
 #define CSR_MVENDORID		0xf11
 #define CSR_MARCHID		0xf12
 #define CSR_MIMPID		0xf13
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
