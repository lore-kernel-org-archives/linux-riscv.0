Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E7AEEF30B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4o32uafHTrWil40+k4eTVyKZai+CwHgBZAZddNSm00=; b=oUojlSy18+wgUQ
	4qwj0wp/PvbnvKs9/0R0vcoiF75/8MikzhoKDAOsS6Odr5io3BYGbknUiRxOqPcZh9tkXF5XKTzza
	KYFcIn2zk/WuKhAZUW6yMTHTO3nf+57wKohKIbPCAVuru+ZaGgvk3NrKA6l9xSNWQsuc/aaA7e7jE
	LNd4Jp1C1yu5dBYDNZkxIhfTZ0D5BslgGzcmJi9gUNlJBvjbvOrs8PY9kIoC4t/MaMo956VRgoczF
	lOfAEbZHhSLf48UjBibzOZnVVrQZNcYFQw1wOzEE67q7s6j5cAP1JnbpgANQFeMP8x76SxFSiddja
	6ugB/VVzJkQdFS7nHomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Io-000000011Am-0bVQ;
	Thu, 05 Mar 2026 06:35:18 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2Il-000000011A9-2SCu
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 06:35:17 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fRKXT4QGzz9tj4;
	Thu,  5 Mar 2026 07:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772692505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Roprykd/0bxr9LQQRe+mNdX0hmWBmJ1X7LdzolcDU9k=;
	b=lm1yAbd0qAPVSB0OOQRUd4vtc6/wSfKt2qM2Mf5PCiHXw/Aq5lbJdcLgCoWXi5rGNzqG9h
	JsPxrV2AZuTaGZHE9YEkXufXbnBOa1vgH/OnrUowClqEfNoiCn0Z2RCtvrYzR+oA3RBpJW
	e+Nrb02yhjVWSON6v9JBwtizQrlHgMOvTo/30HxJDRNIAzfuXY5d4VmIh7mzzr4cBGo9SX
	fibh2XYjLeQstM/fIMbgtwCn+WkPMUCv1469slw01W53veN710C6/45blpQJ7jwf568oQT
	YYEE0Ukn3WsikjqQgjaUW0CHXyLVJTZeb85uiJItA17JeDi5NujobxUHRg6jUw==
Mime-Version: 1.0
Date: Thu, 05 Mar 2026 14:34:47 +0800
Message-Id: <DGUN1I6AY5QI.3VWQAV1IQGD7P@mailbox.org>
Subject: Re: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1
 SoC thermal sensor
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Shuwei Wu" <shuweiwoo@163.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@gentoo.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
X-MBO-RS-ID: 6a4d1feab15b69ac214
X-MBO-RS-META: oyujgzgony737ozxqjnzkwqas9ubuoo4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_223515_824338_090C77EE 
X-CRM114-Status: GOOD (  14.70  )
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

Hi, 

Sorry for the HTML noise in my previous mail. Correcting the format now.

Gentle ping on this patch.
Any feedback to help move it forward would be appreciated!
Thanks!

On Mon Jan 19, 2026 at 10:41 AM CST, Shuwei Wu wrote:
> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
>
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
>
> ---
> Changes in v3:
> - Fix indentation and variable types
> - Simplify clock management and redundant assignments
> - Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com
>
> Changes in v2:
> - Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
> - Address reviewer feedback on style and structure
> - Improve variable naming and comments
> - Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com
>
> ---
> Shuwei Wu (3):
>       dt-bindings: thermal: Add SpacemiT K1 thermal sensor
>       thermal: spacemit: k1: Add thermal sensor support
>       riscv: dts: spacemit: Add thermal sensor for K1 SoC
>
>  .../bindings/thermal/spacemit,k1-tsensor.yaml      |  76 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 ++++++++
>  drivers/thermal/Kconfig                            |   2 +
>  drivers/thermal/Makefile                           |   1 +
>  drivers/thermal/spacemit/Kconfig                   |  19 ++
>  drivers/thermal/spacemit/Makefile                  |   3 +
>  drivers/thermal/spacemit/k1_tsensor.c              | 281 +++++++++++++++++++++
>  7 files changed, 483 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251215-patchv2-k1-thermal-5ffb838fc1cc
>
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
