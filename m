Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BEC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUWzEAuyHoAHpvS1yz81NFqQnu9JuZjsH8oCvspqmZM=; b=Ox+/lkSBzAxSE+q75L/dpMAT3P
	+2ggSD4p8w+xhdqoy+JtNe7/F/Qtri1QTYEy1N0TbZpdg2XtJ7KLTpcTbHIpkGHk+NeuruFzRLVEl
	S3SUsDFTkUSWD5CN59wy8MHoek1xdaJhShfl92nvVpxLJB2dGHc4DMMAphTWXT8mvYZRG7tXrNM3J
	Im51iKD4s/i0hffmxRfaz1SapH5whPXGwmXHVU3z8do/Js7zZbNShbHqb9J9/w4410PfUyrQK5ag1
	n0LfHgT9ijaKCExNkhKfPxMbj21RUfNjDZ3Ej2mIgYxRudqPT/ouZ4QzlH8y62UH41Wz5883d9brz
	/PBq+sEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poq2U-0033uY-21;
	Tue, 18 Apr 2023 18:26:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poq2Q-0033tm-36;
	Tue, 18 Apr 2023 18:26:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 794AF637E7;
	Tue, 18 Apr 2023 18:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A526FC433D2;
	Tue, 18 Apr 2023 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842405;
	bh=vJJj0y3XGqN3FnldN+DWHS7oHWE51OlzKOTvzTeN+sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V813bxnQdAqOxELFWCvHHkT+e9xS3PzlryIybW+HOzc+1162cuN/466cAwFQY1vUQ
	 Vh6Xmh3sE8ZnRn8EePc2HuMIvCjemC5AW1tZ0P+zF/Gkhk/lKyOdeq6qPLVmqetD2N
	 fW37+TEAdeaCCvxpPf8wjZ3F+W3zMNsBZB+ftyg2u/9qySrEe3Vep+CFLIC/PqSPSX
	 3fwvNWt8l9Sr5moQNZppGbXUHXAKPJaaUl0AS5PR8C79vYNHQlZxWxjrzni6EfVYbl
	 pCcJMXW/9q3LaLzENfGiBynslTJ8egn/EvLZAFo+TLVGyLIBOLxoDI2iwZlGJGgi/p
	 Uc6D0OTQKpGlw==
Date: Tue, 18 Apr 2023 19:26:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] include: riscv: Fix wrong include guard in
 riscv_pmu.h
Message-ID: <20230418-shredder-veggie-6b995f75e1da@spud>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <20230413161725.195417-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230413161725.195417-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_112647_038648_5263905B 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Type: multipart/mixed; boundary="===============3886902880714310998=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3886902880714310998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GY50yUownOliVfyu"
Content-Disposition: inline


--GY50yUownOliVfyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 06:17:23PM +0200, Alexandre Ghiti wrote:
> The current include guard prevents the inclusion of asm/perf_event.h
> which uses the same include guard: fix the one in riscv_pmu.h so that it
> matches the file name.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

lol, good one.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GY50yUownOliVfyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD7g3gAKCRB4tDGHoIJi
0niAAP9R259eWe2kmODzm2En3NOxwxP9CGs4KgroP/D3sYF+zQD8ClzxXEWszAAT
RGbXZu9khMsxSJk412e+72gB5A7KfQc=
=Py0L
-----END PGP SIGNATURE-----

--GY50yUownOliVfyu--


--===============3886902880714310998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3886902880714310998==--

