Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36640C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 06:04:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06BF23139
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 06:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06BF23139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G4RKMtc2Dn/Y87MhgG23WfZMfepfql9t16ns6QLd59o=; b=YyqZIFGhV0hXIlorGLPVdXG6E
	xmp/RX3+dM83YY0h/6bM0nK5rNDcE2DA1FTmsyT63ZfDeu03/C5mdf+FkmkOPsDMIE8YH/uXbQz7K
	rNFDojTqhtDSIb+Vd4Rhkm09HOBgzoxGMShIuopElEI04Vaa5zA9mZXR+j5C5YMJn4ItvbXwvLG29
	MejNQbw6jTuxbhYSCvKMSdI568cHYpqd65cuNOUuacPDOm+WFb8pXe4krJx8XHs6drRFxVuTU19om
	W+GlerPmxl1Gb2wHtiGtIOqkL9IpY5PxrMTZ2aTFNS14W4pbKfHHT2W2j7y4oMYFzbSPHPS0C2Zi0
	AUIV9onaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koKUm-0007fA-Pv; Sun, 13 Dec 2020 06:04:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koKUg-0007em-2C
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 06:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607839469;
 bh=LCpwKqKHTHHHvvyHULcS2y/ZP4zP3djjGqSTEFIFQjw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IGtnnN11+DiOFmkQQeuT41MCzHczfjD/A9JZU5jEqOaFskVIKj8Y3TUGl9YqqqbGI
 q6CrHvEphxiBt5Y4FmQwAmlIdouEB24LC1bmtASRhEBhCikcXFDLX8BaK6acgYI84F
 CLtGY8OB61UASBG0zzUwYVwaP6YpO2Kj5msfNd0EuHukWD56HM7oPTKVE+Bp4/OkO0
 1g8n2GnKyoLEDnof8YQlMXrhar7xwS+OYe7Gryj9sVj0LZ/kcsyE0WT2lApahYk5s1
 yN2b9sSdnfMpObT+MYjLeY7fFvlunir8BUFZtV98tz1V9sp32T/EQ3pqQ16Z26JHGz
 N+koZn4OfqlGA==
MIME-Version: 1.0
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
Subject: Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sat, 12 Dec 2020 22:04:27 -0800
Message-ID: <160783946780.1580929.13355022541956430021@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_010430_252634_40B6E106 
X-CRM114-Status: GOOD (  12.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-12-10 06:02:51)
> 
> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
> 
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of this series.
> 
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.
> A demonstration of this series used on a SiPeed MAIX Dock
> board together with an I2C servo controller can be seen here:
> https://damien-lemoal.github.io/linux-robot-arm/#example
> 
> This tree was used to build userspace busybox environment image that is
> then copied onto an SD card formatted with ext2:
> https://github.com/damien-lemoal/buildroot
> Of note is that running this userspace environment requires a revert of
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> 5.9 development cycle. Without this revert, execution of the init
> process fails. A problem with the riscv port of elf2flt is suspected but
> not confirmed. I am now starting to investigate this problem.
> 
> Reviews and comments are as always much welcome.

What's the merge plan for this series? I'd like to apply the clk patches
but they're combined with the sysctl driver so I guess I can't?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
