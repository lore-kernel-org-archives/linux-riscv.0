Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A10C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eNrPDjWjPtKm84iqBp7eAB4C2/8uBDbBPOxvXiDJHo=; b=RwyvofkILW2zkmQvmwh98F7OqW
	KZARd5KWfNID5NIl6Qs43sit9A7vtVNumt7jlDNVcpGWoCff71S7Z8MxDMzHuJ8wUQxLa2sbV9uEG
	JO9AXDKoku2WvlClM4m3AvIcXQZJyIpULU4q3zWhF3y0Ao86lQTrZG7hfiMqcbdAGSTCEu1qo6WCx
	ZMjhOmw+njfTko1odraMLTf6ueaA+BW70cGdtK0FtKJ+JkX+9XSCMi1Je2wyup+wpnl4RlVzLd0Mj
	N7AKA/qbCeevT6XqMVHt+yryCT+TULp9ST2JWz1FV6M2vHn8vlUanDg4NnXGqbQ2qOKTSUBY2ylUi
	zmuNXomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtum-00000006u2g-099t;
	Wed, 05 Jun 2024 16:55:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEtuj-00000006u1Q-0MgE;
	Wed, 05 Jun 2024 16:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CA4E619BA;
	Wed,  5 Jun 2024 16:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDE3C3277B;
	Wed,  5 Jun 2024 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717606503;
	bh=BSnD9wLTtKbSKikywrrQT5l9mkvhTFfOEYd7ndU0zhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5XCRj96A0ShjEuilfFCPUt4VolsLcZBGYj5R/qcp0O9NFkBlt7kYC/ztC/cGPfpD
	 iGJFKR26NPrn5yfFhuWHMgyr9kg+rhDoxOX4Vdhx6kfTxWbqItMTK+6YiOnBXBglVC
	 HWWR9KaQxWJJreCrwXjsAxFwE8TN+gC0TLb4INkB82SnBIhlAsDGifzXeaeB7M7E6h
	 WYAbBMfA4GdYLqlVDemcs65Yny7KeRuSvlouZvDIZPP8CH5Q3FFNoDLqikyM4q9aFT
	 3ywJLHXhmbWc63yE8SD5XmV+sSwDwAfj4mx+b5SM5Yi6lqKQnhd2Wfq6oW5/OTJUec
	 Wf037EwFDJ3Ew==
Date: Wed, 5 Jun 2024 17:54:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	apatel@ventanamicro.com, alex@ghiti.fr, ajones@ventanamicro.com,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240605-atrium-neuron-c2512b34d3da@spud>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240605121512.32083-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_095505_278367_ED6AB2E4 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Type: multipart/mixed; boundary="===============6103823890612368787=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6103823890612368787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MuN5kP8SHGJqYdTt"
Content-Disposition: inline


--MuN5kP8SHGJqYdTt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..1e30988826b9 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,36 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
> =20
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for raising pa=
ge-fault
> +            exceptions when PTE A/D bits need be set as ratified in the =
20240213
> +            version of the privileged ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavio=
r when
> +            the PTE A/D bits need to be set. The default behavior for th=
e four
> +            possible combinations of these extensions in the device tree=
 are:
> +            1. Neither svade nor svadu in DT: default to svade.

I think this needs to be expanded on, as to why nothing means svade.

> +            2. Only svade in DT: use svade.

That's a statement of the obvious, right?

> +            3. Only svadu in DT: use svadu.

This is not relevant for Svade.

> +            4. Both svade and svadu in DT: default to svade (Linux can s=
witch to
> +               svadu once the SBI FWFT extension is available).

"The privilege level to which this devicetree has been provided can switch =
to
Svadu if the SBI FWFT extension is available".

> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware u=
pdating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull r=
equest
> +            #25 from ved-rivos/ratified") of riscv-svadu.
> +
> +            Both Svade and Svadu extensions control the hardware behavio=
r when
> +            the PTE A/D bits need to be set. The default behavior for th=
e four
> +            possible combinations of these extensions in the device tree=
 are:

@Anup/Drew/Alex, are we missing some wording in here about it only being
valid to have Svadu in isolation if the provider of the devicetree has
actually turned on Svadu? The binding says "the default behaviour", but
it is not the "default" behaviour, the behaviour is a must AFAICT. If
you set Svadu in isolation, you /must/ have turned it on. If you set
Svadu and Svade, you must have Svadu turned off?

> +            1. Neither svade nor svadu in DT: default to svade.
> +            2. Only svade in DT: use svade.

These two are not relevant to Svadu, I'd leave them out.

> +            3. Only svadu in DT: use svadu.

Again, statement of the obvious?

> +            4. Both svade and svadu in DT: default to svade (Linux can s=
witch to
> +               svadu once the SBI FWFT extension is available).

Same here as in the Svade entry.

Thanks,
Conor.


--MuN5kP8SHGJqYdTt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCYYgAKCRB4tDGHoIJi
0tLVAQDaJxypeK+klc9eSIXgb1/wgPLmEylTnc8/4ceKF/GFnwEAq4ysX3JMpe/B
tD+9p+XFfXCPa2GD2rvlTIT6YJMYuwI=
=Q4pd
-----END PGP SIGNATURE-----

--MuN5kP8SHGJqYdTt--


--===============6103823890612368787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6103823890612368787==--

