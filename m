Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE0C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqn0q+bIArM1KL0Rl4Np4QcNPUUXVLot3nFk9u1U3Eo=; b=nfVyKECKq7ue6XKzHV3U9k788Z
	JKUk12BZmKJrzdzwBvuT3RsFw2Ae0VlKILr39g65Wx3ZTJEuZOq/JktR4kLANni8jGPpfOp3G8vXk
	AQNflCgeAY31A5gcVEB7oh5yKCnalxxXhaPvgYIelLBoVXFQJKXzArc3eDLO466ohMdIrHSgg1yWv
	acA502Y7KRGCUTst+jtuW4AnN7ay7egcA30YSpsFztaoZYuFBPbBajQ4cr+ynr5M80jEc4WlUwCtb
	SNnC493At32sH+hQpMCH853kVt558cGAAtfKnUtUdCfZNlywWV3isPaxq0uBKoC9m6hCYNbM2h9B+
	rSxcLdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZIK-0000000DIFm-1UZW;
	Thu, 02 May 2024 16:28:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZIH-0000000DIFC-1Lhp
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C916461BBB;
	Thu,  2 May 2024 16:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79ADC113CC;
	Thu,  2 May 2024 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714667304;
	bh=igeGofHHX03XUM7K37J588YrkNVJAkcgHSuZsnjbMRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkwArCD524hvWVLbY/B04VyZtyU2tSmLXTC+TN/3fNo1FFjhjp+e3HDRt66njqDKB
	 wTpSEwE6jVMeS3d3xMfLLOksc1ddn7gvw3UY4Sq+w7RKVV8HA977fRZj9yYHtKwZ87
	 9cWjCOHgQJJsrNlLKy5RoiUVP4kx4WhVE7KzStDBI+tK2S8uoslj2M0TWCE2tEOFuw
	 /MOMN1Z0IdPcYVCAyk4jpzy6Lt6DIcv3VGgEkEUw+bWDxRaYzp9f+9vagunjJ7jQuq
	 2+w7eY/+3Bs++xIUIgDjNo83QuObVB4VuHPezAYebaNgU0L84haFAdu+WN8hM4n2BD
	 WaPcMNA4q+gzA==
Date: Thu, 2 May 2024 17:28:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v4 1/3] riscv: cacheinfo: remove the useless input
 parameter (node) of ci_leaf_init()
Message-ID: <20240502-secrecy-unleveled-e173419c54ec@spud>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240418034330.84721-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_092825_430820_088E0F1E 
X-CRM114-Status: GOOD (  10.35  )
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
Content-Type: multipart/mixed; boundary="===============2643029118101881257=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2643029118101881257==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jCp1f9hek9NXabnN"
Content-Disposition: inline


--jCp1f9hek9NXabnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 11:43:28AM +0800, Yunhui Cui wrote:
> ci_leaf_init() is a declared static function. The implementation of the
> function body and the caller do not use the parameter (struct device_node
> *node) input parameter, so remove it.
>=20
> Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

By the way, please use cover letters for multi patch patchsets. I don't
enjoy marking previous versions "superceded" by hand in patchwork.

Thanks,
Conor.

--jCp1f9hek9NXabnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjO/IgAKCRB4tDGHoIJi
0hi4AQCMArFXXQ1jipb+xchGlJ3/aeXo1IgXwQ7MxE3mxAbG9QD/UwOrcrpHE3gN
t4eD8gxKhTy6Wmuj7HiFcstVa4iezAg=
=jJp+
-----END PGP SIGNATURE-----

--jCp1f9hek9NXabnN--


--===============2643029118101881257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2643029118101881257==--

