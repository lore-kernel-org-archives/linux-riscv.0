Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB50C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 06:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOh6TCUXv8/lYnfngmEUvYo4JwZKDYLNOY9wzNIYOUk=; b=PvE69XDgXujPTU
	Lh28AkqNVm8qdLQ8NEN0d7omlalvO0zaZ7O2IRvYl9XqCTWqt//lpkzUpEw30++t4ca2XJUCyCeXe
	0hvMJT0biVbE4zdeRuvoW/WoE5uULrk/1SVhgkDblIWhn83YI/YtTMXzMNb+uyks1k8NN63hgar0z
	LbSF223LPR8Yuq6JiAMp42BgKqcTuBTUjvrV4YZ9/JLXFJkrhGmQrThZOmMwS7mexOKGOapUSg3GR
	xPmGG6FhAUYWxmZVgzXPVMiRaYb0fK851f4RQ3n036JaINybwfuFNfgq0T4dPphF97pIAy+NPmmfr
	p65tR12e3darG7KYSFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweXv-001nLi-U6; Thu, 02 Jun 2022 06:43:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweXt-001nJm-D2
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 06:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654152180;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsd0rEL421smM5kXILQFm1d6e8rO04GSNAHeoKg8KqM=;
	b=M5R9BIzesHelirJFvEsSGbF26+icaNlu2apqGDa+sTIx+25DquusWeliaSLGdk3gLwu6TC
	dyHqbTFRXeKiRCpTb3gqIY4+Oo//dkBRvJgFukZwv/y9YStIcn+XQDbOKTWGV+FAibhsQw
	iZY58h31/0Ri9zWl7h0+HhN616x1CP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-Ko-f9xzWNhmZ6rRWwFv-Og-1; Thu, 02 Jun 2022 02:42:59 -0400
X-MC-Unique: Ko-f9xzWNhmZ6rRWwFv-Og-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84DDA101A56C;
	Thu,  2 Jun 2022 06:42:58 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EFF52166B26;
	Thu,  2 Jun 2022 06:42:53 +0000 (UTC)
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
Message-ID: <a8cd3ce8-64a7-e97d-0dba-71e910296258@redhat.com>
Date: Thu, 2 Jun 2022 14:42:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-10-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_234301_582677_B62A0FE6 
X-CRM114-Status: GOOD (  18.88  )
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

Reviewed-by: Gavin Shan <gshan@redhat.com>

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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
