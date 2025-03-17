Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76983C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkjZDH7H1wlWqupH+1SHzW3AuJ+mw4mZGlL39s0EJzc=; b=l5GAUtjvtPAOjF
	kVS6VvW1zpBawg4oNxEgbbC3yNEIDJx8hUZuYGGjLibLE4f/z9eu3Qr9vT3kmvkdhmyhgi+E4R3f8
	fT5ZNt0CPIzs7H9UBX0dtmWZrztns9licjXbhLhCqTW4nCeYUJdXafAFIa+5PDhBTarcRqFVZmh6y
	M3+tMpaSBoBCNVozNxoTm5g6xmnM3H1v4HlVVAT9SEtig/rQPTstQw4Tf1v1G6PbJbZTecPM1f1G0
	102O0XBDma3DKJEyhIl+1QHwprZmrcgXoPcXyvvpvpNhJTT7ta81Men7JESbGx8eE8WtfqTBgs6Fs
	zLlJU1evWSkUjTmlU3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAZC-00000002k4x-2bWR;
	Mon, 17 Mar 2025 13:31:42 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAXa-00000002jcS-2X71
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 13:30:03 +0000
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE6493432A1;
	Mon, 17 Mar 2025 13:29:59 +0000 (UTC)
Date: Mon, 17 Mar 2025 13:29:55 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
Message-ID: <20250317132955-GYC1983@gentoo>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
 <20250317124120-GYA1983@gentoo>
 <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_063002_673250_103C4904 
X-CRM114-Status: GOOD (  37.92  )
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

Hi Geert:

On 13:59 Mon 17 Mar     , Geert Uytterhoeven wrote:
> Hi Yixun,
> 
> On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> > On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > > Thanks for your patch, which is now commit 7ff4faba63571c51
> > > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> > >
> > > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > > The uart driver requires it, same as sd card driver,
> > > > so let's enable it by default for this SoC.
> > > >
> > > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > > 'make defconfig' to select kernel configuration options.
> > > > This result in a broken uart driver where fail at probe()
> > > > stage due to no pins found.
> > >
> > > Perhaps this is an issue with the uart driver?
> > > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > > few Renesas platforms where the pin control driver is not enabled by
> > > default, for saving memory), and the system booted fine into a Debian
> > > nfsroot.  Probe order of some devices did change, and "Trying to
> > > probe devices needed for running init" was printed.
> > >
> > my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> > # CONFIG_PINCTRL_SPACEMIT_K1 is not set
> >
> > for your case, is CONFIG_PINCTRL_RZA2 built as module?
> > it should work for uart driver with deferred probe mechanism..
> 
> No, CONFIG_PINCTRL_RZA2 was disabled in my testing.
> 
emm, this is interesting, there might be problem that uart driver
fail to have correct pin settings without pre initialization..

which uart driver is used in RZA2MEVB platform? any pinctrl dts property?
different hardware may vary..

> > > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > > @@ -4,9 +4,10 @@
> > > >  #
> > > >
> > > >  config PINCTRL_SPACEMIT_K1
> > > > -       tristate "SpacemiT K1 SoC Pinctrl driver"
> > > > +       bool "SpacemiT K1 SoC Pinctrl driver"
> > > >         depends on ARCH_SPACEMIT || COMPILE_TEST
> > > >         depends on OF
> > > > +       default y
> > >
> > > Ouch, fix sent...
> > > "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> > > y unconditionally"
> > > https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be
> > >
> > I got suggestion in v1
> > https://lore.kernel.org/all/20250211-nature-kilt-9882e53e5a3f@spud/
> 
> Yeah, I read that, but only after I noticed the issue in v6.14-rc7.
> 
> > so for COMPILE_TEST case, ARCH_SPACEMIT config won't be enabled? then neither PINCTRL_SPACEMIT_K1
> > anyway, I'm fine with either way, thanks
> >
> > > >         select GENERIC_PINCTRL_GROUPS
> > > >         select GENERIC_PINMUX_FUNCTIONS
> > > >         select GENERIC_PINCONF
> 
> It depends. ARCH_SPACEMIT can be enabled only when building for
> RISC-V, while COMPILE_TEST can be enabled everywhere.
> 
Ok, good to know
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
