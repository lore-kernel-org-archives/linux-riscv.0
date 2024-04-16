Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038ABC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0o5zP0Jawr3pT3KH2nYfARHlGCB7a+9SivMq+C8j9I=; b=Cb0goMs1kw1Q+K
	UPLrIwRE7loLXMh4wKTNLy0cQQ82N2sJqC+Y9Ntoc3v31Ih9P0eObED6QYDwQ6e5k8PpsxhAiw4Kf
	vOo+E68CNo5IoyrfRgLZgRbf4jLG/BnYBCQZ6Re8XDB3WiYQh6nouG1mgexVK2fAevLCWq/jHIDjj
	UMOn2YZo2bxO4VH6sbsLH4F97XQOCR8wISKnYjYiRVWmlnUYVuIlTC9r7HR7knzdJi6ZUv0XLsnpp
	y03rCtAPUG89hXF86W8Ym7HGqSBp9y+EXRYWsE/Zg+FUrMmddpUZ4jC8iqSO5UxPs7nYo1/Jje6G5
	xHOe9KZEr5k+6yKxLvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB9-0000000AkWB-3hy8;
	Tue, 16 Apr 2024 04:12:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaAx-0000000AkNS-3kfe
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso2861683b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240726; x=1713845526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjIfhSwfHRsBz5u/Ep3mPORR8rWAcMP+i2i3CrSSnGM=;
        b=3aC3Yw5Ryo8egUWauJsag/ElIv/S/xm4lEZVJn1c5ODVKuQ1/uRLIBIPe8NUuJCyR1
         +b5u/ynYSZQ8AZhAcAPisyKgL6vA9sr8cNbuTMGnqTOXF85AM4EISCj2PROx7REeUkfc
         c2mcUWo5SB4IX219YwMoQQaW3ppVvt6pukdEH/slUgEYQjAFjBZI5/8z9IY3fDhINa9G
         e7jIG5CEW7vAwE2zB+ay6lUKWaE3VvD7aVX50qa6nxAw0UqIR10BWISmqoeN2iT0RYGm
         P26b6nO+Iw2eDsrgrTuuhdtjIn1Sjn06PdPykrmGHSik23a0xnjru8gWJzBThdLHzjci
         EeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240726; x=1713845526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjIfhSwfHRsBz5u/Ep3mPORR8rWAcMP+i2i3CrSSnGM=;
        b=QGR0WPEEaWMvBq2IhJAE7ht9f6cp/mLWqaH8EUfYmc+RplS44yZgoVrxr8QXqtwEr+
         Kgtj/OHBwyw0BAdJ3h6iASspKBrYinv135szSSpVmvOiyxHQm8Ikuh/Kwc/LXCtUo0uL
         rlA8Ke78V6Ldunej5wm6Q1T9D5LSGFv+VWmYTDV07ZBp+fvl/ZYD4jlGRVQ7E8+8NqWa
         hN+RE5izvOjXzjtorMdCjyH1I8CW1LQF/Zb2JcWzr0phdfP9bVVwuB7bKlkVc/R959+w
         B2+/jzl2uCLpm0GQa6B3Px1pxKGgnETx5VvSMycoH8CeVdBY9uefuw0XOgcLUNKpJcUL
         PJJA==
X-Gm-Message-State: AOJu0YzP/va0PpJMeRCyGlVc96dRZK2/2IcjoDmAAaVAQT32MT5Y1zn4
	E/CCu3biTqsaM4KCa2lt5NeTmoPs5zhUlUAoSeB1FXJf05LhUQOuOGzKsNZt8nyxV/clpePkm/0
	Y
X-Google-Smtp-Source: AGHT+IHqn1sXVcftAPsCJ2CrFDVdXhwbs04p0T4oizHCkE9P+rU0lpKddKp7fef8NYT2WVJ7agaZUA==
X-Received: by 2002:a05:6a00:1955:b0:6ed:de6f:d72f with SMTP id s21-20020a056a00195500b006edde6fd72fmr13091989pfk.20.1713240726023;
        Mon, 15 Apr 2024 21:12:06 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:05 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:00 -0700
Subject: [PATCH v2 03/17] dt-bindings: riscv: Add vendorid
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-3-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1073;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=xhhAyhCeh9v1HfzcYB9jMdx24aaf/W++T5TjP1BYwrM=;
 b=9ADEOjEKpNqNT1uwJT37rRw3/i4KOWKzh4dKPxd8bccq49fjrEN1MfFYxs+5aLex6kyTKifm2
 4sY6qIIN0aoD5yumAyImnKAJ7dRaK2lAGGwoME32kwjE2loQhyDKO9j
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211210_259773_56CFAE1B 
X-CRM114-Status: UNSURE (   9.62  )
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

vendorid are required during DT parsing to determine known hardware
capabilities. This parsing happens before the whole system has booted,
so only the boot hart is online and able to report the value of its
vendorid.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..030c7697d3b7 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,11 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vendorid:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Same value as the mvendorid CSR.
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
