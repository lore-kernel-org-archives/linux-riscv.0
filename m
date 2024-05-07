Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30007C25B5C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aFZ+VVW4TzuLWIpPR+NenJ7neP1eeDnoaRLUNMiwdBI=; b=qR8hEn5ZfcRDcb
	MwutdXmvhKPIFga41vih4663wmail00AO/3okJJQxPNn7I9uIQlZCap89ej3yEptqy7NGU/NX41oi
	sygmVdlJfyu4RRkse3f/YMm25DiXMHyzQCDvJJIP5wjBluWv10lsJweZ7ydNIUd4vs/qPlK6KurnY
	5rQjoyj4zfbfCFcc00q4Tq1zV1OyHvTEHSC10SjK16mOzzfY2B9RRocP2BUTc1y4xNB0hKdfayQ8A
	nNN7rtgOrcoPCN0SaASTS6osO1eO9dgeZNtInrmQpoN2QGuSHpQ/02aCOrPhVSUf+j32Eu3aD03kC
	BOkj4kCSn+FyNDJKG79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtZ-00000009d3B-2oPE;
	Tue, 07 May 2024 04:57:41 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4CtT-00000009cxf-025C
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 04:57:37 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6f042ff9ddcso1236977a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 21:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057851; x=1715662651; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=waVLk68pwl0wnoLZMqeGSJBVn9GxZms6bUMETdjaegw=;
        b=MERIcHTM1L/Q+CKutn9obP5K8S7HrZxxmj42fkcynYRSHgdhB9C9mTvHSR/5luvlly
         T/HCV5A60OJLLbvu48WJMS9bf13Uq0YX0o0uzIw9hLFnkcyMThI1tsQ8r8nguN+VPhJ8
         FF2xRhR63oGwpvsfMl+EudkXPv9zRR0f4ZtDV6EQGhTrLgYZYH2fr1y4kosUAsLYjm4/
         ktyODXnLAtOXXyPgyrahEtRel05QmYq1DV2w7b4oDvMIsFaFK/5TvznIo0P/hCk4U52G
         ZqkIDPCNE3a7X+3gy5bas4I1H3Zrz1T4ojhgkpVC+kQgWnmNdZLexxVu+ImYC6IEcm+e
         yIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057851; x=1715662651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=waVLk68pwl0wnoLZMqeGSJBVn9GxZms6bUMETdjaegw=;
        b=pKuHavESXW9OEIWll3y10SJurTUqz9AcK1PugmFh9H/J7/IaTnSORccYJ0i4qq6mR/
         t+2tsgQemLJMD4pVcN4V30JK1S1agFMx5wZW8ixlnAW4qaILZUuja3uhEBf+3re8uic3
         LKSvWRB7LKobrqVLtdzzO5ujPD065Ck6i5Nil31oNhYsz+syiMNhj4xa7vwecaVKO40V
         OfQecgyuxp6gIq8BNHZR+ifzkTfUWg9SN9pn5Q3/4rocfYg9s87e5H3m5OnJ3PQ9zViz
         Ir8znIcv3AgC3woWvQsiLF/U/+3aPDj9N3eQl8ud3IW1zeNygFpNFk5XS+3tM03EBVrB
         rXLg==
X-Gm-Message-State: AOJu0YyAoD2XcKLKsTpHBqGLOAHUaSCO+SVC0+Wt6RbUFAOX1XOBG/o/
	SPlvHpr7h1ZYGmjV/wlVDkYkKZfCtETQxyd9ncpOd2dmeNfuC8QV/TWPZb8twoM=
X-Google-Smtp-Source: AGHT+IEdQBdDHh+kTKH2iegz5oZNNio4fA+PfCvxJrBMCJGCaCJIX70vmHdJ6AP/M5EO85tchFEWQw==
X-Received: by 2002:a05:6358:7242:b0:183:4336:b901 with SMTP id i2-20020a056358724200b001834336b901mr14530874rwa.5.1715057850154;
        Mon, 06 May 2024 21:57:30 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:29 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RFC v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS
 clock controller
Date: Mon, 06 May 2024 21:55:13 -0700
Message-Id: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADG0OWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNT3ZIMQ1MjA93knGzdJIs0i7Qko9TkNCMLJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAWlphu2EAAAA=
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
 Drew Fustini <dfustini@tenstorrent.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=4980;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Kv/msdpJ1elnStt/Fuiw74roHrhOO4hA59fpxGbOOkg=;
 b=y5ZAyWsd6EbHRcRpmYTlHiOaNM7wWAYKf19ARGrR1YmgZxDuVewz6AxKgNoDaevHGWQMTaFAF
 QWD93cAqpnIBRmvRk4UPB8iBdYWDDHlQNs2QympbvZUdLXm+LvLREVz
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_215735_091234_1211B477 
X-CRM114-Status: GOOD (  18.95  )
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

Changes in RFC v3:
 - Drop redundant new line and unused clk label from the dts example in
   the DT binding which I failed to fix in v2.
 - Add patch [3] from Thomas Bonnefille that fixes dts node ordering in
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

Changes in RFC v2 [4]:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address

Changes in RFC v1 [5] from the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings
 - rebased on v6.9-rc5
 - revised commit descriptions

TODO:
This is still marked as an RFC because I still need to make the
improvements that Emil suggested in v1:
 - Input predivider is not handled correctly in ccu_mdiv_recalc_rate().
   The PLL multiplies the input frequency and outputs "Foutvco". This is
   followed by a post divider to produce "Foutpostdiv". However, some
   clocks derive directly from the "Foutvco". These should be modelled
   as two differnt clocks.
 - Use devm_clk_hw_register_gate() for the gates
 - Use devm_clk_hw_register_mux() for the muxes

I'll post a v1 patch once I've addressed the above issues.

Thank you,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/all/20230515054402.27633-1-frank.li@vivo.com/
[3] https://lore.kernel.org/all/20240425082138.374445-1-thomas.bonnefille@bootlin.com/
[4] https://lore.kernel.org/all/20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com/
[5] https://lore.kernel.org/all/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

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

Thomas Bonnefille (1):
      riscv: dts: thead: Fix node ordering in TH1520 device tree

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   64 ++
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |   12 -
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |   12 -
 arch/riscv/boot/dts/thead/th1520.dtsi              |  118 ++-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1074 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 11 files changed, 1310 insertions(+), 85 deletions(-)
---
base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
change-id: 20240505-th1520-clk-b8f8fb2ecf28

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
