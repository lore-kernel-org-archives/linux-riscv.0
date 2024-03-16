Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E016C48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61ED9sGlSWG5+zuMQXCWjqlidkqUeq6VPneURJXfvl4=; b=J/izQy3lzEhnwaQISBe7xrdSkn
	qM25NpCmrkFCL88OLhWDQ4N9qSUAULNCmqN1Rp106jqyEIvdviTzfXBaTAKns6gxW5CNJpX3XMj37
	e6428FuoGSURJfFHwA7iR06Ld0DaOeN8UUwdW5rbyITmVlBHdkyQ0oxuJGqtAQc4WXs+ufEiieGlJ
	qzRi+mSvd0dAoYWtP+AbRcOxP0Cw1vtxIR3GhhlkbwkNl9fJb0rMkYlLonoQ8bALQYSUpD6lAwRLx
	wPbs/1eLZvWrADe5P5pXOgumPYWS8MhAENb+3ZBb1SrU+n/mVhVgvIWKKpJJGFPd8Y94xLJb2Ux24
	dd0n2dNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlXFz-00000003V2i-2Ch5;
	Sat, 16 Mar 2024 16:51:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlXFv-00000003V25-3xPK;
	Sat, 16 Mar 2024 16:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AEFBCE22C5;
	Sat, 16 Mar 2024 16:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D2BC433C7;
	Sat, 16 Mar 2024 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710607892;
	bh=Blsu0CvqJo7HubrNrOKxFJlV86ZtgqCAQWTPcruNjzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzAPz23fd/PxP33AOa4VhBirWHWPNkPf5erhBDr8Pb8F6/lbb/XUlhaCYPt35sB+B
	 iWvAe1E6wVDt30ocj4xMFm3DfWqfdKlW4Dxo8KssXYoihPBeUlWL/SkQG56Amk7AST
	 80OGqWxhIvaYNaqa2EQqNhGjJtEs4jNmJV6QKyef7YBbaJdaGkBgmzTiCoEjoqobD+
	 xIWJoneRYLd1b5zUvtVOMwokPVV7DaX/MAFDiIWMkOxO6TlT61uDk8aB9UDCgblFxb
	 skazrTAb9AuVFTsYJtnGpvBOCTnW0afT7HvuavOPLP1e2cSAu6RPzlp+v+xuTvwiVT
	 AzP71kcxM3WAA==
Date: Sat, 16 Mar 2024 16:51:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
	peter.griffin@linaro.org, linux-riscv@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for
 multiple DT
Message-ID: <20240316-herring-skies-6ee1d4a9c0d2@spud>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
 <20240316-germinate-browsing-6865db3a44d7@spud>
MIME-Version: 1.0
In-Reply-To: <20240316-germinate-browsing-6865db3a44d7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_095136_181751_F64FBDEA 
X-CRM114-Status: GOOD (  11.71  )
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
Content-Type: multipart/mixed; boundary="===============7131378286028153920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7131378286028153920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PlXcNudSv6CjKVti"
Content-Disposition: inline


--PlXcNudSv6CjKVti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > On 14/03/2024 12:11, Amrit Anand wrote:
> > 2. A top level board-id property that isn't namespaced implies that it
> > isn't vendor specific, but the proposed implementation doesn't even
> > pretend to be vendor agnostic.
>=20
> I pointed out previously that the Chromebook guys had some similar
> issues with dtb selection when the OEM varies parts but there does not
> seem to be any of them on CC here.

That's maybe a bit harsh of me actually, I see that there's a
chrome-platform address on CC, but I don't know if that's gonna reach
the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
particular).

--PlXcNudSv6CjKVti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfXODwAKCRB4tDGHoIJi
0k6+AQCM2tTMcQ+gQoITo10RiHQuEEKNYjhYn4Ta1ug4VwhP4gD/cA3EtavNpHi6
nEj6wjurQTCD/TCcfUMUCuRqp9KHZQk=
=KIKJ
-----END PGP SIGNATURE-----

--PlXcNudSv6CjKVti--


--===============7131378286028153920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7131378286028153920==--

