Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EE7C25B0C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGi1KdBPmJ9Pp1wlrdYnEXjgRoqx2RIYy2cahldUY5E=; b=ms4nSL/HWZoWHX
	cbeLq3lxIpRwvvIwl4/x63XWVA/WUx8dYvvbHs+08Zf0z8NEefrO3hMkLuqx6Bvz0Ju2lezzlT+72
	HhzbaLy6pKmnfpQr+gWfFRfpxVnYpZKIPVrDMEcECyt1h0p1Dp5M0eb4HSYUIWFp+efBtAI80iASt
	mkAOCS8nAc40Xo/YJp1/1LznmEduzIapNcFMtiImnF4ArcfvCA8auK2I9BR5KOvJTjFYiOA0u850i
	DgTvD+uJD4zx1kCQZccjB/ObSSG8+jjuzwrudDawnU/t73RONgLi3kbnNu43Z1EsaZ0IpjzAyfKV4
	b21nlPgv3+rG5/xir3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CL-00Gkhl-TA; Fri, 05 Aug 2022 16:29:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CD-00GkaX-Lb
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 16:29:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso4199051wma.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XYwLdkCxi/i5yAItJxUUyXuQNOjzCE2mt/Ff4B2y6Cs=;
        b=D3jxpRS5zNs90vY2YI73WI0Sebg+PIYbtdcLdZdVJEXt3MBup6LCK2JIBzVVc9luf/
         y+mycZVPceDjrWQVGmfZ+sxZXcbWaL3763eF+Q+DVIutHNzi0RLCew0mxmG7/kIfLpZ7
         vd2UHhO6bKZq2M2BwoTDjQ3+TgKGoGMYtrEJ7e6B1dAuq64Hny8AXJO4zU7fKCqwp9Y4
         XqNFWxfQxCabjC6uSb/6FW+5T/zzzug2dsC9ovC7y6kN2H0bGhe/mof5pv9jfOu9lrLj
         Jx8RXO1fH6Lhe+YFFJEXwg8WmUhG2kUGCItPfw3nN1RjSrrl4qMrjHweVP2pn41EcyL1
         yILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XYwLdkCxi/i5yAItJxUUyXuQNOjzCE2mt/Ff4B2y6Cs=;
        b=Kx72eKsdQgx5wIUzkms76Lvr38BAplLw3nMMPJsbQyiTCgTQfT2NthA5k7ocO4rsUO
         P/FURN0nQXznqMdEUs33oXASUVapV/HMeR1tEZ38aqU6Z1FVxak9u+jpKOPQDmD7dkdI
         qttBlO+7EOVQECADPZYRYWUvgme11J/ujOvOSUwyjiKFA4Picpguge43XELTfjIqd8rh
         ZRDibcvuo9qKZUN70xPkJcF8iT6vSLXl2QZ3MC345IY3aM5xh8skP4vwVv0wQi5vsJlu
         mda2z0/w1sRdi/ulIXERpw7semHmoDTJ1cpDp2MsGvaXbdvoX+BRWAzLLdiupR2j8OJn
         UoLA==
X-Gm-Message-State: ACgBeo3fwSit52l4xJSfay7IxbhPMfpZLijxoTnAv/SKr53Vnos4H/2j
	lUsl5mXnubg88oC9ZbHoSJuZCg==
X-Google-Smtp-Source: AA6agR72z7gXpSrSt4MlK0Qii9Fz4lxO9+YCgAXzA44zWKFpX88wGi7wvDKIHf1SjUomkA4m7/Xc+g==
X-Received: by 2002:a05:600c:3d8d:b0:3a3:15a8:a8e1 with SMTP id bi13-20020a05600c3d8d00b003a315a8a8e1mr5151407wmb.167.1659716945693;
        Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
Date: Fri,  5 Aug 2022 17:28:44 +0100
Message-Id: <20220805162844.1554247-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_092909_744636_0F64C43B 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Conor Dooley <conor.dooley@microchip.com>

While "real" hardware might not use the compatible string "riscv,plic0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
        'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
        'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
        'sifive,plic-1.0.0' was expected
        'thead,c900-plic' was expected
riscv-virt.dtb: plic@c000000: '#address-cells' is a required property

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 92e0f8c3eff2..eb07c4f1a201 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,11 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
           - const: thead,c900-plic
+      - items:
+          - const: sifive,plic-1.0.0
+          - const: riscv,plic0
+        deprecated: true
+        description: For legacy systems & the qemu virt machine only
 
   reg:
     maxItems: 1
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
