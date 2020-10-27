Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C42FC388F9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 11:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32C622281
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 11:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ndq9y5iW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F32C622281
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7SDkFY6QOCOtrbifnL+SCHquJnb8FADfbmDXHqgYQVM=; b=Ndq9y5iWdDMZmpIK83/8vrQSu
	YvMchH7y86mTqeQ7sgNaA+gpkG7Vbk9ZOUb1L87EDp3OL/e80MmbD5slKbIomDT6K0egSIi+bnObj
	uS+4N/wRjihrzXKj9SygQA2Uq8Tey2f16jwXj0rfvQIeXf5VC8yWFH5rxIZ7U99Gjy91DceAhuU6D
	eMmi9O0wax5wLndSZC2XpZhNntmVENWDmeRvgfWXZa74rdspR01U59rnreMAUemmSCXyhbbrydqvj
	x93zKNc66aaGgyNaEib82Z+Mx1IkISWf7CdHn+5Ze7ujazpmAGsyBIM1YZ0W4pA65apVRJ8/kj3Gk
	hdRBnCMrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNVP-0000zv-AJ; Tue, 27 Oct 2020 11:51:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNVI-0000xn-Jw; Tue, 27 Oct 2020 11:51:06 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21D65AAB2;
 Tue, 27 Oct 2020 11:51:02 +0000 (UTC)
Message-ID: <d2b6693aefe6d2cad03432366c48e05cb5c8d3a3.camel@suse.de>
Subject: Re: [PATCH v4 0/7] arm64: Default to 32-bit wide ZONE_DMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jeremy Linton <jeremy.linton@arm.com>, robh+dt@kernel.org, 
 catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2020 12:50:53 +0100
In-Reply-To: <9bccc5ef-9457-044b-7193-d002a395e461@arm.com>
References: <20201021123437.21538-1-nsaenzjulienne@suse.de>
 <9bccc5ef-9457-044b-7193-d002a395e461@arm.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_075104_804184_5CF46A17 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-mm@kvack.org,
 robin.murphy@arm.com, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 guohanjun@huawei.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3607429048760178659=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3607429048760178659==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7KtHL8JmijrZUDdO/9dK"


--=-7KtHL8JmijrZUDdO/9dK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-10-23 at 14:05 -0500, Jeremy Linton wrote:
> Hi,
>=20
> On 10/21/20 7:34 AM, Nicolas Saenz Julienne wrote:
> > Using two distinct DMA zones turned out to be problematic. Here's an
> > attempt go back to a saner default.
> >=20
> > I tested this on both a RPi4 and QEMU.
>=20
> I've tested this in ACPI mode on the rpi4 (4+8G with/without the 3G=20
> limiter) as well, with Ard's IORT patch. Nothing seems to have regressed.
>=20
> Thanks,
>=20
> Tested-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks!


--=-7KtHL8JmijrZUDdO/9dK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+YCZ0ACgkQlfZmHno8
x/7nHAf+NsPBIeE87IsQQDXb+Yj9HG4BT9qoFjLz6YOJ82f2k6RHxorkNMBGv/Kn
mh1U2wjHbKJvDKSHIM/qsvcbSI8ZKQyqQBLYXintA5koBEw88a1UA3OXCqbs35Eu
5s4sHfoPVAAM8OE9b7+sKTNBFXBLngmBotO0Tt9dAXrTEPNLfPu9pXt22zGb2gCy
34Sv2032HmUGXMX3Dd1eEKPsfqYqHDsBMXmYsh1GrV5/xIJ2ClpD3yM7xjQ/PNtI
c2VffRjFikj/PUTf8I1HPDOeSwX101QkV3Uq9TatMWsLwQYv9Y5EM8Gz8XPPCDF3
CDY5pxiYqZdowQMQ53hVr9yjOjogdQ==
=XjDo
-----END PGP SIGNATURE-----

--=-7KtHL8JmijrZUDdO/9dK--



--===============3607429048760178659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3607429048760178659==--


