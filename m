Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8634CD8CB9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzoayDcsXnsWSM7B8LKQxrfhSxsdBLoQIr+h0vKqC/U=; b=ZRNFLIpCLRFl30VMp5sypUHBRT
	Ao9J40SAcE7H8Zv9k2MDveZunK2CU+VAP6sU2Wge2TJy1Zn6sFIvNrHLuAwdBvuM1wROhYG5983QL
	wCVfyS2tPzoHaqBZjkUmpmmQ870Q738b82ATRh1wc4Wzg4SI8qw67V81wP3F/qrMHUASjA38r+vb/
	dzap6Bf3zjw5mk2MH54BU7VluL3OB4PBOYbXL0NDW+xX47ADSuCo53JDI9lpcrs0MsQmMuuTJ2f71
	qiD3P/XT5KkRgxfMY3MnoUG1n05oxVDjLz4yXhRaclkTh30XAHKLDp9kDheESNW6MxsB6NwQxTWSY
	lQ/efgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz0e-00000005zx8-3dkR;
	Tue, 09 Jun 2026 16:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz0c-00000005zwo-2plU
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 16:08:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C35256020B;
	Tue,  9 Jun 2026 16:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E931F00893;
	Tue,  9 Jun 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021337;
	bh=Jx0m1CTbUVR7hcsktvXo2yEe+jD7bQ3IVimdzKeqnnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hLbL7nRMN5Lln+OBoytoF8Fb4JIUzl2MvtqQlK+PsH/G2qO3P3fkIT5cBfi3u9ZbI
	 ACdbEsusPxCoygmPffviS2zuOcAnJ5fav55YdsIq1RxXwFn513YqBPmJyPCDIRixx3
	 ig8u6zCIs07WGvFsFJY88hIciHv7mgeaVnK51uAcIrHIRxyB0mxzjumUQVSRoMnNX2
	 +/4UYH13kVOCW2T1PRhUh9g5QGloQO5ilZ+1ksfRdv+YAzwQHL//LNVWT40Pd4hdV2
	 JQo/nsfSCQJv+LybS1uArM1ZsiDprBl2VeNx6pcIveQKzWJVwp/kBAI9noahsxXnL0
	 d/j3jCHGVZrBQ==
Date: Tue, 9 Jun 2026 17:08:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com,
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com, conor+dt@kernel.org, debug@rivosinc.com,
	devicetree@vger.kernel.org, guodong@riscstar.com,
	hui.wang@canonical.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com,
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org,
	qingwei.hu@bytedance.com, ritesh.list@gmail.com,
	rmclure@linux.ibm.com, robh@kernel.org, wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn, zong.li@sifive.com
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu boot-time
 behavior
Message-ID: <20260609-washboard-fantasize-ddf0a9752df8@spud>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
 <20260609130021.99899-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20260609130021.99899-2-cuiyunhui@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============5761851500447420671=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5761851500447420671==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XXuB5ejAtQyRxm8b"
Content-Disposition: inline


--XXuB5ejAtQyRxm8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 09:00:18PM +0800, Yunhui Cui wrote:
> Clarify that systems which advertise only Svadu have hardware PTE A/D
> updating enabled at boot, while systems advertising both Svade and Svadu
> must enable Svadu explicitly with SBI FWFT.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb214..b09888e9988de 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -294,10 +294,10 @@ properties:
>                 of the PTE A/D bits or page faults when they need updated.
>              2) Only Svade present in DT =3D> Supervisor must assume Svad=
e to be
>                 always enabled.
> -            3) Only Svadu present in DT =3D> Supervisor must assume Svad=
u to be
> -               always enabled.
> +            3) Only Svadu present in DT =3D> Supervisor must assume Svad=
u is
> +               enabled at boot.

Commit message is missing an explanation of why this behaviour change is
not problematic. Although, to be honest, I am not sure what the changed text
actually means. If only Svadu is present, then the hardware doesn't support
Svade, and therefore Svadu would never be anything other than enabled so
changing the wording to specify "at boot" seems less clear?

>              4) Both Svade and Svadu present in DT =3D> Supervisor must a=
ssume
> -               Svadu turned-off at boot time. To use Svadu, supervisor m=
ust
> +               Svadu is disabled at boot time. To use Svadu, supervisor =
must

This change doesn't actually do anything, "turned-off" and "disabled"
are the same thing - although the latter is more desirable wording I
think. I have no problems with this portion of the patch.

>                 explicitly enable it using the SBI FWFT extension.
> =20
>          - const: svadu
> --=20
> 2.39.5
>=20

--XXuB5ejAtQyRxm8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig6kQAKCRB4tDGHoIJi
0qsZAPwId/1zTcbLJx60ON63GfqhF2b8UvLVSnZudmSdT6UhsQD/XAQQJuzW96SR
XFKW40bbtydXx+nfrNFUAL10XllnQgI=
=8vKN
-----END PGP SIGNATURE-----

--XXuB5ejAtQyRxm8b--


--===============5761851500447420671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5761851500447420671==--

