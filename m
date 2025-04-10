Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1227C369A5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUHZxAQVpyNuvcdYyawlTaHOrKDVO6eQ0EbYA7QIbZ4=; b=qJ4x577+ixcaQ8fAMJJKsVzwKu
	u0DZKajdX2r4B1jnxA4kM3uwQvF2XDVLory/7MB8Pfox3m52LP3CjuRls7VcN1Dq3sEP26Chp5u/1
	MKoty/v5YBdXwQyr7K5NXNDdNj8ZZbFmsw/Um5CQ4Ji0cgeBOB9lEZeaS7ePS2VLl1R4dcc5flRnY
	+8F5P4YHC6zrDWgkkjRqbQO8HMA9IqTHmtZGD4O4E9RKXj39tgbhuJTgz254mnottyMFWGimUqvp8
	rNLMe1zgaV3uBxIL7zEEezuHMrUP8htlNws+w1JM5yQi1ElIM7lZcMDjkxKs4xC6+W9QFCU51tQoE
	EK5NJnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2svw-0000000ArH5-36Fw;
	Thu, 10 Apr 2025 14:31:12 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2svs-0000000ArDe-1q48
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 14:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744295365;
	bh=dK3IFcM6t2xKK6tgOUAjhKcaHEIUWTzfJ7k6D3zJ1Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=b99AozX3gzIZmAmU6VpmjobYOZI8tDFJM4V51bho8EGAfJVG2b5NqtpUTMRK/AwpF
	 sFGg65QesfqH2JzVU0Bl6nnmUg0DuigIHXcBifQ0mmm4d6jQUI8g2m0XgbGtKXFLfD
	 8rpAtjNSwiD0y8riY7tnponnT7PV7FqiueSLaaew=
X-QQ-mid: bizesmtpip3t1744295322tada884
X-QQ-Originating-IP: 6tbrAQ8nmEdhQDr+rciEGdO+mQqzAxSxZ7hWRdv0Pmc=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Apr 2025 22:28:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6705139162891013110
EX-QQ-RecipientCnt: 14
Message-ID: <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
Date: Thu, 10 Apr 2025 22:28:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
To: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NGf6Juddf2av92GOmkz0VugrmzV0SvwBYIR1+qUFqiAh9xYbM+gUAt9V
	QCpN0ctJtpIMAicIScEJoVdgArLWjM0zNldXl/eIePQsg+DE3ael/JRHrTgz+V/6Er/f6K4
	ahZJua7xKRRxmpGdO/ap7ZpZIOIZ4oDe3ptvPnZOE7RNbydfpIJJOvuzIorvSqW4ske1609
	HqNhisUUXYc/vopTNWVMWHhk/ucW74Y1J1+qEicvmrRPuRDXugnRhfeUo9BKV0ab7lsHks2
	0E5wHL+x42bykmioVy9wuf3RJH4hjmzeeqLigHBHhNAZXfOBgJvsM19nStLx6HYNcGiwVfL
	fifd+vSlA9e6Y6SFsi3h/cHX5JERLZlKR42P+znBAPpS7QAgWb3oQOu0UpOtVZu4Qyi6Kue
	aVAwJjGw9nMUbZPjN15g+Yl30ka65XG30Etnj/3InOa9yaJWOAj0q4lLeqhlGHozSNNrev0
	iIlRN8AxezuJ/7MISE//nVjRYuyoCOOjtV3AqB6WFi1SKCEkxPd7wJxa3Drix8x00T3tgYi
	kEqdBRvWKbDOyKkwNVhb+spDb/ye+tQ8xFXNmI/wCWhpFMBZKKU6qCA8OXDXEeNlKe1X6Cz
	SGB9CMUxr8cfWg7ylSdOq66wT8YJM+s/HKwR/zEziykFZBS+jyOMTGhpKy8pmM9a/G+mIda
	TT886mMyTaz8IjVKZ1mQGKnvMN9H32tYh7eCislUyMeObmAERYe8fwgrwv7RJWkjmZ5/fn4
	MptUOB3EV2BeKuTwvMI4qUDwx4CAw29nr7sm5rmKzrcYmPKXn/6Tb5KPkLD9KfexcATxGwb
	mVIjxtPxEqwYpXOndaMCLDdF08lcXb5zylJCGocHFgzy2yMaonIs1rp/v1/UhrQ9KcmgRrH
	S4w5cg+F1jKORkEhQe+IhQEy9YWJEeqScLwPgQSou55fvs9VFfS3eTnO2LSC1NcvJJCGWMu
	Cok5h1ehHOs9+CrbQ7h/huNyamEapaNK3zroHP6Bh+pW3oLsiRm1YSAz9TkcKjn2eG9UYBx
	HKZkNJn6+NKnWBiJNKHbDZ1+j9gXxruorG8nfWpJuWtHob2byxqyFie8sSGVIz57l8aKv5F
	N/iHcocLHnC8PA1UmyejKoQ50Dc2cfTYJ+CWBG9iUIt
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073109_051586_7E70403D 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============5755162865750355726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5755162865750355726==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S8JDWGDWHbIEBDkKimBFqtY5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S8JDWGDWHbIEBDkKimBFqtY5
Content-Type: multipart/mixed; boundary="------------GZrFkP1m02835N825iTtcfFp";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
In-Reply-To: <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>

--------------GZrFkP1m02835N825iTtcfFp
Content-Type: multipart/mixed; boundary="------------AAARt9CDF6qOlbhSthz4SPYx"

--------------AAARt9CDF6qOlbhSthz4SPYx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpPbiAyMDI1LzQvMTAgMjE6NDIsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToN
Cj4gSGkgV2FuZ1l1bGksDQo+DQo+DQo+IFlvdSBmb3Jnb3QgdG8gcmVwbGFjZSBrZ2RiX2Jy
ZWFraW5zdCBpbnRvIGtnZGJfY29tcGlsZWRfYnJlYWsuDQoNCk9LLCBJJ2xsIGZpeCBpdC4N
Cg0KVGhhbmtzLA0KDQo+DQo+IFlvdSBhcmUgZml4aW5nIDIgdGhpbmdzIGhlcmUsIHlvdSBu
ZWVkIHRvIHNwbGl0IHRoaXMgcGF0Y2ggaW50byAyLiANCk9LLA0KPiBBbmQgYXMgbm90ZWQg
YnkgUGFsbWVyLCB3ZSBhY3R1YWxseSBkb24ndCBuZWVkIG5vcnZjIGhlcmUsIHNvIHlvdSBj
YW4gDQo+IHJlbW92ZSBpdCBpbnN0ZWFkLg0KDQpJIGhhdmUgc29tZSBxdWVzdGlvbnMgcmVn
YXJkaW5nIHRoaXMuDQoNCklmIC5vcHRpb24gbm9ydmMgaXMgdW5uZWNlc3NhcnksIHdoYXQg
aXMgdGhlIHNpZ25pZmljYW5jZSBvZiAub3B0aW9uIA0KcHVzaC8ub3B0aW9uIHBvcD8NCg0K
U2hvdWxkIHRoZXkgYWxzbyBiZSByZW1vdmVkIGFzIHdlbGw/DQoNCkhvd2V2ZXIsIHdpbGwg
dGhpcyBzdGlsbCBmdW5jdGlvbiBwcm9wZXJseSB3aGVuIHRoZSBSSVNDLVYgQyBleHRlbnNp
b24gDQppcyBhY3RpdmU/DQoNCg0KVGhhbmtzLA0KDQotLSANCldhbmdZdWxpDQo=
--------------AAARt9CDF6qOlbhSthz4SPYx
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------AAARt9CDF6qOlbhSthz4SPYx--

--------------GZrFkP1m02835N825iTtcfFp--

--------------S8JDWGDWHbIEBDkKimBFqtY5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/fVmAUDAAAAAAAKCRDF2h8wRvQL7vAN
AP9ZXkyUlyPteWqXNYNbevQBuHewVnNCVFEP3Xxc82UKsgD+NVYB0kwhtpeDGhFXmHN7qLW6PAe0
bKpMwIJMipD2aAI=
=L7I4
-----END PGP SIGNATURE-----

--------------S8JDWGDWHbIEBDkKimBFqtY5--


--===============5755162865750355726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5755162865750355726==--

