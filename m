Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D05DC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7BEowKRiZzj8j/4QkWEJjMd5pJ210L5i8kQ/Dp4JHU=; b=Utn6UNfPa3FxU5zEneA4aLmjVI
	S908Tk/v3OT+QvMUItDliZleBaQigGUfsTRZGwGdzHSTbkXCf+7Ti0cL3xF53zwcu9g8wJ27HwAMP
	eJmxLYdXZrVJX30N/mIgkMqjRNgEvCDaJ2P6O4Pjeatlb/NXdqkNtJMSVG6xqYB9z6fMUefcr2X+/
	vQ1wpryWO6X+AuQaW1upw1NfyRBYUmU89STGnrH4JNFkP5jLfBySd3Udcgi5G4XgC76D6vOqaPNYE
	w/nOsJlHBztkcq0N6XrlqhccQ67/OjQoIevYa0U1I6Z8klVkS6BcVu69a+nCXpEioESqqjoHO0HCN
	fQIyK3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAYu-002Nhe-28;
	Fri, 17 Mar 2023 13:56:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAYr-002NgI-3B
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 13:56:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 209A0B82586;
	Fri, 17 Mar 2023 13:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758FEC433EF;
	Fri, 17 Mar 2023 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679061358;
	bh=2iWlhO9St4so8fWA7g5c73Gq5h2pJ2xa4Np1O+uqquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwCUNotX29X5v7weMx+jEmNut39sYlNpOnDjuSCTdF0bOfy4QoGIDfFE7zFkteBAt
	 A+fo9aHlEUBfE+LXFkFVNXCgAUleMz5OV+z+Ispef5sRq8FCsMfTKtVyGKlwsVHNYT
	 9OnYUkgRmgIHhCE33vxe9xqWRZzHXN6R7pKpsgzSutkZifhv3Oea42mRmMo4dRyLkR
	 h4bBbvHHMkgV6AqaaCmI95vmwN7SElEfgw3EGSLzQf0tyeiBYPaKuqXYD5g63RCjB+
	 xNGFdvfNUKOdRImHBhv2wjH9FXW/iyFcJR6JYbhG1uv6fxTeRuwCjUl+If/5/GjeGf
	 krnndYmPD5xlg==
Date: Fri, 17 Mar 2023 13:55:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	conor.dooley@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH] riscv: say disabling zicbom if no or bad
 riscv,cbom-block-size found
Message-ID: <33912dc1-7d34-4cfd-ba04-5fec487bbb4d@spud>
References: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_065602_161521_A1486640 
X-CRM114-Status: GOOD (  21.35  )
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
Content-Type: multipart/mixed; boundary="===============0045025620471595290=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0045025620471595290==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7vE6e9j4e9AblTXz"
Content-Disposition: inline


--7vE6e9j4e9AblTXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 01:45:12PM +0000, Ben Dooks wrote:
> If Zicbom is present but there was no riscv,cbom-blocks-size property fou=
nd
> during the cpu feeatures probe, or the cbom-block-size is not valid, then
> the extension will be disabled. Make the print explicitly say this is
> disabled to ensure that there is no confusion about what is being done.
>

Being explicit seems like a good idea,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 59d58ee0f68d..c8b883827840 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -72,10 +72,10 @@ static bool riscv_isa_extension_check(int id)
>  	switch (id) {
>  	case RISCV_ISA_EXT_ZICBOM:
>  		if (!riscv_cbom_block_size) {
> -			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n=
");
> +			pr_err("Zicbom detected in ISA string, disabling as no cbom-block-siz=
e found\n");
>  			return false;
>  		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> -			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			pr_err("Zicbom disabled as cbom-block-size present, but is not a powe=
r-of-2\n");
>  			return false;
>  		}
>  		return true;
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--7vE6e9j4e9AblTXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBRxZwAKCRB4tDGHoIJi
0tmgAQCmHTVUhnm3WhqVfKIWq5QcAxxCpTzqvwdyG4w5xcaq1wD/fdSsfz5S4U96
6aLwXqQbkvkQo9fWbmWPtfAzX84l1Q4=
=Y4qP
-----END PGP SIGNATURE-----

--7vE6e9j4e9AblTXz--


--===============0045025620471595290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0045025620471595290==--

