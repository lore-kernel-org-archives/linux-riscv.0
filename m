Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0929C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqiZ3WFhBF2yZrSW3w6O/WL0u4EWDAOg+lTKyqYSZXE=; b=F1LiSctNG7P3darVv8pzMfhlKk
	pybLEio0H1faeFjDaI69jF/7T9Dv2s0BEXIbaOgB1iqUdwhp7U15q97bEkga0QSLXsIzExwh1c8eF
	OyUp2yotpqJe5rxEx0+UzisQd3+vFIAUsV9b1nF/qgJt9aVDfPjlgV3N5ZUDjRSG4UboTvroELHPH
	W0NLR+gcHwluLxiKLV+adDNtKLYqVXNnzLrHnJqLQ0qEOkqWTsryawAhs8dZV16HWdUUkEMgtuhlH
	okFNvXdtStOHtV6EoC2U6ZyLdWMp/N8ksA5zFeYCInPfBxWGb5GAliWHokG3phECFi7Af7SvOhR0k
	Q1xypfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yWh-00000000jqy-0nMd;
	Thu, 09 May 2024 07:49:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yWb-00000000joW-3ydn
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 07:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715240949; x=1746776949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sDwPafMpIIsl7Mu2sC8mUTOsijZlaGt+V4EsD8yPch4=;
  b=krcRu2khMnw8UBi6+qegSO30XFH09oBHJ8+B5OWzTVQVjJguuWvpEzxL
   8u2lAnADvE9+mkp4FPQsH/pLzXeqwCMOACdI7T2rVg9Z0CpfDtfDE3Usp
   2ULUac1bEOcvGEu9s+gUJPpC/8rnsFbNUwXgajXeZeiwUKfs5rxiyDAxv
   As3QOJaoMuvlFNOntKrV0PADsPnrCD+bvNxJZwh16660pvdHf1Q9AGHy4
   RakU4BWfOileQz3nxOHCctHBHCLgzNWnrkpUsfahEwtCMPJcFAk1qwrB0
   TD9cvhyKoDJR1Cu4p6n8D0q3zbqgU59a+CALm3HxuY1acQUuwAQIfggZk
   Q==;
X-CSE-ConnectionGUID: b4TAGUWbRRaXvl7Tlp/mVw==
X-CSE-MsgGUID: 0hMmNNlFTQa1/hvoYYDwrg==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="asc'?scan'208";a="191609229"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 00:49:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 00:48:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 00:48:19 -0700
Date: Thu, 9 May 2024 08:48:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, Joel Granados
	<j.granados@samsung.com>, Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240509-mandatory-monsieur-dfa4d7881fa9@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
 <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
 <CABgGipU74TA3KgCH4pPuRefbnYt3q6RKcQwfyspenisEtY6eqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipU74TA3KgCH4pPuRefbnYt3q6RKcQwfyspenisEtY6eqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_004910_193733_DFF7B640 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============4710570749971533105=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4710570749971533105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ILfmNxMoEmQr18uK"
Content-Disposition: inline

--ILfmNxMoEmQr18uK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 02:56:30PM +0800, Andy Chiu wrote:
> Hi Conor,
>=20
> Should we check if "v" presents for vector crypto extensions in
> riscv_isa_extension_check()? We are not checking this for now. So a
> kernel compiled with RISCV_ISA_V still has a problem if its isa-string
> includes any of vector crypto ("zvbb, zvkg, etc") but not "v".


Yeah, one of the things I took away from this discussion is that we need
to improve the implementation of both the methods we have at the moment
for drivers etc to check if extensions are present and usable.
In general, I don't think checks like that are "safe" to do in
riscv_isa_extension_check(), because the dependencies may not all have
been resolved when we probe an extension (Clement's current Zca etc
series improves the situation though by only calling the checks after
we probe all extensions).

The simple V cases are all fine though - the DT binding and ACPI rules
for compatible strings all mandate that single-letter extensions must
come before multi-letter ones. For riscv,isa-extensions we control the
probe ordering and probe V before any multi-letter stuff. Additionally,
we should make it a requirement for V to be present if things that
depend on it are.

That said, is it permitted by the specs to have any of the extensions
you mention without the full V extension, but with one of the cut-down
variants you mention here? If not, I'd be more interested in figuring
out the non-extension dependencies: whether or not the kernel itself
supports vector and if the kernel has opted to disable vector due to
detecting that harts have mismatching vector lengths.

TL;DR: I think we should add some checks in riscv_isa_extension_check().

Thanks,
Conor.


--ILfmNxMoEmQr18uK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjx/qQAKCRB4tDGHoIJi
0nmVAP9L+cHjupn5RAFkHpZYc5Cnnq2E5GdciRokz+M5dfaZiwEA9ymnxi2cQa7X
f5iK/7u9QwmQNblOabpPI5z1wq28rAo=
=dW2A
-----END PGP SIGNATURE-----

--ILfmNxMoEmQr18uK--


--===============4710570749971533105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4710570749971533105==--

