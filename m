Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCCE9129A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wsh4ZHK+fqTSiWcCvipw75p3rusFQQyu4ymgnXFSfWM=; b=3nYR98q5bi8we+
	jEsu3/O1YttVtrU2Q5UUGNdfhx0qEAP6c2lqE0QWAhIqenzyD3o4ic+bBC/tSn1Eu6MAqyrp6DddK
	tRdX9NXOWfTUb+YjxHQq+T625PjaiN3RLkyrWNcmRd9pDMPDhIWaSPyYkR7ZbwGxGEf9MNdOri/GZ
	siue11LIBGYTnJCP/VtIOLeBC/Q61XJqlD4OwGqZtey5ABnvxge6g/xyRkE5HKLmQeM0nWEDMngwQ
	vaXyErldJ99lme7c81cFwYO40UOODwiOJSSzYzQDD4jXagAybUMFL3oQr+vQyZZ+Gboh85f/Ih5K0
	KTBA5X+W+zGKZirIHBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvcU-00000009hKN-2ggz;
	Thu, 05 Feb 2026 09:25:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvcR-00000009hK7-36B4
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 219D6600AD;
	Thu,  5 Feb 2026 09:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EBFC4CEF7;
	Thu,  5 Feb 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283546;
	bh=L342l1lGkleNHTukSL9PWnoU9lED8KcrpH6aDkUVB9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+RkB7kG7TqrFVHproWgVJXCAvOSpZO+ur7YRmB4miXv0fHXWc7JmYxFFjcNNEbNU
	 VQw8WB6EJQoXC4u5Tp3T3rDnFrK6YMrL0ULpXN5HINjpYy2xqQrmhrWoaBusVgOuTq
	 z6MA+GK68izAo16RcRCiU6IU1CSYHI/M9LyXwli2gD/57Mp0M7kG6pybO9+gL3J9Zh
	 HNZLTeDDo546YFdF4lLWZnh1QcLO1b/6a4tcYzby3xiobspFF+JzfoIMvFFCwn9c4G
	 H9t+ZLrp/jENz8gq1gdhTI7DlMwyD4og0X1W2j+fTBeZgZQ7Ztt05avRGCGlOTailg
	 hSiGBsiConfzg==
Date: Thu, 5 Feb 2026 10:25:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <20260205-abiding-dragonfly-of-success-5ff9bf@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-3-0922e43acaba@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-3-0922e43acaba@oss.tenstorrent.com>
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

On Mon, Feb 02, 2026 at 01:46:51PM -0600, Anirudh Srinivasan wrote:
> +MODULE_DESCRIPTION("Tenstorrent Atlantis PRCM Clock Controller Driver");
> +MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
> index 841516cbefd9..ff2c6a7c9a62 100644
> --- a/include/soc/tenstorrent/atlantis-prcm.h
> +++ b/include/soc/tenstorrent/atlantis-prcm.h
> @@ -21,6 +21,17 @@ to_atlantis_prcm_adev(struct auxiliary_device *adev)
>  	return container_of(adev, struct atlantis_prcm_adev, adev);
>  }
>  
> +/* RCPU Clock Register Offsets */
> +#define RCPU_PLL_CFG_REG	0x0000
> +#define RCPU_NOCC_PLL_CFG_REG	0x0004
> +#define RCPU_NOCC_CLK_CFG_REG	0x0008
> +#define RCPU_DIV_CFG_REG	0x000C
> +#define RCPU_BLK_CG_REG		0x0014
> +#define LSIO_BLK_CG_REG		0x0018
> +#define PLL_RCPU_EN_REG		0x011c
> +#define PLL_NOCC_EN_REG		0x0120
> +#define BUS_CG_REG		0x01FC

Why are clock registers added to a global SoC header?

Do not create system wide header with your entire register space. It
serves no purpose, breaks encapsulation and enncourages sloppy
programming liked drivers poking everywhere.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
