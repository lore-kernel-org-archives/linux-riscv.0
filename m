Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D39AC54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSigiKB1Ks6LKzKMIaBWxJNC6gytoMJ7wxKg4YrQYJY=; b=H9h3RASF3H3+gv7pivMSOwabno
	weYj3ruMxml420rttkCWNIA4RIApR850E4fCD5a8ygjevDIligvAcT25yQFLaCZW/sMBSwidhkViF
	+t+2zupWR14jA/vNJ+pYj+DnNhFQMJ9v3JYBE0qgXnbwzz7CoymU+U7z+sIFDP8KT0EwZWJSA/RSa
	CJm49BVtY9UzDUrGJDiQNEdDDAWBnp1zavqbZGfPJO5hxsxNcAF9btoZ+H+8lAzEyUu4ubEemNxri
	P/I6LwKk3dcNw5P1estogYagzPFRYQBscanXJxA6RBChZEFzg+HcNGvwgSB+or/NKscmIMtT9ce+4
	fuoL/ZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr4e-00000000LOs-15Wu;
	Wed, 06 Mar 2024 13:12:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr4a-00000000LMu-329u
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709730760; x=1741266760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zc2zZ6M5U5YJr4cZh6IDmp+6jTvsRZlZFYiNFJlAj2M=;
  b=emRuNyJCyKTViAx29lqSbQ55Wagf9KY8QNAdObr6zAmDNHNotWW/4Lwn
   KVIkNkMBY6TSPjL6UXHUVLQ+rxrOnZxpH1E3uvbi+s7D/vQYOGwMAq9CF
   2XyMkcJLGoVhKJ1me9FdtpgGdq3D5AeTY/xqJodFa9TiBDz3rSz6DKC8R
   x+V/a1TXGtnlNTk4m6CkPDpW88uwb8VlKytr8SUOABLJHr0aZzZOFFtoC
   4bGGvyVJGtMAPLkiJUjXM+PHCbc54TeMnb5x5NSw00Ik774aPGCOI2HS8
   VKLO26jis3DGJQBYxhETQQThW37DeWX7qL7yRhqtxipHsa/MsI0Gml5Ny
   A==;
X-CSE-ConnectionGUID: It6AnLiDS5GINWmYX8VNaw==
X-CSE-MsgGUID: M2/mz+qiSvaT8qbC98gVHA==
X-IronPort-AV: E=Sophos;i="6.06,208,1705388400"; 
   d="asc'?scan'208";a="18925469"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2024 06:12:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 06:12:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 06:12:28 -0700
Date: Wed, 6 Mar 2024 13:11:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v6 2/4] riscv: Only check online cpus for emulated
 accesses
Message-ID: <20240306-spry-retread-56d6c8dce327@wendy>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
 <20240301-disable_misaligned_probe_config-v6-2-612ebd69f430@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240301-disable_misaligned_probe_config-v6-2-612ebd69f430@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_051240_976756_508B1A7C 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============2000749976692502321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2000749976692502321==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CLY4JT0rzhj1XS62"
Content-Disposition: inline

--CLY4JT0rzhj1XS62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2024 at 05:45:33PM -0800, Charlie Jenkins wrote:
> The unaligned access checker only sets valid values for online cpus.
> Check for these values on online cpus rather than on present cpus.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwpr=
obe")

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 8ded225e8c5b..c2ed4e689bf9 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -632,7 +632,7 @@ void unaligned_emulation_finish(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	for_each_present_cpu(cpu) {
> +	for_each_online_cpu(cpu) {
>  		if (per_cpu(misaligned_access_speed, cpu) !=3D
>  					RISCV_HWPROBE_MISALIGNED_EMULATED) {
>  			return;

I went looking to see what the practical differences were between
"present" and "possible", cos I'd never really seen much code using
"present". Turns out present and possible are essentially the same on
riscv. TIL.

--CLY4JT0rzhj1XS62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZehrjwAKCRB4tDGHoIJi
0nKQAQC/tSJTZ1Iyv8vL/KUSfV1d92ey0waFTZfCGSIMtUCNYgEA3wE18AO5OlwU
9ZQodv7iKYlcM9xT0XbN4zjDfJsrmAw=
=A42a
-----END PGP SIGNATURE-----

--CLY4JT0rzhj1XS62--


--===============2000749976692502321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2000749976692502321==--

