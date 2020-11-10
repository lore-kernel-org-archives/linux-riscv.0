Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBAEC388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 13:44:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBEF20731
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 13:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPEVqlZQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="onGLtCfW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DBEF20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h2xVTJhK+SjA9ouhLK4/NujF4ngbi0qBwKp0/MdBCAU=; b=cPEVqlZQesDy3FT5BzcgdjXJx
	trFfXNqMiFo8/HfqR/F/2taHtP5QItOyioF9jWg+UkP4si+Bzb+Tmd7hz0B3tNzigYlovWbjoTuVi
	MAckWQDkZ4fHNKhmhtsi7aFHNjlml+puudZfN81Orgitowub92rPAuEWn1Mp8BATPThcUEiWXBjpi
	djl0dTvafFS4mP0w3KBDf6P3iPxLnYxXhUm7O5GE/tp6F+aTWbaEVPoAmZHxxP8XB7DTUN5WI80qE
	DYtcturHa4W4HQdDH1pRXq3moQD6LLg372VmnHzPDqycLcaThpjn0/WdoeaxDO/R1xusawS+r6106
	Qj/n0J/yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcTwD-0001ib-7n; Tue, 10 Nov 2020 13:43:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTwA-0001i3-La
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 13:43:55 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F84420731;
 Tue, 10 Nov 2020 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605015833;
 bh=8a93PI75TfxaQ/45J7emDK1Y8Q31siD/1/I+xtXuprk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onGLtCfW9xKqxLvawwxMVgVhxER7U4G8YaW6HCGl5H1Oc57M6y6rsASGGm5EV0csi
 08nKnppFYrxJw8xcq0+KhtqR5TmjJyOb7SOEzbBBDCuiYVgtRGwCDDyPsPKohqgvzK
 HqyN/6m2iyy9nSjZprAZzrqY6m0ood8Ew2dHCvLQ=
Date: Tue, 10 Nov 2020 13:43:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201110134338.GB5957@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109191909.wfuwpddng4rdn4ca@mobilestation>
 <20201109202052.GL6380@sirena.org.uk>
 <20201109210531.wp4dmug4w2r4kh4p@mobilestation>
MIME-Version: 1.0
In-Reply-To: <20201109210531.wp4dmug4w2r4kh4p@mobilestation>
X-Cookie: Disk crisis, please clean up!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_084354_793333_3BF35523 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============6263735975148743317=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6263735975148743317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 12:05:31AM +0300, Serge Semin wrote:

> If by general Rx-only half-duplex transfers you meant that the client
> SPI-device shall just not care what the MOSI level, then the only
> acceptable solution of the noted in this patch problem is to fix the
> client driver. Since in case of the MMC-SPI client device sometimes it
> does care about the level.

Yes, that's how the API is at present (as you say) and is the more
general case for SPI devices that I've seen - I'm not *totally* against
adding something to the core if there's enough users that could usefully
use it but if it's just one or two then it seems like it'll be more
robust to stick with the current API.

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+qmQoACgkQJNaLcl1U
h9B0Rwf+KopRKnXYo5wqZqMUc6Z6nfo2YpwZsWiUO1Sy8+hG9keAbGxcnu5bOGDJ
90r9oFQxqTjVPKZ556EN5XNqKBijwQMnBPjvCBnfV7U31rvhcd5xiOMh6GXCi18H
yuvD88KqsXweetYSO7EHqr0MARsZ8OT7khH4/U2b+37uvhfIHDsICIkPHRp4jQQH
p5hOgTE8uoHNPz6pMzEBmXEMq/yR3Hvt4gMSPAioVH/0sKgB77fMlAdpDyXZewl0
tQiilBL5bv2mq9IDl/4J3oJf0gM4VT2k4oOehY5wpaXZgn5LJlJVl7DUxJBlmG0r
4kUkW4N97ZkMpwo/MulisIT+1LpECQ==
=ZOI9
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--


--===============6263735975148743317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6263735975148743317==--

