Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B5C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW/2u/vi1HGBOQe8Z35G7x3WJyEKzkppAZLXJ1jN9t8=; b=eG8kXKtzOaFA7S
	JOXJrZM+BBIWVQGF9Vc3m6R2XAIEV6JcFXeuw1xlsAKnT7RU1HdF+Z5PPOHxH3Y1xdj3rgEZIRte2
	UdEdTZd4+IvBrkoi/sNahS+qgh626X1lix3A8e1YDOYvelrrpgws4ByzrwI1hp4G6VT7C22s3YwkF
	IhcKNPtds9jFxyhraCTbijoQYU2GZc951iKnvHgElPPKbXf2ImwtsmnQrX+r2qTt2TKHgB/EaaT+k
	yaeDLYz37JbpK8MRKPKWGmMsreXAOJXckLdaM8RK4WO4KKH15jaGwjj8grG4nsUBNfjRx8scnfU2D
	i8sajDEY/hdQ3qyroEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZF1-0000000629m-3wv8;
	Tue, 02 Jul 2024 08:51:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZEz-00000006292-1ghH
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 08:51:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso27455075e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719910316; x=1720515116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WccEx9NvT13PoluUayFyEXUnGwkOt/S9EsiCAQXUb8Q=;
        b=FqiEH8+VG9hQNEPIWqg9L//5WKofqNlSDfO2J4g4LNaZj32xGA1+Tiud7aoL3Ic4oW
         t+w7MhFz+SsF1NZlQB4sCKSE6B58nwVOF5eMz8L2oalVubdgyEMIc6FuBptGgm1m7GHx
         93i+Gj6PAAG+zQgJcufUWyLwi63pCEcd6dh9U63Cc2zPLLSzSioOhXqGLRKJE5TGHrCp
         pU9yf2AIOhAnnBj9Ndn5COAezW6siTw1b1ETS/I8bG+NnakezQR2cGOwACAfKqEclcRy
         hr/Mihhp5YgFaYN1DfkGbscbfhVM9NpMYOmZPOy4/ORslwbcBYkSmpyzRsKJkOCF8PrP
         k4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910316; x=1720515116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WccEx9NvT13PoluUayFyEXUnGwkOt/S9EsiCAQXUb8Q=;
        b=KpwNafGQbvnP52Z6Uw7K/N5dv8uExlRbeoWl25CGKlSGsxPQvOacFqiaLzJIpMzDT/
         8m52TDLhBB8xJaBN+Vp1lO0CI/ZFVyOUicA/ftAhRUmi+c8ar2q5bCuKaprKO0h57n+y
         tEEM5lrmj8K4Vlt6J0Zr5Uhds1n1fMUjdoXJA6Rh0RPX5AQR4ctniPW+euhfFN5+GDTm
         TQetEOLfRiyLAmSnSIRzOj/8u4Kd6gXL/hu50mpsxLJ98WD8OqHl35KqrSBsoigqKv3F
         nVX0w82LX/lkOTz/JPqwk9icmRpggiHmYzy0Eg4zzaC8KZaxJLU+h3KpUrDF3ANIJk/F
         Iidg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ONnhpgtFNPlbce8Hz5PzCwSaO/IUKMMwMCmwfZ4piwUcUIXy0cut7naquoRz2mP6ginaF74qpAajR7nGtPIQCUSXP0ZYcBG+jKamVQqY
X-Gm-Message-State: AOJu0Yzixchu3xaOwv7zg6Tp473g0PG3VdaSHFiCBtrZdiF8uYwFVy5X
	09lwWQyJFCSkiM+vfJjsmNITx7Wq9NsYXR+3+bnkUUtIy0A0XIN9x9aWb94ePl8=
X-Google-Smtp-Source: AGHT+IGZdzo6PfO/YolAKKEnDj53HZfW2Z0PUTp4sefGD+K9Hrlj3OMHAw8JbSHy8BPMS8+pXPqrkQ==
X-Received: by 2002:a05:600c:19cb:b0:425:6f96:8bcd with SMTP id 5b1f17b1804b1-42579fd0d25mr65418135e9.0.1719910315708;
        Tue, 02 Jul 2024 01:51:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e16b3sm12491191f8f.61.2024.07.02.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:51:55 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 1/4] riscv: Add ISA extension parsing for Svvptc
Date: Tue,  2 Jul 2024 10:50:31 +0200
Message-Id: <20240702085034.48395-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240702085034.48395-1-alexghiti@rivosinc.com>
References: <20240702085034.48395-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_015157_461089_FCB859FE 
X-CRM114-Status: GOOD (  10.09  )
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

Add support to parse the Svvptc string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..6dd0dd8beb30 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_SVVPTC		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..60780d246743 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
