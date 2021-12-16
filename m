Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A776C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 04:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GoDFWTHrxyh65Ews2rh3I77uI5cC9GQn8UzLHnbsfI=; b=myLbjqdXi4o3TF
	KMC3dnDfe8T/94F3kyg2Atz21OiTyhzslZbb0WZ8S/nnQdzKlJQfElYj2b9e46ySfiaa3vVi3Nlt0
	FnejWFR7dDhe9wXPjQjHVP4NRZkKoQxbRiqgSoDAXWB736Biet5mHrrQ2xjYd16O5wWfRWOP1fcOe
	HJja3WhsW5/wCcK7MIr2dgvStKtGgtUJ3SkmM4oBKzNJQ2PcbfwDWT/POgUEHs+0wkq71vGLlOYWu
	8/gDp7UaMdvIpmkSpn9UA7RDRt1BuHgAmmEfVv63720Ijdm3a8EzbGpFD+UmfMMzcBJc+BzmlLj1K
	za3CgAglvkmLP4itLJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxiV1-003Y7r-NZ; Thu, 16 Dec 2021 04:36:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxiUy-003Y6j-Tn
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 04:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99F10B82284;
 Thu, 16 Dec 2021 04:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494C6C36AE0;
 Thu, 16 Dec 2021 04:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639629366;
 bh=iTPhelKYVuiYtgSv4risiaN2muO295q58+hWF8wJec8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Wg/wA9qF99lzo1Tr7OEsbGggT0XjMUaFnxz/w6bl+1AB6BGCc0ovCtfoHYPNql2eW
 3RgaiIOSekITC2GNEJ3POBFSwO95d4EcLFgPJ0TxFnyCxA7CG3F6y5NLWewmn3l7jk
 +1E8iPiWotmfM3Q/3MnZ2QqiVlpzSriOTcm18JER9TZphqtjAK96qW7yQLVKXcwGiA
 14gKUWHA6QUleNQxD0vGcjYfZlMLRlvf4hZWWDGP9kwnAAFmDB/EP3X7+mb1/rLL63
 rtBR9kKbJWCtytTkySBLkcrXbXmncxwfkxEEp0q29Yz3De0rMTk0fZw3YLWxQC8zFi
 sxInC2R82o5UA==
MIME-Version: 1.0
In-Reply-To: <20211116150119.2171-7-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-7-kernel@esmil.dk>
Subject: Re: [PATCH v4 06/16] clk: starfive: Add JH7100 clock generator driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Date: Wed, 15 Dec 2021 20:36:05 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216043606.494C6C36AE0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_203609_137500_31EF94A3 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Quoting Emil Renner Berthing (2021-11-16 07:01:09)
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add a driver for the StarFive JH7100 clock generator.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
