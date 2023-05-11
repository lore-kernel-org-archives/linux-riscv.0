Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC46C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3Ee+EgbVGs2x4a4rculK/t7AGTzLKwwOH3hYbTG+IA=; b=NlZCKjpIORunnkAW2Mr+guEar1
	tOrNo+H4Jen9m057Nec+5Yv9Hay1dJbFNn70MGj0aaQsuSK0d3xO0bEQ9Md4Uhag+JJQDomzYi6Q0
	0m+3lutvY6ZJhRlPxOVYlEme8PME1LDQyh2XX63FZcDP/BdsfOYHmsPlE6W+XSwnZC1LFTlSnWQp0
	pT77XD/sYKXrgQp6c2zbkoCmJUmrLPpOs487y0UUJqJCUVn/GHuhfNKwQ/EXzjOsmPipKOug0LNvr
	qW0qoYQ4oTfC2S6iN+xDOH7oaHu/Fp4ewgXGO6cKAHfMQrmE1zINJ+B1gmlp8xtsjw1K4EQviz7gl
	yt0Ar87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxF57-00AFEt-2S;
	Thu, 11 May 2023 22:48:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxF54-00AFDZ-2w;
	Thu, 11 May 2023 22:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6759C61347;
	Thu, 11 May 2023 22:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827DEC433EF;
	Thu, 11 May 2023 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683845293;
	bh=rOH5f9jhgIQOxgpJ7gvL6+asAZ61e4aqc8BMhuV/e7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRFgn1kCkG+kTaqkSZD4uqu/lNM4l/xANFvMls4AiGgfWP6ZnvFC5NLld4Vs5Bc0Q
	 Uu4spvSUS9LWhPzXYB1XuGUgYaHNSM/cQGzoH6E/C80QvPUs2qH0L8ttSF+/I6aBK1
	 J+7JAll49Zrbw52iO6niwiYqQalk42Ut1XNeGHXDWHDW7fHlbntWSoLXpo9hPzlx3P
	 4/Yu0CRgDOHw2APPp5u/ayBlkaVHzLrVXYoXRBodIZSggId0JODS8/VXySVL0x3c/Y
	 PETM1L0yIurMZgMqbW3LR4iphVQyWfMzeE14/NIPNo51uInGfJiIetfrikF95AukSP
	 M9ezDqy0jqLAw==
Date: Thu, 11 May 2023 23:48:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
Message-ID: <20230511-leverage-backspin-34bcde885006@spud>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
 <20230511-boozy-comic-5bc8f297dc8e@spud>
MIME-Version: 1.0
In-Reply-To: <20230511-boozy-comic-5bc8f297dc8e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_154814_991529_DC4EBCA5 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: multipart/mixed; boundary="===============3767019902778305366=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3767019902778305366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KynvZX22npN01eSI"
Content-Disposition: inline


--KynvZX22npN01eSI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 11:25:41PM +0100, Conor Dooley wrote:
> On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> > KVM_GET_REG_LIST API will return all registers that are available to
> > KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> > regression issue during VM migration.
> >=20
> > Since this API was already supported on arm64, it'd be straightforward
> > to enable it on riscv with similar code structure.
>=20
> Applied on top of v6.4-rc1 this breaks the build :/

I lied, I forgot W=3D1 is enabled for the allmodconfig builds in the
patchwork automation.
The warnings are trivial to fix, so you should fix them anyway!

> warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_=
vcpu_num_regs'
> warning: Function parameter or member 'uindices' not described in 'kvm_ri=
scv_vcpu_copy_reg_indices'
> warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_=
vcpu_copy_reg_indices'
>=20
> You have a bunch of kerneldoc comments (the ones with /**) that are not
> valid kerneldoc. Apparently allmodconfig catches that!
>=20
> Cheers,
> Conor.



--KynvZX22npN01eSI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1wpwAKCRB4tDGHoIJi
0oATAQD5EHTulvItTCXcBqe+kpBl82E5bTphHX2ZgHgnjZwK6wD+ID3b1Z7gRijz
qKmRHxrIJcJtYMnnhHq33dgNdML1aAs=
=wPq7
-----END PGP SIGNATURE-----

--KynvZX22npN01eSI--


--===============3767019902778305366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3767019902778305366==--

