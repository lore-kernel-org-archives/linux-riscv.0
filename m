Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCAC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t2m7CkVr6TZAj/H69ljmp0+N67FLKb2sMIGHLxP4zY=; b=BefqnVlV3EB37/JdF4UsvIUUYW
	Pbln+p9U4cX3QfDhCKSreUNR1Ti1/6uPEbhpJVSx88UD1knyGE9nQcNmsJqttXwqatj3ng1KIrnUv
	OqlBQmbDzLg8edJN2fO8k0rHDQ5JqpV0seSITAFxXmikZU+txOS8qqMCNGe1VmrLTnqiBs8RQE3Bs
	ompbRPP8mWcy74SWKQA3EtCV6Nd5E4rWDXmbP69sxzCpVjVQj0FLpFdNt6Sb8wze2eYvVl3QPFvIj
	tHdxB0VFBBA9h3szlAz/clYgGKQ+tTsmGr+diDkmwJJsoTMG5E46X7jjHV9LsHnppB1CQdjvlbs0k
	pvsznotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pycLA-0032gX-1U;
	Mon, 15 May 2023 17:50:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pycKv-0032TQ-0z;
	Mon, 15 May 2023 17:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4DCD62F52;
	Mon, 15 May 2023 17:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8159C4339C;
	Mon, 15 May 2023 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684173016;
	bh=ZOa1DuUaalVCTQ5zS8baq1fo8jfyEiJs85l6V1kJejo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFBB5QmZRIkddN1jXrL0rxgk+YytZrH7cS/JUc/RyYLgIDM4Kkyy8yuO5rjnKFvDH
	 MqqGEQvhse7GWhRZX/gyZ5MQmxzPDa4OI2vlxKzO+XScyEUHqfEoddAxGkP8ZxN21j
	 F1CIwJqEeUzA3tH6wKZztMSu5xgJkMwDbQinJHZAyl7OWvFinSV3O8AGaU5q42mwwy
	 D9WatvBizQmoLohHCc7SWJKgSYJphFAzBIssilSkUJG3BWhAj5Krb+XkD9aW298s+H
	 FnkJSM8OeI92H2iZhqvDk2TDwOTUg39i4kRefZwtXAsOZYDj/bEOL/iMsmj1kqdZoD
	 wzHDL4qn/ytJA==
Date: Mon, 15 May 2023 18:50:09 +0100
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
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/10] riscv: Allow userspace to directly access perf
 counters
Message-ID: <20230515-unmoved-promenade-9e678c4f14f5@spud>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_105017_415298_D21FD13A 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Type: multipart/mixed; boundary="===============3830389512662689447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3830389512662689447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yUJ9qocDe5RgavIo"
Content-Disposition: inline


--yUJ9qocDe5RgavIo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 12, 2023 at 10:53:11AM +0200, Alexandre Ghiti wrote:

> base-commit-tag: v6.3


BTW Alex, in the future it'd be great if you could pick a more recent
base (eg -rc1 or riscv/for-next) so that the patchwork automation
doesn't run into a bunch of conflicts while trying to apply patches.

Cheers,
Conor.

--yUJ9qocDe5RgavIo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGJw0QAKCRB4tDGHoIJi
0ttiAQCvuOgsTmAbHoptLuttHFak0avpeoAERDI2wkQYdNUeUwD/Q+eHjCl2EwCO
AMEo1k9TljgZ9ZWXb/Q9SCxc/XeGawQ=
=4Rls
-----END PGP SIGNATURE-----

--yUJ9qocDe5RgavIo--


--===============3830389512662689447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3830389512662689447==--

