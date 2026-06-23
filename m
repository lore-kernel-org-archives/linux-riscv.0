Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7C8CDB47F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iueQjYPQLqolntz18fam9dpzMuEkMvQmEdHyGGb0zfE=; b=BZlf4PuBpAelvE
	PnArHwdMioTTn7gRLw/IjLkjLK5I7fPRwwaErY0FJSHDw+qbTZzA5pLe+DpdFHhcyv1LqQbUs0O+6
	HhDBK1xMn/UPiiHwq5CE3xqKvLYuJUrgTskxnBpGULG1gvA7Tbl4Kqao09XEt5Jb1Zau40DOJSgHF
	l+FAOX2C5/v38ZcBnBZq+EYjBWPrEKbBsME5CUUTnpeCg9A+kc8cSLSgYYPkqhpga1typ/Oex/g+N
	//UiFGo6XR+ReZBdxCnvXdIRMXxKz2kD30NymTIqlUUZSEoQyXHpf4PcWQeF3XOe6wFZVQ95z3fSR
	YLXxLcXozUVx0Bj1RtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4OU-00000006fCR-1zt6;
	Tue, 23 Jun 2026 16:54:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4OS-00000006fAM-0afy
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 16:54:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6C39F1A0843;
	Tue, 23 Jun 2026 16:54:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FB72601C2;
	Tue, 23 Jun 2026 16:54:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4181106C8382;
	Tue, 23 Jun 2026 18:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782233671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V0GuOlYRzJM4pDQWpmA6usQcahnlbuw1Vm/ChjlY/AI=;
	b=aVAhQo1Dl8B067G6c6X1YlKSceYxNORBwII2/tFPIRcS3+FcEBJ9ix/7L1fpUQ3e74MNjA
	iWV4EKuSIDPyTGlSiuvg76b0/1onRG+MJFEDF0ZrHf2ePk28OJArBYcUMIZhmUuQRd/DD3
	wsq50D8mKAob+JsOdHGnJFiBQRfJ4A7yLmvl/pVbISU2has5sBS8ZvNra9M0vKwoKVF3Tq
	rWFrp+kRbHaYwKygVplxYTDreeAm3B7FAf+0Pi8SAjC65WqFVpXpMpeOU2SRqLAx+Kl+mu
	4yTMA9wtb1o5+lcslnUa9EvsU6oHd1l6P3M9u8trBHvenKcQkuYqGurScb7yRg==
Message-ID: <143145af-5846-4a7b-9953-33c51b1dbef3@bootlin.com>
Date: Tue, 23 Jun 2026 18:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix wrong irq
 definition
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yixun Lan
 <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
 <20260623074637.503864-3-inochiama@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260623074637.503864-3-inochiama@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_095436_313092_F20CA46C 
X-CRM114-Status: GOOD (  10.40  )
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

Hi,

On 6/23/26 09:46, Inochi Amaoto wrote:
> The current irq definition of the wake irq and the lpi irq
> is wrong, replace them with the right number and name.
> 
> Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> index 3bfb6d49be6c..322bdf167a4a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -22,8 +22,8 @@
>  #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
>  #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
>  #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> -#define CTRL_WAKE_IRQ_EN		BIT(9)
> -#define CTRL_PHY_IRQ_EN			BIT(12)
> +#define CTRL_LPI_IRQ_EN			BIT(9)
> +#define CTRL_WAKE_IRQ_EN		BIT(12)
>  
>  /* dline register bits */
>  #define RGMII_RX_DLINE_EN		BIT(0)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
