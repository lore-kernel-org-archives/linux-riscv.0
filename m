Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEB8CD11DE
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JBNM2jeVYpBmVTHvObKFE0tI+dJ0x/+Pqp0LUQ8NTA=; b=X7AaLNkPHI9zI7
	hb5AITtrY2PUYuCdrmBcLXVzG6k9dBg1xM/t56su6Vc0FM9DO6c98b6MlclixAuh0iF/ElwaRSbB+
	9fY7n2ZS2ZSj94cFelm7bibRAzsr5cZwJMcDzV8wPLB44tawyfjHo0W2oRdGx5tm8GE+urhRNp1vp
	Qq5P7S9ZURG7L4jAAuElUZbgoyZqT13ESdiWxFE28Hk6UDnAb4Pg4Gfm3/tYhmQmCNDfE7KTL8PaJ
	f7hEsHrS+K3pzS1EML4Q5SeZK5E4QBr4cVqIid2g4ZblJUkZyEJFewGvv6WmNFRM2E5iePOigNXkI
	xtRY8wbO90J0n9WPuv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUe-0000000EMn4-24uE;
	Tue, 19 Mar 2024 21:59:36 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUV-0000000EMec-3wIy
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:30 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so4648796a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885559; x=1711490359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egqW9CgCHR/h+XnNBIYYSLcc7kf3PBZY4lOdjowA6vA=;
        b=nNhhOCp8AjFlipBmaXhF+li3kSfQ4kj5fMpOiYck8EYRuliO1u6XpqDRgj3cHi/Kj+
         Y/yUocCRPYgUH6yQbBWtIgzIoRvNy4kfyL9ZC4w+tIkZ9L1cjC7nGrh9SbjC5fysB3Ax
         0GL2jheRa2J/N2/hYlmqabTn5hTSbgYNHkwbGTT3LsZpjdqEyBgBQOEVP9/9rcOtZ2b8
         wDRzq5A78mh/tyOXduH42SOb2ZVwLoYMIQPeedMsLaxnS1qTumfw/Gc0gg0pJz1oJYl+
         ExMKVRoUfBTUTQN+QOD4qL4yErxu8uRi3/lnzRk7gv2SJ4c5ys5qet+8HhijGKbE1DJF
         TbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885559; x=1711490359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egqW9CgCHR/h+XnNBIYYSLcc7kf3PBZY4lOdjowA6vA=;
        b=T2m/U5DV3Z4l6mHgsuf07EJYkKxhHNqLisX3+2ODDRHMKR+m10AOOYuwOv/YFBNBUT
         OrS00XZBS9HMgpNN5ddR7c9+4UodPxXVi1AIuUeGbsVu/wb/nrCqfsO3pYEe9ptzmXY3
         JOUtWtEMIaEGBMBbJqM+Zz/YDU0r6Qfimnk3uDysO9mbKZ5Q1pzKXxFQtuqv84RzjBne
         eONfMA7ubs1bO6Tdg9KI3YEb92auioZ2Gqp56dWhuAhoqVFlfhjkCKzc2PbW6WMPndEz
         FhbxQ/+mlQepAyk/BBSGDVp54X1Hp2OIFSwgdmF+tohRTf9nsbzUJoabNZ45C8AIuAlQ
         aVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyGMl7p5Y0XIjVB++0qEKdfkvhUovDfhSnjZfNcIQxnPEggOgSjkQfVdTMxjXmpFasB7oQomimEo/q2DmrMkN/M2JS1ucD7+PkK+mqSHgY
X-Gm-Message-State: AOJu0YzOzVV3ELOIftLkwGZWMbyArE0ZCDfBUmllcP2pbwazqiJAGuKX
	UDz+sNBj3g6rYl8UFT4AELS4nIe5JAHeLNx10vZzWOYuPHMyJR/IgAk1UVvLuPM=
X-Google-Smtp-Source: AGHT+IHiAdEaZGvoCjNSk/dkwDMZl0Qwbws/pc2s32fXcllKuOrTTy4J+408sRjDB0ufVB39xHFOUg==
X-Received: by 2002:a05:6a20:9f8f:b0:1a3:60cb:8172 with SMTP id mm15-20020a056a209f8f00b001a360cb8172mr9089470pzb.39.1710885559375;
        Tue, 19 Mar 2024 14:59:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:19 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [RFC PATCH 2/9] riscv: Add ISA extension parsing for pointer masking
Date: Tue, 19 Mar 2024 14:58:28 -0700
Message-ID: <20240319215915.832127-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145928_181590_6E39773A 
X-CRM114-Status: GOOD (  10.88  )
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
Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them.

Smmpm implies the existence of the mseccfg CSR. As it is the only user
of this CSR so far, there is no need for an Xlinuxmseccfg extension.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1f2d2599c655..1a21dfc47f08 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,9 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SMMPM		74
+#define RISCV_ISA_EXT_SMNPM		75
+#define RISCV_ISA_EXT_SSNPM		76
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -88,8 +91,10 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#define RISCV_ISA_EXT_SxNPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxNPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 79a5a35fab96..d1846aab1f78 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -311,9 +311,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
