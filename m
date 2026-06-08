Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9552CD8C9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aY23BxAnvkpZhBOXtb1FIdhgLw+V6d7RtKnTX53JJio=; b=SCPm3ZNLsQ1NWWNz5D1HSGUns+
	xPYpY8B0wuVdJSHkzA9BzL6zdbwXUTSIzZupfyFHLMvsTy1Pv4fLDLoSJQpz2/Slk9pfZrIGOendr
	nu0qDxlY11gy3cupsjRAwCP9ELzGjHbp41+rdeyEUUamI8k9Pb4CHqXTRuZ1F6gvHRY6ga/RTheaq
	MSNyJfc5aEoisKUyLGRBz/pu8g7Hbiiv7mvCcd8ncdn3RfYS/nMcHWBGTVbqU+cCfdWYZoxVAtogS
	2Imij15MwXgoZsyZGewi6MViPR/TKEL0xAa3NseE24deOFel1sg1XDYGo8wARU/f1yHiDvf3UgvBx
	5mpBtVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbEc-00000003qwG-3hrp;
	Mon, 08 Jun 2026 14:45:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbEb-00000003qvt-1a3T
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8290444BC
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA591F00899
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929948;
	bh=C1ZKRAk+v5D8Fo7M4WzkBwmvVcnvQs40wfLDkqAg74g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=J0UML/X22q0xYMiMs+IBBC3yMy6GhyTPNIY4OZORGxP3k9qC0xR7U9KjrkcgiJetY
	 ppDrnKbYUHR0grKD/gtHfBbaWHV1f/29NHjEKZMuMPD98M33kaT7QPqS1QocaMPlsk
	 4k/9g7BpFMuOpjwL968hRyx/ICOjJTZwJcFq7LYdh/Lh6D9HZCJp7Lxq5CNnQlOy8O
	 6OGE3VVWaK/YgCp+HHGMmCWnUxQszo2zkKOx11B85al9ynxEkyHuqf67wH8UPlISJa
	 qQnUPotuOs2PsXyOjwH4ciHg3mvCDuaLh7Ado8PwqrJrYo49GYvMvR0evlD4MojljK
	 9MwvUdEYYbiDw==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd523634so6863102c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 07:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+nbugjAMRpOKoeZE0LvND+NJvoHcmdsluAALV+4QdQhiYVkjSZ1RvD9t572L/Vsme1fS6o68apDWFzbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDT2+8aMgsod8Q3fiBkqGPzi81cXq7khMSuJF9VfLngC1qBm3B
	5YrhxtcIOMc3Z8CvtJ6ZqLWjr2XtGhVCutMidfm+qLpNKbD8T41AqtKDn2+SnXmdkBZF+4X0cbM
	x4FvlaQsXsoPtO1FEjvW8obxXZHnHhGc1yIwRZ+BhUA==
X-Received: by 2002:a05:7022:43a9:b0:137:f58c:3cae with SMTP id
 a92af1059eb24-138066b75femr7099909c88.1.1780929948188; Mon, 08 Jun 2026
 07:45:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:45:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260603055347.66845-19-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com> <20260603055347.66845-19-changhuang.liang@starfivetech.com>
Date: Mon, 8 Jun 2026 07:45:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
X-Gm-Features: AVVi8CfaVNjKqTQIxP4uDH7miQgJxqhIv2ueyrqcnqutmjGTDV0cuJZ3ZuCNFUc
Message-ID: <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
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

On Wed, 3 Jun 2026 07:53:44 +0200, Changhuang Liang
<changhuang.liang@starfivetech.com> said:
> Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/starfive/Kconfig              | 12 +++
>  drivers/pinctrl/starfive/Makefile             |  1 +
>  .../pinctrl-starfive-jhb100-per2pok.c         | 97 +++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
>
> diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
> index edc3b6d9c8d7..bf5915e0a5f2 100644
> --- a/drivers/pinctrl/starfive/Kconfig
> +++ b/drivers/pinctrl/starfive/Kconfig
> @@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
>  	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
>  	  and interrupts on input changes.
>
> +config PINCTRL_STARFIVE_JHB100_PER2POK
> +	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on OF

I don't see any real dependency on CONFIG_OF here, am I missing something? The
OF ID matching is available even with !CONFIG_OF.

Same elsewhere.

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
