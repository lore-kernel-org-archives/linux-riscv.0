Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F8D3B7DD
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=087WK0AfPtyLoaB6qHi+LnDtc62gYvnHf7ZsAuiQiCs=; b=t6sTfD39IysBgf
	Lyc5FUKcVzuFghaloeEEBgTSkbNhLMeH90RQSOGOnTdyCYPpzIlBl8rLaLmRvEmcXyMm2U/yzfshf
	O6LyzkTBKu9Zd5Oi4Op1t0qhbBiv/dCkrMfyu5IcY/oTk2ZA47AlRZEppeU5kEkPJJKbTYvkWtW1U
	0LOQ/+B2lEgrmrcu0opnUShx3CVvjVctU8zeZ+EGXx83WV51ojvgP2Dx/A5mMvXLooL2iFWvlNEZV
	IrnzRKSgNmnAocEZY0lM8yjnq8rQbLYVjBC1pAbZ5eRSUZeYpmjp8zpEqSWsAgC8Le+5p+fuzY5MO
	uejly6F96GMCwI/kpZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFSvR-00000007Bky-1IF8;
	Mon, 25 Nov 2024 06:50:25 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFSvN-00000007BkL-3Q7c
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 06:50:23 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7248c1849bdso4061759b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2024 22:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732517421; x=1733122221; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaUBodTeKOMwsXvRCsOPXaAE6ByN08W7o0boJeoo43k=;
        b=MNjh321EshRAgiQzJ7jmejdxSHiDzjqZz8J2QFvu7OCKoSfj3s2wJWfRQKGHUmcU8p
         10p+0FtblSt+q08q6QIVATZPTyq++cUiBc9n+PWvAY+XG+Ndi5czQxd4iI/kU/VGBKca
         dAtXVq3vwF3sk+xfkOmHOU0nv9UFg7IDBSYvIfw1l+mbmjc3jYoavov/ui54nsn18vh6
         TiAgCiedvx5Io64CCsLVEJES+lA+jaMEa4xtxXe5aQwyRYcRSsCrCG+0Iyh4/VODNd9W
         c2xQbUw8d4k/dLvbecIOwkVCw2AmeIpCoQUtO620nusObiiIkPQJy4fEEKX6NHYV5PpL
         oRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517421; x=1733122221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaUBodTeKOMwsXvRCsOPXaAE6ByN08W7o0boJeoo43k=;
        b=fq+W9g2YoZdbg7ENVk3I8yZBzxsMsb0+iJ+DsWTtuQMOfjoaJJN6SNxET0ffQNFKnI
         oc9hvaIPFpfNDHvw+lOEnn1MWkCYTincZepY8TipxP/+CMU9m/LpQs56L7Ox4/erlcnh
         sOoML9nACZTCzYyEoY6pHn9T2eglqC6L/Ebkd6GEEg9KS4IMm21A33fYT5IMNvmxLTBE
         gX5Ig5fMYtrjOAhVkxt1aoHWN0zZt/h1aNKhhdJ70d6SyIH+GboTZpRQ88bgQVxyBPR+
         IaAvy5oMJd+opFA2xIJrH9p8zN4cLoMQp8qDySqXyv+6P5DE0FuPWyuJSQG3SIU8/oHI
         2tyg==
X-Gm-Message-State: AOJu0YyN92+agnXZRlnWWSZxjwmknFvcDKd1cA+h4Q42dhF5OPmoDtUc
	cWFEbsgqCbyo4W9Ek91H7O4hepVz1fq8e1oklCahhffAy8N0S9RiD+Z2LOI4VrSvbMHG
X-Gm-Gg: ASbGncuWc8KvK7uMIkCv605KPwPrEraMBReDA9HP69RIK5xwS8cDYoOT63N7aKtzzhn
	dW+Ik+1c5dZmMqS1Un91UGKhcKgR6AZOOaCG7aVHgH5XCv039vohlqIzyBzi0vBAHj/b6qNQ9PM
	QFdtG5Wws6haEH5p0M0YslqwnLGO42EANy+Uo5piImTguBcVyUTNt37WtVQN/YeaAuzuuoXZ7tM
	ehmDsJh7gLRfgPmkNyXL1+xPzVfbGzAM8l+PwpeLWvxRDGVX0gRShgwOw==
X-Google-Smtp-Source: AGHT+IEc+76jN1fkoIiZAGxUnf5EhQ1FQiLr+0/KShts3aQix02JzSOioD8v2fzd9/wAkNJFjG9c3Q==
X-Received: by 2002:a05:6300:8004:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1e0ca1c8735mr3389903637.21.1732517420552;
        Sun, 24 Nov 2024 22:50:20 -0800 (PST)
Received: from [127.0.1.1] ([106.114.39.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b41sm5649602b3a.32.2024.11.24.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:50:20 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v4 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Mon, 25 Nov 2024 14:49:52 +0800
Message-Id: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABEeRGcC/12Qy07DMBBFfyXymqnG40fjrPoD7NihLhxn0lg0D
 Tgmoqr67zgBiYrl1WiOzr03MXOKPIumuonES5zjdClBP1UiDP5yYohdyYKQtEQl4U1CpACjnzM
 n6Hnf71vsAjslys974j5+bbzXY8l9mkbIQ2L/QKEajSLCndKWagUSXtJ0fY45DHw+u7o+nEYfz
 7swjb/MxB+fRS3/gP/MmmoloiW7eqGE1s8xQJdBeq8kM7eho2YxK6fcGApzjLmpanbkQmu0ZdY
 UnLeyI917tmjRsGMlHSmjxdpiiHOe0nUbaVGbwtZESvq3x6IAwSCadl9GIXyscrzf79+GPNObc
 AEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732517408; l=4593;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=1nZwnEquKXcy7GGTwO7kdWhYhjDx37thIvrPjHriPW8=;
 b=0HJBlFx0e73AwOz6hU7262B65AuIsBm8C9RrrM1fnuZAIUzlwNmI7C376IhawutOUr8r4qrsD
 KIzaSArrN4sDfBCLgrZYDPccR+F3b9+efZoERyvS96YT8QRoKw+ZnXz
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_225021_869565_777B6F1E 
X-CRM114-Status: GOOD (  15.64  )
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

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

--
2.34.1

---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  53 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 655 +++++++++++++++++++++
 4 files changed, 728 insertions(+)
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
