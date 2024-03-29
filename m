Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C316C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wzYCJ9j39kt9rQtWmHN3Wp7lOIfQtsRmZQAyo03rww=; b=Bbk1JJecNsasuRZyJ0TfP+2sCx
	kMVVrXPxrZKjyZ6gHgkCOtMIV+Ts3VRmqm/Qsixt5j55WwvHe+L13qeFDrSQCCk01rLL8QcSUFLZ4
	JOiYGYVfQJW/4H3dTQipVDBlstwAARND1gXM6EfTLNzgSKo1PxNdq8j6u1FMRsQMEYH2mektRts3o
	SZ1SrPsrRsdwo4mI5uOqqtjkGdWT9FS3qiMXADVdL1mSpiXeOdTT0mI22iYitkYVnGXnYw3htPXQm
	uWb4KXSq1aBXqWygztas8cdwDObgWtfr3JtnmJmGcbV5SUJZbPRIkwAWJ0QjJht657/QhwFOjHY9R
	1tWb4Q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9X4-000000003CQ-37UY;
	Fri, 29 Mar 2024 10:32:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9X1-000000003Bj-2sVI;
	Fri, 29 Mar 2024 10:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711708339; x=1743244339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJRVYl2TkqJgkeeArpXXpoPMdu4mwFR/AAzovQ2QJdk=;
  b=JNdgM0t4DhfGDJF/S4hODV4utVfr2jQKYX4JhyW0d4VyZ5WgX3JJwxFy
   G2EuPdg61wJV9buFyiXlZNK0YV20lbRCGimdwUNjqM93UjGml1f16gxC3
   TfkU8v5317jUkrq/6NN3h3urx5uyMc6YB8UIKs2F84ahPr+Q3URK0a2Dk
   xmzZPMJut+ENyrBjiOqvkaNSyofpQ+MNxq4g1hHaNHFm3TVP6jBuOC3WM
   ZV4TMBV9kFOyvH6Z7G4qvM7E4vUzP9/XnS3lA6PgKRWLK3LNvZ17eM1uI
   fKF8cLr0F+BuZeURQcr8YfAwMox9cNPiD67M45yCtNmFNktO7U79npaNB
   A==;
X-CSE-ConnectionGUID: GFew/kMnS6C07Mq7X0KFUQ==
X-CSE-MsgGUID: tzrsQPFdTKSvpMZ+9j+6Lw==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="185901778"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 03:32:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 03:32:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 03:31:58 -0700
Date: Fri, 29 Mar 2024 10:31:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Max Hsu <max.hsu@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel
 Machek <pavel@ucw.cz>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
Message-ID: <20240329-affidavit-anatomist-1118a12c3e60@wendy>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_033219_807736_69FD6D31 
X-CRM114-Status: GOOD (  17.54  )
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
Content-Type: multipart/mixed; boundary="===============6857327340184013167=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6857327340184013167==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qvN9g2Kofm3vp+Ez"
Content-Disposition: inline

--qvN9g2Kofm3vp+Ez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
> to prevent RW operations to the missing CSRs, which will cause
> illegal instructions.
>=20
> As a solution, we have proposed the dt format for these CSRs.

As I mentioned in your other patch, I amn't sure what the actual value
is in being told about "sdtrig" itself if so many of the CSRs are
optional. I think we should define pseudo extensions that represent
usable subsets that are allowed by riscv,isa-extensions, such as
those you describe here: sdtrig + mcontext, sdtrig + scontext and
sdtrig + hcontext. Probably also for strig + mscontext. What
additional value does having a debug child node give us that makes
it worth having over something like the above?

Thanks,
Conor.

>=20
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..c713a48c5025 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -137,6 +137,24 @@ properties:
>        DMIPS/MHz, relative to highest capacity-dmips-mhz
>        in the system.
> =20
> +  debug:
> +    type: object
> +    properties:
> +      compatible:
> +        const: riscv,debug-v1.0.0
> +      trigger-module:
> +        type: object
> +        description: |
> +          An indication set of optional CSR existence from
> +          riscv-debug-spec Sdtrig extension
> +        properties:
> +          mcontext-present:
> +            type: boolean
> +          hcontext-present:
> +            type: boolean
> +          scontext-present:
> +            type: boolean
> +
>  anyOf:
>    - required:
>        - riscv,isa
>=20
> --=20
> 2.43.2
>=20

--qvN9g2Kofm3vp+Ez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgaYbgAKCRB4tDGHoIJi
0lR6APsFCJD2xF6mivD5+737cpFwlpgCAnMllMxOmWsck2HUJgD9EN3UFh3/VEM/
G9adYYLQT0pjKI5lJOtelWT/0qhIsg4=
=evUa
-----END PGP SIGNATURE-----

--qvN9g2Kofm3vp+Ez--


--===============6857327340184013167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6857327340184013167==--

