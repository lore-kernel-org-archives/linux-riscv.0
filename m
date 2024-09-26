Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9441ACDE02B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PhHmRkK1i5Y7i/u13R85wS5DalkVDfqcXnaK5NQatxc=; b=N7Ahx6twuzxwGc
	YGomPHefcs8Uu7fcWO7O8D2uPv8hexPvipG0ccZKbnvHGcb1hJHWWNIe1ELI+KCDeVYjKFob4b2Hv
	HIZraTgVRyUy7GaOEPp8ZzMj4h0X+uZElx8hGuDrswVjJqEIyTkl4aMBIfhPlWqV+91gZ5HF5PC10
	1dx62/gMb1vp+iduCLzBFfq9ivSytAY0o/6MvKSargyn7eYxu8sZDzehbaa1HPsqKdQaWODQVCHVd
	DMc2R2ybMbERiUdi4JCXEeQ85lCTjKrstuGCoSfkxezQVfbxV/wSd5xPcFm8Y7OO6OAh4/Jmk+aSN
	Zx4OQY0YfO53LKpyiueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stt2p-000000096UU-1iSx;
	Thu, 26 Sep 2024 18:16:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stt2J-000000096Ko-24Z7
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 18:16:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-207115e3056so10925285ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 11:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727374577; x=1727979377; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BafvbNIW0TpRsFlOtdIQQkficdW6Q756VnEt7t1F6Gs=;
        b=SHvDFA3PO7kU0JuiL6XxqxF/b+G7bS+vUXdFWaUXNKz685VHzBLoBKMrBO185tPF/e
         n6av27ZTAui5ELO46fgMOhGkZvSoAqlrHyrYEJvd1nPUhKYtQ3vW3XLQbwYXAOzKL9yS
         hgJOgXDhLUn0AJVyarFnZt1A8EGkP6Yct4XJMqiP9wO7/BrBQ643/ePboweTCzP9HEkt
         m8wCf/66wTMgHTBsJchk1CwrdkKkqdBG0THBkY2ZEwD+dWncS6GOxn5G81tDBQhUPWGq
         2a5KPon+KMRqVH5svnlETAY5yAjlHpIlDmal3MtpITWXYZQqZDmE51hBDRqaeUPVV2cf
         X2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727374577; x=1727979377;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BafvbNIW0TpRsFlOtdIQQkficdW6Q756VnEt7t1F6Gs=;
        b=nDlVoiLyKmq/OqwgaUtilLLlaPFomkf9iTpW58eHkv1OdsAk6hYGDmuU6yTWoH17Hk
         jrDOQXk4y4PvVKYbWq/+nmIjVn4Bngt3wwyUZSKt1Mnf/xjizCTvacxR5gTBhRZwgRDw
         ee8HyO7nVtRhfDcMDT83UNr0iEkXAgCOa/PUZCJej0WQqcOxfK7g0OQUCZ8tfi+p9R7p
         82xbvkhpEqShHQbh1XHjmOQk9+8jDRSWTsiK7E4JVfzvLNjvg6ngruVTJTY0+zBXVLLp
         l+0xEJhLznt2COko6teGkcxNrOrcl0Caj2VZ/e8OCilfEGQ7BeEIU0I+rwhcJ25klnVd
         3Ueg==
X-Forwarded-Encrypted: i=1; AJvYcCU0i23iLNUntPnk0qdUL7kgtD8g8fH/cyH46lLHetOxg3qpV5bv/2kCdw2WBoH1nMdHQa+Sh44mkaz54g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3OMBbfhRmxos00M3E+vMiNMusk0+SrwQp3zcDCyoIKlGOaPjj
	COHdArfX9gm0+TCu9ZOPNh0xDD/jLQHtmbeDyMfCEm3T0T5BB3ribQPRkKQ33dc=
X-Google-Smtp-Source: AGHT+IEyzkN+DIrx1wACmvKc5dT19k6znIBitdGcdcuefU2qZ7VOn0P7BZP4KJHexxJOOBaRiDJ4Qw==
X-Received: by 2002:a17:903:1c9:b0:1fd:5eab:8c76 with SMTP id d9443c01a7336-20b37b74f55mr7481515ad.41.1727374577120;
        Thu, 26 Sep 2024 11:16:17 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d5ef5dsm1454145ad.32.2024.09.26.11.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:16:16 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v2 0/3] Add the dwmac driver support for T-HEAD TH1520 SoC
Date: Thu, 26 Sep 2024 11:15:49 -0700
Message-Id: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANWk9WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNj3ZIMQ1MjA92U8tzEZF1T00RjI4PEVAPDRDMloJaCotS0zAqwcdG
 xtbUAQM7eAl4AAAA=
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
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_111619_600145_735AFB4C 
X-CRM114-Status: GOOD (  23.03  )
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

This patch series is based on linux-next which contains the TH1520 clk
dts patches in my v6.12 pull request:

 https://lore.kernel.org/linux-riscv/ZsWs8QiVruMXjzPc@x1/

This patch also depends on this TH1520 pinctrl series:

 https://lore.kernel.org/linux-riscv/20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com/

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

Regarding rx and tx internal delays, that same section in the manual
doesn't specify what unit is represented by the delay_ctrl bit field in
GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
a max value of 31 seems too small to represent picoseconds. The vendor
kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
rx and tx delay properties so that is what I've now done in this series.
Note: the hardware default value of 0 for delay_ctrl works okay for the
TH1520 hardware that I have.

There was a question in my v1 series about if the phy required a delay
after reset in the BeagleV Ahead device tree. The board has the Realtek
RTL8211F-CG phy [3]. According to this datasheet I found [4], the reset
pin must be asserted low for at least 10ms for the internal regulator.
Software must wait least 50ms before accessing the phy registers. I've
now added reset-delay-us and reset-post-delay-us with those values.

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
[2] https://github.com/revyos/thead-kernel/blob/lpi4a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
[3] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/BeagleV-Ahead_SCH.pdf
[4] https://www.lcsc.com/datasheet/lcsc_datasheet_1912111437_Realtek-Semicon-RTL8211F-CG_C187932.pdf

Changes since v1:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

Changes since Jisheng v2:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20230827091710.1483-1-jszhang@kernel.org/

Changes since Jisheng v1:
 - rebase on the lastest net-next
 - collect Reviewed-by tag
 - address Krzysztof's comment of the dt binding
 - fix "div is not initialised" issue pointed out by Simon
 - Link: https://lore.kernel.org/all/20230820120213.2054-1-jszhang@kernel.org/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 319 +++++++++++++++++++++
 9 files changed, 719 insertions(+)
---
base-commit: eb9913a02c55913317dcb4797026f958ce2c97d5
change-id: 20240923-th1520-dwmac-55a320ae01a6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
