Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F31EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zm09I8OomCZui1Eonx4atFAI1yY1dcPQQtwsg9iGJw=; b=ERQIKnv+kUoaASJtxGK/0uyuYd
	ZDBKgw2zGpSWulrjN9Peo2Cmswgr+DpuQ2AsnfqVCF6XqgNKFyjo3f98eMyw/Mw7m1VTdNrhA6Uga
	ZxbOLK+NoQD8V2arGpqH+e9zJ003lTvv5lL7HWaOjoegNZ67AbUhIEmweph99f9soZe+EtLFMAvoU
	7Fva8tM0Yzu+pJMX7ElWJeHpYUA7/jnk8L+AvGWG9ieVw0GbPABZPcIMasXZTsQw3XA14Hy3UKfYi
	M0AntNtjBK/U/KZMctzFaBEs8xBOvHR+4RDL7J5bECL09gnUjTOOm6BCOj4CZhoQebyDvp5TKWdlh
	ZM3l/iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0tL-002RvM-1M;
	Thu, 29 Jun 2023 23:17:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0tI-002Rum-0b
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:17:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 748386152D;
	Thu, 29 Jun 2023 23:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384C5C433C8;
	Thu, 29 Jun 2023 23:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688080650;
	bh=4ND+yzKhpw04zTjrKk9YBxHmzqQbP/YvhVzylsXkiJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eT1jYa2P59lfnloPe1K9QA02uQ90oFQOZrBm4bwTnWydZvU5KACzsyu23dAsi8gtv
	 wiGEZ/IhqLVjA/xY6tyLvtCd6X2ErC6vuyy3OtvHodJMGX5glYJiVasL2ku4QiJw1/
	 eaf58Bl9LmM2gDgHFlKENtNQ5cdGZSR2ZYCNlVRgF1EIMcgGeqCDVlZdKGhAqsje4c
	 Aj3wgXMjzEnOW8NU2FtPUb4hwgEouqjDzBa8pWK2dyR1fBTs9mFQmQ2p/FdYg2q9dO
	 3xSdp2rifPyTP6e8uWP9qrLG3Ht+t49Q9rUWDC4fqM1c1OmdfbYjj+hxcUG0/bMxcA
	 SBKtYvOa6z9Gg==
Date: Fri, 30 Jun 2023 00:17:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Provide a more helpful error message on invalid
 ISA strings
Message-ID: <20230630-valiant-chimp-ba079aedffe8@spud>
References: <20230629223502.1924-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230629223502.1924-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161732_332116_1C5F2B2D 
X-CRM114-Status: GOOD (  22.39  )
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
Content-Type: multipart/mixed; boundary="===============2890293542820966126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2890293542820966126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yD8/RM2smwQ/HGIv"
Content-Disposition: inline


--yD8/RM2smwQ/HGIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Jun 29, 2023 at 03:35:03PM -0700, Palmer Dabbelt wrote:
> Right now we provide a somewhat unhelpful error message on systems with
> invalid error messages, something along the lines of
>=20
> [    0.000000] CPU with hartid=3D0 is not available
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:174!
> [    0.000000] Kernel BUG [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge=
0097d2c62d5-dirty #1
> [    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.000000] epc : of_parse_and_init_cpus+0x16c/0x16e
> [    0.000000]  ra : of_parse_and_init_cpus+0x9a/0x16e
> [    0.000000] epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff=
81603e20
> [    0.000000]  gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 00000000=
0000006e
> [    0.000000]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff=
81603e80
> [    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 00000000=
00000000
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 00000000=
00000000
> [    0.000000]  a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff=
816148b0
> [    0.000000]  s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff=
81a4b090
> [    0.000000]  s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 00000000=
00000000
> [    0.000000]  s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 00000000=
00000000
> [    0.000000]  s11: 00000000bf389700 t3 : 0000000000000000 t4 : 00000000=
00000000
> [    0.000000]  t5 : ffffffff824dd188 t6 : ffffffff824dd187
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: =
0000000000000003
> [    0.000000] [<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
> [    0.000000] [<ffffffff80c04c96>] setup_smp+0x1e/0x26
> [    0.000000] [<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
> [    0.000000] [<ffffffff80c00384>] start_kernel+0x72/0x400
> [    0.000000] Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9=
002) 715d
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception in interrupt
>=20
> This adds a warning for the cases where the ISA string isn't valid.  It's=
 still
> above the BUG_ON cut, but hopefully it's at least a bit easier for users.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I haven't tried this yet, but Conor posted the log as we were discussing
> the DT deprecation at
> <https://lore.kernel.org/all/20230629-angled-gallantly-8fe7451a25fa@spud/=
>.

If you are gonna apply this for v6.5:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Otherwise, can I take this in my series? I probably need to extend it a la:

[    0.000000] CPU with hartid=3D0 is not available
[    0.000000] CPU with hartid=3D1 is invalid, this kernel does not parse r=
iscv,isa
[    0.000000] CPU with hartid=3D2 is invalid, this kernel does not parse r=
iscv,isa
[    0.000000] CPU with hartid=3D3 is invalid, this kernel does not parse r=
iscv,isa
[    0.000000] CPU with hartid=3D4 is invalid, this kernel does not parse r=
iscv,isa
[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:174!
[    0.000000] Kernel BUG [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00098-g372=
a21066d8a-dirty #1
[    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.000000] epc : of_parse_and_init_cpus+0x1de/0x1e0
[    0.000000]  ra : of_parse_and_init_cpus+0xae/0x1e0
[    0.000000] epc : ffffffff80c0580c ra : ffffffff80c056dc sp : ffffffff81=
603dc0
[    0.000000]  gp : ffffffff818a9538 tp : ffffffff81614680 t0 : 0000000000=
00006e
[    0.000000]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81=
603e40
[    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000=
000000
[    0.000000]  a2 : ffffffff818b01f8 a3 : 0000000000000000 a4 : 0000000000=
000000
[    0.000000]  a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff80=
8fc878
[    0.000000]  s2 : 0000000000000001 s3 : ffffffff813675bc s4 : ffffffff81=
617520
[    0.000000]  s5 : 00000000bfbe35c0 s6 : ffffffff818b0090 s7 : ffffffff81=
3e1cf0
[    0.000000]  s8 : 0000000000000040 s9 : 0000000000000000 s10: 0000000000=
000000
[    0.000000]  s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000=
000000
[    0.000000]  t5 : ffffffff82342188 t6 : ffffffff82342187
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 00=
00000000000003
[    0.000000] [<ffffffff80c0580c>] of_parse_and_init_cpus+0x1de/0x1e0
[    0.000000] [<ffffffff80c05626>] setup_smp+0x1e/0x26
[    0.000000] [<ffffffff80c045fa>] setup_arch+0x6e/0xb2
[    0.000000] [<ffffffff80c0036a>] start_kernel+0x80/0x81a
[    0.000000] Code: fe75 85ca a0ef 98b2 a603 000a bf19 00ef 97a3 9002 (900=
2) 7159=20
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception in interrupt

with something like:

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 99df12262a3e..708ff4757413 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -64,25 +64,34 @@ int riscv_early_of_processor_hartid(struct device_node =
*node, unsigned long *har
 	if (of_property_read_string(node, "riscv,isa-base", &isa))
 		goto old_interface;
=20
-	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5))
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5)) {
+		pr_warn("CPU with hartid=3D%lu does not support rv32i", *hart);
 		return -ENODEV;
+	}
=20
-	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5))
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5)) {
+		pr_warn("CPU with hartid=3D%lu does not support rv64i", *hart);
 		return -ENODEV;
+	}
=20
 	if (!of_property_present(node, "riscv,isa-extensions"))
 		return -ENODEV;
=20
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
 	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0)
+	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
+		pr_warn("CPU with hartid=3D%lu does not support ima", *hart);
 		return -ENODEV;
+	}
=20
 	return 0;
=20
 old_interface:
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline)
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline=
) {
+		pr_warn("CPU with hartid=3D%lu is invalid, this kernel does not parse ri=
scv,isa",
+			*hart);
 		return -ENODEV;
+	}
=20
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=3D%lu has no \"riscv,isa-base\" or \"riscv,isa\=
" property\n",


--yD8/RM2smwQ/HGIv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ4RBwAKCRB4tDGHoIJi
0huHAQDkQz7d4+UfrtO1ugAhWBA5W3Lk1XzPsdMRgaoE5BJKhwD9FRieGW/mEvO6
6caU8zf+TBh0ou1EkbKbiqiD9ILCWQI=
=W/fg
-----END PGP SIGNATURE-----

--yD8/RM2smwQ/HGIv--


--===============2890293542820966126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2890293542820966126==--

