Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PNMOPWTy4AWFN/mqcYRcFWdrTdEPvT7II7dmbRFYjE=; b=GfOK3B01xzF7oR
	//slWZkp6ubGu1huIJhKr7roPA5aM3cTf21bToR+EgNYiTq2RPRbFIoKkrTHwROstzuwIQ0a1KrJe
	YGo42xm/e6HNAL9uk5nlCB3dSh8L1e0E4tty2yqmBW3jsLdGV72RjYqldwGfMRXWNjlXj2v/sMY1u
	hx6TkhafqF5JDJ7au3q6hRTPRJrWRQWRofMOXoBZzaigGHDm3WMuvNtyB+Ka+kCQtbJ3NNMfQaloD
	WLwqs9JpckC6QhnkKtu4afbXkderQuLUQXalev8qkwoMvorfNyqPJrqn63DzKBwPkrTvBDqV9WpZ4
	HT/LrTrcl1W5vlsivOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8HR-0000000FB9U-0jeV;
	Fri, 12 Apr 2024 04:12:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GR-0000000FAFl-1xk1
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so342633b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895106; x=1713499906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9+s4vuTW4O09tkDCg8dmEEEUenyonlJ0q5BZhMXfDU=;
        b=H+yzmchkQXzwjtU+UmOnilJhhMK6pZ1XW97voUaf7CS1XjuduuWRt7tQsN4CuqE1Vu
         8ocGI5AFJEu4m4wX3CzuOEe5DbVknbeNNJYz3xOn7/KcDbNqJw5AOoUsyEypbGGYUWv0
         tSaEUpzqRHhRyPMs03tfU/TSz1ryTli5PCHKFTfvL1YcKsRuYEpSgo0IRVV1krCnEn7h
         FgpJ9qc26kxpndcvQLJd/E4/hr03KQFMZvW234VH1wRWVtKpKbcXqaVCjNxIr0xld2/W
         SalKNSc0RQhqjVScrcMjh+HV+cxAIodMTPKnJ0rGl1EC8y4TrTgQzUtstqyohPwHLcHe
         NhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895106; x=1713499906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9+s4vuTW4O09tkDCg8dmEEEUenyonlJ0q5BZhMXfDU=;
        b=IsghrwQQF+WKQakuNWnjef6xLy2jYN036MJZYwVF7nf+xWVuGxIZ7Gmowq+P2Z05gu
         YJJOFZOqJDmbkD15fxefjzD5eWh+YdIGDuxujKsOFHzUtDuXOLMey3pgCNjQLzXmplbq
         6FiQF6YhklaUDUBXnQrBfvfhaKGRSXrZoQgS06JyHTeg9w/UoYF1ljUrvU9uUMayDDWy
         n0DWjAaLjFApgb5JdUpjXrOlnWzm3p7Vfq7KXJM1bnF0ZCkX20DzHnq5gaERoj+xHyym
         488NaWFV1WeXXu2xuFFAjts9v9vvL7pI4sFpwb6Zz7n2rEjYWtrTrDXMgY5H+xCTpVOV
         FQBw==
X-Gm-Message-State: AOJu0YwkAeYtXOK96e+emeBDumf3PFFT9KIzX+5vCE9t7ZFi2ypKz60h
	YXjPDxfzgX5NRcPry6J8Gsp+Ez96L+x3tCfhMgsQKY31BroBxszvFbOu91SZGpk=
X-Google-Smtp-Source: AGHT+IFLbxw4GiSg/ByrR6Zcx1dkr/NaC0J9B/mADVNgKiwb6LsbkIMIsxPTTQPOOHXCd5XYh+1AKg==
X-Received: by 2002:a05:6a20:970e:b0:1a3:6f13:b11b with SMTP id hr14-20020a056a20970e00b001a36f13b11bmr1803234pzc.4.1712895105976;
        Thu, 11 Apr 2024 21:11:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:13 -0700
Subject: [PATCH 07/19] riscv: Optimize riscv_cpu_isa_extension_(un)likely()
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-7-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=4166;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I4DbgrMsTBCO63AVmMsC/HIGAx6P8ZOknXvrmCDZIY4=;
 b=EvPgOFFZdWvIqnY4Ic2o35NkUj0RQYLXh0IE5My7noLrOP062aeYS8S08JVkR8nyIb5gwvMy4
 gV06VoydcEAA98GwhTPINJxjuG2LNDmVI+M9j4labOihPcqFd7KizaX
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211147_651785_A1203B20 
X-CRM114-Status: GOOD (  12.93  )
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

When alternatives are disabled, riscv_cpu_isa_extension_(un)likely()
checks if the current cpu supports the selected extension if not all
cpus support the extension. It is sufficient to only check if the
current cpu supports the extension.

The alternatives code to handle if all cpus support an extension is
factored out into a new function to support this.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 84 +++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index b5f4eedcfa86..db2ab037843a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -90,22 +90,13 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
 static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
+__riscv_has_extension_likely_alternatives(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+	:
+	: [ext] "i" (ext)
+	:
+	: l_no);
 
 	return true;
 l_no:
@@ -113,42 +104,63 @@ riscv_has_extension_likely(const unsigned long ext)
 }
 
 static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
+__riscv_has_extension_unlikely_alternatives(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+	:
+	: [ext] "i" (ext)
+	:
+	: l_yes);
 
 	return false;
 l_yes:
 	return true;
 }
 
+static __always_inline bool
+riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(ext);
+	else
+		return __riscv_isa_extension_available(NULL, ext);
+}
+
+static __always_inline bool
+riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(ext);
+	else
+		return __riscv_isa_extension_available(NULL, ext);
+}
+
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
-		return true;
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && __riscv_has_extension_likely_alternatives(ext))
+		return true;
+	else
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
 static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
-		return true;
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && __riscv_has_extension_unlikely_alternatives(ext))
+		return true;
+	else
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
 #endif

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
