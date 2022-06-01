Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FE0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 03:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkqIEsNmf3B0VAwZRD11CzgW96GY2ULXiVdKN9nQcB0=; b=McJFOTE6Y7KbcX
	8uk+QGLUZvcMPyYBal4wO7Lt2szIPhyk+b52vEZh3v63RMGJAwbpa5G0qKvqT3AF6pG1toLjdFg7+
	X4V9RshBKitiszykZ8//sqB0Jk+AhjVoEVyDK8OhDrrAoWmRvH+mla0mkFJSy1ccH2ZxYu2zAhgRY
	0Ar91IYidPtv/7xti1gguGY7fnbyFbhq/6LHhsJjPtY5KKAVAgVJBJU6pZzWz50HcBOB74x82wn0j
	MMdj/uJOVjDfLEysEmLMqlyTHhEvWv+YB0dUFDv8bn2gIutu/jnn3+zdqsxaIGGqHRvRgShzB/tgu
	QCupy1y5CVdcZ9Y4hh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF3p-00DeUF-7f; Wed, 01 Jun 2022 03:30:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwF3e-00DeSs-68
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 03:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654054202;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/QwG2vgWhruUHVSTvB1NROdcFoX8UsFct3vWYpMtXc=;
	b=DJV3dzdFZYVAIVEC83Q8hMuliYi/NpGLGSoi1+W2BXQiXOd70/bnWS8PFR0Ag5LEB+7E9i
	UYPKD//G4WTMoGCncZy+d1kEbLCTpf/X9hZowDzsHTTBx3LBLpVEoQB5maQs/H/v+hacnh
	mlH/MwEu4nA81gB400Vz/HO9OEJBnBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-_0wYGXsEMgO2MBWxFVFRVw-1; Tue, 31 May 2022 23:29:57 -0400
X-MC-Unique: _0wYGXsEMgO2MBWxFVFRVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A55C101A54E;
	Wed,  1 Jun 2022 03:29:56 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 680822166B26;
	Wed,  1 Jun 2022 03:29:50 +0000 (UTC)
Subject: Re: [PATCH v3 06/16] arch_topology: Add support to parse and detect
 cache attributes
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
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ccfcf360-fc61-7e6d-5814-1fb98a836f8f@redhat.com>
Date: Wed, 1 Jun 2022 11:29:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220525081416.3306043-7-sudeep.holla@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_203006_377550_00E27435 
X-CRM114-Status: GOOD (  25.01  )
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
> Currently ACPI populates just the minimum information about the last
> level cache from PPTT in order to feed the same to build sched_domains.
> Similar support for DT platforms is not present.
> 
> In order to enable the same, the entire cache hierarchy information can
> be built as part of CPU topoplogy parsing both on ACPI and DT platforms.
> 
> Note that this change builds the cacheinfo early even on ACPI systems, but
> the current mechanism of building llc_sibling mask remains unchanged.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/base/arch_topology.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 

With below nits fixed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index f73b836047cf..765723448b10 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/acpi.h>
> +#include <linux/cacheinfo.h>
>   #include <linux/cpu.h>
>   #include <linux/cpufreq.h>
>   #include <linux/device.h>
> @@ -775,15 +776,23 @@ __weak int __init parse_acpi_topology(void)
>   #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>   void __init init_cpu_topology(void)
>   {
> +	int ret, cpu;
> +
>   	reset_cpu_topology();
> +	ret = parse_acpi_topology();
> +	if (!ret)
> +		ret = of_have_populated_dt() && parse_dt_topology();
>   
> -	/*
> -	 * Discard anything that was parsed if we hit an error so we
> -	 * don't use partial information.
> -	 */
> -	if (parse_acpi_topology())
> -		reset_cpu_topology();
> -	else if (of_have_populated_dt() && parse_dt_topology())
> +	if(ret) {
> +		/*
> +		 * Discard anything that was parsed if we hit an error so we
> +		 * don't use partial information.
> +		 */
>   		reset_cpu_topology();
> +		return;
> +	}
> +
> +	for_each_possible_cpu(cpu)
> +		detect_cache_attributes(cpu);
>   }
>   #endif
> 

# ./scripts/checkpatch.pl --codespell patch/check/0006*
ERROR: space required before the open parenthesis '('
#55: FILE: drivers/base/arch_topology.c:786:
+	if(ret) {

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
