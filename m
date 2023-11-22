Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA80C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERNb7L8IeJHPdjWktahLQDsUHq0A398tZBlK3aJyXmQ=; b=pO7Zx2GaHtQBo1gqo6Jhlwhtrq
	AkEkp73utbVI5YgiDyml/fD5vjzOqQh1vJVBrcmERtuEtRAPYo7ZHcbhKmSTRZ54Ynlg7PyQoQRFH
	vfjS3sITVwn3nzETrWHMbKeD/RSgIMrigqjLtSHABMU4szsnlqtGTOue9itNdhJarKAEKIWT641be
	oH0FZiOymr0B2jDdy91DvpzVlwPJQZSE85JtbRD9Cprbs/DYi/TC/f6CLDnG6pya+ySJRKSrM4TEu
	+D77ikaUWAI1wlHDgGJqhfjKBs95oZwI5HLNeA+z3e1hhcLCbV91Rt59mk3XkmnYZv2WGteHuXIgW
	t9jvhO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lDu-001Wht-1x;
	Wed, 22 Nov 2023 11:16:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lDs-001WhP-02
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6DB00B82604;
	Wed, 22 Nov 2023 11:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2C7C433C8;
	Wed, 22 Nov 2023 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700651805;
	bh=O4ENAjxcCOFUydcsBJgM4MyxNl56Qk2bg2LzoMqBZiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD2+7UCY4va8QdwIoWo+lx0WdKzHF0ACt1qjnyaofNYcuEppuTB3BsinsHSJot8Pc
	 uiw0TZZYtQKm5Jfezf0RYbgx2CyKt5Z8+VwBxoH8nutn09/eymMcijKgMHkCFbczLt
	 GXqwhOjg9KwgJ7BnveGYa59vgQMTxY08+2A4Ouui3mLo6+7Zh6aZgLrRewBSmL6d4O
	 NrR6XiQNbnidNAWzqyQ9qltmF2y+zsLQ7ZZyDnM6GUlECrHT6c3ky7ufKtAVriidV3
	 yZ23NxmN/qYVPYlpHwsiztilWEHolh5CgrHTb/9pmvkXVwPgGAeFwyGguDbvuO2GZ6
	 61tquGcQczCww==
Date: Wed, 22 Nov 2023 11:16:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH] riscv: make unexported items static
Message-ID: <20231122-lustiness-unbundle-0352bccb4eb8@spud>
References: <20231122090255.188851-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20231122090255.188851-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_031648_190616_EF00DA2B 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: multipart/mixed; boundary="===============5428463413451839005=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5428463413451839005==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="buKAyl25izRgA7PF"
Content-Disposition: inline


--buKAyl25izRgA7PF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 09:02:55AM +0000, Ben Dooks wrote:
> The relocation_hashtable and used_buckets_list are not used
> outside of the module.c file and therefore should be made
> static to avoid the follwoing sdparse warnings:
>=20
> arch/riscv/kernel/module.c:48:19: warning: symbol 'relocation_hashtable' =
was not declared. Should it be static?
> arch/riscv/kernel/module.c:50:18: warning: symbol 'used_buckets_list' was=
 not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--buKAyl25izRgA7PF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3jGgAKCRB4tDGHoIJi
0u6cAQDFwqVyJcIMfEUExDwCFqrxxU4XAep5YnVltSLI+CusngD9G6mTL4dh+PSK
Gz2eX80rHbI7tccNozffsVEDEDNTrQ0=
=W0yg
-----END PGP SIGNATURE-----

--buKAyl25izRgA7PF--


--===============5428463413451839005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5428463413451839005==--

