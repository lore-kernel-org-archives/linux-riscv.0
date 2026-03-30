Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED71061B0F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2BNMP0KcqPC5isJdmz46cU3DcIU5JoimUt96bh/BuQ=; b=3rSy/RFyKBqG5Cbp9zVg563eYO
	cuFZtTOoFnX1yRPxUDDPqOeoQlIJFyqDjLPdd3Di4x8el3Hnso9Hn1FNoXAqAgQBa0ZvKaz7ESYE1
	DXV16ZI5jAkW3MlMmi7+ttpJAS6YdL3OCSlF3RIx3IXuYIru8dLov0lS1mES3qHUEUGPaH75h/gSl
	bwh8/jzXCIye2EyuJ4ieBu3eD/hV0WApvM4++3XE4f001TMJmRdGTLs/tiB3KUf7gPqPH86lqpr52
	JQw0bBktiklTig7QZubiwI+7bIbX80tXz4Wf1RN7vONagMqgwPd7wOqJNZuYGTd/vtK1yy0jRHggS
	7I3jv4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EYh-0000000BZj6-1BFM;
	Mon, 30 Mar 2026 15:29:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EYe-0000000BZib-2mz7
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 15:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAB4E4325D;
	Mon, 30 Mar 2026 15:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C3CC4CEF7;
	Mon, 30 Mar 2026 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884579;
	bh=6dfQAUKIM8F7o7mnUf4+CGKbpDfb/UQQymAgEWEcxl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT3duwo5jXXuoPpCSMUultAdalkddLoOVTldNJnKcMLLMHE9rqGTcIWxR9FkHTycX
	 zLuVn6D5TLUVWfw3HPA/Bu79OxOoMeBfsThbDfwQnz0mp7+QqtrADXvzKlTTsvBCGm
	 2QnV5HwQ0L4CKqed4r4kER0vLs7/pV8XLORP3WfPeIGJYy82lWttREIbVVKjKRSg9Q
	 LdinJXRDwkXwi7laQJAVPLCuJsgLaeyvyQYrItNPqfidHzOgyJFB8r6UGyMW4tS/EM
	 Ru1nQB1oTPZaAdQUUqfl85pt5HV7O6AauCTOoH8GULG83D9MXx7ukRg08MhfVSsTto
	 cIBDwqK2JdUGA==
Date: Mon, 30 Mar 2026 16:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
	magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jonathan.cameron@huawei.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, tim609@andestech.com,
	alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
Message-ID: <20260330-snagged-whiff-e56fc19963ee@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
 <c2a135eb-c8fa-47d6-b774-430ccc4fbda4@kernel.org>
MIME-Version: 1.0
In-Reply-To: <c2a135eb-c8fa-47d6-b774-430ccc4fbda4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_082940_721454_AA4DE12E 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: multipart/mixed; boundary="===============1323428247560734528=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1323428247560734528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C4nrD42o+BcHPWfr"
Content-Disposition: inline


--C4nrD42o+BcHPWfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 03:00:41PM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:27, Hui Min Mina Chou wrote:
> > The AX45MP-specific cache binding is renamed to a generic Last Level
> > Cache (LLC) schema, as the driver now supports more Andes CPU cores
> > beyond just AX45MP.
> >=20
> > Updated compatible strings:
> >   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
> >   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
> >   andestech,ax45mp-cache          -> andestech,llcache
>=20
> Why? No explanations and that is clear ABI break.

Ye, I am not going to accept any compatible string renames for this
hardware. The break is too significant, since the devices *need* this to
function.

--C4nrD42o+BcHPWfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqW3QAKCRB4tDGHoIJi
0nJcAQCBaidceSPvNq6RwE1uXobJN7NUKpxWp7YgJzv7IemPWAEA50Am6tp03/9t
37fYoMlE/XFQhJyB3OAJcST9nTm/EA8=
=FDn9
-----END PGP SIGNATURE-----

--C4nrD42o+BcHPWfr--


--===============1323428247560734528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1323428247560734528==--

