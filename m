Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F77BC46CD4
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 01:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNUcLMu8XZjZCgc0VxW6gjJ/bON1w6M/N0m2plv/W1g=; b=qVQd8vLKzUscRC
	mrlnLSHPJXZdKR4NmrIUp7R2RnMoR5VoJnulrzxGbQmvabURCGtxEXfn9g9Gb3S9zMBUHcpWHWQJL
	M3+T50e3JA2/aE53Xmb6yKubCtcWdxA0e9c4dEKRPguYoJ/XCpz5qpggQZONwAoLICPSwYGC8qK+q
	5TA5HByW6T3dDL0XlFxP4i+kU2Er31YB8CatKTrlZoMd4XUDHjnFb9ydmRXdBQnpVJUNI7gl+coRd
	8ReG7JbisYPRbMWIdPFByUbpzIbymU5E5MFEI67H70QIvzdVS0KWzjAvJ557SNTCybHk3F1gWxATB
	YgXJMOBLfXobQBDiZOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJNpD-001tix-2Y;
	Sat, 30 Dec 2023 01:07:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJNpB-001tiB-1B
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 01:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63FFDCE19A9;
	Sat, 30 Dec 2023 01:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC144C433C8;
	Sat, 30 Dec 2023 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703898454;
	bh=cU0VKLMAj+j170Wwq0lEPt3r30OfUZsbF/WV/7LqLjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVN2GjSxzxPQ7TJnpiaKvF8YA3n34wGfuZwwoFvdrOFkx6FCAOspb/ZIYqM0lTelr
	 hr4an9TJsCcjtPb20ma2rk81nO0U/wcSdvXhI0ilrOxY+BGoxpSCAyWVEi6HA/KF6V
	 Hzu0ux4fisiEzl2I3V2rwJ+ThOBiWH9FQd7l3q0JAyQUbJih6NtYUsXhcFd/qmRuKW
	 htC7gDKeusk7PF9Dmr2zitomsfFBLrVhisb4szJy213c3pYbFQRKM1bNdM0dRhYfhT
	 zA9Hl4msuVgG12tmLKuVyj8r4aRVNr5BlK+jVAYKcnS38oP0YwXTHhWEJZs9MmSamb
	 f1dR14WW4ZS9g==
Date: Fri, 29 Dec 2023 19:07:27 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Baoquan He <bhe@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [v9, 02/10] riscv: vector: make Vector always available for
 softirq context
Message-ID: <20231230010727.GB770@quark.localdomain>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
 <20231229143627.22898-3-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231229143627.22898-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_170737_632902_CDE3B807 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, Dec 29, 2023 at 02:36:19PM +0000, Andy Chiu wrote:
> The goal of this patch is to provide full support of Vector in kernel
> softirq context. So that some of the crypto alogrithms won't need scalar
> fallbacks.
> 
> By disabling bottom halves in active kernel-mode Vector, softirq will
> not be able to nest on top of any kernel-mode Vector. So, softirq
> context is able to use Vector whenever it runs.
> 
> After this patch, Vector context cannot start with irqs disabled.
> Otherwise local_bh_enable() may run in a wrong context.
> 
> Disabling bh is not enough for RT-kernel to prevent preeemption. So
> we must disable preemption, which also implies disabling bh on RT.
> 
> Related-to: commit 696207d4258b ("arm64/sve: Make kernel FPU protection RT friendly")
> Related-to: commit 66c3ec5a7120 ("arm64: neon: Forbid when irqs are disabled")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v8:
>  - refine comments, fix typos (Eric)
> Changelog v4:
>  - new patch since v4
> ---
>  arch/riscv/include/asm/processor.h     |  5 +++--
>  arch/riscv/include/asm/simd.h          |  6 +++++-
>  arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
>  3 files changed, 20 insertions(+), 5 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
