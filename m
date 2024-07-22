Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD39C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rId2O1DLGriENAPe0MA6ne+gQSENVBnrlUi2Fn5yo/A=; b=4Sn+gNdsj9iOr3
	ZxF/+/tR+2cHtUw31FOw9PGyxEyWjUiNXr9yJcImu3uz/F0MQOqJoK1h4ioBY+tZskio2P8Uk8D5g
	H2Ug0kDfAgHNYy0hfRARYcTJVeBqaijmKYz0PMEjiEQPwSGFZSwPpcXr6ceivDSt9z0436sVi2lPg
	3CiGUVWynNoNj+J1F8nEksyW8WOzUaPcGmkoRxyoIwmRYBJzHaoOVpvqQwKrQxhDNnzlxDZvZjhIN
	uFXNXWqAsugFxZM/4Hy6kqlFfXQZH2ASv459DvCEJETh8anxNwk/FSxSAFMck60tYLuozvt8LMGy0
	P+uDfUXJbPPdqyKT2FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0LP-0000000AaLM-3guz;
	Mon, 22 Jul 2024 21:13:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0LN-0000000AaKp-27Ju
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:13:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso35690315e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721682796; x=1722287596; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhOAmQNOcZdVJ24vmwPqUlyqfZ/Rg7Wwwx4u5WC3mAw=;
        b=UJ3MKo/Vu8eWxeMjeW5IaOQSDSfCosgppAdoHlHbg+Ixw2vckFdmZTs377CGzSBb52
         53+OSda0JzxqqpCYZfLOkZUEDIfTDjEyuHgnlD2VMIIeAHYGBe6hzlQcQDaavf3riQPs
         u4a53BQovZIWvbSq3BZBT0yxH3Y2VK1RCOmlOrLEztFVQQ2pWbZht5kt8CfIu30eOnFd
         iz1bP3KPHuvLZsU7/A1W75X858MlMVkwv8nGJ1cghlIlN65+HtljPlPkTdrSLJ3UvlSk
         FY+1aZ4vzzW4FaZcTIabbcQVlJ5ehDTdIeD8SYhka8uDn4tvl2k7D4xvf2EZu/lATDCZ
         HCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682796; x=1722287596;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhOAmQNOcZdVJ24vmwPqUlyqfZ/Rg7Wwwx4u5WC3mAw=;
        b=Xy8duj88Y//XGI4OtBoLnDOR9VeAOFuxZR26qIRYiebIHBMd1HOCQJcXCHZWxd8J7R
         sk823mMfzp1dJVExboxAXb+ZkIPYiz44qv6J0DmQDLF463pu3/x7VDul9+DYUaFsBFtM
         h+LjtH6e5ZktWbAOAt+yxYkaj+uuvKGI0nEFS80HDkP7wItE0sFEgMkQAP/LBfpH6ksx
         ueQIVckktzjxq/KdBV4a19z1k2uWex7s6WruABNEKTQ5qb1ALLohQTE115skTPc8Igh7
         SYLcqcoJFzhL9Sf7xIbv4Pus+vSzfOBUHWd5qe54bLKSKhViO2L0vhI0pdWwwVhP4sE7
         b1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqWsQWRy0vz+/hhoDls/2RIR0B8a4fhEy4LU3QomPHCJbGa/p57nH4cyfSxVgXNXhTKXf/abH1drj2wcRQo+gJn1/Qa92NFToOQ/S6ORiT
X-Gm-Message-State: AOJu0YzqypHaBI31NF7irpQVzksln2izxrB70hAk6mZ7vReP6JtHUuRa
	xzpLqTRENpVW8w2gpu5zg8HYEFiU5WkDasz7qO5WAgs4SWe4wXD6sBgeLF4SaZg=
X-Google-Smtp-Source: AGHT+IHS8HIR5eie3M+WQ39jCYnVVianTH2P5I2F/G8SSGCO6r3WxUZcOqhXjjXhphzDDv3/4HJyiA==
X-Received: by 2002:a05:600c:35c8:b0:426:5416:67e0 with SMTP id 5b1f17b1804b1-427ed06816amr7022735e9.31.1721682795704;
        Mon, 22 Jul 2024 14:13:15 -0700 (PDT)
Received: from localhost ([149.71.24.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d69019a5sm141079465e9.18.2024.07.22.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:13:15 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: palmer@dabbelt.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, rppt@kernel.org,
	paul.walmsley@sifive.com,  aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,  akpm@linux-foundation.org,  bhe@redhat.com,
	dawei.li@shingroup.cn,  jszhang@kernel.org,  namcao@linutronix.de,
	chenjiahao16@huawei.com,  bjorn@rivosinc.com,
	vishal.moola@gmail.com,  linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2] RISC-V: cmdline: Add support for 'memmap' parameter
In-Reply-To: <ZoXEmryf8RuLMZWN@ghost> (Charlie Jenkins's message of "Wed, 3
	Jul 2024 14:37:30 -0700")
References: <20240624123739.43604-1-cuiyunhui@bytedance.com>
	<ZoXEmryf8RuLMZWN@ghost>
Date: Mon, 22 Jul 2024 22:13:14 +0100
Message-ID: <874j8hku51.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_141317_566546_246728F2 
X-CRM114-Status: GOOD (  17.69  )
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

Hi Palmer,

Charlie Jenkins <charlie@rivosinc.com> writes:

> On Mon, Jun 24, 2024 at 08:37:39PM +0800, Yunhui Cui wrote:
>> Add parsing of 'memmap' to use or reserve a specific region of memory.
>> 
>> Implement the following memmap variants:
>> - memmap=nn[KMG]@ss[KMG]: force usage of a specific region of memory;
>> - memmap=nn[KMG]$ss[KMG]: mark specified memory as reserved;
>> 
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> ---
>>  arch/riscv/mm/init.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>> 
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index e3405e4b99af..8e1d93ae5cb2 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -208,6 +208,52 @@ static int __init early_mem(char *p)
>>  }
>>  early_param("mem", early_mem);
>>  
>> +static void __init parse_memmap_one(char *p)
>> +{
>> +	char *oldp;
>> +	unsigned long start_at, mem_size;
>> +
>> +	if (!p)
>> +		return;
>> +
>> +	oldp = p;
>> +	mem_size = memparse(p, &p);
>> +	if (p == oldp)
>> +		return;
>> +
>> +	switch (*p) {
>> +	case '@':
>> +		start_at = memparse(p + 1, &p);
>> +		memblock_add(start_at, mem_size);
>> +		break;
>> +
>> +	case '$':
>> +		start_at = memparse(p + 1, &p);
>> +		memblock_reserve(start_at, mem_size);
>> +		break;
>> +
>> +	default:
>> +		pr_warn("Unrecognized memmap syntax: %s\n", p);
>> +		break;
>> +	}
>> +}
>> +
>> +static int __init parse_memmap_opt(char *str)
>> +{
>> +	while (str) {
>> +		char *k = strchr(str, ',');
>> +
>> +		if (k)
>> +			*k++ = 0;
>> +
>> +		parse_memmap_one(str);
>> +		str = k;
>> +	}
>> +
>> +	return 0;
>> +}
>> +early_param("memmap", parse_memmap_opt);
>> +
>>  static void __init setup_bootmem(void)
>>  {
>>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>> -- 
>> 2.20.1
>> 
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Another patch that looks good to get merged if there are no further
comments.

Any chance this can be picked up for this cycle?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
