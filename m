Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6426FC8303A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJOfislWfobAZiSbXMowsvRpl4WgF8OsIum/8/qbnII=; b=ftiRhTNn4nvAQp
	NOp5uZxiF7LHdB2ng3sxMauABXIOFKsKoOgmGxcDrGpMC1pXr3rdlIMN9Gg/SHI2TwVmcZ57mtmAi
	y+WidV5+o0qRicR6ZKLCMMOneMXCqVflKJ/wpeLGIKBWNkRL23EtaPeA3TbZrmg323VSe7LjE89lS
	ZEBchjtVzBvnunGeTEKpBRq6GKQyn/XcA3pWFmM0enQs5DNqAknsmrh/HeB2pQfvVHj5PlSpkBc6z
	lr1YygJYsptVcJ38gw9gwiCGuJ6trVPOKJgRS0/4POLPDWFQrwVh8XmMihQ1afZDZG6mxE1FEHGAg
	wZXkZiOVZexF7Kvf/0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbzh-00000005i4J-0gWk;
	Tue, 01 Jul 2025 14:29:57 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWacl-00000005Qi4-3yHO
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 13:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751374929; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wQkIck5POixK9EE+T2WkLOuw56coDGeHxNs8KT6qVBc=;
	b=ffcn1WdVCSMw6Ugjtsvj87UdXBT1E1tAVEfaeQD+L3CdojqOLGLJXTMIqPFCtQumdGQSio0R5UQonmJNuoh/vpedMhqS4ZgkhHUykOPkE5lr741rhTZ3ILq8w1VhIjXm6I6SXRrat81/uhqRlTn/QSP8kv3MLZTUUXvgqliP9wQ=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WgR.XGA_1751374918 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Jul 2025 21:02:04 +0800
From: cp0613@linux.alibaba.com
To: david.laight.linux@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	cp0613@linux.alibaba.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	yury.norov@gmail.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Tue,  1 Jul 2025 21:01:49 +0800
Message-ID: <20250701130149.968-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630183534.160b9823@pumpkin>
References: <20250630183534.160b9823@pumpkin>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060212_311723_66921EF5 
X-CRM114-Status: GOOD (  30.17  )
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

On Mon, 30 Jun 2025 18:35:34 +0100, david.laight.linux@gmail.com wrote:

> > On Sun, 29 Jun 2025 11:38:40 +0100, david.laight.linux@gmail.com wrote:
> > 
> > > > It can be found that the zbb optimized implementation uses fewer instructions,
> > > > even for 16-bit and 8-bit data.  
> > > 
> > > Far too many register spills to stack.
> > > I think you've forgotten to specify -O2  
> > 
> > Yes, I extracted it from the vmlinux disassembly, without compiling with -O2, and
> > I used the web tool you provided as follows:
> > ```
> > unsigned int generic_ror32(unsigned int word, unsigned int shift)
> > {
> > 	return (word >> (shift & 31)) | (word << ((-shift) & 31));
> > }
> > 
> > unsigned int zbb_opt_ror32(unsigned int word, unsigned int shift)
> > {
> > #ifdef __riscv
> > 	__asm__ volatile("nop"); // ALTERNATIVE(nop)
> > 
> > 	__asm__ volatile(
> > 		".option push\n"
> > 		".option arch,+zbb\n"
> > 		"rorw %0, %1, %2\n"
> > 		".option pop\n"
> > 		: "=r" (word) : "r" (word), "r" (shift) :);
> > #endif
> > 	return word;
> > }
> > 
> > unsigned short generic_ror16(unsigned short word, unsigned int shift)
> > {
> > 	return (word >> (shift & 15)) | (word << ((-shift) & 15));
> > }
> > 
> > unsigned short zbb_opt_ror16(unsigned short word, unsigned int shift)
> > {
> > 	unsigned int word32 = ((unsigned int)word << 16) | word;
> > #ifdef __riscv
> > 	__asm__ volatile("nop"); // ALTERNATIVE(nop)
> > 
> > 	__asm__ volatile(
> > 		".option push\n"
> > 		".option arch,+zbb\n"
> > 		"rorw %0, %1, %2\n"
> > 		".option pop\n"
> > 		: "=r" (word32) : "r" (word32), "r" (shift) :);
> > #endif
> > 	return (unsigned short)word;
> > }
> > ```
> > The disassembly obtained is:
> > ```
> > generic_ror32:
> >     andi    a1,a1,31
> 
> The compiler shouldn't be generating that mask.
> After all it knows the negated value doesn't need the same mask.
> (I'd guess the cpu just ignores the high bits of the shift - most do.)
> 
> >     negw    a5,a1
> >     sllw    a5,a0,a5
> >     srlw    a0,a0,a1
> >     or      a0,a5,a0
> >     ret
> > 
> > zbb_opt_ror32:
> >     nop
> >     rorw a0, a0, a1
> >     sext.w  a0,a0
> 
> Is that a sign extend?
> Why is it there?
> If it is related to the (broken) 'feature' of riscv-64 that 32bit results
> are sign extended, why isn't there one in the example above.
> 
> You also need to consider the code for non-zbb cpu.
> 
> >     ret
> > 
> > generic_ror16:
> >     andi    a1,a1,15
> >     negw    a5,a1
> >     andi    a5,a5,15
> >     sllw    a5,a0,a5
> >     srlw    a0,a0,a1
> >     or      a0,a0,a5
> >     slli    a0,a0,48
> >     srli    a0,a0,48
> 
> The last two instructions mask the result with 0xffff.
> If that is necessary it is missing from the zbb version below.
> 
> >     ret
> > 
> > zbb_opt_ror16:
> >     slliw   a5,a0,16
> >     addw    a5,a5,a0
> 
> At this point you can just do a 'shift right' on all cpu.
> For rol16 you can do a variable shift left and a 16 bit
> shift right on all cpu.
> If the zbb version ends up with a nop (as below) then it is
> likely to be much the same speed.
> 
> 	David
> 
> >     nop
> >     rorw a5, a5, a1
> >     ret
> > ```

Sorry, please allow me to reply in a unified way. I did not check the rationality
of the above assembly, but only used the web tool you provided before to generate
it. In fact, I think it is more in line with the actual situation to disassemble
it from vmlinux. In addition, the code is simplified here, and the complete
implementation takes into account the processor that does not support or has not
enabled zbb.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
