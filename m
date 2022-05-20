Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6CFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD3gjiBVvADd+S2R+1eZYJhGXkjTO7//5BbeDXHPYx8=; b=3zwVQk4U0P/OW0
	t5RFZzb4SpyoHsD3plVakldBGFt3s01Lj9zt6IQGBIhRRqQbYWjFM+Sl5h/9IFif3j3NpfeBGRYEG
	j8+ifF+dN1RNgfX5T1DWrQOGcrfUqpgYp9azLVAQNXY4eHq+pQRK6AiKNdtESVf5p/UjrJZssvOhO
	OYtLkCLCdTkuDKQNpLiWan/PS98fSfTNIj3YH+Z15j+z/gc+DpZdDA1iLFAnK63JcBE0S3UI3xFuc
	M6Lf8F0ykgKl69DK2fRmxHTikEXZtFFTwoJaS9rI+m6L789fGmc4ZRa9wGqp0Selg61ej/ds6yKWR
	87AJPc27yb9zpF0HS+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1pm-00CM5U-1n; Fri, 20 May 2022 12:34:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1pT-00CLwa-Gg; Fri, 20 May 2022 12:34:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FF431477;
 Fri, 20 May 2022 05:34:02 -0700 (PDT)
Received: from [172.29.1.145] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDF0A3F718;
 Fri, 20 May 2022 05:33:59 -0700 (PDT)
Message-ID: <087176fc-1018-b107-06cc-055d7926b500@arm.com>
Date: Fri, 20 May 2022 14:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 8/8] arch_topology: Add support to build llc_sibling on
 DT platforms
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>, 
 linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-9-sudeep.holla@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220518093325.2070336-9-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_053403_629944_FFD4F35B 
X-CRM114-Status: GOOD (  16.06  )
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

On 18/05/2022 11:33, Sudeep Holla wrote:
> ACPI PPTT provides cache identifiers and especially the last level cache
> identifier is used in obtaining last level cache siblings amongst CPUs.
> 
> While we have the cpu map representing all the CPUs sharing last level
> cache in the cacheinfo driver, it is populated quite late in the boot
> while the information is needed to build scheduler domains quite early.
> 
> On DT platforms we can use the pointer to the last level cache as the
> firmware identifier for the last level cache and build the cpumap sharing
> the last level cache based on the same.

[...]

> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index 58cbe18d825c..d8a36b0e27c9 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -69,6 +69,7 @@ struct cpu_topology {
>  	int cluster_id;
>  	int package_id;
>  	int llc_id;
> +	void *llc_fw_node;

Would be nicer if you could set llc_id directly to avoid all this
addition sync `llc_id and llc_fw_node` code. ACPI PPTT has this
ACPI_PTR_DIFF() macro which IMHO lets it create distinct ids.

>  	cpumask_t thread_sibling;
>  	cpumask_t core_sibling;
>  	cpumask_t cluster_sibling;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
