Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B3D5E154
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iz3iFUmmWwVtS1cGILmwYzKgMzC1bBnfUCW78K1cLYI=; b=GmIHphR2fc8aZk
	vB/31HCzxdE1I6DuvG1lY3KAoogIGlrI3HeBR7Kfu5yc0RoM70wxDzbCWxn1yBAqPwn6FsD9FkDFy
	Qv0u645NqK5M4PwgTyeWT//IsYnCiEEgHAtxGdA5Pb4TpM2eQoHzbXreeCp8ye+kpTP6LaSO+0wvE
	Joi85vwEPhaTX9psyw+XxurVO7j484CkHyrsBkL4LR0sTho70f/2DpX049HY5R/McWvKHw0NgwtGx
	X7KBobwP/19bKNRocZZvjg3IheLkNvMVYeDWpg9MuRrTI5mvqmDb3uiyy7D9Sn0a8gmisEkYZhXk1
	dsTg7i9ENAM4l4BglR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBM-00000005Gho-1BUA;
	Tue, 16 Dec 2025 13:33:40 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBK-00000005Gh0-2xFW
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:33:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso1773898a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892018; x=1766496818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUW1fhKJDbOe4HKSh/QeNnUAlu3BR5pVkgdl5b0ZaBI=;
        b=G0T4RfxgJ2pJysoVH3r5o++2ltrZdwoh9aV89ugFfmCr2HY47nqmXr9GqyFxdf9ZNJ
         7nZOpxClvb6LzEwMZ1GTMXqK6VZjTUjezYdKdHmdOWLPZENU+6FwWbJOibsfSdQHDn9H
         oPW/3Mx8nqa8WEjiD3j/E/kV6ktZKYlVIYFE/lJy1XhMxdFrwxRzhjPvQt8jLCK4QgCK
         MrcmpN2q1btDKMJYcFt2twit9BsmNoCccf6D10jRWQ4fpNKGEL7IoBLbkZsCJyz3lPGh
         AYnyQfx4aWP5PBhlrKd1l6Tg6eeWf32sTbkQzKFQ7pMn0fP8wLfd2OFRHHUr9jJO2wrj
         onRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892018; x=1766496818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUW1fhKJDbOe4HKSh/QeNnUAlu3BR5pVkgdl5b0ZaBI=;
        b=Fv79OkH4bcVLMSPGtc0Pdb8UCQc2UV/Bm47TiJLeD8mJ3y4J7cDM/q5EriiuIyoiXj
         AQx+MEWjKPzWYR6dSIfJiP3PejjDBaEo7PCNqTVXOVEg/I8h7HHj++YJYPj/Xom44zo2
         mQdyTGmZNrgMXDzMll1A9x5A/JwQBtPhNig8GDAKHYHsSPOrIxBZNFQES6NZR0IWAtG8
         AxQbXaUOr8hlbRL9f4oYHeohr1E4dysEvmvaQ+crKW5Ncj2vUNG4Oh7a/J9I5cCtsula
         KhnDWj9V7YoEYz9eGewi1nP15obJ9n9SkKtBOAhoxsw0tzG17CkSumRfLiW3DCK9x3qn
         DdCA==
X-Forwarded-Encrypted: i=1; AJvYcCVz2CRH8qVylWlXwLBFoRlLSvoSgSDQKCiCu7VcX7DzhrmEY+CE+t2GW8tpSVfROn9/R+fCHZX5tLpczA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRX7IexBiRMmkHJ97uWzW7n8G33QFZPnT142McK6jmkcvyOKth
	W84BOjKjItcKR0QNmSihp5f8Zu7WHyy0GLI1CwgBLHRenSkn9PzDwFvZunA+57m/ZMs=
X-Gm-Gg: AY/fxX6MnHcfsEFLXYIBJpINyVhlQ30OYurYhjAPj4rvSabtFsyjLFECWHIgb/7Aypk
	Uzb9T/YvEzY9zzHvSZmbTL7kXL8Drd93ONwU25A/aKgH+mLrzRxdFHnuqGEaR6jD6Xv+Gg0jftb
	oRXtpqbX0JU9P4EX46WlC0nhgQz9WIMwqjkJnXpBMM4tpsaP7UlTX80xXQofKYk9qUkg3srhv5O
	i5gzEs8eUbjns9c6SVLadC6yjG6J9jZWe2izAztK+sUF4Z9Im4a0kbdVikA4/EdJcw1LhYZHV9O
	LB6N2W6aEWqY7j4puIT59cMGLDqZkGKN7RXh9WRM7O+7DDieTyKRGAyVeqvNFmTodwXt8BWqHKI
	fOv+pfPGxDDksXtd+LEXhhc6dxR18RvzTl926YTyCv6vsj3qe+T3CNu0Az3H1sPlGoJ4D/6zLtu
	lfPfiRJJEDX3KcQVyUf99TJDkrhjTiSnc=
X-Google-Smtp-Source: AGHT+IET9GhiW4RGL3w1Cy73SGb3pcHepT5GGV/njIgZC7quLxJZByYdERwcXy6lYO6BkLM3PBzhsQ==
X-Received: by 2002:a17:902:e84c:b0:2a0:971b:151 with SMTP id d9443c01a7336-2a0971b059bmr130452205ad.2.1765892017756;
        Tue, 16 Dec 2025 05:33:37 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:37 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:28 +0800
Subject: [PATCH 4/8] dt-bindings: interrupt-controller: add SpacemiT K3
 IMSIC
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-4-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053338_755425_3CD313E7 
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

Add compatible string for SpacemiT K3 IMSIC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb90baccece03708f4a381084b22049..152eff7335dd8457bf01d02497b7080f2a02ab65 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -47,6 +47,7 @@ properties:
   compatible:
     items:
       - enum:
+          - spacemit,k3-imsics
           - qemu,imsics
       - const: riscv,imsics
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
