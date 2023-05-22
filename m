Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA1DC7EE30
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oldEcrvvKoi3XxV+UIAOcyqHmC/9e7UVzJPhAXtnU4k=; b=nfUCN64DOt0JNJjo4Oiq7UFAlO
	hLFPAENs4A+ZarxP5Edh++r0eE1AFGUASpbfV5aagOH6T4n2xQPzo760cZ7rxsEWOICTUYNsR+epC
	liS/OMyWaYyXrStb98lfkOiTkcCsE2PomNrdBxXpRPnwXuzeO0MC+SecClLwH8Plc9DlzEfN4Y+pR
	5D2k7HKkyTedKykWjKKGXHwDZRbNQRVZ7q9TQaVIaAUflMv6JXEexrOMQUSb2LdH+SW5qGRszMJLy
	e1iKHpkQ7eWOFcWlIeviXHm7qMMdRLqDR67EEl3KPtXBYlZRMLHUf+BjgSqLGPMR99Knvjq4Gp1eo
	f7ghb7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1BTh-007o7T-1t;
	Mon, 22 May 2023 19:45:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1BTd-007o6B-2R;
	Mon, 22 May 2023 19:45:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0318B62A8F;
	Mon, 22 May 2023 19:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426CC433D2;
	Mon, 22 May 2023 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684784752;
	bh=hjg+nEkGnT5wX4cHznoLQRDdNnOeCH9yJ5NNOV5v5V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hA34ih2YynFmHhjBrG8aSg5C3lBqNWxO+7zUy6BcX+aQ+XsHNhgCm4xunK35wUfDJ
	 04AL6sb9/gUSPWXOZMaAq5Y7JIXyvMtkGkZMTG9vTCt4A8+skUC7ElqxtgBp2x2krK
	 KXPIKvhskol6TlkDwgxlGGlJ5y2FCniz+hQ98V0mD9bUkw4wvKfKbmP/xvUTM9q8Ve
	 fONIqzl3Sgg70s+V3M83exiIb/68r7UKMiD+x7d50jdm3a/1eRP+3d2dz9MSWt954u
	 vNN+OVP0DZVxqN+BeDQuT8WJBBnv0iFmhuwNmLFk5+EAJ8WntO0QmIY8JmuCh+aiqH
	 WbAh9K2p4Y8cA==
Date: Mon, 22 May 2023 20:45:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
Message-ID: <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230512205257.240231377@linutronix.de>
X-Cookie: Even bytes get lonely for a little bit.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_124553_904270_AD976552 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Type: multipart/mixed; boundary="===============6486573486532454526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6486573486532454526==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxuSzC5SBKt722Ku"
Content-Disposition: inline


--nxuSzC5SBKt722Ku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 11:07:50PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>=20
> There is often significant latency in the early stages of CPU bringup, and
> time is wasted by waking each CPU (e.g. with SIPI/INIT/INIT on x86) and
> then waiting for it to respond before moving on to the next.
>=20
> Allow a platform to enable parallel setup which brings all to be onlined
> CPUs up to the CPUHP_BP_KICK_AP state. While this state advancement on the
> control CPU (BP) is single-threaded the important part is the last state
> CPUHP_BP_KICK_AP which wakes the to be onlined CPUs up.

We're seeing a regression on ThunderX2 systems with 256 CPUs with an
arm64 defconfig running -next which I've bisected to this patch.  Before
this commit we bring up 256 CPUs:

[   29.137225] GICv3: CPU254: found redistributor 11e03 region 1:0x00000004=
41f60000
[   29.137238] GICv3: CPU254: using allocated LPI pending table @0x00000008=
818e0000
[   29.137305] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
[   29.292421] Detected PIPT I-cache on CPU255
[   29.292635] GICv3: CPU255: found redistributor 11f03 region 1:0x00000004=
41fe0000
[   29.292648] GICv3: CPU255: using allocated LPI pending table @0x00000008=
818f0000
[   29.292715] CPU255: Booted secondary processor 0x0000011f03 [0x431f0af1]
[   29.292859] smp: Brought up 2 nodes, 256 CPUs
[   29.292864] SMP: Total of 256 processors activated.

but after we only bring up 255, missing the 256th:

[   29.165888] GICv3: CPU254: found redistributor 11e03 region 1:0x00000004=
41f60000
[   29.165901] GICv3: CPU254: using allocated LPI pending table @0x00000008=
818e0000
[   29.165968] CPU254: Booted secondary processor 0x0000011e03 [0x431f0af1]
[   29.166120] smp: Brought up 2 nodes, 255 CPUs
[   29.166125] SMP: Total of 255 processors activated.

I can't immediately see an issue with the patch itself, for systems
without CONFIG_HOTPLUG_PARALLEL=3Dy it should replace the loop over
cpu_present_mask done by for_each_present_cpu() with an open coded one.
I didn't check the rest of the series yet.

The KernelCI bisection bot also isolated an issue on Odroid XU3 (a 32
bit arm system) with the final CPU of the 8 on the system not coming up
to the same patch:

  https://groups.io/g/kernelci-results/message/42480?p=3D%2C%2C%2C20%2C0%2C=
0%2C0%3A%3Acreated%2C0%2Call-cpus%2C20%2C2%2C0%2C99054444

Other boards I've checked (including some with multiple CPU clusters)
seem to be bringing up all their CPUs so it doesn't seem to just be
general breakage.

Log from my bisect:

git bisect start
# bad: [9f258af06b6268be8e960f63c3f66e88bdbbbdb0] Add linux-next specific f=
iles for 20230522
git bisect bad 9f258af06b6268be8e960f63c3f66e88bdbbbdb0
# good: [44c026a73be8038f03dbdeef028b642880cf1511] Linux 6.4-rc3
git bisect good 44c026a73be8038f03dbdeef028b642880cf1511
# good: [914db90ee0172753ab5298a48c63ac4f1fe089cf] Merge branch 'for-linux-=
next' of git://anongit.freedesktop.org/drm/drm-misc
git bisect good 914db90ee0172753ab5298a48c63ac4f1fe089cf
# good: [4624865b65777295cbe97cf1b98e6e49d81119d3] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git bisect good 4624865b65777295cbe97cf1b98e6e49d81119d3
# bad: [be7220c44fbc06825f7f122d06051630e1bf51e4] Merge branch 'for-next' o=
f git://github.com/cminyard/linux-ipmi.git
git bisect bad be7220c44fbc06825f7f122d06051630e1bf51e4
# good: [cc677f7bec0da862a93d176524cdad5f416d58ef] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
git bisect good cc677f7bec0da862a93d176524cdad5f416d58ef
# bad: [cdcc744aee1b886cbe4737798c0b8178b9ba5ae5] next-20230518/rcu
git bisect bad cdcc744aee1b886cbe4737798c0b8178b9ba5ae5
# bad: [8397dce1586a35af63fe9ea3e8fb3344758e55b5] Merge branch into tip/mas=
ter: 'x86/mm'
git bisect bad 8397dce1586a35af63fe9ea3e8fb3344758e55b5
# bad: [0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6] x86/smpboot/64: Implement=
 arch_cpuhp_init_parallel_bringup() and enable it
git bisect bad 0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
# good: [ab24eb9abb9c60c45119370731735b79ed79f36c] x86/xen/hvm: Get rid of =
DEAD_FROZEN handling
git bisect good ab24eb9abb9c60c45119370731735b79ed79f36c
# good: [72b11aa7f8f93449141544cecb21b2963416902d] riscv: Switch to hotplug=
 core state synchronization
git bisect good 72b11aa7f8f93449141544cecb21b2963416902d
# good: [f54d4434c281f38b975d58de47adeca671beff4f] x86/apic: Provide cpu_pr=
imary_thread mask
git bisect good f54d4434c281f38b975d58de47adeca671beff4f
# bad: [bea629d57d006733d155bdb65ba4867788da69b6] x86/apic: Save the APIC v=
irtual base address
git bisect bad bea629d57d006733d155bdb65ba4867788da69b6
# bad: [18415f33e2ac4ab382cbca8b5ff82a9036b5bd49] cpu/hotplug: Allow "paral=
lel" bringup up to CPUHP_BP_KICK_AP_STATE
git bisect bad 18415f33e2ac4ab382cbca8b5ff82a9036b5bd49
# first bad commit: [18415f33e2ac4ab382cbca8b5ff82a9036b5bd49] cpu/hotplug:=
 Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE

--nxuSzC5SBKt722Ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRrxmQACgkQJNaLcl1U
h9CiKAf8DZMz9GmmJSE2csjdGdRu7caRKW0Tt5rUN3Rk8slC+Fb2FYWsc6BSJXU7
bN4/F3Oie4ukVf5oamB42/30Iemh8OdOE3aC/ceb9n2OmF9rKnQHIrC8q2xZo5S/
jZDRUq5Y91IMU6dsMy8Teoctmt4UCyXbSm6r5hA2hfepTZnZ0MszdpwdkfKTtb2h
nXXb54WH18u/i1vmPWTNpfHfTXXhKPSkRJ4NcJWt6NaRINld+kJBqdU1usQBnxG3
mn4C2p3YYPtd0fv66x2tPLxbXyjmGYv0/fsSg1INqS0A8Jq/piohEK9rqAeBi6BD
BEFqLrxN7XtuQjD2ksUH5UcvrDWwVw==
=FllZ
-----END PGP SIGNATURE-----

--nxuSzC5SBKt722Ku--


--===============6486573486532454526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6486573486532454526==--

