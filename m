Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962FBC282D1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KDwKyDnEZYEi17DWTu43vmqqV2WLO+MWDBoUdxHz6+c=; b=uhrgiGsvWHW4KZ
	MwbhlcoOGAwVTdXbHH5CiwY+2ZhMvJBUF9TlFdD98DT4nClMZZgwuX/EF5e5KeJgpmU36Atf58puc
	y5daZWEcL9lw6D94DAhtfErIqWUi66Lrtl2sn1VHSFeJEBuPh/DPvcu9KOCap7gqqy0pS1nelAu5Y
	QTuSyGhHc0h1sEOKxsJcnRI3z8rR9BfqNoIZclF0kNz8sk1jG6BJkc9ZBouricfBdGqvJVflqQLWK
	ivSxBnWwMMXn+YLu1WzG86lf/RnmaLkrvtRLbLSntl3CPNfGrPkt/p9wp5HzfHpCG+wNcj/KsFy+P
	NgTaxRGA9oG3fMAeUnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyQw-0000000HFkf-29I0;
	Mon, 03 Mar 2025 05:33:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyQu-0000000HFkF-09qd
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 05:33:41 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-220d132f16dso54084385ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 21:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980018; x=1741584818; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=jtizyVNeV58N1GRaOW9iL7eJ5Q960PQA+DBx/14QgcG/wi+Pfxj24JG3/JlRvw8oY/
         oWkvr4R1g2wlzWO+fbipnY4n329heaP8tBXessknfFWUI0zAObYOcnaXb+RZeJBN64kx
         R+7CsBDinbobspED1Qh66CgAQqm7/WWAE3UOd5bmgAdoSQNuenNSe3ns639kYWxp9Ypz
         51JQxy9tmXMbidzmJl2Jf15y3bV+X7+9aBqJf7o5xIXD93nftZATuT/gpyEn2+wHzAeP
         3x0r73mlOrmBwgxXXxAVptQ/4dRFq1Wy+0FEoIVP730LOBJx62jCgjlSWDjS5VlgV1Ka
         670g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980018; x=1741584818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=YfTgMn/xyQSQGRE3SeSqeQau8URcKqTEXtiatFLDMECct4UGCKvZ4grQbwYbmOVpwX
         qWbq+sBa8eqNkuKH0jbY71Nx7e5u+7qauCeLd5Tfttvq0EQJp40YwifiHZDZhmImA0ol
         Ke6d2rSejrsdn+JbqwEOVwKQxUnAjHzmGlb9RuKDleNDKz2Lyd53NhCeBP1y2XB4bCGJ
         ffZUU8HLJ3iKhSUmilRsJoCSR4VKUOEZcVo9Yu1llLIDhjiq/CKlTS1ljLzk6jKMlCMW
         fCXvLB1jseOiPI2IatDxCYww9JrZaf0SmUKnz5QeY4vCJ4ExE9Tws/D0EYjUeAHNbBI3
         kHfw==
X-Gm-Message-State: AOJu0YyQOUlEnuvZ67EzC0S/jeHquTIRWK4s+K/vvOFFbT6eXIU3aQxa
	KBp1NkrssRvXLfKNB4kRYm4POR3M/sV3BXOMT2QbHMjcOr8gAQFx
X-Gm-Gg: ASbGncsedi8EZmr9c+jCMXqsS0r5IQhPMDoKe9B4yQu41fr1AYWjkuD0tj5UdZEuhyI
	ZcjgPkOJdR3BC2o8/fqXmdFZp0Q28X/GXZSh9jwX9QhKD3cPwjI1VElwmBgFRlUMy1VALQQB2IO
	nqY+vzpZAHKK+xk8DScsnc2r1dmAJ3QBW1+ZQeZuJuVhRw2iNpozrUYShm5TIWFwF/JuvNwyHb/
	LuWDi6u3D04vB7s4SCLYJkgMZcAb5m1tdyI8IbThPJ5G8gjN1mcJclJCCvWWOoJC0wb5zypraVD
	2oTE1HUiudqDKYUj54i8i5+tvkeOmjzvrLRD8t7/HZZ2KThKYXek
X-Google-Smtp-Source: AGHT+IGbXxluxQW6FaZUoHMuYCLcvcCCJ9B5cuRUXONbMkfPqLEfzADvL4kkgN3LWbLuD7i5KGYwOA==
X-Received: by 2002:a05:6a20:3945:b0:1ee:d17a:d632 with SMTP id adf61e73a8af0-1f2f4c95d1bmr18909910637.9.1740980018507;
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH RESEND v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Mon, 03 Mar 2025 13:30:54 +0800
Message-Id: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI4+xWcC/5WQPU/DMBCG/0rkGVf2+SN2JgY6wgBsiMFxLo1F0
 4BjIqqq/x0nqiDqgMR4Zz2P33tPZMQYcCRVcSIRpzCG4ZAHdVMQ37nDDmlo8kyAgeRMcPrGaQB
 PezcmjLTFsi1r1ni0gmTmPWIbvhbfC3ncPm0f7shr3rdx6GnqIrqVDQxTAoBthNRgBOX0OQ7H+
 5B8h/u9NeZ217uw3/ihv7gjfnzmiOnywU/CqpiNTIOe8zFOazcGT5tEuXOCI2LtG6gmNXvyG9L
 s7EOqCoMWrK+V1IgSvHWaNyBbh5ppptCi4BaEkssVXRjTEI9LWZNcIiyXcFBXvUySMspa0Shjt
 BC6Xp0ymyaxojlc0yLTijFVl7laYOaahl/6Xy0uMF/BXLFScSE3XEorlfmbPp/P39Z+HygxAgA
 A
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=4909;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=6sHXAvzsP+r1/I6tpeLEGO+JZaMbG5gqUrghqgt3eew=;
 b=AyIGByemAuDfgV4XZYaeJW7eawBah8yzyZfzbqVnQTLWMfG8F3tLcKIJJ3XCF3bigU/GuK3ZW
 1yYt5t3MJQuD51BBNof6Eb/g4fUy4sdWNFRCKXIoZPduh5CsgPnMtKc
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_213340_091783_9DC3255B 
X-CRM114-Status: GOOD (  18.19  )
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
I'm sorry for forgetting to CC Yixun Lan and SpacemiT, and for not syncing the Kconfig.
This re-send also corrects the warning mentioned in the CI test.
That's why I'm resending this.
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
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
 4 files changed, 694 insertions(+)
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
