Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFACCCA47F
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QHNRVNGOxvBznKsfVUzyOiy+F0pRS2bTuovNcd2bx2E=; b=k01oUyCRZJPjtx
	lS6GZ3+IcwXJ0eJhjxm89+OUG2Sc31FQnLioM6pBTRd0tSpJg2i4HG1AhfVMa8/N66jPKVKmsZjjb
	8Trg8e/S+/dTjgIb5kyZm2h8CVltGPuRrii4bAp8ss0C7ViixEosvOpi0QN3yiq/AX4d624ot97jL
	gCs6eh4JHg8wUEWdTyZFDFJML7OmRFclW7CwGQBwkozbah15chROk839EdXhSzoSt6X+tZCC+XoTy
	3R3kb6goytXXEy849SblmjPEASVmICwnPPQqNf5MsYZaWBmuDpNbbL/QgLfdAPAuT9KJ65pqARU+c
	2YrhpnYmfuDXShx+1mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7y-00EjOB-Ry; Sun, 19 Jun 2022 16:50:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7w-00EjMZ-Ih
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c21so11684812wrb.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LfFFeUv/WOce2TVGlWA/kbyXZ4oXiFmd6tJQ16JvKOc=;
        b=Uz9FKkEA5Qr77ZFCFWzjOSb+r9y8SktCw5Gefi5LohJ8q3EIA9mHNPCDsbAjBz3YQ3
         kq2ZeCv0MW5r9x8STrEw/TJKjCbO8bDvUTmCZvsFN3LrdkUq3ufyEvOHUlaYavbH3ZS2
         WHo7o85cecPwqivfiD2RC7NhiITjW+DPqPbLIxsK9ULBrsM3dWp2pc4E+GBLXEX3CLzq
         7mf+MVYpcogO6fislqudPWDSNQq7Vnk6C/p9C1n1vZT5+xV+HiIf89qQqNtoHIdRmjN1
         K2VSixaUbTZSE4/suL+4JbDPEfmn5C5vsPGg1qR6LDkvCJlu62Ur5+MdPmK8YbwvfCz6
         fSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LfFFeUv/WOce2TVGlWA/kbyXZ4oXiFmd6tJQ16JvKOc=;
        b=nff8c94PhQs8eM81LABBgjf2j1EghBHBrZf2Ra9h+NSqjMcuagtt8TzbI7PtBhGLYR
         kmj2R+cmIZeD+kZBNm/ljG/ENUyxCw8v1Af17W1eMEuN6HLST5Q3uLAqVfOl6ruBIDuG
         wG2KGOwbpxcjjcSuPekUKcikI+LjagxmzCCI29IHf4CtE6bweLm7Utx5sZPXTlyroh2Y
         b0N4qgiCEzFevkCKY6MSpoa5/aKAxtz+6z/FGcIsZscsRt5TqBra8c3jLpj0zCVchfan
         FP+HfQ3WUUpFno+hS2Ytr0UT9Q5TLMDIBwDi8dZ/Yfw1gGq42bXiR+Qf8YI9aEy9UCJ0
         TzMw==
X-Gm-Message-State: AJIora//UruiZst+Ul1HJF5NgtHsk8gGcCzTs858lznwnFCLI008Hs9X
	V9T+dzu2cfSpohZZk2JhLgaqVw==
X-Google-Smtp-Source: AGRyM1sDuy+CA51mNE6xs55jBFG/nO7Fc39xXP3E7f6VF9xKHCNHuIdXNqCXWX9sql9FizqHmv6sxg==
X-Received: by 2002:a5d:6a0e:0:b0:213:1f7f:e1cc with SMTP id m14-20020a5d6a0e000000b002131f7fe1ccmr19029817wru.31.1655657417385;
        Sun, 19 Jun 2022 09:50:17 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 0/6] PolarFire SoC Reset controller
Date: Sun, 19 Jun 2022 17:49:30 +0100
Message-Id: <20220619164935.1492823-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095020_676317_3A72FC69 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Stephen (& Philipp),

I gave the aux bus approach to the clock->reset driver combo a go.
Could you take a quick look and lmk if it meets your expectations
for that approach? There weren't too many aux bus drivers to "take
inspiration from" so I implemented this based on drivers/peci/cpu.c
If it all looks sane at first glance, I'll tidy things up a little
and submit.

@Geert the prior "RFC" you said you saw issues with the ethernet?
I implemented the reset stuff for the macs and it looks to be to
be working fine - but I did not do any meaninful testing with
CONFIG_PM=y.

Thanks,
Conor.

(Since it's just the clk -> reset aux bus interface I care about
here, I left the net/dt maintainers off the CC.)*

Conor Dooley (6):
  dt-bindings: clk: microchip: mpfs: add reset controller support
  dt-bindings: net: cdns,macb: document polarfire soc's macb
  clk: microchip: mpfs: add reset controller
  reset: add polarfire soc reset support
  net: macb: add polarfire soc reset support
  riscv: dts: microchip: add mpfs specific macb reset support

 .../bindings/clock/microchip,mpfs.yaml        |  17 +-
 .../devicetree/bindings/net/cdns,macb.yaml    |   1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
 drivers/clk/microchip/Kconfig                 |   1 +
 drivers/clk/microchip/clk-mpfs.c              | 118 +++++++++++--
 drivers/net/ethernet/cadence/macb_main.c      |  25 ++-
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-mpfs.c                    | 155 ++++++++++++++++++
 include/soc/microchip/mpfs.h                  |   8 +
 10 files changed, 320 insertions(+), 23 deletions(-)
 create mode 100644 drivers/reset/reset-mpfs.c


base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
