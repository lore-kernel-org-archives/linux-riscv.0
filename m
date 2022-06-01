Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F84EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92SQiaPtSjKCODLygy4v/fP2kdioyWnAacUBn6xQDrE=; b=20VSCg3R8r3jM5
	JOxEvKikyip/Wj0PcVszlWTf/P/xS/RT5H8vKIB9apJUqVGgo7Di/rYd/Ciu/BRT/mm/G6Onrt/aN
	9zW3M+0uZpqty+NfAWlzar9ZbvwAsgjkWsPrZlpvpQfXZsGQdXzSGFR/uCBxAQUlq7xclPSOPGYqW
	FMVKccTddpgA2fVkt92w4D6hT3E0MEsJGZKkbLZUHyegJj0nZ4LikKXKJRYYOoWpXnBGBZCi/vSPD
	wibX9I/4hl6I88mBU9fMWd04hSFrPgQqJf3jQN6Bbd9TXYcd+8A3fNMd/GFa2OoDDNJ1HRWLF3cPu
	CZHG/IGBlxDjh1h0qPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF97-00Dfd3-57; Wed, 01 Jun 2022 03:35:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF8w-00DfbJ-Ub
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054534;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh0g9dEVsbyR/6sqN8ICEDn4s73VBSYVoAwroIoGnZU=;
	b=azxzaRA4lrt2t+1SrOOe72Kj9cVVpuP+ihXDxUXwgGmrci2eUNOwuit6G0gjhHc+zgNn2G
	y/IJzEv6cnoMxj0Pyc2gQW64IlZgf96Rci3ITzHeU2vqBzfMx2FvqnVurpLlBh9A4+NY5P
	CF735XhVnJ7PWelcYQZ+nmlummZlNVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-k-s4QdumPBegUQDSGqvETg-1; Tue, 31 May 2022 23:35:30 -0400
X-MC-Unique: k-s4QdumPBegUQDSGqvETg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC0B029AB414;
	Wed,  1 Jun 2022 03:35:29 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59CF5492C3B;
	Wed,  1 Jun 2022 03:35:23 +0000 (UTC)
Subject: Re: [PATCH v3 09/16] arch_topology: Drop LLC identifier stash from
 the CPU topology
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <20220525081416.3306043-9-sudeep.holla@arm.com>
 <20220525081416.3306043-10-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3860bfcc-a323-c031-0fdd-77001d338bec@redhat.com>
Date: Wed, 1 Jun 2022 11:35:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-10-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203535_084866_4C74FA7E 
X-CRM114-Status: GOOD (  20.61  )
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
Reply-To: Gavin Shan <gshan@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sudeep,

On 5/25/22 4:14 PM, Sudeep Holla wrote:
> Since the cacheinfo LLC information is used directly in arch_topology,
> there is no need to parse and store the LLC ID information only for
> ACPI systems in the CPU topology.
> 
> Remove the redundant LLC ID from the generic CPU arch_topology information.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c  | 1 -
>   include/linux/arch_topology.h | 1 -
>   2 files changed, 2 deletions(-)
> 

How about merge the changes to PATCH[08/16]? I don't see why we need put
the changes into separate patches.

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 4c486e4e6f2f..76c702c217c5 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -747,7 +747,6 @@ void __init reset_cpu_topology(void)
>   		cpu_topo->core_id = -1;
>   		cpu_topo->cluster_id = -1;
>   		cpu_topo->package_id = -1;
> -		cpu_topo->llc_id = -1;
>   
>   		clear_cpu_topology(cpu);
>   	}
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index 58cbe18d825c..a07b510e7dc5 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -68,7 +68,6 @@ struct cpu_topology {
>   	int core_id;
>   	int cluster_id;
>   	int package_id;
> -	int llc_id;
>   	cpumask_t thread_sibling;
>   	cpumask_t core_sibling;
>   	cpumask_t cluster_sibling;
> 

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
