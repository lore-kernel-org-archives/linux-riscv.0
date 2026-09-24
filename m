Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65CCC98304
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIPfLVEFYJDY+++D78rHIX57YOdQ9UepVsNywPqoK24=; b=mPhH/avmYqPhiKwrNpOeSsiNw+
	PAOJBeRoS+fEiymLTVUxTMGKz9LRDMq4ltoliI1bSXvMNcHDBf3L0umd+pDPAcQrw0OOGz6rnkJmF
	EFW46DiaJEY6ThfdgNUYUW0915RXQcPyeonC5lKKeKKhGTe1uO4W0b7aNMp2v35ITzP4hSCStDuTD
	e8Vp9TnsryrW7v4Cg+DwUXJhU310DplSPnIEnQSOdQGDIE72mh5yauwveGzE3teq+cR16AlbjdXNz
	tyN6wTzPGLCkPUsCcj7zw3wtP7Xm4TnWMmMmXgLd0M6jy+DWFpK/bP4cA8g5LgFx2zaEXiOmDCKFN
	FepdDjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a68-00000009w2e-42Vq;
	Thu, 24 Sep 2026 03:26:13 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a64-00000009w1e-1PQJ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790220323;
	bh=1OuECCNgnc6CLvCQwxn/XTZt38EU5TJNmlwiHDDUrSc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TaS/y+yksHRirxBwFwVPndAYWK/ElBEuhzn+D4dW9jCNVyLezSEbKiROWmhILlAvI
	 11BmDvhRyQs840xJcFk6V2Xlme9d3nOK0h3GTOM9tiZPb2LuugCA+xwdEcPJEQIgrG
	 9HbB9jlfKiR5fvz6rmkj8JaXZkcmyS0xI6MDipQg=
X-QQ-mid: zesmtpgz1t1790220314te0b2c6a7
X-QQ-Originating-IP: 4x/4dzp1jA75d0q38ahlTcs6JiNxTb0iijMQfx4Sicc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 11:25:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11185655890934613812
EX-QQ-RecipientCnt: 41
Mime-Version: 1.0
Date: Thu, 24 Sep 2026 11:25:07 +0800
Message-Id: <DLN84VV7GX6M.9VWJBT3INEFO@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Jingoo Han" <jingoohan1@gmail.com>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Frank Li"
 <Frank.Li@nxp.com>, "Niklas Cassel" <cassel@kernel.org>, "Sherry Sun"
 <sherry.sun@nxp.com>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Bruel"
 <christian.bruel@foss.st.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Vidya Sagar" <vidyas@nvidia.com>, "Xincheng Zhang"
 <zhangxincheng@ultrarisc.com>, "Alex Elder" <elder@riscstar.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Randolph Lin"
 <randolph@andestech.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Marek Vasut"
 <marek.vasut+renesas@mailbox.org>, "Inochi Amaoto" <inochiama@gmail.com>,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>, "Ping-Ke Shih" <pkshih@realtek.com>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Gustavo Pimentel"
 <gustavo.pimentel@synopsys.com>
In-Reply-To: <20260923015016.64069-7-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
 <20260923015016.64069-7-inochiama@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N6K3vS2k3BeEC1+YK6KKZQHbPngMGxIxppfaCPOIv+9XedZUMMs5jxwQ
	1OiFZJcaBVUiVJ6O0qc3vSY/Sdk/ZQPxl2hPUjUeVda5kpgysNtHFa8w12gKnftQY2vqWYp
	IOxTjF0MEbvKwXSKf08UiQA//WmI+n/ab0iECpcZv9Olv+VlA0BLPAG4GQ8Dx3VSQLCOg8v
	Ox86HGb1LBJLWspTOpevjmBIeoLnm77xKC8pxTJxRNdGH88SYYvvbwhtlMor/pND4wPWi5s
	v77t+RElTqqatyU/L7HGv1huETpTLxN3qMhFWXX2EEy24K536gDdhB/gPwuNhs2/3dLj9Cs
	T0rm9s/AqnNRPTXEqyY/rEJ7g7EaEa8nozOptgkg+yJCuc1KvCeaQbY3d/6psSMX31e55t/
	LYyyhamfwYKCImtwZGQmoUSb+Dv5L6Uxm56Z1oBNm5WEGXXgFTN3FNi6bp4N5OPqUJyCZ83
	kLr50leXhob9Sj7LvZoq9XKaDYvGGWEdWo9NX/0kIPUSpKMZMzxgKDBHHQUWLuRV1xbMn+A
	iXUgR/n4XA1He0sJRg+V9lYThymmCvm6Ce8nTOIniEnDZAZcKzVNAYKvComNx7g3Pb1PuSi
	HMyt2/rzupL7T+xq6+R1x3InEnph+SaT5m/Xv7OkNDsC1IsDe5Eg3ys37nh8TEjKhrYvmjp
	oRiU8fIRwYYg1BqhUeoKoJmQITKtEgIrTSIGsKaLrjUHgCca/xcwKbbgg0bXKC/NQwKS/h/
	JCC8kBaHaBWj0N+5qb9C/hK+id228cDx5kirO7RVydlEb/R580P8BxqLWGFr6ot2J3U9At1
	AaEErCMV7/DMusXqEKvrzdd/bnI9MH7dGRVziq7qJfYwQ4QlxUCtF6AkcQcWucuwBFod5BC
	iYhTIlwN3yaB9Eu1ccACIcOWPiewMVTJWDPzJ/pXM8asPM3T7oIAxVmV9jqAFHEe0TDWqF4
	YSJCPTr3UB+1RVO5t5Nx2QctnAhcNkI77dEuw/XCUc1C/S05MrNBaubI51Qz+DXlyP+yHHa
	VmIm2r2lF4Z5MyHlAIi3PoOPuUBOKHDWmru0CxQXRwT9rbSzLMt8dG5PRsFhT365YTt4o8d
	yIlraCDPGvWJ2GhCHXdYlM=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_202610_345570_83CB8ED6 
X-CRM114-Status: UNSURE (   7.18  )
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
Content-Type: multipart/mixed; boundary="===============7764434586350032844=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7764434586350032844==
Content-Type: multipart/signed;
 boundary=c1efa6dd65a7157a3cf15d727fdb83c765b9167dfac6b27657fb2a2cc304;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--c1efa6dd65a7157a3cf15d727fdb83c765b9167dfac6b27657fb2a2cc304
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 09:50:15AM +0800, Inochi Amaoto wrote:
> @@ -315,6 +328,123 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> [...]
> +failed_phy_power_on:
> +	phy_bulk_exit(k1->phy_count, k1->phys);
> +failed_phy_init:
> +	k1_pcie_disable_resources(k1);
> +failed_resources:
> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE | PCIE_IGNORE_PERSTN,
> +			   PCIE_PERSTN_OUT | PCIE_PERSTN_OE);

Could we keep PERST# asserted on the error path, as k3_pcie_deinit()
does? Setting PCIE_PERSTN_OUT here releases the endpoint from reset
even though initialization has failed and the controller resources
are unavailable.


--=20
Troy Mitchell

--c1efa6dd65a7157a3cf15d727fdb83c765b9167dfac6b27657fb2a2cc304
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarSYEw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvnBMBAOqoYG0RTGya7s/xnZ8oNm2v68GflTIw5APMoNFC
yKH0AQDdN3A8M5rPjea5jEI3eGpn06cdTl/AmbYmgItVl4/mAg==
=B9Ym
-----END PGP SIGNATURE-----

--c1efa6dd65a7157a3cf15d727fdb83c765b9167dfac6b27657fb2a2cc304--


--===============7764434586350032844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7764434586350032844==--

