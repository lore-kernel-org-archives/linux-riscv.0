Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BFC5AE59
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZIB4R3h1kNF45A6MxImVnmEqLbNFFlRmvAiTyep/1A=; b=PIhZd+ITO38fih
	onb1Paby07Sg/pj5PxiKy2fn+ugzHUY7qzwJV39K0M5U2LblaFV540TEAemBuZCQLD4REMAERkC5P
	PB/vygkdCWANFDZghFZmljo2jueWlDrm2hCIdnr8VnE6L9bURq3I8WvnpjzFFfYVAWWjYTEWdZU6g
	M40rfwx0a5Ki89hDAndZJGVF1HvFQxCtzJS82KMEVrKb5iDDhSU7ux7YZhr5GLDvTOjKbrODsyBpt
	jsKxIU16goZx9CGYRsTEBSrm8ucUeuONvYIReSOXIw4lSSlTK4noQI9RH0PZbAb/3wmx1v9xOV0cD
	Wca3RwqmDZeC4hQ/PxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDtS-0000000CpTI-3x7r;
	Wed, 28 May 2025 10:20:18 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDla-0000000CoXo-2Xnn
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:12:11 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6faa543d8bcso36526406d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427129; x=1749031929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=A7mAU8hz3R7tUkGZgNv088h87TtvFzzcU7tJPmGB8z3uUHaKeR5HUMYT7IsteF2dAu
         Lf59f32MCSHC5jUCYfu/PM2eCXgQIyZWbm+lVsa7ia647a/w9jTtJXkzsCDhkmXoSg4J
         6JhU8TNRbNqfkWSCs4y3GOxvPlHEw0RiY2dAM5y6NXF+TJQiYDCHqpR9TdCPbknTtwrr
         WKkFhsZiUCrZ3MspcnUJtwkApHpfKqPMtIKamdaTMITnFeZYHAsJR+L09QGg7Av24HrY
         LvyAOi4/cpp5zG0woO7CijlhTvrWzGoloU67lW4kVQqR6kARaC50932zMH9Vy0P4c3Sm
         guRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427129; x=1749031929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=bkJEKxS8UwnAEYbMN2LV3dLUovndp9B2h3t/bpeTwcb7S70WWfVCx97lJYz6XKDeHB
         o0RviW6TPH2FVRO58BhxxMXX8QkxmjQRikDWwIR8qixcDfD/j/wfaHLFebA/lGGgtYYN
         sQFp0IJqdSrMSee+zrHHLCUxsbsgEY8Spq9oPZkBKjUkQr0+PtMJvBEj9vdQ39+8lwX+
         LZ5/3Ira9YsvJd2CIALcls+KBJH4ZKj4c7JH7CteM6UF8Q1QPWwUGpeFpEW4maVpPIzl
         iILHZTXbqvREP4ixKbBW8Ojr3ml6ARG6JnU+koH9kqotiAu7Bg3eiI3mGEepSee9J2i0
         HSCg==
X-Forwarded-Encrypted: i=1; AJvYcCWhsUWiTg4a01FO9wPir2zMPF3pwk2PrtWa3xeXKtmu6cQgTHcoAIs4NaKSBkvb59bhcY+2GcjqtJymRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLB6OyN6j+0LRO00DGh9HuwlFOMkaxNZ7KNvpUE1O/BMiNtlHk
	pbjIqB6LgB6nJIuCiEROI6g8Ymoro6tlgHHrLSy5jxghqyGRhcfsUxn7ilsN/w==
X-Gm-Gg: ASbGncsG84+cLfFWic9GTTSUW9MX98o00AZMFGHYVi6QPCaUQCVsdmLhmabSKfkirJR
	VkEE2+PN4BUpVTImmMI9O16NhfmZzkC2982Wb6YTkpiPNBfnF8qvxtY+jfErBI2FZk9KbaV8Dia
	xzreBMODk8wibySobaotortaZ+WrSwlizO4CXZcp0NiVoLI7ObDRpaj3TUZtUE8cC0J5Ubcpw4l
	9wKy2tUaLAXyJ2EqkrI/htil1bqgtMOJgVWOFj3YaY/o1EHoD4BFtgs48adjv1BrUkb/GqfK98C
	8nTTy0fRm/GZdj6UcXxFtmNTi/iPCCMTvewA7xZ7YdPPHw==
X-Google-Smtp-Source: AGHT+IFtudEecNzRLHvC5Zt8E0tk2TyAeIGxp30jdo8UAfABBjjMtWvXU6go6Qz89iGaprdGhLkqmQ==
X-Received: by 2002:a17:903:2f92:b0:234:d7b2:2aab with SMTP id d9443c01a7336-234d7b22ba9mr17655095ad.14.1748427118714;
        Wed, 28 May 2025 03:11:58 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:11:58 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Wed, 28 May 2025 18:11:36 +0800
Message-ID: <20250528101139.28702-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528101139.28702-1-looong.bin@gmail.com>
References: <20250528101139.28702-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_031210_645835_36AE1471 
X-CRM114-Status: UNSURE (   8.67  )
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

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index bbb6326d47d7..e0e91aa237ec 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -17,7 +17,9 @@ allOf:

 properties:
   compatible:
-    const: sophgo,sg2042-pwm
+    enum:
+      - sophgo,sg2042-pwm
+      - sophgo,sg2044-pwm

   reg:
     maxItems: 1
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
