Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98041C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWMrhxTBC8ZeBF3IYRqjz10h8y3GQjIkWb9iBoEzRzE=; b=iuz9+cgiShp7gJm3zC90qXCQhs
	rY166Nha4rrdcBUIY2w394+hSVZW0uaVkJ1yFGtTLNcRrwjNxZTl/SOshyYfDKf/X9WOjFe0F1FRv
	LLCNW2SOY0IF0quWtkzHzPnTOxrrcHdsYXqu2UlgrvDlKADezNkAfSTK59rmGaJniPI0AL9IdH2XY
	JRT7+SvrIt5btjOA8GhKg41NK3z3o134kM5Gq57L8mf3zGF7u8M0oKlXEcj+4ovZJXDVvqSq3BXyd
	b2ycYU6OzCO2RrVQlTTyCb/qBD49MPS28tRUkmwIY6RXWnqaogsuSRN4ThSUsKyTwj2j08x2Qy0VI
	ML6c9NCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEjO-00AAw8-2A;
	Thu, 11 May 2023 22:25:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEjM-00AAvK-0u;
	Thu, 11 May 2023 22:25:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9811C63DF9;
	Thu, 11 May 2023 22:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72C6C433EF;
	Thu, 11 May 2023 22:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683843947;
	bh=ULMjF1ezqz7St5bBienNvAvCIvE4TfTmf4qQzCY13so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1RbWwzc6MezmvlRhRRnsO95dj3YkJq+62PP/cg5FMd8pWxUwNUsLntuUej2yq4KM
	 xQNLHGFZ9tGMQyoxW7EKYCTO0HBldYt2xkhCBvjDliCDHJJgeJAzd1f4AjDQhcpG6Q
	 ja4az/oPKzw4SHyTdqe6Avn+GWzA/+BGLsX6p/RPX49hIBo0t+owGFffsNTCuBzgJ5
	 6dcBeJVOAbm9tPxrqayleNlt8pmVLRJFfEzblYtRBD1SK4PQrho39rOInBII4u8pGa
	 yVFJI1Ma76nGq+MaFpAAD/p5ZfIAgeVK54EY6T6OuQboHiQNlqOOHJU2lOCUKK/tbJ
	 BYCQbCeuExJzA==
Date: Thu, 11 May 2023 23:25:41 +0100
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
Message-ID: <20230511-boozy-comic-5bc8f297dc8e@spud>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_152548_363466_40702232 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============2927612967948964189=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2927612967948964189==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LWGkwE7Vf2rchKRZ"
Content-Disposition: inline


--LWGkwE7Vf2rchKRZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST API will return all registers that are available to
> KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> regression issue during VM migration.
>=20
> Since this API was already supported on arm64, it'd be straightforward
> to enable it on riscv with similar code structure.

Applied on top of v6.4-rc1 this breaks the build :/

warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vc=
pu_num_regs'
warning: Function parameter or member 'uindices' not described in 'kvm_risc=
v_vcpu_copy_reg_indices'
warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vc=
pu_copy_reg_indices'

You have a bunch of kerneldoc comments (the ones with /**) that are not
valid kerneldoc. Apparently allmodconfig catches that!

Cheers,
Conor.

--LWGkwE7Vf2rchKRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1rZQAKCRB4tDGHoIJi
0usNAP0Ykfrz+puD2zn8HGUFz+2fk3qtGa/XYSypVrpgWvW7BgD/T7PlZYcevlSv
hezVcWDYRkavqca+yLrT0grdcCTiBgI=
=ARK0
-----END PGP SIGNATURE-----

--LWGkwE7Vf2rchKRZ--


--===============2927612967948964189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2927612967948964189==--

