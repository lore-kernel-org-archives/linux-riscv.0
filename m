Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F4CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUXQRUrCu7sIWs/KtM2nBBqhm88yqnhFOiIkQpbT/Ec=; b=KXgKzHBFkgC0sr
	APSL+wlR3ZSLBVyRQFjCc2jDaKrOY5Kjod/bc2zLJm5LSX84A1mLvLSlBRt6Bp0qsGcUB1BAtewW2
	9aaTJb5blkPoBd4ix5RIKBwN7yZolFABiAu5RhOan2N9a855QNAlzsel7hbQQA+zxhQp7BaM3Zd9j
	zJRtZuzGt3RQrYoqSB2WRUcfpPTZxSANPtoyTt5QgYz4vEBO+GGFvXIsNOUrEGOLUGCSqnoiVOZ5z
	W5duKxxrtsVR9ej10W/AiTdq+1vKYCvdOe89Wj6m9R/KWwLY6AePTTc8VyVQePpFdM0jffW4B/avK
	JJwEJwGQUP8Swx7y4xvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVQd-00000006Sum-43vz;
	Wed, 10 Apr 2024 10:43:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVQa-00000006Stm-33il
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12DBBCE2729;
	Wed, 10 Apr 2024 10:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD9CC433C7;
	Wed, 10 Apr 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745818;
	bh=F2uId5jnhTOHuSWdCNV89q9EehcaDMvEPq2uWVgwVAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVOhSl2xqE/Euo0SyKzBTJJicqtADWb3WcxStLD8a3Q2j9UD8vw16QQepslDJQgzB
	 eY3sAlAL19W+yWptx+ThleiwIq79mVtO7allc9YetRZ4uuco7juVIFEGp63HtIqb22
	 fO87/EE5kjyW4WxI905mRDk06uTb8U4e9sYkFt0nAuBEVUdqAArB/VLpAkOXp105ZB
	 2v4nTxrUMGgf/7O9YthaTIYyrVc2CMlTXy5dpRQ59wMqbZ+h9WusNUzxw+WF5FhhRL
	 A0dDJiLbCLXgEeEtWcMTENsMRPHBSWQdB1hrgG3KBKx9ZsPjTiKmNsRDAAS7vbe8yW
	 7/kIvEND+BhMQ==
Date: Wed, 10 Apr 2024 18:30:13 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clocksource/drivers/timer-clint: Add option to
 use CSR instead of mtime
Message-ID: <ZhZqNbbUyPhVzekO@xhacker>
References: <20240406112159.1634-1-jszhang@kernel.org>
 <20240406112159.1634-3-jszhang@kernel.org>
 <20240409-krypton-employed-b2e0e1b46ddf@spud>
 <ZhVVPB0qD4pBna51@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhVVPB0qD4pBna51@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_034341_247595_2FC7BDF8 
X-CRM114-Status: GOOD (  37.24  )
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

On Tue, Apr 09, 2024 at 10:48:33PM +0800, Jisheng Zhang wrote:
> On Tue, Apr 09, 2024 at 03:26:18PM +0100, Conor Dooley wrote:
> > On Sat, Apr 06, 2024 at 07:21:58PM +0800, Jisheng Zhang wrote:
> > > As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer: add a
> > > quirk for lacking mtime register") of opensbi:
> > > 
> > > "T-Head developers surely have a different understanding of time CSR and
> > > CLINT's mtime register with SiFive ones, that they did not implement
> > > the mtime register at all -- as shown in openC906 source code, their
> > > time CSR value is just exposed at the top of their processor IP block
> > > and expects an external continous counter, which makes it not
> > > overrideable, and thus mtime register is not implemented, even not for
> > > reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
> > > extended CSR, these systems still rely on the mtimecmp registers to
> > > generate timer interrupts. This makes it necessary to implement T-Head
> > > C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
> > > reading mtime register and falls back to default code that reads time
> > > CSR."
> > > 
> > > To use the clint in RISCV-M NOMMU env on Milkv Duo little core, we
> > > need to fall back to read time CSR instead of mtime register. Add the
> > > option for this purpose.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > 
> > > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > > index 34faa0320ece..7bbdbf2f96a8 100644
> > > --- a/drivers/clocksource/Kconfig
> > > +++ b/drivers/clocksource/Kconfig
> > > @@ -650,6 +650,15 @@ config CLINT_TIMER
> > >  	  This option enables the CLINT timer for RISC-V systems.  The CLINT
> > >  	  driver is usually used for NoMMU RISC-V systems.
> > >  
> > > +config CLINT_USE_CSR_INSTEADOF_MTIME
> > > +	bool "Use TIME CSR instead of the mtime register"
> > > +	depends on CLINT_TIMER
> > > +	help
> > > +	  Use TIME CSR instead of mtime register. Enable this option if
> > > +	  prefer TIME CSR over MTIME register, or if the implementation
> > > +	  doesn't implement the mtime register in CLINT, so fall back on
> > > +	  TIME CSR.
> > 
> > This, as a Kconfig option, seems a bit strange to me. We know at runtime
> > if we are on a T-Head device without the mtime register and should be
> > able decide to use the CSR implementation dynamically in that case,
> > right?
> 
> Dynamically decision can be done in clocksource/clockevnt:
> I can patch clint_clocksource.read to point to different clint_rdtime()
> implementation.
> 
> But clint timer is also used in NOMMU RISCV-M's get_cycles(), this
> can't be dynamically chosen w/o an ugly "if (is_c900)"
> check, and I'm not sure whether this check in get_cycles() will
> introduce non-trival overhead or not. Or use code patching technology
> here?

Hi,

After some tests, I think will go with code patching path, I.E use
static_branch in get_cycles(). New version is under cooking.

Thanks
> 
> Or introduce a function pointer such as unsigned long (*rdtime)(void)
> for RISCV_M_MODE, then point it to different implementation?
> 
> Any suggestion is welcome.
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
