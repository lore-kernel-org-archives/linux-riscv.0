Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F00C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 21:36:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5A122288
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 21:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5A122288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3J7M4e5p4tKG3av4R2qjkzrzwcgessf6grCLjPY3j4=; b=MXPr45NZCjD1rvO/0Im42EhOlz
	t84yvLVtmH41EnaI5Xle2hpetV0Pzz2aqG28oX4zxLGCcF8ez6jvWG8RsN9OcXv0vYqJns/cV/7+n
	nvYH6GHNgNdK29d6CeR42V+fn1N/Gbmw2iUFvXC4wUjhx/lyFg1rUmR7A0LkIczSvfLaLB1y83GJG
	ZLw3fXhFoGOSBGDyR37uQJ0pR4oSHgbSlDeCob4qyCHYV5G/kmtIc1yWWGxKA9QWCQDcsiBUZ5+jp
	8qyZIy5xw1flxVxuuQVHtJOKPCioCG/K5PyiSLsJUWBCCJWJN7U+rwZvPygzBaysUjyo4zJK1LVj5
	qZ2NrGHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz4r8-0007Ft-SZ; Mon, 11 Jan 2021 21:36:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz4r5-0007Da-Hk
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 21:36:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id i9so286023wrc.4
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 13:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:from:subject:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JjhX+TMUEJN1XvProD26j5/JejgcKCm/i/sK2lOcnvk=;
 b=gbuZuqib606BmRbnJWObIfxMPb/hm83LrUIPbHo2kk8Ct3ps306mxAM/5Go2sfuESr
 Z9gUv5yHCIJadsOex7tmNTCuJVglZEVSoRr4PIZUrSEASmwvlVQjvAOuxIP5VQM55oTr
 /OZC6dVhSOavZMlYuNwf8q4ALHIP+aDH66onsZl6n31SmmtAKi0gVzA1lzhfbal+RGCN
 NbM2ni/kPftZNkITZSwk0ZBktb/6XWkkwiV0szX7qb3QKpIZfdnHcw8zoN738Mf5K/mt
 A5i8OTvx8O4EW4g7vraLkSM0PVCPuvxjyHqZKHE9PLJRTA/m8KCTio54HuPj1/uIqYs9
 rNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjhX+TMUEJN1XvProD26j5/JejgcKCm/i/sK2lOcnvk=;
 b=a3lHpkYGiMtdnCXG/mXNHj01JTDbXs5+gWh+JTjJX5ZkvX1z9H6K3K+SMEtpI2Jgp2
 tE9DX+zJmOHt8GbUuOiOfb68trqAAsT2lWUwJ0TaXklZkBxk6BKRcgIlQUxBoeA5lsPJ
 aEc/zSAt9PrLDOk313yaxbJy6lWbydUWBtHanzLR3eXkr77gsb4Xxj8HLzJJn1PoknNY
 AUpYhdLJb1ltOnBT4PsZHsehTSD1yWkkLpu9T/97IlQWnmsQquPomTiuGKEk3/bISSN1
 KSKfAjeg9iF7ruwOP7J3urbu4pIc8vQcB/z9G3d35rfFxS2ay6T+dmlsdFAvV7c2OlFH
 zLCw==
X-Gm-Message-State: AOAM533FUkzHWNmsXRfQj2Qr5suzaFsKtjL3usQrhGjvKehrepv5UOO2
 s5gFGnXYpTF/fY65toOFhLwH46sV2J8=
X-Google-Smtp-Source: ABdhPJxKVSv0DdrJagzcdGXIj4f8cDmyg+28M0v95gXqEiBzxqfepXB4KE7PWXXraVlAuEnOfArupA==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr955104wra.275.1610400959259; 
 Mon, 11 Jan 2021 13:35:59 -0800 (PST)
Received: from ?IPv6:2003:ea:8f06:5500:7ca2:fb6:9bde:f4e5?
 (p200300ea8f0655007ca20fb69bdef4e5.dip0.t-ipconnect.de.
 [2003:ea:8f06:5500:7ca2:fb6:9bde:f4e5])
 by smtp.googlemail.com with ESMTPSA id j10sm869109wmj.7.2021.01.11.13.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 13:35:58 -0800 (PST)
To: Paul Thomas <pthomas8589@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, netdev@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org
References: <CAD56B7fYivPF33BhXWDPskYqNE5jRxd-sA=6+ushNXhyiCrwiQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: net: macb: can macb use __napi_schedule_irqoff() instead of
 __napi_schedule()
Message-ID: <f3b0e354-9390-1ce8-6be5-b6ba9f201589@gmail.com>
Date: Mon, 11 Jan 2021 22:35:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAD56B7fYivPF33BhXWDPskYqNE5jRxd-sA=6+ushNXhyiCrwiQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_163603_701603_4BCAE517 
X-CRM114-Status: GOOD (  15.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 11.01.2021 20:45, Paul Thomas wrote:
> Hello, recently I was doing a lot of tracing/profiling to understand
> an issue we were having. Anyway, during this I ran across
> __napi_schedule_irqoff() where the comment in dev.c says "Variant of
> __napi_schedule() assuming hard irqs are masked".
> 
> It looks like the queue_writel(queue, IDR, bp->rx_intr_mask); call
> just before the __napi_schedule() call in macb_main.c is doing this
> hard irq masking? So could it change to be like this?
> 
It's unsafe under forced irq threading. There has been a number of
discussions about this topic in the past.

> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -1616,7 +1623,7 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
> 
>                         if (napi_schedule_prep(&queue->napi)) {
>                                 netdev_vdbg(bp->dev, "scheduling RX softirq\n");
> -                               __napi_schedule(&queue->napi);
> +                               __napi_schedule_irqoff(&queue->napi);
>                         }
>                 }
> 
> -Paul
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
