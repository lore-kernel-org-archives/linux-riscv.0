Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DE3C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLslmuv5c18Fc1MkBZ9t+Ypds75a206mAHo3+p4U8jY=; b=xGpJ1fzlK+lxet
	goNv5I4IEuZVSLOyN2eYHzIQbAaMkkvMs48tN0QA2UOJCDsgQQxax2xH+3t3seCZo04My+tUFjIhZ
	uvlxrn8M7fVwxC2HgULYKW/JhMw7kFyRQPfTFpGDtRxT8XdCZlhRSADW2Izh1O6cEMsHTA3uaMFRT
	c3kdNLD501dDKiL6VcJS4CD8rMBqX5v7hMSXaoThVhJgsRDcKsWTJcdtt1QBMYZnQdRRgMYoh4pfN
	88WiqWBL1MR3aMH2sJIdkSuhq8u7rf/vPkofQsVGMTAhg2jlWJm3Q2JcGKKcysEoDT1lg3d6OOukM
	araPhupT82mvgWI4Z3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BH-000000033gO-29zS;
	Wed, 19 Jun 2024 23:57:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BB-000000033dj-0Vb8
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f70fdc9644so11261255ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841448; x=1719446248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SzWiEwW0/6v9yw3GFd06xxYJICcnKoBYDsv9+ZmJTE=;
        b=cxX9aMmy30JrTjic0auKdMr9cm3FIAfv4kD8ci8GABuD3W5R33NYH6cKoa3HLjW3u2
         xTZNEs6z7opJO78VlyHASbysjaSWHVApcJmT+9q2ZBJNVFe7l5LAr0oc5iSE9wRVoPZg
         Q+Urdc3hWdKBAGCvY9b7mjMz4XQ4l4NjABImybmNK/ee/fd2Ca35BCns7rCpjk93aQn1
         BMNWhj11A1iKXhQ3VAl6V8lR9yv5GPNjIu7cbkYsxYT9y2LBFNiircYtP62I5x8jDgmj
         PbFJ8lTXRHQAxQY9iLfQXnv2jbwSlBcakLJvAq4qJWoo7fXm4Gy9/gpwY9/V/LgPxWRC
         86pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841448; x=1719446248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SzWiEwW0/6v9yw3GFd06xxYJICcnKoBYDsv9+ZmJTE=;
        b=MEKofMoy7eX2SDyU/701Yss5qWBIEmNjM36a5DU6HQGKlFIzHo6OR3E12fTyTVw7Jc
         isPoPq06pW86mirI0O4f/XV2LXf8y3/P9rA6CZja1cqG7Su8vtMM5o47A40XlZPe9MQ1
         wkZwFhKwXxLHfWuCnONUkr0WDsfOwaeDrDZ5KRLTsYmEXEw42G1TEQLVcpBrsg8nLAFx
         +NlSXFS0Y61JU/oDVZQ6F6p0xal1NBScdYPu10U+3xG07Yjf7ubrIftNX1XBMJwxqlbe
         /gQq/F7r37J2Vx3T8dsiB0FPVdKGALJomvjFVOv7rs+g69d3A4DdoBnmvdh/GuKXdaMu
         6QmQ==
X-Gm-Message-State: AOJu0YznJS9w22bJqHA+dWkWn0dhrlXQAOFUSmnUThWiPrR6Moyletno
	jFsh9gZ5t6cjbv2Gm58x9l+xkb66ei1lYhoreSlJFLBRSTbsKuxZiAe5nkZOLCU=
X-Google-Smtp-Source: AGHT+IH+QkL4Wax7Iz6ZjMzlBJ+NY/+kG7ao8BQlvVNYsHfQl/4lBf2h+1KR/Feyc0Lz3mIrU+SpIA==
X-Received: by 2002:a17:902:fc4f:b0:1f9:ab44:9ee8 with SMTP id d9443c01a7336-1f9ab44a162mr47756485ad.32.1718841448335;
        Wed, 19 Jun 2024 16:57:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:27 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:14 -0700
Subject: [PATCH v3 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-1-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=3836YWi/G0y0HoDOgn/r1Zd1I60a7KUp+hbcm5o7LsI=;
 b=dxvIYZiYAo2bW4UaX18zfCfCMPsGP1evBuld1bU4PKIqRPf2Gl68exv5TCJ4Pi5lSo4z4ODdY
 8CbUqKuD4U+B09ilUmny4YjtLfW4jJCTJJV6grwtenwPBStUvUY15hX
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165729_860388_65D36033 
X-CRM114-Status: UNSURE (   8.10  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
