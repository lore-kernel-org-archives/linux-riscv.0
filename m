Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2558BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxdIgPjBntlo4CYEoQffLOspI+/6WUGiepBeKPWdsfI=; b=DBcGw9qk8HgOo4
	qa2yxsrZBhxg74jXMx9mgDl098pw/u5rnmP/D+FolApzLptZRsg8lfwQLMlnTJAS5ArroADCKv5IM
	ioD7RrOQCJ8BLWUgaFVevDqsDaEXpYzr9RQUZsn6gHRrkN6ObIcVbQaq0676pBtFrbHWx2ndAUa8D
	Nh56TBUI0pdsEALNlv85ZlLloS+XzjVPgZGlDoqUwPAIX9hSUX6cLTbeF80x8kp0epHa8pK4KhYNJ
	11z6QMzH2p9CkqjeRddRzBw28pScQOgrrYTHj88d0NZ2nYN/d9rmWa+2K7bLwg9oN9blu4BOoIVRk
	Q+iUSBkRUHCf9iP8GhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kox-0000000F1Rj-3q6f;
	Fri, 03 May 2024 04:46:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kor-0000000F1N3-2hXD
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:46:51 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so69135b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711608; x=1715316408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=FNgROYdvUa9flO9z1dt6uPDr6sIvHNV1/mpzZPXV+Hlo9jY+kNv9VlrvRS3CWmm7Rb
         6DcPFrYEk8+7XoKLZcy8AYiUIki6CUF9uIgerZxBqBqcJcfnURoA+4o5Bgejy5CCeuBq
         +yBAzIxVLrPSBIULR7F00RO1v2EnT5HadVXCRufGpV96hkFc3wo46MXZQftB5kuz+GNY
         +UwHlIyiAxNcHsK+RRXBDfEFmxkWtsjKaH4mSXDBxKJ90dyThRH5TadKKj9St7izeRAC
         GrSP3tA3FEhzOC1QkGJsUkO2lGGw2grWP5L9V/Xkl0nqUq6R3NG3y7EZAdindTDZTxhr
         uMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711608; x=1715316408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=pW5gemaEs7SmsBd8zhu+1lyoO6ra2wxoj7bHEtt4RcdkbQ2lys5qZMfjlBOcY9lTHH
         jR6RdFX4bFpJ4ExqbVM+jsRi+FVhienRfZcZYCUCKOKD3g+5h9TjjSMazmJVhaBIrs58
         eCNB3eculE7NyTtly/nIgnQoHx5eEgesWM/nMrkV6fggKTFkFKF5HGK5rW/6sX0Be5kW
         UKf/FYvHoNqCdWM/cTGQIQnh5dMsxbhYBCoUkpzcyxbEdO21q5AO/pVscyoVBZXt5KSd
         3c/P8Y68clRyuxUXVjm4f9KlCTEa04uvleBP/WUp6zsd44aBdvfoAoOG/xHFIXL4OXIt
         z51A==
X-Gm-Message-State: AOJu0YwrRsOyFz7n0sFJQpCsYDDlKkFs4QtMIVQnE67a9FaJl2+3AxgU
	Cua+MQ41C5sOVztmiadt/SSFkqFzPwJiQFbEkJDyC3S/28B4v5qLLWS7rl+UHpc=
X-Google-Smtp-Source: AGHT+IEMZ/Mstt6sFFiU0ca6U5szKwLcpC4LSoNcLngJPhJ25wEr0ZAm7TjLPos9QHN+8ULUaJiCHQ==
X-Received: by 2002:a05:6a20:8413:b0:1a7:8a02:3058 with SMTP id c19-20020a056a20841300b001a78a023058mr2053596pzd.12.1714711608331;
        Thu, 02 May 2024 21:46:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:37 -0700
Subject: [PATCH v5 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-2-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=oHDMK2MPe/lkNi4I1weAEI6zuYQ8edaqMwBunYR8EtuZeYbb3YWhKVd0K0WCUGyV8ctpL28Y/
 fK0GFGbIuFsBkiUjtXJZg2jRDSbNRJt95AMJxOSvhqumeibiNGmllJn
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_214649_727969_74BFA33C 
X-CRM114-Status: GOOD (  10.44  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..edcb6a7d9319 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required in
+      systems where the vector register length is not identical on all harts.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
