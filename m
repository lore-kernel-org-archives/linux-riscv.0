Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D7EC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9K0N1sxp0LU/wYLBWB4wfvT+y0uMVyWDhzO9i0Fw1c=; b=xJmap5mfWN1TgCvvIJgP8T/5QU
	6HwLrVm7lWpapcSEqrKlamKziwLDil4v4dF3Fxyn2FaegHh5kGJTY/f9wDzfRqO73VyS9jwyW2+0w
	xqOAcKlrBOYQJnxqlyFDaHvhHWoVwe+lVn4EjmDSvMvBHKbj2t9fnwFIShfhxD2nB/56jHL2NzCbo
	SpXE1VAlxHat1TTuGMdNwxc8Rwn59vWDyO0eDYayQNv9iSW0DhpxdcmFEoGxI0g0FVh0AYCScgFcz
	dK9tCNZAG3cWfJcFAqk0ppUdJKVulRFyfa10MZ7tnoiIvV5v4YEAHCK7ifrAiZ4GCTrsBPbTtkDOk
	Og++8rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAzm-002cKX-TM; Thu, 09 Feb 2023 17:46:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAzd-002cGc-GA; Thu, 09 Feb 2023 17:45:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D383B821CF;
	Thu,  9 Feb 2023 17:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AC0C433D2;
	Thu,  9 Feb 2023 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675964754;
	bh=wsKWY5mniDEA1VyD/3e1Ls9PGad1tG04MhtLT/kvItI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asShUOZaxIoVjnLISWa1NaM0y/ECxHF7AhpbLfLkijADdE0m19CCOaHARRzydFFk+
	 B8yi2Nr3LByleOHHc5htw90M1loC1peaiDrAWiGT9dDHdnlvuFBgD0IDTvPtjndm+z
	 frlh1CG/Grj/f+0C3Gz/t6oCPkGLlvvTvI/NFvAsWhnMqNyPVa5SXSiAEhGDQcKqOe
	 fS9ZfZuVeIF8j2KIO14pmMis8f8AkX7sZZYhKWVUUDCeNYCkYitjfh6K6fk4pRljzI
	 wGWAh9kDYTjtZWMRfUIq/HqyEs1oezg3KcdsO49eH8yjzJS2lKSxbj49KCFaXkxQDg
	 MFzkXKGZ4KGhg==
Date: Thu, 9 Feb 2023 17:45:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/8] RISC-V: Apply Zicboz to clear_page
Message-ID: <Y+UxTBmegHqqHDCQ@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094557_887529_624A0E92 
X-CRM114-Status: GOOD (  28.29  )
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
Content-Type: multipart/mixed; boundary="===============2051366270862673740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2051366270862673740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9mBYdTmiZ9WKdOsk"
Content-Disposition: inline


--9mBYdTmiZ9WKdOsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew,

On Thu, Feb 09, 2023 at 04:26:20PM +0100, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch4's commit message for more details).
>=20
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
>=20
> Based on riscv-linux/for-next plus the dependencies listed below.
>=20
> Dependencies:
> https://lore.kernel.org/all/20230108163356.3063839-1-conor@kernel.org/
> https://lore.kernel.org/all/20230105192610.1940841-1-heiko@sntech.de/

I've had a short (due to FOSDEM) & busy week since we discussed the
automagic dependency collection. I'll try to get to it in the next few
days.

> The patches are also available here
> https://github.com/jones-drew/linux/commits/riscv/zicboz-v4
>=20
> To test over QEMU this branch may be used to enable Zicboz
> https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz
>=20
> To test running a KVM guest with Zicboz this kvmtool branch may be used
> https://github.com/jones-drew/kvmtool/commits/riscv/zicboz
>=20
> Thanks,
> drew
>=20
> [1] I ported the functions under test to userspace and linked them with
>     a test program. Then, I ran them under gdb with a script[3] which
>     counted instructions by single stepping.
> [2] https://lore.kernel.org/all/20221027130247.31634-1-ajones@ventanamicr=
o.com/
> [3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
>=20
> v4:
>   - Rebased on latest for-next which allowed dropping one dependency
>   - Added "RISC-V: alternatives: Support patching multiple insns in assem=
bly"
>     since I needed to use more than one instruction in an ALTERNATIVE call
>     from assembly. I can post this patch separately as a fix if desired.
>   - Improved the dt-binding patch commit message [Conor]
>   - Picked up some tags from Conor and Rob (I kept Conor's a-b on the
>     clear_page patch, even though there are several changes to it, because
>     I interpreted the a-b as "OK by me to implement a Zicboz clear_page")

Yea, it was a "I am far from qualified to review your implementation,
but I am okay with it existing and the remainder of the patch".

Cheers,
Conor.


--9mBYdTmiZ9WKdOsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+UxSQAKCRB4tDGHoIJi
0nXrAP9VAQ3j262sR5fkIWgKXnnVcwlk0HxuhiGpu+7dH1JcTQD/e+mZEdP1X1PR
UiYGOGgLZYOVDwTZVxkkf9gZ5EzcGAI=
=k+w3
-----END PGP SIGNATURE-----

--9mBYdTmiZ9WKdOsk--


--===============2051366270862673740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2051366270862673740==--

