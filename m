Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D6CDB46B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 05:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v97xGL9gYjbBohdAiOm6ZgzaUHXKV4yTONS3UuGvk8M=; b=Mz+IYgi6FN+bIg
	qNZ9PuWKqGViny12ObENnq0hFGTBAYIrVd+2Zu/B2Mwb07bANYRtKjiGIJEVDCenqzqnI0jff4ErU
	ixKRW85OtFbUbrIxrZkZf/q0g1sAApZDPzTsdjWWjgLc4aBwMZ9InXYQXBDmqT0rErpIKAdMmzj73
	J3i8XGZlcRVB6CEjKTcjcslHOrfiSB+zfPVbsuI4o8uMr23CNL3xJdmrBisa+nsiyxtK9RUM/ZkFv
	aK094tm4hYXaVP2X2YBAukpXCCjvI7yo3xE8yEoLFAGJwDrOUzpI1bT3x412VS9cW48UiY1TFJagq
	vqpgB3nUP4TO3JHDRUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWvj-00000004QKl-03dv;
	Mon, 22 Jun 2026 05:10:43 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWvg-00000004QKC-3hLz
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 05:10:42 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-13986d61b4eso807118c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 22:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782105039; x=1782709839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HIbzdwTX8eOcdWh67AvLsLpbbq7zr3xsG9SGVvGjmo=;
        b=gqZy73emlLFZ5mq9iBx+lIeJ258b4yyDkJ8rcdRxcDvZ4wKoMEHyXyGnPXN6Ns2HNs
         OPYvzt2M2WJQL7JNmYEpTaVeanhpppFiUyU8Jz5YqL2hcCSez2tkyBu542PcXQF/6Tlz
         qajLZenakT8bjbTH1njxwAiu1GsHx1ZCTRhLCqZx1+YfCoBQtkHqUMUDHY8mTRfZ9Poz
         nUvZgP2EVETB4Wx6wClQEs5d9Q4vDEL1jX6BvNecJCVDgB/BtbyAXK12WQ/NwRl1PvY5
         VwlsMPDQkXw3pVs2H3mtwh/BbUVYA61YRS987ig539cC5HMMs5pieNeOk1WMgaHcc7VY
         EQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105039; x=1782709839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HIbzdwTX8eOcdWh67AvLsLpbbq7zr3xsG9SGVvGjmo=;
        b=FdXoGoxDsBewXf1KLH6noU7jyzvdhbxOVJRbiw4tPhmSrRtobG87qfAZ/bre3RP8dv
         dzWPkth3jiKCwqWiZaKCMl/tU2F7/BlqEfPySQQKkON9hsmp/nJLWws8w87dgK7aKzl3
         r1I1PkjdUcG5GVLOTpsi5qIql6SPxD9oUahsGSucCmXRUHn0J3uqFhaVAPbGwqJDmWcO
         ng78mhn/Owdh3EDcNaqDMqOPaYYNEjHb9TE2PRaxoPVSTaQAjDRXl9r/Nmgk/YNM+fEf
         z0peXyGanKMYY0PObua2h5ExBZRMQKFCJ36BNnf66mBq0L3NYkGIr33tEsnMBXisrrRc
         0cbg==
X-Forwarded-Encrypted: i=1; AFNElJ+VRPPvD/hqZREpezxgEtDJ180EbOU0FkOYHi2jRG6ZCiM0qPWO6DA/ekQ8WY5BXicKWxj8vpt2NqiZ6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpy+ZrgOsmVI/TwwWnnfSKtUvB/rn+h+ph4dXP4UFWL14x4VO/
	s+/aAWrj4W4n/hOSD6hkpIM4TSB7c5qwXDSkRT1duVgACPh3/qHc4ZCt
X-Gm-Gg: AfdE7cmGHQwkAVwNl5RCLui9RMFhfk1hrwQI6vXKVxZPg+BU8WwUgd97GdGHRMkRWOU
	oueyGxR0FDccVACQ9xrhlf3OuUjHtgC+LBuLRbWpRlx0ABxnrSLne50fpjbMhkh7rXNe8jHxxk4
	bMEifyzF58kfFIw+qbTSP7rH6w+GAOKEekT7foVEMsngxqlXt3dp3sHkpO/vudx3GsLKHXhyWyb
	xEfhT3nXCxFhXKrwMCnLM/pidJjB3vSgTSmqadY0+izagg6w5WrteW62jP1vISklgqKvt/Tze1l
	4GXrr2Y4/dD9AwsgCSelVOX6sOogT+4xrIPAo38cNtRsg5IXYTvxd8Ga36nEp1t8U1BzcJAwjIQ
	PiNL/kRlD98KAhMuTTJXPkiRpmwpPYLFhu5ph8FsXO+JQi83NT782dZ0f66TYaoysV5lzFLtMUB
	0e
X-Received: by 2002:a05:7022:79f:b0:137:f532:e342 with SMTP id a92af1059eb24-139ad677829mr5413653c88.7.1782105039206;
        Sun, 21 Jun 2026 22:10:39 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm6535293c88.14.2026.06.21.22.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:10:38 -0700 (PDT)
Date: Sun, 21 Jun 2026 22:10:36 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/6] riscv: remove unreachable invalid range check in
 create_linear_mapping_page_table()
Message-ID: <ajjDzE8WCzKI_w39@blinky>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
 <20260621145919.1453-4-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260621145919.1453-4-ekffu200098@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_221040_931319_C1A4089A 
X-CRM114-Status: GOOD (  16.17  )
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

On Sun, Jun 21, 2026 at 11:59:13PM +0900, Sang-Heon Jeon wrote:
> create_linear_mapping_page_table() iterates memblock regions with
> for_each_mem_range() and breaks the loop when start >= end.
> for_each_mem_range() never returns an invalid range, so start < end always.
> 
> Therefore the start >= end check is unreachable, so remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> ---
>  arch/riscv/mm/init.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5b1b3c88b4d1..eb93c2ac05a6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1229,8 +1229,6 @@ static void __init create_linear_mapping_page_table(void)
>  
>  	/* Map all memory banks in the linear mapping */
>  	for_each_mem_range(i, &start, &end) {
> -		if (start >= end)
> -			break;
>  		if (start <= __pa(PAGE_OFFSET) &&
>  		    __pa(PAGE_OFFSET) < end)
>  			start = __pa(PAGE_OFFSET);
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
