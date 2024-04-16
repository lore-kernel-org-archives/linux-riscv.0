Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFA3C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxsJmRE836uEeq2LOEJhGJSHWN8RCqEqDNwNg+vwkOg=; b=VTon30cHjAlflH
	IJOkG6nkNSIIkSfOpIgT8lMbClKyb6o8vZVDpWAwOPqvoXFC6dmmcGB5pb4frNmGAIgs4CPAWRdzD
	tGchnfBUvXSGpzJ6bGtQrgp8i3EwRf7tFQG+tgjN30BOe+tOJ06wEzm1CaMMtR5q1WgdORed9XlAG
	zC1j15FErQS7FtBC8u1jrJtFRS8aypq6h6pEODiYW2/tC6LzlkoTWSocowrOkeXDk4wRs/IzwWgJ7
	ZU1hgW9ooh2rBiDUYm1lXAYQZTF8YWHJD4k6DjlnB6sFYDzq8N/A9WQkVY1gar0gCuTcJsmoxpmns
	wmRnbmw4n8ACF7eKqpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlk8-0000000D23Z-1CtI;
	Tue, 16 Apr 2024 16:33:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlk4-0000000D21n-2hRL
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 16:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CA02CE10F7;
	Tue, 16 Apr 2024 16:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D926C113CE;
	Tue, 16 Apr 2024 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713285184;
	bh=gTJHR1KdErAk/qzXo5EJZZiXgCceiHY4vGZi+g7gbDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtqvXTIWp4JmR1FEXjRm/DaLcxcqVbM2sHNsTceCNUlja61mLU46RASB4axT8jg7S
	 ccSAtBcXO0XJgcAOAkoSXCk08wv1/gy8wYOwNQKVpNrnIWb1U96Y0fr1kbgyU4fuSM
	 LDei7oagYypXMxOvgDkPZQ34bTr9dFttMUMB/hKcpj5EezRXogMzMk+ZFPnCCpGH0+
	 /JF9F1R7RPCGjHwJCNQHo0pzQdq0BwDUuRvACQZ0id1Qh2GX6bTVvG1fVIVdX1v12L
	 t7hmZH/NYURJMwWh2rUMqairNtEvXdZJNhrJA4dZinneJD+IcysEK6n3rjvUQaYSpk
	 neOgd64QhpAxw==
Date: Tue, 16 Apr 2024 19:31:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <Zh6n-nvnQbL-0xss@kernel.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416181944.23af44ee@namcao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_093309_227865_9C1A8B29 
X-CRM114-Status: GOOD (  23.34  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2024 at 06:19:44PM +0200, Nam Cao wrote:
> On 2024-04-16 Bj=F6rn T=F6pel wrote:
> > Nam Cao <namcao@linutronix.de> writes:
> > =

> > > Fixed version:
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index fa34cf55037b..af4192bc51d0 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -245,6 +245,7 @@ static void __init setup_bootmem(void)
> > >  	 * be done as soon as the kernel mapping base address is determined.
> > >  	 */
> > >  	if (!IS_ENABLED(CONFIG_64BIT)) {
> > > +		memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);
> > >  		max_mapped_addr =3D __pa(~(ulong)0);
> > >  		if (max_mapped_addr =3D=3D (phys_ram_end - 1))
> > >  			memblock_set_current_limit(max_mapped_addr - 4096);  =

> > =

> > Nice!
> > =

> > Can't we get rid of the if-statement, and max_mapped_address as well?
> =

> I don't see why not :D
> =

> Best regards,
> Nam
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..f600cfee0aef 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -197,7 +197,6 @@ early_param("mem", early_mem);
>  static void __init setup_bootmem(void)
>  {
>  	phys_addr_t vmlinux_end =3D __pa_symbol(&_end);
> -	phys_addr_t max_mapped_addr;
>  	phys_addr_t phys_ram_end, vmlinux_start;
>  =

>  	if (IS_ENABLED(CONFIG_XIP_KERNEL))
> @@ -238,17 +237,9 @@ static void __init setup_bootmem(void)
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of
>  	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> -	 * macro. Make sure that last 4k bytes are not usable by memblock
> -	 * if end of dram is equal to maximum addressable memory.  For 64-bit
> -	 * kernel, this problem can't happen here as the end of the virtual
> -	 * address space is occupied by the kernel mapping then this check must
> -	 * be done as soon as the kernel mapping base address is determined.
> +	 * macro. Make sure that last 4k bytes are not usable by memblock.
>  	 */

It's not only memblock, but buddy as well, so maybe

	/*
	 * The last 4K bytes of the addressable memory can not be used
	 * because of IS_ERR_VALUE macro. Make sure that last 4K bytes are
	 * not usable by kernel memory allocators.
	 */

> -	if (!IS_ENABLED(CONFIG_64BIT)) {
> -		max_mapped_addr =3D __pa(~(ulong)0);
> -		if (max_mapped_addr =3D=3D (phys_ram_end - 1))
> -			memblock_set_current_limit(max_mapped_addr - 4096);
> -	}
> +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);

Ack.

>  	min_low_pfn =3D PFN_UP(phys_ram_base);
>  	max_low_pfn =3D max_pfn =3D PFN_DOWN(phys_ram_end);
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
