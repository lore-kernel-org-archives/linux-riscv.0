Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975806070FE4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BhMIGnsW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESB/PjWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9f1fcR7aVzuuD0DQZ9Lx7mHNQx42viM/qXKPAZREuTA=; b=BhMIGnsWrGgl0IwpAqG+0VbHbm
	nwC1+NASsQup+rYiQP8404oEft4jjGo/Ai3XhV+PVHH1cnPrTGDtaSB6eomNGlO8MjZXZ1SFHumwg
	krhbKr5AU7QcvxGwESeEs3GhwAg99SQ5pB7Zan1puPXXupsUk9vz2lpVb21cTH6J17W7l37lALMYT
	tvlM8ooqyrWjMxK9dTCK2OzyDZlBNtOsmZFMe2hYgGHSOroMZFoXTs7AI2GxPKzSr3Cuu4z0ar9i2
	YrsVhxfRdkhcq5lZ6di6nulwIkg2qI44Hx8VZBEsf0JckQfiPrhei/kUiQz2qAX/6ANOCtmD7avKt
	hlotyLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi5t-00000003Fvz-0PXh;
	Tue, 10 Nov 2026 09:24:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi5r-00000003Fum-2xWo;
	Tue, 10 Nov 2026 09:24:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF896637F8;
	Tue, 10 Nov 2026 09:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C931F008BC;
	Tue, 10 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794302682;
	bh=anLdELyja2Hy69l1U4K5GC3KSWyOsZhor6+5I7MJPrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESB/PjWK+7S4hjQjB/73o85ozUTxNGJcqR0TnfzJKkNnd6UYrv4E7xJSc1bKO//Hn
	 rkf4+WQvzyZf42O1qbYbMhUlmgr1W5deOzJJmZ5KUMYJKnnpWtoXVYXj+dtdZtyPoS
	 xxrS1xZ9mP2EWgJcmiidxffyNNuo5GynD31uah5rmQUQHROrdjeqVIc3FwWbOt/y4s
	 iE2aCm5GxutXvK/N4gExiTkv5wRs7xrv9DSKusBdgzQawHVWyUg7snClrfR+QAU+ip
	 DJKYBZLvhsxN84M2YjXVI0YTj3dOCOF3l3zhtRrYrZmu6uDkut5NaVFPbagJucH2mt
	 RrlQ9HWeLrLTw==
Date: Tue, 10 Nov 2026 11:24:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Chen Pei <cp0613@linux.alibaba.com>, pjw@kernel.org, palmer@dabbelt.com,
	alex@ghiti.fr, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
Message-ID: <avLi0_mYXatBWmpL@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-3-cp0613@linux.alibaba.com>
 <179415145358.358073.165272378597657083.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179415145358.358073.165272378597657083.b4-review@b4>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 10:24:13AM -0500, Pasha Tatashin wrote:
> > The generic handover paths are already in place on RISC-V: the outgoing
> > kernel publishes the handover FDT and the bootmem list in /chosen of the
> > DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
> > picks both up while scanning that node. Only the architecture symbol is
> > missing.
> > 
> > Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
> > and KEXEC_HANDOVER selects CMA, which depends on MMU.
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e7891a2a89da..a5c56252ff44 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
> >  config ARCH_SUPPORTS_KEXEC_PURGATORY
> >  	def_bool ARCH_SUPPORTS_KEXEC_FILE
> >  
> > +config ARCH_SUPPORTS_KEXEC_HANDOVER
> > +	def_bool 64BIT && MMU
> > +
> >  config ARCH_SUPPORTS_CRASH_DUMP
> >  	def_bool y
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
> 
> But pre-reqs. should be applied prior taking this series:
> 
> 1. https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com

I'm planning to send it to Linus this week.

> 2. https://lore.kernel.org/all/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org

This is easy if we take it via liveupdate tree :) 

@ricsv folks, how do you prefer to play it?

> -- 
> Pasha
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
