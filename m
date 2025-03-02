Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDDBC19F32
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BCHe2obyLmO0q2vGMC8yenZZKUfzwWy1/sEzpkQxnA=; b=3o7+Lo1neJAuZm
	2dzJu1sKYcg+zc0vQtuAOsEXCsN1YADYtGIv/PpU6MqSaDH0dbEHwcaYIJcoNJAwDrwRCWPLxl49L
	peNaue2XHB0PJF/51wzJ55e8lEhe7lI8Phd2gQ6f9h46SMgB0KI92i63xfwsxeBZH+zTg7m3hc/As
	OZf2b9tJFylfKNPr0tSw6re8ajdKzX3DTyykqAvUtdV83sFgPQby270VgXU5ZwO/oIPQeVjFHOCJo
	3A488zLyydqrLvfupyGvkGZzn49fGAiWmpDk3cKqJ+hReoIMfKhMCxrjxCAUtLhULnjWf1HVgXzPX
	hKKXBusokaVwn7EQZYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toemI-0000000Ffo3-1QiE;
	Sun, 02 Mar 2025 08:34:26 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toemF-0000000Ffnh-3ZbO
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 08:34:25 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A56EC343175;
	Sun, 02 Mar 2025 08:34:20 +0000 (UTC)
Date: Sun, 2 Mar 2025 08:34:16 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Message-ID: <20250302083416-GYA56903@gentoo>
References: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_003423_936759_487678D9 
X-CRM114-Status: GOOD (  27.57  )
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

Hi Troy:

I'd like to have all spacemit patches Cc to its mailinglist[1]
Can you do a resend version with "RESEND" prefix? no need to increase
the version number, but should state the reason, thanks

Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]

On 12:51 Sun 02 Mar     , Troy Mitchell wrote:
> Hi all,
> 
> This patch implements I2C driver for the SpacemiT K1 SoC,
> providing basic support for I2C read/write communication which
> compatible with standard I2C bus specifications.
> 
> In this version, the driver defaults to use fast-speed-mode and
> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
> 
> The docs of I2C can be found here, in chapter 16.1 I2C [1]
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
> ---
> Change in v5:
> - Path #1:
>         - Add `clock-names` property
>         - Modify the clock property into two
> - Path #2:
>         - Enable the APB clock
>         - Fix comment and code styles
>         - Fix typo and drop unnecessary description in Kconfig
>         - Prefix all macro definitions with SPACEMIT_
>         - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
>         - Remove all `unlikely` and `likely`
>         - Remove unused register and bit macros
>         - Remove the "err" field, as it only contains a subset of the status field
>         - Retrieve `clock-frequency` from the device tree instead of using a macro
>         - Use a local variable to track the current message
>         - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`
> 
> Link to v4:
> https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/
> 
> Change in v4:
> - Patch #1:
> 	- Change the default value of clock-frequency from 100000 to
> 	  400000. This is to correspond to the driver's default value.
> 	- Drop the minimum of clock-frequency
> 	- Modify the description of clock-frequency
> - Patch #2:
> 	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
> 	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
> 	- Drop useless wrap
> Link to v3:
> https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/
> 
> Change in v3:
> - Patch #1:
> 	- Change the maxItems of reg from 2 to 1 in properties
> 	- Modify reg in dts example
> 	- Changed the enum selection for clock-frequency to a range,
> 	  setting a minimum value of 1 and a maximum value of 3,300,000.
> - Patch #2:
> 	- Drop unused judgement in `spacemit_i2c_xfer_msg`
> 	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
> 	- Fix the error check for `i2c->base`
> 	- Modify Kconfig dependencies
> Link to v2:
> https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/
> 
> Change in v2:
> - Patch #1:
> 	- Change the maxItems of reg from 1 to 2 in properties
> 	- Change 'i2c' to 'I2C' in the commit message.
> 	- Drop fifo-disable property
> 	- Drop alias in dts example
> 	- Move `unevaluatedProperties` after `required:` block
> - Patch #2:
> 	- Alphabetize Makefile and Kconfig
> 	- Change `.remove_new` to `.remove` in `struct platform_driver`
> 	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
> 	- Change `spacemit_i2c_read/write_reg` to `read/writel`
> 	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
> 	- Clean up code flow
> 	- Fix unnecessary line wraps
> 	- Move `spacemit_i2c_handle_err` to a suitable location
> 	- Modify Kconfig dependencies
> 	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
> 	  the intermediate variable
> Link to v1:
> https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/
> 
> ---
> Troy Mitchell (2):
>       dt-bindings: i2c: spacemit: add support for K1 SoC
>       i2c: spacemit: add support for SpacemiT K1 SoC
> 
>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  59 ++
>  drivers/i2c/busses/Kconfig                         |  19 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
>  4 files changed, 696 insertions(+)
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241031-k1-i2c-master-fe7f7b0dce93
> prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
> prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
> prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
> prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
> prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
> prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
> prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
> prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
> prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
> prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
> prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
> 
> Best regards,
> -- 
> Troy Mitchell <TroyMitchell988@gmail.com>
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
