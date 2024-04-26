Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CC5C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO/hA/JkxpX3mapIsl0+IJsv6E6VcXo/j4pzi50X3Hs=; b=pUL3wLmdbKT8Bl
	MLNBDqOAIO8hIg6AUIs1UdCe5wmNJYUjQeY3AqT/c+sJ9f3AQccnJ1DLGBYLoyKLgxgJjfCIU+Kz/
	+MvTZxpULm6E8YrKp9QH2+pQIaMgsGtzX2QzU/agco+4Qx993hdaUYhdkP5N2wldt998IS3ZNad5q
	nE0mpnJBsklzgebagj5xckIXJO34zjLrEzntLOgEXpmCxr2a2oaJNXbT9UjG9qmmScVUFwob0zTnU
	bVl4OADIbA9hJlhxCNzJzQhdXS8mmT2R82+GqZk5bAFFC8IlskkSlcHK888u4A0E/nrnupKWJykWN
	g98QnqxNSdrq7AQRQJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TGy-0000000E6ra-1Prz;
	Fri, 26 Apr 2024 21:38:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TG6-0000000E6DF-1Lu1
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:37:35 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f103b541aeso2331660b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167448; x=1714772248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=DNKlCDn63KTMT86n1qNXIzb1ggqejP/bqyw0mKoFa4ry6wvuWTq7AEvas4z5w6lH4w
         pcU7UOwhmXgAvLzSmoJKW47FUTVWbkinREPlVvLTzqVisvHdx1blCkU9PiTZisCqnqiM
         T1ySdowd9ktrv5tu1BVnAA7+VtNrfzYiUP/GwaZ/9wZHYMbvIU20TxibTs5k9/Xypop6
         0LAs+uiV6AZONnTSkUmPqLbRN/G0dP4OuPY+rAeNwY/QRrljDW4ix4Dof+ip4LQ3EBr5
         OZJRlYdkjGsCYKjyWxJybu0UeSMspokooIlneT68PYKYy2dbCn6pOsaauWzT7ZwHf1yB
         SmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167448; x=1714772248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=pzZQZvb2iFvMd1lqmxj00xGIHfEDFXfyZTwBkRm5VKey5sKKkMshJOBWwgChl35KDb
         +cTiQSfAj3Q+qzdegj8LuNdNIrTy6oMR919fQGhzAo251sdUZuYd+qr9vEf1PkALJydv
         y5xDpGc8C0UzypISVghq5uZfkt1Rx/Y9EuJEmOVjnKsXM5l4yB95GLWB//+TG/qWhf/x
         Q2jRKQtOgwk/QL2BDn0UR8MKdFIqmlZD46i99jL/huvgxXXjLbMu6XZUaZ80eyZPs6PN
         K53ToL5G3jmwJzBsb0//uZ5p9/VHrO1f177Tu0A3AzBn9O8UwaDsUkb2r3W1joxiRoD7
         usiQ==
X-Gm-Message-State: AOJu0YzyXrOVtnqmwyYLcBZd6NAI2PGuMnOMaHc84gOnPPe/l1xXZJxD
	jufzKAhbrnHdwu8M0mWSgqrXavTVGcRuZzzwAoPYHwY1Z+fyHtXrlsbIHRvVJq4=
X-Google-Smtp-Source: AGHT+IHm5zjW+ioSlduj4IUVa22zr9qzjWQiXQZ2Y/v/laULdkXJTWt9qYlN0WXsPxl/15hsWAapOw==
X-Received: by 2002:a05:6a20:b112:b0:1ad:6e6:b494 with SMTP id ed18-20020a056a20b11200b001ad06e6b494mr3747995pzb.54.1714167448210;
        Fri, 26 Apr 2024 14:37:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:09 -0700
Subject: [PATCH v4 14/16] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-14-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
 b=e/cAGXYDWmxX50AQyo8xsB3J/G31Eq8eUDUhpDifz2FCc5Ho3O6JsuFEwtpQxetc2K8CMG6gP
 M9udTAsKA4wAkZkxbNvpvvFbbz4MRw/af9XgaK3F9Xx1+v4uG+N2dmN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_143730_768855_D660B62D 
X-CRM114-Status: UNSURE (   9.06  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
