Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2BCC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knLxFnT7lhlgk1mVZ26Z7ShwRenCYDyq47AOYzT4WLQ=; b=aALIKQmOfUYweTwmAbN+AEqejY
	tMn7GMFK4tSbxcHkhqhfLwKsbphgWtFoNHrcnke8Lx48b2bny6wRONBlARFdSeaAs7tlc8M8jccx4
	AHfyOcMupu3xBh1stYadvqHEIESlIHQNiEy/w+/fDln9JH41dfDje4az74BuNiGVqGj4KT11O+jdJ
	ya+qADCAGb268qgqbOSN2DqtT5CFgfNeVgwffdusP8iPM31LCGgpiejKqfd68rqYaNy0BUyknZWPF
	oXb/dOgPDYn3slWjQUuPWx+UPRobsFij4AIPA9QGeI2QhaaMS+68JLlF99j3WDjzI47+e4P3dF6nw
	N46hG0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTNm6-00H6YI-RN; Sat, 18 Feb 2023 14:01:14 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTNm2-00H6Xb-R8
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 14:01:12 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A2CBB1C0E0B; Sat, 18 Feb 2023 15:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1676728864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZL4K6X2FSJVi8K7B6El5/6cZqmRtEMln+zNt3IAzswI=;
	b=rOQzod7Gclru3+7WueD54igIGxqdfFn07BNOjZFq7sBSxj71HL907NMtg5tClfFg5P+99K
	hm98E8F+0c1tt9R8mj0xqn0ZO/upvwpOntYr+BFKPXfJBDQkPmDYVk+sArlslvCd37Ci38
	/L4vxujPb7GyQdeobXKTv7V00bcJ6l4=
Date: Sat, 18 Feb 2023 15:01:03 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <Y/DaH0vjMsln4Ghr@duo.ucw.cz>
References: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
 <20230106060535.104321-4-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230106060535.104321-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_060111_360529_0C97DC56 
X-CRM114-Status: GOOD (  16.20  )
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
Content-Type: multipart/mixed; boundary="===============1242599920546821536=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1242599920546821536==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IqFhkKEgSBAYZtOE"
Content-Disposition: inline


--IqFhkKEgSBAYZtOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> @@ -21,6 +21,11 @@ struct suspend_context {
>  #endif
>  };
> =20
> +/* This parameter will be assigned to 0 during resume and will be used by
> + * hibernation core for the subsequent resume sequence
> + */
> +extern int in_suspend;

"/*" should be on separate line. (This occurs multiple times.)

> +ENTRY(core_restore_code)
> +	/* switch to temp page table */
> +	csrw satp, s1
> +	sfence.vma
> +	beqz	s4, done
> +loop:
> +	/* The below code will restore the hibernated image. */
> +	ld	a1, HIBERN_PBE_ADDR(s4)
> +	ld	a0, HIBERN_PBE_ORIG(s4)
> +
> +	lui     a4, 0x1
> +	add     a4, a4, a0

Do you have enough registers to move a4 =3D 0x1 assignment before the
loop:?

> +static int __init riscv_hibernate__init(void)
> +{
> +	hibernate_cpu_context =3D kcalloc(1, sizeof(struct suspend_context), GF=
P_KERNEL);
> +

kzalloc?

> +	if (WARN_ON(!hibernate_cpu_context))
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +early_initcall(riscv_hibernate__init);

Does this really need to be done early?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IqFhkKEgSBAYZtOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/DaHwAKCRAw5/Bqldv6
8pCeAKCtimnpUoABKl6hy7nwxKtdyFuhZACgi6PwWGe/AwJqB4ECjFEjbteesHg=
=/hSf
-----END PGP SIGNATURE-----

--IqFhkKEgSBAYZtOE--


--===============1242599920546821536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1242599920546821536==--

