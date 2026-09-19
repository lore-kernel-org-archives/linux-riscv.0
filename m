Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA9FC982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnzVngdVCXFh4dyvf5GqdiCf8G7kd33SJaJpihOgaBQ=; b=njFoxC0VTCUnYP
	06jGRwpApuw6+j9H5UllWC+5TrqPGjGVWEA/huhJMDXaCUOEKR3JMiaJr6HPR4nuzp005zK6j4idf
	4ratCsUYap+s8IV9A0+7iuwdHJm88xrEvZ3voK5P2DBe9bcgfCUZDfsyE1yxvR37GAr+B94p/htNO
	P75cNfjnR+hIAhDiAFd6bqzHY4vVzuZkFuGIN435RMNdTBoscuXhyYRobe/C1b3DlOGKzBbYDU//9
	udwQSsHsXnPBKL/+YhnJKSrswhdFiBc9+8PhFZGyQ6RABE+jYahgxs7CdnMfHBv/PzN1iRGDTHsgN
	02B0DZN7qeM7l79LK1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iav-0000000FjBw-0o9G;
	Sat, 19 Sep 2026 00:06:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ias-0000000FjBq-3rFO
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 00:06:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08B1A6053B;
	Sat, 19 Sep 2026 00:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DD11F000FF;
	Sat, 19 Sep 2026 00:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789776373;
	bh=K0LdpFbLfSrouSaQWx1WxcGgOL0IJnEb3kf1PZZgOz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHt/yal8851lJexzW7Zy1gfBoxenPxj+oanpo5DnIn0n4Oos8HUsmE9MfIR3dsQcE
	 K58rNv0O+N3L7LHXmDecDWZoSAHhDLc+blEDv4Y5Etsr8OmkRFldnxLM5QMgIMV+ve
	 dKErdN+nziQzGs0QVUoYVvCql5PSIY33Gf/GvL2mGdBkAtjUCzj5219XQxBT41xgBk
	 KXjAQiJ/AsVEqAXW9C8IeIGHK1B7BS6FBZRXmfoQiBGktfsYyV5QEk9cJajBXA60AA
	 pBLi29QnIR3q+RwCILttXqBKCWTVLTz9pLrJjWaiJU0nzyM/NYbN3XzaruSGTac8Um
	 u4UEtm1cJDdcA==
Date: Sat, 19 Sep 2026 00:06:11 +0000
From: Yixun Lan <dlan@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Message-ID: <20260919000611-GKF297024@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas Gleixner, Radu Rendec

On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
> SSWI device requires no special handling and can use the existing
> generic ACLINT SSWI initialization function.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/irqchip/irq-aclint-sswi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Ping irqchip subsystem maintainer, how do you expect to handle this patch?
There are some dependencies between dt-binding, the driver and DTS file..

Would it be ok if I take it together via SpacemiT SoC tree? and probably with
your Acked-by? Thanks

> diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> index ca06efd86fa1..d3ef2cd3b5c5 100644
> --- a/drivers/irqchip/irq-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
>  }
>  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
>  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> +IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
>  
>  /* THEAD variant */
>  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
