Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7026ACF31B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3xu4BhluzmqWT9DOQmLz4ygPWw+wz1yWkzy6InwWCg=; b=Z3R6EOmSfdvDiJ
	cjSEbegfyrGYTfolS/Oura2KI5rLq6m6yBddks5sDLxc5irbNkyEqCS7tUvC3d1+9176KuVe+k24o
	CwP3zf8CB/MXopPaEFXzGrlqS35EQ0YtbklkSdHWCxr4nKV9rHzo37fROMya4H9/sDd1DNNO1qLgY
	6qawzu9svmZxuJUxC/TdFDx2okNN7OEEoMkisK4xBwECiAOfa5Rtf/bn1NRXTvZ2Y1hcAI219bPwy
	FeAG2NHGyc3hGzff0lvtmACVveGkf77CN+Lx53pG8m24srAKlJEekkXU9ef9uwcYAY3GDuN0tOkdt
	r9Vt2dWhQx+W2aJ7wM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgkX-000000034Gw-0VDX;
	Wed, 19 Nov 2025 11:53:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgkV-000000034GI-1dMK
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 11:53:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29516a36affso80604675ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553202; x=1764158002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=nnuC+jgokVEMeL6Nevz8cSRnj32qZnHanhIv+La4DYyS0ZdyUuE9jbkOGyCNrUg3Y1
         Ad0jxnuc+sM1KfyfoT3ET479j0dnaVvGfOYI6vWXfUGjCwEP+ob8mLPyXdMcnAzOZPdM
         jy49SLHEqJ0lSAGQCzxboyJ/9JgW0QvX0JCwCjcQrNvX0Eb7rNOkcV9eAK+/q+oqg9uc
         jkYtDi/G9pwMdwrnmWGd/oWidj83iSAf2T2qYB9htfSzA7VU8y6+a6L0qG1A91JK5vDm
         7EfFQjDqFjzK+g5BXL8hVmAqEn6OTEvgno+olgHFLEqsZP0Lj2UD7ej5R2BeN9t8E4i/
         HcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553202; x=1764158002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=Egp/OxOxwnY1HxYac1wW/3MrBQWqWCO4VMhdJ7NlVgRijF9cjATtcoUf8dDMsg71nL
         OqiZBERAsvCNv49gNtCs3NNvXV2r13z4HFS3+EwxObcU+DC4ZvHHAMIrvu2M13Idy67M
         u8mk9EQwljFfU6bUXwMpthJFkLFvQgPrNWE1Q44dR43jKIT+7UpIQJGlgrPvfUDHGCQC
         EQ2dhQZirHfGKn5swF1Z8Z4IqOq4jMn1o0rF1XsoMJ8SvW3+v2FSKTYmrcnZHy1HZDSg
         LR2MPPtCFMxn/6P3edYCRk/8vRG/Hf+Ag52qCBWwhCtvjJj9/0s1e+wxJUP2xsOcKoKs
         3/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUht8euflHdp4D3LJ0DYypDvlEdPgYkhQZleGF3CJKxMP0TjXkAaml6SVwucqTvbwN/ALkbwkmbWym2EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS89l3i//1V1cR3yOgej6e3fVKJ5sKyNhtioWgeaaVSKpRViNm
	xL4o5XfHkET8szrRZ8B4IPCEbgzExvv+zWye6srGqDncICV3m6xonbWo
X-Gm-Gg: ASbGnctIlH1NcseQ9npFFNVlscc5AuQxpAbiQzN7Wv5Uz38C60AwxOigtbTcol9qwj6
	rORQLmNJTDUW/WlgPqSxI/+tAbCa/wH6nYu0SJaPj3uf1r2Yi50amyHJif3dW6Lr9mSDDZvCa8z
	E2ryGHbz9G75qASkOyLlWV4ZwcI/RtBXk6BULFF40BFY8T1toz4IS0L2udqslFpv7AafEKkJ3il
	zBomUafd62RR8LxSQFuifweQaCAxQ/fDfYxeNaOHukSza2wdF4ITSqkd7GlgmAvrMthQY/Wgyq3
	pQ+3gz2T2zNAU2r3bP6Wn5JyCRsrTfWLcsiyDodStTWqbxNTlsDZZjszfaWSFUD85p007C/K48y
	dWUUYd/THXhejR1HZKLSQz54i5s9xiq/XKPZkg3tUMXjuovqk1A+lINk8ga8YZD8bPKHh+pnY/k
	aqu3iasek51LbdLTVEqQ==
X-Google-Smtp-Source: AGHT+IGET/ADp5+3M/u89aHoTgTVYMvdcAxh0XdPkWhPO8kQbc9hPt6srasly6bIofN3a5NJPfXDpA==
X-Received: by 2002:a17:903:2449:b0:295:275d:21d8 with SMTP id d9443c01a7336-2986a5eb5e1mr242990795ad.0.1763553202409;
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm203445405ad.3.2025.11.19.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:43 +0800
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
MIME-Version: 1.0
Message-Id: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=738;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wFzeQXtiZ3L6svBdjl69noOh9R1d9Ukhuf/3rX8Jnhg=;
 b=4RO6EP06dVMPaF3EjWiiIGCCWCqY2xaCe3VBWKV7PFNvltdFcuEanM/AKzxhjXnUjU9i+7cb+
 0Qep593NG1tApNtUxjRfBGcXA7WIBA6FeUH/NIA7iZBOR8rTw7y5XBj
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_035323_437353_A1A96700 
X-CRM114-Status: UNSURE (   8.49  )
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

Add optional reset property for the SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..3d4faec41abe 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -27,6 +27,9 @@ properties:
       - description: I2C Functional Clock
       - description: APB Bus Clock
 
+  resets:
+    maxItems: 1
+
   clock-names:
     items:
       - const: func

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
