Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E32C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 23:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2AqgR5JQAOsVHeBcIqxPpXfw5ijQ2MbLDh+VlAfhsw=; b=kTYBrmYg/7nDTo5EdFobXkq2Y5
	2f0hPJYmyw8h5Td7UHn+xWlmy+lXgHIfJXr3adNC+jiYydd7rYjvz8H5N87z+/kezITyVzpx+/81E
	WTDaP/aGCa03CSMxpfwyc7iatirSnwXBTf3/tyFU2yRdtuXzhAeLKG/PSeFql7iO6poWWEevQKeJ+
	JeVWlIFZZBMzuivLFEtmSEcRv81xJogbU9ls4bTAsdxGrzm8C5cfDMNpyAdfLUYXXFItoJpMfw0UD
	bfifBc63UK3ejTAOFwc6ePxlRZUy1oZDy0V0EDgX7S09dVi4tpipq2lG75xMiyQCfxfGvzUm26ZVu
	G+lcIm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0iq-0000000DHJd-1lkc;
	Thu, 10 Jul 2025 23:30:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZy3a-0000000Cxbb-1SS0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 20:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10AB74593A;
	Thu, 10 Jul 2025 20:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2451DC4CEE3;
	Thu, 10 Jul 2025 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752179989;
	bh=vUrm0DBYVmQsNEyQ5kp5t9UXVn/4E5ekId4XN8uE1E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhnowvdLwGxO5FcGiyEC/iTheG2sll0XVDRFDuo9968chhMNDZ2xDbMkK4lxAGRjE
	 +FPhnb8SmOCleRMMKyWU9qS9Uwfz8nonGFsHNjrGIQCgH8Lq6zSbflBBCbdvno7CfL
	 RH6/wB5hpeSJTFs3VRzwVo2/vLXpyHOGBauoRhhXcpLM1iWniCoJRuCH/uoy+GXQ6M
	 4LfYHRF2zmPbSw8vLcMRfyntkrB3SVWSnafdSW608uHstNLzmIS/QunPLsos0oXg0g
	 UBGfqZeMy/m1OCPJEDD0MsXyPwYup3i/fwUaauNKLYUSxu7GC4XQEQTqtNtzt8eZkz
	 jcC90wEB2wqyA==
Date: Thu, 10 Jul 2025 22:39:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <i5ee2u45kmcb2su743th744ofnmk4lkfq44iqvfwdjwscv3bz7@pjakppae22na>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
 <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
 <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
 <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn>
 <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com>
 <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
 <ad17dc8a-80b7-4344-a1be-6cf780567aaa@samsung.com>
MIME-Version: 1.0
In-Reply-To: <ad17dc8a-80b7-4344-a1be-6cf780567aaa@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_133950_422942_2C65DEBD 
X-CRM114-Status: GOOD (  33.29  )
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
Content-Type: multipart/mixed; boundary="===============3123577261430303609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3123577261430303609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtthsjazjtpn3zg5"
Content-Disposition: inline


--jtthsjazjtpn3zg5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello,

On Thu, Jul 10, 2025 at 06:58:41PM +0200, Michal Wilczynski wrote:
> On 7/10/25 17:25, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jul 10, 2025 at 03:48:08PM +0200, Michal Wilczynski wrote:
> >> On 7/10/25 15:10, Uwe Kleine-K=F6nig wrote:
> >>> On Thu, Jul 10, 2025 at 10:42:07AM +0200, Michal Wilczynski wrote:
> >>>> On 7/7/25 11:48, Michal Wilczynski wrote:
> >>>>> The series is structured as follows:
> >>>>>  - Expose static function pwmchip_release.
> >>>
> >>> Is this really necessary? I didn't try to understand the requirements
> >>> yet, but I wonder about that. If you get the pwmchip from
> >>> __pwmchip_add() the right thing to do to release it is to call
> >>> pwmchip_remove(). Feels like a layer violation.
> >>
> >> It's required to prevent a memory leak in a specific, critical failure
> >> scenario. The sequence of events is as follows:
> >>
> >>     pwm::Chip::new() succeeds, allocating both the C struct pwm_chip a=
nd
> >>     the Rust drvdata.
> >>
> >>     pwm::Registration::register() (which calls pwmchip_add()) fails for
> >>     some reason.
> >=20
> > If you called pwmchip_alloc() but not yet pwmchip_add(), the right
> > function to call for cleanup is pwmchip_put().
> >=20
> >>     The ARef<Chip> returned by new() is dropped, its reference count
> >>     goes to zero, and our custom release_callback is called.
> >>
> >> [...]
> >>>>> ---
> >>>>> base-commit: 47753b5a1696283930a78aae79b29371f96f5bca
> >>>
> >>> I have problems applying this series and don't have this base commit =
in
> >>> my repo.
> >>
> >> Sorry for the confusion. Base commit doesn't exist in the mainline
> >> kernel or linux-next, cause I've added some dependecies for compilatio=
n,
> >> like IoMem for the driver (uploaded full branch on github [1]). The
> >> bindings however doesn't depend on anything that's not in linux-next.
> >=20
> > The series didn't apply to my pwm/for-next branch.
> >=20
> > Note that the base-commit should always be a publically known commit.
> > See the chapter about "Base Tree Information" in git-format-patch(1).
>=20
> Hello Uwe,
>=20
> Okay, thank you for the clarification. I understand the requirement for
> a public base commit.
>=20
> My intention was to include the TH1520 driver primarily as a practical
> demonstration of the new abstractions. However the driver can't be
> merged as is, since it depends on the unmerged IoMem series and won't
> compile against a public commit.
>=20
> I will rebase the series on pwm/for-next and drop the driver and its
> associated device tree patches for now. I'll send a new version
> containing just the core PWM abstraction patches, which apply cleanly.
>=20
> I will resubmit the driver patches once their dependencies are available
> in a public tree.

If you base your tree on (say) v6.16-rc1, then add some Rust
dependencies up to 47753b5a1696283930a78aae79b29371f96f5bca and then add
your series, you just do:

	git format-patch --base v6.16-rc1 47753b5a1696283930a78aae79b29371f96f5bca=
=2E.

=2E This results in a base-commit line that I (and maybe also build bots)
can use and a bunch of further lines listing the commits between
v6.16-rc1 and 47753b5a1696283930a78aae79b29371f96f5bca that might be
findable on lore.k.o.

Best regards
Uwe

--jtthsjazjtpn3zg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhwJQ8ACgkQj4D7WH0S
/k5+KwgAhf54BP4kesXyQExjra+S+O0lY+TfKRFwYNc0TlA1mA4Rm+cVJOx2VqWa
frCc5VeKCFE6+c89m85REdWNNdsSopomRCf0mrCVF+X8VkDLyCPKl3Lj7Yx0ZfVn
RFZl4QKG9y3843FRVetY6MtTIU8DXamyeY/Pr2yFfM94BfoDgaagQGuuQzuChQ9h
ydq075UFuzYr0pGEIMmKkNhBqPOKfy2TeahxEHiBe8pxLUugu+LMbcVeqPlcCXU1
igrkXeJ/DfKhdGvhywQXWazl/93kK0TbRncw/zdvGgB8hbS0NXSQk/qQMDt0mvwa
fB2HOYIpHDD3dNuiyoC/+lgbRGfHgA==
=L5lu
-----END PGP SIGNATURE-----

--jtthsjazjtpn3zg5--


--===============3123577261430303609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3123577261430303609==--

