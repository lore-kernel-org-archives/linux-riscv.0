Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C5CCA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xh8PfQqBZ2xiFAy3igFecn2JPU1PyEeXYO66Ufg47qU=; b=V4XZjh+TK4fDOQVSeGbXKMsRu0
	PNTCLUcnv6ByWj4KCvc8/WuEKAHn+4l4ImmGxOYjkOaVlPuggK68AmekM4HY7VWw87GTVMNcPHqi0
	IJedIyP8j6y6Vbby9lyGliPWajsGDE/rFPDL7a34L7tw6lHpSY/XogOojf/hN4MRouAw5AohWWBWm
	SV85rzz3+pMcvd3YUiUaW9BR39kfkDvRl2vHghXREzAc2przZwXnLQpx6M+Bxwc5DP07hr4qEnv9t
	hQreYAApJjqGmVOr7LXsGyJtnsOg+QakOBbpyBh5NdmqyW2ho5Ss9YUtlezf9JiMeFj7f+ZQHCN4y
	Zsy2TSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBpm-00000006TfC-2Lie;
	Fri, 09 Oct 2026 14:44:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBpl-00000006Teo-41VK;
	Fri, 09 Oct 2026 14:44:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E1E943C62;
	Fri,  9 Oct 2026 14:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB5C1F000FF;
	Fri,  9 Oct 2026 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557069;
	bh=2aemY+UGhY60/8ubgvUnN8kpzs04w1+otIMRTikkqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NgAR/+ie4+daensuw6LnghvUqohOWB2OOndjQ6APqUGKaRf696uyKQDXhRFLJm1Sg
	 DSg+yB5xqnwSFvc/tGJlgQt1qjvcDGn7d0suHXwYE8CUDpS1k2vFm669OSb2eFw1ww
	 El2fGJYM4N6E81y6MXCvmG34JFlfcm0RSkK4nag5xqr7BilubV28run/XYfLpLgv5g
	 plMRiMz0DtTaadbWBBcmRhRMQ8SzJUgXoMndv1bkHBi4MHtbpwJ5uFhIl3pJeuONCD
	 ZJpS1wtHwEF1ZqbPmKC5oPATUQ3PJNsS9pHKBC9XlHs13o8co3gNivgpF573To/dFj
	 hXYhPMNCZcYng==
Date: Fri, 9 Oct 2026 15:44:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <20261009-8fbfc1b31a4f57046e1735e4@squawk>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
 <20261009090444.3319517-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20261009090444.3319517-2-zhengxingda@iscas.ac.cn>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============2825933086393733127=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2825933086393733127==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yut5qOub1ik3//Ee"
Content-Disposition: inline

--Yut5qOub1ik3//Ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Yut5qOub1ik3//Ee
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasj9wwAKCRB4tDGHoIJi
0vHJAQCouzdHFAMv0dhxG/70lwYrwlY/tBaOX+vRU2EbD8bV0QD/Q3xZKbb4nEal
KrbLNq/GRpjWQmheqwB9+olZLhGWmQg=
=1yjO
-----END PGP SIGNATURE-----

--Yut5qOub1ik3//Ee--


--===============2825933086393733127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2825933086393733127==--

