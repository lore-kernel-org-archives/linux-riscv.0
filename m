Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C91C04AB4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 13:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02ED20645
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 13:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3j1DgE3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YQdezVNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02ED20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPbIEsnciSfWjd2XS6bIrk8JMFq2kyvTNp36DR1m53E=; b=X3j1DgE39bLx2Y
	7NSfZ/aFyKTd1ZQEE3oLtmmduyn7ykhjV4+GpedEUXB1dTHPk7MIjhQ4Sv9cP157ZXjd75UONcBgC
	QRWBE7xk8HoLN+Gk3L1bVlkt1zvI+TYq8InZVFIJnNKlrFmT/YH9qgpxahNdSP6s4IW6epL+tECM+
	/Piiw0o25DIiNG6bVWvg2rofBXPflgE78HCKs5qQ+qF4tRiYw4UtOwChHtzaiwLIDnUvIO1CGriMq
	M0pP2dISrMpW5Hw+tPOI4CaOJEuWONj+cRxTHGv5dMgwNl4IwUb3UVHji2ebkOkxJpzr83EuCW1PK
	/lklGykHmcTIjQzOd2qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRG6Z-0000JA-5O; Thu, 16 May 2019 13:07:27 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRG6W-0000Iq-N9
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 13:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7nw1SCsI0DVhke4eyWVzQZtBh1eZLI/gGCG931c3pxc=; b=YQdezVNFHlhxbv9xNpI/EQAsV+
 2xP9ZCJsAn1IkuJZq6ih9C+um5dlHI7z5wXEvJoWnZ2LGZHVnR8yrGuT3imfbgcgpYSCkMoOwUBbq
 mREW/vDo263l6IaCe+MurR0dBxsNUlNn9s7UeVXX3qIliji8IbdccZu9/bjCUpz2qDQo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hRG6S-0003NC-Uq; Thu, 16 May 2019 15:07:20 +0200
Date: Thu, 16 May 2019 15:07:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v3 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190516130720.GE14298@lunn.ch>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
 <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_060724_939743_D6D60339 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 10:38:40AM +0530, Sagar Shrikant Kadam wrote:
> The i2c-ocore driver already has a polling mode interface.But it needs
> a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> There is an erratum in FU540 chip that prevents interrupt driven i2c
> transfers from working, and also the I2C controller's interrupt bit
> cannot be cleared if set, due to this the existing i2c polling mode
> interface added in mainline earlier doesn't work, and CPU stall's
> infinitely, when-ever i2c transfer is initiated.
> 
> Ref:previous polling mode support in mainline
> 
> 	commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> 
> The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> FU540-COOO SoC.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  drivers/i2c/busses/i2c-ocores.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index aee1d86..00ee45c 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -27,6 +27,7 @@
>  #include <linux/jiffies.h>
>  
>  #define OCORES_FLAG_POLL BIT(0)
> +#define OCORES_FLAG_BROKEN_IRQ BIT(2) /* Broken IRQ in HiFive Unleashed */

Hi Sigar

BIT(1). Don't leave a gap.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
