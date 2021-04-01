Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF68C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 01:38:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC4F60FE9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 01:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC4F60FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llQJ0KH+AaVfy5FAwbd4ui95egc8rfo9MSQrRlP+UOw=; b=Ds0RjQ7suY5MdN
	3PHa7ES6E3QC3MLprRDmmO0M3ePf/n575xg8AdbN2pnZJT8rOza3GPGRkE90RCBfFSQ/pBdA7n6Xc
	TYfg+EvkNe5oFlslnH2KaFH5B8S0BRzr8WKi2f6RZefXNyTSWy0fXc1yTtLxA8cd+WYR27mv/7qU2
	Q5YU1GfB49g56gigKIl8gfOJtCvxShQAGArrW7Me4Iexou2ZrOprH/J/fzwnW4JS7hRi8AUguQ5le
	baf4djrGzKSO5IGIz1oaoC/iFkmzMzp4GSc5nz6580pykcBnWbL8Mlvop7gQkaJPaPOKr7MKSjeq0
	m9BvbLcL5MaXsvaiAxKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRmIH-0087wx-U2; Thu, 01 Apr 2021 01:38:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRmIA-0087vq-7E
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 01:38:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C492461076;
 Thu,  1 Apr 2021 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617241116;
 bh=WmnubEsAgc8t6clW+YFcx1Vc3k6TSjkIbSo38SNqADM=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=sFB7amG1A3mtTI5lMD99XII7OV6mpML3ucdD+KMKE1srv09XEeU9fqwlS/qXDjL9f
 9aUD5PCz9lFWqEwDVEOL0oa6puSNTYCdHHb+xXqqp8mLiMD0dCt0dEsfGkNaV1vRsW
 VWqGRpJ9e0jFMKyik9XfFVJDb5Q4uGYGVZeGuN8QzabjGn5rbVoaWc/GPRIO898iMD
 UTLZqUsDgS8CYdUnHbBxzYoUgHdK5RnMr65yNOC7Ii+UAHyvIXD5/BCQyHPLOMibDQ
 TDR41gVnx6faoTz6DKjqaq/4ourMOAKbAxA0trvNtozypd3QpybIGtkX0pTHV2zqPm
 0XyBy7MxRzbWQ==
MIME-Version: 1.0
In-Reply-To: <20210331092605.105909-3-greentime.hu@sifive.com>
References: <20210331092605.105909-1-greentime.hu@sifive.com>
 <20210331092605.105909-3-greentime.hu@sifive.com>
Subject: Re: [PATCH v3 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
From: Stephen Boyd <sboyd@kernel.org>
To: alex.dewar90@gmail.com, aou@eecs.berkeley.edu, bhelgaas@google.com,
 devicetree@vger.kernel.org, erik.danie@sifive.com, greentime.hu@sifive.com,
 hayashi.kunihiko@socionext.com, helgaas@kernel.org, hes@sifive.com,
 jh80.chung@samsung.com, khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, paul.walmsley@sifive.com,
 robh+dt@kernel.org, vidyas@nvidia.com, zong.li@sifive.com
Date: Wed, 31 Mar 2021 18:38:35 -0700
Message-ID: <161724111560.2260335.3440073350706698709@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_023838_500410_CD34F599 
X-CRM114-Status: UNSURE (   4.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Greentime Hu (2021-03-31 02:26:01)
> We use reset-simple in this patch so that pcie driver can use
> devm_reset_control_get() to get this reset data structure and use
> reset_control_deassert() to deassert pcie_power_up_rst_n.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
