Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CB0CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjSn+kOc5PB0fLCSqu5yjQKEvEYEMGEZV6hrBWQ4XQI=; b=PbDcwJfkTe5JB/no0Xio33yfBy
	AfFtcU56jf67KDnI+2H1lSrdNhXrManEvIUED9vauFFbhy+qPMSdvgPQzciTP2ctXs0jCjSsN7NoO
	n+2Ki5IIhxAUiy66cCQ92RFWrVjL4HaJqa9zlmq9u7IM4FKnmNxbFy/twQVvHMibMKlZomvbgmiZQ
	hdlFaKzGSW/8BbFJeloMcMiEJXiEa42DOz0QTK8uqx1S69MYoR3WpRWnGfG68z1jsbToShbtFjxmk
	oDCtmDWzUMNbwLbdvScqhZMB/aiHkVWliI2lXujAYbGY/JZxYlc1VbIusQbaEPMZJBTdauT9lWQW/
	w2JrrrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkGc-0000000EsNE-0tWa;
	Mon, 08 Apr 2024 08:22:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkGY-0000000EsLJ-2WTF
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 08:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B275060C51;
	Mon,  8 Apr 2024 08:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEA1C43394;
	Mon,  8 Apr 2024 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712564528;
	bh=B2Rx1fNaMKY8f98NWO2r36aff0MZPSma76qGnIBadfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e284onaZX2LtwvM446cRTc0bcql4r1CP8PHC2I5ZJ/0fwevJO+tsWZseQRDJes6n2
	 BaxanYG/FCjHoIRXZ7TN7eHlcx/S10S1eXMPR4n5Zz85eOnw7Eh2LYeXIALdit1V5Z
	 xr+0nymQFtercGFZfPoJ/DI3SjltKzi7RzfjJrOSNuqOh1FQpUhw2oZ7jpSFA5yBpL
	 a0D7OmaBurZ/abxZ3o+6AutOvhOgGqub3F/FCU7dBb3eKD63e6B2DWgILftG31NGvk
	 vRn7HCeaF8BgvCK9cJZkiRBEqT5F1KfaNmZte3L5UNhl1mDl9Jr+5NGZgukIv6MJs+
	 /I5xkHCTrWB/Q==
Date: Mon, 8 Apr 2024 09:22:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 0/6] riscv: add initial support for Canaan
 Kendryte K230
Message-ID: <20240408-trimester-pusher-720882202b9e@spud>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_012210_930708_BA4BE573 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: multipart/mixed; boundary="===============6496795754853487754=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6496795754853487754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XQccMBluk0Im+Wo1"
Content-Disposition: inline


--XQccMBluk0Im+Wo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 12:26:58AM +0800, Yangyu Chen wrote:
> K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
> support for it to allow more people to participate in building drivers
> to mainline for it.
>=20
> This kernel has been tested upon factory SDK [1] with
> k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
> locked pmp and successfully booted to busybox on initrd with this log [3].
>=20
> Changes in resend v8:
> - Add missing cc to lkml and linux-dt list and correct Krzysztof's address
> - No change in content

=46rom v6:
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
https://lore.kernel.org/linux-riscv/mhng-08e43080-8679-43f8-80c5-b73304e4e6=
80@palmer-ri-x1c9/#t

No need to resend for this alone, but if you do resend, please add that
ack to all patches.

Cheers,
Conor.

--XQccMBluk0Im+Wo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhOpKwAKCRB4tDGHoIJi
0iN8AP4n+raany0JpQbFuEWJXAZCl6cajeGZNnjZguEGfmy4yAEA8cPhneIJ509I
jVvZJAsAf8u5FhmXAOxmUaLDJ9NH+wM=
=wz0I
-----END PGP SIGNATURE-----

--XQccMBluk0Im+Wo1--


--===============6496795754853487754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6496795754853487754==--

