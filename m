Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13578C61DB9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnaUWKRxEeLKGTk4am6i6PwSIQxARP7J66U7jL9Mlq8=; b=bNC1DQNFT6wBmbvXO16Bwh5LHM
	noCm30VI3XZlDPVEeMI1TOqp5LIzKHuByNawdDipo7G1pWBpzkYNcQMgAc3Yfy8GCuV+pvLPZobdJ
	qyCo7ZnOrXdo4nKVVLep1XGJXyY5cYdGtmgVsPNOme+9DmRtUtErHpTJ2gz9PfcDmD/yYscvfxlPr
	vOm1kIDgTvDpVXk9f87xliV7DmIx4CxHRe2IlExEiew2ihhOm7NZ/al4xnuofARAw4hFu1y736Ora
	RyaM5YNcsQT/SHhUvw7Y/+bwra5Fqq7NmZU8DcHtOVzrAPZHIF8Ht5BHuyNxbus/b5KliLE/DbNIy
	piellEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuDy-0000000187u-0ykK;
	Tue, 25 Aug 2026 16:42:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuDw-0000000187n-1KFB
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 16:42:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D85D406DF;
	Tue, 25 Aug 2026 16:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565671F000E9;
	Tue, 25 Aug 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676127;
	bh=Gi/HElnBsdS4NkjIMmfuwVQ6VMWNE3QDLq68DtQjOeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFDi/arRUmL+zG4HLDNVd3mgrwyKszk5g4ekFgVWBdcQ0uBbqBjoQ8N6cseH7utNV
	 6CrhLUC0IIbft60b9+o683/VZwK0ztmLuuK4KtcX0lO1T/fvy602U6hq1P4E3yHSik
	 bgtmaXn8ZDmJoZ97OFx5SCo9fKLcy9iC5xT6zomjmdWoYlB6EXWvP81xtNITedG/BH
	 dru3MICIYR3SUpxf80KdxI7SgvQMLL3iDpkM2e7dETvBTIX0r/GCPiutt0BefytRwe
	 7sW9qxdyTDl947tRcme498hBmJO8iC8GcZ5WXDC+VWkDqxprIPzMSO+G7jMxwOebza
	 Nmj6xbROJKnag==
Date: Tue, 25 Aug 2026 17:42:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi
 extensions
Message-ID: <20260825-mahogany-reminder-e22b34a405ea@spud>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
 <20260818-hunger-module-a44d9716010d@spud>
 <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1504031083909024214=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1504031083909024214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsPavORSHUujOhEi"
Content-Disposition: inline

--qsPavORSHUujOhEi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 06:46:39PM +0530, Mayuresh Chitale wrote:
> On Tue, Aug 18, 2026 at 3:05=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> > > Document the RISC-V Performance Event Sampling extensions Sspesa
> > > (Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
> > > Overflow Interrupt) in the ISA extensions binding.
> > >
> > > Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
> > > is present.
> > >
> > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Why is this series RFC?
> It's because the spec is still in draft stage and also the register
> addresses have yet to be assigned.

If you send more RFC revisions, please include this explanation.

Thanks,
Conor.

--qsPavORSHUujOhEi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3F1gAKCRB4tDGHoIJi
0igmAQC3/jRrzcCF94Y2gLi7rhhdnueft/WH5dLQRWVjjM0OwQD+L8Jw14XJ8EtK
Lo7n/kM+LUOD5qRcDphLiQP8J2jzFgU=
=X1BW
-----END PGP SIGNATURE-----

--qsPavORSHUujOhEi--


--===============1504031083909024214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1504031083909024214==--

