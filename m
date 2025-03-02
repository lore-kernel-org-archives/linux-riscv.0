Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64D2C282D0
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 04:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hHQPQ2wQbbDn5IT0h1rTpwo/Q7KAzV+ZkqHdP1Eb0M=; b=glHf+ObA2FvkGm
	fAyPU06dDdwt+Md1lFgntLrsFvIRoAOwLHn8Mn0RCF0r5pEiFUUXa4LBgmnUn4ea9voJm5dvTIQNQ
	qbof+F3Uv5R2Zl70nRh7/0MGfO6NP3Km9QC6sa2PlzQb1K3vk1BhopmTR+ngqcJ7Sv7kavlVNb7ql
	MF4/G0GWJE1c8Hwij9GVW4olWm8a8gVvp6QsnrF5/NebehQz1uglr3UqhVI0mGyOHCBERMxRrr5IO
	Qi1tW3AZL8HmGttwW8AVMjltt+EeEvD1EsXniOiqIhm2LDTqkKz8p/94Hmag/qQBFEBm7QXeyrbOJ
	K8aMDj+/7hwydUDQFSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tobMD-0000000FOAS-2Kuw;
	Sun, 02 Mar 2025 04:55:17 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tobMA-0000000FO9d-2Uj3
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 04:55:16 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-22339936bbfso50208155ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Mar 2025 20:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740891313; x=1741496113; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYmuHsAAUbnqjSLtR+pm2EH1EhYbhj4zTMezGuOV6nI=;
        b=hCGaPRi4uaf+eI6ajuU6bFNySfnnNRmYH6kauD8L4tu2M4czAhbpA0WBWa7UQOhpKP
         mppL8hOftop9Z+8q/pSMLlms1561vNN5A8Za7PbJ0XP3LYmAkpYJ6YZ40YiaNE8Pab7o
         FCeYfnWpiYKbizUACOoCLBUBrDAF4d6DPobox0L9FzqM32/ermZOtTqF1SwwDcbyOqt4
         Wk5rGTPTdptq9JaPdAz1HXwsKmW/9Pev+Zt7WQfYipcZf/am8q0zdjg1PdEckYT6rpUi
         8+eW5WzI7Yim/DzfWZyxwi9qoFDrKNlF7SLycphF1Iq2vILFZPKriGCzSvXIMcSlLQDC
         A3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740891313; x=1741496113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYmuHsAAUbnqjSLtR+pm2EH1EhYbhj4zTMezGuOV6nI=;
        b=dBzOWvpuAluckdCB5s1jFRlaEMlApM2cpztVBb4GfqhCNZkqTUCUXoWhHp/7VW1edX
         FAuWEy9r7Tg6JmgVroOClJEcbXqeNrz/gz8z6gTa/VkAKsP/TEqXdSmYB9icEWWa/zZY
         25HpggA2T3V/6EcEr/b5opRHVDzXaeODccv8pnImTglaD6DT0LSyTKPsW8sGBmp/lGxx
         T9e8Ar8BvQffD4et59vEcB7q7md1JTues++UdghGYqsGgIQhxDArZRumHgLF5OQ9cNA2
         mNfiHBaqp+RVcP2wpy0U7+cjzPbWoyDGkMDctO5ZiqptLqWpqc+q1uempnld1MqNzOtU
         qhGw==
X-Gm-Message-State: AOJu0YwfPNvk9kUJ2deJnZQSwXLaKs+hpZA4QqzgSAV5ws1is2QmS4lk
	sNOqqeqDOjGjoFSOoZAYgqtPoKoOiEzKlRWTb8aX8K8Qyrrv867ZT3+AD18NvOsUsg==
X-Gm-Gg: ASbGncsBgiHpXtq1/+1aJnqPBcoM4/w098w9whAaHWPuK/tdpddwBv9IJMdAySf/gIN
	r6I5q5qdZa1A6NnrH0HG4Zlqt5Nxfijo7aolP81gLTKMUFiirSR9twKb5ldjUQETOMyS54gxuvy
	bVSKEZpS0ogZxaq8uGMPPS9wPJvidQcKAWh3lI4sCE/8Hl0VZ9P1tCTDLKVZVzH+IyFVOH9GO0m
	zlZywUBXgVKsbTWC+eQSl0bulxYGB9QNo0ipC5as+nUY7z29DdppQm6ADfiGvbiG1C3xFuHoK4/
	1vZcjuxFNfbLrD5aRxGSc0Lsp0Aq
X-Google-Smtp-Source: AGHT+IG6Iwp0TrpvriEEZQrBvVBPTnqh9uCoi9nytOh9CfsNqhNI7A98OXxP9DSNRJnxmuVzrqlqcQ==
X-Received: by 2002:a05:6a00:99c:b0:730:75b1:720a with SMTP id d2e1a72fcca58-734ac42cd7fmr13617283b3a.23.1740891313195;
        Sat, 01 Mar 2025 20:55:13 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb70sm6359319b3a.124.2025.03.01.20.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 20:55:12 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Sun, 02 Mar 2025 12:51:47 +0800
Message-Id: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOPjw2cC/5WQy07DMBBFfyXKGlcz40fsrPgBduwQC8eZtBZNA
 06IqKr+O05AatQFEsur0Tm6cy/lyCnyWNbFpUw8xzEOpxz0Q1GGgz/tWcQ255KAFIJE8YYiUhC
 9HydOouOqqxpoAztZZuY9cRe/Vt/La85dGnoxHRL7jYUsaEkEO6kMWSlQPKfh/BSncODj0Vn7u
 O99PO7C0P86E3985mrTj/jWrC4WIxgySy9A0fgxBtFOAr2XyMxNaKme9eLJNxbZ2cepLiw7cqH
 RyjArCs4bbEl1ng0Y0OxYoiOpVbl8cYjjNKTzOtKs1grrJ0j6bo9ZCRDQyVZba6Q0zeaVxTTLD
 Y10T8tMawDdVHlSAntP043+14orjBsYNVQapdqhUk5p+zd9vV6/ASg7D4kpAgAA
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740891166; l=4719;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=FrmHWqu9tneuHbHRnVzjaD8IgkYbtNFFjeVyUtqhsTE=;
 b=4qT/Q3RrnxDSRGAkE//HG3Ygs6CW3XBMp6XX/NzAz1S76t0D75YNN50QUyG+y0QuwHddM5aMk
 HT0YmLWd/0wAxWCQhbpBl5K4ZiKbI0lKvzoCTOp0zgGogI+pHT07RoK
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_205514_697763_7CAF393F 
X-CRM114-Status: GOOD (  17.29  )
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

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
---
Change in v5:
- Path #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Path #2:
        - Enable the APB clock
        - Fix comment and code styles
        - Fix typo and drop unnecessary description in Kconfig
        - Prefix all macro definitions with SPACEMIT_
        - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
        - Remove all `unlikely` and `likely`
        - Remove unused register and bit macros
        - Remove the "err" field, as it only contains a subset of the status field
        - Retrieve `clock-frequency` from the device tree instead of using a macro
        - Use a local variable to track the current message
        - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`

Link to v4:
https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/

Change in v4:
- Patch #1:
	- Change the default value of clock-frequency from 100000 to
	  400000. This is to correspond to the driver's default value.
	- Drop the minimum of clock-frequency
	- Modify the description of clock-frequency
- Patch #2:
	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
	- Drop useless wrap
Link to v3:
https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/

Change in v3:
- Patch #1:
	- Change the maxItems of reg from 2 to 1 in properties
	- Modify reg in dts example
	- Changed the enum selection for clock-frequency to a range,
	  setting a minimum value of 1 and a maximum value of 3,300,000.
- Patch #2:
	- Drop unused judgement in `spacemit_i2c_xfer_msg`
	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
	- Fix the error check for `i2c->base`
	- Modify Kconfig dependencies
Link to v2:
https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/

Change in v2:
- Patch #1:
	- Change the maxItems of reg from 1 to 2 in properties
	- Change 'i2c' to 'I2C' in the commit message.
	- Drop fifo-disable property
	- Drop alias in dts example
	- Move `unevaluatedProperties` after `required:` block
- Patch #2:
	- Alphabetize Makefile and Kconfig
	- Change `.remove_new` to `.remove` in `struct platform_driver`
	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
	- Change `spacemit_i2c_read/write_reg` to `read/writel`
	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
	- Clean up code flow
	- Fix unnecessary line wraps
	- Move `spacemit_i2c_handle_err` to a suitable location
	- Modify Kconfig dependencies
	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
	  the intermediate variable
Link to v1:
https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  59 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
 4 files changed, 696 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241031-k1-i2c-master-fe7f7b0dce93
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <TroyMitchell988@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
