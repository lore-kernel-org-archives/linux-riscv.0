Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED4C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p70eUfACHwjGwt9fLUb8MH5U2DQT3KnUKpAZn1wUdlc=; b=UpTNq3SMsaP+7M
	pXWQQvqim1a8MoBkTguH3p8RT+782YLAf9kvjGJKD1CJOXfBv3PRD8MkCS9AquS/H64PLuqEv/koN
	f4CBnhhq2pJZXvRCcmH+IJ4CBAAAB7oKM/KcV/WPBKJHS1RIYmiJQ8RM5MsAArdW9myVgc3h3LcSF
	tpuM7bk3EAcON1HoEDkAZ0NJx/9gOj/6ldaDW/ihkKJIMJZRCpSKI38P1ONTHNz6rexA1xLNvomo1
	sq4Oq2GCRNqWJB6tPM0BOuLNYY1Ho5TV+N5553/qsMsH7hCWw4clndk8FD21LDOqa7DDhlIYcL3WZ
	wccCTdKS3hNknj9Vkq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCd7-008h4I-10;
	Thu, 10 Aug 2023 20:51:37 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCd3-008h3i-0q
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 20:51:35 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D55BF9200C1; Thu, 10 Aug 2023 22:51:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CF39A9200BF;
	Thu, 10 Aug 2023 21:51:28 +0100 (BST)
Date: Thu, 10 Aug 2023 21:51:28 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
    linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
    Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
In-Reply-To: <20230810140537.GA17787@hsinchu26>
Message-ID: <alpine.DEB.2.21.2308102140290.8596@angie.orcam.me.uk>
References: <20230803230110.904724-1-greg.savin@sifive.com> <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com> <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
 <20230810103510.GA2509@hsinchu26> <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk> <20230810140537.GA17787@hsinchu26>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_135133_459367_30B6C17B 
X-CRM114-Status: GOOD (  31.52  )
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

Hi Andy,

> > > Does it make sense to you if we encapsulate this with a hwprobe syscall?
> > > e.g provide a hwprobe entry to get system's VLENB. We will have to
> > > increase and rearrange the buffer for NT_RISCV_VECTOR if we want to use
> > > ptrace as the entry point for this purpose. I am not very sure if it'd be
> > > too late to do though.
> > 
> >  No, how do you expect it to work with a core dump (that can be examined 
> > on a different system, or with a cross-debugger)?  You need to change the 
> > API I'm afraid; it's unusable anyway.  It's a pity the toolchain community 
> > wasn't consulted if you weren't sure how to design the interface.  Better 
> > yet it would have been to implement the GDB side before the kernel part 
> > has been committed.
> 
> Conor just reminded me that we may still have a chance to get it right
> since 6.5 has not been released yet. I will send a fix patch to address
> this issue once the discussion settle down. After looking into some
> code, I think it is possbile to steal the unused space in datap and
> change the uapi with something like this:
> 
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index e17c550986a6..ba6ddf4f9dc9 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -97,14 +97,17 @@ struct __riscv_v_ext_state {
>  	unsigned long vl;
>  	unsigned long vtype;
>  	unsigned long vcsr;
> -	void *datap;
> +	union {
> +		void *datap;
> +		unsigned long vlenb;
> +	};
>  	/*
>  	 * In signal handler, datap will be set a correct user stack offset
>  	 * and vector registers will be copied to the address of datap
>  	 * pointer.
>  	 *
> -	 * In ptrace syscall, datap will be set to zero and the vector
> -	 * registers will be copied to the address right after this
> +	 * In ptrace syscall, the space for datap will be set to vlenb and the
> +	 * vector registers will be copied to the address right after this
>  	 * structure.
>  	 */
>  };
> 
> Now ptrace will have the knowlege of vlen to parse V rsgisters. And this
> will not cause any size change to the original data structure that is
> shared by both signal and ptrace because vlenb is XLEN, which has the
> same size as a pointer in both ilp32/lp64.

 Barring details such as field naming (perhaps `vregp' rather than opaque 
`datap'?), or whether we want to have a union embedded such as above or 
distinct UAPI data types for the two use cases I think your proposal for 
the updated contents makes sense to me, thanks.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
