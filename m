Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6210606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LdAXV+cP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Am1Uc30F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xyoquFD1Xvx3gdROMT+O8KJdGElV/6s8xbGzYEAW1y0=; b=LdAXV+cPyB1sO19Dxswot9QEMe
	DvPFOA8P1BpZipgktnvu0mhIPm9cn8KGFNH3oUYCmozmWZhOfE+q3EiOJzaYRaC4+OOFimnT6XseL
	7vQG5odn2OLpGM0bvARtWiWhPAYPuR1RHUL1tICBcg+n4g6p7zdy+M3YpvpiSG6PMjHjWp8QhOQd6
	DTxWZxcERwNqP/0U7fShXkcXTFt54vrDZLwHHMVhD/nkBd9nXearYeNmCBmuVAzjL1geEynhCF+J/
	wD90RpplNUi0AgbtjR3zAdPe9IBs0THMhJJQmp2ZJyCudk6/QQ/xssmWA3cJLdOza7lrNTG4ZlkE6
	NZkAwo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAc-0000000DJfE-08jv;
	Fri, 06 Nov 2026 17:56:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAZ-0000000DJdc-1xBg
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:56:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9617325e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987765; x=1794592565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=Am1Uc30F/pqIM44qGY5J7FeHvrMyZUGAXw+uiCnVgXSQRP+d/dkmWEBz0QmWGFcBgX
         TY7Qvmw04H3EVNBE/y/l1hGZHygimjerJfeC12OjHfXJV6A174FHxi+FhNvvA4ayEYCD
         CW7JviEXwDyvfevhDMM7Z9Nef2fPuJme792rPz4+mEubKbbjwlGdjBJ9jEYieekcEXuo
         R75v+SA/8jYxHJ3qXjjofI5P8pgAWY2LBtFV5p1MjbneP1MqTFc2xlxnepczqUwujh47
         0zp3R3QNLd7StZMD+NhGQpNktEydZzpj8kqfrvbx1XbG18ELjQsKKTp//hKoZUxiN+Q7
         wGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987765; x=1794592565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=N11QKv/ovTyELK/oXfEaOoBEqMiQN3ptGOHtqg/b4Zk7hD7HirfYNGt3JChTaknl8B
         hoWkZhfUH1Ln+RoDbTwNgLNKd5jmhYpctm43gsWnLHDobDfSqB8uy/0cLPMloa2/pewO
         DFXvNmE9+LTA7Rh9/xCAYxTxGzyi3++xfDytlBJoFdO4WpH9cVI3jp2ODv+YOjSAabSJ
         /mVitXryIi24YFu7wQKGE/Tf3ofLK0ANdx27H8hUyI77l28cIS878RKRuLt2apB9sfex
         WMBfuCVIEQUWDf6hbcrHIW16NEwtlgxLOz5I8r5KKRSHor1A1/nxuEwhYwDJ7DCdWuVq
         OvzA==
X-Forwarded-Encrypted: i=1; AKwUvByK+iXcNTrIV1253PwlRN4Ps9zfcQKMceVmJ+dN/sBjzs/dTI1U6Fw5Xw10GqYw2ITN0idk59dn2gmZyw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9QMt/pAvrVPf+/GcCU3XiEKL20IP7cLJvg8N/LudY8m5T/vaYh
	LJkLLKsVBeuEb674OTk+c4Seov/3uhdi3VIrmjLABGBCq0MwhGy5KTp7
X-Gm-Gg: AYBFou3bZOW2FMXFcV892xLnZYYWBjvv+SeVMF9g//DeovwwoqwO4t5Q5W/TO334CD2
	cS2moiREIfgwveVXBN4ouiFgn/AvNkGq+bD+Hd754owPH4oX8i57DaA4IXB45LQth62W0w/cpwe
	dFUOwN3KQPONoHYR2Gju1TrQ7pwnjxrVvIHggjGk6r3++Aa1kDsUuNR1J63Ol59lpKxfN8YbUgh
	eQdnsmjGXZ1HSI5lFtDKKdsaa2ebh09YxOuLl+Vm3btWqBpmMR8SNR4WAcI0JaHApBv5ZSY45pq
	Q5s6VuwNqHbWg2HlR39NVRw6eKHAVAXHzpkvRtfH3cftauscr1jkGhcOo/0ck1BuBPGn1oLBc7H
	l39kcrev5+75F/ZPmFhJlr7Oe3MdnOqFBRzHxO87hBcJy6oaARBc2QMTcnVH6b1+DqQTdupOiwA
	SfAvJvr1F/1ylwjK6AifuEIOEosIhzJnnnvMPWAzwp4GZJ5yRyECFR5en6Rm8Yvo5CQhgVauQd2
	6lbFGN+GiCUva+LtrRz+4FZYfHrBg3zjtU4gjgZxIi24pDyOAYhFLtnr+vXhUfpEzeRXwVnDgUW
	N9Rqy9L2NNaLFL16AJD1SuBgUB6zgKAO4R3dZAPJ0XDuU+1rtI+p
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr56108655e9.30.1793987764822;
        Fri, 06 Nov 2026 09:56:04 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:03 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 0/3] rtc: Add StarFive JH7110 RTC support
Date: Fri,  6 Nov 2026 17:55:57 +0000
Message-ID: <20261106175600.3877614-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_095607_528338_8EA0A499 
X-CRM114-Status: GOOD (  17.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The JH7110 has an RTC in its always-on domain that mainline does not
support. This series adds a binding, a driver and the SoC DT node.

The driver is based on the StarFive vendor driver (rtc-starfive.c,
commit ebac2b5 in the StarFive 6.12 tree), reworked for mainline:
- hardware calibration and the default time set in probe are dropped
- wakeup uses the generic wake IRQ helpers instead of the irq_desc hack
- set_time waits for the counter to load the new time
- read_time re-reads if the time rolls over between TIME and DATE
- the offset rounds to the nearest step and follows the sysfs sign
  convention (positive = slower)
- the 32.768 kHz counter clock is described in the binding and enabled

Thanks to ziv.xu and Hal Feng at StarFive for the original driver.

Tested on a VisionFive 2 v1.3B with next-20261105 and v7.3.1: setting
and reading the time across the 2000-2099 range (out-of-range years
refused), leap day and century rollover, the alarm interrupt with
cancel, the offset, the rate over 60 s, and setting the system clock at
boot. Not tested: suspend wakeup, drift over hours, and keeping time
across a power-off, as the board has no RTC battery connector.

Known behaviour: the RTC loses about the length of a reboot across a
warm reboot; the counter appears to stop during reset. After the
StarFive vendor kernel the first boot found an invalid time. I would
appreciate an opinion on whether this is expected of the hardware or
something the driver should handle.

The binding lists the RTC maintainer, as no one at StarFive has taken
it on; I'm happy to change it if someone from StarFive wants to.

Owen O'Hehir (2):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 5 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
