Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA879ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYsrDmOFcFEeC/wR2BEwaZBLKbLbgLLzoqG0alxXN/w=; b=BaC92v1/AakK1T
	9P7ltGo6xmgVJRjFOFtGjDxCowmQib2M+cj/t2yshGs5/4vrNreFq4Na2b3JnHuNnhwl+4oDno1Qh
	8Fjg4NUievBbr7zKy7UCVf0nixtWj7ZlqediWaxcsjM79MOizJFLqSWdBhj7HwSr0cKeIniI/JvqP
	Rw93Y+ZdZYg54/+Iy7o/BBIjqe/QnLlVvs/B+fBRTatz7lGQdTx41BiOEosUwILnHeOBiqE9j9MQl
	op09lg1y7JT4ve4oAFkOOhR87NamOpVA4l72Tn2ov5bFaowBAqlYZgrmWSuyEXiFyaJnkhZbWzc36
	zsA+aL7z48t3qy8xhpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTUtm-008Fyr-6c; Wed, 31 Aug 2022 21:05:22 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTUtk-008FyO-1P
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 21:05:21 +0000
Received: by mail-qv1-xf34.google.com with SMTP id d1so12076722qvs.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 14:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+lTGIa6eGb9hONAiLy7EzL9iAjtgjfpY29k3SCr3Lw8=;
        b=iM7AcVcIWutz/Qg74Dp3o1RiGNUjn02FcrCIKgMYx5rUSnEQed0U2SYpcb/iFIPWVu
         sceCKEHtFe9RPX+zQoJx4d5vFSG4jY7rPDMMnvafq9d+UVFbBCnPcNyZOj+cKoJLhoIL
         XJMx7+lZ1Dsc/vXv1k/k4wBG6nVwmI9Iz5ADAfywHUEtZydGLOQqXu8Ua17qvmTPa9sJ
         OOL9icmWoiKVAkA7WTFttpJkg2sNx4c4oL+nR6EoPyxsT1l2+fC3olx+qGnVZDX4qhNv
         OLKYxmRcLwD4NwzjcGnNvmeBNVNrDn6XtGU4Z+nRcVGzZcLCVeWTtM9d7BlcNF8jVHC9
         kHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+lTGIa6eGb9hONAiLy7EzL9iAjtgjfpY29k3SCr3Lw8=;
        b=nvdFJ7nCp6fuToYuoAQAaJ0HNBTJej7c9GWAnMI+xplp/93jfvU57vOyNgXvUv8zvy
         gyF9cl3y7kC+aC519o1n4i7X8PK3VpxQYkFg2yj+36r1cXzP/OO9yN8c9wdNSyqOObNH
         o9ZzdM3lrzDpMMZcHT8Of8zjLklY+YOZuljn5lH7T/XFlRlqljJ8YVPbKpL0fOH610Cz
         KjIaggohg6c7emLfHS4z3Xq5v3fnBw/vIcBw1dYYiRZF5U0reGuGmxc/c2qR+SGEjSQX
         MnxxbPXpIwK9hBurEtYDwZinIXpEfyJCRWjnN1W73I84hWtcNfTyP+dyv2V6r6hFlo0X
         9O6g==
X-Gm-Message-State: ACgBeo1j3HbkkFh7IZ6dFkFMd+N4rIQWtfit4qG8gRHdBtnrTMtHznXB
	gSQN3zp786tM7+cKoKe0GtPkO/rht3zTKEGH8rI=
X-Google-Smtp-Source: AA6agR5qQAhLTgxav6dOwBNu1281hzGRPk4FTa0c/tyqw82+8CL4iE6OOOtudGsgpC8BavrAUE9pJg/tv0RT/T5WCjs=
X-Received: by 2002:a05:6214:2022:b0:497:2c03:61 with SMTP id
 2-20020a056214202200b004972c030061mr21792656qvf.11.1661979915969; Wed, 31 Aug
 2022 14:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com> <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
In-Reply-To: <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 00:04:40 +0300
Message-ID: <CAHp75Vc4cMGBdJpOsRMDLWU+6+eYwbsF3-Mz40-KazLGhwkHMA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: lewis.hanly@microchip.com, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Marc Zyngier <maz@kernel.org>, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_140520_133107_00CF0D38 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, Aug 22, 2022 at 2:30 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Aug 15, 2022 at 2:08 PM <lewis.hanly@microchip.com> wrote:

...

> This looks like  textbook example of a driver that can use
> CONFIG_GPIO_GENERIC

> See e.g. drivers/gpio/gpio-ftgpio010.c for an example
> of how to use bgpio_init() to set up the helper library to handle
> the GPIO side of things and combine it with an irqchip.
> You get get/set_multiple() for free with this approach.
> Also see documentation for bgpio_init() in
> drivers/gpio/gpio-mmio.c.

I would also suggest looking at gpio-regmap.c.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
