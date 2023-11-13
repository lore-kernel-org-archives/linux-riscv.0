Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFC9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqkDVOxeTZmanqcPw5CCC9iY6223id9feVhWjPumlCc=; b=2Po0sI5nPrUNWE
	ynoohxoFcvwCXtJRVH5ULOOsFp8sAQ5NCHlUmVUkznAYSgmQ5/IG4xxz7QHuH+uTMw9Lu5A6Fy2IX
	+6V+zF34G0+Q1/so+QeF7VIWpbsLgCNK2p5cUF8wTXs1CdfdUriRBCyP/+SwXDXPlkIXoMbLsIDl5
	hit+RBLNddA6sEJ39u19y1WQyfwDt+m6F0duVQUo6Dh4BHJGiO6DZB3mBvqEzlNDM4LIt72GhlaS1
	+zhscBNkj0U9CgALEwxrJeftPADSO3f+4C0RaC50eeu/eEHzuMAUqjz+zjK3NmEzJsgYjpavaTW34
	02U8TQjdf+U5uBoLWzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OBr-00DBQp-2G;
	Mon, 13 Nov 2023 04:04:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OBp-00DBPf-0B
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tws2IAPG/pAuM74CEbXNr6MwlBLqAXS5OKA1cYLHSOM=;
	b=gKTgeOFNfraf444v85mYjNzi6usPb90nRId2v1OdGnZhfCmRiadIWTYlI894C7gqd0J1zS
	teEpXc0U8t5amj8Z/k5ED1COKpf/UFw+7+I9j35gz4SdxpR8hDfVTg8cvMkni7Api6Vypx
	UVSY5Mi6cdpeilcd54jQzw95nT6floc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-M7pk90WrPb6FaiNCaziiTw-1; Sun, 12 Nov 2023 23:04:42 -0500
X-MC-Unique: M7pk90WrPb6FaiNCaziiTw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cc70f8a58fso54444175ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848281; x=1700453081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tws2IAPG/pAuM74CEbXNr6MwlBLqAXS5OKA1cYLHSOM=;
        b=kt8fTAGCiYULK/E9K/XGWCiHL2FgJWLBTYxPAcknOmVpR69cJ40x4mRcOpCXWZMpLJ
         wh9kN6HQ95CuOt/P3kM8euf6R16mBZ69cQzY7K07Chzwnk34/nGMtk4F3gEUAFnUFBxG
         r+KFzogJPo7tDLSPt/wVS4Uocb3sQPM87rIkySch2bucHO++t/b/1+N2HU6P5zAnMwVs
         rwEPwhisB6EfIMi0yYjVue9g5le0a+1muChUpFOLrWTOmddAFZTqW9boT2ccRWsPPmlA
         FXUMmsMYqGs2BwOHn68w3i22g8BoF99o0qmh8nctP/oxh4W2W/bf444HbT64WSJOo5vL
         RScg==
X-Gm-Message-State: AOJu0YyYqhjVga97OT3IQROQoESZgfaCMvAulmOlnprivApLj54IieYe
	2mtZBcxFSqXAIVO3ON0t6QsiiQ3BO6MmZLo//BtU69hsZ4Zhf2rZ0lVkfCElQ/mXjGLFSEY2tbX
	ydeCHoNWOT44Cr2NtCsec2/MAYyuO
X-Received: by 2002:a17:902:c40d:b0:1b0:f8:9b2d with SMTP id k13-20020a170902c40d00b001b000f89b2dmr6899008plk.29.1699848281712;
        Sun, 12 Nov 2023 20:04:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYR2VwJDEptBEIbrqjgd8Zx/CSzLVMmBQUVzyl+4ab4Yq5iFKzjqaERsoMDmohw8xGXwqYvw==
X-Received: by 2002:a17:902:c40d:b0:1b0:f8:9b2d with SMTP id k13-20020a170902c40d00b001b000f89b2dmr6898988plk.29.1699848281368;
        Sun, 12 Nov 2023 20:04:41 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b001c61073b076sm3230467pli.144.2023.11.12.20.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:04:41 -0800 (PST)
Message-ID: <955f2b95-76e4-4e68-830b-e6dd9f122dc1@redhat.com>
Date: Mon, 13 Nov 2023 14:04:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/22] drivers: base: remove unnecessary call to
 register_cpu_under_node()
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
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLa-00CTxY-Uv@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLa-00CTxY-Uv@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_200445_166031_95CE7723 
X-CRM114-Status: GOOD (  17.12  )
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

On 11/7/23 20:30, Russell King (Oracle) wrote:
> Since "drivers: base: Move cpu_dev_init() after node_dev_init()", we
> can remove some redundant code.
> 
> node_dev_init() will walk through the nodes calling register_one_node()
> on each. This will trickle down to __register_one_node() which walks
> all present CPUs, calling register_cpu_under_node() on each.
> 
> register_cpu_under_node() will call get_cpu_device(cpu) for each, which
> will return NULL until the CPU is registered using register_cpu(). This
> now happens _after_ node_dev_init().
> 
> Therefore, calling register_cpu_under_node() from __register_one_node()
> becomes a no-op, and can be removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/node.c | 7 -------
>   1 file changed, 7 deletions(-)
> 

__register_one_node() can be called in memory hot add path either. In that path,
a new NUMA node can be presented and becomes online. Does this become a problem
after the logic of associating CPU with newly added NUMA node?

Thanks,
Gavin

> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 493d533f8375..4d5ac7cf8757 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -867,7 +867,6 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>   int __register_one_node(int nid)
>   {
>   	int error;
> -	int cpu;
>   
>   	node_devices[nid] = kzalloc(sizeof(struct node), GFP_KERNEL);
>   	if (!node_devices[nid])
> @@ -875,12 +874,6 @@ int __register_one_node(int nid)
>   
>   	error = register_node(node_devices[nid], nid);
>   
> -	/* link cpu under this node */
> -	for_each_present_cpu(cpu) {
> -		if (cpu_to_node(cpu) == nid)
> -			register_cpu_under_node(cpu, nid);
> -	}
> -
>   	INIT_LIST_HEAD(&node_devices[nid]->access_list);
>   	node_init_caches(nid);
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
