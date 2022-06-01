Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C696C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 02:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7PibeDbGc2SeMFfC0B6kmc5DMlCfNUbro5zN8sOUPA=; b=ey83JGay80kc99
	D6AJa61S9QvBd5nkpkU0fQmd5Q5p9+5k4Kh1Ao97R22nzGFjCLyXOrzzHyMFYqfViNd9Ag8ua4wfm
	RLA9WYACde03vBJhDZk5kb4njAXujzMu6boSMAAXvVBKyrSVBG/Ov+xxornWMRBENAcvRLsCDZ42J
	ozwIUroIrl4qbT6f5tHIRtlc/0aY2L1MaZTBjw2N1wNvND65J7bUr4mzCGizf7E3k4FmH1M0OIstv
	eBFvs2jFWiVzWmrIEI7s3DNcy8CGygWDPVseksIjIs/x3yIKA7b+1L3+Z2dzDkdyXMTADJ2xu+jLK
	K5XwMTG3RISA04ju/N2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEML-00DU0a-Hp; Wed, 01 Jun 2022 02:45:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwEMI-00DTyz-Er
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 02:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654051517;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwDnrFd7uXmUoAYEBuzB/Z1dpZnq4v5IwtowuAg3PDA=;
	b=ahnigfSLtWgG0XgfHIOoahGDJbNVuNim3KnMhgBqdIUu63jDSi8wKQngMeRZxpVVKNy3Se
	FYaQ14xjljuCgNJV/rcQ5lcAJzR3PHD/0d4deTZv90l7qGfbCIlEg6v+paKaJYir9PsyHW
	WwR82kW4t2NhQLkD9AnInfP9h9EWetM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-djZtqZtiOnW-x7e8J32zNQ-1; Tue, 31 May 2022 22:45:13 -0400
X-MC-Unique: djZtqZtiOnW-x7e8J32zNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A45E811E7A;
	Wed,  1 Jun 2022 02:45:09 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F96C15E72;
	Wed,  1 Jun 2022 02:45:03 +0000 (UTC)
Subject: Re: [PATCH v3 01/16] cacheinfo: Use of_cpu_device_node_get instead
 cpu_dev->of_node
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <42bb2efe-e28c-fd15-d00e-8f45dc24b0d1@redhat.com>
Date: Wed, 1 Jun 2022 10:45:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-2-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_194518_667657_4C3C6F6A 
X-CRM114-Status: GOOD (  25.38  )
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
> The of_cpu_device_node_get takes care of fetching the CPU'd device node
> either from cached cpu_dev->of_node if cpu_dev is initialised or uses
> of_get_cpu_node to parse and fetch node if cpu_dev isn't available yet.
> 
> Just use of_cpu_device_node_get instead of getting the cpu device first
> and then using cpu_dev->of_node for two reasons:
> 1. There is no other use of cpu_dev and can be simplified
> 2. It enabled the use detect_cache_attributes and hence cache_setup_of_node
>     much earlier before the CPUs are registered as devices.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/cacheinfo.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index dad296229161..b0bde272e2ae 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -14,7 +14,7 @@
>   #include <linux/cpu.h>
>   #include <linux/device.h>
>   #include <linux/init.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/sched.h>
>   #include <linux/slab.h>
>   #include <linux/smp.h>
> @@ -157,7 +157,6 @@ static int cache_setup_of_node(unsigned int cpu)
>   {
>   	struct device_node *np;
>   	struct cacheinfo *this_leaf;
> -	struct device *cpu_dev = get_cpu_device(cpu);
>   	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>   	unsigned int index = 0;
>   
> @@ -166,11 +165,7 @@ static int cache_setup_of_node(unsigned int cpu)
>   		return 0;
>   	}
>   
> -	if (!cpu_dev) {
> -		pr_err("No cpu device for CPU %d\n", cpu);
> -		return -ENODEV;
> -	}
> -	np = cpu_dev->of_node;
> +	np = of_cpu_device_node_get(cpu);
>   	if (!np) {
>   		pr_err("Failed to find cpu%d device node\n", cpu);
>   		return -ENOENT;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
