Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710DC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svTqj7JVIXtkOEMDLkC7Vhci0vX7i5BU0ue9WPU0Q2s=; b=JdoW873jnfX1w1zSXShfKEJ6XK
	RVXFaFa14tThG5tRjhBF+CjDqwETpe0VMNO6QCTihPLmXUN8pm8hAprcicbubxtIWPBpQwZGePpaQ
	VGLC12pCoDEfUPrtKDLUo6aHxKxt8gzVFuY++NAz/rru/5Pv1wZ1VHwSk3fbZMty14Xc9/CW46nBd
	/idsJEIG04KwbCr9kkg6adsUjfGKlpKBhcbYHCTpHz51vytPOhpdZLID9L8rU/yrPyLMtpeTzFkjw
	aSn7y2vaDQQDIOoUWTBypdmNLKOBxBvh3DQPAZHAIZnf7yxhpiKnqweUj4oC+YWiJdIkZXuzBFYUe
	LmIUat3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprhn-00000008gT7-22at;
	Wed, 05 Mar 2025 16:34:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprfu-00000008g2H-3dPs
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 16:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C45DA45B04;
	Wed,  5 Mar 2025 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0A6C4CED1;
	Wed,  5 Mar 2025 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192369;
	bh=C407SjEtF5EwtDuKzqsoF8QnQAa+zhjlXin0WeMt4nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jwz4vhS0imWRcGJiRLA4qIUoweASXnEpf6CBKZwpsqd/taeSgnKkWrdDj/Tb5qw0W
	 qFZgFg84IhtayaqgH3zYeGszGoi7SzajMMhDZTzYpbNV32aXWzHXlE3KcQ9VfV68iO
	 qOUOaCM+29l6VZsxLBgucuDeOJwEV65IAg4zSy+iQyiZXni546MM5YKlJnppFAqAop
	 dVTjrUrioCb8HpcSg9Pp+rfXPAT4/CthE1xqGvx2T9TZEJsdVh3H9bRacmfoheTJ8F
	 jLzfLOzRSAaRazBOrYvEeDySJWYKxflomn7HO5XOdtFoTAvo4H+6dkCMMqm6iUAfTv
	 n5hIiPoeAGGbg==
Date: Wed, 5 Mar 2025 16:32:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <20250305-sank-hypnosis-5a41d4e59d38@spud>
References: <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
 <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
 <je4falvfemkemlvdfzdmgc7jx2gz6grpbmo6hwtpedjm7xi2gk@jr4frv3tn3l5>
 <20250303-aground-snitch-40d6dfe95238@spud>
 <ktnqf4s4hw2o6x6ir4n5hsrvbxri5cxgjyofrl76by6fwazda3@4ejw2k7k2ush>
MIME-Version: 1.0
In-Reply-To: <ktnqf4s4hw2o6x6ir4n5hsrvbxri5cxgjyofrl76by6fwazda3@4ejw2k7k2ush>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_083250_968845_8C9069C6 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: multipart/mixed; boundary="===============6783003490225373057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6783003490225373057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m+dlkPVoXaUWfOU9"
Content-Disposition: inline


--m+dlkPVoXaUWfOU9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 05, 2025 at 12:43:54PM +0800, Inochi Amaoto wrote:

> It is complete a mess. I think it is more clear to just make the
> dmac and eth device as noncoherent, and use one soc bus for all.
> Do you have any suggestions on it?


If splitting is worse for read/usability, then yes, keep it as one bus.

--m+dlkPVoXaUWfOU9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h8qwAKCRB4tDGHoIJi
0lgsAP9/rO13dyY/5sap1YMKjbfizrx1aPd+M21mdzhKleFSAAEA/3Y6yihO5r3K
7gUW5/g2qHLCepdOrlLdq8AiMiYjmwI=
=hMTi
-----END PGP SIGNATURE-----

--m+dlkPVoXaUWfOU9--


--===============6783003490225373057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6783003490225373057==--

