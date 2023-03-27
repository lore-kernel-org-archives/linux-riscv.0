Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B371C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zu2SsXn0s3S0yTfYcoycVCRpIVmHqc27Wkrwon9wWnY=; b=DmoMmYhperqj2vhKRbnYxlj6Ai
	30wPMElNuEPUZRLvEzSUgeWvnKnGH/r7NDmtgI++Wc3jYtqgb6ZUEO9nKNF606orNVg3+F8oyXEyH
	N57olDCBpIRqGy7hK6kealdZ+YuVeOYrv++A9WL6OWFCI07xpDje0QD3HfSLYPtb3ONSDOh4AZOVT
	xO5jLocuVX9X74e9aaok3tJuBO5V1e2Lq8Irk6hwa5PJTDI1GanXYHIK+Jhn5MkTmUlqFIe6J0mX2
	TujB9s6VDg+T099zsaIWONsfS86RegK/y6MljK9x7ehOpidc5xI5zY+xs1RRNZlgoBPCkzEoKNe6d
	UCC1Zwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgl3Y-00Al3y-33;
	Mon, 27 Mar 2023 11:30:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgl3V-00Al1v-1N
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 11:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679916629; x=1711452629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UErRcQFBZcG+0EjAJbcNi3TaUC0sRPYa3gULMuFzZG8=;
  b=dnps12z3fe3FNS7plSgWeZEhuB/fyGb0eL+M8WEsKUGeHebkPC/FjcWa
   FoF/U7yyWybJnt/MyA2LsaWZoENeb+OhNjr8Y9zAZdB4ONiddFfBkPk6e
   7T83qSbexoXUyzHVhaXDNaDYP8d1sMiWwdsUyNHzW95YN+X+/qJQL3USa
   t7RMpvSpoJkRI4VPRuSdVUhMShUJQyz23S/huRkytf3mqWlTM22rnRpaO
   sT/NihJL6D8u6W9eozCxaz1k66WTk+H8tav7DueN4cK+4qCKbeoyiL3/W
   CnsD/OL7t93LLPmya5t638Wi6e9MibyofLYlZI3MNLw7TtG9Xc5upm++3
   g==;
X-IronPort-AV: E=Sophos;i="5.98,294,1673938800"; 
   d="asc'?scan'208";a="206484759"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2023 04:30:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 04:30:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Mar 2023 04:30:19 -0700
Date: Mon, 27 Mar 2023 12:41:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <heiko@sntech.de>,
	<jszhang@kernel.org>, <lazyparser@gmail.com>, <falcon@tinylab.org>,
	<chenhuacai@kernel.org>, <apatel@ventanamicro.com>, <atishp@atishpatra.org>,
	<mark.rutland@arm.com>, <bjorn@kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V11 1/3] riscv: stack: Support
 HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <f170c68c-4975-4f71-ac50-979483cb5848@spud>
References: <20230324071239.151677-1-guoren@kernel.org>
 <20230324071239.151677-2-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230324071239.151677-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_043029_471223_12C9BC0B 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Type: multipart/mixed; boundary="===============8860764452454135533=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8860764452454135533==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0KuVzuYzOpMI9LxQ"
Content-Disposition: inline

--0KuVzuYzOpMI9LxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 03:12:37AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> Add independent irq stacks for percpu to prevent kernel stack overflows.
> It is also compatible with VMAP_STACK by implementing
> arch_alloc_vmap_stack.  Many architectures have supported
> HAVE_IRQ_EXIT_ON_IRQ_STACK, riscv should follow up.
>=20
> Tested-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -9,6 +9,37 @@
>  #include <linux/irqchip.h>
>  #include <linux/seq_file.h>
>  #include <asm/smp.h>
> +#include <asm/vmap_stack.h>
> +
> +#ifdef CONFIG_IRQ_STACKS
> +DEFINE_PER_CPU(ulong *, irq_stack_ptr);

btw, sparse is complaining about this variable:
=2E./arch/riscv/kernel/irq.c:15:1: warning: symbol '__pcpu_scope_irq_stack_=
ptr' was not declared. Should it be static?

I'm not immediately sure why that is the case, but should be
reproducible with gcc-12 allmodconfig.

Thanks,
Conor.

> +
> +#ifdef CONFIG_VMAP_STACK
> +static void init_irq_stacks(void)
> +{
> +	int cpu;
> +	ulong *p;
> +
> +	for_each_possible_cpu(cpu) {
> +		p =3D arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
> +		per_cpu(irq_stack_ptr, cpu) =3D p;
> +	}
> +}
> +#else
> +/* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE align=
ed. */
> +DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
> +
> +static void init_irq_stacks(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		per_cpu(irq_stack_ptr, cpu) =3D per_cpu(irq_stack, cpu);
> +}
> +#endif /* CONFIG_VMAP_STACK */
> +#else
> +static void init_irq_stacks(void) {}
> +#endif /* CONFIG_IRQ_STACKS */
> =20
>  int arch_show_interrupts(struct seq_file *p, int prec)
>  {
> @@ -18,6 +49,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
> =20
>  void __init init_IRQ(void)
>  {
> +	init_irq_stacks();
>  	irqchip_init();
>  	if (!handle_arch_irq)
>  		panic("No interrupt controller found.");
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1f4e37be7eb3..b69933ab6bf8 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -305,16 +305,50 @@ asmlinkage __visible noinstr void do_page_fault(str=
uct pt_regs *regs)
>  }
>  #endif
> =20
> -asmlinkage __visible noinstr void do_irq(struct pt_regs *regs)
> +static void noinstr handle_riscv_irq(struct pt_regs *regs)
>  {
>  	struct pt_regs *old_regs;
> -	irqentry_state_t state =3D irqentry_enter(regs);
> =20
>  	irq_enter_rcu();
>  	old_regs =3D set_irq_regs(regs);
>  	handle_arch_irq(regs);
>  	set_irq_regs(old_regs);
>  	irq_exit_rcu();
> +}
> +
> +#ifdef CONFIG_IRQ_STACKS
> +DECLARE_PER_CPU(ulong *, irq_stack_ptr);
> +#endif
> +
> +asmlinkage void noinstr do_irq(struct pt_regs *regs)
> +{
> +	irqentry_state_t state =3D irqentry_enter(regs);
> +#ifdef CONFIG_IRQ_STACKS
> +	if (on_thread_stack()) {
> +		ulong *sp =3D per_cpu(irq_stack_ptr, smp_processor_id())
> +					+ IRQ_STACK_SIZE/sizeof(ulong);
> +		__asm__ __volatile(
> +		"addi	sp, sp, -"RISCV_SZPTR  "\n"
> +		REG_S"  ra, (sp)		\n"
> +		"addi	sp, sp, -"RISCV_SZPTR  "\n"
> +		REG_S"  s0, (sp)		\n"
> +		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
> +		"move	sp, %[sp]		\n"
> +		"move	a0, %[regs]		\n"
> +		"call	handle_riscv_irq	\n"
> +		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
> +		REG_L"  s0, (sp)		\n"
> +		"addi	sp, sp, "RISCV_SZPTR   "\n"
> +		REG_L"  ra, (sp)		\n"
> +		"addi	sp, sp, "RISCV_SZPTR   "\n"
> +		:
> +		: [sp] "r" (sp), [regs] "r" (regs)
> +		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
> +		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
> +		  "memory");
> +	} else
> +#endif
> +		handle_riscv_irq(regs);
> =20
>  	irqentry_exit(regs, state);
>  }
> --=20
> 2.36.1
>=20
>=20

--0KuVzuYzOpMI9LxQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCGA8AAKCRB4tDGHoIJi
0j9/AQDtMWZnc3AMU2BAbos8sn2KzBZybbo+x9+gamWiNR925gD+I1kkh4/+2zTb
N9qngt9L4KlU3HhD65F92dkYTNrQCAk=
=5VJS
-----END PGP SIGNATURE-----

--0KuVzuYzOpMI9LxQ--


--===============8860764452454135533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8860764452454135533==--

