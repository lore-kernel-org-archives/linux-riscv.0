Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B696C3DA42
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOufj0k9k/T99AmfkKBXoRhtK31nJ6wnMo5vjWe5WcA=; b=hcjGQ5EnkW9HQL
	5in4xBPh8T+o7atokqKAZeVtrnWEArJYzmxQaLFk0dBtpg+nEjQt4YjnVXhWBgpZM/9zt+pqXp+7L
	0ig/yqwQMblJt0Sxp+n5P0xygd3tv/BtAWrc8B+mFcr/Yba9Y50QlYLDrp5zEI6u5vdGnpft1Wjaj
	F392dvDx18loZb/VRlaXAUMD4NcvuwsmrCKPPRJxv6RTw9oiNwSNwvvDNYeu9MTnd3m0nAb4JXY8b
	oeHQVrzWTa7othD/ZVKHaNxN3bnwxvA7aBzcFGYGsjYSlGR8mJfTRhzrzFgjpLS4mLIFhM/DK4myv
	zxETv1ubqZiU0yBKN15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlKw-00000003IS6-09PN;
	Sat, 13 Jul 2024 22:35:26 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlKs-00000003IPy-3GIW
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jul 2024 22:35:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-70445f0d9b8so1892774a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jul 2024 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910121; x=1721514921; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59P5oqU7NcCQSekZycQB8SHFulzZjU5cylTceccordQ=;
        b=pXR16lqFza9gg4E+Z0DJcRV5kxxCYkrHv0wNm2pcipf2mco+APgRzcm0UuH59eFql+
         RcWK2N6I8ru6PHp3+9jU/hfQfdQpWQ4vKNVGmNftxkFF4juHHtmt6wj2LU08spuCrugS
         unsZKEWkqmqEYhkJkbbsEJGtsoW+98m+5kDqiCKT/l9CmZgCHoVFttM8Qvqi40iAS0xj
         ssZ9ORozpyZ09gJkTKZEcgqPwgULZeupGArsMCJwy73h4ZrrToGuEI3WTUWK0e4uwk3/
         bN+PruYnh0fndG8mgSEOAPuyGCHX/dEmlWWvcZ2DCr8v9J8lN7OoH6sxp1vsQ1bTZAG7
         sIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720910121; x=1721514921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59P5oqU7NcCQSekZycQB8SHFulzZjU5cylTceccordQ=;
        b=X66AWU6QUTAJDYH4hXj9Rs+I6iKXEjL4tpeJII0YZh3pwMd6vG30J5TZilGo4uaA97
         5oS5R93Vl8pAUY3TyNWRfnkWw0xjzXC1fzQ96IYms33OB8GFzn4vVQtthq/6nGucqnXY
         zyVGbrWF1fUOTKetwgwz1uQqOgPnTC9QYFyY2/0ASmmyh0bl2BzEcjKK3HOBI6hWSSty
         ZSYcpoQtpTg82vRJZnbgXbyyHVggRGaIaj4KBsLruWiXrJMdrPdlHnrP1leu2wmou2Mj
         RM6WCV3d6ubFEexuutVh32M9gyi5C8Mh21E6k/g0lPURVFTAldKd9RLrTmKmPoJKzszz
         OXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURe0irkdLNOJkdYrplKG67qWPhVzCqIjgQ8B0QoSpNEl0zd/ErDv4dmgOJhJKdrTmojCg6n5sxJcBh0OjRBqKjG/NzSk/63d4oTtzLR5/P
X-Gm-Message-State: AOJu0Yz3O1+s3uS4SZATeXOmgy6xw0bL9ooKGWEi27xZXpc4JqN1rnsR
	0OBcZpIill79g+W7avSEXgLy1OAdBIjCjEHHn1EE1kId0l6fIotxyOjcrkDaxWs=
X-Google-Smtp-Source: AGHT+IEg9antJl5Um5shbWWC4aJSAEXG1X4QgFtAyLnt8rqbE/pGgSXXmoU49K8Rk27lGnV7pllKRA==
X-Received: by 2002:a05:6808:19a8:b0:3d6:317b:a95c with SMTP id 5614622812f47-3d93c07512amr17596782b6e.38.1720910120935;
        Sat, 13 Jul 2024 15:35:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:35:20 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Subject: [PATCH RFC net-next 0/4] Add the dwmac driver support for T-HEAD
 TH1520 SoC.
Date: Sat, 13 Jul 2024 15:35:09 -0700
Message-Id: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB4Bk2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0Mj3ZKM1MQU3ZTy3MRkXcMUE5NkE3OjpKQUUyWgjoKi1LTMCrBp0Up
 Bbs4gsbzUEt281IoSpdjaWgC5/rGAbgAAAA==
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
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=2542;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=w/NbNx0hQrYCCt4fhGgjxPcsuaVQDgpxDwOcni8EUgY=;
 b=zhSGOkCGTA785OB0MaNJWsmX/0kLmkWTEMMzX8DoIdS3pa54QR5Rc1GW96RessAlJhjWKCsbm
 OZwPPbSVHNBARLIGPxYzRew0qKbsZpMAUxb9mzEk1yLH2//jZDwblTr
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_153522_905404_2F7342A8 
X-CRM114-Status: GOOD (  13.11  )
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

I am marking this as an RFC since it has been almost a year since the
previous series and Jisheng has handed it off to me. There was
discussion about the syscon for the APB registers in Jisheng's v2. I've
gone a different route and switched to adding a second memory region to
the gmac node:

  dwmac: DesignWare GMAC IP core registers
    apb: GMAC APB registers

This patch depends my clock controller series:

 [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock controller
 https://lore.kernel.org/linux-riscv/20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com/

and the pinctrl series from Emil:

 [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
 https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

I have a branch with this series and the dependencies on top of 6.10-rc7:
 https://github.com/pdp7/linux/tree/b4/thead-dwmac

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

Jisheng Zhang (3):
      dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
      dt-bindings: net: add T-HEAD dwmac support
      net: stmmac: add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/thead,dwmac.yaml       |  81 ++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  89 ++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 131 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  55 +++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 300 +++++++++++++++++++++
 9 files changed, 670 insertions(+), 2 deletions(-)
---
base-commit: 568c4e4b646777f3373f383cc38864a3cd91bbb7
change-id: 20240712-thead-dwmac-1d44c472bbd5

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
