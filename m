Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C59606EEBE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HUEeKYDw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvL/q3FX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3uebL5NOft7/1AECYFOBEkmDUVDecJE751DQPlKkOlU=; b=HUEeKYDwNzN9kG4znSa7O9949R
	IniyNZXhjeXsPdvqVzcA7G8TYpH8hLuTc/mxQsrE8TtgblcUOMABJ0BbHsC+/yFaYlmv9bFQGDOkU
	7D/qruV2GRvePVYXKQvMFDhF1hDsyZ/33zbI0rbzEWRTTVsaqCdld6YC3DByElsIugEJ9uSwuxgW+
	dJJjP/apJEUEa2+yji9RSnFboSGRUc/0viKoffv/lgF+BcCYcrYXYVxq3aUTGV+nGi0xcoCGBcFZU
	YYkVLaHXgedV04i4ClDV9cBnbtRqaP+5gjEJXpCKe3+GffEomlnuw6PH53WPaWxpSMfjQk9vypRsQ
	Zl737NJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYZ-0000000141f-3TOP;
	Mon, 09 Nov 2026 15:45:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYQ-000000013y2-1LCS
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7026135e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239104; x=1794843904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=nvL/q3FXmzgAvEUb+NQ0tKfqTdjkAkQsnL5RVZpmbWvi0QKqUcIiKhG5rZsfvpElQf
         49klzc/lKBqaDz6QBqRH3uPnXXEtGR24yHR8cELR/26Leag0VLAVSgZCBin66xOBq3Tt
         i7GDOM01/xcXj7gg6tY55P0+qu5CWzPyPUwllnHqCCAlkx5iZgAfdDon+Hfwh8348+oR
         qc1icaO2dE+M3yINeAiLGBgJsm2VSe8DuxCOUcH9bBE1Sdj5VuUmVo0TY/wxajdWpLsr
         agAqMAjddNOwf2uw8SblhqM7+oCmsm4lD5D22j7K/WZn8rpGH5/w4iDrXekTXR+Wl50V
         XSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239104; x=1794843904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKfLZbQgYUYCC33oLQtFHXrdM0UQjzaXcbXsbGQdHjk=;
        b=Rh0Mwfi6P0QUsWf610nB81tfYzrYUxTnPmOdS9vjx2pGkNEP3gncNW4cCShPy328sx
         ocD3OHiZP92N+F+LKEL4UyfbMN8/HKscQjwKvIYQg/QvWKMzu2zeUwphi9/7QlnwuUlR
         d+JP7qHodj+tTsm/qCz2je0CgtKR77tbRgtwqA61rr3p2kSb1OY4iA88I+mxD9bEffvo
         gbatmJq/hePhvw1HFTyInQlxPKkU+B8BhfHQjcTp/HwUMKk9ykQwIWMS8ldy8jFxTJlg
         2K7CVOpuOv/TGxPLCj0pAHP/3dzlHCKB6sTWyLYWN66x3Yi6KwdUyG7LV9LHuSX8boRg
         w3xQ==
X-Forwarded-Encrypted: i=1; AL+hErGjIpRhRHHWH1Umbe3fyHkCawxkZDE8UKM4zqsnwfesDCEN2ocXtj0Il4HkKSUrrUWIUm5aqkcvlcVqqQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8NSUG1E/VZG5wSMbAIXb4nV8QXZ2Qi/o/j41H+yijUoBLb9bj2
	txHAkciWzgXJIdDOD0DWFKfJ5J+BkzJMTZl7KQvVkddHf1oncfPwKQ1/
X-Gm-Gg: AYBFou3FGs033tKrUjBsKA/5K9F/Yz9nVW5lFCKx5PuONctnBi7pl32VYjgQM395EZh
	UvF4N0JILrBPmocv/0343Xbf8ACo9Dk251xaNGPp5I928xhneyqKBn/kzTRFagrUdhwkgQHcOfo
	9vbXL9M0tZLc06yBWbVQrhYXGBD4Ll16iNu8BkEXVtEit6j4XRjBlWtoQCSBKD1iX+Bd04F32Cx
	crJH/8KbLVa7Mglw5Ke/D5OSfIPU8MDq8to+o7hjSAAoUEntiTuXj6yNZFiWZJ+syB/ONr3ChWJ
	0pJ8mFqRp8Kls+PwLXxRxP8VIDEFDnAq3FWLp4BJZEJ1AbLB0kOSX7sRJKu4U3slxnZK35C4Jy9
	0wO2VlU2+vvzbPVk3HKsG+c7/ryFzn2TdQ92Zk++oCv0ZigeRcTvh1APvbT72xaDUuYNCpv8RIk
	coa8ke5a/PI9JwhfHMDgmVlxD3WIOTrXFsh3Zk3V35qMpnqyKAWhvZAXWSBVb+hYOIxyjvklyoa
	6O3xm766clfNPC7efTaJlDqAz2z8Z3hTrs9w4Xp3qMt/SdtTGeHTp7xtdQOZAPNhgf8xaX4c1Oc
	5/SleUvfBDinIoGWFhDVHYZ52uj9jgjivM6v01j6hUGyPFeAMsXWqlc=
X-Received: by 2002:a05:600c:4505:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4b963c85de8mr84815385e9.33.1794239104072;
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:03 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 0/4] rtc: Add StarFive JH7110 RTC support
Date: Mon,  9 Nov 2026 15:44:57 +0000
Message-ID: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074506_720676_9FEFADB3 
X-CRM114-Status: GOOD (  17.84  )
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

Changes in v3:
- dt-bindings: add Conor's Acked-by
- driver: add my copyright line; drop the extra space before the
  register bit field defines (as requested by E Shattow)
- dts: rename the node label from rtc to soc_rtc, leaving rtc free for
  a carrier board's RTC (as requested by E Shattow)

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com
v2: https://lore.kernel.org/r/20261108212826.15890-1-oo.hehir@gmail.com

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
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 6 files changed, 442 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
