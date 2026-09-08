Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEBAC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VMzOoN4A525ppBiwJ30k6OKFYnPekaIc6FjQgGFTIk=; b=kU4htjc7Nm05O1UMYEre1lZIwo
	jUG6yabgPF0AP28IatNk0BSRQpTPqsiH0hFWfYt/56daNOoxVrdzVuYljC1xxg7KJV/5Y/aXYHxdT
	0rQBtkW9kxJOWWxZXOgWwhQ/RwqYHrelJibH1vbU/YYdOcIS2nXEEcSX+yD+ghjz10JslHVBG5D2x
	Sr+oBGbkSN+pLMmMQeOYh5qPkOIAzlhmNUJK2YTbixUWBG6EtFYkXqOSKyjBsrKhOyINkqRBrq/hS
	Tm880p+XauoEGyaFerXv9LhaJQvSaY6htAAKA67FI7zYsyusUvWUQ1Qa9WLNz6sN8xClh3rxJR5Px
	9xttDytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vcK-000000097YC-3Cwq;
	Tue, 08 Sep 2026 13:12:04 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vcD-000000097WY-26uw
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788873093;
	bh=xbA3TJsJKFl8Kye8hJSzoPXYOQ/DZQR1Qmu9u203Sag=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=V1ymYYim0b2xlbpkNBUwv2iB62l+6jTcz1WgsL+mmSmi0qRXgtczPwQuS/SOn247d
	 GhYk4H+YDGJz8DMNu2qimhIeUMZGkNjalyT06m4SNJ68H75lJA71Tallsj0S0tPCY2
	 /jqL4GYasmkuVWtoRB00KlCRiCMy52t/kAxhfWXQ=
X-QQ-mid: esmtpgz13t1788873086t4e5a1872
X-QQ-Originating-IP: SQ6UZhO9IynKB/MfyOlZNAjrd1G0saGKWG5F9GK05qg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 21:11:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16403462046792618605
EX-QQ-RecipientCnt: 21
Mime-Version: 1.0
Date: Tue, 08 Sep 2026 21:11:21 +0800
Message-Id: <DL9YL0LLHMTG.22MRAFNKYSNI5@linux.spacemit.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 7/9] riscv: dts: spacemit: enable USB2.0 controllers
 on BananaPi F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-7-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-7-f07342ffa051@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MgB4ni1IX5Y96eK3iLLnCijDMVbexrO00FsP9GXePlsZjvfqPVd7eiQe
	hoSV7u9cK6Nd5kS5bOrEo76ZXzbyPloYsIS32iRvUr0voxHfV+bwOOF1xFEvGOxP8xbf0a7
	fglZzUfDyVqKNn9iYkEc1VGem7kXsg8uXpofqa2j+S4lIi1yhPpmPV0xSoLJAkLWVsV9uig
	ULYV5R5FQ/7tiKtPKZxAexC0Qi6jE5+5gUjXw1zdv5Hrkj5ir0Pqf9UwZeMURO4zTq7dkgh
	7uFjhGK/kKbhu9ODGyPbA9NsREodOF8nBwwztJKvSLmMClZc50i8BpvdcmAZN0VoKFyhZjI
	TuXyyGLktzCx4AKBWzxCN3ICBzVqWvwY0wqt7e9IjeE7EY3rUJCyrKBPipvrzJkSTcw/jND
	8Jj8O/zCoz4p0KA9wtXCM9nLaAmofXuYvVnf9cyojSXgQUQWiPNod4Fwl264HCs1hna+d8V
	2vWza1Uj/Y4KOSTLBpF78VOM0HPOOSQoiJOgEwk3mwqL5/WDwUYsC5ns0jru2pP6H/AP7z1
	i9AbYz52HRoFOoKN9n+LA1VzYPdUTEIStZ+Vbgj7K/Su1nDofGE33p7bn1oXqZAeZmg8VPf
	9NkLO+ZgNzya+bbAyI6hf7+HAyA2DczDU8jqKxiu7aokqSRnRLhzuS26RmKsuFI/L4mK2rw
	uoBDbSRaKidNCRk+xE+42oWPJpi/EY0eS0AzL5jpuDBZs/TVRBCBOZN0OWyH5ZnNRjVLQoY
	urgkgPjuzClfpDOGDAryGDBRLY3Ijqh+gJNSfCtfsReiDWKXZ58hv+Dr+ba0VitutiYO4WE
	D+FT9UdPQW/ID9UFouZ9ZRGjHD6is3zDXErhYZrTd6iEzqfU/60O08ib0EBheTMu0+pPZaC
	ajOLs+6A9sxzRTVQKBuwLe4frmETzSrY5/z9IXNktyE8J1VmwcxtKKr9puNY7fH/4Fux/8I
	yZoPgAKcIqQ8YC4darkKAcvPq9thIcANFTzMEeFkuydjhCT4mMdgV7WvN+poRsKIKTmUfBR
	XDvBcLQu4KeD8C+x1qWcE1fAIpIrAR9c9vRN2yUijAoQVLkE9DGh+3zxrFKiKahw53LREG8
	wutdnl/Qo+al0opfxA8BuastEvpvp30hIx8aT9/zA7qNXCUl4JVdqk=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061158_542502_7672AAEA 
X-CRM114-Status: UNSURE (   7.87  )
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
Content-Type: multipart/mixed; boundary="===============6984164323093566126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6984164323093566126==
Content-Type: multipart/signed;
 boundary=0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 8, 2026 at 5:48 PM +08, Junzhong Pan wrote:
> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
> mode by default. This port have no VBUS supply capability, thus host
> mode only works with self-powered device or hub. User could switch the
> role in sysfs.
>
> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
> support cellular modules.
>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqAJeQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvJnUA/1+zbNPo3KJYIYHyUpwaaZBC3MD2ZHifgIIMyl6N
MnoIAPkBT7qj4aYXw4R5MJLRsNt8mascl2c28wQq1NY3we9oBg==
=poA0
-----END PGP SIGNATURE-----

--0c6c867a118613367d54fc38d42f6b057468feb5ed531f17b32862ca5431--


--===============6984164323093566126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6984164323093566126==--

