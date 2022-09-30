Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2BDC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 21:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOENQVxOLyZUUWJmjxMNSucnf/42m4L5lVIVPcli6DU=; b=NVCbZF1uNByOo3
	txBaJt5pdTEjwutQGOI3r54F8gNHyyub2yfSJpIkHMWkpB1Qz2iSVYxvmEENIlUp4j53VG5wbE0Bz
	kraZp52KICp/2mc2383CztQCZsRx8PEY9KkQuarUUgRXk7dVFZv8pQY/H83nJgZzF4h21ij2ZQ57W
	XLyVqjnYrlmfZavYYAsnioEV9eiomGndJJJYrS+qrbUlBjZLiRk8W0DdF0gM9jAASZ6iWsg0TqOYL
	xI6v0Mz7pgCzywlwbIdu9ua7pmHcNRNyf5yKx7JQDVbvSxkpRtnxtHJq3p8Y+Qx3vKLh9mO2E1zF0
	gZdFpG9T8Cf2BNHhZMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNnM-00BhIG-JI; Fri, 30 Sep 2022 21:43:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNnJ-00BhHL-KB
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 21:43:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3343462493;
	Fri, 30 Sep 2022 21:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE98C433C1;
	Fri, 30 Sep 2022 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664574220;
	bh=cCxNQIjIu1jNntjn2xhR5wc6ij2taNke8th6cN78c5E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rFY9wr8CYLbDOcXptxhlvN4KgrZInkSPQNB/j1WLDoiemQ6ji2nZbmFWV68JnjEj7
	 6/cLcwHXqpQFiaUgwExT+ZRiYOvry++b349qmIp8MFSiHr+Fh0nXI3JJAe4Ny6WI6E
	 Q700N4khg7H/6bwqzXDkz1FZbgVHxVF4ZjFiNk3XIqd9E9mOL5FQi09SN8eTRN2pyf
	 u8DSrgUwFPf3DF0BviD2PXaxbuduG1AXvnLrQz3NI/k/OLNbTHBZmH7VF52sH6GvCQ
	 ENI5DqKiq3CTNsiCRHr9wkuBJxpN6Ge+DhchdfzKOrMkewbhtgki9q6exoK9vgQKXB
	 yr84tiuUhpNGQ==
MIME-Version: 1.0
In-Reply-To: <20220929175459.19884-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220929175459.19884-1-hal.feng@linux.starfivetech.com>
Subject: Re: [PATCH v1 14/30] clk: starfive: Factor out common clock driver code
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@linux.starfivetech.com>, linux-kernel@vger.kernel.org
To: Hal Feng <hal.feng@linux.starfivetech.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 30 Sep 2022 14:43:37 -0700
User-Agent: alot/0.10
Message-Id: <20220930214340.8FE98C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_144341_717576_680590B9 
X-CRM114-Status: GOOD (  11.07  )
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

Quoting Hal Feng (2022-09-29 10:54:59)
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> The clock control registers on the StarFive SoCs work identically,
> so factor out the code then drivers for different SoCs can share
> it without depending on each other. No functional change.

Sounds great! No functional change! But to verify that it is pretty
hard.  Can you generate the patch with `git format-patch -M -C` and not
rename anything initially? I hope that will allow us to see that really
nothing has changed except code is moved from one file to another. Then
the next patch can be the sed command to rename to starfive.

As the patch is right now, I'm not particularly interested in going
through 700 lines to make sure nothing really changed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
