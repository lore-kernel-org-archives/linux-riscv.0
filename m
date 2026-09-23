Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0141C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM0rZEG3BnqvrpN12KGb6sUDNEfM18tJEefKxiYK2+o=; b=v9SKTjlwYxcXfNhLV0ajR77cdE
	+lfnmKiLYjKQOByJz0xGD5p3AbHvwwnqxNqrzNT3siuro0h+DJ0kDJZ4yGA+c/c5hV/9In7I1S4WS
	1Zh/c91rc+A7bChpIDRaknX2+R1V9U32JCx0lCZXxJCXYOrjlnZdhZX616H5+k4YvUIswT6ifzn/a
	gX9972niy3xs2zNGJ2X3KRFg3Bp/LHhuPdb1GviS2qSnK3ycj0/uXo8buKrWdY/bziK8IWIj4WRUd
	05VluDa2Utjds81FSbJlPDQsw4L9zz8ip9bSxnxEaz9S+OkF79yQrQ+Yd+ZrZ2CsJMhswuUI/VwH1
	bhykDd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4A-00000007hGC-0wON;
	Wed, 23 Sep 2026 09:15:02 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J46-00000007hCl-3bEx
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 09:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790154838;
	bh=RzHBofAf7YJyZ07FII2LvnkIIRSoJB9/EG93JfpCjsk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qTh6+gCj0Ox5+uY2pC252CptCozdENNnG6UbLAhSnyaSp1/Ur/vLefT8hd3luWNns
	 Jmi18Fc6/euvzgirXw/iUEEryfUJJ7ZPxD23DDTtuCPC4OwE7acfFimaerFfkelKZ6
	 kYtW0mUVxKujSKpUQOvEdG/caIWMALQzBzYZ6IKU=
X-QQ-mid: zesmtpsz3t1790154837t580f4562
X-QQ-Originating-IP: eFC3jACj3kP1sOn8Oha0w0ojCyaVTWCqfCWFgoeOviM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 17:13:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17194645670919471532
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 17:13:52 +0800
Message-Id: <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NnSC/w0LuVTXPThQKTEfRuA8vrufLoTnHxkeUq57ce6fJS4Yx3Ilmd3W
	jEaQv93SsNhPdDehy6+Rl8d1I23nST2T3GnS8ljPbP9ER5Xatv+ie3i56NxLfu26b1eptza
	HmpemmAgzg0ODHNTVOaCHgFOT42TDT3uPtUh78C8a/XV89HRfq8rKHze60LDU6MOJBIgv+9
	6caFIABG7hGszVoXKbl+yfHIBS1jxMaX8RB4ytP7JERq/Rl3ljAygYwX/irVf4MRM0tXCoE
	25QzVD9w1x4ziGSz/Xez4E+T09acz0B6Jm+DCjEpQ+Izs8QQcay30KC+T9AV5ErYKEVu3AW
	gHe0O5dtMxrGggw5pC0ZyZhbJ1iHOoP3HYCm8qPAKY8FlAzgbvEobt55RMWhVM//ZjA9TWy
	4TsfuYk06WT+JAoXsGHh7vpiuJbbF4s5tib1r6ay/SNfEPs5IDwcghiwqXirYD4k33e3yKg
	r5LJsIY+qOPxRo19OLoPpw7Z2UAfSKve+qH3HjlPSW2Oy5OHiLbOCT8idctwxQnH4sQpU69
	g6JRQ18WQvyLbePVGwwfglSU/5ACqNX2mp84hc47nJ93SyopuAo1lNFcufSt7c+3OCDk0R4
	o9/Z+kG5PA4zgUXNNxfjWWxIjH78KL4NK4672soYbK5+Qnc8z8lRL4haswYTPXGPZyjwtES
	66NAembmYMTpkFujC9JS8Kn6mQSQoFSqCkobnpjfZ4HPON5EndbXcNBbaUtZX3D4S3/+3KP
	KFoBuSXQVhdP0i+uMcru4W9SJpsWSKIl0SObSUadRXvouvbDedddglA43miendS8VFaRZNl
	p7nCu+DxSYLh5BdcEYekLzKvf36e7d6FFq+2jTcDmJmgOQ89i6kCW/H5GViIMfpcQ+svCJu
	4derOLm/ZmREgeRKFCQRDYpEVThjvosIcoz9GXMCwX/X7+y8wMQMixHR7oHXzm9x/Ndd/2m
	EKSa0hKlnfVHw461v1kHR0XkIbwFTVEkhe3FNhnNXLeQ9kNfEazqWnOj8/7Qoxf11oeLghy
	+KxW13FWLBGTfPuUF5ZlIKxhqGk63fVUnwPmezprWQstflpz5VN1WzCYPA3FHgG37ZADhrJ
	gfaobPEe/P2XfmH6zOVv1eyffCO0KNydYcqCoPFNULPWKSDIg8nOh6ksaK2ibOccDvTQTGB
	sCIr
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_021500_306235_B51A3658 
X-CRM114-Status: GOOD (  22.16  )
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
Content-Type: multipart/mixed; boundary="===============8116156482698560443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8116156482698560443==
Content-Type: multipart/signed;
 boundary=c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 23, 2026 at 4:01 PM +08, Sandie Cao wrote:
> Hi, Troy:
>
>> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
>> Date:=C2=A0 Wed, Sep 23, 2026, 15:02
>> On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
>> > FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
>> > FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
>> > driver.
>>=C2=A0
>> An internal slot does not necessarily mean the card is non-removable.
>> I don't think its location alone justifies keeping card detect asserted:
>> GPIO88 would report a card present even when the slot is empty.
>
> Yes. The FML13V05 hardware is designed for this. We can't change it.=C2=
=A0

I may not have been clear: an internal card slot does not necessarily
mean the card is non-removable. If GPIO88 is connected to the
card-detect switch, it still needs a pull-up. Is GPIO88 tied low on
the board, or does it reflect the state of that switch?

>
>>=C2=A0
>> > We check the vmmc-supply is p3v3. We have the same SDK DTS config with
>> > k3_com260[1] , so, this patch follows the SD card patch of k3_com260
>> > dts[2].
>> >
>> > If this is not correct, we will change it.
>>=C2=A0
>> Could you confirm from the schematics that the SD power wiring matches
>> CoM260 and that the card's VDD is actually connected to ALDO4? If so,
>> this supply reference is fine. The same SDK configuration alone does
>> not establish the wiring.
>>=C2=A0
>> If the card instead uses a fixed, always-on supply with no software powe=
r
>> control, vmmc-supply is optional for the MMC core; it should not point t=
o
>> an unrelated ALDO4 rail.
>
> We check the schematics both of COM260 and FML13V05, both use p3v3 (a fix=
ed, always-on supply with no software power control), not ALDO4. ALD04 is o=
nly for USB.
> We will correct it in next patch.
I'll send a separate patch to fix the CoM260 vmmc-supply reference.
You can focus on FML13V05 in this series.

>
> Best regards
> Sandie
>
>>=C2=A0
>> --=C2=A0
>> Troy Mitchell
>>=C2=A0


--=20
Troy Mitchell

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarOYUA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv/VcBANrKAZZo7hF1396yvrURKeblfk6N29sDuw3EfLqH
tZYVAQDII+/ULNRkpNFcStI32cx2tF70GmPyD9BkywqSZiBdDw==
=hVAn
-----END PGP SIGNATURE-----

--c948a7739b974566b3c93185804f926850ac0e094318f6082a3657734682--


--===============8116156482698560443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8116156482698560443==--

