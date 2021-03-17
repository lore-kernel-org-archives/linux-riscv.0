Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B648C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:57:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB46164F2B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB46164F2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+mVZcwneaq9xZLGvEYAlu/cTjIH1mZjGujNRt7WKpek=; b=ReN+S3cQt8EtbqLLFlw0+YBLW
	1N0uIGjZu7u5G7VPYa8UScprtGK7DHBt9FS/RbmZWc6SF2EBva6Sm//xB5z3xeKDJFObguMXpFGrj
	LJRyGhPkKyoHoJTw9rost9PqmdLxMk/Xn7LNVUIwl4olW9PPu7wygkufCisNdkmDFvAvAZm7HRdyX
	hzoBv7GAyhiCpvLDypA2OnKezUbsoA+6birigEPxBaYenVju72JggeAG91rrAXEkMg+SVztkqDqHl
	oVSCYo65IaHBG5GWf+abuQF6oHemVAnG65dbzebrdPYy8toT8cZWpJXgMgs2QQr1+hBrvD9KcxsjS
	umJ1RzRzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMOEt-002TQf-Nt; Wed, 17 Mar 2021 04:56:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMOEp-002TQH-J2
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:56:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id f8so176269plg.10
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kNYiVBd1cBCop/nrtBQYXoofnHMlkqLGb5kuKDRfR4g=;
 b=rkmJjRKSwf7e15UE78TMTFXqP3y7u7jqpwes0ZtS4DmiApHjc62VD1ZLB6eoXSQRhH
 rOmJsEfJB807H+Vpvd8LEyvTkqPwNH9hLvv+NoPaWvsAdMbPksBlR5kx+21obllqi9vj
 7m8FusXNXESFNQwPDLtz5pX4JLZdChnlhmbIxKxV/4EjqYIlzx6r/2miWVNoDJ2v2vQS
 9B9ncsjzUP3I63X0fJ1mXwm83lpnQv90yCng7V9LdL2FDA4qmXFcokbOyfPPjTWtego0
 RTQIM7RkyT37GLguI6QJg6w/ndsvPK++vy5h/BqmcYOIgCN4pVX5Xz/P9DSQI93Hn13m
 tSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kNYiVBd1cBCop/nrtBQYXoofnHMlkqLGb5kuKDRfR4g=;
 b=pZyTXuXoexegjqoVPBj7aF93iFlqwLSWcnCdcFmoaZHCihBd41fA6n63u2QOBK1qGz
 ibGTVPKfs8rvBBeEwMazhT0fLOQ+HdoC7uZKgmuM8X5w/CgLryShbXx38B6JPeNZyGEB
 BfIAZoqWuUtaDfjanL71IBPlRdIcsJk9AwyV8NlXO0NPxtZjvYGSvB4zrHceMapI2sqK
 q03mQJGfsEXWzLtqpaGdWiN58DKsie8sOsM3npzgjQrXD9Wj5T9qteEaijOT+hel69Pv
 cA/kyW+noSMM1nvSQQfFNOBtWYMkgf2kgVvWvGc12lnEjF1y8C57Kz90b+96E/s2eFWA
 bzjA==
X-Gm-Message-State: AOAM533jS3x4vS+S21TllNvhJ3Y20d2ZUhPNCEl0F5r9clizcKT1mWel
 Ujk8oL9zOfXRxDeay/WcTSoOLA==
X-Google-Smtp-Source: ABdhPJyjXaM0gupVP9yZBysQyI/n0XlvnGgv9z+RdE3OBzlRIvtK6srLkWHzbGDQFe8EjRvgLIeGcw==
X-Received: by 2002:a17:90a:5d10:: with SMTP id
 s16mr2589245pji.126.1615957013965; 
 Tue, 16 Mar 2021 21:56:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k63sm19238522pfd.48.2021.03.16.21.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:56:53 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:56:53 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:56:38 PDT (-0700)
Subject: Re: [PATCH v3 1/2] riscv: Ensure page table writes are flushed when
 initializing KASAN vmalloc
In-Reply-To: <20210313084505.16132-2-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 nylon7@andestech.com, nickhu@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-8c8d3e1d-7d6a-4e28-8c18-901af08a29d3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_045655_759810_BD44B8B2 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 13 Mar 2021 00:45:04 PST (-0800), alex@ghiti.fr wrote:
> Make sure that writes to kernel page table during KASAN vmalloc
> initialization are made visible by adding a sfence.vma.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/mm/kasan_init.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 1b968855d389..57bf4ae09361 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -187,6 +187,8 @@ void __init kasan_shallow_populate(void *start, void *end)
>  		}
>  		vaddr += PAGE_SIZE;
>  	}
> +
> +	local_flush_tlb_all();
>  }
>
>  void __init kasan_init(void)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
