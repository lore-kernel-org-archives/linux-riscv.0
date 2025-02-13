Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32088C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AYS+yFRIzzgIyPx3XGiB9TWD0bdVTvMhvzPBW99fS9U=; b=WQbhFenNQ8VQv5
	j0zg3so/+ZXbYlfREKkIVUjrzqv4Fst/0TqB5AFtbuziWyMdVL2x39QTBWSZkWfoRpIAg2HPpfRyq
	Oej9xBAFHzImC/1FeshjSJ1W0xb8fT8O34vnc2diyEoC7WG8PZm7IexsJBV7KDDLdyYob0aOznRAn
	60LXWNoIrhFIdTsQuaymHrVUM+X7WVQRYfWPsqZjHS+pVJtaQj2ntCZobynbIDZ9wIvtubjL+ldCy
	nePihHKSs6euOnXqPExnHD4HzmOItkoxQyA5WAf7axUuQqjNMgucfqy8yGPJq1pW3fewwCnN78eq6
	fpeXcRPee7MwpdZz6WsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1R-0000000CZSK-27tz;
	Thu, 13 Feb 2025 20:41:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tieEF-0000000CIEf-1w6s
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:46:28 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaeec07b705so203295766b.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 10:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739472386; x=1740077186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aukWBb3CU/4AhOxfmtAmwLpbw3wl3GfTDAoU9wk32Bk=;
        b=e1YTvoOB3XImpWuCRBkP1VcsT0kw6/sjiWzmHIY4x3nbCuTZ23tgSQ45b4Xt6mdnzF
         G/uy9BCnRREWCyY+GDS/nB+d5haUWyuvBcbzDR+C6DPG35NXXgQFsO3HcFE6bGV6WLti
         RV0raRZR+62HbO8Xmg0GCswEkmkYyQmhzyH+cGFb6ZjKcmLJ+EAEvB3/QryEK4lP4V2E
         BLwYk+Dq549JJn4qXe4y2HSEdIAhrWE2erFYfgYr0XCHb0AO7yu+GpaxJJQ9OIiN7PG7
         5+UZiVuZYfNze/yyVhJLYVsLNHfXaFIkBdgUNRCPvFhf9U02BkwesikPTbfEEL0EOmZ0
         555A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739472386; x=1740077186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aukWBb3CU/4AhOxfmtAmwLpbw3wl3GfTDAoU9wk32Bk=;
        b=LspDORbxyhpJdAPl4TW8sZgtJWpOGRtZn0hALQM0NZHTXgfNWIrusylxBBZh0O4DrJ
         XSE/9pe2Ue9d1PSyiSis2QIDWq5/Opjld70aBsNnLEMivMAG2j4itvH2QHs5WcoVBdFk
         rCUl68NQffeZQDAPIiNTVJef4aAsJa4lx4tkmSz+aCc2KADZjvXDvZ0GiAOm5sAqi016
         DMpGex9BF6cva+FCRTGIL5EKRoZrZqZcQAjv05D6z7JpEPyIDabibqt7tEL2XXPcLtkH
         gaNdvucYlv+pJd57rRjuHti12VotIZPaUDJcInPv6hJhHjS2ANCMMYtY9rtz1foF2Au5
         d3+A==
X-Forwarded-Encrypted: i=1; AJvYcCVIW9GJ6uWLtbuITDW0HG7CykN9FzngMMWjB1MlPPNgVnF28MJTiruKcxLvrxFgpivYEBu33NsHZfJUGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEclJvCYs4rsq+1vMpLRckiYPRUSgldkKLsPNjAk2sZVq+IPfe
	aImV3RLBBFdB6ejHyZyo2Yf9HvSzXw9rJ7Da61zDbe451eBfvUvc
X-Gm-Gg: ASbGncuUSRp95kJt/Z0gqBiGcrDk5/vfZN41kH6MmOOFBvhISZUytBikiZrvuFomAeX
	ZTum793IfEP6rW+m2gs/m4u3waaynsBBtQ3GsZFChE/uIUzXkLV9epv8k/OFvALfB2Q+cU8nq4j
	YGPfJYSFPAm/JrMvnNJuhWA9uCXpvGp5Ae4wUcXcydkn7l+3M6or69lLoSv2qN2qhDfaH3qBSnK
	EyJEhKlY+DP/eqMjzTvm+i6BYYSjqoYUmQQiCuZ/XZX6kgBgcik1uXtM5DWJHER7rLuZzb4ScBQ
	UdTO3FFniXv1qhz/cYmO+PbT8w7w
X-Google-Smtp-Source: AGHT+IFLxTwk4ShOCgoBhzCNNIaUWJTERo/NRFQCgSQeLdKFCXmw2TOixkwTdZg2oz22qRZqY5E3Vw==
X-Received: by 2002:a17:907:da5:b0:ab7:dec1:b34d with SMTP id a640c23a62f3a-ab7f34ac9c2mr820599666b.47.1739472385487;
        Thu, 13 Feb 2025 10:46:25 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533998e2sm181360466b.134.2025.02.13.10.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:46:25 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 0/2] riscv: rtc: sophgo: add rtc support for CV1800
Date: Thu, 13 Feb 2025 19:46:13 +0100
Message-ID: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_104627_502250_2F23F267 
X-CRM114-Status: GOOD (  14.93  )
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

Real Time Clock (RTC) is an independently powered module
within the chip, which includes a 32KHz oscillator and
a Power On Reset/POR submodule. It can be used for time
display and timed alarm generation.

Changes since v9:
- picked up orphaned series;
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter());
- dropped ANA_CALIB modification;
- successfully tested on SG2000;

v9: https://lore.kernel.org/linux-riscv/20240428060848.706573-1-qiujingbao.dlmu@gmail.com/

Changes since v8:
- delete unused macros
- using 0/1 instead of the DISABLE/ENABLE macro
- pass in the correct pointer when applying for IRQ
- convert the incoming pointer into an appropriate
  structure pointer in the irq handler

v8: https://lore.kernel.org/all/20240204044143.415915-1-qiujingbao.dlmu@gmail.com/

Changes since v7:
- pass checkpatch.pl --strict
- using u32 replace uint32
- using devm_kzalloc(*) replace
  devm_kzalloc(sizeof())
- sort header files alphabetically
- delete unnecessary header files
- fix wrap error
- drop dependent description
- using hardware automatic calibration replace
  software calibration. see documentation 197 page

v7: https://lore.kernel.org/all/20240122080500.2621-1-qiujingbao.dlmu@gmail.com/
documentation: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf

Changes since v6:
- completely delete POR dt node
- remove syscon tag
- use devm_regmap_init_mmio() replace
  syscon_node_to_regmap

v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/

Changes since v5:
- remove unnecessary lock
- fix cv1800_rtc_alarm_irq_enable()
- remove duplicate checks
- using alrm->enabled instead of unconditionally
  enabling
- remove disable alarms on probe
- using rtc_update_irq() replace mess of alarm
- remove leak clk
- useing devm_rtc_allocate_device() and
  devm_rtc_register_device() instead old way
- add judgment for rtc_enable_sec_counter()
- add POR nodes in DTS. This POR device shares
  the register region with the RTC device

v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- remove POR dt-bindings because it empty
- remove MFD dt-bindings because SoC does
  not have MFDs
- add syscon attribute to share registers
  with POR

v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/

Changes since v3:
- temporarily not submitting RTC driver code
  waiting for communication with IC designer
- add MFD dt-bindings
- add POR dt-bindings

v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- add mfd support for CV1800
- add rtc to mfd
- using regmap replace iomap
- merge register address in dts

v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/

Changes since v1
- fix duplicate names in subject
- using RTC replace RTC controller
- improve the properties of dt-bindings
- using `unevaluatedProperties` replace `additionalProperties`
- dt-bindings passed the test
- using `devm_platform_ioremap_resource()` replace
  `platform_get_resource()` and `devm_ioremap_resource()`
- fix random order of the code
- fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
- using devm_clk_get_enabled replace `devm_clk_get()` and
  `clk_prepare_enable()`
- fix return style
- add rtc clock calibration function
- use spinlock when write register on read/set time

v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 +++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 223 ++++++++++++++++++
 4 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
