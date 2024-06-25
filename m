Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2256DC30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srw/SyY0t7xbbUG3TP3wEic1YDcGOTmYqFnqEGC+ng8=; b=PShzNTQWMsFIv+
	OBXwdE712LPk0oy6gp2L66cIW+YIp79NtO78jeL8mukx0FmQtP4KThqskJHADQogpG77uiBESfsZE
	BHPQaWgNh2OzAqphL9u7s9fwzQADLJpCNjp+67xDmtXBUZG1OCxIbdTrOrTM5KBrHnNkG6jmRs5f5
	K8Ux2gWWibSSpHiccPzS9hAsmq5jN62AvCA8xk6jjS3m0kbjSXDkXoRaw2XfO/dIjFBDPUAEfNUhw
	zF5e9ebZ5+orowj+qSgtk6Tjlbm+VMrxHbtPeShy5K1o2l74zhnqb2m1dXAyIvZp7O9FPmgJwdIST
	03gu6TTvIBQ6LvPEIpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ9-00000004V5e-0PK3;
	Tue, 25 Jun 2024 21:09:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ4-00000004V39-0oUj
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fa244db0b2so24671855ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349779; x=1719954579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UOSPToUyaRaOvApUAfkaCWvJhdcwWzca8vHMvSzGJQ=;
        b=a3mAVpotbbb1PzlJMT5D31mjy3tU4ADndm2GvyA7EgC3WYBxE2psGqXzd3aLnsBozG
         96DirKVA3v4QrH1WQLGb2FAVwssI8I2V8o9Gsa07q2WpEpq3rw8FPxKG2/ge0Nrixbd3
         Qiw/LJKUY2dsSCY4AoNkgYtdEehcmZzF0eCLpPa2j13yx2hlxD5HKQD7u0xfCpcovAdM
         srTfRuCYWcOCoImPCZcvwYAYMedoIzWYP5f+P133icnUdEZAKUQRT61Fbw8gkxn/psRZ
         wAWggq5UjaJs4qsSrKznVakEPW+y2q7YtSFePNd1tBJwqSYxgeAVVjs87suhoF/716wK
         JPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349779; x=1719954579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UOSPToUyaRaOvApUAfkaCWvJhdcwWzca8vHMvSzGJQ=;
        b=xNVPipvj6vbvpA+qVunH45mRiYVhmhttVdW7HHGUa/9729Ssjg3t7BCfbns5Iwe4ce
         kTwsyavhiQuQ3S2TVaRzVvH6dphDt5dSmbxdtac0BiolDbMYe+r0p7oUKSMenNxWlyKR
         Ko+YmdBR6ok9iEiB20M2pCUBFAyWZSl8vC/nQfTCJscpOYg4aGKKValpnO1lrAgeyfbz
         tiM1i6uJmT2BocuNgkxmrPgJAdEWSROaLYHIt5RvjzEi2WBuyAlYAPI8P5wh0ir2xcMV
         q7tj12zzU/vQW2Z7+SxmT5atuqu5U4ehu9ZLl4Fc0V5LnYFr2BO7H01Qqajwddc7IVm3
         pBcg==
X-Forwarded-Encrypted: i=1; AJvYcCWdPNpsAzmqtUYI+KRCug+YMaaO9aBSsyU1VZxYmV9bYLxg6pxDFnumu6bOfddMEiBmrqSLVddVTTzpJRkhm4qR6WQiwi4IRfw8uIiv+57e
X-Gm-Message-State: AOJu0Yz7SEmH+pAgxyDjdwjPNtuAravsaAux235/yPmjuSpVT8hLTMIm
	CJFXLkiTA/1HIp1d6wrUnDk1lKkh+VdNxaHBa0WcMKVsFDTbTDn/aSp24QHW8Ck=
X-Google-Smtp-Source: AGHT+IHAyd2tBEC0veEAkEFMqZZW11Z0zZSakCryxlScbkhfTIHyKIo9oYRvo1zUng9rMVK0IoFeJw==
X-Received: by 2002:a17:902:ecc8:b0:1f9:fc92:1b65 with SMTP id d9443c01a7336-1fa158d0cc8mr98348615ad.9.1719349779134;
        Tue, 25 Jun 2024 14:09:39 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:38 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/10] riscv: Add ISA extension parsing for pointer masking
Date: Tue, 25 Jun 2024 14:09:13 -0700
Message-ID: <20240625210933.1620802-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140940_256529_EC1B6837 
X-CRM114-Status: GOOD (  11.53  )
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

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them. Which
of these three extensions provide pointer masking support in the kernel
(SxPM) and in userspace (SUPM) depends on the kernel's privilege mode,
so provide macros to abstract this selection.

Smmpm implies the existence of the mseccfg CSR. As it is the only user
of this CSR so far, there is no need for an Xlinuxmseccfg extension.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Provide macros for the extension affecting the kernel and userspace

 arch/riscv/include/asm/hwcap.h | 7 +++++++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f64d4e98e67c..5291e08fe026 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,9 @@
 #define RISCV_ISA_EXT_ZVE64X		77
 #define RISCV_ISA_EXT_ZVE64F		78
 #define RISCV_ISA_EXT_ZVE64D		79
+#define RISCV_ISA_EXT_SMMPM		80
+#define RISCV_ISA_EXT_SMNPM		81
+#define RISCV_ISA_EXT_SSNPM		82
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -94,8 +97,12 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#define RISCV_ISA_EXT_SxPM		RISCV_ISA_EXT_SMMPM
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d3e3a865b874..b22087244856 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -339,9 +339,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
+	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
