Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F8C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzex8MTeNej+Xf932wHKboV2iqZ77NKVondmPbaR3M=; b=TPQrRTc8tUiAJ3
	OgreMsgc+ayU7KgBodjbsnvg+/Cn1QogpMvi5KvA6SrqcEDEzLBcp2qzoV9phTy8nC0OWKkQb4pZl
	y79hmTxDJSjYha43GISfthhRS5QDoPJOHqkOJ7cAGZrweZVIYhyMie2+WSyZaukiyGmcUdpfqhrBd
	3cVT3FBxM6DTqIRH0r8Zv3J+t597pp44O0yNJMUbHD1bnJO/xmo5CXqhCGTw+NtoSQjcnGcdPkmj3
	B4JIEyTDUv3YWft/2mqzLEvaw1LB/FKSnUq7Ot4ckW+nFclmIQf9SMylIKr6p0idcvEgQ2AETerBn
	9iExaOUTTL9pvEyUbC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryMl3-00000009es5-2ygO;
	Sun, 21 Apr 2024 02:16:45 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdl-00000009Vyv-0nkS
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:05:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2540474a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661507; x=1714266307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=vSKoTheNCiz/2Bm8q0mlvS44OMy3+dTEO7sQWdK+snGKVuWwIbVRfwarGrHN826yIt
         U92SzuKMA1Bh+wFT5MfyO4RxEKWo/d27kGWv8jSayGC5XxF0HsT9DHOSQK+5B0fg5dyy
         ALBwO8WO0a/pjAAw82o2XyA74PeRUXYvPJgD95hUTglcUUWyGT3AneN5F/ksRx04egJi
         fwI1RSePG24Gm14Ft5dam5Ml5Fy6agMhfi8E+5GSXHBFE1MVzWllCtqln4bXNaL35L86
         noBEcLTKH6rChSlNewT1riL+dO68x31YOZeQ1j0YmjF6FocJMxYGYGml3tJe4Dzg7zad
         XgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661507; x=1714266307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=XIWDv7EZOLSQytslJhjo2lLv5QPUBOHwDXvbwXsL+TGfdtKinJNsRHxyxmzaf/5Hsi
         BeaZ19rvBsl+3Ib39SBDCoHgVcEjGZStybU9hRULbO8yaMlMOre7WKw4cdU+0f3GzyRe
         CpSinRvB4zpHs9ICW9AfysuAtk1mhK2/HQRd2sCxlZoFhWwpPDFkEe0bMDaRizNp2gv5
         cqrpxCiNeFUkLNqRUkzmXcpwXg5CGII/mAmpEYI33/DNIIMNU5/Y8FSxplztwLZJfb4m
         a9wzC9OJk0q7CBDAIR7M58wqYeHWvzMBwzEo4/tOd2zwXt5KsqOVKSpWTw2Iu2l80n9G
         AeJQ==
X-Gm-Message-State: AOJu0YzsiDtUH+xlaVj+10OGlwVJ2AZZ07XwuYRo7t6ymupgIsU9YkgV
	rdoDZrLGchkeR23HXUVmisVdzBNOAvA4TM3KqW7XtQwkz3KRCm8FJFwZwiTuAKQ=
X-Google-Smtp-Source: AGHT+IHHK0CmFEjUYa4B6mPQ0N1eaa44TysOKXGCa/Ivklg6CG4klOmrEKVYQ7lcoTnquYAd4o9XZg==
X-Received: by 2002:a05:6a00:3d05:b0:6e6:9552:cf33 with SMTP id lo5-20020a056a003d0500b006e69552cf33mr7165613pfb.31.1713661507603;
        Sat, 20 Apr 2024 18:05:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:43 -0700
Subject: [PATCH v3 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-11-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=EaRHq+U6nQY6UMNHfwQt7VXjyHg2fLwFPXP1BAl3sVEmRMdMMwXIiKvRomtQPJzmqtJqOUvg2
 jdINbQQjXWJAPYzqwG9jFhZUzK57PzwK7Icxv/QOIMHdsf9Ai2sSDqo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180509_539452_B0DA93B1 
X-CRM114-Status: UNSURE (   8.40  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
