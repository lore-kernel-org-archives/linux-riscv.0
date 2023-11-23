Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6A9C624B4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAdL2PxKcnfHBgc9AMhQMYWPxA6aE83+Lx3MjSwBuG4=; b=xvZj/y8TSnvH7DOT3atLI6t5Vr
	U5IXwuD4qs0Wp373Ksvp/M6Pk7fuDBYVw3C0qaGIHtWfSOywcYgPzwhYd2H3Gj0WJoa5/rgI+8UCs
	7sCXjU0gSukWnymQO6CWH/OoPITln2WZoZGFsneoGiQZ2vP/l/POSiGFuY6InwLZEBRXmMEZJAm3+
	X4KStX44SiBaahaAutoq9HnXQBY6IUghjdu0NZdH+JnRgNaargIYSTQyZMBOOx/siYrSKmWl8k6nZ
	kitocUFshKxANTZf2/sflJ4CBEbUiiCW859mjcT2O+l+jB/zGRohT+c4xkdBvQLb2lAUG9Y/1qiyo
	69KeGP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6B1S-0054RF-0D;
	Thu, 23 Nov 2023 14:49:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6B1P-0054Pt-11;
	Thu, 23 Nov 2023 14:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700750978; x=1732286978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2nW/1LGl2QcBaiWsug9W+DfxO0d6D5rULUZW5FVoIc=;
  b=patFbzNaN+HMJ8n8YT6FHc7F5yw4r9luSaWB1jKB5Ucx5Cx483cZubyf
   Db6+rxOqwc3EIie0C1Z83+dsKOXo3et5KbJfpMnXzXlHalsHE97yyKcO8
   5XGcrRGTWD2ZawQozDubvm9m+X0vfIrxVP5ZtWfKL6tQEay1y/LZobMDe
   8FgJAaj/a3ybizYSgPWGNkzD0wzHCT8sm0aSx8rwnVIwtOv+3HPYWFdKR
   gX7LG3XjwoIeVcG3f9NdEqp/Vf59Kck73YZbK6pOy3fWKA0aP8LnXTXzO
   LS/6+n4rVlDlEwDJ16LvRipd15xEynX/X2vtbbyWArj/MXX/FIkwix/+y
   Q==;
X-CSE-ConnectionGUID: vFix+VS6R167bl20z2qAHg==
X-CSE-MsgGUID: XREYd5SfREaoPxmFZbFNwQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="179320751"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:49:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:48:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:48:48 -0700
Date: Thu, 23 Nov 2023 14:48:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231123-obscurity-copied-7a7bcc66d69d@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231122121235.827122-10-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_064939_434316_3FF61BD5 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4239205927825861325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4239205927825861325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fR4tnML+siyABFnW"
Content-Disposition: inline

--fR4tnML+siyABFnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 08:12:31PM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..694efaea8fce 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w. For more
> +            details, see the chapter 12 in the Xuantie C906 user manual.
> +            https://github.com/T-head-Semi/openc906/tree/main/doc

I'm pretty sure that I asked on the previous revision for you to
identify a specific revision of this document.

Cheers,
Conor.

--fR4tnML+siyABFnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9mNAAKCRB4tDGHoIJi
0i3IAQCWwY2KygG9PG216qosb6qNvHpfqqlRDK3j837NZ9ZYcwD9F+crFMrFfbDL
Nhs4rUikhLgCdhfK3SG8kkfTQRWL7QM=
=yQh/
-----END PGP SIGNATURE-----

--fR4tnML+siyABFnW--


--===============4239205927825861325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4239205927825861325==--

