Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C354E674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BltB5Bvqb5R0RhPlApabRg7C35eE1W5D2OBIVdrSeDo=; b=v1+h3ZJ0oPieIY
	qqVoNyyHDPQXzsBVsGyMulzWue6FsMtBBj2EmFKXUY1AUTiRATQYTZzY+XvIMSlbK3JS8pnGe18Of
	WqXoh07BrJboyoU2Hsdx3LKL/tpTTyQGxHceCuFDS037kqNnyCyEsEpu/WtqaIvFIp1wjcPKypJlq
	AXmulvxudOEP9nwD7KOHFUfdZiwKT6H14xYvplzpxGGt0Hyy7JQsMRviLGmdqT4lICPVAN1Y5b+R/
	swD1bn4Mww3fP/TeQu/tWZA5uXfCZSv8BPseXRracbxoJKrViEoXJ/0QqhIHQR+xeVgfxBXa1Q2xq
	MrC6K20JpT+X062OEp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcl-0000000DmAw-0Yup;
	Mon, 22 Dec 2025 13:06:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfci-0000000DmAD-3zWb
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:06:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so2105123a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408812; x=1767013612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZd1WuVDHb3KQSVAGlgKp7AEdPQaqmn6KEKfxdPwWwg=;
        b=NyI2xmndA+CaPiRdl163n43yrTY2Iy0gdSZmpJOke12trFBBikhWDysqPWOM5b5fui
         y9AT+Hm5E5fYVntROi9EmJbvwcHJq9co37F8poKaeHkSWY2aQ/l+79oM6Kh7iERHy/FF
         2o0/Ayr3E8atXUjlYKso5WlQe/fiwqJ6uRwFT9/V/Qh96iThnh+NhJ3DJxNvK7W8KySr
         lwcsuJA2+XxDh8v6NmCwGwO6IbJIJGdVyLVjqL4LRNP0yQMPhbjhbX4V/3txe5CifSkW
         YrAE9Jd6KshVR98xSmdMwpayRlIYHLJxXl+TO6RPJXa0JnXFwz+yhdChQ72ToXMw5SNP
         0rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408812; x=1767013612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZd1WuVDHb3KQSVAGlgKp7AEdPQaqmn6KEKfxdPwWwg=;
        b=tKITQfYJMLofgamzKIIbRdnTk/LIHemBRtnA8wk0K3jnV6sKdYrUux625VH/gBDDb/
         TbD97OKPZfttilOkTwQeYeXlSIakTipcqcntgYG95fj9pdSLnizrMP68Whr/qcxhy0j3
         zzBA3e1Auwy+zTfnEXS+Lr7K7u80zppsblEbF/HWT/2hpQAhug+pby77KZkDFwG+0dZm
         yzY/Jej5kiEeZJXveG2BfKmDgHipva+AVB5QK4DlCCc/KDkxzUHeYzr8ZKlbqDtsnk93
         1zh+lL6BtKgo81j/3U5VCuhen4I98jBTclm9jL/CEw4jA9O9p3zk8AhRRPToMWKRwJv4
         o8fA==
X-Forwarded-Encrypted: i=1; AJvYcCX9sLbFybebOhMUGSXTv5au8+ht4HJkXg/Q7rU2Nbqv2XJdA7e3T7gbtBYMCsrpoePPUW3Og7lLGFsksA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKjVeA41nQAJ90ap8/XxjPn81psiiZqBqc809hedTQDsLCcPBD
	msuA3zBPM8YMwfv+4nCzyiObgie15vQcgxLiflrXOd4xiIjyp8dqJtfxRH4x5EfLl+0=
X-Gm-Gg: AY/fxX5jZBQ0W13PXGdmMOMcn9GdI4y7ppoxDBP7ke8OMzw5IJluq8KCnjF1hOqkYF4
	7tLUn23AY9+a5HjpzeFpv2aTvMf6FMkj03UfVGW0E9cFcjQ/48RekYyEtGsCKLwTJ42j1zN1SCQ
	WAp+NyAYKkG0LawLMmEAe+wRX7zhvKsuRRjb9z/8FQSFHYSfOLVLAF/du2V4FtNaHWsh2Q6GwVj
	U9u572SSBLe3ki3b9b41bMkuBuBTeyjG/tbwePa5jYiBfWSk0AfHnfsuEfqIr+H05lEEv/8mA/F
	ADFUy2+kqM3n2ArXN7noq6cdH8rGR2sHfM258q312qaVjNzPOi3SPtLD+LsHqlOW3Aw6KiA/EEi
	QOhOHSBL9z/abdzCYDk2ViPTEbKU8W+a0V6nSH7u3QxxKyRQN0U42d5MoTBza8DiwbFnxtGHaVr
	9jDhkVrxV09ljI3ykXQuc4h6kZ1EAWaWE=
X-Google-Smtp-Source: AGHT+IGPSlitj+KdxoHkSz2WMJ8tmr7DZSG1VelElp3zzCiMbTqUqeMIJpXpJbfUrLndiBON9Fx4BA==
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34e71d6901cmr13057876a91.2.1766408811887;
        Mon, 22 Dec 2025 05:06:51 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:51 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:13 +0800
Subject: [PATCH v2 03/13] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-3-3af3f3cd0f8a@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050652_996615_B8059253 
X-CRM114-Status: UNSURE (   7.78  )
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

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5dacc002d24c50843ebe6380a7d5524..0718071444d29fbfa36283fc9666e8cecd6f77e7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - qemu,aplic
+          - spacemit,k3-aplic
       - const: riscv,aplic
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
