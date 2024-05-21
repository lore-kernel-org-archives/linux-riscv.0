Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E4C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSYq4ayM0UdmuqxDf2N/z/5NiuzvV1Ive1urrp2PnA0=; b=RNJbclb+W1HLMgeVfvG0f1xjFM
	Ff6/e3iHmF5KaaLa74ONoSSAKd5cxXe7Z3p5afsHvVrC4qgOJhHLuRtN1vPPfH0ua+aCJzlTCJ1SZ
	mhzeXdp0gNah0EusVqNHVZdeBL/urv4I5SFyik4tsqnTVoDKA+VgTMpH55mKkXYsMGGBE3BoH/crb
	qRaJZ/vtkO+YxOy2eoSJg5LXSUE7EB6lqBM5XspP+nxiko+VJjFQXDxK0HfT9ic2XfogGYh5J5ZFI
	37uI47k4+pCA0w2i40bAydc3DP7v15D8QKDTn8A0MVmxcnFCCd0AAbCHFkGLA8DTyepkvCTJ7FFWF
	E0YzKeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ULO-00000000miZ-2ySw;
	Tue, 21 May 2024 18:36:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ULL-00000000mh5-2fnA
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 18:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28FE4CE1093;
	Tue, 21 May 2024 18:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C721BC32786;
	Tue, 21 May 2024 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716316568;
	bh=4hyalmglveh7L1D1/x9Ob92uVOpeAf5YomfggyvRmfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ejanc6JPEHRsS+eAg6JSIGEzVxzsffCfU7OEHhcAWBoGWK+aC2axEsHuES0yf90dm
	 UNQroh6hiwvQ8LI1btw8dfG10PSRS9rsn0X75t4klca4l1YpJvRfAFLIZHXs0NAHQh
	 U/e8EYWqvXieSLQ21cax4+XsoKLqnLeg5hE1x9yUfL3Zak293ZvoDpLgT5hnly+sA5
	 wPkBCOx5R/GqjoPnxfESy8pelI6YHBUZYJ3ra1dFLRbHoS6QnZW8sQOv614dx+2Iju
	 NiuM6GztYZkt36N5bGeBOienyI/LpDAr4WixkGLnkJGVfUpB7ZQcz6tM8Hg86LITIl
	 wFXryO7qS3IJw==
Date: Tue, 21 May 2024 19:36:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-riscv@lists.infradead.org,
	Kanak Shilledar <kanakshilledar111@protonmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: cpus: add ref to
 interrupt-controller
Message-ID: <20240521-stadium-cargo-178d91444e58@spud>
References: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
 <20240519175906.138410-3-kanakshilledar111@protonmail.com>
 <171614715439.2941344.11264816105918092609.robh@kernel.org>
 <CAGLn_=tLdJU1F-i9YV5aCZQbS0L7y7Wu+_k6Dn=6HwH5JmZoMQ@mail.gmail.com>
 <20240520-verbally-vibes-47604636b8db@spud>
 <CAGLn_=vsFSrEi9uaZosZ6hOK5WKyOhBWvhWmz1GXz8vp9M9M9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=vsFSrEi9uaZosZ6hOK5WKyOhBWvhWmz1GXz8vp9M9M9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_113612_116978_AA0C818A 
X-CRM114-Status: GOOD (  23.64  )
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
Content-Type: multipart/mixed; boundary="===============6772659715200724643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6772659715200724643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvZvOdIgLJuEP4Dr"
Content-Disposition: inline


--GvZvOdIgLJuEP4Dr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 07:26:54PM +0530, Kanak Shilledar wrote:
> Thanks for the clarification.
> On Mon, May 20, 2024 at 10:34=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Mon, May 20, 2024 at 03:09:44PM +0530, Kanak Shilledar wrote:
> > > On Mon, May 20, 2024 at 1:02=E2=80=AFAM Rob Herring (Arm) <robh@kerne=
l.org> wrote:
>=20
> > By "this patch" it means that having the information in the cover
> > doesn't help, but info about missing deps should go under the --- line
> > etc.
>=20
> I am still unable to get this part. I don't see there is any dependency
> other than the two patches dependent on each other. In my cover letter
> I have mentioned that the two patches are dependent on each other.

That's fine, then you didn't do anything wrong in that regard.
Sometimes however, other series have a dependency on other series, which
is what that text was talking about.

> > | base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
> > | prerequisite-patch-id: 158157d32a32e765834a0cb4fc6335f9009d9962
> > | prerequisite-patch-id: 4007c7386e66f93b67a2631dddca08cadcee708b
> >
> > That said, why do you have two prerequisite patches? This applies on top
> > of 6.9-rc3 without any issues (other than trailing whitespace warnings).
>=20
> For generation the patches I am using the command:
> `git format-patch -2 -o outgoing/ --cover-letter --base=3Dauto`
> It is automatically adding those two preqrequisite-patch-ids
> automatically along with the base-commit id.
> Is it due to the fact that I am having 2 older patches which I have
> rolled out already? Shall I remove those
> prerequisite patch id from the coverletter to solve this issue?

If they're not related to what you're working on, then yes.
--base=3Dauto probably picked the last tagged commit, but the applier of
these patches doesn't need to care about the other (unrelated) patches in
your tree so having them is just a potential source of confusion.

--GvZvOdIgLJuEP4Dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkzpkwAKCRB4tDGHoIJi
0mlbAQCk/kNx55m+Fk3uAJhLQ/EQNRKAhy5x8ukXe3t9xpM6ZgD/WDTehH9El/RG
w5Rdi7l/zyrvHD8YzWONrzK6DRfxVAs=
=UIvs
-----END PGP SIGNATURE-----

--GvZvOdIgLJuEP4Dr--


--===============6772659715200724643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6772659715200724643==--

