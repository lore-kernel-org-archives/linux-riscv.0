Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6665FC2A07A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNCbkpoYWNIbCnLOqzDrtndo+LIMIVQH1djXrTE1zwk=; b=b+T9vnyOBCKq6o
	/Tq2dwNAlLh21A/peTvIhZGqaJ3xbNHVQ14sfOIDwrjVksE2nSgHLgmmaKZpyypsMEzvXH8hNdnJF
	5ibPxpggBycyYj+4iJ4l5a9meWUaF1bBL0YLrV+8qMAthbUakLqhHTZLXt+/hz3zUjlJf5ONtaDX/
	6E2dWm9pu9mJnNGknVwrgIqMnGffjT0hhTDgThOflgYCTuLoqAnkoHYoaKbNhoXGcxYNQAGEHtBW5
	2AikuZtsyBbaITz6+esRegiPE1utmY2Klg5rleXirXTxTJR3q/d6FKKMlh03x6g4UwAsJpzwgaUP5
	fdGYzO0pe+L5Z7oRSY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vch64-0000000B4hP-1fWi;
	Mon, 05 Jan 2026 09:41:56 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vch61-0000000B4gj-2tvX
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 09:41:55 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C50C1341E55;
	Mon, 05 Jan 2026 09:41:50 +0000 (UTC)
Date: Mon, 5 Jan 2026 17:41:46 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260105094146-GYB2078702@gentoo.org>
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
 <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
 <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=McqmX5T-zOraWHz1Cfap+hcV_X=7dtKQOZehN9O8Fynhw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_014153_756326_34242E14 
X-CRM114-Status: GOOD (  21.25  )
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

Hi Bartosz,

On 01:23 Mon 05 Jan     , Bartosz Golaszewski wrote:
> On Sat, 3 Jan 2026 22:33:39 +0100, Yixun Lan <dlan@gentoo.org> said:
> > SpacemiT K3 SoC has changed gpio register layout while comparing
> > with previous generation, the register offset and bank offset
> > need to be adjusted, introduce a compatible data to extend the
> > driver to support this.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
> >  1 file changed, 117 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> > index eb66a15c002f..bca5c3dc13ca 100644
> > --- a/drivers/gpio/gpio-spacemit-k1.c
> > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > @@ -15,29 +15,37 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/seq_file.h>
> >
> > -/* register offset */
> > -#define SPACEMIT_GPLR		0x00 /* port level - R */
> > -#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
> > -#define SPACEMIT_GPSR		0x18 /* port set - W */
> > -#define SPACEMIT_GPCR		0x24 /* port clear - W */
> > -#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
> > -#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
> > -#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
> > -#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
> > -#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
> > -#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
> > -#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
> > -#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
> > -#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
> > -#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
> > -
> >  #define SPACEMIT_NR_BANKS		4
> >  #define SPACEMIT_NR_GPIOS_PER_BANK	32
> >
> >  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> > +#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
> > +
> > +enum spacemit_gpio_registers {
> > +	SPACEMIT_GPLR = 0,	/* port level - R */
> 
> No need for the = 0 here.
ok, I will drop it

> > +static const unsigned int spacemit_gpio_k1_offsets[] = {
> > +	0x00,
> > +	0x0c,
> > +	0x18,
> > +	0x24,
> > +	0x30,
> > +	0x3c,
> > +	0x48,
> > +	0x54,
> > +	0x60,
> > +	0x6c,
> > +	0x78,
> > +	0x84,
> > +	0x90,
> > +	0x9c,
> > +	0xA8,
> > +};
> > +
> > +static const unsigned int spacemit_gpio_k3_offsets[] = {
> > +	0x0,
> > +	0x4,
> > +	0x8,
> > +	0xc,
> > +	0x10,
> > +	0x14,
> > +	0x18,
> > +	0x1c,
> > +	0x20,
> > +	0x24,
> > +	0x28,
> > +	0x2c,
> > +	0x30,
> > +	0x34,
> > +	0x38,
> > +};
> 
> I would very much prefer for you to use the
> 
>     [ENUM] = 0xVALUE
> 
> style of initialization here for better readability.
> 
ok, will do

> Otherwise looks good so LGTM on the next iteration.
> 
thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
