Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F2606A320
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpT4DJK7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRNTpBN0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hnXwRdDyIGaKjNCHHyt6DhibVw09j+2mQoVgq6na2pw=; b=NpT4DJK78e5d7MG/CKKH/qSkQr
	DCesNzqaJB4S5UId6jfHRnBSl8Y+34Zb3rrnopYmdo4X7gf45TjmAV8sQtQ/rQQplNWmD3/eybNp2
	1fsV9F2bYKAFh7vDY209qolHp/Qd7aKxmWLG7uayUQ8RXPtchWpZJVuvv5yZpd16RZjoYUYvYDWSP
	aj/UXj2ZRGWtGkWTqh+C39val/3p4a8kxy8GiavkBW9Mfc5PLpwmqozAz3nFGcGyJTo3fkWh5VvNP
	iKCmATVTGvE94Rg6fYdMOtLddII/udPPPGqMXtP+pHYYzW4IBtIAqMq6onasOC9oBcdfJbnY/hJ21
	zjHnNWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARG-0000000GinU-02Vg;
	Sun, 08 Nov 2026 21:28:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARD-0000000Gime-1sYn
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:28:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so2057765e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173309; x=1794778109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=HRNTpBN07GTRbHyCX1tzopMNfdp41tMBofbwZRjBao+QIt8CSAjvF4sNeoqjBZldMl
         WIFVG2i0Xz81DkrIJAWx2quAST9+AeDk5BKIOK1n/ZRD+XvsnWRlEVR7yIn9lLxSMLmg
         BiAsc4DI4yj03LCPm7LGnUAZgDK7eM+1ix55j9NfRBsGysTR6EbD/caY0ccaKLQVGpJW
         y7PTSNhs1qetvhdUxAQNE8Se/60c/rYQGbm+0m4PEbhiBkUvfZ/5d1H5gNmtYF+OVFFK
         jrmGoLh7mD//toazCJ9yxP4GVaz1aAXAhW/3CqG2YIF3GL48AJIVffq5rk+6SezYNO7j
         yYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173309; x=1794778109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=xKVffhv/jr1HVToHedvTquyb1zAD8JY0bNqtdKGQ87Ht0hmZ5GVMrdyh7IPw3WA+BY
         XcTFETvyW8s3NkfjcfYUMJCgdVthDkMIyC6JL4R/atlONUzF09IbbCHTixr4Q815KA7v
         cp86CgA6L19x1QcyBVI3rS/c+4tAOeq51JCoXfyiKMGfDi593cEMg4Byb+gVlmqXvftD
         BZd8phmB5/Iu2LRsGycESb6+DJ2hvb35QW30C/za5DLEDpr2j1p6w1j/fLKrZ+MRlhTy
         lzjKEjXzJH7n50cskIRJXHKqeAu70XFVDc58jXA0Kba4Gi9UlZdPSH63W22xXLHuSx7s
         WVSA==
X-Forwarded-Encrypted: i=1; AL+hErHT9z7j608PylU2EzXp0pNDCrjfEB7cyaIT67E52FBQQilPL5y5+QxeQa89wPtA4st46vduxd9WGQ7OvQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+L6w0jW5hPVffUOjcKSXFQWgGnk/ztmm+kcun0SUbDQ0hj7xi4
	l7Jg10f5wLkCHku/WvDf8Chqz1MpqIo6TOQcMlFZL3BpIuUqvBVL/ZXQ
X-Gm-Gg: AYBFou2lhl2Gjp6KDJ1kxyoGUxLpjj110bzdRoxolf2d7tr3pbalFOOUltL0yUwTYmv
	jnlD4HJ1HwszFyfHie8uvzu9iY9VlWME44gww8EWH63FBy/zdw1+P7CJxLa4VrFY2eYVy3tigfV
	NfZk0zvL50XXrPTkQtTbPYhU3i4tP1UFGHmrsHAJbp3Ed386SDKK57Er1m1Dd0Y/rHqQ9LH+P3L
	JhJ91iXxdDZx+vUhT172LvzQqDr/FkECUJ91ys5mTzKcH2Du6k0UAPsVtNFlDl+CHVIRlqRLkyo
	AVSnEAPiWFEe4RWSX2h/EmBspize2upCyRHScT/jqKkZP2fB26FdpPQb8b9uHApOmG4G44lrvGu
	uvt1coaPGZpTNEd5aOehI77mJUJeSKxcHmMmHlD9nujNC1CcwQcQryytn+tvitlXZUeD6Pqrn+0
	l6Ala9rHoMmLyQ6UCWZ2smpM0JUyvK4w5sQMcVMClLoTq7pNC+tp4/s/OFIvnfjT2SC43xAw4zb
	nDIZWxdHPGffbn/Ccu0Ccu+NFzOG6lzn5s0n0xEwRWeeon1qZdSiRNhZXSK2Z6ttt1+UJUUUVjG
	/qGft9c8sapqvFId6gogX8iUyNZyBL9Ggw==
X-Received: by 2002:a05:600c:c16b:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4b963c6754fmr40690035e9.13.1794173309099;
        Sun, 08 Nov 2026 13:28:29 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:28 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/4] rtc: Add StarFive JH7110 RTC support
Date: Sun,  8 Nov 2026 21:28:22 +0000
Message-ID: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132831_502320_B431DCD7 
X-CRM114-Status: GOOD (  16.70  )
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
support. This series adds a binding, a driver, a MAINTAINERS entry and
the SoC DT node.

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

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com

Owen O'Hehir (3):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 323 ++++++++++++++++++
 6 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
