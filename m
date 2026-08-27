Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2714C61DB9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5FCA3UlPKXj8eHd8h9+vt9En0mjmVy5P++9kJe1Yls=; b=eOiz/Vnsy1tP/+Lt9WXWDO/T/f
	b7L0HKwwNjsIZPidWxrFJF6/TXdQQWOVMMiB1dEnPnBsaT99bdm89mCDEEGSR5rIZAoihi80c3aHA
	QMy60cEZiN6WutI+UdvTF7JTsSXiNqxHgCZE6n6LeNPGVJ0WKhPI2s2UrGZx9XTk2LxVEDig1MiKD
	nuMsYzuTDLmd0SmaNSAuOOCzuoFEefgRKrEIdAodSQDbhJ3MeinORVinuEiURRXZKH1ZCroEfS6Ku
	nXAfyrxk7seu2VmKGahxM4N/UNrh4zHfvezPa6KEQCS+cCVb/6Hm8CazhoYesHEGMmFIm3U6ahd07
	3JD9IJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTmS-00000003Urn-026D;
	Thu, 27 Aug 2026 06:40:08 +0000
Received: from out-39.mta1.migadu.com ([2001:41d0:203:375::27] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTmP-00000003UrN-0Xqp
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 06:40:07 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m3EBblnKDAGIdH9tcjTA1Ngw0Wg21uv1CZPG3SHJxuA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787812801; v=1; x=1788417601;
 b=uMNycoz5nqVOQ9i8+cdDP+jjzmN9IhQLfPDokmNhzeXuUnPueUqSwQHBERR0Ep2XtYX15VGR
 M7ANjiZvBbclQhVluxV9f7r8zeVFhNZpqt0LuTVNJef1RksQ2R2MrVWylo22q8PXn5pHRc6/pP5
 xJjNyxYk8KUkPEFAkbwHPvGU=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost (8.211.180.184)
	by mta10.migadu.com with ESMTPS id 5cc20cb2f0893b0a;
	Thu, 27 Aug 2026 06:39:59 +0000
X-Mizu-Trace-ID: 5cc20cb2f0893b0a
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Thu, 27 Aug 2026 14:39:49 +0800
Message-Id: <DKZIQPBOE02W.2DFMAOQGYO442@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
	<20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
	<20260805134119-GKJ77474@kernel.org>
	<DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_234005_485281_0D3F97AD 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: multipart/mixed; boundary="===============7109729337059394207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7109729337059394207==
Content-Type: multipart/signed;
 boundary=f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 10, 2026 at 04:20:05PM +0800, Troy Mitchell wrote:
> My intention here was to keep all board-specific pin configuration
> overrides under a single &pinctrl block, so that they can be found and
> maintained in one place. Using a separate top-level reference for each pi=
n
> group would tend to scatter those overrides throughout the board DTS as
> more groups are customized. The &pinctrl block is also placed immediately
> before the &i2c6 consumer.
>
> Would keeping the current structure be acceptable for that reason? If you
> still prefer the direct reference, I will change it to &i2c6_1_cfg in the
> next revision.

I withdraw my earlier suggestion to keep all board-specific pin
configuration overrides under a single &pinctrl block.

After checking existing board DTS files, I found that the direct-reference
style is already in use. For example:

  arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts

adds the board-specific bias-pull-up setting directly through &i2c1_pins.
Likewise:

  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi

extends &mmc0_pins directly.

Both forms produce the same node override, but since the reference-based
form is already used in the tree, we should follow it instead of introducin=
g
a different structure here. I will change the board-level override to
&i2c6_1_cfg in the next version.

                                            - Troy

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao/btSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/6QAEA8dCtfup87U2o
snvjwoIwNCa2Z99Am38hnnyreNWzGecA/03n71wIE+T3csVbRbAT21+VwQ2RuK80
7pZ57h/HWuEH
=bLKp
-----END PGP SIGNATURE-----

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64--


--===============7109729337059394207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7109729337059394207==--

