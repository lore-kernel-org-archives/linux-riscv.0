Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5BDCD6E75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67SKHxV7LoSKwj0MbTU0TGPYRj6+L0vY+ouKGFWBTAs=; b=MF7YymmxIW/hSTTXFnzQMIYfeZ
	LXUPIyh/OUP+crphNzo+GRMzYMi1ok+sRilBOjBNBdTF3e1ai4vvtreMWn8bg/WwgU+koHGrmXG9p
	4oHE97U23k8vSKpBW7h+d3MiQLsUX0zx4q55xU8HUST0ygBG5smIRusn61qwoPe9lobR0e+RUSgak
	wEzFU9Ra2qpj9J8mrHgU0kLar+szAQhnViJgffwqBc6PeUMGdzkEv0Jc4fs8S5OeQLGMybyhYG8g1
	06R/1bAvkDfYXfo2MKehRUUw6aebpCLchvb4Cw37OSzg/T9V46YGA2yzl/NzKzg3F7I23rwWNiMn0
	BvMS2Rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBB5-0000000H5dS-0ByY;
	Thu, 04 Jun 2026 16:44:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBB3-0000000H5d2-10Nl
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:44:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 051D84412C;
	Thu,  4 Jun 2026 16:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF6C1F00893;
	Thu,  4 Jun 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591456;
	bh=xpfCQb0f0RQ9VM7+cHYIDy/L/aEeP4pps5RxAlULLvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fg5Lk2zVDgIbt0983DWzuNz5E9iTFH8YDgTIrfgvw3jszyYMQk3NdJl7MgcbrQgvH
	 eCoS/rOwdVYzZkXlO1bMyAEgoy0YjSPtamFqFX9RBPYfGsISVYCnR37ykDSQbbr6qH
	 bnDHers69O8hb+J1/MzVqqKD1c8y/beN0p3ChXr5iCX9YZhPcZSc/PD0YGJNfIq4dn
	 uP+RBFkij5CGf1PZQnqRF+fOdE6kmBUHI6C6T+1BXZTD0N6/6QkLEgg+vBg45gKf/6
	 GtN/lNDOckNwE5/nDaW/DjLfFDLfZ8T2vm+rzuibXH+/pf6zQE+bjZdlM4x63mx5KZ
	 Mv0n7lohQX4SA==
Date: Thu, 4 Jun 2026 17:44:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <20260604-ravioli-expansion-cf5215234bab@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-4-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260604143957.668047-4-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============8082531542888128767=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8082531542888128767==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yPvnAK5LiPXdjaq"
Content-Disposition: inline


--1yPvnAK5LiPXdjaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1yPvnAK5LiPXdjaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrXAAKCRB4tDGHoIJi
0gy7APwIkV8QZB6pyK9SrYi8NFGK3QBzxZergUQIMWqX2XRNpQEA0Lhw/PgdYacX
dxegYUg1eO65xisg5PDFbEbMlo3v4gk=
=LWbO
-----END PGP SIGNATURE-----

--1yPvnAK5LiPXdjaq--


--===============8082531542888128767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8082531542888128767==--

