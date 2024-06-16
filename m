Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EDDC2BA18
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AnmmNZhvRaXu8SvPOi+nWOyL23sNy9w0hqGcGZ62nVs=; b=xFQk7juY7pcQ6f
	3t5bxnTfPbf7LZpT52G7Ovd9v9Yop05K9lbefgVYzTTh/6rP+k3BGeHr/hV+R9MLXLTOJ3vabdwEv
	aNr6hldQ7RzxSFv2bjuXuEZl5BtUCTsMZHM+8KwLR2S5uvFOVwKPuGfQDFVyd6qS459GCdOtDe4mq
	6MwyZCK3rZP1o/h0PNVcOIegCtaK9yCUAVczgYgQukQF9kCrNiUMiLZBkkeKxEvJHC0rUaJAHP+ut
	7eTKjhGXSnybwXwxGhRUzGi3mLe123hogu6zW3m+GDidpx/3+PkNpopxcvCF1/qXC3vnP202/FPiN
	3PMsUQu5l0nNlha8t2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf7D-00000006SXV-0Cg0;
	Sun, 16 Jun 2024 01:55:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIf75-00000006SUz-2n34
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 01:55:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6e4dbca52f0so2484593a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jun 2024 18:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718502920; x=1719107720; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvNH5iGqBZh76l6k5VqaC65fZKHfbumS1HMa6kMl+Ww=;
        b=FyspCuVL0Epm5A2z04kdsply72zPzlAVGgor2QGvjukvxrDt7ketAvcV1w57Kg3qlN
         ad51nWPM40mT9DHp5zxdEoZgCd/ixR3uSS9Qn33tn27Qp+GbFSrrOA7J9r9CIflF5LcZ
         j17mStSEufa6t/n2ePc7xYVpHghY+xnS3VV35nRlfoDW+sxB7xfsnhePCrPK8kqYGkII
         2sYPY3CuIxwME1TNCgfaVeQzAjob691VTAAVXeqU5tk0tBPMnXlfOlKF2wypYtxjh+b3
         eZAdG6Uh7uTO9JoFi4Tra26X84mBxIoWj0JydNPAcKcCPIIMQuv/Oj6EBukpIXJHwdIp
         I/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718502920; x=1719107720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvNH5iGqBZh76l6k5VqaC65fZKHfbumS1HMa6kMl+Ww=;
        b=lbDVn9evDm7N9LxVq7qLcjufwQRpmqkyKBfUDuVJzwnXCGDpXF39ZNnwzDFI2XQ3Hm
         HIW5lRqKooHvawD5lidJ6VxMBfs1+kAkeSBvORmApje4ISyAxS+0I19s/Wgruwy9awWe
         TMeaDsO9vKrsHEQ2ZA4cxXkzQLpkwZA6eIMFhG9qF0iOibWg+2mNycvSoND7Tx6a8/tV
         J13u8eORX3Az/xNV7Exi8tFakX6ffVC1ZK2cxwdDZlhppdywYmjdVBWsj2ASNikfYu1U
         +YG/quQIeu2uij/BnlKr7grRTsPQmcudJbGqWzQLq1KWlh+WFDTl1l4wnV63dWQM57/Y
         IuIQ==
X-Gm-Message-State: AOJu0YzLoRvwe+NsXXDTmA/L4jFb1ZmiofrPcIsb0K+5njR7JmS6GoFs
	zGMp1g9MNfw6kass/CYI2YUoLdOQsgpu2MlPUBHOVA3VrSnQ0SMDgv2ZK1ch4wE=
X-Google-Smtp-Source: AGHT+IEm1y8qyu8PaaBUYkyOQbpK7u3h9Hx5y/jGO03i4VxxXa+YdnnEPwOPo/FGFhAGJrxSUEuU/w==
X-Received: by 2002:a05:6a20:6a0d:b0:1b6:15b2:822 with SMTP id adf61e73a8af0-1bae7f01befmr6559414637.27.1718502920190;
        Sat, 15 Jun 2024 18:55:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1cea:28dd:2ee0:e8e5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769aedbsm8751201a91.43.2024.06.15.18.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 18:55:19 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/6] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Date: Sat, 15 Jun 2024 18:54:29 -0700
Message-Id: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANVFbmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0MT3ZIMQ1MjA93knGzd5BRTC9NEC1ODFLNkJaCGgqLUtMwKsGHRsbW
 1AF6JvIFcAAAA
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
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_185523_787494_F0004242 
X-CRM114-Status: GOOD (  20.33  )
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

Changes in RFC v3 [3]:
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

Changes in RFC v2 [5]:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address

Changes in RFC v1 [6] from the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings
 - rebased on v6.9-rc5
 - revised commit descriptions

Thank you,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/all/20230515054402.27633-1-frank.li@vivo.com/
[3] https://lore.kernel.org/all/20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com/
[4] https://lore.kernel.org/all/20240425082138.374445-1-thomas.bonnefille@bootlin.com/
[5] https://lore.kernel.org/all/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com/
[6] https://lore.kernel.org/all/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

To: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
To: Fu Wei <wefu@redhat.com>
To: Yangtao Li <frank.li@vivo.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (6):
      dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
      clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   58 ++
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   12 -
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |   12 -
 arch/riscv/boot/dts/thead/th1520.dtsi              |   69 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1086 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 11 files changed, 1291 insertions(+), 61 deletions(-)
---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240614-th1520-clk-cd585a850d6c

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
