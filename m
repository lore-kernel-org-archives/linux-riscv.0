Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F384BC4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W7gTdmc2Ct0YVhi7Yp6QClX4HF8vf1T8qfQcJ/YBzg4=; b=1Iti5+34hBwSeR
	MpAxgoO1Nd8TqsUXdxMfWkTc0wv0GMrWAQsTq/DEi/CnZseZ2UlxyHZgkuVJgcfgbquIqgyr2NMVU
	az2GhnOZhms/fIbu6MpLRWWiy6lD5kTpdHhefpEkt4Cz6pxrjQGoepjFYiA5+peJDWctSeOKnLNVT
	xzw9gBRKHY2+yO6tvmJpt5WqZASHOdRZ9jMx3OhA5gAa9Gfi7Mpm/bM66SxekRde8/y5704vB27Dz
	nf63OTqOEQHYqYVW4cYFLedk58i3ky24tr5+deyjY5OKYG4DCCAJb46chda1tIr8so//CBZMDp4jn
	Be/ZARqqkWu+L0qV9ckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbYh-00CwMO-2w;
	Wed, 10 Jan 2024 16:36:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbYe-00CwL3-13
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 16:36:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d4ab4e65aeso34762115ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1704904557; x=1705509357; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUfXOVWjFppBmkTP9/JtvhS+iSH/scaSCcV++osCkg4=;
        b=EFH9NTJGnJsh2q//xl+A8EYtHD0x+nhGn6JZU3QCeuSiMwh4HdY5b+NnJV3ZEbaFID
         10ypHKv/e7F5bYyGgwcL1sQAriYa/9Efs1Xxnr4Rb1ThGeW7YlpVggxPbUeqNhMvgpea
         vTNG06OrVhI6UoyoMGSsV2G3zl12otRkMzco2I7tL+a+2a9B+WeThuyQAe+SKRbcMKAL
         1UFqIx0NP4ErPsquqxS3dOlCUdq+MaVwsm7Fn+B4Y8aeQ9UB6oto5MFwebvMv9YCo+iG
         Ud3jm4k4SBALZzrV8m+GNqGTdLZkPLtbzJ/aRk9vJe3CrMVq/ipLDK3vGnpJqwnSFJ28
         CfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904557; x=1705509357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUfXOVWjFppBmkTP9/JtvhS+iSH/scaSCcV++osCkg4=;
        b=auekO0BICNn0bhC0jMBqllByUMxV4LbhtNOIzEjRLTd4HFxmYUnIXefc41EOMPEkJW
         YvAYRV4VpRrUps0OqFJkhG3qUU5dNkkv7NifZRwSMzbhI2aIE/3uIx9i/Pux6AfE88pX
         pu8pgutfpZlDb/MsBHDaPFxxUO6bKpPOa1KtfzlnVPl1V91xxqlOzjC5/IZxIW4LV/Ws
         SZ/xusReYTSC4fuJbm+XdEkqwV5+ZQzJP/ejhfyCReBlDL4r6AqIG3JEKLC9L6dzSXV7
         N5nDwd8SO27iH1D5FBoHvyT1Pr7aMLcNbBm7BpaXFj1SyWw82Zeby780BZj4wd7U+voi
         TFng==
X-Gm-Message-State: AOJu0YzVOml3zp6094eTNccF1WDbOGmUbvdlzxNHvnGfyoxI4y29x86h
	P+gYBOirTraRcjkV6yY/fOS2XBAO/VQoww==
X-Google-Smtp-Source: AGHT+IELbgnMH0ltz/uBIUx7pCZ9sWm8n1TjbxqSStE2MTG0+o4QTGL1FeKISXzpn48z88cNXmnpkw==
X-Received: by 2002:a17:903:124a:b0:1d5:65c7:dea5 with SMTP id u10-20020a170903124a00b001d565c7dea5mr368928plh.35.1704904557138;
        Wed, 10 Jan 2024 08:35:57 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:858a:4f95:cb29:907c])
        by smtp.gmail.com with ESMTPSA id p20-20020a170903249400b001d4b5e444d2sm3872265plw.48.2024.01.10.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:35:56 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RFC 0/3] clk: thead: add support for T-HEAD TH1520 AP clock
 controller
Date: Wed, 10 Jan 2024 08:35:14 -0800
Message-Id: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAELHnmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwNL3eScbN2SDENTIwNdY0tLEyNLI0vLFFNDJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAtAQHxWEAAAA=
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Xi Ruoyao <xry111@xry111.site>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Drew Fustini <dfustini@tenstorrent.org>, 
 Drew Fustini <drew@tenstorrent.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704904555; l=2938;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=uYm/4xZs1+S7XBO0sv9/6rdMfUgmhq4fXQa0VDf/0xI=;
 b=2FFXTCrI1s1CiaVfwXB8XhukXEsvF5hrYCBYiXXPHwq8UfGI0eqE8RV6ocp8CsnYaMDazKEF+
 C5KmMTEj5uzBXS8I0wRPWllTrjOq4lRPQRxyRP7ELnCqw5YB00qCY84
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_083600_371331_A651717F 
X-CRM114-Status: GOOD (  15.03  )
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

This series adds support for the AP sub system clock controller in the
T-HEAD TH1520. This include CPU, DPU, GMAC and TEE PLLs.

Yangtao Li originally submitted this series back in May [1]. Jisheng
made additional improvements and then passed on the work in progress to
me. The driver code is cleaner than the version in the T-Head SDK [2].

I fixed checkpatch and dt_binding_check warnings along with:
- deduplicated CLK_NPU and CLK_NPU_AXI number in header
- corrected the npu_clk enable bit
- fixed c910_i0_clk reg typo

I am marking this as an RFC because I have not been able to get the eMMC
controller to work with the clock driver yet. The T-Head SDK does have
full clock driver support but it still uses a fixed clock for the mmc
controller. I've not yet determined why that is.

According to the documentation [4], the "emmc sdio ref clk" is listed as
792 MHz in table "4.3.4 Clock Frequency of Key Module". PERI_CLK_CFG
contains the clock gate. 792 MHz divided by 4 is 198 MHz which is the
fixed clock frequency used for the mmc controller. However, I can't seem
to figured how the divider is controlled for the "emmc sdio ref clk".

Anyways, Emil is working on the pinctrl driver and Conor asked about the
state of the clock driver [5]. I thought it best to send this RFC now so
that discussion can take place on the list.

Thank you,
Drew

[1] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
[2] https://openbeagle.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/clk/thead/clk-light-fm.c
[3] https://openbeagle.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/arch/riscv/boot/dts/thead/light.dtsi
[4] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[5] https://lore.kernel.org/linux-riscv/20240109-boggle-frugality-03a77cab8308@spud/

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Jisheng Zhang (1):
      clk: thead: add support for T-HEAD TH1520 AP clocks

Yangtao Li (2):
      dt-bindings: clock: Add T-Head TH1520 AP clock definitions
      dt-bindings: clock: Document T-Head TH1520 AP clock controller

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   65 ++
 MAINTAINERS                                        |    3 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1018 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk.h       |   96 ++
 8 files changed, 1198 insertions(+)
---
base-commit: 8cb47d7cd090a690c1785385b2f3d407d4a53ad0
change-id: 20240109-clk-th1520-399429299d51

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
