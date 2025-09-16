Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52CDCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUt5gNIixbVnXaAjnBLDx/o9MCCeZO9GC6rn7DIRAtU=; b=18K3kzYXrUfq1lrfj6b0rsXYM9
	2JhOBj6byyCZp4j0GaJFyLqvXrrxLe0bGoE5Hl8iEhVZ1vrhoOaHSfMhJrxG/daS+ykIFCQkR3wmj
	wyJjUPJo6Cz8qAm8r3+W8fvKTSgxybgmx5b4aN+lP6rOCNOUN6YtWylypqrgI8m7Tc53gPe960PKv
	z2JDXXhL/zRAP6waQLB5pk3ufGk5R2nGKqqpD+4/D7sXbNLsqtGV3uerlYMrpajQVLON3bjZlC7oJ
	48Q7p/lL50uKBTbKR7lkwtyiW97nchhu1O1qMNPp2ubowjXph3HtrGJKHA6wP9w1Y6C2hO1O8qCMR
	0Nsk+/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUDC-00000007hWQ-38xp;
	Tue, 16 Sep 2025 11:51:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUDA-00000007hWJ-2DGp
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 11:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93227600AE;
	Tue, 16 Sep 2025 11:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F20C4CEEB;
	Tue, 16 Sep 2025 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758023463;
	bh=O9kG38pgi0D/E0EHSpH0PQiWWgf3wcmCdMWQGXzMU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNad3RKYUNxDWVNVggn8mkMBbzsSSHdr8HOOSsGLVY58B3KHr5YS3dLj8I0vphP+a
	 rgqq1ZjQLWRFd46s7QHqK5IimfxD9xVsev36qnb6c/tA8hQmQwWWrgk1FLavTJpEaB
	 PTa9OU9P3icuBmAJ+RzL1nDBxkCEXKv2becKF5A90bUMX1oo9i2m/nI1uW32VPOywC
	 fKELvj+jwfexhjZLjkMkraO7Tp+Ql3wz1/a1zR7ZKf4geHkIhbPmixJ5Z77sp0GOGW
	 WxW6pHCSF9Ahvjc68x7wqvTBbxVE/mVFUB4bKWrzkRi0KUMGshGdwC5FWhqox5p7gc
	 cCFZWkDN4KzYg==
Date: Tue, 16 Sep 2025 12:50:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
MIME-Version: 1.0
In-Reply-To: <20250916084229.GG1637058@google.com>
X-Cookie: The people rule.
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
Content-Type: multipart/mixed; boundary="===============4867999241355357365=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4867999241355357365==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CsiSrB0XCw5iECYx"
Content-Disposition: inline


--CsiSrB0XCw5iECYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2025 at 09:42:29AM +0100, Lee Jones wrote:
> On Thu, 11 Sep 2025, Mark Brown wrote:
> > On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:

> > > How should these two patches be merged?  Mark has reviewed the
> > > regulator patch 3 and Alexandre has acked the RTC patch 4.

> > We'd both have been expecting them to go via MFD.

> Why?  I don't see any dependencies between them (usually a shared MFD
> header-file).  If there are no deps, it should be taken through its own
> repo, no?

I used to just apply things but at some point Linus complained about
cases where the MFD ended up not getting merged (missing the merge
window or whatever) so I've been treating them like they had an actual
dependency.

--CsiSrB0XCw5iECYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJTx8ACgkQJNaLcl1U
h9BVtAf/Vdh8eegOI/zDdzbexE8BWvzGsLLj34YbPnkG9avqAWDdyOGlUm7qZ7dD
gB+EXJIgXSb/6TaCBjLAgBNzsLI1B4V90Se36dcaypQXvhfZaVE6a/ASWlkIMsse
sJN80MRTL3ycen6usUT19d43eP0GSoXOolHECjE6iZ7lGoijBNvNJf4RTIRzAEKY
tl5AsUWUcGeNXhMvANijktnE4+kZOq/bqe6CY/qrBuSi4Ftv6gSzFwoZ0RP+GhnZ
nDh9KEbF1AR00hzX+JnjeDDRyQupVDgf+XbJl/9hFIG4glOsERztZ6LmB77twMIF
rIInm45SJIFTn6x7WaD9kMxf4Gkhww==
=B/MB
-----END PGP SIGNATURE-----

--CsiSrB0XCw5iECYx--


--===============4867999241355357365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4867999241355357365==--

