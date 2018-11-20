Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA46C4161D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FA07204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yu941SF6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nQgcMvL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FA07204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vp7zeyq4yA7GN61AqpGW4CbtFl1jAUxhZVn10teaLPI=; b=Yu941SF6/TW2ZR/jA0f+zApQF
	w5T9fnmaZ7ogWJxxOdZxg/QJqkwQPQwknk663me9n/+bbidGlUh+Nd9Ht/AieaUOy27Bj8s4Nk6WY
	QnynbVmZRoLJAM9rSqwN9t5csKhWZe5jRr9iq2y20gmbKCxLk7eqZnQctxC8l2NeWzDNgypLSCEIC
	1jpXFSLqWLPk7lLnbsu96zCXa7PKMzyVOM/shMkXiWNPUqI/IuGME8htPMYPifWrUVEm0lWJPbJp6
	WWsZ50R8wQDefHJ7+hfYobgTy3XKenWpZNlsTsPwP46TYHDLZtQcRMt7P9DPMdYyEjFzKuF2X1DS7
	gg0Jv3d3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8ox-0002wo-Q8; Tue, 20 Nov 2018 16:24:15 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8kh-0000yR-Rs
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ntq+dmLlTVh0aP30yjN+wqmrVSET1GoraFeOPJJ2/hc=; b=nQgcMvL6i6YBMmxnroNQEcXbj
 TBiJCj1/vfWV6hnKnHDRp+V/uT1HaCxdNFq4aaBOOMeGNuv2WmZLQhDJHGXPo5JWdICiiYLbJnGsO
 8kk8H7IUh33TZI5dlSGJpmi0g0LLNrbPVuzlO5OKQAwx3Dtzbqf93TRvYwS0PLbVXTpwGRoMFOpPy
 2xiy8TEPPDrCLQjL2gIS6jNl/zinu/4Pyhyy/57deb++pfH1+P86CroTVHJJfZ/7pEeINoYvKcfjN
 NsWJS6QrLjHubD1tW5SxuasCdYWYasbN8IlZh9StpS09UwpurSJi0PcCYxN01TuUdXc/Fuyqak5vL
 Tj0m46uuw==;
Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6qF-0000h1-Ht
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 14:17:29 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id F3CAA20D73; Tue, 20 Nov 2018 15:17:16 +0100 (CET)
Received: from qschulz (aaubervilliers-681-1-13-146.w90-88.abo.wanadoo.fr
 [90.88.134.146])
 by mail.bootlin.com (Postfix) with ESMTPSA id B0C5220D2E;
 Tue, 20 Nov 2018 15:17:06 +0100 (CET)
Date: Tue, 20 Nov 2018 15:17:05 +0100
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
Message-ID: <20181120141705.44odry44hhdy3cge@qschulz>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
 <20181120135508.paxzs63cqy2llc7d@qschulz> <mvm5zwrn8zu.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <mvm5zwrn8zu.fsf@suse.de>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_141727_613053_F8302C5E 
X-CRM114-Status: GOOD (  19.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============7335947228432405895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120141705.jkolB9BEfED91zB80wphy-UMkP-X13Vtv9Ozl9c2Qnc@z>


--===============7335947228432405895==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n5xcw7r3bck7sftm"
Content-Disposition: inline


--n5xcw7r3bck7sftm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, Nov 20, 2018 at 03:01:25PM +0100, Andreas Schwab wrote:
> On Nov 20 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
>=20
> > You also need to prefix your patch with [PATCH net-next] instead of only
> > [PATCH]. This is specific to the net subsystem.
>=20
> Why next?  This is a bug fix that needs to go in now, not next.
>=20

Indeed. Use [PATCH net] then.
Please refer to https://www.kernel.org/doc/Documentation/networking/netdev-=
FAQ.txt

> > Use scripts/get_maintainer.pl on your patch to get the people to put in
> > Cc and in To.
>=20
> The same people as the original patch the added the bug.  Why would it
> be different now?
>=20

First, people may have changed mail addresses (especially maintainers)
and that is picked by get_maintainer.

Second, other people may have worked on this driver since the patch was
introduced and they might want to know about this change too and have
their word on it. This is what happened with this driver. Gustavo and
Heiner sent patches since then and they have already been merged.

This is also part of the contribution process which is defined here:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

You have not answered my question yet. Does this fix your issue, yes or
no?

Quentin

--n5xcw7r3bck7sftm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlv0F2EACgkQhLiadT7g
8aOEgg//SEW1tvlbP8HIMI9Azhv0DP9ED+wigV9oT0h0ZxbRMpVqwKOSlT2sJX8m
Q1qYCfyePxN5+F7ALFT4iYHmneUqPTkX8fbDf+Ij91O+O77lk+kgf69TdJhIugaM
oH68FXs9mdkZZElqxMG7iuavsloLOaz8nPlbPpLujWkD+ggVUlz3m4+d32T5jY8P
nTxVF/cij8U2gjVBHyHrTde7OpnD1tQmGoL3C+yLSUpJsuWBfxp8twq3g/YXNHmb
5k8YPl23lNSvscbh4j41Vo/yN326Ooager5AViiknhAYfPLbukotSyzH/hAx9KcK
SRnuqMnBNlgKZkaRGuWYGqbIf+Rq14f8DLntOCyBUP/pdEHApHAlPLzwF/qHS6k9
QsW1Rxck6fDmmUGdYxlRsJLpjkQjeZmGgn1Q24ZbhxFC6s8Z7f5cmgeL1WBVdkhH
AKhWSwmYB3Bsp8OtFcsKvNC/6jMGBU4BAihVO6DUhD8t/OyozJdaAy/pu614uIYN
IcnZ5dBXZ+7Jh2sLC1M/Gn82g0XPr7ugf/OQMgzsh3n22Ybpo9ziguz5TeiYFaXK
qaB4BoNo003SUR53w9Iwy5KVGYiCs5W7ZdgcCqrkK4Ht9b7uPzBaqYwG0evHHhgw
xL/6FgQYLxCPn9Ccg/P6ytLiC+MRN7FXzuoldiNtlmNQeHvzUmI=
=85Mb
-----END PGP SIGNATURE-----

--n5xcw7r3bck7sftm--


--===============7335947228432405895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7335947228432405895==--

