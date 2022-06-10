Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230A9C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkiWxu6sugftI5PNbFrp2ZjOqm3RNnXOG4m/5mHr4f8=; b=0wANqbwnBbDmO9WHoSBISuiWAR
	ubOFcwpdBFyF3srA7MwhAQED+HQFCF91hgjg40QW6Xxseve095bIzle7PbcKgz7I76iGfrujjZwDL
	VfU8hSueVMRfdQJ1qZw2dLelJvNkTHDZYwLtPF0J9alyzny8hr7/GBlFhMApUWw83gCH0nrkkw2eL
	yA9PWmsNej7yjm3WX/+oQsHg6xBCk7jEp+F8/De+OkIH9vXjqUJX7Dr59f+p6iezJ55QrzWCz1nV5
	7acb4WA9L0eNNYcemDo9RAoShlO1angGASzLkwVe9wOyzyqcq/+6RTq0JmqT30X863jD24+qSbPEb
	OPMrzw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdO6-0084nW-5n; Fri, 10 Jun 2022 12:05:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdO4-0084lT-56
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 12:05:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4AD6620DD;
	Fri, 10 Jun 2022 12:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79C4C34114;
	Fri, 10 Jun 2022 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654862711;
	bh=JQIUQi3FYPOM/5+V1s4u6ksZweZ8UJi2AXqWfYnQVQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqn4z2ZER6HNZyzpomIs29vPaD+hSOq+n76XJIxOHwa1y8Tn8MzUN3GdG2GsXQ3VG
	 MphFVuXs6vlFa0AdRc04+1OEPu2ROpRx8WTaE4Vu6N8/7izXK0uDB/cPx+zB0b2hyb
	 c+0TH6REpq8RlA3iBhvffls/M9mTswM84x2IA8B2bhLb430wcHInJs4aY9fr7rzc82
	 PYZO2vdTNTxVDwhZfYcadwizbqyt6UPNnlI2kXr3xeRtLOuscB5iDDTOL8dDQjXKRB
	 yk9ZsONSt91eXxNL92IWFsYb877oQBSOhM7OCSiXQob+wAHcjfdgwuvBwBVtbP2C9p
	 Em39HKqL0QNbQ==
Date: Fri, 10 Jun 2022 13:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH next 0/1] Add simple PM operations to sifive-spi
Message-ID: <YqMzcn9/otXYDdin@sirena.org.uk>
References: <20220610074459.3261383-1-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20220610074459.3261383-1-andy.chiu@sifive.com>
X-Cookie: Teachers have class.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_050512_267062_DCDF33F5 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Type: multipart/mixed; boundary="===============0080062913231867665=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0080062913231867665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vaPCi6nLk0w+oct"
Content-Disposition: inline


--3vaPCi6nLk0w+oct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 03:44:58PM +0800, Andy Chiu wrote:
> The patch has been tested on Unmatched using pm_test. The Unmatched board
> uses SD over SPI and it was tested by initiating S2RAM cycles for all
> devices while reading/writing files at the same time. We found no dropped
> connection to the card or corrupted filesystem during test cycles.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--3vaPCi6nLk0w+oct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjM3EACgkQJNaLcl1U
h9CwlAgAhv4owb1PAnbvVwhUGI8V47GKerrok6xW4Q+WaWi8eq+WWOz0XH7sBPaA
p6+ZbSgfN9eAh+hHS1H6pMZLB3Gmt4Fwk/f+3heUhZvOjVrG+KSWU5kjbqHRqd/v
JOU3B5o1I30lCRrlzh54pWh8+9KC72P7CMFvezTa7LYIEakda2WKrt14zIbRdmkV
Rj7IKzJFvj2jNqseaWZA4Y2F9/yu/7ov1OKO0J6G1FiOS0PprkzRzEQP+eIcD/vi
JRGsx55Xi62O+Q0Vz1V8n+/WQp4J2i861X+nXM8tE0fes+vnI608ZEjIMjN/+H2S
mFk5imuzfVWWdnGpNLWz0JMlTnoIGQ==
=wmFq
-----END PGP SIGNATURE-----

--3vaPCi6nLk0w+oct--


--===============0080062913231867665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0080062913231867665==--

