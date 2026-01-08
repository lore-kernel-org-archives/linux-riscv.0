Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E608D185EB
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfxCzyUIkCvV6PlPqSK8dzA4pMeJj6w53w1F37SPpzg=; b=juV9uAyJes4JQy
	845KyruNqSQOy/27WDsSZlPbjYNuF0qbdHWoXAz3Y1dyteQnYStKxBx+fQuNYoCar8jO7LIR74GJk
	PJsgmRduDt6+n6cJx8t9JwfGl0ZAP0aPCPD7gcamMlhXNAL8v32yTMldUc7dMNl9EL3wi/BtuZrB5
	988fhO8qoQp3DMN4jfLDo7i4PvtzR4TAxHUGkZb17cXbiNwzfn4G5eSa2rr1II4TroGuubqsa9mxU
	qRxyPOp/x7zS369onZonDeqzAAOhYMZZ5pI+xt47ak7uzCbCwi7Fj448kLnrzgnIIhwqGxedevlT1
	QL95Dg+G8w78uXSFWezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6C-0000000Gzb6-2d9h;
	Thu, 08 Jan 2026 12:26:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6A-0000000GzZf-0YQV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:26:43 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2244169b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875201; x=1768480001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uE1KQ3Nap9wSa7ARNmv253D/zHZAcI3o2YellqaTrW0=;
        b=pksXtesAz5bGlv0gPPuKZqBZWuy8K1+kHO6O8o6EaejIXkSnyp6KgWcJAE6mHC4x9u
         bTqhHHciJ8QMy3KRpA/gBzWkPfKeoKbYO7H2lW/p84W+X+5mtadK2Xd9KPNVT5fpFBAL
         U5zR0/yGaMg3UDBF4BfudvJm+HbGrK5z53pBu69lcH6IWsmLQezczUwFoRB7CP9RoQ2t
         jssBKAOjfCCVOlUfLO4hcYj5ti8z0vuZjmP1VkFhqhzk/GbgohlggtVv4jDP1skQvY2K
         y1PTmr1KlQyi7owaEt2ffaHww/h9DbPx4PToNxMQBPzzFufnr5deMkH5m+IB8OYnHvDT
         FPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875201; x=1768480001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uE1KQ3Nap9wSa7ARNmv253D/zHZAcI3o2YellqaTrW0=;
        b=S8SLss/v8OFUZdndOyimxea5xsPnWbarjDK7VbtXlGWZY4Q581hlRus6qLxBC+7h4k
         nV6pRLIP5e8bOx2IrPL3567B1P8Sm9SpJXIsManp+daJjHNsnPmHJALiN4kAdKFNwz+Q
         N/9Zm39wiD1MNcd46ivBN31znqymY63rOtHvaqW3WXx04efPGVOXFUXLZzTC6m2UdWL9
         ZXJFZQuwMEtB5zVkhvb8wRxDJ86ZmHL21tid4dEmKYtGojDyLJQJe1tPxS9IiengWKj7
         Kwqu5VBEFd5lYVaqvNUrkzuhxnsD3yPnJ3lT92Pcko/x1O4ZivWUCDfRVPeOrPnzeBoH
         173g==
X-Forwarded-Encrypted: i=1; AJvYcCW+tcPu+pj7G1LNkLL7ARPnMsP0nB6jA/eoEm3qE+Ut7/dSj4Z7E5A98ftdLKWV5RFF6VZsKI1bDkLV5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr4bzT8RRDpFHvNbpquK8xcKA34F3LbOYuSNic2FXbb2n1ORem
	TqGqBkwFXPJVdZXvv+SXQiT0gza82xsjkFKiWHS8ykvHDyG0Gim1/OtsLEMoydkVFho=
X-Gm-Gg: AY/fxX40c9Olu0WIhu16qWqMsQO+u16Zw6AgMFNt8EjZbKAZyLP9uXolxTQTPOYEHYL
	eKb8PTYHlc79r9bN3KkMZtrDdWmNOBTPE2cT4hZzzM1zLiqV0OubL0iXu/N63hFkt0c7xMlyr+l
	xmX3bsJCTJora8zqhXexfyjluMExGyatRwZH+IoHYWYAsFpnYzIAUI+aksl2jOnSHGB1OzEq6yQ
	3dxeTh2SKneKXt3MoSpYPOmXC1bIq2G04W6VX0bcF47rcIF6rkI/5J8pmb3RzZF5vzyB0pMO1+B
	/n33LaW0TcqdemOFHES+9SIwjOIVc73D9+eq+mjBQxffUjM89osCs/AFDkKgG3jci+lwcHJ/l5o
	nIVGK0Yn221Lg/lYtuXDIhIzLx+6l+WPuGGU0fMYhmvgpodQH7iK7RzYYMJ79R8y7on2AHvJYmx
	zg21wLA6+V6aTpM6iM8vw4cDzAxbQZSUQ=
X-Google-Smtp-Source: AGHT+IEf2mq8ef1YFTNrrFOuAanoejlFcGh2te7djhwZxqGKBzNIruQxKkJjwV3kGI0EiglOFPr0Pg==
X-Received: by 2002:a05:6a00:4219:b0:7f7:2680:7325 with SMTP id d2e1a72fcca58-81b7d6511bemr5205066b3a.13.1767875201339;
        Thu, 08 Jan 2026 04:26:41 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:40 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:54 +0800
Subject: [PATCH v3 03/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-3-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
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
X-CRM114-CacheID: sfid-20260108_042642_183260_62DC3BDD 
X-CRM114-Status: UNSURE (   7.82  )
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
v3: No change.
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
