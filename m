Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5666CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 17:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B22661130
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 17:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B22661130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a7PXo/s1T9aJRrx6LkdDcTs6YthejPIJh575JiBrjRQ=; b=zb5VFhygSjmSEw4pnYC2Ew+reo
	jUaxB09tpgFcLwqtYbENAIzkpCbw4qC6VmhWJuz7EejapaoWnx44mrQtBWIv0SOZRT3PqVzJGHKWI
	HeZz1h0nBPCz+HGhy5fO6lLVu3HeGt9bzRkDYdnrfvLxTwfJwiFJWhei6ucBBJbCshehMydqUQzSJ
	+EuvQ/7a82IMZP0wBVK2R7DGQseo8FXIXnKJeHj1Od8zFXH0k2WuiqbczfDZwxuM3UKKwZtHyskG6
	oWhKhg92smEnSgvgAsEiolG8eQzkLs08jFXlb0KE+V7w4ot9jVEzXLCfPUIiQP2BUGmJNHj43dfWU
	zqXFqbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBuv-006X3E-GN; Tue, 14 Sep 2021 17:08:21 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBus-006X2o-3l
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 17:08:19 +0000
Received: by mail-qk1-x731.google.com with SMTP id m21so43282qkm.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d9SzK4pBoaf11lP96SjVpjf29pHlYDeVwg9n+E1Drc4=;
 b=QtkWU/EmWLfrq260BxNf0mGiuYZUZUYyoD0xPuezViRZ4mF/XCnK/tGHLl6uCuwm/l
 OEBXW3WMwE0A/G6QfVBdQklqm6ber7gQIzEoSN3yJBWkAmnQxly90HsctdXmmytbzMHF
 L3KoPTc+Mr9B9ig4OIUiOkfFqAQvWzvACCR/8Z5Ak8G8u2ih5jz8qYrxjV6ZrPlHV7nH
 BwsNYjdiDWP5SUb4oj+pil2/1n683Q+0Hj+me82nhkYlYutM9n9fdJneQXyogDsqvWYR
 fK3GeRs3REIVRpVxC3R5+Vhr/DO39JCqMeN/rHxtTsQw1cI5NFDsb8Hd8MuoOdbh+67y
 eXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d9SzK4pBoaf11lP96SjVpjf29pHlYDeVwg9n+E1Drc4=;
 b=rlRL9N7t6B/d+ITLABL4Jog7EgdGcTf7QrJXlLX/XTx5+NwCGVhi9xpLPSMLgQIe5z
 sH6TKzPc7RLbDjYaVB7ADqyDD4PED23kUvsuOgPVLiPP42DN8+DRMdJQ4GNamlwtT/Yu
 +TBfzlQW2R+HzyM3bdwk7moNLIM5rbXvzKbvY6ahcUW4lZLkZy+zukIULv6zGknsg9ut
 7kFPfer+dezYrRwRUsX3qZkGKEz8g20veQd+KXZ1HDwe40khdbmv0sR1l+536jCQtCYD
 SbbBcV2gBbB/kpqjUsMv+TNVEQVJxLu7J9D2aF08PX/uImBhmE8E8AAe1Tjbk34FVwg2
 vlzg==
X-Gm-Message-State: AOAM532z8PqFq56ZBCJtAF8mIYOFrhN+1/NTFk4L/uwyjdhyO0m/VWrF
 6iwWFnbafX+l2JV8cLW+ZBdq
X-Google-Smtp-Source: ABdhPJxLVtFRYIDvR4qJehRmv7dzyozIgYmkFOFqnGnr6OykjMd+avsbggpblmz9NAJNvd4rGy/Okw==
X-Received: by 2002:a05:620a:916:: with SMTP id
 v22mr6042305qkv.338.1631639295927; 
 Tue, 14 Sep 2021 10:08:15 -0700 (PDT)
Received: from [10.28.133.11] ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id r23sm6405377qtp.60.2021.09.14.10.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:08:15 -0700 (PDT)
Subject: Re: [PATCH 1/2] riscv: support HAVE_EFFICIENT_UNALIGNED_ACCESS
To: Chen Huang <chenhuang5@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210913121956.1776656-1-chenhuang5@huawei.com>
 <20210913121956.1776656-2-chenhuang5@huawei.com>
From: Darius Rad <darius@bluespec.com>
Message-ID: <84697744-f51e-8aaf-d1d3-d063f99b7790@bluespec.com>
Date: Tue, 14 Sep 2021 13:08:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210913121956.1776656-2-chenhuang5@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_100818_291367_7099456C 
X-CRM114-Status: GOOD (  16.02  )
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

On 9/13/21 8:19 AM, Chen Huang wrote:
> The RISCV ISA can perform efficient unaligned memory accesses
> in hardware. This patch selects HAVE_EFFICIENT_UNALIGNED_ACCESS
> for that.
> 

Not all implementations do, so it seems like this is not appropriate.

> Signed-off-by: Chen Huang <chenhuang5@huawei.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index aac669a6c3d8..6e70bf50b02a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -81,6 +81,7 @@ config RISCV
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS if MMU
>  	select HAVE_EBPF_JIT if MMU
> +	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_FUTEX_CMPXCHG if FUTEX
>  	select HAVE_GCC_PLUGINS
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
