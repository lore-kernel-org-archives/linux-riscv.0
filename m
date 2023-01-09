Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C4EC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLEOQiHZNeFgd1l9TuuZxABbfFwgXTqPFrUFX3op4tY=; b=nUjB6Xf3J3rkWa
	Bzhjr60VJGvj/C6g7eMmRdyIY58Yrdaquy8xFHRKBfxCB975u/QF7zAHKpomj4AHWQI7qNkRe/xiR
	XY40K8BWqn9Ot33mWSwzXDDZxMClKTpGZRfdpfOMyjAZZ2Q//kJoZI/og/+GkdWsiPMkt5vlP4t91
	NL5+K07pjiZsHTtqo+czvOsIQHCQZZjvCqJXVWvgF+YlfM4EEJRZ170acmslhCIsWck0+dPcELTkn
	rXUARp2NdPQhRqNy51XhAc/ijZhv9y7inrQbs0tmRZYGmxuCbOp5F02sEwlH/FSI3xgPwf1AokpdF
	RV1qnIbOD7gsWYPuYGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEyAP-003jLx-GY; Mon, 09 Jan 2023 19:50:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEyAM-003jKD-S5
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 19:50:44 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pEyAH-0006Kp-CW; Mon, 09 Jan 2023 20:50:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/5] RISC-V Hardware Probing User Interface
Date: Mon, 09 Jan 2023 20:50:36 +0100
Message-ID: <2876870.k3LOHGUjKi@diego>
In-Reply-To: <Y7xhNSmlh6miWuZw@spud>
References: <20221013163551.6775-1-palmer@rivosinc.com> <20221201160614.xpomlqq2fzpzfmcm@kamzik> <Y7xhNSmlh6miWuZw@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_115042_944314_F468021B 
X-CRM114-Status: GOOD (  58.89  )
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

Hey,

Am Montag, 9. Januar 2023, 19:47:17 CET schrieb Conor Dooley:
> Hey!
> 
> Just bringing this up somewhere a bit more visible than the weekly pw
> sync-up yoke!
> I just got my VisionFive2 today & I see Heiko has just posted another
> version of Zbb support series, right as I had started typing this in
> fact, so I'm curious where we stand. There's gonna be quite a few
> people with Zba/Zbb capable hardware soon by the looks of things, so
> it'd be nice to have something we can point people at that actually
> applies to recent kernels.
> 
> I know Palmer you said you'd do some work on it over Christmas, but
> since that didn't materialise - are you still planning on spinning up a
> v2?
> Some thoughts on Drew's sysfs suggestion below would probably be useful
> if you aren't.

from my further optimization pov, I just rebased Palmer's v1 forward,
as I essentially only want the has-fast-unaligned property from it ;-) .

The series I posted today is essentially the basics for "everyone with zbb"
and I have a second part on top of that and Palmers hw-probing series
that then does the further case.

I do hope to get that finalized tomorrow or wednesday.


Heiko

> On Thu, Dec 01, 2022 at 05:06:14PM +0100, Andrew Jones wrote:
> > On Thu, Oct 13, 2022 at 09:35:46AM -0700, Palmer Dabbelt wrote:
> > > These are very much up for discussion, as it's a pretty big new user
> > > interface and it's quite a bit different from how we've historically
> > > done things: this isn't just providing an ISA string to userspace, this
> > > has its own format for providing information to userspace.
> > > 
> > > There's been a bunch of off-list discussions about this, including at
> > > Plumbers.  The original plan was to do something involving providing an
> > > ISA string to userspace, but ISA strings just aren't sufficient for a
> > > stable ABI any more: in order to parse an ISA string users need the
> > > version of the specifications that the string is written to, the version
> > > of each extension (sometimes at a finer granularity than the RISC-V
> > > releases/versions encode), and the expected use case for the ISA string
> > > (ie, is it a U-mode or M-mode string).  That's a lot of complexity to
> > > try and keep ABI compatible and it's probably going to continue to grow,
> > > as even if there's no more complexity in the specifications we'll have
> > > to deal with the various ISA string parsing oddities that end up all
> > > over userspace.
> > > 
> > > Instead this patch set takes a very different approach and provides a se
> > > of key/value pairs that encode various bits about the system.  The big
> > > advantage here is that we can clearly define what these mean so we can
> > > ensure ABI stability, but it also allows us to encode information that's
> > > unlikely to ever appear in an ISA string (see the misaligned access
> > > performance, for example).  The resulting interface looks a lot like
> > > what arm64 and x86 do, and will hopefully fit well into something like
> > > ACPI in the future.
> > > 
> > > The actual user interface is a syscall.  I'm not really sure that's the
> > > right way to go about this, but it makes for flexible prototying.
> > > Various other approaches have been talked about like making HWCAP2 a
> > > pointer, having a VDSO routine, or exposing this via sysfs. 
> > 
> > Hi Palmer,
> > 
> > To throw my two cents into the penny jar, I'd vote for sysfs. It handles
> > the heterogeneous CPU case since cpu feature nodes can be hung off each
> > cpu node. It also avoids yet another encoding. If we enumerate extensions
> > and their properties then we need to maintain that enumeration in both
> > the kernel space and userspace. If, OTOH, we use sysfs node names for
> > the encoding, then, when we match the spec naming exactly, e.g.
> > 
> >  .../features/zicbom
> >  .../features/zihintpause
> >  .../features/sscofpmf
> > 
> > userspace can look for features by name. Userspace libraries can even
> > lead the kernel in development, since the encoding (the spec name) is
> > already agreed.
> > 
> > Properties of extensions are just sub-nodes, some with standard names,
> > like
> > 
> >  .../features/zicbom/major
> >  .../features/zicbom/minor
> > 
> > and others, which are cpu feature specific, like
> > 
> >  .../features/zicbom/block_size
> > 
> > I used 'features' in the above examples for the node name, rather than
> > 'isa', since not all features map to isa extensions, but it should be
> > possible to fit non-isa features into the same framework.
> > 
> > Thanks,
> > drew
> > 
> > 
> > > Those seem
> > > like generally reasonable approaches, but I've yet to figure out a way
> > > to get the general case working without a syscall as that's the only way
> > > I've come up with to deal with the heterogenous CPU case.  Happy to hear
> > > if someone has a better idea, though, as I don't really want to add a
> > > syscall if we can avoid it.
> > > 
> > > I threw this together during the conferences so I would be surprised if
> > > it's not broken, but I figured it'd be best to just get something on the
> > > lists sooner rather that later.  Happy to have someone go fix my code,
> > > but the new uABI is really going to be the tricky bit here.  There's
> > > some test code included, but I haven't even booted a kernel with these
> > > patches so YMMV.
> > > 
> > > These are also up at kernel.org/palmer/linux/riscv-hwprobe-v1 in case
> > > that's easier for folks.
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
