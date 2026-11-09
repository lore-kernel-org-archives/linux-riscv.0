Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB45606A33B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vhIzcADK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=RzuplUmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:To:From:Message-Id:Date:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eop4tL2KMfzO3sErvEtx4diqBP6m4tiPkOhjZITBEsk=; b=vhIzcADKw4AlB7ecKRm6KUNYfn
	YjY/j/PU4rm3AmSMW8Jo26nv69bie0XWNs5Hpl196CDGKjQTeaY2UYpP07SuYe0WRcLQL4c3gqvlE
	KrM2LGgyOK3rJ0WiYiWtumQbD1nU37VnWwYU47JZZbfdoSddoOd1XEwz1kP+irEcduQpyn53FNHfF
	GNuRU+IBfCcvzkYFZBvbBqxNA6oNWLBmLvSclBVEytpuAllpOoVtPLjkNMRHBLLtvh2VDP3cU5ItA
	9OMdYDhxXqt5DseuuVugP/oy2HzlGSLgh22MHURtbyPeIExBL/8Xn8ZKzrzAL6nYQBJhSOZTGFuyF
	jeCigpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJZc-0000000HYDg-2Meb;
	Mon, 09 Nov 2026 07:13:48 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJZZ-0000000HYCt-0UcO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 07:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794208403;
	bh=kJVLZj1Pk3xwWcg8tK9L4RRH3pYszRMc7fN60jkYOvc=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=RzuplUmVenoVBR2noYVOzk8sONCpodCMQ/wb13eFDN3vf3VLIFTBSngZ+yzt/KBbU
	 VqMr2aDeQ1j9hVrT2Y8s4gnDUChgjte8U9T+PkOKVGslVRE7pR/G/uZNA0Enjzmo5y
	 hlKlIXYjLz3imXPZkgbytCWZiLsubur8qeqGdoGY=
X-QQ-mid: esmtpgz10t1794208400t3ad1583a
X-QQ-Originating-IP: qo40GlWADYFxTR7NC+gq0T9seFJa2UapBBDpklvpw/U=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 15:13:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14165528735187761627
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 07:12:57 +0000
Message-Id: <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
In-Reply-To: <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org>
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
	<20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIODS64eMatOtLYkCYprGJLH8gStOTN7ayneCZEb7cAqjI18Lf7bOP+S
	R4U+GuZxC4R65LKC2xE6bBE7HXg4bZOgeCJFKRInnBN8Q7K4xF3nUtUFh7l0uctRu1ivNnh
	pBU6oDfmtYDNa9Qhw/Ijc/TTAgIDVSBdrtZiPcyOIrJ8a53hf5j5WsHMT/GSFQaK5p6M777
	VMnI3IVLHQc+OM/bqX+MA4V20izD/ZZKAgE5oKnVe/rJDAPuYXH7OWLZ09W4yDo6IHTwV8H
	X+7WEW8Abyxn7AcEXt/9E4LNgpKpliHRZrwB3Nb4Tcb2A07q9yiX0I5qYPV2UgJ/KHw7wHj
	/rxkbECA+TaNPWAGp54XsGcI9XDsU3AFm2siCkPcsmcsN+9pt3HYT7daSf9O9+4I49Z89cV
	BlhNTr8tjo1m5ltBI3s5hUPQdk9P65rC8bHIXUWrIWyrqOJ8AQTpOeJQLgaLJIJv4DISIss
	3I8DuYT8oDFNWr3nSGSBF00rKDucMtovTIbAVEQT7KipGOXMvcYBBfzLO2ij9EL+XYd1BDk
	+L6kAbw3vT+aKV+YnQ+ymOA6+gVuQWcs/Mn1teZutlnTd91SxUbCsmWUJ+OniyNDSCKyM0S
	udNaZO2gGXwgwswcv+1dhz94t0YEbJKV5TVWP6Mg3EPtdqLkPcRMGVouNJNglS2gjTx0IkZ
	VoexwHmdMaf+nxIjBhWiEcc6iqZAoAQ7Vu6Hxs9tHsN3D3ySzv1ZyWqzUJh7tj1P4ETmP4d
	uG0HMnN3ctNAbUAG0lgEft+ZkQu/AY8BOuWnrjdsMEj6nWP8Nx6EJCukr5mefs57368aLvT
	Ha7ldmpfuxI4dFO5k9r6czpeghO1kG1vpbgRpIcyaIZs+0L94mGrwYFZePPoWHzWNHokk6+
	jjWBFNI5F0q+vBOdT5qgXZxdJ9Z/TRCKUIxyuuTeIk5smXXWniTz5ewk07vqJUfGaB7RyjN
	41QZgA6Yv2c2fiVmgAkxfVj6FHQCss2U3EKST7fJApCIu3/2nKNjYp5kYpSLNKrPnoTN4Bc
	YF2NxxMj0xOg/W09EwpeVBq053aFQtBkbyvDPZ1GK9rkCGRB8oyFe2DCbQsf/+ZE+POrtUa
	4fX2XLlZit3
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_231346_341863_4C5DE5A1 
X-CRM114-Status: GOOD (  12.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: multipart/mixed; boundary="===============8235340349708844571=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8235340349708844571==
Content-Type: multipart/signed;
 boundary=e332fbce858a9fc00b10f2e696db37e3970b3372689d66af046121bcb587;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--e332fbce858a9fc00b10f2e696db37e3970b3372689d66af046121bcb587
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Yixun,

On Sun, 08 Nov 2026 10:36:02 +0000, Yixun Lan wrote:
> +config SPACEMIT_PM_DOMAINS
> +	tristate "PM Domain driver for SpacemiT SoC"
[...]
> +	  Say y to enable device power management through PM domains.
This is tristate now, so "Say Y or M".

[...]
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/auxiliary_bus.h>
io.h, err.h and platform_device.h are not used right now.

[...]
> +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
[...]
> +	if (ret) {
> +		dev_err(&domain->dev, "failed to power off domain %s: %d\n",
> +			p->name, pd->pm_index);
> +		return -EBUSY;
> +	}

-EBUSY drops the -ETIMEDOUT returned by regmap_read_poll_timeout();
why not print ret and return it? Same in spacemit_pd_power_on().

[...]
> +static bool spacemit_pm_is_off_state(struct spacemit_pmu *pmu,
> +				     struct spacemit_pm_domain *pd)
[...]
> +	return (reg & bit) ? false : true;
return !(reg & bit);

[...]
> +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> +{
> +	struct spacemit_pm_domain *pd;
> +	int i, ret;
> +
> +	for (i =3D 0; i < pmu->genpd_data.num_domains; i++) {
> +		if (!pmu->domains[i])
> +			continue;
> +
> +		pd =3D to_spacemit_pd(pmu->domains[i]);
> +		ret =3D pm_genpd_remove(pmu->domains[i]);
> +		if (ret)
> +			dev_err(pmu->dev, "failed to remove domain %s: %d - state may be inco=
nsistent\n",
> +				pd->param->name, ret);
> +	}
> +}
[...]
> +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> +{
> +	struct spacemit_pmu *pmu =3D auxiliary_get_drvdata(adev);
> +	struct device *dev =3D &adev->dev;
> +
> +	of_genpd_del_provider(dev->of_node);
> +	spacemit_pm_domain_cleanup(pmu);
> +}
pm_genpd_remove() fails with -EBUSY while a consumer is still attached,
but pd is freed by devres anyway. Set suppress_bind_attrs like most
pmdomain drivers?

--=20
Troy Mitchell

--e332fbce858a9fc00b10f2e696db37e3970b3372689d66af046121bcb587
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFyeSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9MtQD/aDe7GEsQxXem
tqumpi4bxtTDHQPVsbj5Wnjdb4MV1uIBAM48sFNsLNa4JF/Fk4zZ+5Dmf0vEjAGt
+OkFbGjc5/oK
=gTan
-----END PGP SIGNATURE-----

--e332fbce858a9fc00b10f2e696db37e3970b3372689d66af046121bcb587--


--===============8235340349708844571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8235340349708844571==--

