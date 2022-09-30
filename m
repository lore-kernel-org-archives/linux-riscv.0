Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46229C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSwZIQPXNuq99IPQtLcHThuCyA9P/qPTn6c36LEuFEI=; b=b/SxOIgv9E2y7P
	60DaDw01aq1XjP2ptIuznffKc1dOsKWZC2VxvPjhxTlANc8C6C/tB14WXIqv5pwgL3B2h4q7kVQVV
	ppwoRDeZcqAa78TypDl/CdzkUYnk5qb7VUTL6/jan48BISdPv/WU4TVivXGyZtV/V4aW/EuKQWykA
	W3SXU+0XLnlQnKvxQ2K5vjDLoBW4riOJ6GycKOa26vCrHxRIXdDMX9sux5P0gfXWabBuRHgIgx7C9
	Q+VgJQgavT9iHbpcsIVBlOSuouGAM/ZeZgvntv/LqMbt2iwLPwRbEm6NHrz/G5z9Of/4tAfKIlBH1
	B7aI8hhuSG3pFerkxNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNlG-00BgXn-8C; Fri, 30 Sep 2022 21:41:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNlD-00BgX1-Rx
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 21:41:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 382E062513;
	Fri, 30 Sep 2022 21:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD021C433C1;
	Fri, 30 Sep 2022 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664574090;
	bh=EWwElnoQ3zIq+7TaGrma83diIit5m496+HZGkaC/q44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoNAyXvQ6XZUKlvHJdQTgOYhYGSHuu/exBYucbS88m47QiHG6E0E0z2THsu2YvMb2
	 Ya/kB5pgAeZpJtOsAdSsn6JWCV0Qhw/unu3XJMp/GpfxNi3EneQcZ9gcf8vLFak67w
	 NMa072xAK0FZVg6MvUsWXAcwrGkNa0Bdgvm5kyeY7Ag7jmKMzIlw1EFiqZq5qQ+ZT1
	 ibzZa3Ex+6bYE6LwxtNDofRa3aS8Ma49ouf3WVS7qJbU+adqHmrYWgVLMT0M8CXn26
	 Hd69niFIk3XXUhyTQUPaFsNNnBYgy6SJTSYbKJ62F16xFXHaAqRJ4imrNpA/HpYT/W
	 //xEpCHEwTJlA==
Date: Fri, 30 Sep 2022 22:41:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 29/30] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Message-ID: <Yzdig6GepDx34u1j@spud>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930090653.7449-1-hal.feng@linux.starfivetech.com>
 <01c658ad-7f73-20fc-03c0-c82dcd820aa4@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01c658ad-7f73-20fc-03c0-c82dcd820aa4@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_144131_975919_A64A7CB4 
X-CRM114-Status: GOOD (  20.40  )
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

On Fri, Sep 30, 2022 at 09:54:14PM +0100, Ben Dooks wrote:
> On 30/09/2022 10:06, Hal Feng wrote:
> > Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
> > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
> > 
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> 
> That might be useful for other users at some point an I don't
> think it adds much code.

Honestly I think this should be applied for 6.1, for parity with the
other SoCs that have their serial console enabled by default.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> 
> > ---
> >   arch/riscv/configs/defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index aed332a9d4ea..0c44484cd3a4 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
> >   CONFIG_INPUT_MOUSEDEV=y
> >   CONFIG_SERIAL_8250=y
> >   CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_DW=y
> >   CONFIG_SERIAL_OF_PLATFORM=y
> >   CONFIG_VIRTIO_CONSOLE=y
> >   CONFIG_HW_RANDOM=y
> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
