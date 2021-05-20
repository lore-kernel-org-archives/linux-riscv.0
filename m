Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8B5C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:02:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7C660D07
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7C660D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjNzok9q45qbRgU/FXCxYNN9omgHFkMIX1LWcIsu2kQ=; b=fmJpkBRC66Ds8NmIIeFtfb4V/T
	AMnrH5zbLqUy+wLQMNC+xs29cEdT+85Rr5vYnq5KuZqwWGOYe52XSeFssLN9cs3mLaJxCGaboEBBv
	/z6wsf2LEUpF714v3UBTpEYXlcDM2hU9gfW9XCamaJI1PRzMsJ/KcFlfst6pkjN5jQOK6ptXJD7kN
	f8l3L5yj7NjZAF8VeVj/2Mhm1GRrS5yVrCM+NK9goK5sW98AqhfT1jiPmtkG80IAJiJkerYtiJRFv
	+DBXKoOjokjbq0pfHtNA20SSbB8eJFxDeeVV519APJ0Or04KSFq1xZmnMkm3gGiZsR8VOwGT+pw0v
	kB/oxeAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljnvr-002OmB-Dl; Thu, 20 May 2021 19:02:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljnv0-002OeI-D4
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 19:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=; b=f+ZDDSpw91pkj3UxUqQ11qMxj+
 80Bo4MRhikcWoytvPWbRFLT18VjNxY+ZsdDp6hbeAu9WY1QwMa5E/mD0FW4CvBSMu+dIthjC9e5Qe
 d5iTO2Xx1wMAbD5Sp0JoiaYaeH7V37vD+2DCOTsgp/TXoy/tFLQSCengoeJ8X/osOesfOx/6QqOT5
 ZBpHBMEtWggmzoKfINJhXtsF2EPW1zS+Pur560aGKjxLGJSV+EsBWWIheWgx92IbKd2SQJnVlSSce
 SevFkFYkkfWA+gtq1msINfSmPtHiwzqddXhS9ayBPntsx3x8y32NC9xhvNdyQ3lEzODxFIGmjod3L
 NQjl4M1g==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnux-00Gao2-6W
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 19:01:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h4so18680347wrt.12
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
 b=BhW/gXf8pWSAZIebe6nxATFBDBMilShlmVRZzJL0Z7cmhZ34wH8yiODRYqZmjd0Bbw
 5FLnj7yUL68hbF/XNuFKxoi0pfP4IxkJ9c+tMdT028yF+NF5NC4AbnGloFwc4U/IgJJb
 HkBmb6/op7D4qo7GUrP+MqqfwZ6YMDM+Oxk8Miamy9HC5vBwZMh5J6OxRXCPhVYondTN
 OQQCjBR3wG190MivkxGFRMZfvJSZhA+Pb19zi5r6dE1ffLHfPQK8OngnGA2VqwGj8doy
 fyt+TWfbk49ktvoZDPBPDYLY6+bP73h8SefLmUIpQlMpElMBtYVTr7MMgHl7IQ2YM0NU
 tiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
 b=n61wybXQ55PtyH57hoRdI2V5UoWUirxxoFqIwzBa/8x+fda5FeFBlsiYOd1xRbefT9
 4NO5TaDz4Zt7ALUJXbTgD9HXrwFbzJRFMw5Bjaq001F88bSgwDRthmgKoIXEwAbTlaEK
 QJi23su55BU0CKJrHGlmy90bwCIEPIroqmU5I3VdPooO4t7Im6wqfxayrmLzWh01Osjc
 Gkw5BH4BN11dQU82p2gYkXO90srjogwSj8EClJH2d7faMH3k4DFrg+f/goSQsdJulGOw
 M9myiKgqhlG9W5i3A4tOUVm5fzs4X3KIz9iM/1ix5IfgCQ/QrHs5EE1VvARRfnB2FOoT
 Cbmg==
X-Gm-Message-State: AOAM533aM46H3iqrvqw0dz4+95YW4aFngI19bQWjMnH3ieUCIhPHADoG
 82aE/brdDHs9hu8FU5gb/U/QZA==
X-Google-Smtp-Source: ABdhPJyFFyrDcMhhbJFcjr+Bz0N+pSMlyvPDFQtGOrLH3IV1YMX4KzVeEjRTqSnwuhvjNtamRbprxA==
X-Received: by 2002:adf:f58e:: with SMTP id f14mr5759911wro.258.1621537269261; 
 Thu, 20 May 2021 12:01:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:01:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anders Berg <anders.berg@lsi.com>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cedric Madianga <cedric.madianga@gmail.com>,
 Dennis Kovalev <dkovalev@ru.mvista.com>,
 Doug Anderson <dianders@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Maxime Coquelin <maxime.coquelin@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Max Schwarz <max.schwarz@online.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 NXP Linux Team <linux-imx@nxp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Korsgaard <peter@korsgaard.com>, Peter Rosin <peda@axentia.se>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Rudolf Marek <r.marek@assembler.cz>, Sachin Verma <sachin.verma@st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shariff Md <smohammed@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thor Thayer <thor.thayer@linux.intel.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Vitaly Wool <vwool@ru.mvista.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 00/16] Rid W=1 warnings from I2C
Date: Thu, 20 May 2021 20:00:49 +0100
Message-Id: <20210520190105.3772683-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_120111_293711_3C11DAEA 
X-CRM114-Status: GOOD (  11.31  )
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (16):
  i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'
  i2c: muxes: i2c-arb-gpio-challenge: Demote non-conformant kernel-doc
    headers
  i2c: busses: i2c-ali1563: File headers are not good candidates for
    kernel-doc
  i2c: busses: i2c-altera: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-axxia: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-cadence: Fix incorrectly documented 'enum
    cdns_i2c_slave_mode'
  i2c: busses: i2c-designware-master: Fix misnaming of
    'i2c_dw_init_master()'
  i2c: busses: i2c-eg20t: Fix 'bad line' issue and provide description
    for 'msgs' param
  i2c: busses: i2c-mxs: Demote barely half complete kernel-doc header
  i2c: busses: i2c-ocores: Place the expected function names into the
    documentation headers
  i2c: busses: i2c-pnx: Provide descriptions for 'alg_data' data
    structure
  i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete
    ones
  i2c: busses: i2c-st: Fix copy/paste function misnaming issues
  i2c: busses: i2c-stm32f4: Remove incorrectly placed ' ' from function
    name
  i2c: busses: i2c-tegra-bpmp: Demote kernel-doc abuses
  i2c: busses: i2c-st: trivial: Fix spelling issue 'enmpty => empty'

 drivers/i2c/busses/i2c-ali1563.c           |  2 +-
 drivers/i2c/busses/i2c-altera.c            |  9 ++++-----
 drivers/i2c/busses/i2c-axxia.c             | 11 +++++------
 drivers/i2c/busses/i2c-cadence.c           |  2 +-
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-eg20t.c             |  3 ++-
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  2 +-
 drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
 drivers/i2c/busses/i2c-pnx.c               |  8 ++++----
 drivers/i2c/busses/i2c-rk3x.c              | 18 +++++++++---------
 drivers/i2c/busses/i2c-st.c                |  4 ++--
 drivers/i2c/busses/i2c-stm32f4.c           |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  4 ++--
 15 files changed, 40 insertions(+), 41 deletions(-)

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Anders Berg <anders.berg@lsi.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cedric Madianga <cedric.madianga@gmail.com>
Cc: Dennis Kovalev <dkovalev@ru.mvista.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Max Schwarz <max.schwarz@online.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: Sachin Verma <sachin.verma@st.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shariff Md <smohammed@nvidia.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thor Thayer <thor.thayer@linux.intel.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Wolfram Sang <wsa@kernel.org>
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
