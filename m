Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bQsxpeHSRzKbZkUtZL43kG5Htwsg7p7ILP2acJ1Ksc=; b=KnhopcFPBXP/U8
	jl6jboLzzPJ7hYoiqFPQNpY4bxwelM/EQgqCQCgcuE31vsNpzbysVizvvtD874Z8z18TNQ1tzTr6/
	djLkWilAzYSwKllQHVKGMUCNTduojERd8RqhS5BOKI5hqZ7z4nrl2oYW8SJ9CAaYwUGGLkKDloA74
	+zxbfMg1M5PpDesvs0dsyQWX0hrKAO0orW4XGipjl+4Y/yMvE21ZRlhztf8+MF0CAaCROdhpPex1z
	1hO659umhzpuQB4Mobj7uG4+IfPv/nGHw5eDY2Tzd1O8ZOTC44fbp+CeD7MVs5IS1XGhR7g9XNqTp
	QXxVhZlVS0OdKatiBTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12dk-005zaI-2a;
	Thu, 09 Nov 2023 10:52:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12di-005zZK-00
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699527116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzXmFfn5zVQ8O2djRIzf4P/RBzxnLFE/MCnf13XN7x8=;
	b=Ll+KUZks3hgjjDp132Yby2TwFEYUMTq6HTRMA1mQe6tALBR8Uo/N53v78ZRMp1zQbF6UVi
	MbIxx3x8kbU6QL25kB75iimtz0/9W+KNvqKp1/VxIX9mt0VU6ZlJzdJBAHE9uRW8dmabd3
	6vdw3ow2OtbakDIYWq90bUhMmDi+RXo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-W2B-UnVXOt6rvCxsZRSz4A-1; Thu, 09 Nov 2023 05:51:53 -0500
X-MC-Unique: W2B-UnVXOt6rvCxsZRSz4A-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc34cb3b16so1109585ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699527112; x=1700131912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzXmFfn5zVQ8O2djRIzf4P/RBzxnLFE/MCnf13XN7x8=;
        b=jEAA0n1vnOgH8wDWnghS5xbCKhf1wFTtc6h6QB6x/xW8mJdvJZDWsCc9R0/HaEFZsA
         pZeM63v8Ri/Jqc+WaHGp+A6vvjdwC2jG7BvJnTF+Ye4id5aI6GdPn7ZyNuWPjxouW+R2
         Vkjp0Qckms6h/+xwfOVowx6Q+4S8E71+ir+6R9YFhUyc5JUsBr0fGFgpfoODPjl+VVZ7
         RdlKsqgrDKKO5w8JBNJkg5kHGUMrLDUlnUP56EvXWJP2N5JqOoDMquN8ax5bcenz4wBt
         ZHvGxC+VBuuhsU44zc8s0gPS+RKJq3cwEmx/jaAmOPv9rp8nrMWWdQXTFQKnPWZuj2OH
         f9ug==
X-Gm-Message-State: AOJu0Yw9yfhNvflN8WXu4G93zUTRECU0Qj+SZT38K1xY9OvwZM98vUoy
	GjQURAW2seB1sAnuizNTprIW0fUv1Le8XUVu/TKiygSADdQxbwb3xFD4o6UhJ062bxcqNfKCrfH
	wsMPKv5MOTNIdmIvb+5GykKOlVy0S
X-Received: by 2002:a17:902:e5c7:b0:1cc:27fa:1fb7 with SMTP id u7-20020a170902e5c700b001cc27fa1fb7mr4861889plf.5.1699527112451;
        Thu, 09 Nov 2023 02:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiDKE4c0Ju3XEU4qcUzBfLHE4odbtCyEmKR/OFqWPBbcxkvIL/TmgSbJ2a8W59JHM952t4Zg==
X-Received: by 2002:a17:902:e5c7:b0:1cc:27fa:1fb7 with SMTP id u7-20020a170902e5c700b001cc27fa1fb7mr4861848plf.5.1699527112117;
        Thu, 09 Nov 2023 02:51:52 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001b86dd825e7sm3245836plb.108.2023.11.09.02.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:51:51 -0800 (PST)
Message-ID: <17dd2b32-079a-101e-e5c1-0166d6dea3b9@redhat.com>
Date: Thu, 9 Nov 2023 18:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 08/22] drivers: base: Implement weak
 arch_unregister_cpu()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_025158_152653_885458B9 
X-CRM114-Status: GOOD (  17.42  )
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



On 11/7/23 18:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 579064fda97b..58bb86091b34 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -531,7 +531,14 @@ int __weak arch_register_cpu(int cpu)
>   {
>   	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
>   }
> -#endif
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +void __weak arch_unregister_cpu(int num)
> +{
> +	unregister_cpu(&per_cpu(cpu_devices, num));
> +}
> +#endif /* CONFIG_HOTPLUG_CPU */
> +#endif /* CONFIG_GENERIC_CPU_DEVICES */
>   
>   static void __init cpu_dev_register_generic(void)
>   {

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
