Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D77CC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hnseTcS6meLkOHZ3SAQLZNpB/PBVDy9e/t0bgEtREM=; b=4O80kH7OBNTYJTTVcc1AEproN5
	azWgh5kdJdSDoZ/NBuPF9O6w+GTi76JeP+h0NPQqYh/ts41oazGe39N4sV7jVBqh4jjnqmLCMDL4P
	S08GCAeQqXRe/b1IczoaAiQpBBlrQa9SRlEAKUrw8y6IJbRMgaOLxc3gOBgypU1m/N5kS6pyNsBdw
	spC5ZaMjzWvyFWteQ++vM81o+ZudbT0rF03J3094uBfcQqK2X2dHmiXdtKE/bPgyJwi5/I0JyHPG6
	nZdtcRqoGJo4ux637BYbIQ1cwZEzsq0PAKDkTdat7du3qONuL93V45GTz55M9+Thhin+qxiWbHPsI
	GouUHRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5la5-001ZQj-2r;
	Wed, 22 Nov 2023 11:39:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5la3-001ZPw-1b
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECEE461CEC;
	Wed, 22 Nov 2023 11:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAFDC433C8;
	Wed, 22 Nov 2023 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653182;
	bh=VmW4F8kTifiFSh6BqDjXyPl2aYfa/5M1kYdSXNmpqUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tertpv0AmfAPt/Xcz7yBNiwzLEHsFibJOnFqrOxNxUWzaf4vyZSKqm5fzaVqgbaNF
	 rwU/xatzndvY6xFDJxR1Y/YiMokIcqJQ38M9BmdU2+Toi0Rj/J03tRlOik7JJXHo6n
	 JwTAqYm1JI5suSLS4988ZLVMKtCdvzRR1mBHROBkZQPEOD+k1qG/V8tMO/Mon76hrL
	 BVE/WojeVMzZKq8ssy0/Eh++OnqMZQt1Hyl81nOKzJhGfVTOAqnYHgyzu74xReLeK0
	 ay1NyYZGvvxHGFHtZPV1lp8Pn1pLAW7DHEdpVYmrZBW4ojLYZWW2zqDg9JEC5KsMXh
	 pT2En0DU3eMrg==
Date: Wed, 22 Nov 2023 11:39:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: Use the same CPU operations for all CPUs
Message-ID: <20231122-helpless-shaded-64908019806e@spud>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
 <20231121234736.3489608-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231121234736.3489608-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_033943_578950_987F7625 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: multipart/mixed; boundary="===============8808583712186864398=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8808583712186864398==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H0nbdlz8saF9L2tX"
Content-Disposition: inline


--H0nbdlz8saF9L2tX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 03:47:26PM -0800, Samuel Holland wrote:
> RISC-V provides no binding (ACPI or DT) to describe per-cpu start/stop
> operations, so cpu_set_ops() will always detect the same operations for
> every CPU. Replace the cpu_ops array with a single pointer to save space
> and reduce boot time.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--H0nbdlz8saF9L2tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3oewAKCRB4tDGHoIJi
0vo3AP93PDoNlu1sONLMMAIuktMR4gdPYlMY/mfVRifvpMqYOwEAsc0afAZCXp2T
W0/K/Y7VZa4GZyjCylaWW5XFCYaETQQ=
=Uow1
-----END PGP SIGNATURE-----

--H0nbdlz8saF9L2tX--


--===============8808583712186864398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8808583712186864398==--

