Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F30DC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGBSPp1EZ6Ma9iwHd0CiqKMShqDLUVie13shIgmVflc=; b=LXjyNSoGEhfcU/Q/ulUAxB0IU/
	ZmPJXoL3owYO9ABde03TgjZWziW8YyzrvgzZy3Q6LGmjuAIo4eIQHixm8tKCVZ5lVVuIE9wSTxGz8
	2ijcBZbEG4wTxmMXOcBXJq9gY7iVDGnaaSLn8aL7PB3htCXvvEmHC8qW6hxWEvz6UWIoHxLRt383K
	EX0yi9inkzyPNqi0DdxfLZGCdPsCMsO8/LP3yA+aKKApty1UJ1GnopHmFzQVsvX0lGD7LJLuaIDX6
	SD0iuCxXwLcqsftrtFSrofi6w1dgYgqXAwtNQQHCOUWvpsR9DdK2dFq3OMGjwQi8T2xMpRcrmlVzk
	x+65jLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z6I-00000006tz9-0JSE;
	Mon, 07 Sep 2026 13:09:30 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z6D-00000006txw-0avo
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 13:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788786517;
	bh=pfKIQsbo9vF3XKUv7eH674e4/SPUP9mmFk38JxN5/+E=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=l3mgh9FwALlTah5zOJpypOJ3uMMBBc8FN0PS6a/mERDu8FSLvDif7/c+QSWEuwEq7
	 +c9gRjyECkiHC/wdfTOUHUQnIVWUE75zZYR8iREMZIkNbEa8VzBixx7tIRJvgpa2R0
	 p0F5ty2IDMyzVMyJIEhso6rIxvhj5ud7qExirEKs=
X-QQ-mid: zesmtpgz9t1788786514t356b3c3e
X-QQ-Originating-IP: 4bNg8jVrPAYnd+pOgZsuQP2LrmvmE3yfNAvXm2ENHLQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:08:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11280198482771072461
EX-QQ-RecipientCnt: 41
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 21:08:28 +0800
Message-Id: <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit
 K3 PCIe host controller
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Inochi Amaoto" <inochiama@gmail.com>, "Jingoo Han"
 <jingoohan1@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
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
In-Reply-To: <20260907112606.465778-6-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-6-inochiama@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvGGTAUhB2iWm6NZj9bABJ+Va+uyOzqPM5z3aL51H1Z4j3ywT/TNefLq
	zOSF99B910FuhjbQz4VAPA4zefQJPFkD6S6QGsANwJcCGn+TKP4d62WxPwFuKRZ35FGmiMR
	TC51OSPygT/wJySujZEZy/AD2XLJLLhihNcKxpXgDsNLoAWUoxtz66MaFbIe8as8PZ2dLIb
	8SI+onIiLUHrg6L1Svn/Ppa/kxzVLhXUXdfeKUToTHKOIPgkSfv6gjkgnKuqoMezORwahcH
	pL97M7v3mtiiMYKllZ78v6SYsUv3+Hum4NSQz9M3CIHnAn8xJERSnQpQ0E50sKbLjfRl0aH
	7T5GhG5Lw3upvsVCHDTEoqHVWoGpv/ZOMnQds9fxXiU2e87h/ddffT+FlnFrAXbefQJ/GOc
	C1DcaKoImGiLyHIJV8iYXtsTHBGfOXykvzqxJPbswfm59KktUYMYjKfkvu7ly/LgI/MEKrm
	qz3cdm/dUeHagkTlDiEm9PM+3aITfKrjd82UP6+yGKepIRbiNH0tOs2mp10LuECNpSRltb1
	Ze3gM19qcHzvVEXyQmkys+9D5dGlXSMiGwdQbW5VBaTbtmk93QSv3by95BqrkmcXU4TgNGc
	PBoFmiFDaR5lcI/jmzBK01qrCIsySvrYhdXGd4NbVmKpkJO7H56MfoTLpBDJroOPZT5RdcU
	/vkKVKenVBYWh9gPRi9x0unKALIpb+sceP6l70gHdcDlPZskzJMG2kO/epfSfmpCZb4KfIo
	Q9V5rY4PuRMr89toEjTNhh5tK81g+0NGHHpfjL+MoRgIiqvfxOOZrv+g4tiLywuOPvpiGFD
	4s+N5nGdMwPvr4F9UdyRMWOjjg9tkSU2rTYL44z4+1IviZnDKXIrRdSneDG04KS44uU2fIs
	ZwAOVGMzLs07nL5wXR7wi1yz3DU81VVK+S1wmnuzCyhwy3/xopB4W0FPQvaABE48Ygc31Rq
	Xjb5mOzTK3so06or+8PFA24WKBhJHLGxQjBteRdbpqnp/6Yr2/VBK733k2Vz7TFgoWt3ZgB
	VBhBUgNF+xLHZrUZYCSN/E0vAWMx+kF/xE3AHJwwmkjuFpabuX8jXJI6OVvSWPuld4EJjgY
	jXp0nBtOLsLnwqKaUzgP2k=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_060926_419013_FE2BB5D9 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: multipart/mixed; boundary="===============5233622251994436904=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5233622251994436904==
Content-Type: multipart/signed;
 boundary=650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2026 at 07:26:04PM +0800, Inochi Amaoto wrote:
> @@ -14,26 +14,29 @@ description: >
>    PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
>    controller, and supports 256 MSIs.
> =20
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>  properties:
>    compatible:
> -    const: spacemit,k1-pcie
> +    enum:
> +      - spacemit,k1-pcie
> +      - spacemit,k3-pcie
> =20

Please update the title and description to cover K3 as well. They still des=
cribe
only K1.

                                            - Troy

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap63TA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrqIBAPoJ1V5DULfRR0iJ/PbsZQSGaU27Bg5bTx8RdSGL
sdFIAQCo20UN07hYGkyKe/hWeA2JzbRW4qEfBzGFoFaMdr/IAw==
=WCkQ
-----END PGP SIGNATURE-----

--650bf3549e64181e01b13e7f3b0c8c6526d5423fd2d0620ee7d870eb7180--


--===============5233622251994436904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5233622251994436904==--

