Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50506C982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 06:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xenNH2Q42jgKMmIgIjUWHRe6Wnd64a8AIVF3muPonTc=; b=UnMMeXUh9tWaClKO4jNczkVWTs
	/FVI9JdWKH0zd07D0dWdNjxsJaYNDOVG6LbkWC0SZUxWaocZhP7u//rN1997AR9278eDy3n/t/Qhz
	yPZsTCV31aMX9EvLtU6leif22hURkBTDr0RrC6kRB74yyXbQ/qBJXZsw7ggROcV6Kr+54WFclVFfm
	IeO7dUYmXb2g7Gr+IqnHJTrjfKcV8o3OfKYh18Pj/VagZvkZLlSb45zc6peBlTNJV6cSXfzQ2lMva
	/xtMkO6fVYiaJvUAH/39DfYmTdMp8RnWWyKSwg1OzF7Q0iA5udX8NCEducewkfccLYlf0SVR7jUdb
	RW8Cd/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GbP-00000007IwB-42nM;
	Wed, 23 Sep 2026 06:37:11 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GbM-00000007IuV-3XBx
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 06:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790145368;
	bh=7TD6kaLOIkHCV7biWJRQxBpxr+dO2L1mtrMOe3kFMLE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pkAuUzkjIzH0Eu4mN5KL1bNpIF324ba3qVPlQkGaqc21tXb+GuTK50+x0azsk1a5o
	 M9CDc/3pfHBcfvpIHOgl6qRzWt9HDPExJRnjHB0Z3AV1b7vYtuXclYK/diWuT8+atW
	 J0hzB3WGAqYFqpyOSNYH5wSxqrOl1BaNijUHOadM=
X-QQ-mid: zesmtpsz4t1790145366t12895b09
X-QQ-Originating-IP: iQ++3uqmOnABX9dDUWqAzmBVlnJU4UKa65BUSd0vL6E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 14:36:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7840022773498223728
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 14:36:01 +0800
Message-Id: <DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
 <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYxOaBiafLsHcQgqPYdhxLg3ws54Z+8sS373nS1CDeQL5ZxjczNGkjv0
	M6Xwfb6h3szFA13ze86I5GXlNWXp99ImE2Y44vlFfvLcMUxoYP0cLDXlESDfPVERWQPbg62
	o42YTgl58VyyRlK4YRjhExLUKnEqQBSVTmMOuCkPtuhdE2FfCB0/OIk2rOzWo2QpEG2fSpq
	o0fTJvss3BVtEAqvHydrBkvR/HYbpRlhFJLgxPzT4f67ctki4RjXnCTVKG0d6660Hbf7hI/
	LP+a9D/Jb4fI62oaf3pkvl5ZPrfV+xxDVF4fBTmnicGZ43SiW4RAQF4lqa4Rj8LrFmLZdF3
	C3eE5m9UVhxapznOXktcQ8m7SiZI/rymvd/+hlPvRb9jFUr7dD4cLLgQauPQWwSi9c7exQt
	geTB7jMvwfEVbW8Fb2TLauE+wQNkyrhRoc5fXQEOCgw5MCA8axcLJF4CVsL3JnX+wuho6+C
	//sP5bZWiXFe1XMXgM2gcA/otQ4Vd5iCJrTMti+Z4tB3V6vH/8UZ1VYMoh5y7SuodPzsXj7
	bFymdlcZVzOTJ2RbhRFZfC6AxUzv8GtgYYsZ9J5CZwU6IKYv0iBxeR0YCbOCj58hl55hc9O
	QIqcZfzW9v/XJ/Nmq/kEFR/DW3ou19AULZUORMahdO2dC/L3s8Q8fL3kldJ0gLjZyTxiz1P
	fvtf66bYdZ9LOePQ/+ArEvjp1LI/O9q2qr0olmhipJ51+MiRr/kOra/DlTPgYskM5JZdg3E
	OZ1/U0eHHM9BEbey5dzbk1D5/BNN1e4b9VqorMwBGOXwg+sjGnzZIIw6yyBZNngnI2r1Iab
	T4U++v1ROVWARSV11g8cpOfGqpxOt6Gl5ED6zZ8uxD/wqespULKYcpD7Zcn0YJ/vkMwUWUq
	w95mn+BmwollzMxsWHEW1iz3e9kQhTtK7+0+d+RC0vpWlN32a8OapyV9miGrWvieFnXhQMO
	G7ZRk5cbV0qelXdWoIcl4Z3ZeoyGkYxIr2F25Fa+4E8awNXbD/heesPZdvJaY3CfzuxuNv3
	Z2RlnWZQeNcuiNDhcY1yCk43wWI3xDcvecr7VK3Zctnxj6IsCNC+BmN55/Se8o6qnuY+wA+
	WcbrFVrxc5TMZjTCMeUju54bgkJXDaEz//1j7RwF/2CH6tg4I1EXOec5xRbTT+gblpOKdUj
	eNzLKL0BtSZnNN4OkjNkFj6jb8jXLExe/NU5
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_233709_720528_6DEDF96A 
X-CRM114-Status: UNSURE (   6.19  )
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
Content-Type: multipart/mixed; boundary="===============8574875303711751595=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8574875303711751595==
Content-Type: multipart/signed;
 boundary=93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 12:07:20PM +0800, Sandie Cao wrote:
> Please note: usb3d_u2phy also use CLK_APMU_USB2_BUS.

Could you share which tree and commit this snippet comes from? I checked
k3.dtsi at the base-commit listed in your cover letter,
3f2425f5b5bbbdd991ca9cdfd5502e68d8895998 [1], and usb3d_u2phy has:

        clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;

Are we looking at different versions?

Link: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-n=
ext/+/3f2425f5b5bbbdd991ca9cdfd5502e68d8895998/arch/riscv/boot/dts/spacemit=
/k3.dtsi [1]

--=20
Troy Mitchell

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarNzUQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvjqoBALC+90I9O3Z9aQ/60lX4RPaKN48M1FU69LCQe/6g
LaTFAP42AzJ4bt274kIyxURFDfOEeXt9JY4yYAl2jx9atadhBQ==
=Tjxm
-----END PGP SIGNATURE-----

--93fc701ceb312486caf8efcda37d3e33c17510886787078030b0fde4394e--


--===============8574875303711751595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8574875303711751595==--

