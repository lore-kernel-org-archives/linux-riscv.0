Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98405EEE27F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R+XI+5UxmpLEfJUTNFnCCM46CCc1PMykNcqIZwuEHU=; b=roxMyHTp6YTezXYmXpgGOxoSF9
	Cz3GKob5rqNuk86a44MrH72hjKUJQhP5mBAwMnSZgj0Hmc+uzo4yO3huJYfWaZGyjNx3FXW5ytI6V
	fP+oLdaRLE/uPhDZo/N0s4YR/h7VTGpOwdwo6Fl3KmkjMsijdfUQYf06Ey+81u3jD36pb/rLkA/nv
	AK71qautf+wDqFjfXtnvnrp6uhsbCwq0Q4BXYoP4SwoQHa+N+UWyBZH1raCS4oPeSnNZQ5C1+Y86Q
	/3P8b8jGyHWIQhzLhcggcE1n01k56DEaUVe/nPbBnHx0soyQ7846qxhQQvZRM0Bpv5p9ZiBrcKhKX
	MCPck5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowQE-0000000Elk4-3w49;
	Fri, 13 Sep 2024 02:52:34 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowQA-0000000Elir-494Y
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 02:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726195911;
	bh=LET1BQ0Xn4Tfvm+vfRy4bftcZN0ArP5ewrmZ8L4dqYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=abDl35Pz+5mSvGMD+AUhYm6jwQ+yCtCfba7hct9m6cAn2aBt/NYIZWY1BhU2ZHw4t
	 ap6lvHYKQgpHfkx3F8qqvcXnCE6GWURU8V82OhvYumoKzSOcU/m83bh3MbbNlOWwCA
	 aPF+HOKDc6i0I04dr/NAtiFggMOndAwRmaA1aaRQ=
X-QQ-mid: bizesmtpip2t1726195904tnlmeop
X-QQ-Originating-IP: SvkltPouCzgQMW+h9Abq/NT5VbFnlznpZKK/5Glp6uY=
Received: from [IPV6:240e:36c:d2e:d900:4ac4:d8 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 10:51:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7572236675390096387
Message-ID: <933241F284D0194F+9840ef64-2285-4378-9a8a-393253530535@uniontech.com>
Date: Fri, 13 Sep 2024 10:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: paul.walmsley@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, anup@brainfault.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk>
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
In-Reply-To: <alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_195231_496893_126ACECE 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Type: multipart/mixed; boundary="===============7522064173914023462=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7522064173914023462==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6403Jj0Wn65v0w3LhfzdauCG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6403Jj0Wn65v0w3LhfzdauCG
Content-Type: multipart/mixed; boundary="------------uBhyMPZVGE5D0qKkF2xBZ8AB";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: paul.walmsley@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, anup@brainfault.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Message-ID: <9840ef64-2285-4378-9a8a-393253530535@uniontech.com>
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
 <alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk>

--------------uBhyMPZVGE5D0qKkF2xBZ8AB
Content-Type: multipart/mixed; boundary="------------SisB9iXFPKTnCULnAVX9pEYA"

--------------SisB9iXFPKTnCULnAVX9pEYA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAyNC85LzEzIDA2OjEyLCBNYWNpZWogVy4gUm96eWNraSB3cm90ZToNCg0KPiAgIE5C
IHRoZSBwcm9wZXIgSVNPIEMgYW5kIFBPU0lYIHRlcm0gZm9yIGAldScsIGAlZCcsIGV0Yy4g
aXMgImNvbnZlcnNpb24NCj4gc3BlY2lmaWVyIiByYXRoZXIgdGhhbiAicGxhY2Vob2xkZXIi
Lg0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0Lg0KDQoiY29udmVyc2lvbiBzcGVj
aWZpZXIiIGlzIG11Y2ggYmV0dGVyIGFuZCBtb3JlIHByb2Zlc3Npb25hbC4NCg0KPg0KPiAg
ICBNYWNpZWoNCj4NClRoYW5rcywNCi0tIA0KV2FuZ1l1bGkNCg==
--------------SisB9iXFPKTnCULnAVX9pEYA
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

--------------SisB9iXFPKTnCULnAVX9pEYA--

--------------uBhyMPZVGE5D0qKkF2xBZ8AB--

--------------6403Jj0Wn65v0w3LhfzdauCG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuOovgUDAAAAAAAKCRDF2h8wRvQL7kk6
AP9l7NduOUZtfTUmyyvWcFLpQ6+CRIC9rlQ4ygDDeqN9NgEA87PvCwvlUa62DwV3Cn3S9yYDJ1wH
mXySRMyqa5NWnAw=
=X+P6
-----END PGP SIGNATURE-----

--------------6403Jj0Wn65v0w3LhfzdauCG--


--===============7522064173914023462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7522064173914023462==--

