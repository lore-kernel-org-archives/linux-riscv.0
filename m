Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C820EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS/QrprU81dE8QJoUGVpFLf0wpkqfxZMBUSrJVILt1o=; b=L4SELsd+5RYtLaQkx0yRjmFJz7
	1i7mpgOSvfDsnkayFCkOkTXkBj37/rnbMTx8sugyDn00caNcJwAIZ8X3gmAaVsF5WDruaHd4Wl4EB
	uSoe1EaRR7HmiHQdeIxkVsdZj8gRT51kOYbGaJ6wTfFwU4feCAU71u8wzE404kGW4ui5yk1+JMKiO
	oRDOwoLxPxs33+o8RPwAsUZ9UEgo4bBvovN6F/Nhs88D37Ei8Sj2wDUFx4Vm9loKsHiboXxh7MSRT
	OtB0VNi2ntPrQfS7DHNfz152f9DDvS8js8Aquyet4tsCDOx3e1VjTzTX9eVUhezlhAD0SVPf3xK3u
	ivbp0JXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTORy-00000007irG-3UM8;
	Mon, 15 Jul 2024 16:21:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTORt-00000007ipA-3KQT;
	Mon, 15 Jul 2024 16:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD32B611EA;
	Mon, 15 Jul 2024 16:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F120DC32782;
	Mon, 15 Jul 2024 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721060472;
	bh=3n0CxkXYMZj5Ccsl4uJvi6DkWhAkEYdeW2T81j4AM2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoCCQ+TNfFnrRDy/HbUaN2ryQOAS6D32gLdM9BsJGrs0Ryu/WQ0Q874AQKUiAmwP8
	 juZ2cu28HjbAX+ASWBN26XweT1y4NVy1Jx4Y16szA+2F28aUC+/srDEIl7V8QdhqGs
	 6dXr5+kE51Sg9UrSR+u4scBg3JHQ0zsx6WRUNJln90+fEyr9Nsr19+Im6WaQXTn4O+
	 xyPAqQ6Ewec6kl+ZXp0hiamUOq87Si5vtaxqucjSKue6rZgzXkBkgZhyXXWzEvQjfx
	 qSLcfUJif8BfLV8E6XKFzfZgWv+9xsWk49vAguqu2pbRPmkuSbCcA8WpZiVJ2wsAUq
	 D+ilwd0003Zqg==
Date: Mon, 15 Jul 2024 17:21:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240715-diligence-corncob-5a2aa2c1d54b@spud>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240712083850.4242-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_092113_917793_E0C83B38 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1634026081653265773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1634026081653265773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VCHWytzjaQEVcX02"
Content-Disposition: inline


--VCHWytzjaQEVcX02
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 04:38:46PM +0800, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VCHWytzjaQEVcX02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVMcwAKCRB4tDGHoIJi
0pYjAQD7lOuEvrM+E9koJjDaPTVPoSEyZSsjZ/iYe2BXlgHJbgD8D52pbL/2Lvcm
VMEDapj3I4kaohFwN98VBpOvrFwMlwc=
=4MyQ
-----END PGP SIGNATURE-----

--VCHWytzjaQEVcX02--


--===============1634026081653265773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1634026081653265773==--

