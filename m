Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F7DCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 04:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJVVIlPhOAoccpSV5wmcwju2ZMbYf7vIVWZ74BKZ+p0=; b=EuCB45jOLLm7Dl
	ZD0GflwE6f7u24RuGX93gJ0/LXUxCLKDFjnth/WPSPt7snC1PxuMSg5SBgZ0ecXmwviCg9P0g6iXK
	FSqfZwsZfBidI5EE7hJw5CJ/w/lKuQRQ8dztrTDuW+0jLMz4TYq5xUFaO2JeQML68g0eonYOHKCL5
	m/Kvf3oCPzHIZ49BF7QdM2IU74CBv+bGOqxr9WMOSnY82dwWOmGKzqrSIUw4ZUwk7jX0Lu9cSuKaf
	3boiHV6C29d2BLDdLY0smu76F+Ym53KRDFAGldkmYOgt4Wsr6M8Z/0jvFOF9mtzn41K4wKfgxh7h4
	I4AKgdUIi/XWHTejSjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjMb-0000000A8As-2k9c;
	Wed, 17 Sep 2025 04:01:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjMZ-0000000A8AT-3gkm
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 04:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E86E60147;
	Wed, 17 Sep 2025 04:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC4DC4CEF0;
	Wed, 17 Sep 2025 04:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758081707;
	bh=J2NSNg0Gqtw2lyDsZpuPoODIxHZStkLFai9r0M2FN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=go2jnzERdw7VxOgNIZrgWGBzeruCsK1AW9ZSyKThP7yqY3WQ/69loAHqO8ZwY+Pz5
	 RmSNEASnzlmaE1l34EObx8PbsjpMZfAnTVeHmFY8ssJ+xda/ALlcDI+jAk1Vyd2i2s
	 mO9FCoCVFwEvw/QBtU/dW+mWNXtAqYbjXItUg+7PZO7tQOMI4OniGKelNX4jGXk45b
	 MacxQjgECMv/fvFL65VzgGkfPyUkl9GVWigT2Hozs0VT5GGhcE9uquyP7/lY1QKwCA
	 AYoi5W0JlbnQWyM/gmWT+o/bjulyMJ3+cqqk6tLCqpWcmJMtgxjR6YUN/oCZV9sHom
	 m9Y9l9Vt4iqPw==
Date: Wed, 17 Sep 2025 00:01:34 -0400
From: Guo Ren <guoren@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
	brs@rivosinc.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
Message-ID: <aMoyntAydNMtcl+3@gmail.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLciY2putG8g2P9F@andrea>
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

On Tue, Sep 02, 2025 at 06:59:15PM +0200, Andrea Parri wrote:
> > Xu Lu (4):
> >   riscv: add ISA extension parsing for Zalasr
> >   dt-bindings: riscv: Add Zalasr ISA extension description
> >   riscv: Instroduce Zalasr instructions
> >   riscv: Use Zalasr for smp_load_acquire/smp_store_release
> 
> Informally put, our (Linux) memory consistency model specifies that any
> sequence
> 
>   spin_unlock(s);
>   spin_lock(t);
> 
> behaves "as it provides at least FENCE.TSO ordering between operations
> which precede the UNLOCK+LOCK sequence and operations which follow the
> sequence".  Unless I missing something, the patch set in question breaks
> such ordering property (on RISC-V): for example, a "release" annotation,
> .RL (as in spin_unlock() -> smp_store_release(), after patch #4) paired
> with an "acquire" fence, FENCE R,RW (as could be found in spin_lock() ->
> atomic_try_cmpxchg_acquire()) do not provide the specified property.
> 
> I _think some solutions to the issue above include:
> 
>  a) make sure an .RL annotation is always paired with an .AQ annotation
>     and viceversa an .AQ annotation is paired with an .RL annotation
>     (this approach matches the current arm64 approach/implementation);
> 
>  b) on the opposite direction, always pair FENCE R,RW (or occasionally
>     FENCE R,R) with FENCE RW,W (this matches the current approach/the
>     current implementation within riscv);
> 
>  c) mix the previous two solutions (resp., annotations and fences), but
>     make sure to "upgrade" any releases to provide (insert) a FENCE.TSO.
I prefer option c) at first, it has fewer modification and influence.

asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
-			  SB_RL(%0, %1) "\t\nnop\t\n",		\
+			  SB_RL(%0, %1) "\t\n fence.tso;\t\n",	\
			  0, RISCV_ISA_EXT_ZALASR, 1)		\
			  : : "r" (v), "r" (p) : "memory");	\

I didn't object option a), and I think it could be done in the future.
Acquire Zalasr extension step by step.

> 
> (a) would align RISC-V and ARM64 (which is a good thing IMO), though it
> is probably the most invasive approach among the three approaches above
> (requiring certain changes to arch/riscv/include/asm/{cmpxchg,atomic}.h,
> which are already relatively messy due to the various ZABHA plus ZACAS
> switches).  Overall, I'm not too exited at the idea of reviewing any of
> those changes, but if the community opts for it, I'll almost definitely
> take a closer look with due calm.  ;-)
> 
>   Andrea
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
