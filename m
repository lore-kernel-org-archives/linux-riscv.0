Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4340BC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfT4OvCpDaRUGer0eGGI0GH3i56eaVmf/Ch6bhVFFG0=; b=Ppw110BR9nwrN9wFu63WTtaFOA
	Y34deFrgmIreZJYQyF4Ncu0VEV9puAQujf9YtuYdY4QsCfsTAciXxvneW7eRQ5iPrqtUCA0sWR4ux
	MvpkpLEeQYk/g+svOr9GrUtjKzZ+o6amJJJps8s/MzoaMZApw/H++gZEm1+r56VO4YLDSFkbe9Oh9
	QgroBGVSAwEbrfKpp9MGAmvL7hTypZ2qDwkB4u4HD/sqYn6tRj73qcraARiXjLfXS0cNlWf6sd3jl
	vRP5EWNnVwybWrYw4RDMqaphRae6EUxzbMw/GzVvTCXQnPqRaUED5K9u7OPbk+r0GXSVIqgoGpcEF
	rH7NSEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zg1-0076Qc-1u;
	Wed, 07 Jun 2023 20:22:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zfy-0076PC-2r
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:22:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 547CC64401;
	Wed,  7 Jun 2023 20:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A23C433A4;
	Wed,  7 Jun 2023 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169357;
	bh=gRXZBhKmYjpauoyHqahbtInufOXBpCnme7nvxprunyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Awrb5FyzRfSK1+OiWtU8WegrM7tF+f8OmRyaS3xjZRPLjyqNrcyJ1HtyK0eM1pyzA
	 pdf8ZBMWOR6aYD3Usvz/LKgYrIV9YnkzM/IgbKNs4Fpgn6ULVThT1AiBHE5a67cGoW
	 xv+svBsn+fZXGl10lGW7Hys/AGZK/NkZNBjxavV8WwdrvxulcWqqR5P1ccQY3GsOib
	 SfARH8yz0+SRA1kludq9okDsYjRDg7D+ISt9CHidA1lRCq33+gyNgL/K1Ffmxm1voT
	 BRq30iSFeOFXB5932aTEidST8wrJC+teOOS+RkQ+CLvgzWSe5wGRJptgsF7iQZGz23
	 L9zHv4uWWrKww==
Date: Wed, 7 Jun 2023 21:22:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl
 for shadow stack and landing pad instr
Message-ID: <7c4448d1-4622-436f-8779-f52c4f011783@sirena.org.uk>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-16-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230213045351.3945824-16-debug@rivosinc.com>
X-Cookie: YOW!!  The land of the rising SONY!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132238_964416_8295FB5C 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: multipart/mixed; boundary="===============8188720239718130210=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8188720239718130210==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVPXAgh0GcQbGF6h"
Content-Disposition: inline


--SVPXAgh0GcQbGF6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2023 at 08:53:44PM -0800, Deepak Gupta wrote:

> +int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return -EINVAL;
> +}

Having looked at this further is there any great reason why the status
is passed as a pointer?  It seems needless effort.

--SVPXAgh0GcQbGF6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSA5wgACgkQJNaLcl1U
h9CmSAf/fKmw0IlWPvH27h6yCMOt+UHzbJazp/ApzMezCjTe3ttHBj4Y7y0KPqdZ
w1cN/mUnxw2olEyaBLMdNA5E/kXq7Eys1HmBOmz3SCCA7a1PQ33tDqum2fTVs7ZS
AIQkaxJqfbNXKCSolFNdVsTn2FNNKuNz5V1yB9xNEiAyjYDyv2Yn4ZOpcRYhZEvR
PU3hSGn9Vd1nNXPKz2F6b9oww8Sary6+hXbXqL8u+2WAYuG0y59MhWqZJRQK3UFf
f0sjr5Qo9AW25DQdSIHTww+DZIv7rsggki+xO3KN+Tno06Zy7VjJk/1fylo2DqE9
/L3R4HUQbVRvv+0AC40Z+lE+W/cdmQ==
=wmxy
-----END PGP SIGNATURE-----

--SVPXAgh0GcQbGF6h--


--===============8188720239718130210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8188720239718130210==--

