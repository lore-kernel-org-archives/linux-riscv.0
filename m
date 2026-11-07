Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D4606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jSfSAW/4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=m1DOEFTl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H7qpPyi6QzgRLb/JBYHZqdghwpOXdZN/OTtxI46oIKc=; b=jSfSAW/4G6tF0qM7YHoP0sdJly
	egG4Hyy11pFw5yaJp/q+UyBek9vVN1X+NzeQ9Kgv8DihdSUBr+NaU+huJlE0WSMzHTJBNb+pCAXrI
	ogtu7gro3jQmbvuhBtTqlCczsgrXDLzL7+Ov3rGi7sRRp41TbZbWyZFDTQBMA6UrzZfCJ2vWl8nd+
	tDqWy3rJKWbJSreFV1KfervHsmiYvkpgABQiz1CJUIImoxeIydyNpt0VI3JR5/9wMbu4l2mG1Sq+K
	gSwQjpRnc5qMsUtvblZEDypRneo+chzwsra1QbsSQTMtw/EPL4ZQNL6uEdeYOF4XJk/hFWCd043Uf
	xN1lNGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfrg-0000000Eh8B-3UxG;
	Sat, 07 Nov 2026 12:49:48 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfrd-0000000Eh5p-0Fgv
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 12:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794055719;
	bh=CaW/VQHTPMCaOIjymW1vJwqHbfTh8Y4QG0yBDvfrK/U=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=m1DOEFTlCdXVcz+vTa564mR2VqW2juSOGzuaQ3FhqViYxhR1y5xq67NQRdzHE2+xm
	 JR6/A583isiF60Vo6/FRsziJ5Ov75IAYQmMOQJ6Kw4VrMlUgUY2AybPeR1fTgXspju
	 IRtqBHyMx6X5NkUTNrL4rNhAenaf2gULHtWSnegE=
X-QQ-mid: zesmtpgz1t1794055717t9ee4a99b
X-QQ-Originating-IP: adEHd0p0H88g7XXNw58gtXAVSCXWiNn/74yyaDVntEE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Nov 2026 20:48:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18126235862293624817
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sat, 07 Nov 2026 12:48:33 +0000
Message-Id: <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sarah Emery" <sarah.emery@canonical.com>
In-Reply-To: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
 <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8nUJ+DkM0p8gFPzkOaCbOOf43NV9Oj1tsFmG/Vz9akNEoeQrESkD2y2
	wJcUjUoRzbLNlFUq+BMo9ESaYa2e5h4k9KdCTd2u4eml7Sah+Gqe/LGwz0HdbednUZtSBOg
	vHMnzNIpxoXqctpgTUsY9cbfsiUz4yWlIkEowZxoA4XlOdXgKFfP8gOYwukXGok1/XrN1Rb
	FxjI0NbZERxbjh2sSMu4YCkwV2s4sJtMwjkyF+yLK9kLqljH3d+ExgxrXOM224vS2wbQutY
	DF7QJFyPseqrpbZOUMp/0WABfQlcsIwtaGtCvXF7bxG/8IhbvBXzPfZFSRcwSmeLre3IEWv
	K0akMU7Dg8yERpfnCStTmEOSHTCbKn0mqGGlfVbiGEqvjW8834tA/DAZr9IXRO1dCn+7y62
	sEF2pMXEyC3eK0PMA9n00iW27Vzb+eOPopLMEuj0CWp1xIjcyh0sLyRVMvpWj0Abc2psFgT
	MM1NhEh7MhLCTaB2FSJnKw9wqXShSDi7jaqaAwww7BBp4U9TqXfz8ae7a5HDn1KdETO8RPD
	6a657ReFXJCW6kWaByygiKxlUOUtWiXFdgyMVvtoWz8hxAUX8cpjBjDA0ZY6HycwWxyZKZG
	b7DCv/JTDeZlTigZXTxIs0zGQR316S8tn+FCYi2KdVTMddgn+8fx+ljJbXjaEJasmqcR87a
	yD158W5hdJgMGvF1y6aRh/D1GKaZQ9pdu1FZkyPpO0zLmFTqJNWrLB6DRqELCv4iwnbfTx2
	RSFx+HJLIFQHYOoPbTk8xoslIhJlAWL1O8VdAkNdv5fVL7D/3/sHIxt23MnbAqWWRogZlg2
	q1U+KLbw69x+DoZ4KjiGTIHaSg4j4h7/vQ4dRDww8QBLiymQlOwmEkXa67t6xvB5t2KveAQ
	JzRHxy1wMJzEcMHlfBcmcsaphMlO+/8KUUgWo2sviVMCnFUYKqV9pA0bEq+15wsXZfjIxDq
	9jdAtTtnjdHkwLc7HGjWugIFYVQMrqaJoI7iZUE3qMgL9/ZiiDglvQVdKK71wUHUNmYmx4s
	ku/fp+kKaPDyOCc5Zo3/4oYxvnLA2MSaF+Dm1b7hRmi4QfirGkUZsO4zyXqKmFH7hEX7WhH
	V6+A2gI1V/amfhX+Wa1zq0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_044946_757935_D746CE37 
X-CRM114-Status: GOOD (  16.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8228579968411595067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8228579968411595067==
Content-Type: multipart/signed;
 boundary=4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Sarah,

On Fri, 6 Nov 2026 17:25:48 +0100, Sarah Emery wrote:
> > +			uboot@210000 {
> > +				reg =3D <0x210000 0x5f0000>;
> > +			};
>
> This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
> 0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
> partition from Linux would erase it.
>
> I think we could split it like this:
>
>     uboot@210000 {
>        reg =3D <0x210000 0x4f0000>;
>     };
>
>     var@700000 {
>        reg =3D <0x700000 0xc0000>;
>        read-only;
>     };
>
> What do you think?

The layout here is the one used by the SpacemiT boot firmware for K3,
where U-Boot owns everything from 0x210000 to the end of the flash.
The EDK2 that SpacemiT ships for K3 (including the CoM260
configurations) keeps its variables in memory and does not use the
flash for them, so it has nothing at 0x700000.

Which EDK2 build places the variable store at 0x700000?

> The Pico-ITX node also uses 0x5f0000, but I think it should be modified
> to split out the var part too if it makes sense here.

Same answer as above.

> The Pico-ITX flash node also has vcc-supply =3D <&aldo2>.
> Shouldn't this be present here as well?
Yes. On the CoM260 the flash is also powered from P1V8_QSPI, which
comes from ALDO2. I'll add it in v2.

Thanks for the review.

--=20
Troy Mitchell

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau8eISEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+uCgEAthE6bIYvOlzD
wqobCMr4ha0WNJvGiNXT/BT3N7SAiJkBAN4u1t6ku3jmGXMK3UEnU6i/5sdIj3X7
h8QseFaXeUUB
=84Ci
-----END PGP SIGNATURE-----

--4fdca5886438fb7c941b336a5dfc31a05971bb73792b2c2cbe0940973e86--


--===============8228579968411595067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8228579968411595067==--

