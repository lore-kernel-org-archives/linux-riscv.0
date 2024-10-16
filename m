Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE40D2F7C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFjQ0XapMRmHMlGsh+X6X2ak+6YyFCe2MzkijroYrHQ=; b=oq0TEmWHQ608HD
	igpKiqXHFPnDMBJVVEE6Z6cz1g3IOTUUXZwyIL3FsyVxd8q6j+10m1HuECQllxh0+j4c9TlJlI0H8
	5XMFbpgtD7C8MeTfIdMilG3XIf2In2NqmudV5GrMyl4VCdqeB+hUnGFSzIfUaEYxvzBRfByS/LlbS
	fwnr3t32dw1eb6/Y6DVxCLvIjRbq2N5VlmxxcVNqPOJx+tra2/sK9O8HRYNea2zDtpTjFn9JZG0h0
	kziued/YG5RaYHMK6T0Hl41NXmMb20Qx7DvR0AQ7dYvo1J206TQBMd3m8rZhfrHGyc/+DKC9WEecJ
	S9dLtiX0oa8a2AdvXaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bbb-0000000D2ve-1wig;
	Wed, 16 Oct 2024 21:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdA-0000000CwUb-36gm
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 20:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q8L9RcsXGBuOOIJkGyl0uzoPHSEP08/B/TxdDRrdDog=; b=Jd/j8kJ0Zs6aVwOOVN3xJQ/kxQ
	nptapecqKhjS7UGJ9RCYQC8IrgK2/WlfFGlnep1oQC7/1J0dXUy+fo5xsxWMApkf7WFhxZsW+V68R
	alXjuLrlla5bFZsRWmmyXH0e3+bQ5OoWsTThCx9uNzrMcCp5AVbN+VQ5l0ukog4RAm8zzOV3v8iWg
	RT3Pp+/IOXhPha+HX2A4fGd6CQcICPFmPkNEY5GepvnHA1R8WVZ1HpdQ7kjKgmkI+ZC1d7h60lNuG
	vqAETWKfB7zRP+EYSW54bvnjRHrHPdTzNe2FCDI+U4JNVdisVOfjdDQm9G4+QnMNUCYC0P1XiRTc7
	i7Pt0Vfw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ad7-00000006u5m-1Jhe
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso155484a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110502; x=1729715302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8L9RcsXGBuOOIJkGyl0uzoPHSEP08/B/TxdDRrdDog=;
        b=kBkSFQgm8MEWI3xuviBlgddkqE+rO4e8wZqe/6B0vyn7hu8shmzBigXrsbTt8g8xBw
         y4diSjNUVzMxhSQuaJD2SSy9SZwrVhPIH39CwDv9UIz5DqY+J/rhSMnyQ+o2uKUtqkLS
         OFEUzkUD+GQxabfT1N1QcaKJs6KSlCUCUkbLQzbxewyRD1U4qyEOHf4TmlE9zYsqqOv+
         GUFzFfNWNndZRFvoQXkpV45AdvV6KbSGOByuxYYf24QA5WzbJ2tNjbvT0UfOy5mYB1c4
         VB1Acfes8Ayx2Xcwr8RrRMf/gGj/ADk5OzDg0RdonEyxWrhvPJv7QVzYSq5JwkSHHpmN
         uo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110502; x=1729715302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8L9RcsXGBuOOIJkGyl0uzoPHSEP08/B/TxdDRrdDog=;
        b=ZWOAoDz6Dk13BSvoVx80L9Ai1IpsdPxIx9ueRb/60LLuykzfLJQdE+3XGs3wl0M7sj
         GSQmWZYBOl4p4ZewcZvb5bxa3XS5y6SsChAFkQU6m+OXvxUDjOw3i5EaAfdHN3WwSNkI
         KKSndNqo+pXB6+h61QJM0Wv9qWxNfQAY5FsfCzP4gPmHfNHHnrEw4sHZp+TJ9+Ztntbv
         7On7rf09vhfxnh4H5GtaMEKLzRRTrrySHqbj5blyLE7/9JR7oeuKcihA3iF6bJRP5aXj
         G0hNe7iBdoIsjpFxsI2YIIReLh3UFU/YssrKLIk1XSBZa4W9ukAcGRCYf+9J7cm5NfA8
         veNg==
X-Forwarded-Encrypted: i=1; AJvYcCWnD6iPx6YzdeQGTXNiB7LI5DwgxJXYESVaOx11NTKunr+GXZR6LPJ/u0XMNngzQEvs/fDYzy3v5LmisA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZKNIsnf/zGlCBsV+0jJukP/1N9xCLjlWqqyavhWOIGT/JfVrt
	hP3Sg8goa9+wTNhqsPDnJlMg1IDPIZvgeZE2J8C10PEN2Fd4/+sKyQYLuJHo8os=
X-Google-Smtp-Source: AGHT+IEcrRzQueyWfGvwY23TG0nBCtrzNyg/XChtvSqTPLeH3iuBVoZX2ptDYNex9tUfXpxWrJVkCg==
X-Received: by 2002:a17:90b:2313:b0:2e2:cf5c:8ee3 with SMTP id 98e67ed59e1d1-2e3ab7fe655mr6587578a91.10.1729110502579;
        Wed, 16 Oct 2024 13:28:22 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:22 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 03/10] riscv: Add CSR definitions for pointer masking
Date: Wed, 16 Oct 2024 13:27:44 -0700
Message-ID: <20241016202814.4061541-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_212825_625358_21EEE8B2 
X-CRM114-Status: UNSURE (   9.67  )
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
various CSRs depending on which extensions are implemented. Smmpm adds
the field to mseccfg; Smnpm adds the field to menvcfg; Ssnpm adds the
field to senvcfg. If the H extension is implemented, Ssnpm also defines
henvcfg.PMM and hstatus.HUPMM.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions

Changes in v2:
 - Use the correct name for the hstatus.HUPMM field

 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..fe5d4eb9adea 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -119,6 +119,10 @@
 
 /* HSTATUS flags */
 #ifdef CONFIG_64BIT
+#define HSTATUS_HUPMM		_AC(0x3000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_0	_AC(0x0000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_7	_AC(0x2000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_16	_AC(0x3000000000000, UL)
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
@@ -195,6 +199,10 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
@@ -216,6 +224,12 @@
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
@@ -382,6 +396,8 @@
 #define CSR_MIP			0x344
 #define CSR_PMPCFG0		0x3a0
 #define CSR_PMPADDR0		0x3b0
+#define CSR_MSECCFG		0x747
+#define CSR_MSECCFGH		0x757
 #define CSR_MVENDORID		0xf11
 #define CSR_MARCHID		0xf12
 #define CSR_MIMPID		0xf13
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
