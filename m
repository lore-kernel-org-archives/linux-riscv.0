Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891D7C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 21:11:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF0A20757
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 21:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VNeCzj0K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5RQJj11"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF0A20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IxhoAptAEIbrELfNBs//Yoz86/kxLbkA3JF26cr2Jr4=; b=VNeCzj0KgW+axEoeif8mWVtJF
	cIeJf/D4NviQZUksFfXdjocGnGUNfu7fBt2zbzDoG0s1vacbIio0p3J2HXuAspfKFdVVcBnIKoXv/
	iWPuYpKQ4FmW0Ogg4pR+srPoqcdgIEYJEzMRagWHKukzruZ7MuArpigEkXbiRZmYE6mf2gM3lvC69
	I3Vyg/YFR0MDXW+e/12lJhCxb398V8VMCu21Q7f48u5IZquF9onZ2ivMnysLkgTCHgkjlBE+TAKhr
	c7YV/uFh+8nFLeUmtYULuY0jKkUidJhNvIYsClHJYX/VwcP038yq8UszWGTuUaq75ZYmeMHmwOD/E
	HiJ3t8vtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka3aY-000344-PM; Tue, 03 Nov 2020 21:11:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka3aW-00033g-US
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 21:11:33 +0000
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9D7B207BC;
 Tue,  3 Nov 2020 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604437891;
 bh=CP4CcVYGwLAuKW0InrArv7u2uP3dgV+GP26YB2JQaTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s5RQJj11L+Lccv3UkvxIF/sh+5XJgeUsQF1xOAtGPKVTTPYBUtO15E6hgxZ21CpWB
 NZuvkVhyc+Lir1EkBOACcJt6FSd2IiRNgnxdsVQkiPP4QaEj/Tk8qkgqSbj83x1T6M
 OTay9PzzQAFQarMumAslccvAO1D56KvWWEa+mjBg=
Date: Tue, 3 Nov 2020 22:11:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Message-ID: <20201103211126.GF1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, peter@korsgaard.com, andrew@lunn.ch,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
 <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
In-Reply-To: <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_161133_088050_7B70105E 
X-CRM114-Status: GOOD (  15.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, linux-i2c@vger.kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4092076963647387756=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4092076963647387756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 07:50:14AM -0700, Sagar Shrikant Kadam wrote:
> The FU540-C000 has a broken IRQ and support was added earlier
> so that it will operate in polling mode, but seems to work only
> in case interrupts property is missing from the i2c0 dt-node.
> This should not be the case and the driver should handle polling
> mode with the interrupt property present in i2c0 node of the
> device tree.
> So check if it's the FU540-C000 soc and enable polling mode master
> xfers, as the IRQ for this chip is broken.
>=20
> Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
> for Sifive FU540-C000 SoC")
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hx3oACgkQFA3kzBSg
KbbKIRAAmB6/sKtZ7WE4OQbGRQft8f+GgZMLuc1AT810RO/vUmKK7QIfNzdGNhVT
C2tgYQq4TvK05D/lldsDakeow8HfI1DmrOR2L2h2orzNmKaq913NAh1T8ezTtsBE
V74PwyqTp78V95uDvH1nW7ms//l0VGMZ3VPPkqR1ob8kwI1Oc7U8/yBbINuNGnKG
NhEpTcw5Ajvnf1hooWceZ9bKZrPZSbSf8dpTtiV6RllK1h3LdDogTNEFP8eeN/qY
wi3J648pO1y6iwUVIb1+nkZDR96snSHCg0FP6JjjpEi9e1TlSfXAyx7UqlL3FjcT
AzueDgAPbjj1ym7IRDN0BGVtzKEHpHFeVZqNt5OTlnuXBKn4UXN7eMd7xCFjZ48u
FNKkQLAId2WEZ08it1R9cJShdJSqq65gegs1FlYXrTS4fuVGLlFKUEDplk2NPVhp
KcWr/Hs9GG4uq7bFqt2X/v2v5hfGtDJ0Qa50hSYZ5Xqyu5NR0AKfzLMhIX94x0uW
gOfplo8UCK57UtB/c2P7NXTSRnXoDBz1cMiWRgMsUfBXVGxUGvVZ+lMw7R7LRnRj
wCfXDgytTWVW6Yzkp05tpnUkAJzN85o4olfdHouct0P7IJ3bjq+yThFV6Vvet4p8
f3hWLBHzbQBR0KGz1l/qtIaH4iYg3sxl74KEx1GB5VE5zp0NELg=
=LLzu
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--


--===============4092076963647387756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4092076963647387756==--

