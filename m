Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351E6C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:48:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A5960C3F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4A5960C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UZa5OmUzVF0MQ2bAUcwXo9D32fStdoNU/vgCN76QJVg=; b=eQESGxhP6DffdzufHYE/OkK5tw
	6sjNMED8rWww7/Xoh3V3tdZcsSrar02yCmXo44iEBelMC1flH56qD2ICdijEsx/4imsZG5nqga+XQ
	/HJbIt4Kv1IVuPDdzc633dt0L+BNuN6GpxB453rALxHb+l5/x3LxyuBbSv9wVeZK/pad2Ic5wTC3U
	JVXSwRMLURLLd3CYU4SxwS3SkrlVMZSoVr+gAOv42a6Zp+7NjaMLlZPpwiKE5Sfkqd0GmuO57w6+o
	GCIk85SDjk/SFC1R+rUTqSAEb7O8cCwsgW7xv7Z+hNGmyIIhBbgnad1GRhpC6OPFChYpsKbppEKHy
	0HC1pNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6O0-009DUo-Cd; Thu, 12 Aug 2021 08:48:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6No-009DSj-KO
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 08:48:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id f10so776709wml.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XFHOGWal8sj9+/NYHXBYiZDttgCo8MQmZS41UjmAkWM=;
 b=TnjSaR4dryTzq1TobA28+orXVqNx8bWsy3a0BDE3S8ve2uQk0vvzGrrbjTMwiMYRSu
 oVjzvVawcmA5v/FzG6o/huElHZV975CDYv739sdz/9JH5w0uUHoUSi7yi8jRBbn1uNTT
 zvJsSwqBh8GTzIUL2tPTjPQqgUOXT3zMDi9/l9AAUyYP9dIqe26Np3bnJ8/i/5AHADWI
 jbawWkZMCmsbQsJ6wwucKu6p68bSRUQai3WBFGBt5h21VQCTzbU6pCZs6bWK68urVxlu
 y844gmcFrRUavm2O4zOoyiXRCizIHUYCHULo8yFjZXAWFWp0PVsiwkmnJvRMGMdF+zGo
 nG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFHOGWal8sj9+/NYHXBYiZDttgCo8MQmZS41UjmAkWM=;
 b=FehT0FtNyY9FiliYpAxKu4VUdgdAyAGI5SxeyTxmcN9bElSjcqDblE+D3y+A81ZwDH
 MfQpgGxnRCEocQXRg5UpBzw7BByK0v7Pb1rA643jp8TN+FzzLaVs7eUBpUTeYgAWC+fF
 RDCAy/DuveSR29z3zgv440XZrPGfdP93BBFy9GnKBVBXDpYh3oe5kpQsTZdrIlNsYI/u
 4fwac+OXZrT5I6Rh0MYG7Q8fgPLqnVDGl1Axf4ygpQOP0nqWXTrh1ryd21f7967N2V8/
 uTTvBUcqtCthnI2qTyuTW46icYTgYA9LBvwqlD2ZMTSJa9T81roqWBxpWlT/gAJkxLki
 imnw==
X-Gm-Message-State: AOAM530qQtkNrcCNNxHUrsSgiJqgcxVUqjx3myefRHgBdbmLINkYc2Y/
 KEgt1suuyj/jIFRgRGfudSQ=
X-Google-Smtp-Source: ABdhPJzLbsspJrb3pj55Dy1sQCs3nGpP1+jpQD1sc8n0LAnXOAo2LkmdkTVEl0CcnF8GI8etHTZAIw==
X-Received: by 2002:a05:600c:b51:: with SMTP id
 k17mr2779184wmr.149.1628758090954; 
 Thu, 12 Aug 2021 01:48:10 -0700 (PDT)
Received: from [10.0.0.18] ([37.165.173.167])
 by smtp.gmail.com with ESMTPSA id p14sm8720305wmi.42.2021.08.12.01.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 01:48:10 -0700 (PDT)
Subject: Re: [PATCH net-next] stmmac: align RX buffers
To: Marc Zyngier <maz@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Matteo Croce <mcroce@linux.microsoft.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Jon Hunter <jonathanh@nvidia.com>,
 Will Deacon <will@kernel.org>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROmOQ+4Kqukgd6z@orome.fritz.box>
 <202417ef-f8ae-895d-4d07-1f9f3d89b4a4@gmail.com>
 <87o8a49idp.wl-maz@kernel.org>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
Date: Thu, 12 Aug 2021 10:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87o8a49idp.wl-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_014812_731055_AF072AAA 
X-CRM114-Status: GOOD (  16.06  )
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



On 8/11/21 4:16 PM, Marc Zyngier wrote:
> On Wed, 11 Aug 2021 13:53:59 +0100,
> Eric Dumazet <eric.dumazet@gmail.com> wrote:
>
>> Are you sure you do not need to adjust stmmac_set_bfsize(), 
>> stmmac_rx_buf1_len() and stmmac_rx_buf2_len() ?
>>
>> Presumably DEFAULT_BUFSIZE also want to be increased by NET_SKB_PAD
>>
>> Patch for stmmac_rx_buf1_len() :
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 7b8404a21544cf29668e8a14240c3971e6bce0c3..041a74e7efca3436bfe3e17f972dd156173957a9 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -4508,12 +4508,12 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
>>  
>>         /* First descriptor, not last descriptor and not split header */
>>         if (status & rx_not_ls)
>> -               return priv->dma_buf_sz;
>> +               return priv->dma_buf_sz - NET_SKB_PAD - NET_IP_ALIGN;
>>  
>>         plen = stmmac_get_rx_frame_len(priv, p, coe);
>>  
>>         /* First descriptor and last descriptor and not split header */
>> -       return min_t(unsigned int, priv->dma_buf_sz, plen);
>> +       return min_t(unsigned int, priv->dma_buf_sz - NET_SKB_PAD - NET_IP_ALIGN, plen);
>>  }
>>  
>>  static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
> 
> Feels like a major deficiency of the original patch. Happy to test a
> more complete patch if/when you have one.

I wont have time in the immediate future.

Matteo, if you do not work on a fix, I suggest we revert
 a955318fe67ec0d962760b5ee58e74bffaf649b8 stmmac: align RX buffers

before a more polished version can be submitted.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
