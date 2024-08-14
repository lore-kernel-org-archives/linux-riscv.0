Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102DAC52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7znHdyy+0iBoPq6xgwyeYasGmVBRfqQ5JQ1DYkrB78=; b=uvW1mLTiXN7B+Y
	YqJ3HgYwxOi4mMO263zfkbY4mz80nsqOJBJkfvQ7okeFgwiSPrYan2wPfFGquiGhtD12CCqOw9pWR
	X/YgtZWtBrnoyAG+2ncK+mvz597JOL6uAfq93Fe1ineAm6P4d1JxoWwreCqAr9Vo2hzHWzwDEN3bC
	u0j4NzULC4vSJQMTqMOngHRtCrdGTVjGCqigptYwRHweaa4t5hKx29jTqH5y/JJ93WLGBhYmCYyAs
	l6s9TgSCo9FD1Aj/Lp9Z4sxYtit+koF4d6eeM/9epAU7NgklB0WXh+qqf16vnGUB9gEXjLsN4xSDU
	VPuAHYO8kb9F30lOSGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99c-00000006CbG-0AyW;
	Wed, 14 Aug 2024 08:14:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99X-00000006CZI-1mJj
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fec34f94abso55171675ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623283; x=1724228083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEQw5iaWeTmNPlPoMjn14hYPwuqLggUjPikbJBTJ9LE=;
        b=hjab4MyYJp/H8znJBA9gFdLIOJ1H4FHkG2cJf7WrBy0P3zwoNaB/Znowi/4PH13ITv
         Uit9fZkEUga95Cfq/yBDfZM26Bp2GTAsi005nMwZpqAznmva7lU8XzNesA2pxl9bexfF
         pHuPj/6lGFfUOLVm3Q3FzgYpTXCczCOaqk27phqUW+/6eV9MCVWAh4PlaCJTjuZuRXoz
         xOTxcZHkDoA5HQEwKm8O3DdmPDo3F/s9PRLPC3BOnbLaL2jBzjmFAQxI5sGtJMLeSAmJ
         KCUIV9aIAa2T5u4KTfdXtgE+iMT1tnwsDmuXd77kUydSZCrLdDCGUz6z60/DnCutXCJT
         LFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623283; x=1724228083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEQw5iaWeTmNPlPoMjn14hYPwuqLggUjPikbJBTJ9LE=;
        b=juuSkYJB6ti+KAXLcqBlla62U1d0N6ASpFqQ0VnPMUrq2Jkc1BjqbWptXqw02LQ1mu
         YUPyTl6Rz3wKziFXR/tCrv5/TtI1X1RC90esKHPQflfWuVg+wNC99HmAOM1vvCWjVAFT
         sEczOCT9GoADsnQHcYOHMRP18g8SD89tJvNZ9TBqvw8pPuQPIRD2HBCaRoSanHpnFt1j
         CEz6gMgQWV9PuaSyV+mn+CJdHl3d3vKC1/BjYkBFs0yLvgeCtBMQhxsmq2OICVfJdJTG
         WIKj1vqXPjddzYwrlJuBB1H68fT5TLNQzAGsZ3diP+9u6wzACxuvOXBcMGVgcD1uUhrc
         ZpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3vMW/WS7dUR/SpHSbb/0dBMK6rV7QwuSDwIJIdEn/Ks222BwSWRYW7JVEYClD9LkGoDfhagTCcmmKMg3Aamr+J3IjHgC2O1M2J+lc1YRD
X-Gm-Message-State: AOJu0Ywo0R2iy5e4SGj1ktLtHK7Xt+6t56nO/Ch0t5PIhKUFAucxra27
	Bg4SGn/XO3SnwhTZ0LUgp8qu/GiEu+c61wwtsoSIw0/FNDqLEKI9mbyR1sveMF8=
X-Google-Smtp-Source: AGHT+IEcmQD/T7vtGlaVu0Q1HEccmE5Hnh2PFCTQZYTL5V2cFC70GH7Xpcj3f6WIrZqy6t2xP38Q5w==
X-Received: by 2002:a17:902:c402:b0:201:e49e:aae9 with SMTP id d9443c01a7336-201e49eda06mr363875ad.44.1723623282655;
        Wed, 14 Aug 2024 01:14:42 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:42 -0700 (PDT)
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
Subject: [PATCH v3 02/10] riscv: Add ISA extension parsing for pointer masking
Date: Wed, 14 Aug 2024 01:13:29 -0700
Message-ID: <20240814081437.956855-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011443_486923_104FA532 
X-CRM114-Status: GOOD (  12.37  )
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
Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them. The
specific extension which provides pointer masking support to userspace
(Supm) depends on the kernel's privilege mode, so provide a macro to
abstract this selection.

Smmpm implies the existence of the mseccfg CSR. As it is the only user
of this CSR so far, there is no need for an Xlinuxmseccfg extension.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Rebase on riscv/for-next (ISA extension list conflicts)
 - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere

Changes in v2:
 - Provide macros for the extension affecting the kernel and userspace

 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5a0bd27fd11a..aff21c6fc9b6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -92,6 +92,9 @@
 #define RISCV_ISA_EXT_ZCF		83
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
+#define RISCV_ISA_EXT_SMMPM		86
+#define RISCV_ISA_EXT_SMNPM		87
+#define RISCV_ISA_EXT_SSNPM		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -100,8 +103,10 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3b9735cb19a..ba3dc16e14dc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -377,9 +377,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
