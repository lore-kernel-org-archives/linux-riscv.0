Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AB5C9830D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsm5jzcv9oEq1SfdM6oq/f2IPleVQlQkvf7XF36psGI=; b=XT4KW29nGOoeBuJghtmFMiuowd
	9ngZuEvDnoVoA8d8kdpKmvP5p/Pj68zC/heFXZf92VlZEBsn+0yf/uPVAP1wVn+lb4WUSs2EKdsFK
	rtMvkFv7ZVSxyIv7e3xfvGaA03s7dx4yrSf8m6Fi01W7NDAjlhS0mWhQTb3m7lVeqfGj7yEGH2mBv
	rZNw1e7thd+4pPXQYJXpnQdUqq+mIj4qik2/qseHRV0x5qLPiFO0zUH4sIQRnTLV9R/sVrGYknHLF
	xSsusdNtdJhRnylxxLyFFI2vDLZlOBTnWc3fcpOhK8IlIX0j+mVJU31lTiBhMmgov9tflcb7DfSrt
	4CEUueSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yyp-00000009qet-0Cdw;
	Thu, 24 Sep 2026 02:14:35 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yyl-00000009qcO-1HvT
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790216057;
	bh=Ukq4s/g2LbAcLSo+DPv2hScrAIpjP5dVSjl63kehKK4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=l7ojbSQtnSA+IEl/Dtycf7jzRcDTbr0aqBhVK/j6h7ZpXOAY0txHS3u8xz1KXD/A9
	 Nk9TC66qAvtw5EP+sQH5WTx8bNsIdxu8UMXh7tcb4X9D9zLPAkaEei6AoHOnjkMLjf
	 MSDkhgpJ8CCupBOZIh/ah8kx0KIFmQmaAh1rhPs4=
X-QQ-mid: esmtpsz21t1790216051t6a98fa04
X-QQ-Originating-IP: 1SD5VCR6xWCfe2vzl2aIguq6PDEir4epJ5QDcl9DXTI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 10:14:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5874928214263819641
EX-QQ-RecipientCnt: 18
Mime-Version: 1.0
Date: Thu, 24 Sep 2026 10:14:06 +0800
Message-Id: <DLN6MI8PLD0A.3ELK15A3DA9NF@linux.spacemit.com>
Cc: "Bruno Banelli" <bbanelli@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Alex Elder"
 <elder@riscstar.com>, "Yixun Lan" <dlan@kernel.org>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, "Krzysztof Wilczynski" <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Uwe Kleine-Koenig"
 <u.kleine-koenig@baylibre.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Encrow Thorne"
 <encrow.thorne@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260825052249.66921-1-bbanelli@gmail.com>
 <DLKRGJBNFVQO.15WZ2SXQLOY0T@linux.spacemit.com>
 <xuafb5qshj6rowe3v6sxyfvtemy4wg2ttqs7lcwu3txu2mpyzm@fr72njh6zgvi>
In-Reply-To: <xuafb5qshj6rowe3v6sxyfvtemy4wg2ttqs7lcwu3txu2mpyzm@fr72njh6zgvi>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2ZtXC37cQOMjtmvJ65GqUQyhRbehIHzwnmoGlMeejKfbj
	ulQMC6wYWFuKeP5DLmRXzz6ULrJOtc/MWhr6rjSjmKy579MregMEBkbKAb4OmrefCbjSQBI
	xDcDgPI48wyBJej8VGW0c9l/XbZOIvkVP+uaQAFV2Qi4u4TlnNOLAjEmS1cRaSuMnohISnq
	kCyAKYcA6MYyl/6+xUom8XmoQaBARF0EAeEAbdiGrZXiRkCAhQMjMvhdjx3Cz2myZMih6Pj
	INZFCr0Bkw0CCVcyr4kWymyh733r9XcMXs+SrurY+redH8iV62UWTSurc5ejQD03oyaEqDY
	9as28qi4jTlQmQjHiKL7schxs39ntwoc/67wuWVL+2Kx2Mk+lu5kP5JUDvmJrLzQDg2fOVD
	NzvH70RXO8jfplOc2iyFJCu7xVnoknR224BuweBi+mMRSrahE0uOz1LfqlvXlMwiv2oLLqQ
	rJBziovNn/EO+bqZiJmnKrV8GWHq+2s4xvcMiZ5kB+pVyTdFBQdsBKWLpsqzNbg1GBzEk+W
	U5NvztKZpw5MV/sQLXMxyUUu4omrkP8njO04ys/mvX0mg4f95Wo/EJKJ1OjaXdUbGekQXVe
	0/KN+PbomqS00hX4EAFiIlfwe+1dkkNhk4w083R4r1iz2G457/TJf/cJWP7DakHEljhw4mh
	9RjcknB2H8gDyrCWUg06p5OxoF0fTfoI4uO0CpzBzbO5jSynglYO0uBRppZmW99l79Crrej
	Gz7l6iMljZiK8F6Bwj8vVhoLzoTr9wsMRh0VAZEiusE5t3K+zYdkhusf4iuCLNW4jSN7sXF
	jBaQSQSIunhAudlEZ1qPAYJzPIHOA2pjsI8zUIjGXaKDVld2DdprWWXJibsDJ6D2ZGWPVM4
	TCzvtOQHhY4+pU611HophJhseE1sI5A0aQc2Hc6Hy4ml0aJ8D093XopymMiCj2GjV5cDK7z
	+ZI2a5G4YbYLJg4Y3Ys5mFct8bMn6BB9jt89zQypNBYlTOkkdg6hWNE7o/7kRno6GBQ4YEK
	NmvBH0wzggEJur8VcyIzQgFljc22DPLfPA/xyLorBoXlC2Q5fImPmGitxl1A0FEX1cCbWF7
	lGVyiV5VjDHrVsSfRKOcLT/TyC2QjjNGBwrFlsGkPilLhl58GK+W153g55XHytAZw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_191432_245350_26855184 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Type: multipart/mixed; boundary="===============0454237622010863820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0454237622010863820==
Content-Type: multipart/signed;
 boundary=8f62a79aaf3f531d7ad204d4c4b9ef58a31bebd84138d89c089572e5c418;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--8f62a79aaf3f531d7ad204d4c4b9ef58a31bebd84138d89c089572e5c418
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 21, 2026 at 4:03 PM +08, Manivannan Sadhasivam wrote:
> On Mon, Sep 21, 2026 at 01:55:42PM +0800, Encrow Thorne wrote:
>
> [...]
>
>> Hi Bruno,
>>=20
>> The issue was caused by a missing hardware configuration in the K1 PCIe
>> initialization.
>>=20
>> The PMU PCIE_CONTROL_LOGIC register contains an IGNORE_PERSTN bit (BIT(2=
)).
>> The hardware manual describes it as follows:
>>=20
>> =E2=80=9CWhen set to 1, the PCIe controller and PHY ignore the PERSTN si=
gnal from
>> the link partner in both RC and EP modes.=E2=80=9D
>>=20
>> This bit was not configured during RC initialization. As a result, the
>> controller and PHY could still be affected by the PERSTN input during th=
e
>> early DBI accesses. With the Intel I225-V installed, the first DBI acces=
s
>> could remain pending and hang the CPU.
>>=20
>
> What does this 'PERSTN' bit controls? PERST# or something else? PERST# is
> controlled only by the Root Complex btw. Also, why does this missing regi=
ster
> configuration only affecting Intel I225-V endpoint and not others?
Encrow has already posted a patch here [1] and explained the reasoning; it =
seems to
depend on the device's behavior.

Link: https://lore.kernel.org/all/20260924-spacemit-k1-pcie-fix-v1-1-002b5c=
1ba9fc@linux.spacemit.com/ [1]


--=20
Troy Mitchell


--8f62a79aaf3f531d7ad204d4c4b9ef58a31bebd84138d89c089572e5c418
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarSHbg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvxO8A/1764CfP8OTcIm5rW5emuurOXkqTKQ7BL9ChVP5g
Wre/AP9SDdlVovEUp1d9V4EYidzXJuHBOkk14Z04haPo5wMhAA==
=KKPr
-----END PGP SIGNATURE-----

--8f62a79aaf3f531d7ad204d4c4b9ef58a31bebd84138d89c089572e5c418--


--===============0454237622010863820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0454237622010863820==--

