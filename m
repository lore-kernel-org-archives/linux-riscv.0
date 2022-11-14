Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452AAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxT6vCnLXG3A2DcorhndkHGB0Grt77W1bOTyyyEZpHo=; b=XdHC/jgN8oD2r+
	hoGvooGUfNlsjZytrwUWhxP13cIk1gvBKC8Bg+a+G1vcb600WP1luf3EuJGD1LaeEUHNYnWmjABpi
	+TEbQci+l5l/l5+Id4/nuvo4lWXgUFfZPUoedqHA6rshb3ZXL5dbX0spnXUgrxP8Tj6eINmDvulb8
	WXuhUfq7kmj+scvSPb0+dF1TOkx1VG4znSmIaMFx9KVKHpH2G+sRbMheeR9xyFR73sFEgke8pGr5W
	pAR4rUAWXz6QYnqdwQKFEngJXdH5A81cdZRHsOkoF4IuuxvADdBuriVRfHZXVrXfQKgwlEjctMiCL
	1NMk/WPWFOYud/bNpnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougdk-0052xx-He; Mon, 14 Nov 2022 21:05:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougdh-0052wp-Rh
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 21:05:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73185B81253;
	Mon, 14 Nov 2022 21:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF768C433C1;
	Mon, 14 Nov 2022 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668459907;
	bh=Z82NcODKQTjjZm+/DKlSxM/LF5JAckbK998H4ZoEKuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=curFjTnAMbfaGKVt1rxJKQEhTGlOkDW1oFxS4nJMF6TX7teLdm0SvPlBK67Lx1OEy
	 mzonXSAl8w0szBjV0BqXID2nC45jnG0uiPRiIOB7UnhCOjeBfZpKsd28qXJFLY1nQ9
	 bfwPFNScW/UpWJaAg1K3Ia8CrqdTD3/nR5kl3z0DSuBNGCH/UHyQpd/3pyNteXb5Eh
	 txcQsX9k1Tj9atnuvRS8fOT/GjEQabJO8kMeazdDDXN/gRqa//IchTMZJV31oLp4nS
	 JJAgsC2ahO9raMEb6AYBsuN9EDECBeVBqCYenqDdtqCjjZUNxKJgauYiTeoWJKLEaq
	 RnfgsiOrBToTQ==
Date: Mon, 14 Nov 2022 21:05:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: Re: [PATCH] riscv: Update k210 defconfigs
Message-ID: <Y3Ktf8KXUnCl3Zbf@spud>
References: <20221114013151.714578-1-damien.lemoal@opensource.wdc.com>
 <Y3Kffxz33QV1Vvii@spud>
 <ce2a2873-c031-228d-e21f-e9918660e4b3@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce2a2873-c031-228d-e21f-e9918660e4b3@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_130510_067608_C7704654 
X-CRM114-Status: GOOD (  21.94  )
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

On Tue, Nov 15, 2022 at 05:58:11AM +0900, Damien Le Moal wrote:
> On 11/15/22 05:05, Conor Dooley wrote:
> > On Mon, Nov 14, 2022 at 10:31:51AM +0900, Damien Le Moal wrote:
> >> In preparation for SLOB deprecation, update the nommu_k210_* defconfigs
> >> to switch to using SLUB. To save memory, CONFIG_SLUB_CPU_PARTIAL is not
> >> selected.
> >>
> >> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > 
> > Hey,
> > Gave it a go w/ your v21 branch. To me, seems about as usable as it was
> > before...
> 
> Please use upstream buildroot. Everything is in master for this board and
> that v21 branch is dead now.

Ah cool, willdo.

> > Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I used buildroot defconfigs sipeed_maix_bit_defconfig and
> sipeed_maix_bit_sd_card_defconfig. Both had the same issue with SLUB: lots
> of errors with the shell, including failures for the init shell commands.
> And sometimes I end up with a prompt but no way to run any shell command
> at all. I guess that depends on fragmentation of the memory after boot
> completes.

Yeah, I guess I was just fortunate (or unfortunate?) and did not see any
- but I only ran the most trivial of commands after boot. I did give it
a couple of boots since I'd seen you mention problems but only 4/5
times.

> 
> > 
> > btw, what's the craic with that? Looks like you actually landed in
> > upstream buildroot fairly soon after you pointed me at your series.
> > Anything missing from buildroot, or did it all land?
> 
> Everything landed, plus some (some build fixes).
> 
> Palmer,
> 
> Please hold on before applying this patch. Discussion still going on about
> SLUB.

I'm only keeping half an eye on that thread, lmk if you'd like me to
re-test this at some point.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
