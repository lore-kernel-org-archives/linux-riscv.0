Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A49EC4707F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 19:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAC56124C
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 19:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAC56124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/Qup3wksx4Hbf3qjGTKqa21MuPc6mDRKTri6GiIRiI=; b=hHkheZdrY/cE9m9YrwQQxy/UVw
	APIF3YPmlrYXxBi73dlBSzuL0yxJH6+IL+oC8HDUAybRGmU+Sy/aCv6iS1zcdhrFob/U/SKQ/p8IS
	UlbawwljDMMpll7naoBmR5U72lz+7JjOM7Vv2B5GYEBDWkGHI+Nw3N5yx2XMehCSMuz2lvN8f7rci
	oGRJhPpbmXXJYJcdLrQuzVWfs4Qt+CnlX739+YQp1any5ygJvWL50w8gj/2lO2CMUoL0o2LSVCGBG
	OAOHg3JU4K6kEQc6IGr3CQlhN6MOhRFgGf2CJ2l1Tg19/rOelb8TiSEsBgUyUEsYCFds9eMHJAb5q
	OfxIs07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmLlO-0090DY-DJ; Thu, 27 May 2021 19:33:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmLlL-0090CF-8s
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 19:33:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC8AF6124C;
 Thu, 27 May 2021 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622144026;
 bh=TvQZ16/UGmoa9yxvoMiQl+XBpYesXD1RGo48P0vJEeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S8A/J1Wt9kaUM+cefTWoR0OhWmkX0nmg3+xppq7liq4bpSS31c84M+JNC+DzzbeK6
 E2nSIEs+V8coYUj04xCK89JhMSViUn4q35afuqzJMjvnjkgfCy8QVwhmanQ40F5tnB
 EjwNYmY1jBOO1KGS+sEvpgnx35f+RtfLjJu/MwqHUneu+Mma2JXk4bXAMnvgun2v2G
 C/6JpG0yKCVOTIVNGDpxBmq6DnIrh+DFhxEWf5OkF5Ec1Wuc9aqLAyzzVTlhAv5AKk
 x69E1iDmpBR9IFzJwzSeCW0e8cERIfXm2yqfFiAEwKQhHXxV+rwTSSDEYsJMiDYQkX
 YYnAbMWIn89IQ==
Date: Thu, 27 May 2021 21:33:43 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Andrew Lunn <andrew@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected
 function names into the documentation headers
Message-ID: <YK/0F1Usuccf90Ls@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-11-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_123347_380820_D04B8F0F 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4774660416140370482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4774660416140370482==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cf+dOQDvq50YH7O5"
Content-Disposition: inline


--Cf+dOQDvq50YH7O5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:59PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '=
/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-=
doc.rst
>  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It=
 handles an IRQ(). Prototype was for ocores_process_polling() instead
>=20
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--Cf+dOQDvq50YH7O5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9BcACgkQFA3kzBSg
KbZS7g//fLenLeqiftxDzn+Nkh+gHetgSFVjKOHR3pDLvod+2crf9gy4YORAeMOb
JN1kmpunXMagFfp3K3YGHZneFXWb1cEg18HDH3a+GlA6lf/IUpd3+mrnO5arFgOR
i1tODQo+WmgT0s/fdkKkX6BwX1Ygf9GYXnVQ6tQ3Tu8UVxUAv0bir7EZaFnlFsd9
oEcBBA+jW9Mu7LAkAaGnGglxDa1GtSdI3zc5XwpW2K4mx/ieaA8yyIpnSyLaIk5F
UnSmiQkmBvXyS/wZUWZ1Myhs4ChmDA/M5yx1mGsfIDvQ4ZNBribRPMb5rESBNxJi
0lPXfB5pUwZ7oB9IyJh5XDBat2LxQjuBQO6C6db4QqOT4IOLlIxl0UVcyf6+VyTQ
UPwZTXWSLV0ce9Q9VemkchMvV31MBb/iROORtuEAXuSXwA9MMJYviR+PXuxjejIh
aqmzjOhSQ10BH3qwget7vRi5RqACIFjfbTO4hB8kG0u3JPDDxw24vXGyDN8EweaY
arSb1K6DdxMLGANAMV65jvqw6EiMWAAt47xpZxBX4ytdYwA64o75NlNNOou4Fcog
TApQR7b2GZ3P4KGPJj+byQMVtJYVnwmxSpl8IPEm6+vLjdtIKDyLiVttB77X+lSn
KY3ROKLq3RuuV29eJZdqJIaRRDW6uBt7oGNoNsAzy0hgZbkz7CM=
=FkD1
-----END PGP SIGNATURE-----

--Cf+dOQDvq50YH7O5--


--===============4774660416140370482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4774660416140370482==--

