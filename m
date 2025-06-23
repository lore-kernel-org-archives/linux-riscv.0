Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33832C7115D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 06:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQR2BkWIeDsSdD1S2IFTp0zvvS+IWX32pdSwUFMP4Oc=; b=pEwupfjYV8nXhg
	AuOlTPhkMnF1Kf5WLkFZbZh2eqWR+lZfWcsAzxh3e8q1fVPCEiCtVG8fok8uowP+G3r3mS+fEH8gG
	yN3WQ0JL056V775eBBSiLiTpqluRuhJBi6bCxmIVnL0Wsgd1SULMszEE7/7dQHaEQH+ICX/7dbMUw
	WexlRnC2nZG6o9stCSaeMGDuyhcGstkhdzj1dw6VJ5xY9AFxaWTpQsaVZrgz+MQcrE6WKsOThBFV5
	YkTlEmHTv/REul9ypGsXX5zep2BhM1MAAXDaW3tLXdcZleHkkLM68EjrgWDkXz90ttWpN4GddNsax
	mZ88KpdNN//S0QonfeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTaxb-00000001mjA-1AFW;
	Mon, 23 Jun 2025 06:47:19 +0000
Received: from email2.ecloud.global ([2a01:4f9:4b:5387::2] helo=mail2.ecloud.global)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTarG-00000001lHd-0NLU
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 06:40:48 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id 297857209A4;
	Mon, 23 Jun 2025 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1750660838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLgpNtx/boIApBv5pSWc//bswQhEsFbXQypbXTIeykY=;
	b=ip5sLEiBUhLNEb7dQe1Iz9dBtnXg4R38RsViRxUSbeXJzoioSdD6Ex6VQv3l53AKvBcBCU
	iMetLjvnRLSXxbczpkWTZwWfYOyL5JO/pn0M+AVhtOZg20Ac8ba/9F6BfFK3HA7Xl+AOTm
	1E5k+po1T1Qm5/VSUdFSXQiZz8nJhoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1750660838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLgpNtx/boIApBv5pSWc//bswQhEsFbXQypbXTIeykY=;
	b=c+kjGhqvGy47p2nqRb2Oa1q399S8ukOiSgu404gkJiJ7WFTR0x8CSs0fryDoQau4WJXwUN
	2iN4ZIGS7GOs+OZ+4AFADlWJGlC5DpAsPVjiJbQhVJ/VSn5h0Rh2rslNkcVTHFavdV+1rB
	TfJ6y4Bb+mbirIcm1c80LbSVeIRCgxU=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1750660838; a=rsa-sha256; cv=none;
	b=FAuKfniINvB77wTngpcUPVsI6Eq1dqhr/efasdsLnGMRsweZEfFWLJz4ihNJrR8nJAP11F
	S/5Bgx/b4h2VcGTBtywDSPcOe90me7Ir0KrcC5tLMGPcqTnipQmzFAcYbA2x5Nn9JLHZk6
	9R88Q3nWaOQwKdhiBihu5KjMB8KVp7Q=
Message-ID: <4cb09d05-d1f2-4d34-b3f7-be523b900a9e@murena.io>
Date: Mon, 23 Jun 2025 08:40:35 +0200
MIME-Version: 1.0
To: inochiama@gmail.com
Cc: alex@ghiti.fr, alexander.sverdlin@gmail.com, andrew+netdev@lunn.ch,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, conor.dooley@microchip.com,
 davem@davemloft.net, devicetree@vger.kernel.org, dlan@gentoo.org,
 edumazet@google.com, huangze@whut.edu.cn, krzk+dt@kernel.org,
 kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, looong.bin@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, richardcochran@gmail.com, robh@kernel.org,
 sophgo@lists.linux.dev, thomas.bonnefille@bootlin.com,
 unicorn_wang@outlook.com, yu.yuan@sjtu.edu.cn
References: <20250623003049.574821-2-inochiama@gmail.com>
Subject: Re: [PATCH net-next RFC v2 1/4] dt-bindings: net: Add support for
 Sophgo CV1800 dwmac
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20250623003049.574821-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_234046_609447_89C0A928 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Inochi sent:> The GMAC IP on CV1800 series SoC is a standard Synopsys
> DesignWare MAC (version 3.70a).
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> new file mode 100644
> index 000000000000..2821cca26487
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2044 DWMAC glue layer

This looks like a copy paste error

kind regards,
Maud


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
