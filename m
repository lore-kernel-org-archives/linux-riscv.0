Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C4CD6E77
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAEh+wv8VvEwfDDfihrN3gNON5JAJQTB3sFUK1P7MAE=; b=vMHtO6tRVtp4cRC3mRLBsv7JPo
	EnPodi7ubKEKYq//1bW988wsn0TSBMxKIioHoQOwqn0Em45j4PzgNvoRPEqLLkf8dd3E4hoBIUhgm
	TZCSJdsQTiWJTpS8tRwGBOEWYSbBLZrEb1absMnlEZGOpphed/6EyfzKrFHqZlCIcsqvdDST2Pl0M
	+Nr3Yp6/CSVFbmF9zma9d3GfWmAxUKESY5MzLS+idWibIZ7Wwz81A0gajI8KK+VhFZATK4tTieObU
	Q9rq1OVC0BH038S61tIxdAhMnjM086VLzKL5cP4wMgr9Dw4yWGeP4i0FuCq4UtgHac6FSMXGrypc4
	82mj3m6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBBM-0000000H5iS-0cxk;
	Thu, 04 Jun 2026 16:44:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBBL-0000000H5i9-0red
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:44:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11AF3436D8;
	Thu,  4 Jun 2026 16:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEC11F00893;
	Thu,  4 Jun 2026 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591474;
	bh=8a0IF6l905nH3u/zr72w5HQfVtZnwmPx1haQ1LiLIQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gs3SgD5ZrG6j5EMq7clPzS83LmH9wTNWWXuRuQOfVm7UnW5sLkFXiTE5HygEuC9sq
	 9GLkxvU/sJQ+NnNJbK1dFe2clcsRXES6cecbSA4G5Dp8XQSIFOaiMAubE4ofUqZ9fg
	 ECuyUtEM6RlxewWHxNvIkqD3UFGrewGGiWQ1Ec0Y+DDf9iHecs7H3Q5ZN3CGwej/nb
	 Mf96U3EvcyEVcb/BG7/qBDuYv7WK4JlX0flEVag/7qH03UmR48k3bfXXAJYgudlBmr
	 kmcivHjOkAamR42o/qDdLDaR2+VHQn14SToLtVCGEIt1hNaxRVuth0d3Y87TK1sdf+
	 elmvMSynYSB9w==
Date: Thu, 4 Jun 2026 17:44:29 +0100
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
Subject: Re: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260604-preview-cofounder-a9e6cd24a106@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-3-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260604143957.668047-3-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============8705623592763082488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8705623592763082488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vPzludfjj+bRdTk"
Content-Disposition: inline


--6vPzludfjj+bRdTk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6vPzludfjj+bRdTk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrbQAKCRB4tDGHoIJi
0kwUAPYzMTFGrgNX7hjRyuMLJeqclo87j0Uq8SO+kJREBwEzAQC2L6zP7/wbgv9P
HhuIxoNs71kjt0+mbUJoS74vBhFBDA==
=f9/G
-----END PGP SIGNATURE-----

--6vPzludfjj+bRdTk--


--===============8705623592763082488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8705623592763082488==--

