Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2BBC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 13:39:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7346323877
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 13:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7346323877
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q6404MOeuVAkNEbiV22suouicdjxAWcK6yHH2DnKxMo=; b=xQygJ0zI1ea7LckdMymfWy5oR
	wJ7h2MTPdmEyC8B7FetRc7pvToqKZXaCnsIzxAvRZ+rt7b6cXvyveksCSDN1lLRIfPq+AI840ZVyi
	D8g0lK14unSDSUHzxvjEl2U0rzQuavhuw38KhA0Z/ttX6D2AqY0236smBQH9A2n24WKbbWWe+6L/4
	PR0kfF678X+xhzlbwACpnQL4jz5GTUFDMyaSRrxEvoP6nl5hl+awHWWz1p9MpZsLDWPq9ilz0GYhM
	/L9WsrmU+wZU9dVEhcFevA5D0Ukoyx8cLOqlQ/8sXhEqCNnb/VzcL8jmYiZpp0JL8gSaoPFktY4vp
	xfjFvAfAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2aAu-0000Ny-9c; Thu, 21 Jan 2021 13:39:00 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2aAr-0000Ly-8J
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 13:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1611236325;
 bh=m6qKMnH5Rh7C8WKydAeDn5ZLGZSTdrd+y3h31CvJaXw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=YnsxD6IPIWywl4OCg0aheB/Ap+2jBzZqLwJGHvU6S7AWqybi6+ugjcgUL43KHqyuY
 Y08G3SI8NUy/FPVRzaU4lk+4FsqUYeYNpSqJsythbRu6eWWygfAgyp2/CpYlj3Bk0C
 vybRRI607dOuxC6XhXdCMud6RKZxieESZmQCCafI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.209]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1lOfOn2yYq-00M1z1; Thu, 21
 Jan 2021 14:38:45 +0100
Date: Thu, 21 Jan 2021 14:38:42 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 1/5] mbox: add polarfire soc system controller mailbox
Message-ID: <YAmD4h9vssAQlXPh@latitude>
References: <20201223163247.28923-1-conor.dooley@microchip.com>
 <20201223163255.28992-1-conor.dooley@microchip.com>
 <X/BuucfqPGpE/S1r@latitude>
 <3425400b-889f-5393-6c26-bf708f2734f1@microchip.com>
MIME-Version: 1.0
In-Reply-To: <3425400b-889f-5393-6c26-bf708f2734f1@microchip.com>
X-Provags-ID: V03:K1:zDJIKr9tFywt30l8s1XGjz9gQyZUTSl93guw5L+Qgm4G/SpGErn
 s3oNEn2k5zlf2Qq6qi8WIxjmTJVMJuZ2MAAyk5IyUrcZyr7lCg4XDfEouH/7O9VTo78/9Y7
 M/GxCO/CTDi9iUrv6s5XPcaeArsbfT+Sc73rYLmjDCUYq4n0pws6VZFtQhDC4B9Z2GnmBuT
 vCji8WC5IdwAabHKvFTNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g0LPXy86K5k=:XRoQ0fs5PIE5H6NSS4zlTS
 MgfYcLaX6QgtALwY1hQRUL1XUVO7m5ZTOQxegYUX4NCXPt4cBvyoytqw0EMqqySfvvCxZdP4Q
 OsgGY/XLwXTNoNYK6jj861y2q1GaKFk8RDgYUEfUPwHJyq4DCdK7dJ6NHKtquexkJGAc9o8d+
 SwE+VmUtpBdJkj7qjdpWHRcEJNS8/t1iyof9yQvkCB4hfilqk19j8i18/zCy9XRU8ZdwBRC1e
 BMrllrlEYGkObGkzIbzAOm1jTu353eF1+5pfg/+XD/UKyYDJ3uFGdHzvkmi2loT3pzS6KC6+Y
 qrMdcH2Th9YD7n7t3UwZYnD3VoRc6M8pY0VMQIs5NgwmIWJjL0TC2DJaSTKcrdoXSDSs4MJY0
 0SIBdn6u8X6tMOpcVpnAhfgL5q0huAsTfenOwCyANIOasr+z7Nt9Gb3nYtvg2AbnHeRALKsCB
 PR/6fSr2vZWep1njUsAFTYbcr2rt9tZrMNeEImDDQuziKoQH3SwNFg9bvPTYdfmyCsrAgukUA
 Vjzl0TC7L2z5Kns6aQoS9PaZQOY4D/R4e6s++q1M9YUZHr0+CqPADm+gaZshS8RmexizsisDm
 AKa2e/1xYgnAdYVzjlAFs4F0KnwX7S1VNqiOLNVhQK7u6Jq8Psl+jxEZ5xx39P3Kxbt7rfd5s
 IoPGhZAwO/8mySlIcKIKpJM5/E3X7r50FV5nPkutaFpHkjLrax1fKqLEA29Y5GiCwsYK6K6QU
 fUGi2TiRsMQzwsmp813je1z7WjdXl/a3obY3S7GkEAK29xCb2OSb9Y18OQLkMSX6Z2p+y2wtM
 +mygkLHsNQVTKwDiy1cEaBuJlNPnu2dtI/FOItujzbIGLbEpcGvPXNvRSn1w1rss19j0m01j0
 hb5amxdwfKhYIgXs3FHg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_083857_518181_BA1C4FBC 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 Lewis.Hanly@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, Cyril.Jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0434054294224298839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0434054294224298839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8R9FYvCpqVMARl9"
Content-Disposition: inline


--Z8R9FYvCpqVMARl9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 12:46:42PM +0000, Conor.Dooley@microchip.com wrote:
> On 02/01/2021 13:01, Jonathan Neusch=C3=A4fer wrote
>=20
> >Hello,
> >
> >I've added review comments below. Some of them might be more detailed
> >than necessary, and reflect my opinion rather than something that must
> >be fixed. Anyway, I hope my comments make sense.
> >
> the more detailed feedback the better in my book, if i dont mention it yo=
ull probably see in changed in the next day or two

Great.


> >> +static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 struct mbox_chan *chan =3D (struct mbox_chan *)dat=
a;
> >
> >This cast and the one at the end of mpfs_mbox_rx_data are somewhat
> >uncessary, because C allows implicit conversion of void pointers to and
> >from other pointer types.
> >
>=20
> true, i had put them in thinking it made it more clear, but on reflection=
 it doesnt.

The main problem that I personally have with explicit pointer casts is
that they are accepted by the compiler even when they would be a bad
idea (casting from one non-void pointer type to another (incompatible)
non-void pointer type), so they can hide a class of bugs.



Thanks,
Jonathan Neusch=C3=A4fer

--Z8R9FYvCpqVMARl9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmAJg9EACgkQCDBEmo7z
X9t9YBAAhvyAmTwOyAFdkDT1o54Z2auXNT9IW9/rT4Cbd1wFFpS0Zm2KABkKGTug
MGANNMYZCAwMwKclayzGgGLRegIOII03LeTVaTJJHlhnNpgvDv6BXAl3GuuhcWvK
guPfLuj8F4tlb/t/DH4oAnq7F2oL460MpSovrVUi5sXQtC8qM3iJkRoN2yXTicGq
c3drOTaWXmm1FcrQCl5tklcRhitVuG/PZALRsxFjU/wTOI05PXEmI8RcQLWlFeSW
6/9N0r5HXBu9lBPRjqHjtmFgLQMo1TcBvPotmxDyxpMSsSRU2d5WMqnNfX4n+zr+
m2NsfHpvUalCpd14G144uSY+mWtqv2N+WwAHw89gQhVTBmqaC+4+qlWNFT1kAU1N
wlL4J0abJITEpnwRSFVugU5S5Ia/Z8rB0glkAEQRdAGkXc+0ZgYOZKF+JHwtmPJz
FTXmN/nX5YVQYdy1XKKY1aOH67cda89yUmHiVlRpLheQ/Vkr8o2AowvIs3VICa2H
kA0BqtAWasEDSAQCuO2jlAtuMdHiEnhW1WLfGnjybbr5AOLYcxtOvX3j/v+/fAWe
DG1lpRQsqX2oWkIwgtkPYEQt1vgEdl0b0s97oWibwS07fNTJv6sH58pNyC/AUoXQ
g49iSh1okNdw2Qk5MjNEYY3LD8cCGxJr2xzvFyiMJjujdYncvV8=
=3qcO
-----END PGP SIGNATURE-----

--Z8R9FYvCpqVMARl9--


--===============0434054294224298839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0434054294224298839==--

