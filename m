Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C64EEEC02
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 03:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HcvZDg2fNOB1aY869nlB5aXkPT40WUFvjmUXPtt4MY=; b=c2IlQdzSB9dGk9tZEqaibMgVbz
	ZVu7ksKLFq8Ry6DT7wnksVx1pUwNECzTSd5eIIjCzAj+Rbj/Eb/jUzKV6kidlir/ykVlILQPyVEVR
	6vmkg5wTTgQdH+zmtKp4WCgg6lNAgjx0mX0se3DeQJH2pMw4n0P19EDH55FbuYIvPasycE51dqFKq
	OkfdDYeR5rutFaFfwLQPX9gLLAoqQXua6CDHGwLrjB1lX5GzHqirahWS1A6w2jKUTD71kbQ5hgNOa
	MlV1PxbHQSTM8ocT1xxsKYFJ/W4ilTOlxYO4bmjziQuZbdlh8YaXC7nol89PRu0RIWOew/a0ugLJN
	Q+VyGmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowjQ-0000000EnXE-2T5x;
	Fri, 13 Sep 2024 03:12:24 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowjN-0000000EnW8-0wpm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 03:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726197099;
	bh=Ma3uZ5OETrMHsn+zJGEpaDuF5aYUvfYrDIXjcedBAMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gf1v+umtmbWxsdUCgRCWEMW+LHF8+oZ1o284x+ARKonSTfg6Coc+OEu7QkxBldlkS
	 TcsCuSTS9QzuZDJMj0nU2HydvAdrWN1pme327mCEkrb42ZjSgg5U4Q7G1I0se6hcB5
	 01LNB0r5Ikgr2i92Q0F6jM7mWdMEVibflsq2tqi0=
X-QQ-mid: bizesmtpip2t1726197094tr61807
X-QQ-Originating-IP: 54MpHY6GFmcQo7Vhx4JOqsEb5nBTNBqoS74Ioaz1ZKg=
Received: from [IPV6:240e:36c:d2e:d900:4ac4:d8 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 11:11:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8387889725699655936
Message-ID: <FEFED0A013D97FF5+73cafd43-8748-41a3-b6c3-c36a1a883da8@uniontech.com>
Date: Fri, 13 Sep 2024 11:11:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
To: Charlie Jenkins <charlie@rivosinc.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 samuel.holland@sifive.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, anup@brainfault.org, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
 <ZuNRIrfLgkWUsZri@ghost>
From: WangYuli <wangyuli@uniontech.com>
Content-Language: en-US
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <ZuNRIrfLgkWUsZri@ghost>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_201222_017334_68089855 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Type: multipart/mixed; boundary="===============4440282200371321894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4440282200371321894==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iDHKh5WP4i44OsgTAtuWGTiF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iDHKh5WP4i44OsgTAtuWGTiF
Content-Type: multipart/mixed; boundary="------------DbGAGeSM6zmKTL5F5P5zBnkv";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 samuel.holland@sifive.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, anup@brainfault.org, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Message-ID: <73cafd43-8748-41a3-b6c3-c36a1a883da8@uniontech.com>
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
 <ZuNRIrfLgkWUsZri@ghost>
In-Reply-To: <ZuNRIrfLgkWUsZri@ghost>

--------------DbGAGeSM6zmKTL5F5P5zBnkv
Content-Type: multipart/mixed; boundary="------------0bxoYvz0F2tXUjoZY00vq8FC"

--------------0bxoYvz0F2tXUjoZY00vq8FC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzkvMTMgMDQ6MzcsIENoYXJsaWUgSmVua2lucyB3cm90ZToNCj4gVGhhbmtz
IQ0KPg0KPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4NCj4gVGVzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPg0KPg0KVGhhbmsgTWFjaWVqIFcuIFJvenlja2kgZm9yIGhpcyB2YWx1YWJsZSBpbnB1
dC4NCg0KSSBoYXZlIHJldmlzZWQgdGhlIGNvbW1pdCBtc2cgKG9ubHkpIGFuZCByZXNlbnQg
YSBwYXRjaCB2Miwgd2l0aCB5b3VyIA0KUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieS4NCg0K
TGluazogDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvRjVGREE3MTIzMTgzRUQ5Nisy
MDI0MDkxMzAzMDI1Mi44NTc0ODItMS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KDQpUaGFu
a3MsDQotLSANCldhbmdZdWxpDQo=
--------------0bxoYvz0F2tXUjoZY00vq8FC
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

--------------0bxoYvz0F2tXUjoZY00vq8FC--

--------------DbGAGeSM6zmKTL5F5P5zBnkv--

--------------iDHKh5WP4i44OsgTAtuWGTiF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuOtYwUDAAAAAAAKCRDF2h8wRvQL7k2D
AQDA357oztfvnEUfSImIhqwOuzeMUn+espwS90OtZv1B2QD/RC8vfBTQOCkWleXhBsBqahvSWsgj
zkCvupKmsoY2iAw=
=GGFB
-----END PGP SIGNATURE-----

--------------iDHKh5WP4i44OsgTAtuWGTiF--



--===============4440282200371321894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4440282200371321894==--


