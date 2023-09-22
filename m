Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F4CD4F27
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skLcxlTUJZWabgqh+VWbOaEkvaZkEN05Ys6MMzN2RqY=; b=utMoCYqdX2imJuSXsSGr9Mhdf8
	BBhh6Ce9TXF+6REY3BE44D2sr6DotouqFCV0gF+ryXsppmnIG5s0ryW78ez84sJIyidSmHQ+yGu5X
	dA1vG3UNjUCAcpNQK6H8H3ma0k8ql1thrtQ0hXguXtYSAOQOQO8Hepy3yfo56okDXu75pIjaLjJ41
	2j4dc2c8/W24BrqIIja0IX3L4kyBh8nfkTpbNZxok0gymzgQamxbN+2QA4ASDa93fVGpEfgXA29xt
	topkFinvDlm4gn99RGaiRLYIeiQbQG3cQSPpUGjaVD2PX7JZSkN5ONg7DLfVM+Vpp+ZPYh4pw5r6E
	JdSlGQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjapA-008FEz-16;
	Fri, 22 Sep 2023 07:43:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjap6-008FCc-1f
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 07:43:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E48DD62150;
	Fri, 22 Sep 2023 07:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3F9C433C9;
	Fri, 22 Sep 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695368615;
	bh=6tDdJhC5FZTkZ44FitxejpeH8ROnFdmLxtwON7CZxos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHCcR7uevrEt/tblgFyS8s6RWTN+evtBWD9f41ZMQtTiZRu+rMDyhF69JZWibazdb
	 JVJg2Pju6Hn948H42DNwQO14rVloH63//0+P2JkiaRRSgS/hiZ1ncTjS+mtqm5IvQl
	 cdTRq9/bW6t+skQeZZBWqL38+eppuIKtbmaL5DK+nQBBt6NPc60y4NPh5nyyV/3CGw
	 o4jKhBXlLPzhYw+O1geUbIltuM+Z/06YBO9nIS90CBKbpFBOEGSgNRyKHsAf+rzc09
	 HsuclSjEKPPaIk2mtSaPJTCkOOUahz3IsQMFjD/1jNhSHnAkXd1bFEFYG8UfoRaM9x
	 BryNMs7nbBblw==
Date: Fri, 22 Sep 2023 08:43:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230922-thumb-galvanize-bef393a1bda4@spud>
References: <20230920-992a56b66366f3c0591a6a94@fedora>
 <IA1PR20MB4953D983915AD8E35FD3E51FBBFFA@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953D983915AD8E35FD3E51FBBFFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_004336_644610_9C0247D3 
X-CRM114-Status: GOOD (  21.41  )
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
Content-Type: multipart/mixed; boundary="===============8001540055739967456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8001540055739967456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WhczGDiSuZFNERlK"
Content-Disposition: inline


--WhczGDiSuZFNERlK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 01:16:35PM +0800, Inochi Amaoto wrote:

> >> The SiFive CLINT has flexibility related limitations which makes it
> >> not useful for multi-socket and mult-die systems. The SiFive CLINT
> >> is also not useful for systems with AIA because with AIA M-mode has
> >> a new way of doing M-mode IPIs. Due to this reasons, the RISC-V
> >> ACLINT spec breaks down traditional SiFive CLINT into two separate
> >> devices namely mtimer and mswi. This allows platforms to implement
> >> only the required set of devices. The mtimer as defined by the ACLINT
> >> specifications also allows platforms to place mtime and mtimecmp
> >> registers at different locations.
> >>
> >> Refer, https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.ad=
oc
> >>
> >> We need a separate DT bindings document for ACLINT MTIMER
> >> and ACLINT MSWI because these are separate devices. The
> >> Sophgo sg2042 SoC should add their implementation specific
> >> compatible strings in this document.
> >
> >If the spec isn't frozen, I'm not accepting a binding for the "generic"
> >version of it. Bindings for this specific implemtnation are okay.
> >For sure though, squeezing this into the sifive,plic binding isn't
> >appropriate.
> >
>=20
> It seems I have missed a point. I wonder whether it is better to add a
> "aclint" binding firstly and then add sg2042 to it, or just use sg2042
> specific binding?

sg2042 specific, being frozen is a requirement for merging patches
related to RVI specifications.

> If use "aclint" binding, I wonder it is OK to add
> thead quirks as compatible specific properties, or left this to the SBI to
> handle? e.g. T-HEAD timer is not 64bit timer, and we should identify this.

The compatible string alone should be sufficient to identify the width
of the timer etc.

Thanks,
Conor.

--WhczGDiSuZFNERlK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1FoQAKCRB4tDGHoIJi
0iryAP9MnKwWi0NmDf7v8Kg2LJZpGsuhw2tAXlM69r9GgbrWZAD/aO3LLbNs7KmQ
32cKVwtSC7/7GIBcbTW9a81enmp4VQ8=
=mBQ0
-----END PGP SIGNATURE-----

--WhczGDiSuZFNERlK--


--===============8001540055739967456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8001540055739967456==--

