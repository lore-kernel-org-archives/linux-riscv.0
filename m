Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34259C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C53ZOvEK19dQcgVSF73OodDn8oNrbD03Jl27QPRpXXA=; b=qMpSMGB0TL1Own+6DoHrhMq2ET
	UcPPT7ewBrvVUi5xB+hXxeQ5SsLowneYA6ODOhGYFRTgsGs0rtbRp9WvF0C4mnSE2J0f4BoSqYz6c
	G82/DvesgpusmqMb0zvqBrInbRyfVBEq0bhfWbjfRz7FegEmWuU/5RqZQ7MEyFBUeryE4Dnxu89yJ
	2fZuO02kUwb3ndEADLwn0R4pi8c2EFA4RqapJAnxrJd961m0EMDMUCruNDpAuG9nm8bmRQ7t2HLLL
	HAz7FzCLOljy2WCDsFbm5EnvSv2GzXLLJedOnNmqknOy3wufHcvX6BdtTyWCwMelDyXxxnIAQsMgi
	ezMOTI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIVc-001AbC-1a;
	Tue, 25 Apr 2023 13:15:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIVY-001AYc-2n
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 13:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682428500; x=1713964500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EliR2mT5GHfq/CKDHDhaxmjdPcWX1dx8dle38J9zdZo=;
  b=C20pWfgmNtazH70U408fzPBLBU5TIS4tGGr5G0cruPOCJ7IKlLeKHk9Q
   imyvsQ2tyN2R+en5f2rqlX6Qv8fYT+VSdM7ydjhfrl0wHNTX4Ad8eTTTa
   arI2e3/+EgB2GhQxGXcEqjA+rxDFwhk7aGaIl7Xmj3Xk3Z+OXn4X4lkrk
   a4gYIQsLD+t26xJPzJQxfh/1yDPP/oNesbU2IlYOaj8wv/4UX4gzHg2Cv
   becx+4JH0GvPzhFc14Wk++Tlc/6LWpHVTkPg3vr3fcJHTdL+n5vUux2Ay
   4n+CKkuMrkpgO09dTb1N+Wnxs7LI6kRUtP1r0FnPxarRYHVP0+IapFr6N
   A==;
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; 
   d="asc'?scan'208";a="222476364"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Apr 2023 06:14:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 06:14:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 06:14:53 -0700
Date: Tue, 25 Apr 2023 14:14:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Wende Tan
	<twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH 0/2] Allow case-insensitive RISC-V ISA string
Message-ID: <20230425-flyable-prompter-5b1e4cebf9db@wendy>
References: <tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_061501_046755_8D40B317 
X-CRM114-Status: GOOD (  31.59  )
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
Content-Type: multipart/mixed; boundary="===============2918166398830785161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2918166398830785161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7A3Ma5DfJIchBKeX"
Content-Disposition: inline

--7A3Ma5DfJIchBKeX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

For some reason this cover letter has been detached from the series
itself. I think that might be a bug with git send-email.

The rest of the series is:
<tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
<tencent_221A82C2DAF38E66B85B313221958DDD7C08@qq.com>

On Tue, Apr 25, 2023 at 08:00:14PM +0800, Yangyu Chen wrote:
> According to RISC-V ISA specification, the ISA naming strings are
> case insensitive. The kernel docs require the riscv,isa string must
> be all lowercase to simplify parsing currently. However, this=20
> limitation is not consistent with RISC-V ISA Spec.

Correct. riscv,isa allows only subset of what the ISA spec does.

> The motivation for this patch series is that some SoC generators
> will provide ISA strings with uppercase letters in the device tree.

If these generators are emitting devicetrees, why not fix the code in
these generators so that they produce something that is aligned with the
dt-binding?

> For example, the rocket-chip will have "Zicsr_Zifencei_Zihpm_Xrocket"
> in the ISA string.

https://github.com/chipsalliance/rocket-chip/pull/3232

It looks like when this was added to rocket-chip it was not actually
tested properly? The output would not pass dt-validate. The author is on
CC I assume, so maybe they can fix rocket-chip? You can CC @conchuod on
that PR if you like.

Do any other core generators emit capitals here, or have you only
noticed it with rocket-chip?

> If we did not modify the ISA string manually, the
> parser in the current kernel will have errors when the pointer meets
> uppercase letters because it assumes the string only has digits,=20
> lowercase letters, and underscores. Then, the parser will fail and
> the pointer of the parser will continue at the next position, which
> will confuse the parser and cause the kernel to misbehave.
>=20
> For example, "Zifencei" will be parsed as "ifc" since the parser will
> fail at 'Z' and then continue at 'i'. Then, if we disable the FPU in
> the CPU hardware and remove the "fd" from the device tree but leave
> the CONFIG_FPU=3Dy in the kernel, the kernel will panic at=20
> `__fstate_restore` function since the "Zifencei" (parsed as "ifc")
> will confuse the current kernel that the CPU has "f", and the kernel
> will save and restore the FPU registers during the context switch,
> leading to illegal instruction exceptions.

Here's an idea, run dtbs_check to validate your devicetree is correct?
If you mess up your devicetree in other ways, then your system is going
to have issues, so why would riscv,isa be any different?

> However, it is not necessary to require the ISA string must be all
> lowercase. The case-insensitive parser can be easily implemented
> using `strncasecmp` and `tolower` functions. Moreover, the kernel
> parser implementation should match the ISA specification rather than
> using a more strict rule.

On the contrary, we actually *cannot* match the ISA specification at
this point.
For example, the ISA spec currently says that zicsr and zifencei are
not part of `i`, but riscv,isa was defined prior to the extraction of
those extensions from `i` and so `i` in riscv,isa means the same
`i_zicsr_zifencei` in the RISC-V ISA specification.

> This patch series allows case-insensitive RISC-V ISA string:
> * Patch 1 modifies the ISA string parser in the kernel to support
>   case-insensitive ISA string parsing. It replaces `strncmp` with
>   `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
>   dereferenced char in the parser with `tolower`.
> * Patch 2 modifies the docs to no longer require the riscv,isa
>   string to be all lowercase.

So what happens if you boot an old kernel with a devicetree whose
riscv,isa string has been validated by this modified dt-binding, but
contains capital letters?
That kernel + dtb will have issues in the manner you describe above but
dtbs_check etc will have passed.
If anything, the kernel should abort parsing the ISA string if it sees
a capital letter to avoid scenarios like the above.

=46rom me this is a NAK on that basis, sorry. Please try and fix the
generators to emit devicetrees that pass dt-validate.

Thanks,
Conor.

--7A3Ma5DfJIchBKeX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEfSOwAKCRB4tDGHoIJi
0l40AQDJ8WcQgKPnZcx88tEI56RsG3jcYPmB1VBc6634Q9JTGgD+P2Y3Te+9OhAW
Xlsmfixe/JLU2F//Pjh+0MvISv6tpgg=
=6dOF
-----END PGP SIGNATURE-----

--7A3Ma5DfJIchBKeX--


--===============2918166398830785161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2918166398830785161==--

