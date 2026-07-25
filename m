Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB5C531FA
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dThLuON9uoePSNbcF88E6QU0AA1uLV+CoikijM/nfvo=; b=bJ4cdJr4cjLods
	9JW325eSO3QruvI1a4fZQwQXT+HRpQUBORjpJ5sQMdymKUYnSyP8UZlnT+luNHUiXzk/jwEwWZwGo
	XNYfo73WL6cpZoF7pDL7Dqdcu9JzXVgze3Oc0BTw1pfO0HZ2QbndBLJvCVmhoPzZe1QWx1HRmCpqP
	3+jfLIJe9yPPrFVgVA7tBiJz7H3WLHvsf5eyfnwJUjxEjUj/8EfrL3nmQMI8jGDxmoKIEakpfg4cw
	0vhLJhTiDiF8J2MTvCythvCSIEJwvaSN87iBmF6Wbkez8C9ebDPcwlu7eMt+U/Ry+AvNXQCmNHmKf
	vhxbaxlRKjKkKaV79qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsd-00000000lzN-1MMS;
	Sat, 25 Jul 2026 23:34:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsa-00000000lyG-0tVf
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 23:34:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84867f07d63so1937743b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022443; x=1785627243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=nIbcgjiXtSM/ZdR+xyeUX/VIJXhyr5yFlmLRz6ty9l65x8jFyUESYYWTRCKuxDok96
         csxJbzZ48+gVzi5VWlscKuNEW/XNZs/knMI8dSoR4y3oqjtgeZP4iEIm+cFlbDUYnQlM
         vezEXoAC7o7+aMubQUdKsjy3j8HjKAVrQGDgm++OYjUTr00kk41FTzvI7REWdI9Gl9G6
         sZsAIVvGwHlpZNcfHoT6zKBPyOPN9XJAIRQZgUvyXBMM5G0DJA+Fdet1zgfj/JcJmP7W
         U2L/6TOoKAH3qjOLtg3djoBQkjNyfQVWsegLmhV6/k9+aiLvmLqVBwNXz45SDMJPqJL4
         H0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022443; x=1785627243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=PZfAouuF3aoIqAY20huhU3W0UnWYv34ne2boejrYQZ0JhT/uXgigI90QcJ7wtZr6Mh
         E2AHCxElcKb7LirYGIQHIE6a04aNBn5G5/jk+xvszGP3SlcgJ2X5HoZJ2waIq9obYwbF
         Bp4OVrTkw4XqgzHA505fS6lr5lxGOFgTukxd9sL+NvbyMQZchKNbmAjTZXE+LK1EdFpR
         FHg2EEq0w8zQvG8RYYER6XoanRpGqgVmDhipUCCQ7yQc2zBNL2bwdw7YW6iRIGvbwanO
         z+a1PP+qe3S7hF437RvFq0UjwmR+/jJ8wcsc4crEVOGIe+zykyTn1x5vRKR5ZnZJuWUX
         gl1w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/soNWqmltUAs/Epsb2wTiNqk3XPDS+Me6CMe7KWdh0Tv/5pBBIdj2wLEL74JVKzv17lL/BVSUhpat8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeFqFt8dz45lw3VebDLcHhKmNnD1LeB65YVKtnHwykGKIfCo+I
	g4k/aojfzYazjjp8LDZvDesqhJ3sfbH4W23nAU8KWVi/pImOLS8A1bmUjWoKp8BaZEY=
X-Gm-Gg: AR+sD11QJP58fWgErf7vR4Yp7Cl5sFGeE8xPyXaAMjTDdLHb16eoSYrUEEbYK/syXOF
	0N85p2+zk87WsTBC3GpQQi/KH6XAJVxg4HlCgN5XAl3HLiyEPCr4BxbO6n7jf6yFj1qjZEkIeZW
	pNYIl1CX85tVewdiaf17dwtZYb5WzqWwlTNjBpbDZDEtGmVzTqImOAN/fLDARyiEpXVVjIT9JeU
	BX4VcC2XmhSNyJYq7EBr3JEO39RNhJ1XfLYCWokjErznsbM7vLcBcG30o1FQ5BvtqYG077KWRtD
	fRcSE+Wfjcgb4fjgcwvlvlNpBZ6SkkM4rdMy+q7Fni/QgM3uyKnexN2JZPl5nuuJC9LNwapKf+M
	7F3lHNuUdMa75bb4YV8t9NWuRNzu6G+d0GnjUEAgcAF5anXHBfIuHSMkVfJMa1bswykwVui1BU4
	1W
X-Received: by 2002:a05:6a00:9283:b0:848:63fb:fd91 with SMTP id d2e1a72fcca58-84e59546fc9mr2996113b3a.41.1785022443208;
        Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm1410168b3a.28.2026.07.25.16.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
Date: Sun, 26 Jul 2026 07:33:49 +0800
Message-ID: <20260725233351.55004-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
References: <20260725233351.55004-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_163404_273028_A2562017 
X-CRM114-Status: GOOD (  10.84  )
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

Current phy framework can not re-initialize the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be read. Setting the
phy id of board pico-itx manually so the phy id detection can be skipped.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Reported-by: E Shattow <e@freeshell.de>
Reported-by: Inochi Amaoto <inochiama@gmail.com>
Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b2a7d2d0d3a8..d78416f3118e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,7 @@ &eth0 {
 
 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
