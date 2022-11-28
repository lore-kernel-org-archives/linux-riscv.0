Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74235C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CUdPsE+Qz6QjNLo1CDvp+6N5PGZbwxA8hURhSHYJ5s=; b=N2gjGC79YIM2ZX
	cjubw/89gxAnp3D6bxEnZ+6S5/OC7QCqL3YqtLSExzatNq9GMecicm/dzkXm1vba0f2iAyi/8c9df
	MXIuL7JaKTDxWM+2cvpNheCZDV7lnBnOwy5DyCecqtndTWYFE4iKnTzsfWAYRBJbvfPiSAdLLXeZQ
	G+me9DgGmlXCqjTrKPvY6Bnek3x3xgpZfCMVhwpEaRXMCMaMN8mfgx3CSnVzi0Qd749oGKlFWze29
	6m5L1gBZUqq0Zew8GY8UI3GEH89hh39RbYpddrIg74XPoVQ/5GcwAtBCl1iiYlcuC+oiFnXLkOpAg
	EgwrnF8F2Rgw0F1jXgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozjfQ-003x3N-Eo; Mon, 28 Nov 2022 19:19:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozjfN-003x1U-E5
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 19:19:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03F9761403;
	Mon, 28 Nov 2022 19:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F06AC433D6;
	Mon, 28 Nov 2022 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669663184;
	bh=wwhiPDZvy9BYZzrmMVEGTga8TykXovqTCIVplJR4AY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtfDWal8scRDcXDBQUfig851n5GT8MTyhNPFZwIunzV16X+OFd3UVRq4lcTG7tJ2O
	 dXU6D2Hoz1L3U31teGlwvlse5pDcB6SZYj8eDB9SCMSGYwZqK/nM2/xeEUIgYRVE0x
	 cUVg8HJwoO57x0PkFs+J6pQDBH6dD2p4ko2IbR8HAFDWrWyvdTdwRlstvLetJh8Io7
	 +jucjPXwQ3PMQD9xJG5Zc+4IWYSpNchSs7J7apR4UqC++qOhzNUNkuG/cbGP4QCWpg
	 tm5AYwBNNXALdDIY+KKBhdQs1Bc34SBJ2FETfD95MwfTIZjNGWXRCYkK3UN9UACArZ
	 Q/Lb6X17CPdQg==
Date: Mon, 28 Nov 2022 19:19:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
Message-ID: <Y4UJy0xL4Cj9tH2W@spud>
References: <20221126061557.3541-1-samuel@sholland.org>
 <Y4IxdOPWhLLg5rwd@spud>
 <20221128183559.5ei5fx4cl4mo3ioj@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128183559.5ei5fx4cl4mo3ioj@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_111945_536490_4A87D646 
X-CRM114-Status: GOOD (  23.80  )
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

On Mon, Nov 28, 2022 at 07:35:59PM +0100, Andrew Jones wrote:
> On Sat, Nov 26, 2022 at 03:32:04PM +0000, Conor Dooley wrote:
> > On Sat, Nov 26, 2022 at 12:15:56AM -0600, Samuel Holland wrote:
> > > The conditions reference the symbol SBI_V01, which does not exist. The
> > > correct symbol is RISCV_SBI_V01.
> > 
> > Huh, good spot.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Yeah, huh. It never occurred to me that we don't have some sort of symbol
> referencing checking in kconfig. Or maybe we do and I just don't know how

kismet, but that does the opposite. Randy Dunlap is the only person I
see fiddling with that stuff usually, so perhaps he knows? +CC them
either way.

> to enable it? Anyway, this issue made me wonder how many more dangling
> references we may have. I wrote a script to look for them and found 29,
> including this one. I'm not exactly sure how to report them since they
> touch so many different places. For now, I've opened this kernel BZ
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> > 
> > > 
> > > Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > > 
> > >  arch/riscv/Kconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index fec54872ab45..acbfe34c6a00 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -319,9 +319,9 @@ config SMP
> > >  config NR_CPUS
> > >  	int "Maximum number of CPUs (2-512)"
> > >  	depends on SMP
> > > -	range 2 512 if !SBI_V01
> > > -	range 2 32 if SBI_V01 && 32BIT
> > > -	range 2 64 if SBI_V01 && 64BIT
> > > +	range 2 512 if !RISCV_SBI_V01
> > > +	range 2 32 if RISCV_SBI_V01 && 32BIT
> > > +	range 2 64 if RISCV_SBI_V01 && 64BIT
> 
> And for this patch,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
