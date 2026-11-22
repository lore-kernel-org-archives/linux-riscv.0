Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE1606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyMKVjOE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmmK6gbu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8SHqxkwELhafzuVtmjq/Q1agcP5WtkutPb9uq4Grrqc=; b=uyMKVjOEM5G1LrChkwR1ZUnJJU
	MLihr+z/vsjKzoIHSFmPu/dDIKyt7aolHA9Lt/0haGl1Eav6Hhh9wMDFvb8dQT+pvNARicy7wWXOB
	DaVeI4Fd2excJ1SGEguZqr/ANhpGbupX6QbWSOxjy++oYE3jpjhQVKGxzSc0Tw6ykpaugKXZwYDOm
	PN9+uHvHyFxli8Umyt4qH3o79rZ4l4CjCn+HBhuz+OICKear21kVct4MGFvMJ3vZVg51kIQCMLdwP
	iDyqOdRAiLvX0oXEEGUHLe6ndFwn3tHhYho3d8KgrT8tfzDMArQLGO2dxWVf8adLHopcqenjZpgEf
	xruXW6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5N-00000001cGf-2pTK;
	Sun, 22 Nov 2026 19:18:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5K-00000001cGA-1dgD
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:18:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1688077f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375124; x=1795979924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Uqhop9ybLEnfZjiktNvan2dFW98Stkgcu+CDpZ9vF0=;
        b=CmmK6gbu8Lj/MRyHu07H+qjioD6MJsyD6EQuyomDxmHK3ZK/PNKysbiusSnvTumt7M
         P/TOvUapyKTmTIkuy6M010k9o24JMz3jEI8Eb4NjzF+0INsBGV0DrZbQa5fzN0YbMbFR
         n5K1bqg0VJQiI61jmnCv8UtvnqS/MDoDea+iXyy/9TdUnutalOk7tCeWoG/6Vs+Ij1F7
         9/KWL/x3LYiID6DTv2+hNK+hiLNzBgZxXhq51ZMVOrkmN78WiF5oUGl6L3Yg+kF+VH37
         TvHhM3l3MVEqGl9MQn1yfsNkSrXcZ51G9mt5J+e8jgcV9RyOIUfTsj7xprzE6R7EVZnq
         TnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375124; x=1795979924;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Uqhop9ybLEnfZjiktNvan2dFW98Stkgcu+CDpZ9vF0=;
        b=k9IUsWPfT7pL3fq9oEQHM/1JJwrSlsuIiHokNyWljFkuRF7mBOVMiAIdwllwwzyL7o
         GZaC1W/XTwu3ZQk4bN4GhDtfDGdCjvcohE9ycleCMq9nnReu1HjnKi1iiAAQ3ve+DYJ8
         qyemzpQOIqECrS7tknPRXrqNILwu1xRGOfzCeIscqYnhaIj/A96zk7pxW/kB4mn9Qy1+
         J9q8kYYIu1/55qp73tgSZXOs+Zc8mXI4CPoFmdfC6kyJFpoSSywzo758LFnlufhTFivp
         p09uswj0AaA1MIK2GIsPOedO1ES+0ZneSm8w49bBdA+AYv+UjholldcacRsFZbiSne8M
         tIYg==
X-Forwarded-Encrypted: i=1; AL+hErFNAMWFPtW6AescpvNto9Enc6aPgN+9LgYZITgP8gXU73O4uV6IyZNnCtgs0AfLUefvJS29FTwHD5gjlA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9G5wSnHAHLhKy6Nnijt+t302GBROSwVWCInyOkpfU3aAn5QftI
	eAUYnlUSuM53xo3D3m9ULL50O7O9sFs97/ssxLAaQ2u8+SV23zeZxZ9Q
X-Gm-Gg: AZFdTZdSz+Lb3aMB2dQARggHpEi5OVvQr2PL71ASVsPfev1hI0cAe+YZzXpITzSt87j
	biXw4A1LAnw1Wgv2OVVXVw4xEvADPt5lIYWNs4BNxiyMB6LmX171VE5erOmF1ye3p87PI/5Gz1/
	k2du7BU5JfFO1oa3InZ/0kVRGfgZOqDTTAerJQ7SYfgFs6ah6tbHubOVMYvRfdajO4/Z2CKCyPd
	v/04+7QSFtw1qWA6yoIrhuinEGHBJEmzGdbAF15Jn18AhRVLlUe1Khdu6pU6GfD5IcPmD0sT1gG
	7MdPXbhbQXjN/pdsHXl8CneHKVXFbPboCFjkdYReq/JL6kKsmt8sgiC5z+QSwhvZc1zAy2aDekP
	r1UTnu+/kiDv1XW0T3w1pcsEyVlShSFIz2+0QNOkdHc6DrtnfwMQknBb4XyLAgVXKE55sPhSsR+
	rOV29/f0BY7oA7dwymLuxhogYjt94aBEEO9jeJPqlOluVkubelgOEdleLhTb8Fa1J56C4W30TOe
	KSo4ZZvv7gvFAR7PMJc7ez+XYDdtRTctvNzAkFsBArSyg1PlnNl7eRAL+aejqorCiye3BTCpUMn
	CsrmPNblWXsw+iAHe09wsYiefs520uEN9VOR6AfyI9gV
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr196302675e9.31.1795375124413;
        Sun, 22 Nov 2026 11:18:44 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm19437148f8f.13.2026.11.22.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:44 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 0/7] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Sun, 22 Nov 2026 19:18:42 +0000
Message-ID: <20261122191842.2183685-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111846_697073_ACE69633 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I tried this series on a DeepComputing DC-ROMA RISC-V Mainboard II
(FML13V03). It uses an EIC7702X, i.e. two EIC7700X dies, with 32 GiB.

Setup: v7.4-rc3 (4843f6873f7c) + this series + a minimal local board dts
that includes eic7700.dtsi and eic7700-pinctrl.dtsi and describes die 0
(4 of the 8 harts, uart0, the firmware reserved-memory regions). Boot
chain: OpenSBI v1.3, U-Boot 2024.01, GRUB (EFI); the kernel takes its
memory from the EFI memory map, so it also uses die 1's RAM. Initramfs
only, no storage.

Config: defconfig + PINCTRL_EIC7700, DW_WATCHDOG and RISCV_SBI_V01 (the
firmware's SBI is v1.0, so earlycon=sbi needs the legacy console call).

With clk_ignore_unused, the non-I2C parts of this series probe cleanly:
eic7700-clock, eic7700-reset, pinctrl-eic7700 (with a fixed 3.3 V vrgmii
supply; no pinmux consumers yet), the four dw_wdt instances and the hsp
simple-pm-bus. The console, interrupts, timer and SBI reboot work. I
left the I2C controllers disabled, so patches 5/7 and 6/7 are only
build-tested here, and for patch 3/7 none of the pinmux states in
eic7700-pinctrl.dtsi were exercised. I'm therefore replying with
Tested-by only to patches 1/7, 2/7, 4/7 and 7/7 rather than to this
cover letter.

Without clk_ignore_unused, the board hangs during/after
clk_disable_unused(). That looks like an issue in the already-merged
drivers/clk/eswin/clk-eic7700.c rather than in this series (I don't
have a single-die EIC7700X to see whether it is EIC7702X-specific), so
I'm reporting it separately to linux-clk and the clock driver
maintainers ("clk: eswin: eic7700: EIC7702X hangs when disabling unused
D2D/PVT gates").

One build note on patch 6/7: eic7700.dtsi now references i2c0_pins ..
i2c11_pins, which are defined in eic7700-pinctrl.dtsi. A board dts must
therefore include eic7700-pinctrl.dtsi too (as the P550 dts does),
otherwise dtc fails with:

  ERROR (phandle_references): /soc/i2c@50950000: Reference to non-existent node or label "i2c0_pins"

Is that intended, or should eic7700.dtsi include eic7700-pinctrl.dtsi
itself (or the pinctrl-0 properties move to the board files) so that
the SoC dtsi stays self-contained?

Thanks,
Mervyn Pretorius

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
