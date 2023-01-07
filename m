Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3893EC54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBmCVEfET4rEn/Cb+aSVJeWCFKrMUAarBZPXDseGCLo=; b=EcTrNPUreE/vnU
	1lzHYLe018EmcK71g4PeMT68yAFn7LfeBsfjzctTKuFOnDY2KM2gtm/Wa3SWAVbyjU28LgDLSYdB/
	NClii9Zxb2CynpAYrlZczztXZZhVa3CPWQi5hHZJqRplAp+B0fzom5waRXKb6FAIkgi0QscsMu2XG
	DC+AWIgm680KU1Dgg25gLJb+ZLrJ1oVGgGbD3ATyA1bVh0fqx4ddnK8OmKvwk3ggRAsKTrhtPuCGC
	tS7OEEUleYW2/86cmU9Rpo8v4+NtK0PqK2SngctnlBImGTyMv7z/1cRGcW5JnBVsCYSCZyTS3yBdm
	vSokc/AOrwVjoKofsWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBf5-007cK7-6W; Sat, 07 Jan 2023 16:03:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBf2-007cIz-3v; Sat, 07 Jan 2023 16:03:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C072C60684;
	Sat,  7 Jan 2023 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2920FC433D2;
	Sat,  7 Jan 2023 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673107385;
	bh=1hG2Re5Bx7ubivhRbIbvVITI44UJptNZ8stv4wtQE9s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=l2yG0NujUjGd6IAJ9nY8oZ8h8wCPANX6iws/+UQPV5e98d347cVUVCvPSx45SKYL9
	 Mi3hnDa9JKw42K/N53pLG0Npt4NRsgOyPDOt5ezN/yJO/85pcpGfc2FaVMCLaIWzUv
	 61bRk01JRJay8sAKHDz4LdodS8tpvpfImB/DftGVSUFyODz9Jj2TJg07yTY872Lom+
	 zk/zEL1AZSJdMiMEggIG/oS8yXVkSm3QG7odp8eWJXJ+72ZU8iQD5YoVRZhugEZ+cn
	 EctlV3xHNqOzBD5zj/1h0jE3hsJhxCxXnv/VvpFhphbK4mNogJNBPDhKkXZHtYu48c
	 E47ZUzKxkgwxw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BD5835C09F1; Sat,  7 Jan 2023 08:03:04 -0800 (PST)
Date: Sat, 7 Jan 2023 08:03:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH rcu 05/27] arch/riscv/kvm: Remove "select SRCU"
Message-ID: <20230107160304.GZ4028633@paulmck-ThinkPad-P17-Gen-1>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
 <20230105003813.1770367-5-paulmck@kernel.org>
 <CAAhSdy1VsT48WPQHZ5Pj5WNZRPUQvciFPF2LySawVv27tehD+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1VsT48WPQHZ5Pj5WNZRPUQvciFPF2LySawVv27tehD+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_080308_240783_0DDEC243 
X-CRM114-Status: GOOD (  18.09  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 07, 2023 at 03:28:06PM +0530, Anup Patel wrote:
> On Thu, Jan 5, 2023 at 6:08 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Now that the SRCU Kconfig option is unconditionally selected, there is
> > no longer any point in selecting it.  Therefore, remove the "select SRCU"
> > Kconfig statements.
> >
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atishp@atishpatra.org>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: <kvm@vger.kernel.org>
> > Cc: <kvm-riscv@lists.infradead.org>
> > Cc: <linux-riscv@lists.infradead.org>
> 
> For KVM RISC-V:
> Acked-by: Anup Patel <anup@brainfault.org>

Thank you, Anup!  I will apply this on my next rebase.

							Thanx, Paul

> Thanks,
> Anup
> 
> > ---
> >  arch/riscv/kvm/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> > index f36a737d5f96d..6bc9b290c1283 100644
> > --- a/arch/riscv/kvm/Kconfig
> > +++ b/arch/riscv/kvm/Kconfig
> > @@ -27,7 +27,6 @@ config KVM
> >         select KVM_XFER_TO_GUEST_WORK
> >         select HAVE_KVM_VCPU_ASYNC_IOCTL
> >         select HAVE_KVM_EVENTFD
> > -       select SRCU
> >         help
> >           Support hosting virtualized guest machines.
> >
> > --
> > 2.31.1.189.g2e36527f23
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
