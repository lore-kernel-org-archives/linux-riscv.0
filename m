Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD0C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4MIBMjuQsSp6rWykKV/72qMb0KXrW1qRjv/Z3sswP4=; b=QFILu8XyY5p59zhii1Fs4weda2
	3fff7mlkFnpxcvk0H96n8fDijJNODbN0f9QS0pm3oK5dYJEr9YdDhKV+FElkAt4tskJO0wi5NyyMN
	oR1+XmRDuBCeQaSpUQ5t6vyk2yvqXbZBzxmekqrqgiD7BQVdcM1I4LxR3EtMhfmIweulaYRW3hjsE
	lt7/WAleJBlgle6RUdYqK7hOrl7MGb/SunswttMdibOCnDiGHlYULrMDL9PwDM1gGnE0OzIAcvXO1
	phOHCxWFT/WMAjCD7QE18H5wfHkACh1pzoriGWgr/hoPAyxoBfFwwMj8U18YZlX6tskjxTwW+xL2u
	9f5YF8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBD6f-00Ck4o-1o;
	Thu, 07 Dec 2023 12:03:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBD6b-00Ck43-0l;
	Thu, 07 Dec 2023 12:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701950628; x=1733486628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QHph2jlhsuMMkRmcQ6lH7gsnSScz85me+sSeNsH10GU=;
  b=oKa90xgjJiUeVAiADMTaA8mlNbpmTw1a7X1D1ABiGNNQS1FBNFUJYwVQ
   sIEk5ulkjdUKT6+2Rnq+a8Bo2bXPMHBWCDyMjoY1mZ2mE8c5EOdWKtY3r
   4QbFb+vuSCvUN7vO19VF0yblEYE2ceOaG2i1F/oXf9KFB8ZQWGinOlhpW
   QBkSuI3I7kqAGYufs4JRMT+qH073IouxKHw7R7EOijFM4sK3Ef5fRjc93
   ZwTb7cqSCNf0Fy6Rw+RfBLqQfXWDvgjDpWIGPU2jOMQHqlUsmw3sZAyHE
   DmUOWem//kyoV6NZA+4OGXGcfmrRZ5ZokjduCPRIezORwuTwJHxy6h8gR
   w==;
X-CSE-ConnectionGUID: peadmXAsQoqKAtN/+L70QA==
X-CSE-MsgGUID: z7+0TYO6RZWbNpl6mjoGQw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="13791014"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 05:03:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:03:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 05:03:20 -0700
Date: Thu, 7 Dec 2023 12:02:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 0/9] RISC-V SBI v2.0 PMU improvements and Perf sampling in
 KVM guest
Message-ID: <20231207-affiliate-state-c4a20ea7e8de@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_040349_434629_82838355 
X-CRM114-Status: GOOD (  26.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============4419543410039286001=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4419543410039286001==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9SfbnEmeRUo8czVM"
Content-Disposition: inline

--9SfbnEmeRUo8czVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish,

On Mon, Dec 04, 2023 at 06:43:01PM -0800, Atish Patra wrote:
> This series implements SBI PMU improvements done in SBI v2.0[1] i.e. PMU =
snapshot
> and fw_read_hi() functions.=20

I don't see any commentary in this cover letter as to why the series is
an RFC. v2.0 is a frozen spec per the Releases tab on GitHub, so that
has ruled out the usual reason for spec related things being RFCs.

What is it about the series that you are not yet willing to stand over?

Cheers,
Conor.

> SBI v2.0 introduced PMU snapshot feature which allows the SBI implementat=
ion
> to provide counter information (i.e. values/overlfow status) via a shared
> memory between the SBI implementation and supervisor OS. This allows to m=
inimize
> the number of traps in when perf being used inside a kvm guest as it reli=
es on
> SBI PMU + trap/emulation of the counters.=20
>=20
> The current set of ratified RISC-V specification also doesn't allow scoun=
tovf
> to be trap/emulated by the hypervisor. The SBI PMU snapshot bridges the g=
ap
> in ISA as well and enables perf sampling in the guest. However, LCOFI in =
the
> guest only works via IRQ filtering in AIA specification. That's why, AIA
> has to be enabled in the hardware (at least the Ssaia extension) in order=
 to
> use the sampling support in the perf.=20
>=20
> Here are the patch wise implementation details.
>=20
> PATCH 1-2 : Generic cleanups/improvements.
> PATCH 3,4,9 : FW_READ_HI function implementation
> PATCH 5-6: Add PMU snapshot feature in sbi pmu driver
> PATCH 7-8: KVM implementation for snapshot and sampling in kvm guests
>=20
> The series is based on v6.70-rc3 and is available at:
>=20
> https://github.com/atishp04/linux/tree/kvm_pmu_snapshot_v1
>=20
> The kvmtool patch is also available at:
> https://github.com/atishp04/kvmtool/tree/sscofpmf
>=20
> It also requires Ssaia ISA extension to be present in the hardware in ord=
er to
> get perf sampling support in the guest. In Qemu virt machine, it can be d=
one
> by the following config.
>=20
> ```
> -cpu rv64,sscofpmf=3Dtrue,x-ssaia=3Dtrue
> ```
>=20
> There is no other dependancies on AIA apart from that. Thus, Ssaia must b=
e disabled
> for the guest if AIA patches are not available. Here is the example comma=
nd.
>=20
> ```
> ./lkvm-static run -m 256 -c2 --console serial -p "console=3DttyS0 earlyco=
n" --disable-ssaia -k ./Image --debug=20
> ```
>=20
> The series has been tested only in Qemu.
> Here is the snippet of the perf running inside a kvm guest.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> # perf record -e cycles -e instructions perf bench sched messaging -g 5
> ...
> # Running 'sched/messaging' benchmark:
> ...
> [   45.928723] perf_duration_warn: 2 callbacks suppressed
> [   45.929000] perf: interrupt took too long (484426 > 483186), lowering =
kernel.perf_event_max_sample_rate to 250
> # 20 sender and receiver processes per group
> # 5 groups =3D=3D 200 processes run
>=20
>      Total time: 14.220 [sec]
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.117 MB perf.data (1942 samples) ]
> # perf report --stdio
> # To display the perf.data header info, please use --header/--header-only=
 optio>
> #
> #
> # Total Lost Samples: 0
> #
> # Samples: 943  of event 'cycles'
> # Event count (approx.): 5128976844
> #
> # Overhead  Command          Shared Object                Symbol         =
      >
> # ........  ...............  ...........................  ...............=
=2E.....>
> #
>      7.59%  sched-messaging  [kernel.kallsyms]            [k] memcpy
>      5.48%  sched-messaging  [kernel.kallsyms]            [k] percpu_coun=
ter_ad>
>      5.24%  sched-messaging  [kernel.kallsyms]            [k] __sbi_rfenc=
e_v02_>
>      4.00%  sched-messaging  [kernel.kallsyms]            [k] _raw_spin_u=
nlock_>
>      3.79%  sched-messaging  [kernel.kallsyms]            [k] set_pte_ran=
ge
>      3.72%  sched-messaging  [kernel.kallsyms]            [k] next_uptoda=
te_fol>
>      3.46%  sched-messaging  [kernel.kallsyms]            [k] filemap_map=
_pages
>      3.31%  sched-messaging  [kernel.kallsyms]            [k] handle_mm_f=
ault
>      3.20%  sched-messaging  [kernel.kallsyms]            [k] finish_task=
_switc>
>      3.16%  sched-messaging  [kernel.kallsyms]            [k] clear_page
>      3.03%  sched-messaging  [kernel.kallsyms]            [k] mtree_range=
_walk
>      2.42%  sched-messaging  [kernel.kallsyms]            [k] flush_icach=
e_pte
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>=20
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc
>=20
> Atish Patra (9):
> RISC-V: Fix the typo in Scountovf CSR name
> drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
> RISC-V: Add FIRMWARE_READ_HI definition
> drivers/perf: riscv: Read upper bits of a firmware counter
> RISC-V: Add SBI PMU snapshot definitions
> drivers/perf: riscv: Implement SBI PMU snapshot function
> RISC-V: KVM: Implement SBI PMU Snapshot feature
> RISC-V: KVM: Add perf sampling support for guests
> RISC-V: KVM: Support 64 bit firmware counters on RV32
>=20
> arch/riscv/include/asm/csr.h          |   5 +-
> arch/riscv/include/asm/errata_list.h  |   2 +-
> arch/riscv/include/asm/kvm_vcpu_pmu.h |  16 +-
> arch/riscv/include/asm/sbi.h          |  11 ++
> arch/riscv/include/uapi/asm/kvm.h     |   1 +
> arch/riscv/kvm/main.c                 |   1 +
> arch/riscv/kvm/vcpu.c                 |   8 +-
> arch/riscv/kvm/vcpu_onereg.c          |   1 +
> arch/riscv/kvm/vcpu_pmu.c             | 232 ++++++++++++++++++++++++--
> arch/riscv/kvm/vcpu_sbi_pmu.c         |  10 ++
> drivers/perf/riscv_pmu.c              |   1 +
> drivers/perf/riscv_pmu_sbi.c          | 219 ++++++++++++++++++++++--
> include/linux/perf/riscv_pmu.h        |   6 +
> 13 files changed, 478 insertions(+), 35 deletions(-)
>=20
> --
> 2.34.1
>=20

--9SfbnEmeRUo8czVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXG0agAKCRB4tDGHoIJi
0qfCAQD6O/Zu4BXl4WwLlzGil/+p+2TcUeG/FDBcefl7DcKpywD/aJfoO0d80ScY
c8u1Smn+9x/zgV5RHnNZlZUAQ93MIwE=
=RovS
-----END PGP SIGNATURE-----

--9SfbnEmeRUo8czVM--


--===============4419543410039286001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4419543410039286001==--

