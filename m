Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD009C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLYdpzFHV2+ELgc3u68p3EUZB9QCfUwYvEdpNA8fCkc=; b=RKxnXPbmEJ3JPu
	I8vEXLWPvWN310p/UPSFnJiBOcN5tlKbOK8MjaPB1iOnq1c36try52qb1P3EzRbHP3HpBJ2sZjYRE
	RONS+RysYIjRsspd4oRGRGH8DUXeMK5QjdUfmzMGeZ8i5BxU1HX3ibyZP3dkTjtdzNdhel0973QfQ
	LY44n9C1xC+9G3bGlz4GczVpwUCa3TS/APPQyAd+6DVslsfV/kx+M68ZQmUSC3xDbei6Z+DAP6Hi5
	AIbpMI8YTnB+5yZdxfa09NE8Aft5Da312wDHKRQ6REU88ip0xV+jRlLLRbSHTgX7MwZydHYa1C54f
	NV3XgAea2owDN1YVView==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B7r-00000002u35-0JKE;
	Thu, 09 May 2024 21:16:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B7n-00000002u1w-3GIG
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 21:16:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ac9b225a91so1092114a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715289381; x=1715894181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtrpmPs/8tWjRF/kXS6kBYaf57q1eTrsr00lK1K2fwo=;
        b=ZXrJXdIjqbuPZQtbV1k/PCzLbjT2BEUcFsdhiOJ9iIlXNDKw3qQRUe3djprjeYqHZO
         gxJcz56G68cZGmvWodcGQlBlOVwjaNdUy8VaPc/Ike+b7F8RS7fHn1EiBln87t31ulaw
         e+GdtS6JKIo/SMB5nTBdEgd5Fq0izKuaCh4+pkBqiYNW7xrBHX5dQjcwJy8XWNzzOpuY
         p2ZdRegeZftlCd/kabRnokZ5SNqXAWZxyvHyrRRIc/fJJ6k3ujYFqtQmuSbHqCOy7Z52
         COQssZVJ12zkDL9z7ei7Kpyju3bh90uQmK6bCgV3GnkYUa5ImVaKxbO/Na1fbP4g4UlW
         Vvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715289381; x=1715894181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtrpmPs/8tWjRF/kXS6kBYaf57q1eTrsr00lK1K2fwo=;
        b=Vf/CviuNaG/sI8XNf/HqeROMYakjI9DWfViidI8i/iBxbyH6eytsz0wA9GDKWXt0FP
         CzYOX4xEfHNNA5iKfLvL0hUxU397YOKQwP2phfMbKukbzd9RNMGdnvyjTo4KAdI42uuL
         UBB3sc4r3gZHoXzUYWdQKteCRgDOCZVxSLHY70R30ArESX8Sw++ODYM5MigmFBuS8tcw
         k+IuIgiAg81DEh1M5Dn1nTT8uqmIohYBf48qqtt1BP0Mngo1pnu4ptFlqd3FM1Lr7vHP
         w4cg43nUNFMuPeiw8ThK8KysiPDXJcwrcUfuR0pqiGU+UIpTmEEUsIkwBwPv6CwWv0Qx
         Xcjw==
X-Forwarded-Encrypted: i=1; AJvYcCXFGQ/oFl7Yu910oDvIOqrQkdELfAKl76+0eqvGFuIFS80QP4MFqDNc94D56waSLCmPkeRB6yD05UmpZTCXlV9QVmd+1GH1ZzkbayBFhEdB
X-Gm-Message-State: AOJu0Yz6i0Tm0/7QUZHeE3nfStB3zCVbhHcCXijwX4+lwkpnJPFSfvDl
	1Dd/K48qncn5aiH7AdjrXLnbu3/PL5rQPpxaB9zh525QgFWSHmBhiyuQH5VDCn0=
X-Google-Smtp-Source: AGHT+IHWAM1NQAisbSoFl3DqX2pmOe5hG2saLWkI1jbMADpZg5qPqsRMf5AT6IKOFvfnMFU1diTshw==
X-Received: by 2002:a17:90a:c7d1:b0:2b6:2067:dde0 with SMTP id 98e67ed59e1d1-2b6cc342832mr778629a91.5.1715289381313;
        Thu, 09 May 2024 14:16:21 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:3668:6b5b:d71d:2683])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62884a265sm3820721a91.19.2024.05.09.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 14:16:20 -0700 (PDT)
Date: Thu, 9 May 2024 14:16:17 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] riscv: Support compiling the kernel with more
 extensions
Message-ID: <Zj09IUE5k1EJL08X@ghost>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240509-uptown-aging-5bdec4730d70@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509-uptown-aging-5bdec4730d70@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_141623_854298_B1E0A59E 
X-CRM114-Status: GOOD (  81.01  )
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

On Thu, May 09, 2024 at 09:25:10PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> Don't mean to subject you to a rant here, but that's kinda what it seems
> to have become. I wish the Zbb example I use below was something someone
> else had written, so that it doesn't feel like I am tryna kick you while
> you're down, but that was the thing I happened across this evening :/

Don't feel bad! I wrote it so I can take it :)

> 
> On Tue, May 07, 2024 at 06:36:26PM -0700, Charlie Jenkins wrote:
> > The kernel currently has the restriction that it can only be compiled
> > with the extensions that are hardcoded in arch/risc/Makefile.
> > 
> > Any extension that is not listed in the Makefile can still be used by
> > explicitly writing the assembly and using alternative patching.
> > 
> > This series introduces Kconfig options that allow the kernel to be
> > compiled with additional extensions.
> > 
> > The motivation for this patch is the performance improvements that come
> > along with compiling the kernel with these extra instructions. Allowing
> > the compiler to emit arbitrary Zb* instructions achieves a 4.9%
> > reduction of dynamic instruction count for a test ran in Spike that
> > boots the kernel and runs a user space program that prints to the
> > console.
> > 
> > Additionally, alternatives that check if an extension is supported can
> > be eliminated when the Kconfig options to assume hardware support is
> > enabled.
> 
> I brought this up yesterday at the weekly patchwork call and meant to
> reply here yesterday, but I didn't get a chance to. I'll start off with
> my thoughts on the idea and the implementation and then mention some of
> what was said at the call.
> 
> Firstly, I don't like an implementation of this behaviour that requires
> doing ifdeffery around alternative sites. I think that iff this is done,
> the alternative itself should be evaluated at compile time, rather than
> having to add more decoration to callsites. That becomes particular
> important in the cases where the alternative may not be a simple a or b
> case, although I don't think there are any of those in the extensions
> you've looked at so far - or at least, you've not tackled those cases.
> 
> I am curious about the Svpbmt patch, as you say
> > Svpbmt would not benefit from having PLATFORM_SUPPORTS_RISCV_ISA_SVPBMT
> > so just move the definition of RISCV_ISA_SVPBMT to Kconfig.isa.
> without any any justification for why it would not benefit. There's
> alternatives in the codebase right now for Svpbmt, why wouldn't those
> get evaluated at build time also? Or why not Zicbom? Was your rationale
> for the extensions chosen just the ones that the compiler can actually
> generate code for?

It's only used in a place that has errata so I wasn't sure how to
handle that.

> That aside, the series seems to address the easiest parts of doing
> compile-time extension configuration rather than the messier cases like
> Zicbom. To me it seems like the messier cases is actually where we should
> be starting, so that we have a scheme that works well.

That's good advice. I wanted to send out something to start the
conversation on what people were interested in optimizing here. I can
look more into Zicbom.

> 
> Ben mentioned something along the same lines for the
> has_extension_likely() stuff, which should be far simpler, and can be
> implemented via a macro, as you already pointed out.

I was hesistant to change "too much" as I was expecting push back and
didn't want to have to re-write everything ;)

> 
> I did notice that you left the riscv_isa_extension_available() stuff
> alone. I think that's reasonable as that code serves more than one
> purpose and is intended for use in either in probe functions where
> there's no perf (or even code-size impact really, just disable the
> driver if you don't want it) or in cases where the user provides its own
> bitmap, like KVM.
> 
> I haven't actually reviewed the content line by line yet, so I don't
> have any detailed comment on any patches, but I think the two things
> being done here deserve to be split apart - the first element is
> evaluating things that are using alternatives at build time and the
> other is adding extensions to the toolchain's march.

That will double the size of the series but if you think that's better
than I can do that.

>
> Moving onto the objection to the series that I have though, at least at
> the moment. Adding more and more optimisations to the kernel already has
> potential to balloon to silly levels, and that's before we even consider
> the permutations of different build-time options. Both of those things
> feel like "where does it stop?" situation, with every single extension
> that could have code-gen impact becoming another build-time option for
> the kernel. As a result, I'm not convinced that we should do this at all,
> and I am starting to wonder about some of stuff that we have already
> merged..
> 

Vendors that expect a high level of performance need a way to be able to
compile the kernel with more extensions than the base extensions. We are
leaving 5% that can easily be gained by not allowing this.

> I don't think the configurability this series adds is worth the burden of
> maintaining support for all the various configurations you're proposing
> here (and the others that someone will come along with the week after
> this would be merged. After all, with extant hardware that distros are
> supporting, albeit in developer or bring-up type builds, one of these
> options could even be enabled. Which I suppose could be translated to
> a NAK from me on doing something like this at the moment...

By migrating everything into more refined macros I think I can ease this
burden. I don't see this as a burden, these options are all so closly
tied to each other and only matter when a kernel developer explicitly
wants to use an extension. If this is all wrapped up into the macros
that check if an extension is available it won't even be an extra step
than what it currently is.

> 
> Palmer suggested in the weekly call that what would make more sense is
> having established bases, that align with what distros are likely to
> ship, which probably means something approximating the mandatory set for
> profiles, although he also said that the rva23 profiles had already been
> given the kibosh by folks. He'll have to provide more information on
> that one though.
> I think that that seems like a sane approach, as it would produce a far
> more limited set of combinations to maintain, but it also means not doing
> something like this until the point that distros commit to some specific
> set of extensions that is not rv64gc... As well as reducing the
> combinations that we need to reason about as developers, I think that the
> "user story" for people deciding what is worth enabling in their kernel
> config before simpler too.

There is a chicken and the egg problem here. The
hardware/software/distros all want to support the same thing. Somebody
needs to step up and make a decision. With a patch like this, a distro
can see all of the functionality and select what they want. This can
then be rolled up into a config that selects something like all of the
bitmanip options.

> 
> * Something else that came up during that call, and I think it was
> Palmer's suggestion was having a hard think about what we are
> currently accepting optimisations for in the kernel. I think we need to
> up the "burden of proof" for what we will merge optimisations for to
> things that are demonstrated to have significant benefits. I don't mean
> to single you out here, cos I did ack the patch after all and it was
> just the random example I stumbled on this evening while looking at some
> alternative users in the course of writing a reply here. Take this code
> for example:
> 
> 	/*
> 	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> 	 * worth checking if supported without Alternatives.
> 	 */
> 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> 	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> 		unsigned long fold_temp;
> 
> 		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> 					      RISCV_ISA_EXT_ZBB, 1)
> 		    :
> 		    :
> 		    :
> 		    : no_zbb);
> 
> 		if (IS_ENABLED(CONFIG_32BIT)) {
> 			asm(".option push				\n\
> 			.option arch,+zbb				\n\
> 				not	%[fold_temp], %[csum]		\n\
> 				rori	%[csum], %[csum], 16		\n\
> 				sub	%[csum], %[fold_temp], %[csum]	\n\
> 			.option pop"
> 			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> 		} else {
> 			asm(".option push				\n\
> 			.option arch,+zbb				\n\
> 				rori	%[fold_temp], %[csum], 32	\n\
> 				add	%[csum], %[fold_temp], %[csum]	\n\
> 				srli	%[csum], %[csum], 32		\n\
> 				not	%[fold_temp], %[csum]		\n\
> 				roriw	%[csum], %[csum], 16		\n\
> 				subw	%[csum], %[fold_temp], %[csum]	\n\
> 			.option pop"
> 			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> 		}
> 		return (__force __sum16)(csum >> 16);
> 	}
> 
> The comment there made me think as to why we even have this optimisation
> for Zbb at all - is the saving of 3 - 1 or 5 - 1 instructions actually
> worth having 3 code paths? The commit message for this contains no
> information on the performance benefit of the code at, and while the cover
> letter has some information, it was not actually tested in hardware and
> does not look to be a real-word benchmark. This one is already merged,
> but something like this in the future would really need to be subjected to
> significantly more scrutiny! At the very least, "optimisations" need to be
> proved to be beneficial in hardware.

I put the justification in the cover letter of the series:

"Tested on QEMU, this series allows the CHECKSUM_KUNIT tests to complete
an average of 50.9% faster."

I did a lot of testing locally to ensure that every combination was as
performant as it possibly could be. I did not provide numbers for every
case simply because the combination with 64-bit and Zbb was the
primary target of the series and nobody asked about the other cases.

There is pretty much only this code and the bitops optimization in the
kernel that try to do anything extreme for the sake of performance.
These checksum functions are very critical to performance as these
checksums are computed on every network packet that is received by the
kernel. Networking drivers rely on these functions and they need to be
as fast as possible. 50% improvement is very good even if it's only
qemu.

We could just say we don't care about performance if you are running
32-bit linux or don't have Zbb, but we would be making that decision
because we don't feel like maintaining the code. The code was written,
tested, reviewed, and it provided large performance gains. I fail to
understand why this is a burden to maintain.

- Charlie

> 
> Anyways, that's my thoughts on this. IIRC it was mainly Palmer and I
> doing the talking about this on the call, with Paul I think having some
> comments. Hopefully Palmer can chime in :)
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
