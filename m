Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91A60A2607
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z7WEnr5U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yq32b61r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nJGkU3BMl7O90x8t7ogfZielTJ0SDFid1mSE+YEn4Oo=; b=z7WEnr5UYQVI7+2XrA7AP3saJr
	7ODKvrfP/kUaCDt1eYRlM3TXzVU/Zq1PyKKru/BC752SnSHYr5sK7qR8NPDTQtV2URiAOCjKo0WRP
	Uwx9Q8oaYFEdudmX4R4C2Q98rts2tCqIGLMN6DEAYOPVZ6EO/+NVCzCnG+ol9/SzINYgbyIqV5n7a
	W8leVda2PqDCZfghRKKBJ5i26iYpz73zi4Nuf3FCBJeQo/SlarmUM9oLlwA4EeEOPbcxtU2dIRNDt
	agW1eOBu6mKstmKg/UV5AgNAGWeNiA2/mizf1HQcQ9JE0iv6hitdy6A/U5uaVLhzHd7sl4bXjLSVv
	ov9ztr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk2r-00000009r3F-3xSl;
	Wed, 18 Nov 2026 18:06:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk2q-00000009r2m-1Ph1
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:06:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D4B74162F;
	Wed, 18 Nov 2026 18:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F661F000C7;
	Wed, 18 Nov 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025168;
	bh=iQFVmrY5mqU3VTo8HhakGq37VzlLzgYRkFXNFEu6qaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yq32b61ra5e7HiCds7aqOCCBDvBOQwobSi41NFyAl7Tpi6ALGnTTXQSLWbY5ErcAv
	 NKwFYCAO++63qqo9L+1PGzP3K3PjAuHkSPxJRonMMHuZgxpU36mc40Y4RnA9czav4o
	 6LAWxCVaq3GiUOHy5uHunIV1mJCgYxkJtnHRmmApwv0Wrp9jNsZ8cD65sHbrJ+vvkv
	 Qx6AK4Jnp66GINz4Tw5ZtZp972eBgQ61nERGkfZ9Caqos2NEpll+5g07njNHB4YNhv
	 OCX4iGbMpho0X/3jbBJk86PyBftZaqOZ+bmFmo/aaJs8rYAgjfDIECa3YPxOzNHvrb
	 rKNKQ1NBYBxDQ==
Date: Wed, 18 Nov 2026 18:06:03 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
Message-ID: <20261118-ninetieth-gravitate-577e3d8c7298@spud>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
 <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261118-eic7700-megrez-v1-1-af8334b88336@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8205203808943672670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8205203808943672670==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Sm/SOKiLfkWZgSh"
Content-Disposition: inline

--/Sm/SOKiLfkWZgSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/Sm/SOKiLfkWZgSh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3pCwAKCRB4tDGHoIJi
0pNAAQDyrpoMjRwgAbi/Nc7EXwuYjbgNwtaYj9jrzfhSkSqS8wD/VoRBX3zKOZdG
XkfXROHUrapCf7ddXpv9jceHhpylGw0=
=Z0nY
-----END PGP SIGNATURE-----

--/Sm/SOKiLfkWZgSh--


--===============8205203808943672670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8205203808943672670==--

