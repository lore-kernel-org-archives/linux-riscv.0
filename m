Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7364AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWdgjgLayTRrruxifO//9GpD0D7uXmAi2wKIUhct9Mw=; b=mYgUHBJmQbd3Ljeijb+AJ95LIJ
	+fbyAE5yFmEMVIwJO1kg9KneMWP6HTcLmbE9W78g0FIcIHTl54PZ2UVjwtbDgmIRlEErp0XscNU3e
	HDJgtMYyoFn25+pOywarUmUt9UeZCJldouDoD/35ygTDTfG7b/xvExlk+ziKMd6273yaJkIlOpa5M
	egSpIU0gKN/5JyNdSZBnjLmH0rHdu4cBk2A8WRN8NDJE6cVn9EfBzDMNZ6OmqvN/DYf1gkBd3R2P/
	l9Gwd8xy0hkTeLZhyWU0PBmSTBdWjOV1lS+e6qBrfAMDPnc2d218OjUWEC3zRKjLuDPGoxA9RGWAG
	S4xooaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq4z-000000068zQ-2uYj;
	Fri, 19 Apr 2024 15:23:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq4v-000000068xk-2S7f;
	Fri, 19 Apr 2024 15:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20F7961935;
	Fri, 19 Apr 2024 15:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AD5C072AA;
	Fri, 19 Apr 2024 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713540183;
	bh=WgpaSd8gGDM2VtZUXLsdlXMBesxAbl08DIZs+EshcWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq7MJf0ANxxVvko+MORQK7tkExjxY8t0FWI5XkvrXHcW6V+mywxMoakepDADp5ZGP
	 wzFLOrjI2yZUukXlpppIdA8V3ZIxHTfX3anctFdKP+FtY4RKwQ6fVUC6Ajki9tRUEi
	 16UR77KQtNzq8EWPZ1NaaCghjMq0JheCv7Q9Es+Ool8LYeMP8GxZRANDBD8S148g7s
	 nwGZLcTr1eycU21O1cCuM9XqOMdZW0hGdA5dz/c8vdw3K30zuwVKpXXx1rz1OJFpO9
	 BQXrfRZoknTwZlM8x8AYRfzT19g4De/QhALHhRLujMZDHbtq74uMxMT8OIOYoBifJz
	 RxbK0dTlFobrQ==
Date: Fri, 19 Apr 2024 16:22:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
Message-ID: <20240419-irate-dispute-2714c42f3a63@spud>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-11-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20240419135321.70781-11-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_082305_697966_CB3213B0 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============3877466938635691249=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3877466938635691249==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="28c4hpi9ivVxCwkB"
Content-Disposition: inline


--28c4hpi9ivVxCwkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2024 at 03:53:25PM +0200, Andrew Jones wrote:

> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support for more efficient busy waiting"
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  The Zawrs extension defines instructions to be used in polling loops
> +	  which allow a hart to enter a low-power state or to trap to the
> +	  hypervisor while waiting on a store to a memory location. Enable the
> +	  use of these instructions in the kernel when the Zawrs extension is
> +	  detected at boot.

Ignoring the rest of the patch, and focusing on the bit relevant to our
other conversation, I think this description satisfies what I was trying
to do with the other options in terms of being clear about what exactly
it does.

--28c4hpi9ivVxCwkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKMSwAKCRB4tDGHoIJi
0iHgAP0bVRo/k8VGTCVwXeHhxWQfgjD463Unkv1KkQBnmsakhQD/Tkvq1OZjDrZp
rJPhWINZM3MPa7ALj6yQ2JG6CVw6ngQ=
=5nYv
-----END PGP SIGNATURE-----

--28c4hpi9ivVxCwkB--


--===============3877466938635691249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3877466938635691249==--

