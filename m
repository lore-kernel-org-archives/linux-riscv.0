Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34034C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:02:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA31F20684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uugIvTys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u7lmcYPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA31F20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dtANTOaO9YZexvES4wnBZUJd5/plHhWeCsfwyOXiEVs=; b=uugIvTysqJs8X9Um3F6klv3W4
	KDn+W/bnt50jfj+bqw0wk521prPN6ePuXMqhnoHxcTOqES6TGVTDJYdeEtwXQ3Gl9qVvlujKVZjuU
	r6ykTDSe9Y7vHJIhkkxl34fu4HaW6aO2c+BqLCeIFMQq74f56nSR3bQHhj1B6ZIppnegr9uKWsULm
	3f7UPCZ0TQkxfIgYt/wYyAcYvE6UEDHXMCpMtgF0eL67CEjXHUGaWKxNNm+yvaWwIUfsYTJlNp4kk
	KcjiFACIKQfPqA6dlnn4YVlR0GrMjsuAXuOrfEjItkIjW7cQObn01qOsp5kD1zhsMcVUx/fZ9hlHS
	+stsd6sug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP9Oy-00043S-3B; Tue, 20 Nov 2018 17:01:28 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8lH-0000yR-9X
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=66iIlPCfZlFO5GQa3do0QVvy8oEyyGVSFc9uHlBtYRQ=; b=u7lmcYPuVuZcC+NX5Q9a+Pvpr
 tze9YUcQxwXIGoPiaJQyPFQw00dcXM1e6XgyZD6t7LVZ7bCWK0Ed844NbjZwOI4u9XJ4udy5bzRtf
 hEtoL2ZOe4t3ogAPhrArejW0i+mIHnlx/b6cMpFg8dbodes6ZmyN6N3IDKR/WUbh0fE0/LQ1SZspY
 b5IBtS0M/2fxKW34jqXHVr8RsE8Rr54V4fxnyTRmKs0eiKJ4jVA5w9pj2yk0B5R5oOn1kYfmOSNW2
 GVuz8+zLm2mwLhLgoPqFHBYxng1c8pl7/qYQKWkzcENblOIMO9iQNeZrDdEiIaFdQyRaCV+KMVhJ+
 hjKZ9Kx6g==;
Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6V0-0006c3-Fv
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 13:55:31 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id EE28920D31; Tue, 20 Nov 2018 14:55:19 +0100 (CET)
Received: from qschulz (aaubervilliers-681-1-13-146.w90-88.abo.wanadoo.fr
 [90.88.134.146])
 by mail.bootlin.com (Postfix) with ESMTPSA id A7D0220745;
 Tue, 20 Nov 2018 14:55:09 +0100 (CET)
Date: Tue, 20 Nov 2018 14:55:08 +0100
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
Message-ID: <20181120135508.paxzs63cqy2llc7d@qschulz>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <mvma7m3n9l6.fsf_-_@suse.de>
MIME-Version: 1.0
In-Reply-To: <mvma7m3n9l6.fsf_-_@suse.de>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_135530_532300_2B7239EE 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: multipart/mixed; boundary="===============8443094698516533239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120135508.IQQwu-9g7Ggl1Z_d8up1OJSJDZQkV_xIkhIFMU99QLQ@z>


--===============8443094698516533239==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntnyqwowhkgpjtiz"
Content-Disposition: inline


--ntnyqwowhkgpjtiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, Nov 20, 2018 at 02:48:37PM +0100, Andreas Schwab wrote:
> Don't use locking phy_read/phy_write functions while inside
> phy_select_patch/phy_restore_page region.
>=20
> Fixes: 6a0bfbbe20 ("net: phy: mscc: migrate to phy_select/restore_page fu=
nctions")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Have you tested this patch? Does it solve your issue?

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
anyway since it's to be done.

You need to send your patch as a mail separate to this patch series.
You also need to prefix your patch with [PATCH net-next] instead of only
[PATCH]. This is specific to the net subsystem.

Use scripts/get_maintainer.pl on your patch to get the people to put in
Cc and in To.

Thanks,
Quentin

--ntnyqwowhkgpjtiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlv0EjwACgkQhLiadT7g
8aMwkBAAlxyAg33/B6pRIqeuRGnreLcxBPkH2jhQsxDU/vaKz8rt51V2AVQI6DfA
A2cLtqV8S0yec8Z3ZoD4bQGCqTwRm2pm/28jILlfZIHrX6hkDdi1Iqtb1cDh2oc1
7DLnPtg+t9XHQYeYbouDw1bsNmDToN/ZQHU11r8NPUdKFhgs2On0rQxygOqKX6DE
ZJhfdnFuKGeqKnrbUZYy4CU8o7n3cCu0DoMQP48Etn/K+mlHnvSyj4r/RFDw21pD
INhNvFCjcfsKRbHNx5i48KX23wb74tec11J7Y95MLxoRRxU5F3hWUhGrrV1br7M4
JCz76BsLnIr+wmZsoEEfri6yWbeoZIq+WJPW0S1N8BQhez+DWZCLyLjpWawxuWFQ
ohveKoEuR4NXjhuqLEPvKHTISAG4tHkUiLV9M8I7zgLUOvdd17E5vA/G6SAbuTc7
12IWm37LdUp+9e8Y9rTWdubBg51bfIUb43KriB9hWek3XVswi7QkVKEuFzLxz6Ws
KWXKOP0IaxbtS/i6Rdn1SIJ8GTfoikAzDEMFgNths7R8Fx1fvONMEKTeYb7JF5AF
FWad5HJm3Br6fZyUqbvpFFJ+poebiqavH1LNE8HjTxbfnuetu/RPZaFQ+JO98MBN
ewcszCCIwphpF0i8juSBwr9nRRBZhNZFgpEvKDbzl88VfyU37yc=
=FCjc
-----END PGP SIGNATURE-----

--ntnyqwowhkgpjtiz--


--===============8443094698516533239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8443094698516533239==--

