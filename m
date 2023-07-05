Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C10EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edgL+VKnR4manyIxG3K/NQ+b5s4YPWDpXqaHWdKY/IY=; b=2ySky2WDnvO7Rdoi7hbLYlJvPG
	ZNhvH8D6iT7ihF9Q3FUJ4GZRWFhsdgRXsykoYZOhYvqeOg1z49nqd5tmWXYbwIvqOUcssw5nCfjuS
	LHW2lMjBNIudh0d6VPzqh7UeH7Hw6YFFq4xU/3m/z91Q7NSzm91hyC3J9N1kSXg6yAWj86LW0w9fy
	qPuqK3Dk71u9c+nBSxEF4CXGxbBxFrqAr8cW9GjMnOXTLCrxg/+H7bcS70M1fXGZoZIqfjtmiNZmu
	iYaqB2UQvXT3To6m5JtnNmJ8GFtiiNUuw0Yv+csuJJSzDgbiG9/tHsCfU/Lp6uRlYszT/4YtNtZwk
	zawAtTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH45n-00GGsB-25;
	Wed, 05 Jul 2023 15:06:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH45k-00GGql-2M
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 15:06:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 071F7615D9;
	Wed,  5 Jul 2023 15:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAC1C433C8;
	Wed,  5 Jul 2023 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688569611;
	bh=9lnuLnPUp+a1W5bMi5dat9Uy2/HBvlSTBdYbVbval/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEuKWqef0mCE5VU9AYbWFNz2ctcq97QILdHxoXbSPPB5PK43juTCFaYlTHdpQxc4k
	 2TL9xEW8B0G3TKO9qdCBKgPOyar4v4pPoLlE+TOI0NVkV68hAZckdJZ/vQ2Q/jJ9mb
	 TPQ1xAyjuQEgW2aiIRHYKOGA8s6C+OFEtxJ+ehZIubx0z619nW3B8yV5TB5qACf5Qq
	 SrNG6L+UpLUiHKsRdy/J+WUB+LdGBzZ4SLrh1VcZ2Gwiixx6NWQXeYSxhx5fGoVvwK
	 OtdUhHIPeuOSVpDTaT0HcrWcmt0gb/jMzchnEOdb6ZXL8rZTUzXEfi7uSkc6sZiuMj
	 BOscOmuwxX24A==
Date: Wed, 5 Jul 2023 16:06:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: firmware: Document ffitbl binding
Message-ID: <20230705-oblivious-unstuffed-8e028a5b243c@spud>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <20230705114251.661-5-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230705114251.661-5-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_080652_862982_565A4CED 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: multipart/mixed; boundary="===============5541370520061989765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5541370520061989765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P4Xlq9WyafqDDvSq"
Content-Disposition: inline


--P4Xlq9WyafqDDvSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 05, 2023 at 07:42:51PM +0800, Yunhui Cui wrote:
> Add the description for ffitbl subnode.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  .../devicetree/bindings/firmware/ffitbl.txt   | 27 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/ffitbl.txt b/Docu=
mentation/devicetree/bindings/firmware/ffitbl.txt
> new file mode 100644
> index 000000000000..c42368626199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/ffitbl.txt

Firstly, new dt-bindings need to be done in yaml, not in text form.
Secondly, you didn't re-run get_maintainer.pl after adding this binding,
so you have not CCed any of the other dt-binding maintainers nor the
devicetree mailing list.

> @@ -0,0 +1,27 @@

> +FFI(FDT FIRMWARE INTERFACE) driver
> +
> +Required properties:
> + - entry		: acpi or smbios root pointer, u64
> + - reg			: acpi or smbios version, u32

Please go look at any other dt-binding (or the example schema) as to how
these properties should be used. A "reg" certainly should not be being
used to store the revision...

Cheers,
Conor.

> +
> +Some bootloaders, such as Coreboot do not support EFI,
> +only devicetree and some arches do not have a reserved
> +address segment. Add "ffitbl" subnode to obtain ACPI RSDP
> +and SMBIOS entry.
> +This feature is known as FDT Firmware Interface (FFI).
> +
> +Example:
> +	ffitbl {
> +
> +		smbios {
> +				entry =3D "";
> +				reg =3D < 0x03 >;
> +
> +		}
> +		acpi {
> +				entry =3D "";
> +				reg =3D < 0x06 >;
> +
> +		}
> +	}
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b886ef36587..008257e55062 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7874,6 +7874,7 @@ F:	include/linux/efi*.h
>  FDT FIRMWARE INTERFACE (FFI)
>  M:	Yunhui Cui cuiyunhui@bytedance.com
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/firmware/ffitbl.txt
>  F:	drivers/firmware/ffi.c
>  F:	include/linux/ffi.h
> =20
> --=20
> 2.20.1
>=20

--P4Xlq9WyafqDDvSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKWHBAAKCRB4tDGHoIJi
0uB+AP0RwrTXNhCYkGKgzXI8nTOE4BWsGObrWS3ZfGAVVwXpbQEA5sW73BLXMhxe
NvzIKstw2Fg1XPTYnUwWjsFH3hHbIg4=
=IUHS
-----END PGP SIGNATURE-----

--P4Xlq9WyafqDDvSq--


--===============5541370520061989765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5541370520061989765==--

