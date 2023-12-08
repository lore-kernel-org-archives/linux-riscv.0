Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64ADC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4yue4O4xHGXEQfEuN0VnHMn6OWam4oGE6R/+cX8/bA=; b=WYzJ22dpeLLeuL
	rOLdPXNHKiGg5nHqyFIkk8x13q3CmyKJ5+X29vpYI7Ym9OaX4F8eR/ZRIVLqYF8pHbCrwwPQAKAA1
	Ir11dR+jDJ24Reoy4W0Ipt47titAgzoFuH+U1G0m0SlDM2eS8dEZdICX/MXn0PMz7yCA8R6TfjiQ7
	bzyGW86FFG8a3KQrqz5qI24MjA7EaPyntuiTpWLHYxTD8Lcd739qlspWxVmO/td3KjJRyMbCCKikp
	yBWjN4dU0jx2BBE7n6fC0ZIFCS07hWdj8IptldKnuaIoFD5n+AOnFwdskkbZaRtLn/4QhE7GdMEa7
	SsH0TYcEvVIfFpa/vqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV75-00EwLT-1G;
	Fri, 08 Dec 2023 07:17:31 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBV73-00EwKS-08
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 07:17:30 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d18c224c7so882528eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 23:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019846; x=1702624646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7Vin8BT3wpq5T3wEcuxWKKOuHM8AGLU+CBTDMoLXsk=;
        b=KQizTbB8OcaXxHbMXjYM3PNFbLYnk02Y74ZiIlWGBSjB+cCKMt57Qb66IQlYjpHN7K
         QT26/LPgO9pBa+g3WOFLXFqlLkSCoGsSDD9aY8Vxvk5EZm2JaJc4UYl/vXELMouV6AXg
         KhYoD/rsrF0lM+Mp9ThnBfqa3ltE3fyrGXniGIIzMzo9AppUy85LJqP+DWO/PjTm1krH
         Jm32Rz18BjHj47pr2R82HeYQeGI7AQ2YJrAhn07n1iQLHWEEFh3usoIUyPF37YKS9aiJ
         uIP6W57ZJXTkmjbrw9l9DTAU1Vavp1PKoQ8sjBlxxZwyzPS4ipEa7jVaZ7XSFF7RinDB
         hSHQ==
X-Gm-Message-State: AOJu0YwfvhQKd8RBG0PRPTiVtbOYyr1dTvgqNMCzdCQng3HRC5S7CqIt
	dsMrznuGOfRQm4mA0Axm8XM=
X-Google-Smtp-Source: AGHT+IH8OSidPNL0zpguBgIQHis69yqzvsgOqd92TReCneG0LANM00oMabB5MbmHHRItMnFMSTdHNg==
X-Received: by 2002:a05:6358:4327:b0:170:17eb:1ed with SMTP id r39-20020a056358432700b0017017eb01edmr4228974rwc.48.1702019846351;
        Thu, 07 Dec 2023 23:17:26 -0800 (PST)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id y130-20020a62ce88000000b006ce9d2471c0sm956133pfg.60.2023.12.07.23.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:17:25 -0800 (PST)
Date: Thu, 7 Dec 2023 23:17:23 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/2] riscv: Enable percpu page first chunk allocator
Message-ID: <ZXLDA3zObbLybTJB@snowbird>
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231110140721.114235-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_231729_080175_1C1EF2A7 
X-CRM114-Status: GOOD (  15.30  )
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

Hello,

On Fri, Nov 10, 2023 at 03:07:19PM +0100, Alexandre Ghiti wrote:
> While working with pcpu variables, I noticed that riscv did not support
> first chunk allocation in the vmalloc area which may be needed as a fallback
> in case of a sparse NUMA configuration.
> 
> patch 1 starts by introducing a new function flush_cache_vmap_early() which
> is needed since a new vmalloc mapping is established and directly accessed:
> on riscv, this would likely fail in case of a reordered access or if the
> uarch caches invalid entries in TLB.
> 
> patch 2 simply enables the page percpu first chunk allocator in riscv.
> 
> Alexandre Ghiti (2):
>   mm: Introduce flush_cache_vmap_early() and its riscv implementation
>   riscv: Enable pcpu page first chunk allocator
> 
>  arch/riscv/Kconfig                  | 2 ++
>  arch/riscv/include/asm/cacheflush.h | 3 ++-
>  arch/riscv/include/asm/tlbflush.h   | 2 ++
>  arch/riscv/mm/kasan_init.c          | 8 ++++++++
>  arch/riscv/mm/tlbflush.c            | 5 +++++
>  include/asm-generic/cacheflush.h    | 6 ++++++
>  mm/percpu.c                         | 8 +-------
>  7 files changed, 26 insertions(+), 8 deletions(-)
> 
> -- 
> 2.39.2
> 

I've applied this to percpu#for-6.8.

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
