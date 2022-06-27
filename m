Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD01C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTQgB9BtMK7oOWA1JqvDk3EwgcjLUgvO2lNI+KLLmzo=; b=G8zmou2Ra8lmQp
	RDxSzE9NxwRMVg5n2rvAhwFjgncZQsZuJummnnKsr8QWn9LkDhCui+oq5qyOmsvOV9hcHP+Eunc2W
	C4EcOAd4LSRtyyLIInX3YhKI8xX/rl7G1borxNVROUTwsrSuXVL3OLFqbtj30CipB9ljdaEHmUadJ
	t9+UuQyh9wZOOT0PQzO1ZNOZkXSGM6pxNHxqzueeRBGe769E4mzdIcOPQjTeTvDQq6SDkmxHVUSX5
	+in9Wa3RxicD35bVHH2yZJkOyPGtcx80ewFVrCCpHjJmYcjNxc4Tg7NQaNrT/1cWHw0Y63iZA5NGW
	ZPlEPW5z1a+kOK/wyxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p0D-001CHu-6K; Mon, 27 Jun 2022 13:42:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p02-001CEn-5q; Mon, 27 Jun 2022 13:41:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28E471758;
	Mon, 27 Jun 2022 06:41:57 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AB623F5A1;
	Mon, 27 Jun 2022 06:41:56 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:41:54 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 01/20] ACPI: PPTT: Use table offset as fw_token
 instead of virtual address
Message-ID: <Yrmzkwur1NVQ8NSA@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-2-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-2-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_064158_318596_D0B6450A 
X-CRM114-Status: GOOD (  27.90  )
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

Hi Sudeep,

On Tuesday 21 Jun 2022 at 20:20:15 (+0100), Sudeep Holla wrote:
> There is need to use the cache sharing information quite early during
> the boot before the secondary cores are up and running. The permanent
> memory map for all the ACPI tables(via acpi_permanent_mmap) is turned
> on in acpi_early_init() which is quite late for the above requirement.
> 
> As a result there is possibility that the ACPI PPTT gets mapped to
> different virtual addresses. In such scenarios, using virtual address as
> fw_token before the acpi_permanent_mmap is enabled results in different
> fw_token for the same cache entity and hence wrong cache sharing
> information will be deduced based on the same.
> 
> Instead of using virtual address, just use the table offset as the
> unique firmware token for the caches. The same offset is used as
> ACPI identifiers if the firmware has not set a valid one for other
> entries in the ACPI PPTT.
> 
> Cc: linux-acpi@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/pptt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Hi Rafael,
> 
> If you are happy with this change, can you provide Ack, so that it can be
> merged together with other changes ?
> 
> Regards,
> Sudeep
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 701f61c01359..763f021d45e6 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -437,7 +437,8 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>  		pr_debug("found = %p %p\n", found_cache, cpu_node);
>  		if (found_cache)
>  			update_cache_properties(this_leaf, found_cache,
> -			                        cpu_node, table->revision);
> +						ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
> +						table->revision);
>  
>  		index++;
>  	}
> -- 
> 2.36.1
> 

I've run the set on Kunpeng920 where Dietmar noticed an issue [1] before
and it looks good to me.

Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>

[1]
https://lore.kernel.org/lkml/0bf199a0-251d-323c-974a-bfd4e26f4cce@arm.com/

Thanks,
Ionela.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
