Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 03:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96K+NbmvZjyaMZmD7QbrI7eYqRE36tOuLIgrYvT+T9w=; b=Jef5zHcLGrYbKj
	b+p9ZNdS3Tff4svLd1xknAHVOMEip6ld/fgLIl+UzP1jmIYNEK7MiyC0bewep5zfV6zwSLDcYq1QP
	kUe9o2Zolj3spG0hQqEClvBXk//ixS7SpA7FKf9+dV+G6LOqpxvb4ikG33/YNbsuCEg9zb0NpDbe4
	YlpV9VS/d5eUfQjBqq3c/XHR6P/vJvgBFiBTFSckQAu2mZGcp5EA77DJPA+sU2z3ufHRD51UVKhuQ
	pWVUV4SWhGtgFBloaDbfQ6fOqKFM2JlAvc3GM/6+c6RgSnC7G8ERcxOXv4bPXckXPYPNS2DtA/Tps
	O/6OzrVXFQr25IzsdExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbvHt-008qAY-7M; Tue, 14 Mar 2023 03:25:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbvHl-008q3v-Vl
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 03:25:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A38DC24E359;
	Tue, 14 Mar 2023 11:24:40 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 11:24:40 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 11:24:40 +0800
Received: from EXMBX068.cuchost.com ([fe80::90c7:30cd:8828:91f7]) by
 EXMBX068.cuchost.com ([fe80::90c7:30cd:8828:91f7%16]) with mapi id
 15.00.1497.044; Tue, 14 Mar 2023 11:24:39 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Hillf Danton <hdanton@sina.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Thread-Topic: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Thread-Index: AQHZVbQZd9+lAcQFW0yunvw0rKV1eK7440YAgAC0knA=
Date: Tue, 14 Mar 2023 03:24:39 +0000
Message-ID: <a00427747c094f16acc78b536508bd16@EXMBX068.cuchost.com>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
 <20230314001744.1911-1-hdanton@sina.com>
In-Reply-To: <20230314001744.1911-1-hdanton@sina.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_202514_461733_763915DF 
X-CRM114-Status: GOOD (  10.79  )
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

> On 13 Mar 2023 21:56:46 +0800 Jia Jie Ho <jiajie.ho@starfivetech.com>
> > +static int starfive_hash_xmit_dma(struct starfive_cryp_ctx *ctx) {

[...]
> > +	dmaengine_slave_config(cryp->tx, &cryp->cfg_in);
> > +
> > +	in_desc = dmaengine_prep_slave_sg(cryp->tx, rctx->in_sg,
> > +					  rctx->in_sg_len,
> DMA_MEM_TO_DEV,
> > +					  DMA_PREP_INTERRUPT  |
> DMA_CTRL_ACK);
> > +
> > +	if (!in_desc)
> > +		return -EINVAL;
> > +
> > +	reinit_completion(&cryp->tx_comp);
> 
> What breaks without reinit?

Hi Hillf, 
So far, I don't see errors without the reinit.
I kept the reinit to reset the done field in case there is a prior transfer.
I'll remove this if it is not needed.

> > +
> > +	in_desc->callback = starfive_hash_dma_callback;
> > +	in_desc->callback_param = cryp;
> > +
> > +	cookie = dmaengine_submit(in_desc);
> > +	dma_async_issue_pending(cryp->tx);
> > +
> > +	if (!wait_for_completion_timeout(&cryp->tx_comp,
> > +					 msecs_to_jiffies(10000))) {
> > +		dev_err(cryp->dev, "wait_for_completion_timeout error,
> cookie = %x\n",
> > +			dma_async_is_tx_complete(cryp->rx, cookie,
> > +						 NULL, NULL));
> 
> What prevents wakeup from coming in case of timeout?

Usually, timeout is caused by failure to complete all data transfer.
It might be due to errors in dma chan setup or in case the hardware hangs.

Thanks for taking time looking into the patch.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
