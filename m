Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC96E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyTGfbRcIlSVDTdX3NLMj/qbAuPHLZeHxBYoLpe3saY=; b=nGxL9Xm3IA7SaGzIcPCAyiLbHg
	/de1kq/8ZX+kEiByqLn1oDH14H52o5tnQPGjvS1INi4KgTCN78r57HTR4uPuujL4q0LjzhY+FAzUI
	6hZIJNd/SYr/YDYfeLKEkMgbIZM5frr0mK8favSJE1GuVUn7rZnU3e86c0kffdFPq/CPT1btdN1kP
	Oizr/3/KDANCVlwwXpdUTL7XJtfZwH9rdIM7wHQtc96y5OwvezwrPX8zfdWXgS1O+L227UH/cky7s
	4EVDmmEXBirIkWTNkZ/Wc2dPMVcuvVGXfv1wjfuC96fwe4jsDlaRgb07+Afi+bVgNZSrKj0gZID7e
	4F6nl4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHu5-00ChFZ-31;
	Mon, 02 Oct 2023 12:20:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHu3-00ChEj-1P
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C8FB4B80F88;
	Mon,  2 Oct 2023 12:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B29C433C7;
	Mon,  2 Oct 2023 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696249197;
	bh=DZl+88XIANR9stmuvgvxTA34wva6MwrOdltI/wRnKwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMcDa9pSvrl6mJJQkbrtXEQsdRihj+eRztUw07Wsi9TR86iZBL9Z37Ir60uI4FRlT
	 ChYiA3cAZjYnEXGgoQG3GZtn2vn2RtDcOkU8nJAlsbJaLZVvT/VewegNDxMHvDFw/j
	 2tk9vfnMN1bxE9xtbT/3aBiIGde9Oeuk/vOakF5R80uwED9ZM70sl88TXAUPi5oO+i
	 IcdqYW20S0RDyDRimrNd8XTKWQ6z7xJQMMVNcPYMsyGw9S2tkekZ4GurHmf02VtWYu
	 NRtDGOEzzkSpVh1cGZCWs4Bp7tUNNxGWzeDlUa0gIrH0zVEqqc9vvgzkuQhh9pXoDV
	 Svr3DtTjzKTdg==
Date: Mon, 2 Oct 2023 13:19:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <20231002-askew-stoppable-9f83d23a2e93@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051959_630718_8162ABEC 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: multipart/mixed; boundary="===============2749375574931251305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2749375574931251305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zQlghav6LTPdN2ou"
Content-Disposition: inline


--zQlghav6LTPdN2ou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 30, 2023 at 08:39:36PM +0800, Jisheng Zhang wrote:

> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";

This fails dtbs_check, the compatible you added to the binding is
cv1800-plic.

> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};


--zQlghav6LTPdN2ou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRq1ZwAKCRB4tDGHoIJi
0keeAP4vHqO/qq2G1lJUwVgpnAtLC+TXN33vit1CS4wPMWmSQwEAuNeK+rBkhXKw
kycWsB4SZGFsndH9TS0PXF53QxQ5BAY=
=JI9H
-----END PGP SIGNATURE-----

--zQlghav6LTPdN2ou--


--===============2749375574931251305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2749375574931251305==--

