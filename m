Return-Path: <SRS0=S66B=XN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD5CC4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2019 07:32:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771E321907
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2019 07:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mkbprAgc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdsTmTy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771E321907
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMOfuYyqF9iDxjyV/oqJK0JAeeD1fRPC4lI+NFSy820=; b=mkbprAgcxYUvI9
	KKf4mnMJZbHwCQMxxAFtR0O9ix1pzaYHNi35e16XgVSITfA+wULUWSNOadd5qljpTYIZ5TrK27ow9
	JU+e+lXSOtZRSIU1ErW7TsdoAVFPJgKXJpkXhZbyYXWYp80EDc5oEUp5IsRPQfWd7fC7IXNVvOEhW
	x+/J22ao5u3gFWlZkfTjSgMzPXm6RaNCEnd86Gf471n8TATVTWGCtNFi/GPhAT5UKP0JP+HcdjY69
	u45VD/1HBVJIdDTfMeE/P0Qg1vprbByZrK+RmNHo1BKktM0AAB35pU9KIXE1BeuRrMFR19PPwIAiJ
	hdk9C4vAXnLH51nuoOLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAUSB-0001SG-Hx; Wed, 18 Sep 2019 07:32:43 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAURu-0001Gj-P7
 for linux-riscv@lists.infradead.org; Wed, 18 Sep 2019 07:32:28 +0000
Received: by mail-ed1-x542.google.com with SMTP id g12so5668149eds.6
 for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2019 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pMRyAAMSr25/uzv+iFU0HHBkFg5lhH7YB2umT/GPFT8=;
 b=pdsTmTy+6+Q3KzW0EazEZ7g19GTKEQLaHIJig5o32uIL90WCyNluMmi7IgiSgABr/K
 85of6LhqmoZeOXauE8IiDpegNb4jX5/WL6/EOnzeO1wUYamA2npdwvgWBAPBlGT0fRah
 KYOpf/yVBIyDsiz/Xmt/BB78+je7ODtw7VZcbNCt3a+P+ixY2zimr/wX864Htkf5sXSv
 p+lj32iVfIetG1hGab8bFUL0Are93w7mb7QkoQzUCUideCbABBENUuqeqtmjpBoMTOCe
 AhFAeNYr7KJ8DfO+hdsMnqICvSUJCgrKpFjOQtknuhqh7hjeRf/eaDHMqqCKh12M0AMR
 dRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMRyAAMSr25/uzv+iFU0HHBkFg5lhH7YB2umT/GPFT8=;
 b=JoaVo7MMexkbn6W+ZkKTIw+QbR5cp01G+X92VSVmkY/IhjIFD1fPxnC+SzcSGL876F
 BTB8Us3/N/r8Nie+B+BIUImd60kw4ZgnGlxcZadws5x6nAtPJOb/3Gfpg4Pe17Hd5FvI
 TOptLrZ19BlS68wOP536GeUHG9UJSZ+PBTVNrOiepo5D01eatwMpmsqkTmDqj6tcRjLA
 cBJebmT6C/mt6t1+6owzabApp7OwJrOZtUjb3VKDpLxWTFden6Frzq6kvreAbcf29Ud8
 kklCwwDk12hq+PTsXlfGGTNC6K24ug06GKVpSKcCBI9beg7fs8HOf8Y8cvW7y1kMVGB1
 fEgg==
X-Gm-Message-State: APjAAAWSUBLUIvNwLTkeCdMZALlBqZbu/lWlB2OgeeH/SN9URYVEfP01
 BILiR/bxnUq7qw5PJYC2FzAhCKeAx1CUfUStedY=
X-Google-Smtp-Source: APXvYqyjOF4Xb7nN31Q4FJYCioLbEXzRNdb/lNTMgmuOKR4VZGLQk0dI9XEY+6dnC7SllFvnYzEwM3ZvHGLZ33JzL1Q=
X-Received: by 2002:a17:906:4a19:: with SMTP id
 w25mr8286817eju.239.1568791944801; 
 Wed, 18 Sep 2019 00:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
 <CACRpkdaoBwqQ4V5Hm9f_G5_jrdkvjT5anhBK1_HoFTj6=cba-Q@mail.gmail.com>
 <d8fe9a17-283c-e2ad-9e01-2754b35699b4@wdc.com>
In-Reply-To: <d8fe9a17-283c-e2ad-9e01-2754b35699b4@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Sep 2019 15:32:13 +0800
Message-ID: <CAEUhbmWmWr+dDEqtfwO8U1nXOOzfJ_1L+omVZEU=cZbnWgJpDw@mail.gmail.com>
Subject: Re: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_003227_017523_635D713E 
X-CRM114-Status: GOOD (  30.28  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Oct 17, 2018 at 9:01 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 10/10/18 5:35 AM, Linus Walleij wrote:
> > Hi Atish,
> >
> > thanks for your patch!
> >
> > On Tue, Oct 9, 2018 at 8:51 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> >> From: "Wesley W. Terpstra" <wesley@sifive.com>
> >>
> >> Adds the GPIO driver for SiFive RISC-V SoCs.
> >>
> >> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> >> [Atish: Various fixes and code cleanup]
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >
> > (...)
> >
> >> +config GPIO_SIFIVE
> >> +       bool "SiFive GPIO support"
> >> +       depends on OF_GPIO
> >> +       select GPIOLIB_IRQCHIP
> >
> > I suggest to add
> > select GPIO_GENERIC as per below.
> >
> > Maybe select REGMAP_MMIO as well.
>
> ok.
>
> >
> >> +       help
> >> +         Say yes here to support the GPIO device on SiFive SoCs.
> >> +
> >
> >> +#include <linux/of_irq.h>
> >> +#include <linux/irqchip/chained_irq.h>
> >
> > Do you need these two? I think <linux/gpio/driver.h>
> > will bring them in for you.
> >
>
> driver.h only brings chained_irq.h. of_irq.h is still required. Right ?
>
> >> +#include <linux/pinctrl/consumer.h>
> >
> > Are you using this?
>
> My bad. Left over from the old code. I will remove it.
>
> >
> >> +struct sifive_gpio {
> >> +       raw_spinlock_t          lock;
> >> +       void __iomem            *base;
> >> +       struct gpio_chip        gc;
> >> +       unsigned long           enabled;
> >
> > Since max GPIO is 32 why not use an u32 for this?
> >
>
> Sure.
>
> >> +       unsigned int            trigger[MAX_GPIO];
> >> +       unsigned int            irq_parent[MAX_GPIO];
> >> +       struct sifive_gpio      *self_ptr[MAX_GPIO];
> >> +};
> >> +
> >> +static void sifive_assign_bit(void __iomem *ptr, unsigned int offset, int value)
> >> +{
> >> +       /*
> >> +        * It's frustrating that we are not allowed to use the device atomics
> >> +        * which are GUARANTEED to be supported by this device on RISC-V
> >> +        */
> >> +       u32 bit = BIT(offset), old = ioread32(ptr);
> >> +
> >> +       if (value)
> >> +               iowrite32(old | bit, ptr);
> >> +       else
> >> +               iowrite32(old & ~bit, ptr);
> >> +}
> >
> > This looks like a mask and set implementation, you are
> > essentially reinventing regmap MMIO and the
> > regmap_update_bits() call. Could you look into
> > just using regmap MMIO in that case?
> >
> > If you need examples, look at gpio-mvebu.c that calls
> > devm_regmap_init_mmio() for example.
> >
>
> That's really cool. Sorry, for not checking that earlier.
> I am pretty new to this.
>
> >> +static int sifive_direction_input(struct gpio_chip *gc, unsigned int offset)
> >> +static int sifive_direction_output(struct gpio_chip *gc, unsigned int offset,
> >> +static int sifive_get_direction(struct gpio_chip *gc, unsigned int offset)
> >> +static int sifive_get_value(struct gpio_chip *gc, unsigned int offset)
> >> +static void sifive_set_value(struct gpio_chip *gc, unsigned int offset,
> >
> > These functions look like a typical hardware that can use
> >
> > GPIOLIB_GENERIC and bgpio_init() to set up the accessors.
> >
> > See gpio-ftgpio010.c for an example.
> >
> > As a bonus you will get .get/.set_multiple implemented by
> > the generic GPIO.
> >
>
> Great. This will reduce the driver a code by a big factor.
> Thanks for the pointer.
>
>
> >> +static void sifive_irq_enable(struct irq_data *d)
> >> +static void sifive_irq_disable(struct irq_data *d)
> > (...)
> >> +static struct irq_chip sifive_irqchip = {
> >> +       .name           = "sifive-gpio",
> >> +       .irq_set_type   = sifive_irq_set_type,
> >> +       .irq_mask       = sifive_irq_mask,
> >> +       .irq_unmask     = sifive_irq_unmask,
> >> +       .irq_enable     = sifive_irq_enable,
> >> +       .irq_disable    = sifive_irq_disable,
> >
> > The handling of .irq_enable and .irq_disable has
> > changed upstream. Please align with the new codebase
> > as changed by Hans Verkuil:
> >
> > commit 461c1a7d4733d1dfd5c47b040cf32a5e7eefbc6c
> > "gpiolib: override irq_enable/disable"
> > commit 4e9439ddacea06f35acce4d374bf6bd0acf99bc8
> > "gpiolib: add flag to indicate if the irq is disabled"
> >
> > You will need to rebase your work on the v4.20-rc1 once it is
> > out. Right now the changes are on linux-next or my devel
> > branch.
>
> Will do.
>
> >
> >> +       ngpio = of_irq_count(node);
> >> +       if (ngpio >= MAX_GPIO) {
> >> +               dev_err(dev, "Too many GPIO interrupts (max=%d)\n", MAX_GPIO);
> >> +               return -ENXIO;
> >> +       }
> > (...)
> >> +       for (gpio = 0; gpio < ngpio; ++gpio) {
> >> +               irq = platform_get_irq(pdev, gpio);
> >> +               if (irq < 0) {
> >> +                       dev_err(dev, "invalid IRQ\n");
> >> +                       gpiochip_remove(&chip->gc);
> >> +                       return -ENODEV;
> >> +               }
> >
> > This is an hierarchical IRQ so it should use an hierarchical
> > irqdomain.
> >
> > I am discussing with Thierry to make more generic irq domains
> > for hierarchical IRQ GPIOs, until then you have to look at
> > gpio-thunderx.c, gpio-uniphier.c or gpio-xgene-sb.c that all
> > use hierarchical IRQs.
> >
>
> Thanks. I will convert them to hierarchical IRQ.
>

When will this series get respun and upstreamed?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
