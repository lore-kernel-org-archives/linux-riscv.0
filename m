Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0315AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcfDbkEDqSrzkOXJII516PtZBaJhFYATTNS6na2ecis=; b=rsO+9j48TE30SP7weAhMJsmJ5V
	Be8O3dJmj3Gv5psxefdeoVH7BBB7e8kY91ukAXLRtclUHFgsY3/dOg+lLp/2SG16PiMeD8tNSgvIt
	W29ULfXatsFz3xqSZ89MC91CmleqfNmQADfnK1Y1m9Mf/l5ZMbdQLSNitK6xo9VHQ7hk2LyloqA+T
	oznhYBx7Skl1lorS8ay7zwpdFpuMG7qtllDhQNxkRDhQNvabn6/vIDwA2EUXH5WSW/IxuEoLHjG4+
	AbGvqkZq7eCJIxjfmsLo3rfBKuS6NntlGPDRFZsQFwd7UzGig5ACGOUS0SY5E5lWCNpczLUN9ad4c
	KJyVVfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrB3-00EHo8-QA; Wed, 23 Feb 2022 12:55:30 +0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqbh-00E7rq-QQ
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 12:19:00 +0000
Received: (qmail 25820 invoked from network); 23 Feb 2022 12:10:27 -0000
Received: from p200300cf070b2500041073fffe58035b.dip0.t-ipconnect.de
 ([2003:cf:70b:2500:410:73ff:fe58:35b]:33114 HELO eto.sf-tec.de)
 (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA for <guoren@kernel.org>; Wed, 23 Feb 2022 13:10:27 +0100
From: Rolf Eike Beer <eb@emlix.com>
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de, guoren@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 17/21] riscv: compat: vdso: Add setup additional pages
 implementation
Date: Wed, 23 Feb 2022 13:12:03 +0100
Message-ID: <4379941.LvFx2qVVIh@eto.sf-tec.de>
Organization: emlix GmbH
In-Reply-To: <20220201150545.1512822-18-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-18-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_041858_205560_DDD0956E 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: multipart/mixed; boundary="===============1730533430407186234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1730533430407186234==
Content-Type: multipart/signed; boundary="nextPart2230114.ElGaqSPkdT"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2230114.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

> @@ -66,35 +68,35 @@ static int vdso_mremap(const struct vm_special_mapping
> *sm, return 0;
>  }
>=20
> -static int __init __vdso_init(void)
> +static int __init __vdso_init(struct __vdso_info *vdso_info)
>  {
>  	unsigned int i;
>  	struct page **vdso_pagelist;
>  	unsigned long pfn;
>=20
> -	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> +	if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4)) {
>  		pr_err("vDSO is not a valid ELF object!\n");
>  		return -EINVAL;
>  	}
>=20

Does anyone actually guarantee that this is at least this 4 bytes long?

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, https://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source
--nextPart2230114.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCYhYkkwAKCRCr5FH7Xu2t
/HZ1A/sGakdodHOoW1ysqdO2mluUIlVSczhoHppED9p5Oqf4/05LhsOcrrn6E4wn
FAbLE4CKEv7FmrqmAPFnGfZbWwZ84QdgQsHHh6uZYCAuT6R1HCWRl5SY1RaO1NOW
ry0P7NXzDWBNe9XTWbZgk51OxZLS3JtlUaiQaF+U03M5yVKtgw==
=oRLD
-----END PGP SIGNATURE-----

--nextPart2230114.ElGaqSPkdT--





--===============1730533430407186234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1730533430407186234==--




