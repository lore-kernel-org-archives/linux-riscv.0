Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A22C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdcOllIRZjRugv44seu09eWsKkkLYHIIw/+0hJ5C+7s=; b=XKbWBw5sRt2eEmJw/GVgj7Ek1F
	HIWzhgcHtg0eclCIvn5sG3AuPrkbp7TiOGS8OGijXl+Gdcelj1mAHXrNmx7f2ivhPd3ptDXvJBtJS
	d4ttMSYPJG5r6UR7rtirNnTejOzK9aTmAMVIcPPW1zkjL5drZBZZVMJjc+SGUpHg21CFXhv4QxNJz
	kzv+PGzzS1ZYQOjLd/sxR0mvkIPbSPCJt6JF9KlheOZhbJ7uL/8BSaA3Shs0OSpY3I7dFHG9hFhlt
	b/UyqyS1Pp8cB1AhJTB6KabUB2mmF2UBRzmPc7MWD2zxYeH85WQ1TGWL8X2XZtA/+HAg/3il6+ed2
	JTc3qBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpja-00BpvF-18;
	Fri, 04 Aug 2023 08:00:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpjX-00Bpu0-0K;
	Fri, 04 Aug 2023 08:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691136026; x=1722672026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mozKuYzJnKHA2aKr3eiYDtSGyCx3d+I7fkTRCyvB7W0=;
  b=VFNB+mZFfsLFpTDEd9Jg2cQhvhB4COdMLaHuUGSu1KYxyQmSzyi+UG0r
   Agp7+MX9DeoTeV0x1N39loiJqzvmSzM1ugLIcIRtmOo9vK1WpfAIwTVN/
   1PIiMIxnrlIi2Gdes0nTynZq3E0ECt2ANQTH/Hr3aAolNiforXkXhTEce
   /rzYBKmAELK5qwDQ2qXzkHICTleVCRALHphLg7qDwrUfTC+caxny3accP
   NX2k0G8yKUprb7M13rH3N73aXh3IaifpTQL7KGtH1F6mgItN7xdFYtihi
   q2qXGvnsqrJWLIPdHuGxXuiBv9O2tT97Xyi5oOH/rJQfBzI1dI719bC0o
   g==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="asc'?scan'208";a="164824311"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2023 01:00:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 4 Aug 2023 01:00:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 4 Aug 2023 01:00:01 -0700
Date: Fri, 4 Aug 2023 08:59:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<bpf@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Peter
 Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Nam Cao
	<namcaov@gmail.com>
Subject: Re: [PATCH 01/10] RISC-V: Expand instruction definitions
Message-ID: <20230804-barterer-heritage-ed191081bc47@wendy>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230803-master-refactor-instructions-v4-v1-1-2128e61fa4ff@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-1-2128e61fa4ff@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_010027_279127_964865F5 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: multipart/mixed; boundary="===============1973182239557592541=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1973182239557592541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="giltLFM/xoeS/K8e"
Content-Disposition: inline

--giltLFM/xoeS/K8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 07:10:26PM -0700, Charlie Jenkins wrote:
> There are many systems across the kernel that rely on directly creating
> and modifying instructions. In order to unify them, create shared
> definitions for instructions and registers.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h            | 2742 ++++++++++++++++++++++++=
+++---

"I did a lot of copy-pasting from the RISC-V spec"

How is anyone supposed to cross check this when there's 1000s of lines
of a diff here? We've had some subtle bugs in some of the definitions in
the past, so I would like to be able to check at this opportune moment
that things are correct.

>  arch/riscv/include/asm/reg.h             |   88 +
>  arch/riscv/kernel/kgdb.c                 |    4 +-
>  arch/riscv/kernel/probes/simulate-insn.c |   39 +-
>  arch/riscv/kernel/vector.c               |    2 +-

You need to at least split this up. I doubt a 2742 change diff for
insn.h was required to make the changes in these 4 files.

Then after that, it would be so much easier to reason about these
changes if the additions to insn.h happened at the same time as the
removals from the affected locations.

I would probably split this so that things are done in more stages,
with the larger patches split between changes that require no new
definitions and changes that require moving things to insn.h

>  5 files changed, 2629 insertions(+), 246 deletions(-)

What you would want to see if this arrived in your inbox as a reviewer?

Don't get me wrong, I do like what you are doing here, the BPF JIT
especially is filled with "uhh okay, I guess those offsets are right",
so I don't mean to be discouraging.

Thanks,
Conor.

--giltLFM/xoeS/K8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMyvzwAKCRB4tDGHoIJi
0gQYAP0UlvSWYX6mB67CAGmIVZwnT0CwyiNPOEXW+G0t9GnWngD+PxdgtapB+DMY
MPJ1zDp8mSYyzU+MKQ++56q8pPpFyQg=
=yGw/
-----END PGP SIGNATURE-----

--giltLFM/xoeS/K8e--


--===============1973182239557592541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1973182239557592541==--

