Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2285CD342F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 00:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdOqWG2oc1gdQcBJvl/eIdgosVC6f0I7FZL6bYsvols=; b=mSlX6x/0jjMjBm
	NyDcuroAJGkLKBDWUtN/leDv4QYenvX5hfjYgGH7vhEKuhJ9iYvusyZc5b3Hjbyfh/yxjWclhe35O
	HwJoxzi4z658N0P1D1fJsr82Qb966PZhFhS9axJ1J1IlN4h7Pz0Vg2c5ZBjewU2doeUKbzlAeWk0G
	7tK9raHzRgoVjMtdoDDWGPxLbIHnmjLIcoM4H3dqNpCjB0wlVC+BJndgGviEXHePZMu9w1gmDWNZ+
	N0MZWVgh1OmPwWCYb9JQ1zZUwiemPTj5zWS3uNkaPfUby2FaPwMAwefFCRy9fX5Se955TOOKKf6ye
	JZAXiMoN/Nh5EGNUlYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOsE-00GbFc-1w;
	Tue, 19 Sep 2023 00:45:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOsB-00GbEq-0w
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 00:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695084349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LM15K8pzy7YjRbxMXPWyKscBPIcWYYmbRagei3+odA0=;
	b=F/uVhAHZb+iTTpsxz8SamxrZFImdRaBT0aHhKqzqkxpSBQA9SMKqmzgBe8rG5HLJ8HxGgd
	gu4K9u97WMhHDd9v8lNQdi1QwgbfsnGazNwx9+3Z37RbtALFoKGKo92U0zDZubg/tdUqSQ
	y1V6khnD+x5L2VMCugM3wgKHZJqBBcc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391--2ncYuDFPH2ivJ3XUBtwGg-1; Mon, 18 Sep 2023 20:45:48 -0400
X-MC-Unique: -2ncYuDFPH2ivJ3XUBtwGg-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-577c25cda99so3049620a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 17:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695084347; x=1695689147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LM15K8pzy7YjRbxMXPWyKscBPIcWYYmbRagei3+odA0=;
        b=ezsPvXpq7u69bXCKv35KjTWYTXnkMhIqyUd0L9M5fD3/sssf7r9ficK+wwwXOwbZK9
         zwy1b7bb9ha5MlJ5HPuJZyYlvASkYlBbvtMOPYtVd+32j0bsjOjvEwn52XSqdE3qNiX1
         otIHkl925GzxU9OndcpCe8wiqOM+y5f8269Z7pPV8YnbzNyCpPiNDl6Z9KSPLuRynFKX
         33bur08v+EwNUkBGpElqMMaYuvu4F43svGOysamlkKr4GNOHkly7YD87/8Ivp2aDzsBO
         sGP1ZSm1yJbWWRca+AABP9mHKUSViVmhF5w8Vcdw1iaOEEWUfIT1CFM4df/dH+KnGR0r
         MCqw==
X-Gm-Message-State: AOJu0YwSkTO0zbbNoqEKqwYMIrYypH7SzLBg+2qrDk18T3jKYW3PK3bJ
	C1NA8ffLoJ+foN1N/TumUmAK5Av2OaGrpQ2n55JfkN8F5EC8p4F8jsetjjNizHXLou3PNhJtdzG
	qX4AbgI5K8y31oRcDqBh/fFPQHT0W
X-Received: by 2002:a05:6a20:e126:b0:12e:98a3:77b7 with SMTP id kr38-20020a056a20e12600b0012e98a377b7mr11802959pzb.59.1695084347003;
        Mon, 18 Sep 2023 17:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbRMohfrQfu8U6nIU99dVCswPBycZA0RmEkJtJ+RPQwK7z3RIdFfhgC8+/M21E5Fme0WVGHQ==
X-Received: by 2002:a05:6a20:e126:b0:12e:98a3:77b7 with SMTP id kr38-20020a056a20e12600b0012e98a377b7mr11802939pzb.59.1695084346690;
        Mon, 18 Sep 2023 17:45:46 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b001b06c106844sm8833025plr.151.2023.09.18.17.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 17:45:45 -0700 (PDT)
Message-ID: <518859b1-64a9-d723-963c-56c7f6fc2da1@redhat.com>
Date: Tue, 19 Sep 2023 10:45:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 22/35] ACPI: Check _STA present bit before making
 CPUs not present
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-23-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-23-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_174551_401602_938D1ABD 
X-CRM114-Status: GOOD (  28.37  )
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

On 9/14/23 02:38, James Morse wrote:
> When called acpi_processor_post_eject() unconditionally make a CPU
> not-present and unregisters it.
> 
> To add support for AML events where the CPU has become disabled, but
> remains present, the _STA method should be checked before calling
> acpi_processor_remove().
> 
> Rename acpi_processor_post_eject() acpi_processor_remove_possible(), and
> check the _STA before calling.
> 
> Adding the function prototype for arch_unregister_cpu() allows the
> preprocessor guards to be removed.
> 
> After this change CPUs will remain registered and visible to
> user-space as offline if buggy firmware triggers an eject-request,
> but doesn't clear the corresponding _STA bits after _EJ0 has been
> called.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c | 31 +++++++++++++++++++++++++------
>   include/linux/cpu.h           |  1 +
>   2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 00dcc23d49a8..2cafea1edc24 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -457,13 +457,12 @@ static int acpi_processor_add(struct acpi_device *device,
>   	return result;
>   }
>   
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>   /* Removal */
> -static void acpi_processor_post_eject(struct acpi_device *device)
> +static void acpi_processor_make_not_present(struct acpi_device *device)
>   {
>   	struct acpi_processor *pr;
>   
> -	if (!device || !acpi_driver_data(device))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
>   		return;
>   

In order to use IS_ENABLED(),

>   	pr = acpi_driver_data(device);
> @@ -501,7 +500,29 @@ static void acpi_processor_post_eject(struct acpi_device *device)
>   	free_cpumask_var(pr->throttling.shared_cpu_map);
>   	kfree(pr);
>   }
> -#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
> +
> +static void acpi_processor_post_eject(struct acpi_device *device)
> +{
> +	struct acpi_processor *pr;
> +	unsigned long long sta;
> +	acpi_status status;
> +
> +	if (!device)
> +		return;
> +
> +	pr = acpi_driver_data(device);
> +	if (!pr || pr->id >= nr_cpu_ids || invalid_phys_cpuid(pr->phys_id))
> +		return;
> +

Do we really need to validate the logic and hardware CPU IDs here? I think
the ACPI processor device can't be added successfully if one of them is
invalid.

> +	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
> +	if (ACPI_FAILURE(status))
> +		return;
> +
> +	if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
> +		acpi_processor_make_not_present(device);
> +		return;
> +	}
> +}
>   
>   #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
>   bool __init processor_physically_present(acpi_handle handle)
> @@ -626,9 +647,7 @@ static const struct acpi_device_id processor_device_ids[] = {
>   static struct acpi_scan_handler processor_handler = {
>   	.ids = processor_device_ids,
>   	.attach = acpi_processor_add,
> -#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>   	.post_eject = acpi_processor_post_eject,
> -#endif
>   	.hotplug = {
>   		.enabled = true,
>   	},
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index a71691d7c2ca..e117c06e0c6b 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -81,6 +81,7 @@ struct device *cpu_device_create(struct device *parent, void *drvdata,
>   				 const struct attribute_group **groups,
>   				 const char *fmt, ...);
>   extern int arch_register_cpu(int cpu);
> +extern void arch_unregister_cpu(int cpu);

arch_unregister_cpu() is protected by CONFIG_HOTPLUG_CPU in the individual architectures,
for example arch/ia64/kernel/topology.c

>   #ifdef CONFIG_HOTPLUG_CPU
>   extern void unregister_cpu(struct cpu *cpu);
>   extern ssize_t arch_cpu_probe(const char *, size_t);

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
