Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DE9C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 21:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jg2ssF/DPFM74QQhGA89clvZW70lUVRtPxbnpNHY0rY=; b=JEgnbKjNM3Qz53
	ufISy9UXP91RawzybMC2Y5a/kJwljfnTy5Mct+Bgu3+AnwZW1lbU8CDcrnuZonYdpLQwFU4pUthff
	v5hVW6dkOOzSU/XoYcJGPtjbNGntMHqz97xzOB6oTcdifLbUoDi9/JjSatS3UmLoGquT9dcT81RXl
	HjgYQJKbsSfHVtypZ951s3VWGT1rZgn5TMCGmVvyEq7gVCFxjvRt7y4uGz9Oq9s7Jm4nZQbvNJIcv
	LpP8/1zLhSBa5U1jRJX4AXYvLFvKfTQhSFIJTlZit5pJIhP318TbU6WYJNOVXSzdvrNYrmQLEdmQ6
	YjljU6VGymIkuQDpNKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCl-0000000CkQ7-0nRD;
	Thu, 13 Feb 2025 21:57:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCi-0000000CkNq-1Ekl
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 21:57:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so2231820a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 13:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483822; x=1740088622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+t6B+jgVmtMaFtzPH7+S0a4yoIONQBzjfTCZovjoAU=;
        b=cBI3W0Zf0U2/WvrkKoOyAvXv6QqvHLn4JKF5WMSV0L2FcvVDMI1rdyCXyT9kuAmkcE
         SQt84kE5Xq2gM+GZQBROHW9ZWwh3wsi48zx8rp7brErj1NZEpcHN2j1pe5sn5+vd3oDi
         FG9ewrSC3HZr3hq7CHv4dov62zFVY+EajjXhbSCpyzioBUdNW69Z3DDCjbw1F9CKLTXJ
         3Y4l+zWBS+8muWLWS7QaZLz+dBysBumS3ZLLw8JFaG+7nYA/q+JM0858qY192ZKphnKx
         CtwH0M1SC35bDdn1XGnoifK5o0UrvUrkD8m0+LCDdOjv+mMVvoX6MXaQ+COq3rZlPyGE
         cRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483822; x=1740088622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+t6B+jgVmtMaFtzPH7+S0a4yoIONQBzjfTCZovjoAU=;
        b=Iw6zaF1lVCgr3glgCvIwG2S1x4f3duNemaYL9+qNhmTCgeXxjTj0seFWBdYFori2xa
         4y8nRcGlMPe6sSyVZzDMY1Pfjvd73dT316YNdLuCbwQJ/jvkjUdTf/M35kxDIbDR/8OA
         /1aSjKRpkBBFyje4ZumPzmbSSVz5GU+GH/lOggxa1o0bXZOF3F4mMnHJdKaNFkSRx6zr
         kXvfGvUqihf9ZOE8WaU+NhxqjIvNOJoUz7yNbwP4Jy60PwIBhip/ZhSajw1+H9Cv6AIS
         N9fVl6ypY4kojV7xxFlJBSXPLUnX8AwFemcI7Slhl8Du99dXaUGqjCGYynsEt628dOkk
         LePA==
X-Forwarded-Encrypted: i=1; AJvYcCVv7I45876MRmnvzMbRPJkes0JZGoLKOGwRt+E1F0p+y2FroK6AzWwc0Pr/Gi1WwPk4C4FQzD1oObY3NA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrp9+mTERB4EfwAe+NqTkwlIlfOUYHJh/GfHMuODZ+PF1Un4iA
	YHyZmkr6UmG2jsesJ3kpJitMUMZ9iAqmGyghszeiR/5VBPteF/yh
X-Gm-Gg: ASbGncvmMINcrGb4AvFVtXnmKdXQxJ0uPPQaQ0fPwKocPzQS+Bl7wZfFaHNyoP98lyI
	8aEHTNP2zzNHDpijR/UsEZQvTxRdEjbGPDwgYo7bSmMV5dHKww4w0UMJMqExquJeQJGBhuqo+qT
	KkJcsQLfaBjk3iXDJyk2hBy7Vgb/ZAp5SxUwMX83ggbWyaciJbgLw3fQrfGAMib+1v1RWgA+yzU
	1n2x803UzWy6XLqSebriL1RFg88B963T8T2plP5xr9IJNp35jXS3ED4rM+gDkYRcKX5ecn1eYAP
	zxdAyNRbrO/UZ8J9YKaKr19dWIeI
X-Google-Smtp-Source: AGHT+IFbUWokaBSyVOOLzgLUlMVYFf5zz41axl3e6IJ6OWk1r3JOQRJ5oLgxY2Nm8yuJxa4uuyLdiQ==
X-Received: by 2002:a17:906:dc91:b0:ab7:c4db:a044 with SMTP id a640c23a62f3a-ab7f3714983mr925567766b.8.1739483822129;
        Thu, 13 Feb 2025 13:57:02 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:01 -0800 (PST)
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
Subject: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
Date: Thu, 13 Feb 2025 22:56:44 +0100
Message-ID: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_135704_331332_48E2A05D 
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

Changes since v10:
- only start RTC on set_time;
- add machine restart handler (as separate patch 3/3);

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

Alexander Sverdlin (1):
  rtc: sophgo: cv18xx: Add restart handler

Jingbao Qiu (2):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 277 ++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
