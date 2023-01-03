Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86A0C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7IlSn1PxDI/pQkucvLfLwNZT53XqI2Z4eK43htSpZA=; b=cQmF01vaEMhnC4
	nk8ieHWFcgO7mBAXmyIAR+I+I1G7212KtnjaQHzWyZacCoQGgaa8OxYsdwUrCoDEXJDzWVNHx/HCH
	C0rcF8YrJHWB3SFS5p9a/dLeUVLczR7WPlpdRITZcv/tK/SEn1g/1aqUyrdH9ZwQyfgqeeRlzmLhX
	Lwtiz8SxjNnXGrCWeJo+snakznIxc/qlpUtynC7mtScANbWe7ucE1ESv+9CvSWWNOlXY1L0xEfKQw
	VGHTO25441Ugm0Ggq1GMmXgZ2vRkYZXhhZn1oC1fAVTWsZTpLyTvrwbxwa2Msb7hzk9YN1N3k6aXd
	oHa6qPXPKzxVBLurF7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbDN-00HI7h-B1; Tue, 03 Jan 2023 06:56:01 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbBh-00HHGr-6l
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 06:54:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r26so37393192edc.5
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 22:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MYKrmSOx2pt3469lia8FKNW80E8qGEbATC3jLzux/4g=;
        b=SSxZ1bYYpZK8rXkVsCOw5nzTeGVkoJYmeKeFwWPJv3fj2uIFovL0NSLtWF2O+SJwsf
         8tF4sJXRBtbmNt67kAYtyXTuDXLLWoyOt4kbP7jxAgASa9srvQotdlRfrZWNm/6Q3DAU
         buNZZjGu+rTKqwebaXmiTOHafRcQ+OGK17esT1uFHKiWfgoO3fm6W5Kq8uGkLd9mOc7k
         JaBbKuVP4wO/R9tSGQ9WC+tL6TnSaEVUDF7zRJt06rLoGJWkdr47nesKxIqfA03L/GKf
         KKZFmPEv46EKWhkFyddQXxPjgYjQnOexVICxpzi2c+JvQlf6Jt7+m6nkLewV0L/DZWFp
         2Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYKrmSOx2pt3469lia8FKNW80E8qGEbATC3jLzux/4g=;
        b=AX5Cd/36+JHJtnx3peVi2cJBhg2cR31P/rJBZNjhOq6VBDXa4khzHNk5uNyhVYj+FX
         NLDtFC7+hsF4n9gM79biBrg4eZpXLt1rzHW66WPo62Tt8b5a+zd3x9paGPG9gDQK+sFD
         kyUa1hjlLvo1jIaWOMOXBIRN4POj9lVjHKh6gsAptTv5bvL2nvvmg+TAIFfIEzrCYnNH
         UPV6jK8m+sRQCpda1XJzv7ALNP8GmOhgyalWLro8xggg0F6o5IOMl35lmaKTWm8d6VRF
         s4BSkP1We61eXBzJL1jQkY9t3BSOiAYVfkLLK0FaYEeWWXSZG7sZeZYTFl5/mjpb3rc1
         hMbw==
X-Gm-Message-State: AFqh2kpJwZH6pezM9MFLEQb6yVQfhL9/XmCb6Z4GowsY/ktN5yE8vusb
	YNovYbTHhcGU9G1Ub96Jltl69A==
X-Google-Smtp-Source: AMrXdXu92FyFlIGfkykwuOeY3JtGSV7RcNkNZqccocQOHoSdmZ08R39/NWRxZWCQMrXbRGmsKqmQjA==
X-Received: by 2002:a05:6402:22ad:b0:488:6003:24b6 with SMTP id cx13-20020a05640222ad00b00488600324b6mr8981767edb.40.1672728852621;
        Mon, 02 Jan 2023 22:54:12 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id cf30-20020a0564020b9e00b0048db3e85cdcsm2400559edb.85.2023.01.02.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 22:54:12 -0800 (PST)
Date: Tue, 3 Jan 2023 07:54:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <20230103065411.2l7k6r57v4phrnos@orel>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_225417_327041_12211F52 
X-CRM114-Status: GOOD (  18.50  )
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

On Tue, Jan 03, 2023 at 11:53:16AM +0800, Ley Foon Tan wrote:
> topology_parse_cpu_capacity() is failed to allocate memory with kcalloc()
> after read "capacity-dmips-mhz" DT parameter in CPU DT nodes. This
> topology_parse_cpu_capacity() is called from init_cpu_topology(), move
> call to init_cpu_topology() to later initialization  stage (after memory
> allocation is available).
> 
> Note, this refers to ARM64 implementation, call init_cpu_topology() in
> smp_prepare_cpus().
> 
> Tested on Qemu platform.

Hi Ley,

Can you provide the topologies (command lines) tested?

> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Fixes tag?

> 
> ---
> 
> In drivers/base/arch_topology.c: topology_parse_cpu_capacity():
> 
> 	ret = of_property_read_u32(cpu_node, "capacity-dmips-mhz",
> 				   &cpu_capacity);
> 	if (!ret) {
> 		if (!raw_capacity) {
> 			raw_capacity = kcalloc(num_possible_cpus(),
> 					       sizeof(*raw_capacity),
> 					       GFP_KERNEL);
> 			if (!raw_capacity) {
> 				cap_parsing_failed = true;
> 				return false;
> 			}
> ---
>  arch/riscv/kernel/smpboot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 3373df413c88..ddb2afba6d25 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
>  
>  void __init smp_prepare_boot_cpu(void)
>  {
> -	init_cpu_topology();
>  }
>  
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> @@ -48,6 +47,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	int ret;
>  	unsigned int curr_cpuid;
>  
> +	init_cpu_topology();
> +
>  	curr_cpuid = smp_processor_id();
>  	store_cpu_topology(curr_cpuid);
>  	numa_store_cpu_info(curr_cpuid);
> -- 
> 2.25.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
