Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C61C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d88zs4evhpHFkKgshr83qtH9j8JTJk4zagiKGKKgSP0=; b=0i/I5XD8Il8DYDWQj/H3JP4a4i
	hZFAW4OUaisQMouYJ7Q4QjpbYOjzcrRq6ZbitRkWJZbY4Kmv2NAigTemrB6FL367NuLBw54Rqj+/c
	jNcadZPG9qNNAm9Bpn+3cIXpI8A4D/j/3TitNSRphtRs9CN/Zkugu7k/pgAlDXam4OwENDH+D1cUF
	6yQ5Ul1ddGu2mhNiUXT0pTsScq1nyImJXqOZrJ4fMUg7Xe6KrosVjdpW3kZMu9TQRlkrYMGJw4rJ/
	b1YYTP92kNWGQUW7Z6Ei8NeY80XAhqZuaHkwTovv0cdwwRkJDmYHWOkDWzJcZQAs40XB5s8kDa0bk
	VXe7TvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHyc-00000005mvN-1t3t;
	Thu, 07 Mar 2024 17:56:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHyR-00000005mt5-2Mpv
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 17:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B19B561B69;
	Thu,  7 Mar 2024 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF61C433C7;
	Thu,  7 Mar 2024 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709834166;
	bh=zzpgR307W+PkVy2pQ4SerrtaP9TK7vZSHCQeFZauwVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcJD16kinBkS3CAHcMTXE4L2jiXzHpYI3SqxsgLy4+JAn70BeWxjn8uJdwQpc077K
	 7Zw/bs8MuGE4RaRGTf4W5AhM1YhqrUPOEAbnhE+ndKFUr+nV7sz9GM8aa2GQzV6vqF
	 2lTWQroiXGjrrakC5kLm3keNMM9V31f9O60UgKdoFEYL2XHr1f+J+B4Qj+LBK7SXky
	 2tRVqoWQcetPa8zaNz5yq0AHsTEHMjYgH0PwmiIyS2BDmhD4vV8OZJHvrALuqvA2w+
	 Sys/MI5a/j6fM3DY8a6AYW3IdqQphXES6HdI63BsxDMLgEPcy2Jn4spX15rqBRXKv/
	 Fny09Vdsd5n2g==
Date: Thu, 7 Mar 2024 17:56:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] serial: sifive: Remove 0 from fu540-c000-uart0 binding.
Message-ID: <20240307-busily-encrypt-507cae0e7564@spud>
References: <20240304105947.SJcVAdr1@linutronix.de>
 <20240304-whomever-gladly-d43da7ad2fe6@spud>
 <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
 <20240307090950.eLELkuyK@linutronix.de>
 <20240307-sacrifice-dares-09c91fc8fefe@spud>
 <4d85215e-64ca-491c-8f69-f2c83c7e72d7@sifive.com>
MIME-Version: 1.0
In-Reply-To: <4d85215e-64ca-491c-8f69-f2c83c7e72d7@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_095610_452009_182A2278 
X-CRM114-Status: GOOD (  23.03  )
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
Content-Type: multipart/mixed; boundary="===============4012049090217209929=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4012049090217209929==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SAmxjma6bwXqQ9Z"
Content-Disposition: inline


--4SAmxjma6bwXqQ9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 11:43:53AM -0600, Samuel Holland wrote:
> Hi Conor, Sebastian,
>=20
> On 2024-03-07 11:39 AM, Conor Dooley wrote:
> > On Thu, Mar 07, 2024 at 10:09:50AM +0100, Sebastian Andrzej Siewior wro=
te:
> >> The driver is using "sifive,fu540-c000-uart0" as a binding. The device
> >> tree and documentation states "sifive,fu540-c000-uart" instead. This
> >> means the binding is not matched and not used.
> >>
> >> This did not cause any problems because the alternative binding, used =
in
> >> the device tree, "sifive,uart0" is not handling the hardware any
> >> different.
> >>
> >> Align the binding in the driver with the documentation.
> >>
> >> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >> ---
> >> On 2024-03-06 18:48:13 [-0800], Paul Walmsley wrote:
> >>> On Mon, 4 Mar 2024, Conor Dooley wrote:
> >>>> I suspect that the driver is what's incorrect, given there's little
> >>>> value in putting the IP version in the SoC-specific compatible as it=
's
> >>>> a fixed implementation. I'd change the driver to match the bindings.
> >>>
> >>> Agreed
> >>
> >=20
> >> I didn't add any stable/ fixes tags as I guess there is no point in
> >> backporting this.
> >=20
> > Every documented device falls back to "sifive,uart0", as you mention
> > above, so I think that's reasonable.
>=20
> Right. In fact this means the sifive,fu540-c000-uart compatible can be re=
moved
> from the driver entirely, since the driver would match sifive,uart0 anywa=
y.

I'm always a bit hesitant when it comes to removing compatibles that are
backed up by a mandatory fallback in where there could be some old
firmware/DT floating around that didn't have the fallback. I think in
this case that's pretty moot though, so ye, it could totally be dropped
=66rom the driver entirely. I'm happy with either, both cases are an
undocumented compatible being removed ;)

--4SAmxjma6bwXqQ9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZen/sgAKCRB4tDGHoIJi
0gBZAPsGFHKhN1kEYavlU7tgP1RAwM4t/Y/jASTOoiG36C7QlAD/RC+F1vQtcgdR
JcIGU88gRGoCHMcP0AyXsra9adDRVwc=
=BSr6
-----END PGP SIGNATURE-----

--4SAmxjma6bwXqQ9Z--


--===============4012049090217209929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4012049090217209929==--

