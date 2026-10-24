Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4587D606BF1C
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8U0sX+H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WeUfECs3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I36Cpxv7QvD6JVVAEzZzUpclu3zcaVJS1pkeAZQ2gEY=; b=X8U0sX+HDaftTRzahPNBhbbZ+d
	qfVtJ44lqVbeEercK9lkyhvGY0nT8hVPxtM7NisFhrrsVF84iEIoHAZZNqn1UYmdUZgZSyJYmcbme
	orPpH8dmuW489iMKpJmKJ7jiVQsP65jLqYDJFhTDycDIIzeJxgSS9yfUjyBgORGt22VDkIfBxqgZH
	67LfHD4pujaY15Dp6XD7BSAYG5iS1DG7OH9rkpzbr7iUa+fPX2NE1NITCDmQFbVgeOV+lFkLQC34Z
	Pst3/zlSvrZl9sze+eQk1Nxj2k6Rpk+kml/CmmH9B4maTTllWe0s9Gf4BvLXf4Ehkprqni4D82/B5
	pI27rm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY0x-000000002mN-3d27;
	Sat, 24 Oct 2026 09:26:13 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY0r-000000002kE-3Smz
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:26:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso535198a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Oct 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833964; x=1793438764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=WeUfECs3h8ZrpDHGWS3kKIrLmHjAXJjW4CnL+Z2RUzK38dOqvym+t/1d56jMU65jrG
         LIt3E55dIAkn4rhGvLt1Hj+qOGOCsc+8JXatv68Fepsg5TKcHF357oM/RhrrdS/ugGcy
         tXjjXxJU2XUEczMLm936e+f2VVxZdH45Lu3tMrkq5zzTEBJiVa8ATSiOPkIOhlm6/Qu+
         yneWaOex8MP9EQQwZodHv/dlu1XIHMrnYPBj03gIPpYuYacMp/hrALBB6mMlTTFwLQbB
         okfQMKogSBhNuvZJYpSGuO7Tn3Esm+uaabAi9lZ5CXvu/G1forygvdEi3m5GP4REsjSz
         +yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833964; x=1793438764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=QiZHFl1hCtaaEdtxSN/ATZXcEghJsxxLz5ng1cKBvDjyx28qDoo1gKiUn5WkryHxbn
         0lApL+EoVFKj9bhgGN28Vl23kd3aFlsYuBVU99E9iLKq3HCX58zuYMvkgOKX9smg9ccM
         /Yb4s9gLj6Ux4+yg+mfPV/2NMrT2ZdlasuwpoQjccO5iwr5CU8CN6XNMdEZDIq9cLtCh
         eqY2GOOModN8StJAch05yE9dsuRsyyXpdQwlF0EjYisbr8z7PG4M75Ap77LMEHlp6axZ
         E/Zwvr0rfoFd7/UvnF8IgZZ/ZS3HRiShJ8Xfzb+QD6LOHuoiCweF+QCJLPIRNX1ABRs8
         soVA==
X-Forwarded-Encrypted: i=1; AKwUvBwF52kDOMYhO9LdXbRm4pVWTn1+DMh7IBbRTeiCG9+9zf82Hsgi4tYU8ltzsSfSHKh0rSfWMDHBIGPkCQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLHq3WNyaOPj9BVCuwfTTPpg5KHFgKImeFit9hvRfrb4hpUAgzG
	mGFpxe66c5+OwOis3Lg13IPDSe2IVyO3ZrAJZNauuyC2yV2WUdIeBP0p
X-Gm-Gg: AYBFou2eg6nRl/CuN9aTe//lN0Hw3yZG0HbbsX9VpApts6Cs0AK7hqIzb2mxuQmzVyu
	h1O9RbGxAxT1oeyW8pycf+KXndoFDGaVey74A/ZFg9k0geRsU52rILKJdFdxQzOSW6747VB9Gnp
	xN41oRdKRLhF3c8jCRHqe1q8iBl5IYREPv8Bvp//1H+a2NsGa+4N/Q9N++Ii4jVDtYWoslwDTlb
	l0U4jw8jb5u4o14oKBD1Mk7Dra+c1JOXahTY24skilQfFy417wT/6fLl/1tHDbQMPT9a5lTYu4e
	pIvNez+hphjhPm93PDdFDWTMVzLQ3O5WTZGX6hkUIuN3n3EPFTfvB+KVEE2kiP7VxN2IaVP41hZ
	/YFfjuiHu6ZTiwITw2yfKhZH0AKIbQNQBM0dPuthAjSre1blA1MNoxuZcDouBxCQ/MHPWXa89A1
	l/uu6/LtLhNren/kqqBeEK2Jy3L2kko/h4cFV/fzBERxWafdg0XYyl0TANBPLxctMtewg7fGI8l
	xhE3tys6OzU/Lz7j77RJ1/BjjUEj9XoZ6CPsADxVIaHv9JnSbiypnq8sDW/kEL82N3gc/WPnX1O
	kV1LGoqsauqF9aPtD3kn94QO+8sYOwJpkH4aFttuzp0XJVKDvYfetd1EnlD8pKs23yQxrrDegvU
	BMCAncOP7Q7skbMzgBuGVk3yh6Pj+eC4pKSU=
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr1496748a91.32.1792833964552;
        Sat, 24 Oct 2026 02:26:04 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:03 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:56 +0800
Message-ID: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_022605_870985_8F3D6D92 
X-CRM114-Status: GOOD (  11.23  )
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

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
