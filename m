Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAD2C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABCC2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TV79n3lE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NKKbteQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABCC2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZcgAynCDZE/lvGwGZFOPxZ4n6HWXnxFU/iXIQL5+AY=; b=TV79n3lEpFl1ki
	bhGp4iBnCmwfU287CFV2ka6rphtP1bQp+G6lHJdJg6Bi+35J7S47I7HFiZDY2fPXAd9qD1Qe6GgpT
	RwY25Mb2OClt6df9Ee+8DLO/ZhPztwGBNI8KkVdm+ODqYx3TDghvzmkvixIr1hd3vb4BV6D2gxrI7
	w0zbbTM1F/F3a5DOK2ecwHOtqe/0yNRl6Qpt/CnemOpHTs0Y9Nio/nTCJj5B6wkifsSULpqO2BcDo
	F89ndlbrtKFArFYSKKI2y/kbthxCiyVbYeChpnNtp0MZc5CObxxx1tbV1qZn0qMkQKI8SXZTnBwrI
	J9xC45x933lcMtABdRQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzULL-0006XQ-3V; Thu, 28 Feb 2019 22:39:55 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzULI-0006Wk-9q
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 22:39:53 +0000
Received: by mail-it1-x143.google.com with SMTP id w18so17248810itj.4
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 14:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=uHivxThy5oEIoOQZ8HlTW0n9/13W9GJOR3HZiimvqe4=;
 b=NKKbteQ4fC16pjtShMFPmcABZjmx5xOQ8ubr1qYkSgugFjzH8E5wF5+r24b/Nlhq3W
 w7HrTSQScJH5Nytju9ij9N49Fw+U/ywqxX2Z3nSVyQjkf5BcT2CpE+4U9Il0Z37D1xW5
 aMee85VMSq2n27cpw3wZwHeG00xNPKlv3s7Vx1cHjLmgCibNkCzI75T0EQYvFf3s83p2
 2SlYgZ4gF3vBbol1NjzQSj5tKaC10ZLpNsEzit2bZMqFj1nQKEfxJrvlozU+MOU6e1tz
 UybCMyBw5TpWcIpN/nyt1VVRRXWkDNGDVixbak1YXZDocFXXprR1EardZ/gsJ5W5v2LX
 xyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=uHivxThy5oEIoOQZ8HlTW0n9/13W9GJOR3HZiimvqe4=;
 b=RpPu3LmjN6JHCz8/Jk8yWH0FGyAJektgsIcZp95z5BEF5hodupIrns67w/ddBdupOb
 TELAKWQ7FTalPf5kaYnqnxPNvEGeWxX6tE7S2cGANt/ZLcUrQHKfx56Yec4XHN2DxSCa
 PsA2ss/pvJgJt7vVxUn9uvvKr7PuQr8zJQjqkfydSZORRiWLin0OhKgdOsBwZJvcI1BZ
 U7pfDaPyt5OcYVV//HP/NKqaZO/yfEX0DoZqUt2XB/SUwD254LUvb7HH86vUAn1CFI9i
 nl1TJh60VYQoJIbHKmTjAk4OK0DGkR5k3AuEmUSxl+JEMMA7dVOXtaw0dRuDeKu55Q9X
 O1GQ==
X-Gm-Message-State: AHQUAubQoZT+eo3m9fDGUCkaHzxrGiM9bECKNAcdAmEMnA6RvtcRsR46
 1GgNQf13uHIq44bwKHlLjCFfdrRhnjQ=
X-Google-Smtp-Source: AHgI3IZHOn1BV3fCTDaWj0JbPOQYCFPGhCxk4uLfF5Ger+Id7RirKEO093TXxBylha41EKDgbX23cw==
X-Received: by 2002:a24:43d1:: with SMTP id s200mr1426288itb.118.1551393589187; 
 Thu, 28 Feb 2019 14:39:49 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 u197sm3400700itb.9.2019.02.28.14.39.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 14:39:48 -0800 (PST)
Date: Thu, 28 Feb 2019 14:39:47 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] Revert "of/device: Really only set bus DMA mask when
 appropriate"
In-Reply-To: <20190228223257.6189-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1902281437380.17965@viisi.sifive.com>
References: <20190228223257.6189-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_143952_380116_058B7675 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alistair23@gmail.com" <alistair23@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Alistair,

On Thu, 28 Feb 2019, Alistair Francis wrote:

> This reverts commit 6778be4e520959659b27a441c06a84c9cb009085.
> 
> Reverting the commit fixes these error messages and an non-functioning
> USB bus when attaching a USB to PCIe card to a RISC-V board:
>     xhci_hcd 0000:03:00.0: Host took too long to start, waited 16000 microseconds.
>     xhci_hcd 0000:03:00.0: startup error -19
>     xhci_hcd 0000:03:00.0: USB bus 2 deregistered
>     xhci_hcd 0000:03:00.0: WARNING: Host System Error
>     xhci_hcd 0000:03:00.0: remove, state 1
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> I'm not sure if this is the correct fix, it's possible something else is
> wrong, but I wanted to get some feedback.
> 
> drivers/of/device.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 3717f2a20d0d..8299f8055da7 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -149,11 +149,9 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
>  	 * set by the driver.
>  	 */
>  	mask = DMA_BIT_MASK(ilog2(dma_addr + size - 1) + 1);
> +	dev->bus_dma_mask = mask;
>  	dev->coherent_dma_mask &= mask;
>  	*dev->dma_mask &= mask;
> -	/* ...but only set bus mask if we found valid dma-ranges earlier */

Does the DT data for the PCIe controller that you're using contain a 
dma-ranges node?

> -	if (!ret)
> -		dev->bus_dma_mask = mask;
>  
>  	coherent = of_dma_is_coherent(np);
>  	dev_dbg(dev, "device is%sdma coherent\n",


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
