Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED788CAC59F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 22:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Eb4eKSvYydncVfBPzYbNONSQU9J84JQe2AG4OqR0YU=; b=lo2yVk6bsszS/+iX4qOot//6O5
	Q6Q/Gu29xgbMQf06tf0jN1XJQvDDDCD901QB8QAO0TPCElspcp4I51tRLmydcnbFBpBTAJUDnc449
	YmDraaUrz06Po6hYuTqwUZanNs3oOjCE9TmtCKLqm3GH0CyzEsNDjd94HPUg8IorY3BcHXcguPhf+
	vuyhmbrU8RpW7mPmzXwqmJurmf/rthPb0zuaFiOOAOJpJVwQQTM799VQQhz/VDQ21k0crAhlesztr
	dwEU1l1GAAf5NCf7hM+ERdzxD3TqifhTGFTfbRPYy3pZwvAbK5cQWbqokQu8XlLXJ724SiZoyAc6m
	lZ1lpZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0U3-0000000FCzN-1bTx;
	Wed, 17 Sep 2025 22:18:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0U0-0000000FCxE-0kHQ
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 22:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758147502; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nBE0qAD96oeV19lQZr8E0NjaLxoWvB0jgBlajshoa/O5cKG/7nCHvmpr+1eNMJzoveQ1BYXhnOMrW73lxY/G4r05nzoOvGnDWKJ84jiFmdI1F5ulao5lk5ju9Q+WSEZjU2Uf9v9BEoeFs6MwJVjr9lXDCBifwGlGCfX2Nx+EZBE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758147502; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SmRT7XrOnFZUcQSEEWJW9mAal75IRBUO1H/bYI3eI6c=; 
	b=NzVDIFHvdLSXB2uWjgClO8n7uCGKBWxMYNkRzHet++HlSp3NZX2R+Lxk+dkOhmFcBmLGMxVvwr+dV6PDFsk1d7P/3hkhqBbpUMVw6/F7X1/tCSHw8sMBrjcs22opQhuNNvHSbMBAJeHpXPsq5SoM0BlIpe6ibHminnhftacXorc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758147502;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=SmRT7XrOnFZUcQSEEWJW9mAal75IRBUO1H/bYI3eI6c=;
	b=ZZhhSZtGafjSiuoJZoLSdScrJOKz28apFezuJMJK4TgwKEZ5HJkX5Dc8QWx9d1im
	3JnT0E+2RU1c2fcqcTk9fFE+vR+VuaFXb7n8rf65Xjf07D35zTLYK7BcnqRK6TlFxsG
	ayw7W3iN9nw/L8Q5jLXr1n8Wbr9nhNvW5lx4qXQo=
Received: by mx.zohomail.com with SMTPS id 1758147499547326.778506325556;
	Wed, 17 Sep 2025 15:18:19 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id D120F18067C; Thu, 18 Sep 2025 00:18:15 +0200 (CEST)
Date: Thu, 18 Sep 2025 00:18:15 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
Message-ID: <7ru5tunm3vlmtuulkbc7kpunyim3ks3he4ielc77ivm7vxieqk@iw6xmwmsn3lk>
References: <20250818074906.2907277-1-uwu@icenowy.me>
 <20250818074906.2907277-2-uwu@icenowy.me>
 <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>
 <aMm6UIMTFOH0Z3Ug@x1>
MIME-Version: 1.0
In-Reply-To: <aMm6UIMTFOH0Z3Ug@x1>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.96.42
X-ZohoMailClient: External
X-ZohoMail-Owner: <7ru5tunm3vlmtuulkbc7kpunyim3ks3he4ielc77ivm7vxieqk@iw6xmwmsn3lk>+zmo_0_sebastian.reichel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_151836_282057_575FBBDD 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============3177014588059732200=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3177014588059732200==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6tltlbzi43cl2ip"
Content-Disposition: inline


--w6tltlbzi43cl2ip
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
MIME-Version: 1.0

Hi,

On Tue, Sep 16, 2025 at 12:28:16PM -0700, Drew Fustini wrote:
> On Tue, Sep 16, 2025 at 08:22:02PM +0200, Sebastian Reichel wrote:
> > On Mon, Aug 18, 2025 at 03:49:05PM +0800, Icenowy Zheng wrote:
> > > This driver implements poweroff/reboot support for T-Head TH1520 SoCs
> > > running the AON firmware by sending a message to the AON firmware's W=
DG
> > > part.
> > >=20
> > > This is a auxiliary device driver, and expects the AON channel to be
> > > passed via the platform_data of the auxiliary device.
> > >=20
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> >=20
> > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> > Greetings,
> >=20
> > -- Sebastian
>=20
> Thanks for looking at this patch.
>=20
> What tree do you think it should go through?

I'm fine with Uffe taking this together with the second patch or I
can take it and provide an immutable branch once the second patch is
ready.

Greetings,

-- Sebastian

--w6tltlbzi43cl2ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjLM6cACgkQ2O7X88g7
+poEjg/8CGap9CHM025XqzM6ldM8EKrDBwYRnSNsZPCtSkh4HGSAeUnsGbGG1qjw
fW+0ntyctMO9qOE0xrHzc1KtvZnWiHgGeHwOs0MLMwGME1+TQ+qYe/dF/ED47Pcc
4jsoTqjih39dmXMfA8xKBRO/cosIntrqGHGcNdEVyl1LFc8p3pNztPnYrSQiNYSL
7iXgOZqMYGdSw3eEAtg9nEreog9CZkmbmEn4dj+KBdwir0x47WN05FmJlWlgX2mc
5tul9fjvdK3oxVVT8FrmZ066hn8rpPH8+vdBxbWc43A/kJcF4rNIqf7rC2wrAHcL
bNHmUN7Nc8dMkmjm+v2ozG7uIBSLvuLoighxWvVEAPDTe3FTaVh2BSfEr1mmrTrY
uoIVF4TjEZGaMlwVUVUWhmPvKx0X9jsfO6z/YFqtQmwtLdJlnsydZAHQUNg0LG1W
U+WkH5w1NI/xw3GR3TtiJeiUIaxRkUl9N8bhebabtbEWLihEpnPWxscaAJe/+Lmr
OlcplQWPmKlkuioAzkdehZgKM4hquEblLuGtn/fNdOmFVwQY/T9/mhAFFAj2MPld
qit6UU9AsyRZgpRkTfqkygKjQVb9rnDHnKEI4DPb/BfSTcjZUPIlv51y+/El61tr
rxDw1ttlRlMmXArjnemcExbOhOeiftumhhoPlLln3A+Vj2d2j8A=
=LvX1
-----END PGP SIGNATURE-----

--w6tltlbzi43cl2ip--


--===============3177014588059732200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3177014588059732200==--

