Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA23CC88E7F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 03:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMt+eZQdBSiZuQMfA8ILDQWvklHsh1R1rC1zTZQhL/Q=; b=WDHJ9BY6TRkupuvQoSVGvNpf6S
	hSQRwKgabtu1Prny+a2AO2dBT0NlN1ioqCg4HFrcsFB4JSBNHnk7Sr15lj2+yeHTRqBXKvqGml7hM
	24TTtB8OOIoQKXZtvJaVF2+jh3j0MEF33YVnZrusxuyiQtR+XC2e0ThQYs7c8T9VpIgG2/kFv7WtE
	aJB72d6LLr+41eudyyEHNJSIAUUx8ne27uLYMeLaHusVBrjbCQGpyn1WkI20RXle/rKSQI0SlwCLX
	kOOdyUVTiqpDz0qTGcJX5KmuxL/nSz8VC6vX98oEHR4v1bxyLdMlZuRf3M217s5B/9614x2NiBkJI
	dVlX8mGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gOk-00000008FGR-2eKG;
	Wed, 16 Sep 2026 03:33:26 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gOg-00000008FFJ-0LYe
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789529553;
	bh=jWMvUUzOrPmrKHCXu38aWsr263gil8jmTfO2LCzoeEQ=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=h6lM0rmM+keBiaqQ47c6pYEwBA++ynrOjk2F8jjtQNoV0bkNIS/mzeogjaUD/Q8SG
	 9pLqBLZfOb6nrDxtKYuTVwClFDzUhzsVqfm1Ef22yeGv3MMBFJALVTb8TBNXZBk2I+
	 NMqiLjhhBC4CXG4LFN/ZKdcdzXt9x/FvaDFCNIbA=
X-QQ-mid: esmtpgz12t1789529551tb0ab28aa
X-QQ-Originating-IP: p22YVTVAZzBPPbaX54GpBXgf19M7GP9hjLcXXtG9R94=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 16 Sep 2026 11:32:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8476099243940458162
EX-QQ-RecipientCnt: 41
Mime-Version: 1.0
Date: Wed, 16 Sep 2026 11:32:24 +0800
Message-Id: <DLGFA3K9UNL9.AZCYNV8V9WM6@linux.spacemit.com>
To: "Inochi Amaoto" <inochiama@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Jingoo Han" <jingoohan1@gmail.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Frank Li"
 <Frank.Li@nxp.com>, "Niklas Cassel" <cassel@kernel.org>, "Sherry Sun"
 <sherry.sun@nxp.com>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Bruel"
 <christian.bruel@foss.st.com>, "Krishna Chaitanya Chundru"
 <krishna.chundru@oss.qualcomm.com>, "Senchuan Zhang"
 <zhangsenchuan@eswincomputing.com>, "Alex Elder" <elder@riscstar.com>,
 "Xincheng Zhang" <zhangxincheng@ultrarisc.com>, "Randolph Lin"
 <randolph@andestech.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Vidya Sagar"
 <vidyas@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Gustavo Pimentel"
 <gustavo.pimentel@synopsys.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
In-Reply-To: <aqEOHmlKdKqQWYE8@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-7-inochiama@gmail.com>
 <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
 <aqEOHmlKdKqQWYE8@inochi.infowork>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N5YGPHbvgCRTpV7+YJPgE95YSIdsTl7xwOgA7r+yMD53mG6YY5im8Men
	0raC+xB89Gm5EY5f/LEAE0IX6f+W1CjuCYup5dxSxeAP7wZMqqHkXDeuvvA+dx0BCJPzEzF
	erPGCuu0I7kykIHDKkzuqhkczkF2cICLNzdeqz784h8szuMKLzfV5H+q18vxFg93KJ3vpL7
	T3w0C7rLbT+iVpPl8dL72tskpN7VDAdREiaNj0J2at0ORQhyHUrfhZSbxk08EdklUQ4w+fb
	l05og5qGg+tR9/W/ouTsG3FPrH/YRjXjTNVfF9f4T1NEed7UB+/VBVkq4txMyYjrE+TZI2n
	RN4MVBoFG9MRFsNl9U4NOe7S1VmhiX9KaZMB3j7G0Uu3ZDx1ORI8Ie4XnfJKQHhrf5aU1w0
	sTJkyzl/VVOpL1cPbNdPIpsHhE4FQeWIdAn3/qJhDn6Sszx5UI+3mrPsANtZYOOzb0VLpLH
	P1Q2lXBL0yTkQBKbDiZ08FTg0DFat9Vq5xosc6kYPu53skH6Gs8OnPrRQdLfbWq3wfVyzvg
	NgZcDbjMS0DTcSgQBssrKoMoaolxA/ewRsrQLW1R1lpeLDZ+seUbGScJpWxQWyM0GzmFDXb
	cRyrAtoeVxxLpo9n22VPw+aNd2ArR+iJ/EdeTMFScp0tZu66QiaLwpVYiBcYTgNl7f+QY6f
	ardz5fKKOCiK6C+H9m1KJ6U1Qx8GIarNREbRx1uDgGuA4JqD1N7tOoBD5NehxOnad9yDxgn
	kZredNGB4HwrE0xSGjwHNQTCdw/DgzHHs43WlIIVEHGsFgXpiT7y+4QuLULeU0g6su9HRlK
	9scRckj4Xa+U/xmwnQxE3+vK47QrFiao1qnr+Q6003/e5eBT/4XZgTuovVDGtm7u4PmozK/
	cfL0uC5BVyLlWZIuXo+ilJFthwUfyzaOVxlVL2PfU67r02Vfx5mIku5YHvzHTxRKcNZ1m6C
	A8DSmTF9mVh4eP+Xq0tHvS0Oio3+hIxrv+F2N0bNrurxkT5Vied2iba/wy5aafjkuov69oA
	8AE9tIC+AkspZ5Dx+dySXhedljuqTcr4grkdRdEBRjPlavAbSzg09rX1NVDWKixZlrw4LQm
	A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203323_027588_F84012C5 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Type: multipart/mixed; boundary="===============8851475887892565863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8851475887892565863==
Content-Type: multipart/signed;
 boundary=98c1991e3a84cabccc87599576fe5533e92c3b07b62de26e2101639d3652;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--98c1991e3a84cabccc87599576fe5533e92c3b07b62de26e2101639d3652
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 09, 2026 at 03:51:02PM +0800, Inochi Amaoto wrote:
> [...]
>
> > > +static int k3_pcie_parse_port(struct k1_pcie *k1)
> > > +{
> > > +	u32 status0, status1, status2;
> > > +
> > > +	/* This register require a RAW for cleanup */
> > > +	status0 =3D readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > > +	status1 =3D readl_relaxed(k1->link + INTR_STATUS);
> > > +	status2 =3D readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> > > +
> > > +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> > > +	writel_relaxed(status1, k1->link + INTR_STATUS);
> > > +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> > > +
> > > +	return k1_pcie_parse_port(k1);
> > > +}
> > > +
> >
> > Are these status registers accessible before the controller clocks are =
enabled
> > and resets released? k3_pcie_parse_port() runs before dw_pcie_host_init=
(), which
> > calls k3_pcie_init() to enable those resources.
> >
>
> Yes they can. It is something interesting.
>
> > The SDK uses the same ordering, but I am not sure whether it relies on =
firmware
> > leaving the registers accessible. If so, would it be safer to move this=
 clearing
> > into k3_pcie_init(), after enabling the resources?
> >
>
> In fact, I have no idea about which clock control this MMIO area, if it i=
s dbi
> clock (but I guest it is not), it is kind of weird for this clear and sho=
uld
> move to the init. Do you have some knowledge on this?

I checked with our hardware team. PMU AP and PCIECFG share a system clock
derived from PLL1 /8 or /6.

This clock is already available during early boot, before PCIe controller
initialization. The register accesses in k3_pcie_parse_port() therefore
do not need to wait for k3_pcie_init(). That resolves my concern about
the ordering.

                                            - Troy

--98c1991e3a84cabccc87599576fe5533e92c3b07b62de26e2101639d3652
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqoNyA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvlUkBANa2w+Z52VSTg6VPhIdnN5L53HC35mTROdqQpRPi
nqx2AP4rMeIb5iWf85lMB8tpSZ2nnHapBGg95rVgzpbj5/TeBg==
=gkSx
-----END PGP SIGNATURE-----

--98c1991e3a84cabccc87599576fe5533e92c3b07b62de26e2101639d3652--


--===============8851475887892565863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8851475887892565863==--

