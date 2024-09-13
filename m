Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C7DFC6171
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfW6vOHLYFtIGw2k1bSvbCmE2/+wcaCPcVHW8nn2RO4=; b=C8JiN2HF6uTkUVP56kHymdU73W
	T8i1yTNLI96st3n7a+RsrU5UVU2hH87hOcwDX2zLhERB0R/v1zlwNx4UYbuITIFGIS8BPTKhTkwvw
	hD4Ud1S8Lq+JXR83OA+N4M01VKYwRSLKgPO9W7zbi/27owodxnTL6jjQU869KWtOR1qq3XfXOaU92
	XLrjvwGGgxQ+hX5RGl1ZSXCODys1wvzV5uItln62c1E01TwGE8AMlZg/NadBq2GXdr83sO7ud681y
	7eI6SwrvbULXgTonH8a2Gowk3vHz3Pz/HQAJJybIn9FiLYB01A8Lb6lpLCSrp8Di7LUtmq6zaOM8z
	bOPbYOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spB8L-0000000GpKh-2C5n;
	Fri, 13 Sep 2024 18:35:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spB6l-0000000GpB4-0v6c
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 18:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F004E5C5ABE;
	Fri, 13 Sep 2024 18:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05299C4CEC0;
	Fri, 13 Sep 2024 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726252405;
	bh=A1W9jCfny74eDZ2Sq3AsHaoLeaw3yFn1FM9duxuPzpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xse7L38f6kbjvUpu6KuIcVvQkUwvvSdpQAM+baUWBOxKHwkNfN5n2a4WPozZqBe8H
	 wK0MzQxo8HaBbxuUeFJXh3/RW+hMjig/4aZGdSxtxD3LD8GbD3DRZcbszWLIfS3u+T
	 +C1yA4kCqVrgK0dsD4o3gsiA0TZa8JVM1HU/f8BtZlm8MQBlP8HkJcDN5H+1fbF5jI
	 ndbaCs1vA15EeSzoQc+9usB98O311e5c8s64OxS6Xxc1uJ16cXD1TaIJd3pdwK4a4D
	 07izK89AKA0KtL0Q249Alsfdaz8Zn0MATGInL83hMy59wNE/n9GB0mXHAaewkqPYn8
	 4wIslCdEw1Wyg==
Date: Fri, 13 Sep 2024 19:33:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v4 07/30] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20240913-woven-droplet-1f25d0d5a33b@spud>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-8-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240912231650.3740732-8-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_113327_369353_A4CA6412 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: quic_zhonhan@quicinc.com, jszhang@kernel.org, zong.li@sifive.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, cuiyunhui@bytedance.com, palmer@sifive.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, oleg@redhat.com, linux-mm@kvack.org, guoren@kernel.org, alx@kernel.org, linux-kselftest@vger.kernel.org, hpa@zytor.com, puranjay@kernel.org, linux-riscv@lists.infradead.org, shuah@kernel.org, kees@kernel.org, sorear@fastmail.com, linux-arch@vger.kernel.org, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, zev@bewilderbeest.net, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, dave.hansen@linux.intel.com, mingo@redhat.com, ancientmodern4@gmail.com, libang.li@antgroup.com, samitolvanen@google.com, usama.anjum@collabora.com, greentime.hu@sifive.com, ajones@ventanamicro.com, revest@chromium.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, broonie@kernel.org, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, costa.shul@redhat.com, paul.walmsley@sifive.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, david@redhat.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, linux-fsdevel@vger.kernel.org, krzk+dt@kernel.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: multipart/mixed; boundary="===============2922474590741815397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2922474590741815397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wo0WH8RKXYiALMcP"
Content-Disposition: inline


--Wo0WH8RKXYiALMcP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:16:26PM -0700, Deepak Gupta wrote:
> Make an entry for cfi extensions in extensions.yaml.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..b7c86fb91984 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -361,6 +361,18 @@ properties:
>              The standard Zicboz extension for cache-block zeroing as rat=
ified
>              in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> =20
> +        - const: zicfilp
> +          description:
> +            The standard Zicfilp extension for enforcing forward edge co=
ntrol-flow
> +            integrity as ratified in commit 3f8e450 ("merge pull request=
 #227 from
> +            ved-rivos/0709") of riscv-cfi github repo.
> +
> +        - const: zicfiss
> +          description:
> +            The standard Zicfilp extension for enforcing forward edge co=
ntrol-flow
> +            integrity as ratified in commit 3f8e450 ("merge pull request=
 #227 from
> +            ved-rivos/0709") of riscv-cfi github repo.

Because both of these have a # in them you need to have a | after
description:. Please run dt_binding_check :)

> +
>          - const: zicntr
>            description:
>              The standard Zicntr extension for base counters and timers, =
as
> --=20
> 2.45.0
>=20

--Wo0WH8RKXYiALMcP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSFYwAKCRB4tDGHoIJi
0vnMAP4jAcike3nNkua8hG9QWEW4+qazPoSFmDREmFEymZqK8wD/R5K+u0LGQlr6
Bci3roI9osxHgbbuooL8Ckvlomw/wAc=
=cQDJ
-----END PGP SIGNATURE-----

--Wo0WH8RKXYiALMcP--


--===============2922474590741815397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2922474590741815397==--

