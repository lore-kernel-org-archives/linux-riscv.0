Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5DDC38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7WtnzKZMhI6msiQsAvJTjcBwvlsjJHRBzSI99ps0zo=; b=pcZLr6vwHwh4RE
	i3NOm7srxLa02WAqKXasrYFZ5+/w2R/A7uAB4zqCEeyfb3xSgjDNKqyBLO4Owrjz9/xqAv2M/YR3U
	c+svqcc9ZK0AH2/tHY9/PyWXnQIIzZDqHchOh6ECKX1bW41A6T68ABk54T2Sda+BYC1bNTwbNYu3q
	cZv5wu9XAmFq9KKVoGywHhIufeAHhzPR3gg0DA3gFnvltpLHLHSyM+/lVzLdxFBkU/ODYD8Zm9lBE
	7nroe2T/O5owo8Gm53ZRfiCStMq8V8JjsmfCQh6dT2Jch1GqiXuChMKILfsDcTItP5wjtnPRpIC9u
	j7/eTN98T4EE5SRFt2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op71D-00FoUf-PQ; Sun, 30 Oct 2022 12:02:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op71A-00FoTH-51
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 12:02:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C1D8B80122;
	Sun, 30 Oct 2022 12:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE1CC433D6;
	Sun, 30 Oct 2022 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667131335;
	bh=HRszhxNcL2xa9zIHaXT7CIUphxF72yX5b9TQHNkKxnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJuv/zABSSkBJJ3P9HwYtusgSfxCzmrjBDhvS9BTNEp8KVcZrhE2nvgQTF5DaLoxo
	 zHIBIA3g7z9TcJlfw5aAk5UhK+9CLletD7tWH5AYzKZFhUYzHB8pBV/6K+TkZrIEf5
	 7iu4d89NMBD293J3ijZ8/srtsjaCNryGPL25mvGRvleWAgZE5+Ek5R5sTCMJziN8S6
	 JFKjKJBG9aOqwUhgbk0qs0IIkgNL2UISvQ9B6e+9W8nGbYfmBb/h9qhmz4Ycm1Bb0p
	 j1Bdw0Kpp03KKAVzR4YvY3DwiSLf8W9Bo9XDNGB1gpBMooctV7QE2dv3xfam0hfff/
	 ivUN0dmq48Mxg==
Date: Sun, 30 Oct 2022 12:02:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 0/6] RISC-V: stop selecting device drivers in Kconfig.socs
Message-ID: <Y15nwXmn7rToJkH2@spud>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_050220_376925_E39ADFE5 
X-CRM114-Status: GOOD (  18.85  )
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

On Wed, Oct 05, 2022 at 06:13:43PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As my RFC [0] series doing the symbol name changes has not yet reached
> consensus, I've split out the removal of device driver selects into a
> new series. I kept the plic as a direct select - although given how Maz
> is treating the SiFive plic driver as the RISC-V plic driver, maybe that
> should just be selected by default at an arch level...
> 
> I assume the individual patches can go via their subsystems & I'll
> resubmit the arch/riscv patches a cycle later? I'm not in any rush.

Hey,

What's the story here with the two serial patches, they just waiting for
an Ack? I think these are archived on the riscv patchwork, so if that is
the case I'll unarchive them and mark as needing one.

Thanks,
Conor.

> 
> 0 - https://lore.kernel.org/linux-riscv/20220923185605.1900083-1-conor@kernel.org/
> 
> Conor Dooley (6):
>   clk: sifive: select by default if SOC_SIFIVE
>   serial: sifive: select by default if SOC_SIFIVE
>   serial: sifive: select by default if SOC_CANAAN
>   riscv: stop selecting the PolarFire SoC clock driver
>   riscv: stop selecting SiFive clock and serial drivers directly
>   riscv: stop directly selecting drivers for SOC_CANAAN
> 
>  arch/riscv/Kconfig.socs    | 8 --------
>  drivers/clk/sifive/Kconfig | 4 +++-
>  drivers/tty/serial/Kconfig | 2 ++
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> -- 
> 2.37.3
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
