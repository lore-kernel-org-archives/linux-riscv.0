Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B758C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8mWkPFq2Yd+I/JoNb8nDPnZ0mgwhMAJYBNJxRd0M5Z8=; b=L+BYk2P7DZuNNl
	ALtCUwOqVibSuX/qTD/8bgtnaIcjoGS7SfUFDMrlvaPpd7sCG5L6yQX65ATtd8dXy1jjYnMH3g1TK
	X9ol51b5Dml/z6kY22MSNZ4mrHezPwxpwQ+TH3cX1/vue/DQQy4EoNay9SOPhll0En8qmLRUioIVk
	m8bFQJD3WJHjIcTpHf2QL0wh9phHa8dOmNGCbsku78Vxqqb+ikfFMtmWWaWv/2Qqb8UjZ7GJhtXwv
	h/An46e+MJku5lANx7MekV9NVItI6h6E0+oT1Yqnf3A5+plVzzbap9KmaPy09nx6vmoOgW03DKAyp
	3vHNIRQuD0WHpwhzz2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5q-0000000ElZ0-2F0C;
	Thu, 11 Jul 2024 16:56:30 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5n-0000000ElX9-3XSE
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:56:29 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3d9dd7e5f6eso622814b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716986; x=1721321786; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhr3664pgzsPVbVM9TMlydj6PeeipJCxcTuOvriuu8Y=;
        b=Xc1O5LspH5yfI1UHA9wduuaBF5FMnxHJtGkUOiOunxEh7bJ4vUVV0zeAEB31g5fVFA
         CeCELNFkT9nV+f1pRuWBtalsWM0PHB3obHRi7RSkz8Mq2CfrQvEYgErdYNrpJjkGz0Ab
         9HiDLOu1a3JT18JfpS0HklbJJZ8+QcFqGGlPNk/Mdp70XVvWKSbcEEuKjSWFyAY4Ayr5
         emETfhkmILXzh/RSnzo8eVzsaRGIVhCO4k+r537pfqEsrWZAR5P0zylxDmBb+2FZh8ew
         FvLhZWwyMQ5vNkU9KJgVHdwmGk8ROiCHq2U/N3TpfwftZj4gAxXo1kthvM8NGCQ+rk+b
         dLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716986; x=1721321786;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uhr3664pgzsPVbVM9TMlydj6PeeipJCxcTuOvriuu8Y=;
        b=ODdJbHQzMOOKaaqDv8AN4xN+c2DnAOFJ3Y63LfJnE3f9keuQNsBiWv7FGPZZJdcI/v
         F638avEMFExHYz3rPzAxGcva2Glg+GfalQ33tu6nnudQ/aWGaid2S3lXXfyx2tN+L+2X
         AKIp0nZbd6Tk1jLQUF2fPfRezy9CgdSnkMfblQkevTBg6pnOPv66FbBV2TaRb2N+yaPZ
         sA3Kc8rpjADI9I5bofyglpzaTE/RgBY3jbxRKeS+sGktcMb8AGFnJjoUJTKJSxwG8SM5
         fbzs/4d4xBNZCdnzkN5mHmmcsPeCzgNjV/o/uv4wEyH/x3oxOqVw8yk2IGRLq+8nzyy9
         cfGg==
X-Gm-Message-State: AOJu0Ywa/+U3a30/Aj4ASn3+7vV9CIe2ej/mPSWbZCn+tik9TtQIYvqg
	lSX3lXJ/IOOTHCZOuuLFpZRCwSq4xZeOzuUn5kt1TG5Z/0b7PTlRQ0YY6idnI0FAz/6JKshLKhe
	E
X-Google-Smtp-Source: AGHT+IE43ZJH2LFhQTINfIakZgTQfA50ql3uXt7MpIZiMFSUweWWsVGkY82v2L0BWYAP0CjJVvhIyA==
X-Received: by 2002:a05:6870:c34c:b0:254:96ec:bc44 with SMTP id 586e51a60fabf-25eae88a6d3mr7072740fac.28.1720716986246;
        Thu, 11 Jul 2024 09:56:26 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:25 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Date: Thu, 11 Jul 2024 09:56:18 -0700
Message-Id: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALIOkGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MD3ZIMQ1MjA93knGxdg8QUS3OzVKNEE6NUJaCGgqLUtMwKsGHRsbW
 1AH6BLJBcAAAA
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=5438;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1pS4EYjsNn3BXZfRuGoxZnqmwVe33N0u3aWOchDQoRA=;
 b=uEAXxeZVrDYQjqzTdPCnXigOhQhfpt9gooEApJADDF3FW5O8a32yNOYGEDqxwPmfWFi+XpfXd
 aobxfmzc/KlABCFDshVCbYzVR+vHfZrdao9pTTGxtkUuNPVtDLJqQMr
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_095627_935233_4A352C40 
X-CRM114-Status: GOOD (  20.26  )
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

This series adds support for the AP sub-system clock controller in the
T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
2023 [2]. Jisheng made additional improvements and then passed on the
work in progress to me.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
Link: https://lore.kernel.org/all/20230515054402.27633-1-frank.li@vivo.com/ [2]

Changes in v3:
 - dt-binding patch has been applied to clk-next by Stephen but I'm
   keeping it in the series for completeness.
 - move dt-bindings include after linux includes in driver
 - change rate to u64 in th1520_pll_vco_recalc_rate()
 - replace do_div() with normal division operation in both
   th1520_pll_vco_recalc_rate() and th1520_pll_postdiv_recalc_rate()
 - add static to ccu_mux structs: c910_i0_clk, c910_clk, uart_sclk

Changes in v2: 
 - Add clock property to the gpio nodes after Conor asked why they were
   missing. These clock gates correspond to enable bits in PERI_CLK_CFG.
 - Drop 2 cell address and size properties from the binding example per
   Conor and add Reviewed-by from from Conor.
 - Link: https://lore.kernel.org/linux-riscv/20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com/ 

Changes in v1:
 - Split th1520_clks into groups for gate, mux, div, pll
 - Convert gate clocks to devm_clk_hw_register_gate_parent_data()
 - Convert mux clocks to devm_clk_hw_register_mux_parent_data_table()
 - Split the PLL recalculation into th1520_pll_vco_recalc_rate() and
   th1520_pll_postdiv_recalc_rate(). Based on Emil's comments in v1,
   add logic to handle the fractional portion of feedback divide value
   when the delta-sigma modulator (DSM) is active.
 - Drop clock-names from the binding per Stephan to avoid relying on
   anything other than the cell index when describing clk_parent_data
   (note: I dropped Rob's Rb because I changed the binding patch)
 - Rename reg/reg2 to cfg0/cfg1 to match the SoC documentation
 - Rename struct for pll clocks from ccu_mdiv to ccu_pll
 - Rebase on v6.10-rc3, remove the dts node reordering patch from v3
   now that it is in mainline
 - Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com/

Changes in RFC v3:
 - Drop redundant new line and unused clk label from the dts example in
   the DT binding which I failed to fix in v2.
 - Add patch [4] from Thomas Bonnefille that fixes dts node ordering in
   th1520.dtsi. Conor has already merged it into riscv-dt-for-next so
   the dts patches in this series are based on top of that.
 - Remove fixed uart clock and converted uart DT nodes to use clocks
   from the clock controller.
 - Remove fixed apb clock and converted the dma controller and timer DT
   nodes to use a clock from the clock controller.
 - Made ccu_disable_helper() and ccu_enable_helper() to static functions
 - Follow the advice from Stephen Boyd in Yangtao's original series to
   not use strings for clk tree topology. Created clk_parent_data arrays
   to be used with CLK_HW_INIT_PARENTS_DATA instead of parent strings.
 - Rebase on top of v6.9-rc7
 - Link: https://lore.kernel.org/all/20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com/

Changes in RFC v2:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address
 - Link: https://lore.kernel.org/all/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com/

Changes in RFC v1 compared to the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings
 - rebased on v6.9-rc5
 - revised commit descriptions
 - Link: https://lore.kernel.org/all/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

Thank you,
Drew

---
Drew Fustini (7):
      dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
      clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      riscv: dts: thead: add clock to TH1520 gpio nodes

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   53 +
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   12 -
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |   12 -
 arch/riscv/boot/dts/thead/th1520.dtsi              |   73 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1089 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 11 files changed, 1293 insertions(+), 61 deletions(-)
---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240710-th1520-clk-0ad976e2a42e

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
