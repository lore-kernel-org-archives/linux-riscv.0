Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE6CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyr7coqdswTYDN/jbjdpcPmbiHhiCTL+7PpmADkiiQE=; b=c96/Ih2rkXebO2
	KTI88/UW1L9FI0GUe2EbJpNfezxmEHVCHABiQeQ2pVZu3TkdcGBY3RursCX2nNh8VWE5yFE3Zcwit
	YV00E5HST+X1YHhc7ANjsfZvVjg5knnB19UT8woWxj9aW0lT88jM/aAUVelVk3CHa9Ng7zet1Wfkw
	fBAAt7I/xC+tpvgt9UUNWk4M2yd3OlkP/reKxpTvMfp1GSQHFF2KNP1iUlVHVlQ08y1eb1RUyIe+Z
	5Sl6LYcOXjbzaBZHD59jUhp4de7xv1gxeDTqdMrXCy0UjnPSJEAY0aonnfyaZuL+/27ihFydCTsYv
	dL6J1d6TAX6XJUUDX0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovM0i-006LFk-3I; Wed, 16 Nov 2022 17:15:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovM0f-006LDt-I7
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 17:15:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B057261EFC;
	Wed, 16 Nov 2022 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9122EC433D6;
	Wed, 16 Nov 2022 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668618936;
	bh=PrNayE18WdJpr6ek/Bor8UULn1wmquQBj0Nmi5bKC1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bUzSmWpezVqfWyumZ7fieAeIRA7Abj++hxfxPG02XH/IOujqqtcmo9p44wfT813Tx
	 WgP50dRK7qn+/379exBwvdbZbX1vMfZs5kMBoiK4awDV2x7ww9ZQduP+o0eRkRH7WY
	 ozYDuUKMUCSO/6MwH+oMKMrxSDz+7oyPD+eefKY2NcEl+7LvqujKqr+1q9pNxIWMZz
	 PlLwTMcK25y5rnfWc9FJcLvgQ8jSXO10tYtYOzoaQWiJqflJjWDw5r1tDK4IEr4w/h
	 94+VOcbBWqbN1/gD+xtMoxxaxqqHPptxzQvy9CY+2AGEvqJ/6N/MCv0JI6DD5EsYH+
	 VTN5e4AtdqEUA==
Date: Wed, 16 Nov 2022 09:15:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "xiaowu.ding" <xiaowu.ding@jaguarmicro.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] net:macb: driver support acpi mode
Message-ID: <20221116091534.42ae8045@kernel.org>
In-Reply-To: <20221114114126.1881-1-xiaowu.ding@jaguarmicro.com>
References: <YxYuRaXxtyMIF/A6@lunn.ch>
	<20221114114126.1881-1-xiaowu.ding@jaguarmicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_091537_685196_21E6EFF1 
X-CRM114-Status: UNSURE (   8.15  )
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

On Mon, 14 Nov 2022 19:41:26 +0800 xiaowu.ding wrote:
> From: Xiaowu Ding <xiaowu.ding@jaguarmicro.com>
> 
> Cadence gem driver suuport acpi mode. Current the macb driver
> just support device tree mode.So we add new acpi mode code with
> this driver.

Does not apply cleanly. Rebase on top of net-next and put 
[PATCH net-next v3] in the subject, please.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
