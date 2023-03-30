Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F016C761AF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PnRbl98IaeDt5/jXOtMTR3lZ0A3glgMYre0ScgKrWo=; b=n8mhmozqYs7a9H
	k9c+9DyBeZL4CLWgFPUoMRfW46LddThNJFfZj6kgwSERIgx9HEAQ4K4OzgPbamnbyEP9anD7Vidi0
	spogFMryvO50KKs8iPGndNiqsaILD55a59AepnTOKArkWWUapTp+tsuxmhtSwxMVFDZ2gBrJ5ZkGj
	yvJYtmVr5OeeWui8+FdJUum/952AiXGj877pXNVgt6Au7zQPbg6lYtBmCK1w3fJ8mboNupUaHIi9w
	RZ9jLtYCJ04+JlbfPeSAwh5BcGR1f0iI8S4lCEq48GJ//5kQRCg5rDNtd7QTPTRRoZPHSEhW68GFx
	Pn9x5SJjYaohpGhECDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phqpV-003gut-2V;
	Thu, 30 Mar 2023 11:52:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phqpR-003gu4-1y;
	Thu, 30 Mar 2023 11:52:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10327B8287A;
	Thu, 30 Mar 2023 11:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2866C433EF;
	Thu, 30 Mar 2023 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680177146;
	bh=Lg8Woq7ScP2NFdPayLKkYeMtRMZwMJRAR9+KtXakJhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RZipPa0Ma88cpwApm0Td+Y0hkbkQIILnwFNQiwuNoLfKzZn1t1N2RWebuO5MmOdWR
	 lQtcg7+hOj2+xkyHWlgIoVZbU8l/ColoV4uTbiTmPZpGMjP4+5b5KL+k1PATzLy9Rp
	 ne1YU23rrq+LQ/aY1hx5aVq6JaiwH990blyhsz8dbOuarS9Dyli23+YzGF/f36+HG8
	 eJWfg6HhHG23+Gjz87NUmJCRzsfOcEHVVMSrZcSvvVaSn3bHZUCJGXYVhIzkM552zo
	 58hqYF8ul49kdxkY2muTd2AEDgWpic6fO2hGOkAcvaSEivLLlgKYSKrkNwb4+H7X43
	 TxbpI+NG3HS5w==
Received: by mail-ed1-f51.google.com with SMTP id w9so75394069edc.3;
        Thu, 30 Mar 2023 04:52:26 -0700 (PDT)
X-Gm-Message-State: AAQBX9ehGnZJqMzjiPkDk8lRrV4DoZ8OpT9rdO408uKrXbCnUiuIHzcR
	7yUKJWMX/1etsPwIHTm5wJB9viZjQpyoYCGHCbY=
X-Google-Smtp-Source: AKy350aaxBOgSqlP959KpS9cfZAsDCsvbSuFf+7QcLc+VlamdgSrDzoUdXNjAn81KSsW2remp6yjeVooIQhT3qtniP0=
X-Received: by 2002:a19:f007:0:b0:4db:b4:c8d7 with SMTP id p7-20020a19f007000000b004db00b4c8d7mr1755725lfc.2.1680177124990;
 Thu, 30 Mar 2023 04:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-19-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-19-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Mar 2023 13:51:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGNjrmTr1R+-09UYtHSgvT6fSgZxvpbEOfeTFxhWtgGcQ@mail.gmail.com>
Message-ID: <CAMj1kXGNjrmTr1R+-09UYtHSgvT6fSgZxvpbEOfeTFxhWtgGcQ@mail.gmail.com>
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_045229_989651_72E4FC78 
X-CRM114-Status: GOOD (  28.31  )
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

On Mon, 27 Mar 2023 at 14:18, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The cache management operations for noncoherent DMA on ARMv6 work
> in two different ways:
>
>  * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>    DMA buffers lead to data corruption when the prefetched data is written
>    back on top of data from the device.
>
>  * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>    is not seen by the other core(s), leading to inconsistent contents
>    accross the system.
>
> As a consequence, neither configuration is actually safe to use in a
> general-purpose kernel that is used on both MPCore systems and ARM1176
> with prefetching enabled.
>
> We could add further workarounds to make the behavior more dynamic based
> on the system, but realistically, there are close to zero remaining
> users on any ARM11MPCore anyway, and nobody seems too interested in it,
> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>
> The Oxnas platform has some minimal support in OpenWRT, but most of the
> drivers and dts files never made it into the mainline kernel, while the
> Arm Versatile/Realview platform mainly serves as a reference system but
> is not necessary to be kept working once all other ARM11MPCore are gone.
>
> Take the easy way out here and drop support for multiprocessing on
> ARMv6, along with the CONFIG_DMA_CACHE_RWFO option and the cache
> management implementation for it. This also helps with other ARMv6
> issues, but for the moment leaves the ability to build a kernel that
> can run on both ARMv7 SMP and single-processor ARMv6, which we probably
> want to stop supporting as well, but not as part of this series.
>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Daniel Golle <daniel@makrotopia.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-oxnas@groups.io
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
