Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8981C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:34:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704FA61007
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 704FA61007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0IQHvucIwc8lELmCBND/Gf8ZjsBTA02RygA2WHkyuSQ=; b=oHeSIzh9VCGVqrKZhH8kSH8Ww
	wlCPLIcfnAGxojtT+UWDt7GOk0E5uR35N79JahD+IIom1RMTcDDvZioukU1veBLplg8Lc3FKtJNu7
	3pNjC/11d2HqZYSpX14HMa4130B0EEDMNL41jDGySx9To91v1CwCbCZt+yRJF3vtzhyP0bkSA9//k
	xPoRixp3XrWQiZN34b3QDVVYtXObdUIorl7wd6P8pJzzXKuvBJy+3lWXvUTSpxMyKpqLoUCIQMOwm
	XhEdOQxj/uVppghszWBgZU9sei3oToGcstpwEwFdNZ9l69o8E9g72cezr3yX5gT2Jghru5etN4AeA
	uXfjPmwhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBVF-00BvAo-FO; Fri, 02 Apr 2021 04:33:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBV8-00BvAH-K1
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:33:45 +0000
Received: by mail-pf1-x42e.google.com with SMTP id c17so2881503pfn.6
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GYiZXIwZzjH0X+0J1x3koERT3StSBoc2w1Rkr7vdkgc=;
 b=pX8kD8T9wqupPZESSes4GHej2DQ73p/tn/rXYb/2cDHnZsf3aVhu8dCprLxZnaJexC
 e35u5jBP5sHGSMQWGB4dzk/SP8SAiKe9yevP95UeQRKADhEqm1iI2juIw9M6jAiK/fcF
 DWm0HGWXkxN+UoMx03xzIPKqxJjV/zB73DRGsZSH+YRwuE6DhA/jfyrhPEPdd4KZlftV
 92xSFdr5TEtoorCQWoCo0/NrQU9iOkn+K8U0DDc5exB5K4RGPMqUooNYof2Pq6Mj3CST
 SDEfJduKPhs8z2CePVOqXp+n9AxqwmAzOxkNuvqtUu1fF29gRKQOzuykWH3SnquxiLTd
 kZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GYiZXIwZzjH0X+0J1x3koERT3StSBoc2w1Rkr7vdkgc=;
 b=Q/mGmcEKdlLjycxnODOBtGUdXgpWUx5t97uLb6+3fNqbljjweuxaMQF+jru+h1FSbA
 Y1TuOUPEUwxO0DMMNCIBhA9EwljbZXjAYRyXZehdc+OVgg1FAu07HNAxtjaLdzISvhYT
 6vIOFMeV5dVFjXjxtSSczGtrxAFwiq3NWsBwzfw75HcwH2TUM5GwqVQ6wMORoJL5ATUV
 xiKWaHCLL7our7uFz5vslsYl2eZNWfe1OqfBcbNlUr3nXqWSUidCfjXwF718kqENw1aY
 mtQVx6x06eGn9Aeig59QORLzUA/uaV+ZvIj3RbM/07XubYD9Qd+C8ZgNmby+O2CXheYc
 +eLg==
X-Gm-Message-State: AOAM533v6xWD7UNrk+SHqfl49AYWHVKeHvUYA+msDR+NvkV8FaIxaBhM
 6zHtyK3dWtGdou5Q+NwS55ZHPWtDBOp3PA==
X-Google-Smtp-Source: ABdhPJzLbLKhcIhohjGK/Ae3NJN+gNPdq2IpS6pY1v/DFyjv1LGuWaLYJLS5pP1Xv5XAhO4xAtS1og==
X-Received: by 2002:a62:7b0b:0:b029:1ef:1999:1d57 with SMTP id
 w11-20020a627b0b0000b02901ef19991d57mr10612200pfc.19.1617338018247; 
 Thu, 01 Apr 2021 21:33:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j26sm6758408pfn.47.2021.04.01.21.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 21:33:37 -0700 (PDT)
Date: Thu, 01 Apr 2021 21:33:37 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Apr 2021 21:29:50 PDT (-0700)
Subject: Re: [PATCH] riscv: Make NUMA depend on MMU
In-Reply-To: <20210330132531.67706-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <Atish.Patra@wdc.com>, akpm@linux-foundation.org,
 atishp@atishpatra.org, wangkefeng.wang@huawei.com, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-23d08464-53d9-47df-8dd8-264cd2d461ca@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_053343_236671_51FF9321 
X-CRM114-Status: GOOD (  16.80  )
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

On Tue, 30 Mar 2021 06:25:31 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> NUMA is useless when NOMMU, and it leads some build error,
> make it depend on MMU.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0368453adc30..958676c6d5ce 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -317,7 +317,7 @@ endchoice
>  # Common NUMA Features
>  config NUMA
>  	bool "NUMA Memory Allocation and Scheduler Support"
> -	depends on SMP
> +	depends on SMP && MMU
>  	select GENERIC_ARCH_NUMA
>  	select OF_NUMA
>  	select ARCH_SUPPORTS_NUMA_BALANCING

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
