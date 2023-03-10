Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0EC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AU+ohJaVSojDf6XHsw1QtLWuLYGUzJjY5MqujGq3La0=; b=zHYiR9P6VsYpfs
	BCJmhdlml9yj8sgyOXHlCizcTxBuh3W2HQa5TTlLQ2YQdDZXc8dWyh3S41C/fxbBbQ2q3XUFLgNto
	9h1bx/12pa6HTZrvF/C+UB7F8rf5bklOty1YTJKtCQTtzCHchSIo5JNI9S2BddWxXSHWkyugOqnDp
	D6pFanZGwVRSvQsfAwpteO6s/jUvb4pjMSpIyKETOhPLHkbEYfQkT7IxbP8icZl5cBNmDXqozIfqa
	Snm8uC8wB9NW/hO62r+SDp/jDzC+Iw9HsUignicb0ytYlf4OHa73Wd5B9+txOAgCiH0um6ge2le+c
	nFWkIuM9pMkncJ/6sqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXpz-00DZ0W-OO; Fri, 10 Mar 2023 08:10:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXp6-00DYWf-4d
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 08:09:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id da10so17190490edb.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 00:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678435790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKabS/BJYvuRujv8HroGCjHMJRWv0WrnBRF6qDdPUcE=;
        b=m1f2109kCYkrUoWObWpaSKkXFjP1sulmR6dC5EZPHElW+AiNmRxx5wdaykDTHR25jp
         O/hqxGX93yf2fNjpm8MtnZjbUdg+zIzf1Rh2Ev3Vas/rpq1IRPVxu0ytqV8BZG/b0c6e
         m2gvzNH/sPh7EaeyMb18UIEfX3nsjV/T0loH6ZEHNLK+VEwjYcDOxOGbv8m7FeFJMGGB
         /CP/S0MTtp8dQlreNkjCk63AHC/SjMDPaVICvV6u5lSIEo4EqF1VuR8yRMvusBb52nqq
         MEhLesFmWRL7LrYNsTXZhwpJEliaQqPAv7BZViJP6DDe6C4AaQyQ9u1h1T1X7V23ZpzE
         K8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678435790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKabS/BJYvuRujv8HroGCjHMJRWv0WrnBRF6qDdPUcE=;
        b=Pdsq0jU7PpuwKpaH7vxgg8VR64UMo4ShgR26wxygUH6R8n9JrbDL6CS9XV5Ubl9ZYI
         VXPOIfpSdbZSTWDqsk4lDgs9X4HfTjy03nfhhxfElb9eLhOih1IGztg1JdX3QpcdQwIz
         TLgWcYH5oL0bqqw6boIQUjyJFwDkGheJKBUZEesVTb9BPXZgm5INUCCWkGe8q6It/7R7
         X57CsQmC3u+XeAjP3h8HKisJTH5Qd2C6CS7vhfb6dFXpcxn/s0BUPcNy/h4kack/Nygr
         dpmUK+hyHMNeEEZFjgir8cPilWT7DgL0rXKycRHWB64s0vexpO1XZbA6v7cwas8+22Ia
         DMug==
X-Gm-Message-State: AO0yUKUfmB1nBHyv5AkYyGOe5IKnpOdS2RFIe3KJXevZTywioxOq9sEB
	hNxndMgApu/1QnnZPA6xjUU=
X-Google-Smtp-Source: AK7set8Y05+gYGRvmQ0AeNDp57d8KD+lxGIXEBxHhCzA4vKzsFV7Rtj0CttwlpubcT3vgTNML0xjag==
X-Received: by 2002:a17:906:1846:b0:888:1f21:4429 with SMTP id w6-20020a170906184600b008881f214429mr23489327eje.19.1678435790007;
        Fri, 10 Mar 2023 00:09:50 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-172.cust.vodafonedsl.it. [188.217.49.172])
        by smtp.gmail.com with ESMTPSA id m9-20020a170906234900b008b95c1fe636sm633298eja.207.2023.03.10.00.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:09:49 -0800 (PST)
Date: Fri, 10 Mar 2023 09:09:47 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 00/12] Add Ethernet driver for StarFive JH7110 SoC
Message-ID: <ZArly8rXhXwccshB@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-1-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_000956_233185_840DF051 
X-CRM114-Status: GOOD (  27.97  )
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

Hello Samin,

On Fri, Mar 03, 2023 at 04:59:16PM +0800, Samin Guo wrote:
> This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
> The series includes MAC driver. The MAC version is dwmac-5.20 (from
> Synopsys DesignWare). For more information and support, you can visit
> RVspace wiki[1].
> 
> You can simply review or test the patches at the link [2].
> 
> This patchset should be applied after the patchset [3], [4], [5].
> [1]: https://wiki.rvspace.org/
> [2]: https://github.com/SaminGuo/linux/tree/vf2-6.2-gmac
> [3]: https://lore.kernel.org/all/20230221024645.127922-1-hal.feng@starfivetech.com/
> [4]: https://lore.kernel.org/all/20230202030037.9075-1-Frank.Sae@motor-comm.com/
> [5]: https://lore.kernel.org/all/20230215113249.47727-5-william.qiu@starfivetech.com/

Thanks for this series.
I'm able to boot Linux over nfs into jh7110-starfive-visionfive-2-v1.3b board

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso

> 
> Changes since v4:
> - Supported both visionfive 2 v1.2A and visionfive 2 v1.3B.
> - Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.
> - Suggested by Emil, dropped the _PLAT/_plat from the config/function/struct/file names.
> - Suggested by Emil, added MODULE_DEVICE_TABLE().
> - Suggested by Emil, dropped clk_gtxclk and use clk_tx_inv to set the clock frequency.
> - Added phy interface mode configuration function.
> - Rebased on tag v6.2.
> 
> Patch 12:
> - No update
> Patch 11:
> - Configuration of gmac and phy for visionfive 2 v1.2A.
> Patch 10:
> - Configuration of gmac and phy for visionfive 2 v1.3B.
> Patch 9:
> - Added starfive,syscon for gmac nodes in jh7110.dtsi.
> Patch 8:
> - Added starfive_dwmac_set_mode to set PHY interface mode.
> Patch 7:
> - Added starfive,syscon item in StarFive-dwmac dt-bindings.
> Patch 6:
> - Moved SOC_STARFIVE to ARCH_STARFIVE in Kconfig.
> - Dropped the _PLAT/_plat from the config/function/struct names. (by Emil)
> - Added MODULE_DEVICE_TABLE() and udev will load the module automatically. (by Emil)
> - Used { /* sentinel */ } for the last entry of starfive_eth_match. (by Emil)
> - Added 'tx_use_rgmii_rxin_clk' to struct starfive_dwmac, to mark the clk_tx'parent is rgmii.
> - Suggested by Emil, dropped clk_gtxclk and use clk_tx_inv to set the clock frequency.
> Patch 5:
> - Suggested by Emil, dropped mdio0/1 labels because there is no reference elsewhere.
> Patch 4:
> - Removed GTXC clk in StarFive-dwmac dt-bindings.
> - Added starfive,tx-use-rgmii-clk item in StarFive-dwmac dt-bindings.
> Patch 3:
> - Added an optional reset single 'ahb' in 'snps,dwmac.yaml', according to
>   stmmac_probe_config_dt/stmmac_dvr_probe.
> Patch 2:
> - No update
> Patch 1:
> - No update
> 
> Changes since v3:
> - Reworded the maxitems number of resets property in 'snps,dwmac.yaml'
> - Removed the unused code in 'dwmac-starfive-plat.c'.
> - Reworded the return statement in 'starfive_eth_plat_fix_mac_speed' function.
> 
> Changes since v2:
> - Renamed the dt-bindings 'starfive,jh71x0-dwmac.yaml' to 'starfive,jh7110-dwmac.yaml'.
> - Reworded the commit messages.
> - Reworded the example context in the dt-binding 'starfive,jh7110-dwmac.yaml'.
> - Removed "starfive,jh7100-dwmac" compatible string and special initialization of jh7100.
> - Removed the parts of YT8531,so dropped patch 5 and 6.
> - Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.
> 
> Changes since v1:
> - Recovered the author of the 1st and 3rd patches back to Emil Renner Berthing.
> - Added a new patch to update maxitems number of resets property in 'snps,dwmac.yaml'.
> - Fixed the check errors reported by "make dt_binding_check".
> - Renamed the dt-binding 'starfive,dwmac-plat.yaml' to 'starfive,jh71x0-dwmac.yaml'.
> - Updated the example context in the dt-binding 'starfive,jh71x0-dwmac.yaml'.
> - Added new dt-binding 'motorcomm,yt8531.yaml' to describe details of phy clock
>   delay configuration parameters.
> - Added more comments for PHY driver setting. For more details, see
>   'motorcomm,yt8531.yaml'.
> - Moved mdio device tree node from 'jh7110-starfive-visionfive-v2.dts' to 'jh7110.dtsi'.
> - Re-worded the commit message of several patches.
> - Renamed all the functions with starfive_eth_plat prefix in 'dwmac-starfive-plat.c'.
> - Added "starfive,jh7100-dwmac" compatible string and special init to support JH7100.
> 
> Previous versions:
> v1 - https://patchwork.kernel.org/project/linux-riscv/cover/20221201090242.2381-1-yanhong.wang@starfivetech.com/
> v2 - https://patchwork.kernel.org/project/linux-riscv/cover/20221216070632.11444-1-yanhong.wang@starfivetech.com/
> v3 - https://patchwork.kernel.org/project/linux-riscv/cover/20230106030001.1952-1-yanhong.wang@starfivetech.com/
> v4 - https://patchwork.kernel.org/project/linux-riscv/cover/20230118061701.30047-1-yanhong.wang@starfivetech.com/
> 
> Emil Renner Berthing (2):
>   dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
>   net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string
> 
> Samin Guo (8):
>   dt-bindings: net: snps,dwmac: Add an optional resets single 'ahb'
>   riscv: dts: starfive: jh7110: Add ethernet device nodes
>   net: stmmac: Add glue layer for StarFive JH7110 SoC
>   dt-bindings: net: starfive,jh7110-dwmac: Add starfive,syscon
>   net: stmmac: starfive_dmac: Add phy interface settings
>   riscv: dts: starfive: jh7110: Add syscon to support phy interface
>     settings
>   riscv: dts: starfive: visionfive-2-v1.3b: Add gmac+phy's delay
>     configuration
>   riscv: dts: starfive: visionfive-2-v1.2a: Add gmac+phy's delay
>     configuration
> 
> Yanhong Wang (2):
>   dt-bindings: net: Add support StarFive dwmac
>   riscv: dts: starfive: visionfive 2: Enable gmac device tree node
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  19 +-
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 130 +++++++++++++
>  MAINTAINERS                                   |   7 +
>  .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
>  .../jh7110-starfive-visionfive-2-v1.3b.dts    |  27 +++
>  .../jh7110-starfive-visionfive-2.dtsi         |  10 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  93 ++++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 171 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
>  11 files changed, 481 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> 
> 
> base-commit: 11934a315b671ddb09bc7ac5f505649e9f2623c7
> prerequisite-patch-id: ad56ef54d3f2a18025abc9e27321c25beda16422
> prerequisite-patch-id: 1be0fb49e0fbe293ca8fa94601e191b13c8c67d9
> prerequisite-patch-id: 8b402a8d97294a9b568595816b0dc96afc5e6f5d
> prerequisite-patch-id: 5c149662674f9e7dd888e2028fd8c9772948273f
> prerequisite-patch-id: 0caf8a313a9f161447e0480a93b42467378b2164
> prerequisite-patch-id: b2422f7a12f1e86e38c563139f3c1dbafc158efd
> prerequisite-patch-id: be612664eca7049e987bfae15bb460caa82eb211
> prerequisite-patch-id: 8300965cc6c55cad69f009da7916cf9e8ce628e7
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
