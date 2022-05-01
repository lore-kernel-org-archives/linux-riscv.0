Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0584C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Myo2mXLGp3Itugn2w1Mi4yFi4HohGU8XaH2vGQop4tU=; b=XkPG42nZc0XQPa
	WgJFfG0jXEFfQVTtlnyxmo+hEwDA/aF3Jl4oGhm2bAZW0eLn+2mgiWJuRvPTH84ECM9Y9iydKflk3
	wlRbYccwIxjFWOn0Q/fk6GV9ZE/SWJfTHuufr5ZSK4fDJf7TVAIFVamTB2zPZ7/PFYY50UrQ3K5mf
	RGQO3xQrhYOw2+OquvBmJw2MCYsAPtxRrtKxv1F1ofTUodDICvaUhL8yZw+EAfMQ2QkJl75+YE7Pn
	Yzl+WqS4uPw/EOimAWV3K+38aYJrAHRIbaUHiy8NKCvD8Bd7sMucutH7kgOffMWP2LQF11155PZUD
	4zMD9OO9u0QS4Y3SLnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDO-00GnJh-3m; Sun, 01 May 2022 19:26:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDJ-00GnFz-Or
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i5so17191315wrc.13
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yXuZyYuRv2REW3xNUVVnJn5xBkq6ukaavBE2YyyTs5c=;
 b=yfp4HXcMs0RhpwqwOaCqmtPb1ty43fDaEFbLZOYxlBumkJM5qegc+nYExmH1YD2DZe
 mWTqYXXUtaOU3x+4EtEFPJNb1wfJDinFJ7mul32H6s2E3qOSHHxVORlAd3n0WS/nhB9j
 C/xyvIVlueAqPdaMkrNdahGvoK8c5J+vtE3UybjLop+hFHdA+DeFjDV0u/V2hjJkG51c
 K26+oLC226hbsKQkv3EnguXnJnuNDPkH7VNXJM13+whV7y3VbdkHNbuADqA7z6yCYVzB
 /Q8n/Ql+hw0NqUOricRB+Jzwp3qYU5MSF+ryV+3r7vxfHkuaKO0UT/TWNSHUrLuVvnun
 J67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yXuZyYuRv2REW3xNUVVnJn5xBkq6ukaavBE2YyyTs5c=;
 b=Ss2vW5UvgcUbvMG8RtDAe1iuFMLjxHibgbiofkklU223bW+1LWbKOAmoob4QPGsnuu
 agKUmxuBbwQq5+NbYaFuJ+aXa72d4m+fo5imDWNwKZE+H+tTPOvG1ni6mxpzOG8JT+Ft
 K/htTpnb4sgU0IdEjKQwodva/46fgErH745gbDdabaoaa4S+yZnBIZBSfET88G88C3pD
 OG/N9jtZEH+SuvtHFZO1wxvneLKXBR38/AsykCDbpiulrm/2JaSFt7fFAgUi70Sw0I9x
 gXIZqSo/v1J+7ZLccv6hQ3r2hG1pLNs1qkX+nDf6Hi9zMQTEocqytCbRn3B3t+Kw7gkH
 0HuA==
X-Gm-Message-State: AOAM533YC2c+IcKlNI5dCsfH4RSxj3HQZNNoq9/aZprX8WWF+f/9Jfo1
 Qb0CgcU1sOH2CWbwTAXrwT0qpw==
X-Google-Smtp-Source: ABdhPJwqhGdhqeNBRhleuU7ALx0JG2WXpKA91xs11gZLug79RdGh7uFAnRWNtlDveYBpjTyYFd0Qvw==
X-Received: by 2002:a05:6000:18a2:b0:20c:3edc:3f9 with SMTP id
 b2-20020a05600018a200b0020c3edc03f9mr7450723wri.580.1651433195126; 
 Sun, 01 May 2022 12:26:35 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:34 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/8] riscv: dts: microchip: make the fabric dtsi board
 specific
Date: Sun,  1 May 2022 20:25:56 +0100
Message-Id: <20220501192557.2631936-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122637_932266_F6E27C8E 
X-CRM114-Status: GOOD (  11.59  )
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

Currently mpfs-fabric.dtsi is included by mpfs.dtsi - which is fine
currently since there is only one board with this SoC upstream.

However if another board was added, it would include the fabric contents
of the Icicle Kit's reference design. To avoid this, rename
mpfs-fabric.dtsi to mpfs-icicle-kit-fabric.dtsi & include it in the dts
rather than mpfs.dtsi.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} | 2 ++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts               | 1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi                         | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename arch/riscv/boot/dts/microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
similarity index 91%
rename from arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index ccaac3371cf9..0d28858b83f2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,6 +2,8 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
+	compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
+
 	core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 84b0015dfd47..739dfa52bed1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include "mpfs.dtsi"
+#include "mpfs-icicle-kit-fabric.dtsi"
 
 /* Clock frequency (in Hz) of the rtcclk */
 #define RTCCLK_FREQ		1000000
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index cc3386068c2d..695c4e2807f5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -3,7 +3,6 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
-#include "mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
