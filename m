Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B37C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn20YULBDujzZ07dTS9pGidPnOIfU2xWYVR4oCsq634=; b=fapakaOqsUM/6y
	08Tl02S5RDyyea6Oaz1yJEagHEPxzZ7/2XNT/xh8EGuoM1tBJN4EdBEQC8NWMAe+LC57LSpv+X8VL
	WcqrIIkWaPZnvgsPnkFRiB1l5TOx2aiY5PWWmyhiz6jGc5C7ITXp5IQgNgd9tXa2ZeAo7fzFuG/53
	9yWEBJdQ5cKhcHJmdWxzA0eN76Ht9av3nUqjkKqtc08Js/E0IgbXWDnovoar7BaU6iulXnOl599t/
	2VWHno9ulc6Ro02QHzLjeZI75CA9NWa9y7fNqrPUiyiQdbwUCg0HvP9WveqXNrg43cSgdU6lPsVFS
	f/Tp00qul9DO/5Trsa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFEC-00DhC4-4F; Wed, 01 Jun 2022 03:41:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFE9-00DhA1-I4
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054856;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3TFHPDS/Psbk4AS6KoK5nXO/Qj1s0kWFsftf23bfkE=;
	b=EPhrkKfbL0EsyhH2+zIzuIDZ3z2DIGNK9UTT6iAiBNOi2yyFts7OwP+ReV3AJIRg7FwPMF
	JMGopv3DTJTd4mzI46CMfdsQsUDUk7cX4tMvIpYrYj/klxmwGOZ3Iz4raCxeLzlu/8cfYG
	J0X2IINhnRHuplzw/CAc6O653gDJ3lU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-IE20Dqp_Mq6dex4EbkNGhw-1; Tue, 31 May 2022 23:40:52 -0400
X-MC-Unique: IE20Dqp_Mq6dex4EbkNGhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2263D3C0D850;
	Wed,  1 Jun 2022 03:40:52 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD10E8287E;
	Wed,  1 Jun 2022 03:40:46 +0000 (UTC)
Subject: Re: [PATCH v3 12/16] arch_topology: Avoid parsing through all the
 CPUs once a outlier CPU is found
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
 <20220525081416.3306043-11-sudeep.holla@arm.com>
 <20220525081416.3306043-12-sudeep.holla@arm.com>
 <20220525081416.3306043-13-sudeep.holla@arm.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6270a109-85b8-b2d2-d32f-6e24be84448b@redhat.com>
Date: Wed, 1 Jun 2022 11:40:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-13-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_204057_701424_0D267A9F 
X-CRM114-Status: GOOD (  21.90  )
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
> There is no point in looping through all the CPU's physical package
> identifier to check if it is valid or not once a CPU which is outside
> the topology(i.e. outlier CPU) is found.
> 
> Let us just break out of the loop early in such case.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index f73a5e669e42..6ae450ca68bb 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -637,8 +637,10 @@ static int __init parse_dt_topology(void)
>   	 * only mark cores described in the DT as possible.
>   	 */
>   	for_each_possible_cpu(cpu)
> -		if (cpu_topology[cpu].package_id < 0)
> +		if (cpu_topology[cpu].package_id < 0) {
>   			ret = -EINVAL;
> +			break;
> +		}
>   
>   out_map:
>   	of_node_put(map);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
