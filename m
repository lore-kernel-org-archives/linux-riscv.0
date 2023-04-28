Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B588BC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uMOVxlvoKlPI8vNOcdOrlAR++xNciayZY1R/pwz+Uw=; b=cbZPE2YT6Cn6ATRT5aGpHn32Lj
	dxYcXQH2QeTrYRdoTnuOmckoyqyGQPcCXADi4BdA2WzYcvCH5YZWLOTGjR0y+mONM/6RFJH7RS6gl
	2rVkKuHeL97UXR8nLa7bRdCvxayzdPJvdaqHGB1ftVlsbAjWLD6GZKh/7UHTvrYzMiAuKvGeJb8tJ
	B0ucEM64cG0qjOc1Diw9Q9209L4If4y+sft9f1Cznu6BgXGCJnQhpg+22TXKpWBwuqzm3Fnw54Ln3
	rRW7xzJ6AIsAX60WANIH8a7NT2ZgdkDmlD/ZmIvKGbSkfPFrvJmDg3DweWMWx9uWGRtKEQHQmgcLP
	BujSKq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psSys-00BWWB-1Q;
	Fri, 28 Apr 2023 18:38:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psSyp-00BWUn-2V
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 18:38:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF1BC615C7;
	Fri, 28 Apr 2023 18:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C67C433EF;
	Fri, 28 Apr 2023 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682707078;
	bh=KT5vios8l4FhVhmreslYblBZoac+mOoSTRH/woainQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWOqKyvAqWrnh3ktvUVEAeIO+FIJzfFswpl5fAAew6OAZ25MvP9GuMYxpTMLeKK/P
	 N492Kz6vBm58IGKH/VMQKb6A2xzWC+QSDo0DcSCbWjff8Epth/zB9RRr6AuOU5u2rq
	 bsE0wvqGITFZro506gz22oWUjWdevSlV4M8T+7BeADK/I31NN6H9EJw3Pmg5CgttXj
	 jD8TPzjlRc3A1wTJPXcoYwG+sh69+QRyZ987sCYxbCsqIZkWH/YlwrXyjZa9o36UFa
	 PXjWOgFLR/c8AcBQPnaSmTSVrTqow3wHSBjhB6QSGcn4HpqEbZGzatAbWSTf1lHOC5
	 0AEPZ/APDNzYA==
Date: Fri, 28 Apr 2023 19:37:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: ajones@ventanamicro.com, aou@eecs.berkeley.edu, i@zenithal.me,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org, soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH v2 0/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230428-flagship-algorithm-9f10e99a184f@spud>
References: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
 <tencent_D5671CCB7149630242B61A1BF8B80581B409@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_D5671CCB7149630242B61A1BF8B80581B409@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_113803_877901_877D562E 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============1828961067022714448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1828961067022714448==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdNPN6rkklY5NcK8"
Content-Disposition: inline


--VdNPN6rkklY5NcK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 12:26:00AM +0800, Yangyu Chen wrote:
> Sorry for the cover letter being detached with patches. My mailing
> service provider will override the Message-IDs which caused this=20
> trouble. I will send the cover letter first to get the correct Message-ID
> before sending the rest of the patches the next time.

At least it doesn't overwrite the in-reply-to headers also, so the
patches are at least threaded.

> The cover letter is at https://lore.kernel.org/linux-riscv/tencent_8492B6=
8063042E768C758871A3171FBD2006@qq.com/
> The patches is at https://lore.kernel.org/linux-riscv/tencent_85F69423082=
E524C478844E31D5F8920A506@qq.com/
>=20

--VdNPN6rkklY5NcK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEwSgQAKCRB4tDGHoIJi
0nxmAP40dDtM5k+b7eEMGlkWF09qJmHYGklxsdAOB6KMP/xl1QEAjndyYJNKsHoI
mum0oxlHxq990mKY8gdGloNMwOuJyA4=
=NSep
-----END PGP SIGNATURE-----

--VdNPN6rkklY5NcK8--


--===============1828961067022714448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1828961067022714448==--

