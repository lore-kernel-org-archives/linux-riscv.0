Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4B0CD8CAA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOji0uYsSl9RAVPWCqYTvITVDwSKv52Xxxkh4oHprC4=; b=WYrUZYVHzEkuPKOXICzSmOAdDC
	L1jH59qhw1z/FS/Nkufy1mJYAFckyBQ94Invc5wjvHf9LcTNGRPPJY2UuLxUsSbZ0/ZPG+C3p7KC+
	ozxvjPb/RZmbLlNEAmPz3azzdVKMcaCLWk2yRrT5yEO1FZBgtvWDxulVokjlQPFrFxmhzIBG4mHn0
	GnEkmzUZMefkqpHY34rXNToAA2MhuGF/+x1xsTUZU7cWyYB2ZD/Ordn9UoMSqRkNKfIVOAefaEikz
	SXsO+ac77D6HR0um9zJM7a1LX9kEvzhjkeS6S3K5z/fYurXPTIcpaX8tXEzOFEDJMOYJZgZ1PmuXw
	jFdBCbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFQG-00Dkzf-1K;
	Tue, 10 Oct 2023 16:17:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFQD-00Dkyx-1i
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 16:17:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7FFD8B81CA1;
	Tue, 10 Oct 2023 16:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68016C433C8;
	Tue, 10 Oct 2023 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696954640;
	bh=lvXsPbuo3lNekKcZ4AxUxozr9gHUgje+MPo7mWhXGIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkV55KXNd4cDdmEEJUrceq9Ywe6ODR7KI/Vz8WOcxOT1lkl3wvuK71tp7iHQ6+55r
	 MtHXaiPLceXpdJINwSmAgx1d0cTGS4erUqGsu/5VH4gg8fI24Lh9xljsTW4twMTlht
	 Oa1LYFUPt2ykqW8CovGYTAYMvQoGWXT4wbluWCVUZQxRERlhOgscgB5skjPxKGt7mb
	 J8PSXJVI4x2rwSKOoBhAvbkZ3VmgiL40IFk19dCoGOG+SecUeQtVhtE3R1EWppfpwu
	 ME/kqWA04AHrpkvtm7t2YVeiaaAOp7G1b3N+BpQqXvQZwernUvyhzSejLmTfx6p/Bq
	 RFqfdXd8UxOmw==
Date: Tue, 10 Oct 2023 17:17:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl
 for shadow stack and landing pad instr
Message-ID: <c4a77a1b-ae13-4071-98e8-25235e8058b7@sirena.org.uk>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-16-debug@rivosinc.com>
 <7c4448d1-4622-436f-8779-f52c4f011783@sirena.org.uk>
 <CAKC1njQuw_nzbQ07BGAQOi3C=vr35JhAc6-TB5nzY3zG3Nff3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKC1njQuw_nzbQ07BGAQOi3C=vr35JhAc6-TB5nzY3zG3Nff3Q@mail.gmail.com>
X-Cookie: I feel partially hydrogenated!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_091725_719933_E991C88B 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: multipart/mixed; boundary="===============6020443124347871703=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6020443124347871703==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ACAhjzT85bg724HA"
Content-Disposition: inline


--ACAhjzT85bg724HA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 02:22:51PM -0700, Deepak Gupta wrote:
> On Wed, Jun 7, 2023 at 1:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > On Sun, Feb 12, 2023 at 08:53:44PM -0800, Deepak Gupta wrote:

> > > +int __weak arch_get_shadow_stack_status(struct task_struct *t, unsig=
ned long __user *status)
> > > +{
> > > +     return -EINVAL;
> > > +}

> > Having looked at this further is there any great reason why the status
> > is passed as a pointer?  It seems needless effort.

> I was trying to be cleaner here to not overload returned status with a po=
inter.
> You could say that any negative value is an error. I don't have any
> favorites here.

OK, thanks - I changed it to treat negative codes as errors, I'll leave
things like that.

--ACAhjzT85bg724HA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUleQsACgkQJNaLcl1U
h9A+oQf+LpsNDfAqDS2nwgFHdh60JolPY8rn6NrF842aj9Y2olxRwTCSw34whng7
5EBGkVw6506Spqsle1zvqdXSzA1VyWFfzZKJ+04ZsH6N6Wn42m0gry/3RnKcphxW
gF3Yz5JSyLRam8m4pGDM3OBDwLReOxIgxhOZs4VjWbaRdlL2MJ4y+gqHYx7JJRCT
fpF5koeDVyLxvPNJVwMHtHRE6adGLqd91yFi/UNL/ERzz4LhYxixwpk8LcZJzLcT
gjlqKcScF9TvoCqnItWWO6ulsNqN/fxtAvK+PYBCEZfiPqMktLztr2oeq238hdg0
3oCa+f5qhH7JF0SgvRu+mPmURwO7Lg==
=7Bqv
-----END PGP SIGNATURE-----

--ACAhjzT85bg724HA--


--===============6020443124347871703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6020443124347871703==--

