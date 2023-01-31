Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2395C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gpxl/dQwjHj9b99oEaxmm7MlJknD8wFmdSgcP7Kxqj8=; b=zzjxI5Q3EetQpf
	C42btWkorr3sPgEvURzDqX0OEZcnm4lGxedCJcssL9K5Yactuy7bHHbKwVvlpqDCRSYVFLlh8QtuB
	NE+zT1hAYGUQZY1u7Vcwdm/IJDN6B6IVd4HHa8XVlREeYk+0zQjs7wg9s8OIabsEQvVXXl9liyPY2
	J1FEvEHqz3fnDU5UXfa1KqtdvCKO2NmvS+lZe30X1FXED04AAETn4XEydi+dhFJTvz/4kT6DqlgYQ
	7xXNaaMWdUk4bdnh7ookO3bg6JIa4Wio8J7uDLNK2DSDDXt0ZrtBH63/iiuAIwMOCq6REhiDIMEtz
	XBNFU4RYUXYsnK4alxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrJg-008FIb-VG; Tue, 31 Jan 2023 14:08:56 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrJd-008FGw-Nu
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 14:08:55 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 69D8F22B05;
	Tue, 31 Jan 2023 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675174129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T49m4aNneycdJRUox2NnWvbDHKOK5LQ0u6zBagVR6NY=;
	b=19R4zxNGaLGs0/BdyhligmSWKz7ncKw4I9vEaCeJbqvAajD+uc6ET5AkprNHNtGxxTaWE3
	0ufCmT501ll9cnG5BVbwJ1I5evVot1UbC9ZFNvj1AJTanWK7on2pM1aV2ql50USH5b+oyu
	uIt7lKO+GN8nQQdrYzdqRIm2OEVTxNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675174129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T49m4aNneycdJRUox2NnWvbDHKOK5LQ0u6zBagVR6NY=;
	b=z2/uq1WlpP3hZGyMEyL9G0pYl2Vz7xEmuiuYkEuS7QEeRHzP5SU+PqQxN8+KvFbFYWng4I
	1U0pLFoHuEecFyCg==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id E15DE2C141;
	Tue, 31 Jan 2023 14:08:48 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 9D17F440D4E; Tue, 31 Jan 2023 15:08:48 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: <linux-riscv@lists.infradead.org>,  <devicetree@vger.kernel.org>,
  <linux-gpio@vger.kernel.org>,  Conor Dooley <conor@kernel.org>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  "Rob Herring" <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Linus Walleij
 <linus.walleij@linaro.org>,  Emil Renner Berthing
 <emil.renner.berthing@canonical.com>,  Jianlong Huang
 <jianlong.huang@starfivetech.com>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] pinctrl: starfive: Add StarFive JH7110 sys
 controller driver
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
	<20221220005529.34744-5-hal.feng@starfivetech.com>
X-Yow: My polyvinyl cowboy wallet was made in Hong Kong by Montgomery Clift!
Date: Tue, 31 Jan 2023 15:08:48 +0100
In-Reply-To: <20221220005529.34744-5-hal.feng@starfivetech.com> (Hal Feng's
	message of "Tue, 20 Dec 2022 08:55:28 +0800")
Message-ID: <mvm4js6zthr.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_060853_972867_48393492 
X-CRM114-Status: GOOD (  14.34  )
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

On Dez 20 2022, Hal Feng wrote:

> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> new file mode 100644
> index 000000000000..85df9d0ae1de
> --- /dev/null
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -0,0 +1,979 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Pinctrl / GPIO driver for StarFive JH7110 SoC
> + *
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> +
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +#include "../pinmux.h"
> +#include "../pinconf.h"
> +#include "pinctrl-starfive-jh7110.h"

This misses a couple of headers, see commit 042b93c9b666.

../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: In function 'jh7110_pin_dbg_show':
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:100:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
  100 |         seq_printf(s, "%s", dev_name(pctldev->dev));
      |         ^~~~~~~~~~
      |         bstr_printf
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: At top level:
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:538:21: error: variable 'jh7110_pinconf_ops' has initializer but incomplete type
  538 | static const struct pinconf_ops jh7110_pinconf_ops = {
      |                     ^~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:539:10: error: 'const struct pinconf_ops' has no member named 'pin_config_get'
  539 |         .pin_config_get         = jh7110_pinconf_get,
      |          ^~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:539:35: warning: excess elements in struct initializer
  539 |         .pin_config_get         = jh7110_pinconf_get,
      |                                   ^~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:539:35: note: (near initialization for 'jh7110_pinconf_ops')
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:540:10: error: 'const struct pinconf_ops' has no member named 'pin_config_group_get'
  540 |         .pin_config_group_get   = jh7110_pinconf_group_get,
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:540:35: warning: excess elements in struct initializer
  540 |         .pin_config_group_get   = jh7110_pinconf_group_get,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:540:35: note: (near initialization for 'jh7110_pinconf_ops')
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:541:10: error: 'const struct pinconf_ops' has no member named 'pin_config_group_set'
  541 |         .pin_config_group_set   = jh7110_pinconf_group_set,
      |          ^~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:541:35: warning: excess elements in struct initializer
  541 |         .pin_config_group_set   = jh7110_pinconf_group_set,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:541:35: note: (near initialization for 'jh7110_pinconf_ops')
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:542:10: error: 'const struct pinconf_ops' has no member named 'pin_config_dbg_show'
  542 |         .pin_config_dbg_show    = jh7110_pinconf_dbg_show,
      |          ^~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:542:35: warning: excess elements in struct initializer
  542 |         .pin_config_dbg_show    = jh7110_pinconf_dbg_show,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:542:35: note: (near initialization for 'jh7110_pinconf_ops')
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:543:10: error: 'const struct pinconf_ops' has no member named 'is_generic'
  543 |         .is_generic             = true,
      |          ^~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:543:35: warning: excess elements in struct initializer
  543 |         .is_generic             = true,
      |                                   ^~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:543:35: note: (near initialization for 'jh7110_pinconf_ops')
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: In function 'jh7110_gpio_request':
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:548:16: error: implicit declaration of function 'pinctrl_gpio_request' [-Werror=implicit-function-declaration]
  548 |         return pinctrl_gpio_request(gc->base + gpio);
      |                ^~~~~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: In function 'jh7110_gpio_free':
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:553:9: error: implicit declaration of function 'pinctrl_gpio_free' [-Werror=implicit-function-declaration]
  553 |         pinctrl_gpio_free(gc->base + gpio);
      |         ^~~~~~~~~~~~~~~~~
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: At top level:
../drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c:538:33: error: storage size of 'jh7110_pinconf_ops' isn't known
  538 | static const struct pinconf_ops jh7110_pinconf_ops = {
      |                                 ^~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [../scripts/Makefile.build:253: drivers/pinctrl/starfive/pinctrl-starfive-jh7110.o] Error 1

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
