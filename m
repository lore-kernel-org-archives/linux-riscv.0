Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2759C3ABD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDvuKLW1D7p3/pK958hqyv4rtvX/O0u4I5uQ8e5P3I0=; b=lKX1S5y6bfhLke
	amPd8aDo5xm01EjIDQ9k5y5IgepX5K0e4X+JJSE5VXTo2NHz1E40n1eUVOeRkyFjcfH9w2neXfX9V
	s2shBPJuRpqRo8jfSlVb6aK8lrFHdp+yFwyHXC0/gwSX4nOEaQMA7wYa10ha+EG8y5IaPjZcUaj/M
	wqIA+o89f8WHqgH+NYYyEtx36HSDLOurmUNz+AYX7EATuAZDeYQgiKW9U7fypwaY1c06cVY8O0tY7
	iknVO1+EukH0PAkpbAVMktCXEmhuV6AKyUEtu17b7tmziOAQx/cVuGWVdINuRxOGRpZ/Fd/ws4XK+
	pF2l0U/lpNxY3FJNG/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxg7-00000003yo3-1mG8;
	Fri, 16 May 2025 16:12:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxFr-00000003trb-2wfe
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E689C62A64;
	Fri, 16 May 2025 15:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86432C4CEF0;
	Fri, 16 May 2025 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747410346;
	bh=IfcZCOVl2cZHsDX4T04yuRwLb2cGUd5JrIqFBLn0nwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+14PxNfE0L1mwRb2/UUcId9ZR9psC9eFsVgvYi3wqboKHWHm9DQ7O0uPVdTemFma
	 /RFaAVG4Cb/Ys2T7+QDDuHz65FNA8W/H9koCm34x6dEIyz+IJ3HBH4E4gt9oeQ6Kbd
	 losyxjBUQ1ccb5RF2loDJByFk/5dmaBpAF3gI8o3RxZ/5rr5aqmqcqp44Sffl32PTC
	 hO+wi/xP6d0K7SVya2aschjBqyBEyYPTuWFXRLJLuJ81rdtyeXSnQr/3GgfqhNsDJN
	 FjtuKW1Z+/N7lon0efBeqqKbmElL6HJYQ1VhhDXPxi2otlLAhFXRS7qWuMWvucgHmr
	 KdOK1kFglX+Zw==
Date: Fri, 16 May 2025 17:45:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/15] bugs/riscv: Concatenate 'cond_str' with '__FILE__'
 in __BUG_FLAGS(), to extend WARN_ON/BUG_ON output
Message-ID: <aCddpaKTVTTucMX9@gmail.com>
References: <20250515124644.2958810-1-mingo@kernel.org>
 <20250515124644.2958810-13-mingo@kernel.org>
 <6886cf50-1a05-4ebd-bf8c-1afa652e8c89@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6886cf50-1a05-4ebd-bf8c-1afa652e8c89@ghiti.fr>
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


* Alexandre Ghiti <alex@ghiti.fr> wrote:

> Hi Ingo,
> 
> On 15/05/2025 14:46, Ingo Molnar wrote:
> > Extend WARN_ON and BUG_ON style output from:
> > 
> >    WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410
> > 
> > to:
> > 
> >    WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410
> > 
> > Note that the output will be further reorganized later in this series.
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Alexandre Ghiti <alex@ghiti.fr>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: <linux-arch@vger.kernel.org>
> > ---
> >   arch/riscv/include/asm/bug.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> > index feaf456d465b..da9b8e83934d 100644
> > --- a/arch/riscv/include/asm/bug.h
> > +++ b/arch/riscv/include/asm/bug.h
> > @@ -61,7 +61,7 @@ do {								\
> >   			".org 2b + %3\n\t"                      \
> >   			".popsection"				\
> >   		:						\
> > -		: "i" (__FILE__), "i" (__LINE__),		\
> > +		: "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> >   		  "i" (flags),					\
> >   		  "i" (sizeof(struct bug_entry)));              \
> >   } while (0)
> 
> I have added a dummy WARN_ON_ONCE(pgtable_l5_enabled == true) and I get the
> following output:
> 
> WARNING: [pgtable_l5_enabled == true] arch/riscv/kernel/setup.c:364 at
> setup_arch+0x6c4/0x704, CPU#0: swapper/0
> 
> So you can add for riscv:
> 
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks, I've updated the tags section of the riscv patches.

BTW., if you tried the WIP.core/bugs tree it has a final (and silly) 
WARN_ON_ONCE()-testing commit as well:

   af0503e693cf ("bugs/core: Test WARN_ON_ONCE()")

   +       WARN_ON_ONCE(ptr == 0 && 1);

:-)

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
