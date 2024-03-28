Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A41CD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjnSY3JzLZDVDrP9DEspoZw4np0rks3jMOZjbIema2A=; b=itKYmF9prseaPv3H2dhiyzGns8
	7dkcYb8j3IVAi6p4oqHy9sQO0ipvzCfJ30eO2YXo3xnw83t/qjB4BiALqFwNQPyaRneMTEweqDhPJ
	Oq3rVkzdvXAwI0DWLHFbhVBKzU14tbwIZjdwJvdxASpCu69BkzxRlv9UjCEfvVmREfCjAFz3FvWn5
	LL9Rt90f+yLDT5GZvi8fhyaTph32LxweylLBhx77HGKuc85+mQg/ETr6ghMKGaqZOmXboZUMOmRtP
	osY2wizi/Pn6VigmEXpi12V+KvFkwBXLQHR/N5ZaJNBqnVW4V5l9WwEU46nXElclSUs8K1sX5nqDU
	RDRUp6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptbA-0000000EzEL-0QyI;
	Thu, 28 Mar 2024 17:31:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptb7-0000000EzDg-0DRC
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A1AD617D5;
	Thu, 28 Mar 2024 17:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427E3C433F1;
	Thu, 28 Mar 2024 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711647088;
	bh=CflzFWQh3G9/XCdPqBoPfmOZwAkygYyYMrqOyjig4YI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7CKwW0igy/TGcZ71MLSuOwuJ3fS5eykSGJpBXKVXlSUtWOMtmLs+e0+wxtCp2imW
	 1eR75PLHDUSZ0e/yoOoJnicoQ9SYbGPGEkoX1b3k0pyknZA/W+kFUFaBf9UVhYL7N/
	 7lU91ZjkJe9EsNDguSswstsgC313gQMqBbvi/cCaV7eQGbIhQV0rsZKmfVRrK+Aufz
	 ylQcXRHmxw8a/CH2CHUkDZ+YMZ8v71ITaABVZBPMjxe624wj2kg+TcRaDyDeblMxs6
	 duCn3IVCK7YErOXT9y5XwRpbKG3uY1tdOAnKCFtqWYC52APUy5BF1+xsL3jbz+MYN3
	 oazqvDpxaKZXA==
Date: Thu, 28 Mar 2024 17:31:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] riscv: Kconfig.socs: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210 for K210
Message-ID: <20240328-persuaded-arbitrary-805f12ecfe18@spud>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
 <20240328-daytime-hankie-41a57ad9fbce@spud>
MIME-Version: 1.0
In-Reply-To: <20240328-daytime-hankie-41a57ad9fbce@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103129_319663_357A4980 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: multipart/mixed; boundary="===============1040470603365371700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1040470603365371700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UcrsAOfCVzAaCjLs"
Content-Disposition: inline


--UcrsAOfCVzAaCjLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 28, 2024 at 05:29:47PM +0000, Conor Dooley wrote:

> Please, if you don't completely understand what I tell you to do, ask me
> to clarify. Asking for more information on what to do is not a problem,
> it saves effort for everyone if you ask rather than submit another
> version.

I'm always on IRC, so you can always ping me or DM me there, I don't
mind. I'm conchuod in #riscv.


--UcrsAOfCVzAaCjLs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgWpawAKCRB4tDGHoIJi
0u+wAP98BVScCz300OtHsu6ac1F9Gb4jC1iDLDZ7+TYfuDcO8gD9HiyZqmhfGKd0
jeCBdh9KSJWrMxr5ra61LsdIg7xSMgk=
=3yJ9
-----END PGP SIGNATURE-----

--UcrsAOfCVzAaCjLs--


--===============1040470603365371700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1040470603365371700==--

