Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5061606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qR+ca6+4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muxSuVdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JsrjgFZ0O7EXMj+88rUnD43bJtJKiDePGCsxRR2GQPY=; b=qR+ca6+4nLdKrPpqVlsIDvSSnh
	AHM6M8TzRLHlqWB4cTznicKBvcWFynJeUq1EaJc6NMnh5YFk8MGU5Ng7X6VoUikiSbA3Uu2lvZCIZ
	OAQmTYlN+Dwnb4M0Mi8Hytm16YbtaaWYaQn8wVH/0RGerkxHgGdeQ1aSO01JFTRcfzBzz99ZzPoxh
	UiX3ow/1EUsIfuA8gXG2+8L/5zbHM3iO3Uw7KthNHuLRsJr5INK85E67WI1Rx34uBlpLrn325EqnY
	T+bQsj58+tz6YLHLawFvPCi2+CEiYMGiKQRBpBpJWibgCpJ+r1snmRixpxNgeiIVL7r07/+XoTrl0
	0NGbjSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Lw-0000000A9y8-1d0j;
	Thu, 05 Nov 2026 18:38:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ln-0000000A9x3-2rXw
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 262B660145;
	Thu,  5 Nov 2026 18:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A581F0093A;
	Thu,  5 Nov 2026 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903895;
	bh=AZGeX5aVFS5l+3Uq0QyKvLMtmpwjaDuUa1/4EufpjXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=muxSuVdzPs8TnU68WanPCS0cSMyzwWuvJgJ3hUzcWJ0WHrYeBnf2VzG1q9Usn+mGV
	 SLBaIghuBes9Sejm71spoxaIsFuFarBfgPk0iBM8ZY+SvPlMDjKP7qfm7gQazgq6Qw
	 STawF4Vb1Rm6empHddxCnLtBOx6T0lj/KqpLiw7NVW+xyNpWSPOVStCR/xmEwNadOL
	 +pTS3t52+x6/5J/nrvc/7ZrC2dDaR7ticT+e57Cfst0fYUxMNp5ihlBuwDG2oVb3mj
	 Xyv9zD+o4hVNEoiE9ShqXqnxo5iVyNSS8dX3XXKBpT4bfmi8G+mqAw/UKlPHJ7t9gl
	 DzQhi7+aL3LIQ==
Date: Thu, 5 Nov 2026 18:38:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: put the flash
 device reference
Message-ID: <20261105-blandness-smilingly-dd268d223a1a@spud>
References: <20261104021435.1468301-1-vulab@iscas.ac.cn>
 <20261104-foamy-toad-of-courtesy-e0907b@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261104-foamy-toad-of-courtesy-e0907b@quoll>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5902391742702848425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5902391742702848425==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NglYpU+wgfKWZGpL"
Content-Disposition: inline

--NglYpU+wgfKWZGpL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 08:13:00AM +0100, Krzysztof Kozlowski wrote:
>=20
> On Wed, 04 Nov 2026 02:14:35 +0000, Wentao Liang wrote:
> > of_get_mtd_device_by_node() returns an mtd_info with a reference taken
> > on the MTD device, which is stored in sys_controller->flash.  The
> > reference is never released, neither when the last sys_controller user
> > goes away nor on the probe error path that frees a freshly allocated
> > controller without initialising the kref.
> >=20
> > Balance it with put_mtd_device() in both places.
> >=20
> > Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system=
 controller's flash")
> > Cc: stable@vger.kernel.org
> > Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> > ---
> >  drivers/soc/microchip/mpfs-sys-controller.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
>=20
> Multiple things here:
> 1. Your team ignored completely previous feedback. Multiple times.
>=20
> 2. You use multiple identities with this email address, thus I doubt that=
 we
>    speak with an actual person.
>=20
> 3. Your bot does not even bother running checkpatch, right?
>=20
> 4. Nothing of this was reproduced nor tested.
>=20
> 5. Finally, the same feedback:
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.

Also, this is a v2 of a previous patch that is not labelled as such
and is missing a changelog:
https://lore.kernel.org/all/20261008-47741881fb032091ea3d7f0c@squawk/

They appear to be doing something akin to what I asked for.

>=20
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>=20
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.

I'm probably going to apply this, but yeah the "vulab" people are
definitely on the shitlist for their behaviour.

> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem (so a patchset grouping multiple patches with a short cover
> letter), how to document the issue discovery method and what was
> or was not tested.


--NglYpU+wgfKWZGpL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzNEwAKCRB4tDGHoIJi
0oO8AQDlAZ1k6t5GzN8D769jcYAbMCeq0Gr6P4pIVlvK0fVEuQD+K0MK2Y1IPfM4
/DA7L5TuIYoIUvLXohANeKqfnb5ItwA=
=pgUA
-----END PGP SIGNATURE-----

--NglYpU+wgfKWZGpL--


--===============5902391742702848425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5902391742702848425==--

