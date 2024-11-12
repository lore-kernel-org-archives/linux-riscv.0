Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF039D41D46
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 03:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TYwzV2/HwIdZecO434m4VqBAAsrav3P+36jPJtueowM=; b=OzR2vMUY6KFdak
	fnucv+1+hlRw9T2F726sVka2HSZvYQTPMuxhXz4QGaDAO52H/kJgysplt4NI07vxUpO4H165qjHFg
	h6CWcZQ1ZY2JxPTnAxhWwwEaDn4xEVM3mSg7Z1Rr7pljFkDeo7rECvW63PL5DUn5A16Hyh9YD06Fa
	3204VvGh0Q94r7mkZcpVg65NzUikeITpw9SBUnhom9OVzXA130413y5IrJnT/3vZ+wILgFQO8uKe8
	6pRJxu4u+waqr+Mbk75MF1hJtWQYhDQRDtftpsXYZLKhzCNcuA8dQy4RoUoGberEKXDVUQpRypcNQ
	L/33uxgQ57qzy7w5dBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhHC-000000022H7-2oyH;
	Tue, 12 Nov 2024 03:09:10 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhH9-000000022Gf-0S2w
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 03:09:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-720d01caa66so4867058b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 19:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731380945; x=1731985745; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxbojmtPvDfIuSrydnIbvZP6Ty3ccGTNat4sE7E/fQs=;
        b=ju+T1/aXxZlqM9esgTPUr9NTj5h0wtIJWKghzF4dSLlpg1oOtaLaK9krCoQD+uwnfi
         JrMN4Ug2K7tB/6Zj++6BneOf8ShZFfRIUbnmXa+9JBwHBSDOIGyjFZAbmSb/TaRROpfg
         tqdnA8hzE7RqzzWmGjgPOxptYs2iuqN4l3nhq1gF0ZpidcRQ0+NQOqcrH409eoh5ORur
         EaEUMYB9LEjBwYvtW7/7qG+4kJLBidaCue153idFLG2qKA8UlTU9vZ4D2XMCKXE4B79x
         d5RgXRqpU8qZGtDhlKZsmizMUohCyZiodibOqPBwcTvunSENPaxn9huF77PdlM05d6HA
         f+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731380945; x=1731985745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxbojmtPvDfIuSrydnIbvZP6Ty3ccGTNat4sE7E/fQs=;
        b=VsW57ygzNS/TV/8ZUGdEjoMH3UEkEfHD5qd9J8+l/tpamqEV6RuF8BCt3QQnOQ2r6k
         YRW6PQ68vqQR7+lqxTfGkltd3pDrpS/NJkNYv9SW/5yoCWQbhY3k8gLzUVxLIIn/IVJx
         Nh8cgOmfPjU2bu87KNy2EPAye52NzXEtV55h7zs3uc3TuQygI56dVPvWaAOmXk6XRKwW
         Vjqatg29EKGSLt0EUx5LvP3wZ1cJzlzWCzCPFqcqhBYUf80otieZj9K9t11eb0wdMzkq
         /qLloV09yffWumdXg6AUjvAIiaXGIZbNI6Koj5g6HuhPBsa0H0KUj9TpOHPLxlgsYQ+p
         YR2Q==
X-Gm-Message-State: AOJu0Yyjssi9FMad3dipPstuoMZwD7V8pZbp9uOim6umvt+ovmj/ZYU8
	jIFpQ8R+MJ7plANyjlzWdT9F8Nd4eOgPgCteXuLkOXFzjreT7Dgq
X-Google-Smtp-Source: AGHT+IFoUAjVIGTXbKt7DslLUHLm4w0RUW3celgY5+JUErt1NqK2BrRy8QgwIoCq10JGItaM5Q+17Q==
X-Received: by 2002:a05:6a20:a108:b0:1db:dc13:735e with SMTP id adf61e73a8af0-1dc22b57621mr22128698637.30.1731380945508;
        Mon, 11 Nov 2024 19:09:05 -0800 (PST)
Received: from [127.0.1.1] ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3a9csm9873447b3a.110.2024.11.11.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:09:05 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v3 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Tue, 12 Nov 2024 11:07:38 +0800
Message-Id: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHrGMmcC/03OQU7DMBCF4atEXjOVPXbcOKteoLvuUBeO89JYJ
 A04pgJVvTsOIMHyaTSf/rtYkSJW0VZ3kXCLa1yuZeinSoTRXy+g2JctWLJRUit6URQ50OzXjEQ
 D9sO+k32A06L8vCYM8ePbez6XPaRlpjwm+H8KN7LWzHKnjeVGk6JTWj6PMYcR0+Sa5nCZfZx2Y
 Zl/zYS395KWf+C/srbaRGnZbl1SUefXGKjPpLzXCkAXem5v9eaUG6iYc8xt1cCxC11tLGA4OG9
 Vz2bwsNLKGg5aOda1EefH4wv5hfguJQEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731380939; l=3842;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=gzs3+9anRTgv3Iily5Ls73R0Bqh3ICi77oS5UhFOCOo=;
 b=JvPvC2GL3etgvFd/M22MaGFDmFSc4l8snAfZvarYe7eSru1zOAS7/H1u2aXvS7mB04H3IX2nn
 QJb/ywzquJRDn+wPiTmMBovkK/FO5BWSKjrQKG19W78EvsGUne2pxpX
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_190907_186122_8BA49D55 
X-CRM114-Status: GOOD (  14.35  )
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
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  52 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 656 +++++++++++++++++++++
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
