Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEA606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UaIqs+ob;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kTAxRwZ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xyL+p24Tm652CDbzjO3Bccs6raKrgXFOESR2F2BSPWQ=; b=UaIqs+ob9+tvlndAhrwx+ZbejQ
	FzDiClPYGeErAQV2RVuJVj7afRf04zYEhEO2C/KqPOnqU72ZNLNh55QLw/ccbBbGkn/Gf4seSZINF
	PzTsYyHUJMWrJzDXstAmoLnU3Ma3kfJC4T/OlHQt8IBSbVOy0yFi9V7AV9bd5He6YBwUXfogsxire
	a4++8WUZzu3OoAy4NRV6Kw8FgJ07L7VE3+OAcv6IrnHF+sK8kvzwZ3TXpQc+firJltWRJrle+Uh9f
	17BRWZy31trOeAk0jYw9kyeLgpw4RkaZGN8j01rS+SvDecTkoGiFnJw1YBapI0I7ZiGV09/aFzrxY
	aPENpRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBXR-00000001fOE-0yRl;
	Mon, 26 Oct 2026 03:38:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBXP-00000001fNf-0WEe
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:38:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1833665b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985898; x=1793590698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=kTAxRwZ2nZAk0ZZfl1Ksa8//AL+AOx+Kwir64zq+qK8wY8bMFUVM6mk/OOyknQeTJZ
         IB6g3PJMY+fegUAKOaMQ2bNCDbeMukyWIj8pbegELOVXTZE7byD/ivgY94uiqy3Atkr3
         fZMdI+9fTaTNk4tFaq39vwadLAZ3Hj4JpsHPaMU4HDy6Z7xIZzeA1uuQP2GKcWkBsRkh
         L5zA4bdEkvKTlNr2YKf8y8LBylTxM/78G55BhJlxXWMfM46pNBGzBSD4T7pzJt0nIGcA
         7Mp00w3bzlA1eQGqEtspj0rDw+eNnrgyXDbgdAz95eZcweMrWLSo6lfNGkk4GbFH/IJc
         pC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985898; x=1793590698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=FIH+Vh7kSxorR3yIhQEdr2EQzw1b6l5WgMtZvaxaY9RZz1IHaOYsCU4DqgA8cTLro4
         fggjLQd2QYeaUFxECl6W5FrmY6uG/ajbApHR2A0SZ7dp6zGzvn4wBU9Xk/FFD7LJpElp
         IOxsjw93eISthYbWo1Dt0WJZjeYBI3e1vvPxlsxhN1Rp/tdO6jYbWdVKlg6KQd8qLU5O
         MJVtcJn5II6TEjzUHZ7bCG4LxtvfH3JACPP6vxAAi0yRM7aWrgko9GuPlZlUyF8zloT6
         g1OuA6pM69D7ZqR7nrAV85Y51Gl7fcAPxxYnKMucWxM+QetvXYGxj5JkAeFinDdsYREF
         uhog==
X-Forwarded-Encrypted: i=1; AKwUvBzcvFOu9CfA1/np/xgmDNI572Hykh5NA+wSmA3giF8yHkCW79ywimbBEPUiHqfldbIH0rzJ8tQe5aohog==@lists.infradead.org
X-Gm-Message-State: AFq9FYKVmF27wVv4vgb7uabR6zmDIYTyAXZgwToggW1IB3sEcyMqR6Ip
	wIK7+crdTLjR7pjs/s+FPiMz+cYg8CAFqjkbMR2gvqTT8t/wzPAvXEy4
X-Gm-Gg: AYBFou2yZHjth276/E6RlOQ9/pClfjmgSxCQ5kxT2Nia3PV5igDuItkvDWiT9vpH6J+
	9roqnzRwx3VNFbZRrxEOCL3GuhzGH1L4Mr367kq+ej92UFzQDcroNqMnIWK2WAdFy5hSKRcyAZb
	XQW8RXRLJ6MCE0fpVMIcrk7XOFk2acPc+GOSO8DdUwzFNDVITUGGcnNlSaGymZAXMBxuyBr4kc1
	qlvgeIMFXkHduO/6/TQOD8jQTEAph0rPhQ3MZViIup7IJJC3ZAigw7025mf1hZNBPpUOZB9Tqnk
	4xO03FFMBoWX63wIG1tFnXcfCYLaMmSBJNvOGVmkKz5E8ycSw+uq5iC3Ug9CrR7QygWCDOx91+I
	BlmxB2DetcGDdG09Z4GsxmSYD8dalOkJXeS0mF48pJgZqq5x+a3R4ghu2J/ApzNwOgs9eraR+d7
	iE5YTwZVRLy++gkxcaizid1rLX+WDedvzr/QK8quCNz4vSSuizK2SbwXnB95CE2Vxc2u52/70za
	1+K4UfUme2bc+7VnvteyhGK4O4hIPh9J5tI91QG4yylaSWhckrvLL/r8BXhKxivqyb5Bxg/jk/z
	VpnwSeiiJICv5rPx1E2lSwWpRFlrq1paE92aitLYdLRZ6Qoi/0IM3XgJDuLxDEiWf52MaZrVYfB
	17WTY1aInr7xDHTCyzT1PXTEvq6nvbOmPPbs4Grr/Rn/SAT7vROKrfJxv
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr3717741637.68.1792985898172;
        Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21017sm989192a12.10.2026.10.25.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:17 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 11:38:11 +0800
Message-ID: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_203819_188776_DC1BA695 
X-CRM114-Status: GOOD (  11.84  )
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

Hi E,

On 10/24/26 07:45, E Shattow wrote:
> Split the patches in this series so we have a clearly defined initial
> changeset that does "Extend the BootROM configured peripherals to device
> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
> eMMC, and SPI NOR boot modes".

Thanks, that makes sense. For v4 I plan this split:

1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
   sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
   board files.

2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
   in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
   in the board files.

> Capture all the BootROM SPL loader flows
> that we can understand (USB missing currently? please add this)

USB download mode goes through the OTG port (FDL button, then
"fastboot stage"), but mainline has no node for the USB2 OTG
controller behind it yet. The DWC3 is a different controller. So there
is nothing to tag for USB today, and I'd add it once that node lands.

Yixun, could you confirm that the BootROM uses that OTG controller for
USB download, and that it does not touch the DWC3?

Does this split look right to you? I'll send v4 after the merge window.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
