Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E953C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2XjefIVytqxWGlwEJ1xbrTvy3D95pZDleHpLa2DBJQ=; b=kWWkQfH13DFGmJ8+/pNFVuAf57
	Ox4fUgO5K5Ov1QzGFeSQTKslgCsc4dy6idWnFoRHSL99rGIbsdtn7E9IbXwxzxD9MikUYWxQdmAhc
	hQzrRJyLC5fqh9HHk0s4bh4jnLAbBVUaVrhqBhf3avbPI1MNykHT/JLLnmHmCDM234b+vlhuSY3Hy
	LGXsqBku/xkMpPCZyoX8VkpFjMYp5KtItCg89CuyXUfLH1XpeSSEUsCrvpB5357Kny+WDo9M1xbWi
	l6qwd9ai1hmF/v53kS7RyqzeARKB0TQ7Rl592Nkw7RCmuFnNl+mmS+OkeKXTpXkh3x1QmDwd9wEaR
	6KPvF3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZT3f-00GnjX-2m; Tue, 07 Mar 2023 08:52:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZT3a-00Gnia-FG
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 08:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678179146; x=1709715146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GBiPeesd8xFReVcLee1l9cVo8XbRI4la4GvpsLYlT8=;
  b=18lTrpLVqe6dVMtfe1mJtfGpHreEs2B2Rr8BpZL7fO5PdeUG34WL+PDx
   LYiEQ/MfYCEvQgD20efOZ/q9iEAGnWQeCrFFiihKcYb0ZX/QLpu/8A6e0
   J//jqFHxXIs0Z/hT6VeAY08fa3T1LTve8hKhSUDNK03b86ZtLp+P603Ng
   J+WXQ4CGagOkrTGzFDe2ZoiYivgAAqTnUxlDgTqOiC6cm3mBsL5SUnWxE
   qEFc1X0mASCS66j6wx+pMvVWRV/vMWDxXc1VXEF6qLmR0ITrh70q2p7og
   pj5xd1d9+QrZ7WU/z7BWLg5KFDguxudGFFMxuhVbzwJAVWztNp02tN0/k
   A==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="asc'?scan'208";a="204037593"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 01:52:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 01:52:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 01:52:17 -0700
Date: Tue, 7 Mar 2023 08:51:49 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <ZAb7JVghuiwZF1Q5@wendy>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_005226_663226_9B8776A4 
X-CRM114-Status: GOOD (  28.71  )
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
Content-Type: multipart/mixed; boundary="===============7874315602955580515=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7874315602955580515==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BPAAyqVe2vfLu2rd"
Content-Disposition: inline

--BPAAyqVe2vfLu2rd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 04:36:41PM +0800, Hal Feng wrote:
> On Tue, 21 Feb 2023 10:46:26 +0800, Hal Feng wrote:
> > This patch series adds basic clock, reset & DT support for StarFive
> > JH7110 SoC. Patch 17 depends on series [1] which provides pinctrl
> > dt-bindings. Patch 19 depends on series [2] which provides dt-bindings
> > of VisionFive 2 board and JH7110 SoC.
> >=20
> > You can simply review or test the patches at the link [3].
> >=20
> > [1]: https://lore.kernel.org/all/20230209143702.44408-1-hal.feng@starfi=
vetech.com/
> > [2]: https://lore.kernel.org/all/20230216131511.3327943-1-conor.dooley@=
microchip.com/
> > [3]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
>=20
> Hi Conor,
>=20
> When I tried to rebase these patches on v6.3-rc1, I found the kernel
> would crash on the VisionFive 2 board during startup. The logs are as
> below. I checkout the branch to the mainline and found that the kernel
> would also crash on the VisionFive board which is equipped with JH7100
> SoC.
>=20
> --------------------------------
> Unable to handle kernel paging request at virtual address 0000004cccccccd4
> Oops [#1]
> Modules linked in:
> CPU: 3 PID: 87 Comm: udevd Not tainted 6.3.0-rc1-00019-g239e7809f291 #305
> Hardware name: StarFive VisionFive 2 v1.3B (DT)
> epc : enqueue_timer+0x18/0x90
>  ra : internal_add_timer+0x2c/0x38
> epc : ffffffff8006a714 ra : ffffffff8006a7b8 sp : ffffffc80443bc80
>  gp : ffffffff80eb5100 tp : ffffffd8c01db200 t0 : 0000000000000000
>  t1 : 000000000000000f t2 : 0000000038b3ea28 s0 : ffffffc80443bcb0
>  s1 : ffffffff80813940 a0 : ffffffff80813940 a1 : ffffffc80443bd48
>  a2 : 000000000000020b a3 : cccccccd0b000000 a4 : cccccccccccccccc
>  a5 : 000000000000020b a6 : ffffffff80814a08 a7 : 0000000000000001
>  s2 : ffffffc80443bd48 s3 : 0000000008400040 s4 : ffffffff80813940
>  s5 : ffffffff80eea0b8 s6 : ffffffff80eb7220 s7 : 0000000000000040
>  s8 : ffffffff80eb61e0 s9 : 0000002ac84a2548 s10: 0000002ad53e92c0
>  s11: 0000000000000001 t3 : 000000000000003f t4 : 0000000000000000
>  t5 : 0000000000000004 t6 : 0000000000000003
> status: 0000000200000100 badaddr: 0000004cccccccd4 cause: 000000000000000f
> [<ffffffff8006a714>] enqueue_timer+0x18/0x90
> [<ffffffff8006aa64>] add_timer_on+0xf0/0x134
> [<ffffffff80500f18>] try_to_generate_entropy+0x1ec/0x232
> [<ffffffff8035a636>] urandom_read_iter+0x42/0xc2
> [<ffffffff800fff16>] vfs_read+0x17c/0x1e4
> [<ffffffff801005b6>] ksys_read+0x78/0x98
> [<ffffffff801005e4>] sys_read+0xe/0x16
> [<ffffffff800035dc>] ret_from_syscall+0x0/0x2
> Code: 9381 9713 0037 0813 0705 983a 3703 0008 e198 c311 (e70c) d713=20
> ---[ end trace 0000000000000000 ]---
> note: udevd[87] exited with irqs disabled
> Segmentation fault
> FAIL
> Saving random seed:=20
> rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> rcu: 	1-...0: (0 ticks this GP) idle=3D19c4/1/0x4000000000000000 softirq=
=3D42/42 fqs=3D7474
> rcu: 	(detected by 2, t=3D15005 jiffies, g=3D-195, q=3D35 ncpus=3D4)
> Task dump for CPU 1:
> task:dd              state:R  running task     stack:0     pid:92    ppid=
:88     flags:0x00000008
> Call Trace:
> [<ffffffff80003764>] ret_from_fork+0x0/0xc
> rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> rcu: 	1-...0: (0 ticks this GP) idle=3D19c4/1/0x4000000000000000 softirq=
=3D42/42 fqs=3D29814
> rcu: 	(detected by 2, t=3D60018 jiffies, g=3D-195, q=3D35 ncpus=3D4)
> Task dump for CPU 1:
> task:dd              state:R  running task     stack:0     pid:92    ppid=
:88     flags:0x00000008
> Call Trace:
> [<ffffffff80003764>] ret_from_fork+0x0/0xc
> ...
> --------------------------------
>=20
> I used 'git bisect' and found out the commit 9493e6f3ce02 is the
> cause. I tried to revert this commit on the tag v6.3-rc1, but it
> seems there is no improvement.

Hmm, I'm not entirely sure that that is a good bisect.
This is a fix for my stupidity in the commit you mention:
https://lore.kernel.org/linux-riscv/20230302174154.970746-1-conor@kernel.or=
g/

But the main backtrace there is not from that patch at all, I think it
is Linus' fault.
The HEAD of Linus' tree is currently 8ca09d5fa3549 ("cpumask: fix
incorrect cpumask scanning result checks") should be a fix for the
backtrace that you are seeing above.

> Any options I am missing? Could you please give me some suggestions
> to adapt to the new changes between 6.2 and 6.3? Thank you in
> advance.

LMK if the above two things don't fix it for you & I'll go digging
tonight.

Cheers,
Conor.

--BPAAyqVe2vfLu2rd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAb7FQAKCRB4tDGHoIJi
0qVTAPsHSMwYMcrmOSnP3im30f+2vZGSFqHJchJxrpjd09D3+AD/W49wo6JYEE0K
54n79wuFUj4pxEaLUIJptbE2s62iGQU=
=7ad+
-----END PGP SIGNATURE-----

--BPAAyqVe2vfLu2rd--


--===============7874315602955580515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7874315602955580515==--

