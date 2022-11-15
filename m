Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF3C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kvj+zc2IJF/33dpHizl2ddgQL74uImjS0XHSGDqgzNk=; b=HaYZmNZDU422bL
	VMugInoijIBRihHo7bp+LlnCw+VaDj3p+NjRfwK0/NvmutgpRKSerFLleJZ2JO6s4NmB4QNFvu7c0
	xeZ6ja2CqZ5GEG0uOSmiHUOyQ4K7UhCAPgBsJp9OQI4bFGZ1fxVD30xBxQm2dFZAb/2kc+0wwVrUF
	+KcB7K02+dTKvZSI54Nq3HSM+/V0eZkAIF4Uxu9Z5Ss58bZRAJSV+Olsga7avwOZpDs35PnBDL83n
	Fai/n0uxrs7VNSTV3WeiKqpQl4wfgbKZmYMPmwehvD0Dy1uS9p8VYeKL3Ndx9oRGuxEV1DJOuXlWV
	GvYGkG1XvVqaW+trDFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outfA-00AFp2-Pz; Tue, 15 Nov 2022 10:59:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outXi-00AAhY-Ft
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 10:51:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso9954930wms.4
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TDg3jButA61q6p3uGjmgDDrbdJSU8F6g2ZLke3odgw=;
        b=X0R1NAZVLu4RBi5KgXypsvFBIg5QEFrylN7vFWF46f0VM1D7heC03jvVAYs8/RfUUE
         ZZUOiudVLMASxhStB1tFkgdOZl6Q284Wcct13khDndPxOAAUSwxIFTXN0vatgn6eqm+x
         wEa7a5ilhSjng5A5vAcvJdfdive6xOiVWg6DFMez3jEJkBdElUQ69+wFKoP6A9VsG0oR
         8vmTcSyqjrbY9INzbMykMohisfBoPUAazRc8lD3lTRS4TUTdoxFEOKNBeVRZ+xdwS7qT
         sa2EsEBZ1biakUh2yiaK5JgBXGlbPkyN4NK31EOohzsxU043oqLzjGXiDJwGPNp4SB4D
         kD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TDg3jButA61q6p3uGjmgDDrbdJSU8F6g2ZLke3odgw=;
        b=lFHIKHGEDeX5ky8LJ+dS4mk3cRcxEOUp9GuewCPDQ5i/7/c03S0mq/lhOkbslkVMw5
         9ebyJZ0FQLyStF/g97lIT2khS5vGxIMDw6mlYKZ57ErrQTYBvd25ZjqTa9cw95QQYzEC
         PTKTtH2Xz6hheVo7ibS7EePkczgEm7eaTkSKHMA1qhcwdA+5Z4VI2C9L4Lz0z7P5sthC
         iAXgK3cyA71BaApct9SkmaG2fI/P0//24rdiW4gP8ZxFiilEpe/GEphlZpxR/QVsSCuV
         MpDoYomMCEl3J7Flr6bgbHySd3cMBVma+44wZC+FHL7OVBkqEB+tSm4sMZYNMggvKmBg
         V9MQ==
X-Gm-Message-State: ANoB5pmWvL9+PnoYRWd+Xm0wOAVKlZTnsCEvqpqWYqhNwi08XRlyoM1C
	vgOkvI/slkEEdcOXP8rVAjg=
X-Google-Smtp-Source: AA0mqf6oFZeyqPUzVDWOKkiLPZSs86RgzmZPi/RIsvMouJL+GjY/VRXUWn9klGYGOgk3BINvu5Uomg==
X-Received: by 2002:a05:600c:5569:b0:3cf:63fd:cda8 with SMTP id ja9-20020a05600c556900b003cf63fdcda8mr1015353wmb.46.1668509506664;
        Tue, 15 Nov 2022 02:51:46 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d94a:6345:c378:e255])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b002367ad808a9sm12210528wrb.30.2022.11.15.02.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:51:45 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
Date: Tue, 15 Nov 2022 10:51:32 +0000
Message-Id: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025150_672751_DECCBC07 
X-CRM114-Status: UNSURE (   7.83  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to enable support for below blocks
on RZ/Five SoC/SMARC EVK:
- ADC
- CANFD
- I2C
- OPP
- Thermal Zones
- TSU

Note, patches apply on top of [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.2

Cheers,
Prabhakar

Lad Prabhakar (3):
  riscv: Kconfig: Enable cpufreq kconfig menu
  riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable
    ADC/OPP/Thermal Zones/TSU
  riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C

 arch/riscv/Kconfig                            |  2 ++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  2 ++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 11 --------
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 27 -------------------
 4 files changed, 4 insertions(+), 38 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
