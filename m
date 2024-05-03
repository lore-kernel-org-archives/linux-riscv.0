Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED94C41513
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=T62g3NtAi+dW4t
	65grmVlGS3xBEEsXeDZwsxULih9Ycz0LYzBFlyR2NCGgsZ6bTSdELIEsfnFUXcdaI0WhNToGlZh6n
	ZFlJVUDT5dGxdXshz4LD5v466u/KauLtxxW63avH95ztK6//l3P2T6j9l340d4RlXGNVn6eoDmEWB
	D0GnwHhUprSyyxBHEa/DgtuujeyEjJtrEy/Ak/8yOIAUMQaVJLM7c0rWAVFcpN6VCIqZxNjSupesN
	dsAV6zFYJI24/OaoKLTDfSkpjrDCHLCnHYy+mLASMjK+7Zr1bcvz5PgD3WV4j45cwvGeVr0Z4zciG
	2n7mKoMQSpwieUy8Z5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kow-0000000F1Qm-3haJ;
	Fri, 03 May 2024 04:46:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kop-0000000F1Lv-25ry
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:46:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ecddf96313so15159265ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711606; x=1715316406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=kgG/nAaaX8Ivsh+Sx41k+BNHS6jMZcbCNxN2b4jDcBNlIJEoAuKWiPwswkFqrwyqmR
         OeVNEPJVGa3lr7Eml2W/waa6vp2zd3kCzwx2TcpiuferOUKTyrrfuu7guKijVmeo2nT+
         Lb/EXkmb7QiXsbz4LupvdoGzzETQYVB7a9QQOq79TY6oclGnNOo41K/u9PgdMxifw0q6
         ZRY9FsRuJFCUbZXDN3QMkl0akI7Z/uwkkQUfNncLYaEENWJhYcr5TSpg1eO5qWuYCrcX
         3u7yj5TeT7JJNZn3eM5Y+MzlQo9o8++DwXYxC2T04bo+D5kZJDaSrN2nDajQQvTVOp5m
         624A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711606; x=1715316406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=jWjGgiV7cRyASvF9fR5bB8n4Y0j3gOKDMiURVtgDAq22C0DLP6w/Goy1q+jxsrxSg3
         Wkr5zr79DsQHHqtkSLdjuO5UjhByKCvzTQO0/2lso2ECy9dEDk8KdV1GVhNyht3fpfOh
         GsHh5pnLH3eg2Nrz9wSKQdwaHljEdxhC2uSSDv/XrmjkCaCS2GG8TIl1GkAjosRxu7ox
         Qd77rqceUDFMHqpHVpHVOVDnQ/m8dT75O+Dv66ZYWNsShmEDwhlLfHoJ/w0fwpKrV6Ku
         mSraFc0pFsGNa8wXb7ZFsVWCYykkv1fAXDl0LTTa/cnOMXjpkUBc58hhQF5b0sXwzY2t
         HKRg==
X-Gm-Message-State: AOJu0YyxfWpd8i3MNPO5lMxOMcvx/bCQu8SEl+CmhVeZ/ttiwAX1e/RX
	o9uxJQ2C3E6abgNrF314w/w9EhmbdnWLbPI0Evovl4fICujj6riQVHWlcK3rAHk=
X-Google-Smtp-Source: AGHT+IGj1ONAgc+kZn8Vit+kAEhx9nnFFqmH8jc56LAHeK2W7eeNxdNjrfMVxDLPsmj2wTx3n9FXFw==
X-Received: by 2002:a17:902:ccc7:b0:1eb:fc2:1eed with SMTP id z7-20020a170902ccc700b001eb0fc21eedmr1841442ple.41.1714711606253;
        Thu, 02 May 2024 21:46:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:36 -0700
Subject: [PATCH v5 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-1-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=oyLK0Y3PHVDiXz4KLcIk3Zze14XD3Dj8FvvOLsEWb4mhVtA7Gk0Zj1s8367QGoX9DEP1j/2yN
 hDvPvqHGDMfCgkikiIADs4vpG9jXpfT5XFPyort30d88L/FSaRukOAJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_214647_763724_93F22508 
X-CRM114-Status: UNSURE (   7.76  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
