Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YtOsRu1/u8KVcn4M0JpCjgQF0MwjfTMa/Mmc4CM1q0=; b=kaYnYOe08MvThOCzc3NFFahoL+
	32EGBFTRm1cxHLJjEftGbEAW5sgXI6V/bzxLqpNiucyf/L1nVJvQdLzYl7p0NJmw9Al3JXkLQ6Ypr
	Sp5TjJvr+XK9i5X5u2HuFOfpLlH1xTH4U9KGZVyAbb651mRxc0pLBPoFXv1GxDb2+QFy4WoUPxWF2
	TUQ2COr+GjjgrtlnPw2AMj8bvw9aD2/GYBAMzlF3J9tDZuip7VgzC6OItdpibDivd861crQ4216TC
	rDom2HADqXBZqEaSpe8g/U91a9Z/vvxxITKcLR6P1W4xCnVjndP3LT08oDnXdUDzZeaVQrQC3E/9x
	Rf96GsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypJh-00AxRY-26;
	Fri, 03 Nov 2023 08:14:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypJe-00AxQR-30
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 08:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A77361538;
	Fri,  3 Nov 2023 08:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F743C433C7;
	Fri,  3 Nov 2023 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698999245;
	bh=nZoY4bMLCYDxTyK2kGGthjrRGJQ7ih0zGaRw6Ha2jY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTQGVIoQSa1OQFcHut1dTypptxTXglwwzRGntS3HpvCiNRm1oa71yOe9R0pqxRNBw
	 7YJFAVNWc8QcEst3M2StGYf3xT0VfmVIr7bvmZvUU0WA+P93V9TqPT2yDlhZlfaQ02
	 Q1WVFd8IDTDiZiKjCIFQG5Dm98AuoB/PJuvExRkeV6Ja4yQtdQDr4QVqRtWxXhOfQL
	 Tk9ApNxCWR7OzDwSV6FiWeXcWxRTX3rB2lcB/DtXZwD+eFT/ouicFsQhBeEXq7Y01E
	 ogEm1cRZUZOG6/O5oAaibm5uzIhwGMgI+PbABtKnF0NS/UTzixuCez2sBoAged0yOy
	 trmIa2dCbUAbQ==
Date: Fri, 3 Nov 2023 08:14:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231103-army-gloater-af710df04628@spud>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231102155423.SyuAibSe@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_011407_075060_6DED5A75 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: multipart/mixed; boundary="===============0466370968457169311=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0466370968457169311==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Knt985PP7pqW90Gd"
Content-Disposition: inline


--Knt985PP7pqW90Gd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 04:54:23PM +0100, Sebastian Andrzej Siewior wrote:
> On 2023-11-02 12:31:15 [+0000], Conor Dooley wrote:
> > [    1.130384] BUG: sleeping function called from invalid context at ke=
rnel/locking/spinlock_rt.c:48
> > [    1.130418]
> > [    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0=
, name: swapper/1
> > [    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
> > [    1.130978]   alloc_workqueue+0x96/0x6de
> > [    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
> > [    1.131010]   kmem_cache_init_late+0x1c/0x36
> > [    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+=
0x12/0x1a
> > [    1.131046]   start_kernel+0x204/0x7e6
> > [    1.131082] irq event stamp: 822
> > [    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1=
de/0x790
> > [    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] de=
fault_idle_call+0xfa/0x152
> > [    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_in=
terrupt+0xe/0x1a
> > [    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do=
_irq+0x16/0xa6
>=20
> Without the patch check_unaligned_access_boot_cpu() ->
> check_unaligned_access() is okay. The SMP/IPI variant (the patch imho)
> is bad. There must be no memory allocation from IRQ-off region - the
> smp-function call in this case.
>=20
> Would it be okay if I delay it until this solved? If you have something,
> then I could apply the two patches plus the fixup for this.

I'm don't think that problems are restricted to a tree containing Evan's
patch for parallel checks. For example:

[    0.057684] rcu: Hierarchical SRCU implementation.
[    0.057708] rcu:     Max phase no-delay instances is 1000.
[    0.100085] EFI services will not be available.
[    0.102978] smp: Bringing up secondary CPUs ...
[    0.112532] BUG: sleeping function called from invalid context at kernel=
/locking/spinlock_rt.c:48
[    0.112580] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, na=
me: swapper/1
[    0.112597] preempt_count: 1, expected: 0
[    0.112617] RCU nest depth: 1, expected: 1
[    0.112660] 3 locks held by swapper/1/0:
[    0.112679]  #0: ff60000ffef8b958 (&pcp->lock){+.+.}-{2:2}, at: get_page=
_from_freelist+0x338/0x143e
[    0.113123]  #1: ffffffff81aa6920 (rcu_read_lock){....}-{1:2}, at: rcu_l=
ock_acquire+0x0/0x32
[    0.113187]  #2: ffffffff81c42cf8 (&zone->lock){+.+.}-{2:2}, at: __rmque=
ue_pcplist+0x12a/0xbc0
[    0.113268] irq event stamp: 0
[    0.113281] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.113349] hardirqs last disabled at (0): [<ffffffff8001536a>] copy_pro=
cess+0x53a/0xdec
[    0.113368] softirqs last  enabled at (0): [<ffffffff80015378>] copy_pro=
cess+0x548/0xdec
[    0.113384] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.113497] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc6-rt10-001=
11-g399ad8863993-dirty #1
[    0.113570] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.113641] Call Trace:
[    0.113705] [<ffffffff80006f76>] show_stack+0x2c/0x3c
[    0.113723] [<ffffffff80bd4ba4>] dump_stack_lvl+0x5e/0x84
[    0.113738] [<ffffffff80bd4bde>] dump_stack+0x14/0x1c
[    0.113751] [<ffffffff8005b9c0>] __might_resched+0x1b4/0x1c2
[    0.113764] [<ffffffff80bdfd3e>] rt_spin_lock+0x42/0xdc
[    0.113779] [<ffffffff8026717a>] __rmqueue_pcplist+0x12a/0xbc0
[    0.113792] [<ffffffff80268148>] get_page_from_freelist+0x37a/0x143e
[    0.113805] [<ffffffff80267cbc>] __alloc_pages+0xac/0x1be
[    0.113816] [<ffffffff80004128>] check_unaligned_access+0x32/0x332
[    0.113827] [<ffffffff80009b16>] smp_callin+0x42/0x6c
[    0.138406] cpu1: Ratio of byte access time to unaligned word access is =
4.00, unaligned accesses are fast
[    0.180249] cpu2: Ratio of byte access time to unaligned word access is =
4.50, unaligned accesses are fast
[    0.213500] cpu3: Ratio of byte access time to unaligned word access is =
4.00, unaligned accesses are fast
[    0.214860] smp: Brought up 1 node, 4 CPUs

(this is qemu, hence the fast unaligned access, despite OpenSBI
emulating them)

--Knt985PP7pqW90Gd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUSryQAKCRB4tDGHoIJi
0rgTAQDfxYNXGZeadKKQ4678o1+39pQY46M49ivGHsRWvCDengEAlIhe14wOLPff
v4lGEGRMFQ/4GKRf09jHHGx714inDQA=
=Ht6q
-----END PGP SIGNATURE-----

--Knt985PP7pqW90Gd--


--===============0466370968457169311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0466370968457169311==--

