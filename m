Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1AC35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5p5xMA7BAvxzV1zCUmZ/qy9SUGXaV21oFLV2qArvybM=; b=WDxO7NJP79UWCh
	7+W8PDnQfqgKm1VwdAAFNtl10nvxy8hcE7vXv1ps3P6Mvys9yyWvw7WjvLEOooL+wgen1PtZlHz1T
	oUPMS+1OEdv9k3b7MHx3if2kryBQLxHDMNqwm8EeFLPOOhqfzvaYk49vbVifCHHVfsxNIacl0wnEG
	j7JkHeOUf/GMC2Jm9BXBW3tMRddTAQOF2QilhfWCkEWIu2OgQb+6s1Zd8s8O0G5rKv5FlQn0Mf7ML
	O5c+ABd+s3WsbUhtXoiZZL6ItxV7q3vcTQfoMMfZZnAV7AvrI/au/L+bF2CP1oKkHL9wTaeWFYyMC
	iXrOxWktnLKR3bLXFh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupsD-00000008WBX-3fB3;
	Wed, 19 Mar 2025 09:38:05 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupmM-00000008Ufg-45cB
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 09:32:04 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22359001f1aso16279625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 02:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742376722; x=1742981522; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4c5WwdBa8LpxD1/meMFz4s/8X4FVziT5/E3RtA1KL4=;
        b=mDRJl6vJE2F99eud2vpCAGrNlRjR238fGyOxCO0jXl8WO45FBSlKR2HGilx2COci3L
         HuEK/6oy3yWSxEE5taEe/OwImJ+9JH6Kdu2t4SBLxnK73pXjvB3SLEhf1RniV2PoQOCW
         ViEXXbhM8vv/m1qC99g2IO/6Dne9nf6Vb5uLHZVZ1ReT74UeOlHCuwFBYaylkw35bnW7
         Ks8onyZCNjbdl8Vm/JqraNRPGBfNYi+jcczRSG3fgC9w7qJQ3cz/29RMsZiA3Gw1AJJ1
         ITH42MoPL89Yvb/AdGCAoeq07oHny9UajSlIFVW4oBQrb+3htePJv9ejJxnFTezMfH0n
         IKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742376722; x=1742981522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4c5WwdBa8LpxD1/meMFz4s/8X4FVziT5/E3RtA1KL4=;
        b=FFX3B+QtS67ZJ0cE8Rej9zizVZ+QXGaWXc9HdobB7bjRBq0z2lA5GrrlbCa4PPMrEa
         4QWE/pX/irrvOtMqMH4paOA2d+Eg7lkd7Qk6VUmEc9QxfuXeahwxChRPpMQwXGelcOnc
         El6Sn+CQfTUmx71GGTcA9tqwnlvEMOJHAL3SLDNuH+2CQgOEGZd7CQ/mFTua2LanqBLF
         u247AjAu0kkAZBGrdBb3FSvw9BBwSYJgdwzN+w39Uf1jo4tzHSFNg1oXnWsMy+KwD2Ol
         wgoQafQFT2cJdEVmhOJ1GTK6VCQvsUYKVDvmZK1HuehxnOfW5rqT5gkLeoWaSJ2YLvMJ
         X8Sw==
X-Gm-Message-State: AOJu0Yy261GJnXVWaE3AmFkTVOKJpu+fjayxFD+RBl8/sWcT9Xk0ifqr
	x5Uq9SRc4C+2IIldxW+Kii71aOc5e+FqVn85p+RTAnhWA5m+UeRPJFH1D+CpOEzQGZcg
X-Gm-Gg: ASbGncsQmlcwXGcondMwB6zWcrGuhhCeKL3UoFlHSqynV1CpH5CHkQU/nQT7F5hwLK8
	YYNtsROt9Qd+jxhH7++RxcvNDyDt3OgjMjb985u4GO4t+QefMGsKAKEZJw8pkCTi89gwX5svyr4
	/jBQmZq2kRnohBwycmQ2sIOoRjy2FQynsELCIeLsTVkYUHQE3/el0U08UY1bC02szWWFea9Ut0t
	B5nwXaq4apmOgiZTKEQEHqgiOoXAoiBmAWHqXVvLM6mIRKpZ84ZwFyNvBWzhSReTICmdroZm2le
	4hB0Xq1VH2ZIvl05HJ6WGFHG+HnQ
X-Google-Smtp-Source: AGHT+IGCyKya6WzyBN16MEpeZN2uX9SoAuQJY8rHWzzjsI1adcqgzMZBDftNlN8shh0ccTOLI/9j7A==
X-Received: by 2002:a05:6a00:1888:b0:736:6268:9ec9 with SMTP id d2e1a72fcca58-7376d6ca21amr2967984b3a.16.1742376721829;
        Wed, 19 Mar 2025 02:32:01 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115294b3sm11124315b3a.5.2025.03.19.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:32:01 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v8 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Wed, 19 Mar 2025 17:28:58 +0800
Message-Id: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqO2mcC/5XQu27cMBAF0F9ZqA4X8+BD2so/kC5d4IIih14iK
 yuhFMGGsf9uSk5gQU2QcjA4F3fmrZmkZJmay+mtKbLkKY/PdWi/nJpw9c9PonKsc0NAGoFR/UC
 VKajBT7MUlcQl10MM0nFTzc8iKb9sed8f65zKOKj5WsTvUqgFw0RwZm2pZYXqWxlfv+Y5XOV26
 9r24Wnw+XYO4/Ans8iv37Xa/BH82exyWhPBkl17AareTzmoOCv0nlFE+hDpspg1p+5E1cwhz/V
 A6agLvdFWRFPovMVIOnmxYMFIJ4wdsdHNesU1T/NYXrcnLXqrsF2CZA7/WLQCBYmjaVvLbPvdK
 WvSwjuNdNRctQEwvasvJWiPmj71f31xw7jDaMAZZH1GrTtt2n9r81cbYOBjcVOLE8YUnI9J2B2
 13Wt31LZq1gldpOgFw1G7nUZ71K7qRNEEzUJJw17f7/d371OFiOMCAAA=
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742376553; l=6178;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=AkMKflDV4SnttQ4RQACOIUwHeZ3/6SS3x0SYtLJMq30=;
 b=o2OSsb/aqFHq4+VWQCR4ZvdMZZdj1/DBzMlTdG7+wGPUzPznl2D7WwHKs+aYRRjyuTMana6ck
 vrmjSkmVLTfAkub8lWttmqqo8xzGDYy+HwaNPJkb/qamy/eVQW6AwCU
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_023203_019223_9BBCE66F 
X-CRM114-Status: GOOD (  19.52  )
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
Changes in v8:
- Patch #2:
        - Fix code style
        - Fix comment style
- Link to v7: https://lore.kernel.org/r/20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com

Changes in v7:
- Patch #2:
        - Adjust structure member types  
        - Default to 400,000 Hz if `clock-frequency` is unavailable  
        - Fix code style
        - Fix comments  
        - Kconfig: Rename "Spacemit" to "SpacemiT"  
        - Use local variables in `spacemit_xfer_msgs`
        - Rename `spacemit_i2c_wait_bus_busy` to `spacemit_i2c_wait_bus_idle`
        - Reduce transmission timeout in `spacemit_i2c_calc_timeout`  
Link to v6:
https://lore.kernel.org/r/20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com

Change in v6:
- Patch #1:
        - Give a brief clock description and a clear clock name
        - Changed the clock numbers in the example to match those
          in the mainline clock driver
- Patch #2:
        - Fix incorrect comments in macro definitions
        - Fix code style
        - Merge `spacemit_i2c_xfer_core` into `spacemit_i2c_xfer`
        - Remove `reset` and `enable_irq` before each transfer
          and place `reset` in the probe function.
        - SPACEMIT_I2C_GET_ERR -> SPACEMIT_I2C_SR_ERR
        - spacemit_i2c_recover_bus_busy -> spacemit_i2c_wait_bus_busy
        - Support standard mode
Link to v5:
https://lore.kernel.org/all/20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com/

Change in v5:
- Patch #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Patch #2:
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

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  61 +++
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 602 +++++++++++++++++++++
 4 files changed, 681 insertions(+)
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
Troy Mitchell <troymitchell988@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
