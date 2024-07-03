Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15E9C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wosPSB04EglBwbztfKVzty3gY3ChAB+uDnUqhFtrAyo=; b=u5DGoqrcIzGOFy
	rSpUnlUKmStuzIAhxsNXcG4IJrVgtg70XZIh2D44qpy6kSeBo4fegvpt1UwE6nAeUtRzGlDVYL6eH
	9vLYF/UyRIeI0hB58DAa18AsEvzdel8fEfyyJn/LuT5QDRGmexcTwGrxJDvhS2agDmOjJP3I2GmoM
	4fwMLCoMo+263rzUjZfKkahp8md6wAujgLlJuIvu3hgYj3BDI3u8j3GnrSJBwHhHTLOH8zvAilo6g
	RQAEBJpIhX5zwx/ZH2HLZxX/0PnpYVZuZAjDQnj41hZQoFWAPK3SxZM9UllSTjTU4Sd840dS4BPcw
	UCD/gnFkX/xf2mOCen6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7fX-0000000BW5o-1RxS;
	Wed, 03 Jul 2024 21:37:39 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7fT-0000000BW3P-2zDc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 21:37:37 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6f8d0a00a35so5482531a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720042654; x=1720647454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJl5lbxOblXV+VY9eYdDhIzc4AxnB7Ej+x8YMqN+ZTk=;
        b=GQDPlf/vzrmJwifcC0+HLwbOQKKGHzX8S1mdzf/O+h8d8+/zXiNnZfQifwfheZYpdN
         /Q6P6jh9dyRxgECpC9ngBXKhLkRr3dSsSQDdnAVzde9GBvWfw6pMTfnLT++ON3BgoYgg
         m1iT9ZMmatZVi0OCXvei+9/Mgq+2ORMWUYzLGkYsRL7/9JjKvV6HQHUMDKQK/gC3qcqs
         gSrfC0aup6wZmyw1AyDiKEcs8oKZcwg9/gQFpl1nOIU3JAfMCi+xrfG/MSgQq3pGEjbr
         TxeG8sctYFjv4sEPkKrQhl/nYf49xSEXkQ77fJ0sAk8hINSZxbSLJlMVfeIEJC4B6s4I
         ERxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042654; x=1720647454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJl5lbxOblXV+VY9eYdDhIzc4AxnB7Ej+x8YMqN+ZTk=;
        b=okcxXGRr9bFZV2KxhzIfHiPkUGmIbdx4cW/IT1QNPAYmhAq/Z7+PPuMbHRfDske1IG
         MBn0VzIq1bzGGiexK43uZxO7HFQmbdQsHKEQ4QL1tGwxuUV9ZvFX3iJ9vKJcWYlNUOwB
         LZ5ldiU1paNszLmzmCHyEaJfYgvS799G9ll4sBpjaMjgvtEhXKtVKl8/fYHnHMPuNtkJ
         lM+PuFNN3BE1igcurHv5wa7vUWeR0eQN3Cbhm/vSzfIpjEF81AqD5YrSy8DvCbYzRfBG
         PV+qOskmmsSHTbR1fH9tMxOfabB4jtVg9WoW6PjXYbuv3Pd+3Nyppwtg4Jzd1kdNgsSR
         NxZw==
X-Forwarded-Encrypted: i=1; AJvYcCX/nmu03639bg8Mxv07KTKGVkQrpXvQr7I28TfY/1hbotlc+Z4EPtOwTxgHxIHAIemQOK7Z8JWyAahGmU5UolRjJwSbo8S9QT0B4Gxdn5S0
X-Gm-Message-State: AOJu0YyWms5oDBdFoGsPUIQ2S13zcAOxm4gVX6/0TysBhXVZLCid3qbP
	eAMA1e6HXo/66ZWPQzorGDmopNSN0ZR8imdWotsRyf2BZ6hIpJFAmW5wP23qbN8=
X-Google-Smtp-Source: AGHT+IEeWsp99UN1m39sv7cNO+ei78yo6Zs/uUaB9KxR7A/1pZfRAcG15szQcDfzaxshAXC9DRQK3Q==
X-Received: by 2002:a05:6870:168e:b0:25e:1711:90e3 with SMTP id 586e51a60fabf-25e17119566mr1870117fac.2.1720042653830;
        Wed, 03 Jul 2024 14:37:33 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205a180sm11253906b3a.18.2024.07.03.14.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:37:33 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:37:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rppt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
	akpm@linux-foundation.org, bhe@redhat.com, dawei.li@shingroup.cn,
	jszhang@kernel.org, namcao@linutronix.de, chenjiahao16@huawei.com,
	bjorn@rivosinc.com, vishal.moola@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: cmdline: Add support for 'memmap' parameter
Message-ID: <ZoXEmryf8RuLMZWN@ghost>
References: <20240624123739.43604-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624123739.43604-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_143735_773429_E07A0133 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon, Jun 24, 2024 at 08:37:39PM +0800, Yunhui Cui wrote:
> Add parsing of 'memmap' to use or reserve a specific region of memory.
> 
> Implement the following memmap variants:
> - memmap=nn[KMG]@ss[KMG]: force usage of a specific region of memory;
> - memmap=nn[KMG]$ss[KMG]: mark specified memory as reserved;
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/mm/init.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e3405e4b99af..8e1d93ae5cb2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -208,6 +208,52 @@ static int __init early_mem(char *p)
>  }
>  early_param("mem", early_mem);
>  
> +static void __init parse_memmap_one(char *p)
> +{
> +	char *oldp;
> +	unsigned long start_at, mem_size;
> +
> +	if (!p)
> +		return;
> +
> +	oldp = p;
> +	mem_size = memparse(p, &p);
> +	if (p == oldp)
> +		return;
> +
> +	switch (*p) {
> +	case '@':
> +		start_at = memparse(p + 1, &p);
> +		memblock_add(start_at, mem_size);
> +		break;
> +
> +	case '$':
> +		start_at = memparse(p + 1, &p);
> +		memblock_reserve(start_at, mem_size);
> +		break;
> +
> +	default:
> +		pr_warn("Unrecognized memmap syntax: %s\n", p);
> +		break;
> +	}
> +}
> +
> +static int __init parse_memmap_opt(char *str)
> +{
> +	while (str) {
> +		char *k = strchr(str, ',');
> +
> +		if (k)
> +			*k++ = 0;
> +
> +		parse_memmap_one(str);
> +		str = k;
> +	}
> +
> +	return 0;
> +}
> +early_param("memmap", parse_memmap_opt);
> +
>  static void __init setup_bootmem(void)
>  {
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
> -- 
> 2.20.1
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
