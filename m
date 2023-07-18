Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FADEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hFh29g8t9pK8YcfitQHGBpDwpRJpbGHweRBhHdIizg=; b=s2/iShojjOss2ZBvVDWDvrVRO5
	F8v203lWmaa5XYNicS9FeKVYEKjiuIYrgNAyLlDQieAEG4qStL4ovTXtTlsTc105GgXoFPcC6ovU+
	Hwhi+MHy+pkcpZX2FBfNPITsiL/RQ23DPnIxydZb5nXqVTW2/TOW38Cafs3YrmBNnfn2J3zX3kTC5
	w2qSFQKFQA7uRLCsr1/HE+5MRjdAght2S+jG3pZNhUxg/nhIvUUcVcJxk1jY1JvvdSwPwE4fQj9jK
	H++bdcY0+d9EdbiDaSqbxadAKR8fATiE+Zpcqaik3WxZmYMRgy98YGgmBK63+ll9sMvZ5NJNTSbcn
	sY9sVSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0sS-005qkJ-2C;
	Wed, 19 Jul 2023 06:41:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0sO-005qgw-1m
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OUjUdujOU6xee9ci8vr4sbSWtz6K7GK3lKu01CccESI=; b=ZnU0H85bsh513ERs74rbmGsp4J
	/Ab+4ViZ2hViyPmZa2i63Tvpr/mSiHsGGqLhvHMLx5Tn2B7KZRPZz6k57tqpkrpfW9iG0QgfthhA5
	R1WdhNw0ZVR9MtFOHAvE6IYQJgkePbrS1+MC2R97TmzqXOdrQM6AXkoecc8ETkOtCsqurqiIt3MPY
	6bmsP563HeC4BoqwGwOEQs8hDL1g8x0kXoLyLETJKX2Nj2txLcy8Hzpps8F3sV87Q9VhqYYqdy4bd
	R/vrbhFTPK04RG66Q5Ml1GhobPPUfOPSSEVMhlsk4tCFu0U8LnKFPHiushEpWfnaA2w3xaUHRI7mE
	89fhYy8g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLi9P-00BQ1g-1T
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 10:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12AD561510;
	Tue, 18 Jul 2023 10:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A67C433C8;
	Tue, 18 Jul 2023 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689676902;
	bh=OUjUdujOU6xee9ci8vr4sbSWtz6K7GK3lKu01CccESI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3ikNNxkzZVm7sBvTch39A392lKdsF/MtLcWBHZrDSjcVZ+SryKeypemdThHWZ+6T
	 YlBh1j2T4dcMNoC+ECE/Fuq4UojR2o2lChd6E8f+hQLFOgF8NDA8p9Uoyp2Uc/9VEg
	 5pCOqd9GXoOGyyRanr8JMFAqGkbvRn9Ru7nhv33E/iaHALHu26Wp7GYcjoDQkwtJLp
	 rTmvuGXAymnL2SRA/3PuA30frH6/MCdmLx82NbedDQPKQbW4kidrmDxvtCkGo5pTJk
	 AbB5BqYgyWSe+Cegf7tqkirsUWrAL8gt8bHZsttVgWQM71+UTPPpdGq8JFPTJBnhh7
	 iirU7dVHOAjMw==
Date: Tue, 18 Jul 2023 11:41:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for
 !dma_coherent
Message-ID: <20230718-regulator-hardened-919cb8f4e562@spud>
References: <20230716165147.1897-1-jszhang@kernel.org>
 <20230716165147.1897-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230716165147.1897-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_114151_818078_A664AE93 
X-CRM114-Status: GOOD (  15.85  )
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
Content-Type: multipart/mixed; boundary="===============6992724283788041963=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6992724283788041963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WaDhwX/tojNUxqXP"
Content-Disposition: inline


--WaDhwX/tojNUxqXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 12:51:47AM +0800, Jisheng Zhang wrote:
> With the DMA bouncing of unaligned kmalloc() buffers now in place,
> enable it for riscv when RISCV_DMA_NONCOHERENT=3Dy to allow the
> kmalloc-{8,16,32,96} caches. Since RV32 doesn't enable SWIOTLB
> yet, and I didn't see any dma noncoherent RV32 platforms in the
> mainline, so skip RV32 now by only enabling
> DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB is available. Once we see
> such requirement on RV32, we can enable it then.
>=20
> NOTE: we didn't force to create the swiotlb buffer even when the
> end of RAM is within the 32-bit physical address range. That's to
> say:
> For RV64 with > 4GB memory, the feature is enabled.
> For RV64 with <=3D 4GB memory, the feature isn't enabled by default. We
> rely on users to pass "swiotlb=3Dmmnn,force" where mmnn is the Number of
> I/O TLB slabs, see kernel-parameters.txt for details.
>=20
> Tested on Sipeed Lichee Pi 4A with 8GB DDR and Sipeed M1S BL808 Dock
> board.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--WaDhwX/tojNUxqXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZsYgAKCRB4tDGHoIJi
0h6dAQCo44pYvI6nANHuLGtYjW6avnzLGuUsYn5qdzK431TdSwEAvpmfuiQjAx+6
2Y1b6+zCOekk56K2qaOXzuHSDGzw/gg=
=Px5H
-----END PGP SIGNATURE-----

--WaDhwX/tojNUxqXP--


--===============6992724283788041963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6992724283788041963==--

