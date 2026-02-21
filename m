Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EC0C61DE4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGX15bNkjOGcUAsJyQlsPp2GvRVM4K3ZwTFbFjF7CF0=; b=H9tXhzBhHm6+ks5kmUrW3a9+zt
	1i2f3QEDcfnXfQ296gYh7uXgCtcEUlgJ2WiyCaBl4yvTnz1ECzKhR1oFlS4+VxuwMnWsE7BmO4G2l
	ZAK7EPtZVYODaDmjJLP1dScO3oZQjW8dCiEnL8afsdqciROZMCEzIOW1AYwnNGcw5yvAprwpG/Jrs
	XkILRbB9kWi3r/g2gP3mSjKbzbErNgfVa5Lc0k3eOc6rdHVqIwRm0weYDtA4X0JnyZHl9BE5FnPh7
	ixqmMUyFuaVu9Rmoio/AEdUECuQ4H5IZs6BFt4v0OSywaDXPWMd6sbNmYLj+g7/Vyxr45eKI9ISGw
	FdB3DyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtltW-0000000G26g-1Dht;
	Sat, 21 Feb 2026 12:15:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtltU-0000000G26J-0wjX
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 12:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA4154064C;
	Sat, 21 Feb 2026 12:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA48C4CEF7;
	Sat, 21 Feb 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771676130;
	bh=QcS6puq4igmgHdAhDZWFh4gN//JGx3gAUs7ZFvn1Ylw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otS4DkZ3T1lrkcZCubDtFSIlQJkV9ilR1uERlWOyUoa5ZAmP0IxkBLS4tDDaOZLhv
	 +GgghefVmzRAGZHKQTljftoNgU+ehlVXWnTu+lO51v1FAbkV3bFQwqqNQzglhFxeaY
	 X+VqODzkAbufqYww38qs715St2k4L/oLbWEGxLPQHj7Jf+CrImEMsK/G4PxMQtY/a/
	 1D9C9+Wj9Xg18RGVj2YcLfGk6kfLISg1cJQY11E1bYRS36YcqKgqedhFWgE47dPszl
	 84WT47zL7JxMa6eVjvLidS4X/s23b+QiRbWfVSux2p5jq+ouwV79zZi+klAcFKTaVh
	 /ID0Uowl05z4A==
Date: Sat, 21 Feb 2026 12:15:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
	palmer@dabbelt.com, Puranjay Mohan <puranjay12@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com,
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com, arnd@arndb.de,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, pjw@kernel.org
Subject: Re: [PATCH v4 10/12] riscv: Implement
 HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20260221-repeal-emphatic-ddc2e9b94208@spud>
References: <20250407180838.42877-1-andybnac@gmail.com>
 <20250407180838.42877-10-andybnac@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250407180838.42877-10-andybnac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_041532_308822_2FFC60F5 
X-CRM114-Status: GOOD (  31.04  )
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
Content-Type: multipart/mixed; boundary="===============2966794116541139318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2966794116541139318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VpRs8NX3IpFJmH+q"
Content-Disposition: inline


--VpRs8NX3IpFJmH+q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> From: Puranjay Mohan <puranjay12@gmail.com>
>=20
> This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on RISC-V.
> This allows each ftrace callsite to provide an ftrace_ops to the common
> ftrace trampoline, allowing each callsite to invoke distinct tracer
> functions without the need to fall back to list processing or to
> allocate custom trampolines for each callsite. This significantly speeds
> up cases where multiple distinct trace functions are used and callsites
> are mostly traced by a single tracer.
>=20
> The idea and most of the implementation is taken from the ARM64's
> implementation of the same feature. The idea is to place a pointer to
> the ftrace_ops as a literal at a fixed offset from the function entry
> point, which can be recovered by the common ftrace trampoline.
>=20
> We use -fpatchable-function-entry to reserve 8 bytes above the function
> entry by emitting 2 4 byte or 4 2 byte  nops depending on the presence of
> CONFIG_RISCV_ISA_C. These 8 bytes are patched at runtime with a pointer
> to the associated ftrace_ops for that callsite. Functions are aligned to
> 8 bytes to make sure that the accesses to this literal are atomic.
>=20
> This approach allows for directly invoking ftrace_ops::func even for
> ftrace_ops which are dynamically-allocated (or part of a module),
> without going via ftrace_ops_list_func.
>=20
> We've benchamrked this with the ftrace_ops sample module on Spacemit K1
> Jupiter:
>=20
> Without this patch:
>=20
> baseline (Linux rivos 6.14.0-09584-g7d06015d936c #3 SMP Sat Mar 29
> +-----------------------+-----------------+----------------------------+
> |  Number of tracers    | Total time (ns) | Per-call average time      |
> |-----------------------+-----------------+----------------------------|
> | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns) |
> |----------+------------+-----------------+------------+---------------|
> |        0 |          0 |        1357958 |          13 |             - |
> |        0 |          1 |        1302375 |          13 |             - |
> |        0 |          2 |        1302375 |          13 |             - |
> |        0 |         10 |        1379084 |          13 |             - |
> |        0 |        100 |        1302458 |          13 |             - |
> |        0 |        200 |        1302333 |          13 |             - |
> |----------+------------+-----------------+------------+---------------|
> |        1 |          0 |       13677833 |         136 |           123 |
> |        1 |          1 |       18500916 |         185 |           172 |
> |        1 |          2 |       22856459 |         228 |           215 |
> |        1 |         10 |       58824709 |         588 |           575 |
> |        1 |        100 |      505141584 |        5051 |          5038 |
> |        1 |        200 |     1580473126 |       15804 |         15791 |
> |----------+------------+-----------------+------------+---------------|
> |        1 |          0 |       13561000 |         135 |           122 |
> |        2 |          0 |       19707292 |         197 |           184 |
> |       10 |          0 |       67774750 |         677 |           664 |
> |      100 |          0 |      714123125 |        7141 |          7128 |
> |      200 |          0 |     1918065668 |       19180 |         19167 |
> +----------+------------+-----------------+------------+---------------+
>=20
> Note: per-call overhead is estimated relative to the baseline case with
> 0 relevant tracers and 0 irrelevant tracers.
>=20
> With this patch:
>=20
> v4-rc4 (Linux rivos 6.14.0-09598-gd75747611c93 #4 SMP Sat Mar 29
> +-----------------------+-----------------+----------------------------+
> |  Number of tracers    | Total time (ns) | Per-call average time      |
> |-----------------------+-----------------+----------------------------|
> | Relevant | Irrelevant |    100000 calls | Total (ns) | Overhead (ns) |
> |----------+------------+-----------------+------------+---------------|
> |        0 |          0 |         1459917 |         14 |             - |
> |        0 |          1 |         1408000 |         14 |             - |
> |        0 |          2 |         1383792 |         13 |             - |
> |        0 |         10 |         1430709 |         14 |             - |
> |        0 |        100 |         1383791 |         13 |             - |
> |        0 |        200 |         1383750 |         13 |             - |
> |----------+------------+-----------------+------------+---------------|
> |        1 |          0 |         5238041 |         52 |            38 |
> |        1 |          1 |         5228542 |         52 |            38 |
> |        1 |          2 |         5325917 |         53 |            40 |
> |        1 |         10 |         5299667 |         52 |            38 |
> |        1 |        100 |         5245250 |         52 |            39 |
> |        1 |        200 |         5238459 |         52 |            39 |
> |----------+------------+-----------------+------------+---------------|
> |        1 |          0 |         5239083 |         52 |            38 |
> |        2 |          0 |        19449417 |        194 |           181 |
> |       10 |          0 |        67718584 |        677 |           663 |
> |      100 |          0 |       709840708 |       7098 |          7085 |
> |      200 |          0 |      2203580626 |      22035 |         22022 |
> +----------+------------+-----------------+------------+---------------+
>=20
> Note: per-call overhead is estimated relative to the baseline case with
> 0 relevant tracers and 0 irrelevant tracers.
>=20
> As can be seen from the above:
>=20
>  a) Whenever there is a single relevant tracer function associated with a
>     tracee, the overhead of invoking the tracer is constant, and does not
>     scale with the number of tracers which are *not* associated with that
>     tracee.
>=20
>  b) The overhead for a single relevant tracer has dropped to ~1/3 of the
>     overhead prior to this series (from 122ns to 38ns). This is largely
>     due to permitting calls to dynamically-allocated ftrace_ops without
>     going through ftrace_ops_list_func.
>=20
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
>=20
> [update kconfig, asm, refactor]
>=20
> Signed-off-by: Andy Chiu <andybnac@gmail.com>
> Tested-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

I bisected a boot failure to this commit [c217157bcd1df ("riscv:
Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that appears
to be affecting all LLVM versions that I currently have installed. From
some initial testing of Kconfig options, it looks like the issue is
CFI_CLANG related because when I disable CFI_CLANG things work once
more. Since this option depends on !CFI_CLANG, but is def_bool y, I
modified Kconfig to force disable it at all times and tested
!DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.

I dunno anything about what's going on in this patch, but so little in
it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was able to
figure out that the problem is -fpatchable-function-entry=3D8,4

FWIW, if anyone checks out this commit directly, you'll need to
cherry-pick commit e9d86b8e17e72 ("scripts: Do not strip .rela.dyn
section"), as the base of the branch that c217157bcd1df is on is
v6.15-rc3, which is in itself broken in turn by the issue fixed by
e9d86b8e17e72. Probably not someone anyone will do, but made for an
awful time trying to figure out what commit was at fault!

Cheers,
Conor.

--VpRs8NX3IpFJmH+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZmh1AAKCRB4tDGHoIJi
0rwXAP4oeUdhTzMux7nYvcl7M5dz42Lb0tOrUvXmlraj1vYELAEA93zTofLfy9sc
XOj0La1CaishFPd5WhF1Hy4/qnpl6wc=
=AjmX
-----END PGP SIGNATURE-----

--VpRs8NX3IpFJmH+q--


--===============2966794116541139318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2966794116541139318==--

