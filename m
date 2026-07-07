Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66691C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsV1yKU8e8zsc0M5Q6tAc97BCxdYtED/Ooh8A5yjr3M=; b=Rgf+b3AguvNfSVc53/bg/lOEpP
	f6XeJJXhAaD4Itk0abzbGTQchBky9mcCSgIjJEJltZPgWwis0uH03qejehc+EWyx6MHdBXCggEeT1
	oN2n/Xk8oSekDXI7TlOi+XACqjWR+4Sv7TRN4rgjV3ttTLILPjlVjalXNPb4aJnyWFirERkrrG67L
	nmPZWMw32hkwwCy+PfH2l/RFDt/W89+hCCypvFshiE9Rweb25tRKsPGZTeJA/vP2dfPDNdjXgg0kL
	/V+mqsdwAE5YWBkM2DesopDWFbRi3b/YgzVjSg/6rLM7jMQuxap9Be5HcGPQuE2uEUs3knu8tGsU2
	hXtXD1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRH-0000000Fkwn-2OHi;
	Tue, 07 Jul 2026 19:26:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRG-0000000FkwA-06Dn
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 19:26:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07D41601EC;
	Tue,  7 Jul 2026 19:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ABD1F000E9;
	Tue,  7 Jul 2026 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452396;
	bh=0/PYz8AAmDx6GuhrFyTeLVO7zjHVCWvDmL+dQgw4xUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jAjyaq67h3aIS9SIgV3N0ca/py7U5gGDJ5aC89MvU5eUoWjT2RFZfjUSEj1vuXR83
	 tYWNCEnr5HCkvXepgUF7RdE0QqgA+hLFANm2im06mOdZlQcmn4TfowtJpDxm3eBfr7
	 zDAmVP7b3JwKrQrbo06YmWuXRzbRckx7BIB/+uAQL9jG/n30RwCnt5DU+HNvCk7kNf
	 RAwD1VOkmng/NF3jVTWYOcqZJdpTQCzgZCsQ63cGVg4V6HfDGw8ighstkSVEHfejcx
	 YcPDR5ug8USqSHoAlzkOZmXGQdKb40oB3UtBvhhaOtk3sNbiEEnocRHWly7kr5H8+V
	 s/U/yP7WAP4rA==
Date: Tue, 7 Jul 2026 12:26:34 -0700
From: Drew Fustini <fustini@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <ak1S6stZ6Y1iLj2f@thelio>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
 <aky9S8A5dgIJjd7b@monoceros>
MIME-Version: 1.0
In-Reply-To: <aky9S8A5dgIJjd7b@monoceros>
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
Content-Type: multipart/mixed; boundary="===============7244505823109084268=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7244505823109084268==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wBdm7NaO/F3mvZ63"
Content-Disposition: inline


--wBdm7NaO/F3mvZ63
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 10:48:32AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Jul 06, 2026 at 04:06:18PM -0700, Drew Fustini wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).

Thanks for the review. I will switch to just including device-id/of.h

Drew

--wBdm7NaO/F3mvZ63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCak1S5gAKCRDb7CzD2Six
DHlpAQDdGHQhtjb5i4voWvj8dOvD9/iBGOUI20Vlg8krBkESVQD8Dx9SgPodnTs4
Y2Jx/hpo8cNk9JmOdZ9qfpeGwS1pPAE=
=rAy4
-----END PGP SIGNATURE-----

--wBdm7NaO/F3mvZ63--


--===============7244505823109084268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7244505823109084268==--

