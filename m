Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA18C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 18:27:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5C8207D0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 18:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yUluIQ4M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="wgV+HQ8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5C8207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=y/6VooW1gCqF5E9jR8im1PDdkDCbaKB0591dW0INz/U=; b=yUluIQ4MQTiQ8KnYfbO3ZUIgU
	XzbVbF4bsYEc2qC/FTtnx8VxKa1V+gKuRVp5O+KzKxiygPdfTctI+8RUzGV3EZDG4B0d428/LgRWb
	DEsAmE/Y1CJNbL35jMMqqigCaJ9CaoMhQwvcynIsPxVfHyLPR+1mE2mnHnGTg2aRMCXyoMLj2vnve
	MDEtNykDwm5rN/rJ8eM/wqv2gIWn3vLU5DuVoxAxUFlO00iV3FvgWawBYc5bIHaZ7zejyw88iMu3/
	dZzKgo28yolccKFhNR+tenAxkyIaadjiYWuOjo+ynocq6P21LNWQ5XSeNaJyPTLunRvhLD24OjmtE
	mDzGRrEAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtbGW-0001ue-WF; Thu, 09 Jul 2020 18:27:25 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtbGU-0001u7-58
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 18:27:23 +0000
Received: by mail-pl1-x642.google.com with SMTP id b9so1166111plx.6
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CX4+62PhknVXUdLMwiSWKRCmW3vKZehIunEgFfO23pk=;
 b=wgV+HQ8IzCZw4u85wSWv0uFcdU8JRUHxWUOJw3nUNCJg0V7JtiXq9HGIHvCJwy0rU4
 5NauoUVqQnXcquFoyXjiIj9oarJ08Xw96QE3ykDMiYPXQSta/D700HWhrKl5Vouwqfic
 sPIzjXuXy2OHVKPZDZuWVY/AAZvgf67cRjIIL5K3hAq5dYFywytI9E2HLRDqMatjSYHg
 rKPTbFroPXaZCtHfzKnC5s7krVrLd6GYXc9hQVoorI7+eqTmhCbzW5mX9WMNPAeI3E8T
 iWh2YarBX1GJP6kJlsBCn1uE476I6PduPB7TPOCtSmgDn2ifoOoUQ6DuhGG3dp14FZsE
 jHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CX4+62PhknVXUdLMwiSWKRCmW3vKZehIunEgFfO23pk=;
 b=EJGXIRRU+KAaOgRseQwgon0MXCi+OCMjDBaXju01mvzPk/Yy6QyJePan1hU11ByNUi
 ja+9Ds0erg6wl8YYCcfJUop2RM7f+kOeofZeilwlReVP4AdDjgBH7nsYCQGHOW9wMwVT
 cNZyoupAhgsCUsPsA8FlZDKobfe8KDtJERtJp77HibsX4McgqZwLtkTDDSYd9wGwb2uR
 KYyQeL1mSw3tWf3XN6anjhVkUtC5hH4qu87u/gtSSywpoS3qdfy8Gt9ZuIwhl1gh4HnV
 mdbLcJ2aDgSKLHCpjVNEyZ5CCFZyKCYbXrqaCzC3xPEG63SJRtlhUhh9d6WP3ci1uHnb
 x7Lg==
X-Gm-Message-State: AOAM532xS6ynIc3qO3BxuASioSYLK85+YOkJENc3nq8PbTwyHAXJ2noj
 SGZFTkO1NxA+N+LNUW2zcN5Sxw==
X-Google-Smtp-Source: ABdhPJzxG/jyzCXqn27lyEUywkbLI2zMYmWvsiVaPaozDnjrB06A0bRJUjVKi+RMxTl5smlkIHzqvA==
X-Received: by 2002:a17:90b:4ace:: with SMTP id
 mh14mr1423091pjb.139.1594319239021; 
 Thu, 09 Jul 2020 11:27:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s22sm3531604pfm.164.2020.07.09.11.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 11:27:18 -0700 (PDT)
Date: Thu, 09 Jul 2020 11:27:18 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 11:25:29 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Register System RAM as iomem resources
In-Reply-To: <063fab26f4c15bf5b833b57fa818749afa7811d4.1592292685.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-cd7e19bb-859a-45a4-90e8-7851c4fb3083@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_142722_351681_407B85AD 
X-CRM114-Status: GOOD (  20.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020 00:45:46 PDT (-0700), zong.li@sifive.com wrote:
> Add System RAM to /proc/iomem, various tools expect it such as kdump.
> It is also needed for page_is_ram API which checks the specified address
> whether registered as System RAM in iomem_resource list.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/mm/init.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f4adb3684f3d..bbe816e03b2f 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -517,6 +517,27 @@ void mark_rodata_ro(void)
>  }
>  #endif
>
> +void __init resource_init(void)
> +{
> +	struct memblock_region *region;
> +
> +	for_each_memblock(memory, region) {
> +		struct resource *res;
> +
> +		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes\n", __func__,
> +			      sizeof(struct resource));
> +
> +		res->name = "System RAM";
> +		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> +		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> +		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

Looks like everyone else is checking MEMBLOCK_NOMAP before registering memory
regions.  I've added that and put this on for-next.  Thanks!

commit 11dc632bf515874c84887727614e8044452f1f28
gpg: Signature made Thu 09 Jul 2020 11:24:08 AM PDT
gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
gpg:                issuer "palmer@dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmerdabbelt@google.com>" [ultimate]
Author: Zong Li <zong.li@sifive.com>
Date:   Tue Jun 16 15:45:46 2020 +0800

    riscv: Register System RAM as iomem resources
    
    Add System RAM to /proc/iomem, various tools expect it such as kdump.
    It is also needed for page_is_ram API which checks the specified address
    whether registered as System RAM in iomem_resource list.
    
    Signed-off-by: Zong Li <zong.li@sifive.com>
    [Palmer: check MEMBLOCK_NOMAP]
    Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684f3d..8b78fd23713e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -517,6 +517,32 @@ void mark_rodata_ro(void)
 }
 #endif
 
+void __init resource_init(void)
+{
+	struct memblock_region *region;
+
+	for_each_memblock(memory, region) {
+		struct resource *res;
+
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		if (memblock_is_nomap(region) {
+			res->name = "reserved";
+			res->flags = IORESOURCE_MEM;
+		} else {
+			res->name = "System RAM";
+			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+		}
+		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
+
+		request_resource(&iomem_resource, res);
+	}
+}
+
 void __init paging_init(void)
 {
 	setup_vm_final();
@@ -524,6 +550,7 @@ void __init paging_init(void)
 	sparse_init();
 	setup_zero_page();
 	zone_sizes_init();
+	resource_init();
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP


> +
> +		request_resource(&iomem_resource, res);
> +	}
> +}
> +
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
> @@ -524,6 +545,7 @@ void __init paging_init(void)
>  	sparse_init();
>  	setup_zero_page();
>  	zone_sizes_init();
> +	resource_init();
>  }
>
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
