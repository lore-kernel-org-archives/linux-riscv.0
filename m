Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B0AC10F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7hRFeg64CNhjl7gno/gFBmCGQSKSYqDdyxRGXuACeyI=; b=sKv2XrpBtWN1Dx
	71c2lA1dIxfJd1ZBMcrXTQ22q5801BQIjmgKvikdJJhD83qe9jfzfA9gGoltDksHJyFHBygwfR/yQ
	W6BkIL6AWCS2eQK4qeylZ9wqDycBzom9v3T7aWnALM1KF3kwdPkk9t6GGZR81j7RACEqI328B/31i
	+0bHr/aanNEkgJgGz4pR3ruCX5M1su/2wgdG46FT2WHuWvDMau+weyMFRT2UD65Jsla2o2eQ6UMPM
	nWoU5bBn+BQbfRQ1SZQsgvd9reLahL4kOL1yP4Xx+UFusNk9cSgj4DDE692SeQYpf5oUoc85sNtZ9
	SZAU1tpDw0PijhPsT3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xie-0000000GwRo-297d;
	Sun, 28 Apr 2024 06:09:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xic-0000000GwQI-0Mho
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 06:08:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f26588dd5eso2975347b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 23:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714284537; x=1714889337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NI9A5W3LDtQ0HwJGHFmFDOTVj47cZE4nr8GGIX4pdrA=;
        b=BaMQltFtVLotvIwIBfX41ObyydFnpBTfv7FpMPMALwQ75i/iONRWMO6T5NVCDNynmv
         c+tvRmfEFvsjNnRdcfEQmbAZRU/Qm0zhqeU11wvlVEaOqtMwMuUHxQtdRS2oa9TAmXPC
         jaycSjK5ORs3al8+DUE7XObNZPL7mCxnc5HwP4EID/5eDCvBHlmy4a3ma6tuaIG3dTTJ
         /5sm4wr6yiXRJPPBkXWnVW5x0ouXz/wrhHspQrJf4yx+FZ1vZHkRM15YmSS7j7uuqGTq
         GqmqN9NyZr7zbq/YxtUXtyZcQfUtiU5xiCsiKM2sU0b7WaUHUOWk4gkSN+Awmd+TDGP1
         h7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714284537; x=1714889337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NI9A5W3LDtQ0HwJGHFmFDOTVj47cZE4nr8GGIX4pdrA=;
        b=KthpA2lVzX9J8hqBKREdYnOSMYZDEv1DQ1VNAj7yXb8fq8btHoU1RZMeWqVPzVjwSn
         d9asEm4rjtZ8iUayjusBEPPhe0QQPNHD+3m3QYSBr4jLEwzndT0nwgRbwOzNWnlljnNG
         dS4tjsrCF+a8FGX8Wy72KNiSWUJ6PmZ2gfCqhbLcNkwJWDqpRrjycxRctxfAoTx/NzCp
         vV/yFNmP2sQhmKKVMu4oYO9G2UBuN4uf5C6mL5gp+L4e6lfmSnC142qxamlTMstEVfsA
         VwngxVTfQWUnXzssRL3U1qcnwupmh1Ybb3+/pdx1o+YEjHj4zTuuJWrF22gCJhsJCMqs
         y8lA==
X-Forwarded-Encrypted: i=1; AJvYcCUsgF5DDgEcPPgMHES7ZONg/xRwAespXdxym4c506RoDRXT6Vgx46kPQP8bAyfTLS2H/c6AhTn7b3UNfb19obaNkD9p+f9kFLzC1Hbur6Mo
X-Gm-Message-State: AOJu0YzhgwIkZyt9Cvg1mpAWodFIoUI8bwofrJgBWrZZdntUAvhUhM7/
	Ucz5znFDyjpVqeviLD0nYwZrld4OhuqFGkEDzuQ5JoET7mVw8gid
X-Google-Smtp-Source: AGHT+IHERhqIfk/gO2h2bzv+XJOcMEnSnmsVUGYOsK+jwOpFsEtUAtZfTvklzjWPM7czXeHN9ImnLQ==
X-Received: by 2002:a05:6a00:a24:b0:6ed:6b11:4076 with SMTP id p36-20020a056a000a2400b006ed6b114076mr9334890pfh.12.1714284536341;
        Sat, 27 Apr 2024 23:08:56 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id a8-20020aa78648000000b006eade394613sm17156609pfo.198.2024.04.27.23.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 23:08:56 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v9 0/2] riscv: rtc: sophgo: add rtc support for CV1800
Date: Sun, 28 Apr 2024 14:08:46 +0800
Message-Id: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_230858_172858_EED5BD60 
X-CRM114-Status: GOOD (  14.57  )
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

Power On Reset/POR submodule only using register resources
so it should be empty. The 32KHz oscillator only provides
pulses for RTC in hardware.

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

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 240 ++++++++++++++++++
 4 files changed, 304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c


base-commit: 1c431b92e21bcbfc374f97d801840c1df47e3d6b
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
