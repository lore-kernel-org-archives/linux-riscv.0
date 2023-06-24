Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C92CEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MBe5kpAot7Ny1Ix72B00b29QcOdPbbhC8GafxJF+k8=; b=ZOVP3f57Am9qJiaQbcQnPpNp+l
	GBU5LRf6ZS/V+6r+Im9PblJeh255wonx2VveFPx9wnuNjtxOYv5ACltJAA3zrwFICUcqzwG4hoF8h
	T7LjSoF8QYO359KH1v7SH/XRMt/vTVBIkbw9HU5G8J0JXAzD/p2o507s/wykeIjH2jAPx7qMGph6v
	an5zrH88XufCc44NbL59+3eng8uhRv2Q3xHWQNp//Y9+tmPK5L7Cg5NMbpeXGqVkiqkK0SvobRKZD
	a8x8J+0hiBIMsUuoOnBy6so9ID5w5SAfvWkH/HKOlJbcvXCzcl/vNfL5wC0sUXJZSykcPOpnK0gc6
	KcsSqtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCz2q-005axB-2V;
	Sat, 24 Jun 2023 08:55:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCz2n-005avS-35
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 08:54:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4524260C36;
	Sat, 24 Jun 2023 08:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B133C433C0;
	Sat, 24 Jun 2023 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687596896;
	bh=P0AKloJHoPY0vVaH7+W9a/W3b8lwXqRDYLtUxhBSYL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFtMAM8bi0y4Bp+oBX1Eb/QknPMGyQ3S+5T7xUgNwj4tYfwYe5vCVTyUEMg+veaas
	 SO+FVI9TEGpyzY/A5QXci5lheHBKhVjymfJbCLtClUT9Wd7hPGoeaOVaQm3DfBUXvc
	 u5pn/SWwBluNh+ufE8oPF0684cVzqilo/VRmLQ/t+we3xnTH0GlRQK8gM32Hg//vEu
	 +9tX+A3aBrGAALKbmynTNxfPTuX/v/eO5nsHo9YnQaoAIZzH9Lkaf4Kq47GdF9UyFn
	 pqY5ihSbXhsgNIdQIRRP+pG6eB0XfoHw8IxjMqPTQiagm63Dy6XAQNzXvTKatVJrBi
	 AO9wI8Jkb8sAA==
Date: Sat, 24 Jun 2023 09:54:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
Message-ID: <20230624-supermom-disparity-37546ffed0a4@spud>
References: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
 <IA1PR20MB49536C0DA47122E9E3CB7CBBBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9d7cis-rb0fozK+T6R8MCEcT0ZF=RRNpv1qAWsLkMfsG6KxA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_015458_075034_36231596 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: multipart/mixed; boundary="===============5498218411803251915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5498218411803251915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzXjnwP3OWEoTm01"
Content-Disposition: inline


--dzXjnwP3OWEoTm01
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 09:35:01PM -0700, Namhyung Kim wrote:
> On Fri, Jun 23, 2023 at 6:33=E2=80=AFPM Inochi Amaoto <inochiama@outlook.=
com> wrote:

> >
> > As for c9xx wildcard, the T-HEAD provides a `MCPUID` vendor CSR to allow
> > its CKLINK to get the detail CPU info. The format of this CSR are:
> >
> > ------------------------------------------------
> > |31   28|27  26|25    22|21   18|17    8|7    0|
> > | index | WLRL | family | class | model | WLRL |
> > ------------------------------------------------
> >
> > And for C9xx series (only index 0000 is vaild for us, as `MCPUID` also
> > provides other index).
> >
> > | 0000 | xx | 0100 | class | xxxxxxxxxx | xxxxxxxx |
> >
> > The class codes are:
> >
> > C910: 0011
> > c906: 0100
> >
> > The CSR is a M-mode only CSR, so now I'm exploring a clean way to
> > integrate this CSR into the kernel. Any advice?

See for example how riscv_cpuinfo_starting() reads mvendorid & Co.

> I don't know about the details.  Is this CSR available from user space?
> If not, you could add it somewhere in the sysfs.

Machine mode is the highest privilege level, Supervisor mode is next &
User mode is the lowest. Typically the kernel runs in Supervisor mode.

--dzXjnwP3OWEoTm01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJavWgAKCRB4tDGHoIJi
0nfzAPwN3X0swkvrSVf8ck8JWpqyr9/NjbbeDsSElciyJFoqDQD9E/lEdIn9KVve
N9l4vjuyVseuxyUV74TZmag+74774gE=
=ndGS
-----END PGP SIGNATURE-----

--dzXjnwP3OWEoTm01--


--===============5498218411803251915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5498218411803251915==--

