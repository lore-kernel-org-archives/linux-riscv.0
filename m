Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4AFFEE4EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8wX0xxzL3DoROHIZ/gXIs11W5Xu/SdkqwlSzYx9OWE=; b=4uVBUMryMoC13WIfb2ufh+XCkA
	Ik1MW/kz6BsSFX0IvlBbr/Peu/wFBsdhH1+0b07TCZ9hmd/COeFsPcDIOrkinsdrOE0ydWZ2VbXy6
	8LLfrWd31aC/3PitQol9a/Pi43mSKHGD4XKvbjiAQDxK4dd200bmZgfmeSeAaM3WU2II2G51wmWhd
	YWK3y7bMql9Y8LoHENUilF+5Xh7Paq+YY/TSCWwCjyQrRbfLsexu4C/n0JujE/ho7atK+Z/CJNYRf
	9UVWMhmFrlALzElPpbt5SQMMpj2MzD7yF8+OQ2RN1R/8yWTNQ9HWEgTWsUfPapuN3rnwY4DANj8KI
	KiKLpErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKm6-00000009tCt-2NDd;
	Sat, 28 Feb 2026 13:54:30 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKm4-00000009tCH-0o33
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 13:54:29 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id w9civVN5LCxrGwKlpv48ce; Sat, 28 Feb 2026 13:54:13 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id wKlnvG6BwHSQMwKlnvPCtS; Sat, 28 Feb 2026 13:54:11 +0000
X-Authority-Analysis: v=2.4 cv=GIQIEvNK c=1 sm=1 tr=0 ts=69a2f383
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=CuOhmx-iD_6PtcpuGrYA:9 a=QEXdDO2ut3YA:10 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e7fGm3rlqqBh8bEJU/FtF+W1O3paUmUitYP2rC8rbU8=; b=cFfl+wIFzP3nGb7qqa1VcsSGba
	qTgqOvdBgIvuYJtkP/UwO7pT/p3pw6CYBfwtWDis/FF7VSbqVFLAi6JI7KL1DRZiLYuSMSBXTUUZD
	X8+IngR+RWDpu0YN/fhAlpcVgO0IE2SMMCbcEZz2s4df9qDCBp7A4einrh31taiFRoIHWPFojED7q
	YgiAS6bg2f35HmtP5X7Ra2zx6QcfX6r5yQ59hNtYJLbRrt7pclxBiBRzFsoF0u5Zag4SOq/6jNeaR
	QuZyLLy/oNcGfoy5EAcu1r1rvrJ9TsnIPmLbYtsMIowuO4Ur9N3qnpEG0z7TSF5FGRU4gF7BvmGgL
	okvQ6WfA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:55288 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <re@w6rz.net>)
	id 1vwKlm-000000025Ug-08N7;
	Sat, 28 Feb 2026 06:54:10 -0700
Message-ID: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
Date: Sat, 28 Feb 2026 05:54:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: miquel.raynal@bootlin.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: wsa+renesas@sang-engineering.com, Mark Brown <broonie@kernel.org>
From: Ron Economos <re@w6rz.net>
Subject: spi: Regression with v7.0-rc1 on VisionFive 2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1vwKlm-000000025Ug-08N7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:55288
X-Source-Auth: re@w6rz.net
X-Email-Count: 3
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGh5lkvM6WMbkGkC8MrC/tQ8r+N6Iuxljw9ofPv8P14dVxr3aN2SDI8dz2Din+aFov1NyFtqveC+IF5Ivd4IkKliFcls4gL7pSEblwjlD1LfYmfJwgCj
 us9w04icSz6AjtB7oJqoFcGDQ4Zap0xQDRQvh6gPK/uMCMdNyQ561RnN4KlYnydXOGnmYHhN7As+ru3QnPgji6fT1z2/XdQP89g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_055428_354583_F7F71974 
X-CRM114-Status: UNSURE (   1.29  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I'm getting an SPI failure with Linux v7.0-rc1 on the VisionFive 2 RISC-V board.

Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: detected FIFO depth (1) different from config (256)
Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: operation failed with -110
Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: probe with driver spi-nor failed with error -110

I've bisected it to commit "spi: cadence-qspi: Kill cqspi_jh7110_clk_init" 324ecc7788c2e21d0d9197a8c015ff75382122d9

Here's the bisect log.

git bisect start
# status: waiting for both good and bad commits
# bad: [e86dda7bde8801d32ffe7d1570fe173cab14d1ba] Merge tag 'spi-v6.20' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
git bisect bad e86dda7bde8801d32ffe7d1570fe173cab14d1ba
# status: waiting for good commit(s), bad commit known
# good: [f6c42489fedfa42ba79bd17c49cf81c69ff39f8a] Merge tag 'regulator-v6.20' of 
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
git bisect good f6c42489fedfa42ba79bd17c49cf81c69ff39f8a
# good: [19a4505a7a5d4eea70f1a42d601c25d730922fdf] spi: microchip-core: use XOR instead of ANDNOT to fix the logic
git bisect good 19a4505a7a5d4eea70f1a42d601c25d730922fdf
# good: [aac733a9663682387013350b4470a81344960f5d] spi: cadence-qspi: Fix style and improve readability
git bisect good aac733a9663682387013350b4470a81344960f5d
# good: [8ea39d960c9f890e9213cdcfcbe4b3f281acd12f] spi: add multi-lane support
git bisect good 8ea39d960c9f890e9213cdcfcbe4b3f281acd12f
# good: [6516169fa7f6110ce42a5958c921255f2d0968bc] spi: geni-qcom: Add target abort support
git bisect good 6516169fa7f6110ce42a5958c921255f2d0968bc
# bad: [a40236feb62ccbf2b36d288550a483122b3205e5] spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
git bisect bad a40236feb62ccbf2b36d288550a483122b3205e5
# bad: [324ecc7788c2e21d0d9197a8c015ff75382122d9] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
git bisect bad 324ecc7788c2e21d0d9197a8c015ff75382122d9
# good: [2b97f5cd1a956a9ac948ec57775600158988dadd] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
git bisect good 2b97f5cd1a956a9ac948ec57775600158988dadd
# first bad commit: [324ecc7788c2e21d0d9197a8c015ff75382122d9] spi: cadence-qspi: Kill cqspi_jh7110_clk_init


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
