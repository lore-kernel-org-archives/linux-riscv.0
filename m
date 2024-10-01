Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA41CE837A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pjo/w3/7Aak+6jhij57IKa/H3tkVphh24cWpt+WClqY=; b=zxUaASM0cXRmHG
	ur0SCJuUSPUhc1wu6g/Q+89NRkfBVMraToAEXBaEXVD47wb3x4ArXPOWUFHaRJolv/Xd8+JiIivkc
	H54GL0HVfLdDdLYfKFUUtPsu32EqpsMqQ/LnEyBkye77bYK/Ub5J3NVOcKPctXmtO6FOtP5vx9ygW
	7I3NZYBtgPvuK2rwc17/watCEJyrwmWJGw6WPx6gykDKX9KfOXE8M0xbRWGugU1pve52fpC6d3GMv
	a8ce79oxxZvy9YZq4doW/EKzPm3TTslq5m5169njhTFa+9c9fInZ5emeFvhd3g0v6UJUuwjz2+bbM
	veOemoCIyHo/O58+7klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWJk-00000001jxa-3y6h;
	Tue, 01 Oct 2024 06:25:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWIT-00000001jeU-3w9n
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 06:23:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7e6ba3f93fdso3240000a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727763825; x=1728368625; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W+q1bYkfaGa893H/27+8NsQZ36xTulPFgzj3nN7/MB8=;
        b=LdhqeB9Snqmj9c/LbHEq0BtLltdM2NER+C3Z/h3+/Qi0OLYX3i5guY0F084wLjLnY/
         D94FqueJKLpFOer0SgZ6PexKNQm6TG8lewcpPx2ArR64JcjxuUA86VZpdh7xecAsJzhb
         sacWmkZaVNTdOxHtBwK5gRpXS3P1W5C0/X3IcxI11SvYOqdG8YO+OTWdHgWySNwMLkwq
         nBvAfpOC+Kfpn2fu1bxbCXIi2pcU9+xDkoAplHo0z9QNIoi8iwI5TBJr3m5sKN3tIaSX
         NuhZx1JjA2U1/r21oFwUjOJoZt1ScQ+NWV/JyKkt2b+0KjHpDpZMBNlfwQuCh5ddFBvS
         mY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727763825; x=1728368625;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+q1bYkfaGa893H/27+8NsQZ36xTulPFgzj3nN7/MB8=;
        b=hp+s5jvXDukikSTLXWLt1bqt8GU/r1rxc5kvqo5xgeDlUxBnnJgH/6f9k3x6sNMKgn
         sD+uW7OcDNmul3FOg+Qtlf3aosTiYwdcggBtHfqlHgNbXhV7Y5P6KtDUzhheL6Z6jJ9t
         Brnr/nwNbXXSryHhqB2jvyD/Ezma60Cbn5B1ckOC5tjnbZuKC18ZxXvT1ru4ZBcu57tM
         14UbGHiYXK29GhD1JZrAlOTFebS1Q6DVl/KNyHfAkfWSKoOPv58VZrYiLJ1LGPz2XjBg
         3JH+WRKdH3uuUPlIyMpbN76tehULBxz588i/KzTz9NwLAORlVwXomvGFfEbSSlc8dp5/
         3Fhw==
X-Forwarded-Encrypted: i=1; AJvYcCWTF9qK3pOZ+ejmHda12y9P5DWWTEc2+9F+RAMZnBNCVBvWCihr82JTYpo334puymCraipVMObiY5eO2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw474Um4pj8oXqBu09mG4v8Z+LxRG5wSCOQ2mMl4ZJcI47D9Xa6
	qrfq9DAz5byQhHsFj5tyoE0LvnNpLMie5dkbFrxw+GvPesnwsy3X7ugOfRrJQoo=
X-Google-Smtp-Source: AGHT+IEkhgSmX+RGtd3vmzudwdHgedS3ETir5Ngx2WIar+CdDO/B+TgTsD/9vvMbqKQfM2/28VijBQ==
X-Received: by 2002:a05:6a20:9f90:b0:1cf:3885:b9d8 with SMTP id adf61e73a8af0-1d4fa6cfd38mr19206388637.27.1727763824817;
        Mon, 30 Sep 2024 23:23:44 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264ba68dsm7267804b3a.57.2024.09.30.23.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:23:44 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 0/3] Add the dwmac driver support for T-HEAD TH1520 SoC
Date: Mon, 30 Sep 2024 23:23:23 -0700
Message-Id: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFuV+2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS2MD3ZIMQ1MjA92U8tzEZF1jkzTTlBSD5OTkNAsloJaCotS0zAqwcdG
 xtbUAVYXE4l4AAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_232346_018870_CFF586D8 
X-CRM114-Status: GOOD (  20.23  )
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

This series is based on 6.12-rc1 and depends on this pinctrl series:

 20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com

I have a branch with this series and the dependencies:

 https://github.com/pdp7/linux/tree/b4/th1520-dwmac

Regarding clocks, the gmac nodes in th1520.dtsi have the "stmmac_clk"
clock set to CLK_GMAC_AXI in the AP_SUBSYS clock controller. This
corresponds to the enable bit for the GMAC axi4_clk gate which is
handled by the clk-th1520-ap driver. thead_dwmac_fix_speed() does not
modify anything in the AP_SUBSYS clock controller. It only writes to
GMAC APB registers. It seems unnecessary to create a new clock driver
just for the GMAC APB registers. Refer to section 1.6.2 in the TH1520
Peripheral Interface User Manual [1].

I've removed the properties that I added in v2: thead,rx-internal-delay
and thead,tx-internal-delay. The units for the delay field in the rgmii
delay control registers are not documented. Andrew Lunn suggested I
just hard code the delay field to 0 since I don't know the units and
the boards work with the hardware reset value of 0.

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs

Changes in v3:
 - Rebase on v6.12-rc1
 - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
 - Remove unneeded call to thead_dwmac_fix_speed() during probe
 - Fix filename for the yaml file in MAINTAINERS patch

Changes in v2:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/

Changes in v1:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |  97 +++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 129 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 291 +++++++++++++++++++++
 9 files changed, 673 insertions(+)
---
base-commit: 6b16e599500bd0002164d9edcb8bf7652d9888fa
change-id: 20240930-th1520-dwmac-34f5dd0cccf8

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
