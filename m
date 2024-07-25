Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78B1C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sLQszs8uvBMuM7q3YsznaxRjkr+k4U7AGQHcLo4/h0=; b=2RFeClLkOOGidw
	lj3WEHuXaGV6Q2L980zHsufp6/V1uJy2vwRD7l8u4crnPhPkpxeMH4ziMiynHuO1PrZhclSpHzQkz
	TAWdj5KdceEzUEVHLAo2UPqwavHYx0OjPyxfG/6BVfX6tayA1wN7ibhQS6l/DuexUgSIkmgpnXzSW
	5UIFD1v50Exr1Qf4FUt7xGE9xbxPrA7ubkwWEzwe30U+vrt+Pp9iCOCO5y0hfjt7qOjxeN6O2Ei3N
	4o1rtk8o837UADrkr3loMq5OsR5raPY8CVYFvXpsIZjaB9CU5Q0OhCQfJZKy4qF6rZSvZMnAeAaSU
	FNTBkF3pBtZODENeD3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuD-0000000HIJ7-4BNZ;
	Thu, 25 Jul 2024 04:16:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuA-0000000HII6-1Ro0
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc56fd4de1so3681985ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721880997; x=1722485797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=Ip5umt72Tt7xAt1FQkzZjc/6ekqAK9h+OnbvvPoj79l3wXkqlL7enio38+Xk/yG8aq
         jFD7b10KAETcknOwTrs5UFilEElL3M0qJo38PirfSP1Kx1lbccZvE4prAbhFanBSxO+o
         HHEct+dM3/2AQrtbYFmjK92uBfxwe7zsaeFWgg+QarJapB/4yOBxn6MtO184/wwDVcOq
         4hgPwWLcxAu5VPZ7ZFtftDO3guL7CEwflxIYrGt0/d9kusl98qM+niK/9kuC4oRB/HyW
         geoeGhDkJqDjOsy8EEvKXcRLnqQlFiZaBMFRIYWSJzRrevzoxmx2w5CQu2lp00bD0Oj4
         b3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880997; x=1722485797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=OthmMJ4LJdAcOXRNsW8wE7ARDlNW1QmtQK1tI0j5Xo93Y/qyQAZr1tV7odOq3XFeTe
         9ORYSZDCLMOnmfx+NW5l/1m6BvUrRs3vGN0qTAbsTjvLaoubimoDJL8Jw7ggMbaEC/48
         VjUn+Y+KxNd8f7Y+h9op4TNyNio+sp9jRdIgavkJCXJclaKs4Nl4kG6XtyaEUV8b0sXJ
         MrtWR7989vRw12O0S138BiRfcY4rEBdWRIP5XYlZHPLDOcIsKcHoLvaRxduDVjAkBeAZ
         znq3Qc3ytDqRymje76hKCy3vnlM6Wu04sHt8yK7dGsFtgwP69B5Eq77xlMb4fJb21bi9
         RGSA==
X-Gm-Message-State: AOJu0YzcZYczw6Sdp1pT9tINLcOcssVC0BpnM5cbB7XrEvVbaUi4/kNR
	GsUSIz7v0UisAVcaqB1juS1nIz7kESS826iHtsy7dydu9KF2s9WS3EK/k/9+LBY=
X-Google-Smtp-Source: AGHT+IHmvAI6Lep3+L+mKA+XJ6/VVS15lPSV2gXaJChB8H2XYNeKkgK+h5Qmr039zy2zDD7IhrItxA==
X-Received: by 2002:a17:903:2308:b0:1fb:9b91:d7d9 with SMTP id d9443c01a7336-1fed2854b27mr28870745ad.26.1721880997435;
        Wed, 24 Jul 2024 21:16:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:18 -0700
Subject: [PATCH v8 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-1-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=1I8Xg3/phceAD3Z3MPvasZ4C+zAtCdGw1Jhx6djj1GpdJCKExpkFIElu4U3Bar1KmQK6zz0fs
 H3tRahcXl4fAVPHfGejeNs1S+lB2PB2wyAthiWw+z2v42ttNPMIORxN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211638_393654_289C1886 
X-CRM114-Status: UNSURE (   8.11  )
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
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
