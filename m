Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B6C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41E8wpQrM89W8hoNLcrA2LIDgDTPim55NCU4R83Qs4I=; b=r2vwbUnMEuYqz3QGWgoLsTczit
	veHcnJPnxkebZx33yXPO/CFM03vmKXDMp8EQJyiAxdV1lfPlpM5y8Ngnsxc02zSOe+T/nCl/VsMqn
	GINwMpP7uJmcwjVcmUMWYh8+0GOpHm1dA3s4wZ6ZlmA4dbu7xC4Cs4/IW7b76rt2h9I+Hl4R7PKax
	9YrU34+BDG5ZOy/WKZdNOeC0oD5OxwunqBEWrQi9tberTHtV1wlWEKkG9Ir1IHvazGu9GSZqv/xTJ
	VJNGSnsDQ2BP2XT29NK81+iIOOxQEN6UD0MloaCKdcrHcRh5junST7mvy4CVzjg5+P/tX2rCd7sBv
	tAiHq4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjW6-00E05C-2G;
	Thu, 18 May 2023 19:42:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjW4-00E03z-13
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:42:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78CF061CE6;
	Thu, 18 May 2023 19:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAF3C433D2;
	Thu, 18 May 2023 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684438940;
	bh=kagisqiUflhHKXt65nKKdcvfz9NOOF0MBvMvX84P98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaAU/Ip1xoU/aJ2js9QJaEOr0E8o1u19morcs77+0Hb87dU65U6n6kvg4eGxd1hHc
	 skqffBXmlh5wo8/dlH2esKOf4dh9Unusn9GzfAyH0Z4TfxVpzkgQhnap6YWVr8zrdD
	 aGfO2lz8w/WZZ+5G+DODyZENOF72QJiEC3yCjTd2pMQ/PWY/Z5CtcSDednvPhC5bkP
	 PiJdUz7/YkrqVuhj7ALqKV8ddyjtBxcGlZeXp71B+oUApEjdrS52//H+ji7yaSk/Db
	 Q0/HNVKFg3ca1WFFtLIzgcbflFEsZVSiCZOlBHFPqlSCT3Fk14qhZIgQDKc0JIiccH
	 NlpoQQOuubW5w==
Date: Thu, 18 May 2023 20:42:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 5/9] riscv: Add the T-HEAD SoC family Kconfig option
Message-ID: <20230518-affected-tackling-5b2f97debbcc@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-6-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_124224_406408_3A337854 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============0670636174060851774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0670636174060851774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eK8PStAoZ5yEhGV0"
Content-Disposition: inline


--eK8PStAoZ5yEhGV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:37AM +0800, Jisheng Zhang wrote:
> The first SoC in the T-HEAD series is TH1520, containing quad T-HEAD
> C910 cores.
>=20

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--eK8PStAoZ5yEhGV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ/lwAKCRB4tDGHoIJi
0jRYAQDJpFHskC8YlHAcbhrUQGr4fUTv65zT24FhJw4zJPSuXwD9EnG3KcGr/emW
M6ddKLwnWG4cHXIR5MbLRXYZKpzyPww=
=tyBT
-----END PGP SIGNATURE-----

--eK8PStAoZ5yEhGV0--


--===============0670636174060851774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0670636174060851774==--

