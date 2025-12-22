Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A299E674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6QuJwaNPK3/d8hAUarR25ISFK1/GviWD9TjjF/yS+k=; b=Ue3HLEXUE8Pz4X
	xqiASjze8UWJw9FLyzNXqtYTVlvKmJvsxL0n8eDF+ljr+QvBKPiFWlYJ4e7UbzQ7ajo+BRwZEaRVa
	v2uJAMfIMbpip8LseHThXbUzUoLdYl1PVEu85jDE7RbqwG41r2YnR6felrEhSaeCp/VuIuxOGhx04
	qXiYRKOLdPpDil87P0lL8Y/TeDQSZnyFNbcPxdOXdMvfFJzerK96OP4k69140jzgWoGbzLbxt6RMO
	nEzYDf3VTUydmA1/ipbnnRVmcInYD9xXO/IpZdDZkgFc/a0rlGijVFdsznz+psmDE46mEyZpZuOYt
	Dm88YdWZJNGD5lX3WqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdW-0000000DmSa-2aeF;
	Mon, 22 Dec 2025 13:07:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdU-0000000DmRL-1kPb
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:07:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso3332514a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408859; x=1767013659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGQTfjuLcO04tKg5qOE8aVGf71IAU9Gz/ZUJidQ1+vM=;
        b=w9FAWtXHSFGr3ziz1IOOs9CuA9/KishyjsdPwWDd12Wj56anVtNekVFm0yalps9dSe
         /jK4SUORqOpldrKJZiz1H89kE0DdrBx9YePoN2BL5WIAgyZU7qg5cfbxjh0kEf/80qK+
         7m2ywI98AEomWSPcoFoJ7xKeTctCu1oAJJfzCHp3EouJqhuVIsoEHfcNcCRGXv+ISLUD
         sKp1wuXxPQ6gVLz1Cw2cq8+fft4uoZg3hN/jeKXJ3Ht73RH9OQF0vW2/uL/ME1pPjlQE
         ghp5a0hvuR7yDEoIQbQvrY9iQ1iJlNAljjTpipkgAjGVFvNJpeNVmSKBMsuj7trXA4JA
         1naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408859; x=1767013659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGQTfjuLcO04tKg5qOE8aVGf71IAU9Gz/ZUJidQ1+vM=;
        b=rObKeEVpmlC/vYe0qZnzRHZRv8kA0J1jGQBIZvY0vavh4geSCM8X7b7jir7VhzsjwL
         f0itGWmIlGuRLCaSVr/WnHdOxHq1LIalyoCPvf64lqD1nIl6sKwgqr3OUN31oPboNcWK
         H8fHpvDIAUUoYlL8U8xvOHNB44IvO8qEW+KL60ExZ5YGwCI4mfSoqzsPwO8bKvzysR7O
         S/aL7EsTDDJb5ow1n1VK2XN/GsPFzKnU4mPoIsv+NJ4xP0p5I72sk9VEjBXM5UeOSAP+
         9SIBgzyDfTyWbzNEPG4lyQZYadA2Riasq9F/OPS4Rjc+Z70PVM0GjsS1qbT2sydG+SLe
         yz7w==
X-Forwarded-Encrypted: i=1; AJvYcCWFJ5agl87OvcowME71zgD5v9t/IfUPzJb0AkoYybbgwzNUVAX6mOsfxbAzfdU2rvSGuNKfyMXX8D3ELA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Dslvw2cI8mzcu5F073QRcAh0mjnLlCtqPrG0wMI1mElqRY5k
	z0H+6Iu6Z5VvQfe4vVQPPa2bb5FWAk4U+WCSJFfucXzBuED3L6rmInSA9eOZNDxEzlY=
X-Gm-Gg: AY/fxX49P37KCjnVqUgNCwhX4f7ZVfUdUQxt5P0gc2xJfDlKyJDZuxifaDeTNFnuXoe
	CQEGQJoCKFVqBlQdwKB/WCQTk/+XzNuXImrNNC2wdJfiP/Y15ZIhMPLfRrr1OQq3YDv2awkFUha
	OKdcRyYuJjKI7dLVAHMf7pWYcCHqvo+ThjKi/iH0QS5TH4ltTEwGFewBM/x3Hs745UdKvvg80Xt
	8F2A3qwnGcJ4fzx9pV9YKeD62tTF+kw+osat12hUp0BUSFfjlOosv5e8skc8xZNe4XvswcmuQNw
	/2i8ccLrH2wMKAKZII9/YANrHE6UQ/VHdHS2/5D2mXIKyMoYO0nW/K/l2+vQXlBDSMAt2eXXEbf
	wynxku90nM6NC6TNwVOqAp6eEg7azdIQ8EMpxt+5hFvD+5gDBHhwVHy1FUDyG5vzAG5TWPHvA6E
	A0sYqC3mSzSSV04MzvaeeRBiimkKq3pLw=
X-Google-Smtp-Source: AGHT+IH9e82inTfTfBy9JIkcZ+jC/BVvaACK9Mh7FCCtZMLW3mXb8WEQ8z1KSPITq0+87R6HI/oygg==
X-Received: by 2002:a17:90b:1dc6:b0:343:b610:901c with SMTP id 98e67ed59e1d1-34e921bb683mr10198388a91.26.1766408859410;
        Mon, 22 Dec 2025 05:07:39 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:17 +0800
Subject: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050740_550499_2B9007C1 
X-CRM114-Status: UNSURE (   8.28  )
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

Add description of the single-letter "B" extennsion for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, "the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Hence add a schema check rule to enforce that B implies Zba, Zbb and Zbs.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 565cb2cbb49b552959392810a9b731b43346a594..385e1deb23996d294e7662693f1257f910a6e129 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -109,6 +109,13 @@ properties:
             The standard C extension for compressed instructions, as ratified in
             the 20191213 version of the unprivileged ISA specification.
 
+        - const: b
+          description:
+            The standard B extension for bit manipulation instructions, as
+            ratified in the 20240411 version of the unprivileged ISA
+            specification. The B standard extension comprises instructions
+            provided by the Zba, Zbb, and Zbs extensions.
+
         - const: v
           description:
             The standard V extension for vector operations, as ratified
@@ -735,6 +742,18 @@ properties:
         then:
           contains:
             const: f
+      # b comprises the following extensions
+      - if:
+          contains:
+            const: b
+        then:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
