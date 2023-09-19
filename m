Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95104CD342F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 00:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8N2TlOOaYbZWde+p9jrvLswLyVBbqKIT8qeN+oDeZHo=; b=ZW2Kui7wTCHJO6
	f1dWFBjRskwyM+YrRhTe0HdnAf1L8dVGaUVTABQkLwMpA2OT6iD9wDB72ZOUEi7kbNg3cWY2w7Ngr
	cYXNR2YFXU65douyZjz7Kocl3WPrDjB/sackmMHrsFoWxXu5TBTH7H6r6vHrWK/5PHV34aDMhqqVt
	BkLWviQrIjtFGLioD7Bv7D6vXRA3gO8QMYn1VttS6wouuQsHHpWnGgo84+RtnJ/BoBcn60n435nNd
	FRROR4H+yYrY+5Fdwf9pwt+FwnCIQqZoAk3rsEFAQ3+Kyy+dtrlBkF1gr9H6y0b76MM5Ui6ioxFy9
	p9VVOPd7fjeo22lP1xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOw0-00Gbh9-2x;
	Tue, 19 Sep 2023 00:49:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOvy-00GbgN-00
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 00:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695084585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIURaVhU/G5DJJinyquD0ptYbPAZ38yx5KNcjiMal4E=;
	b=VdCdP4Se5ER7ZVXyUaqc8oGM+158m+Gf5Fithil/giFqcFZquPtsVieArBDRw81EPV1YIt
	KnRvBGoIvY7Zjgm6OfVEJtfEix+bh+qX4S20jC/B/IEPps0KG+gRw5DQy0QqXVc9p5n+aP
	ej2BBeYR1W2QASRTE8XsrNn3HRtVq+U=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-FbFTDEJ-M8mJGAnJpJwYiA-1; Mon, 18 Sep 2023 20:49:41 -0400
X-MC-Unique: FbFTDEJ-M8mJGAnJpJwYiA-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-690c2fec489so207930b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 17:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695084581; x=1695689381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIURaVhU/G5DJJinyquD0ptYbPAZ38yx5KNcjiMal4E=;
        b=QtgeuA4+5QnWUHld91rgGpXCv2CB+C8o73HmXqXFzHopsizRpUwmudJ6kiomDXigqq
         /X+dMy//SW1viua9aXyCJa2tiUf6Grah/IOjqnjUz5F0PAuduWvgWGnNMcivN9eb6qwl
         sGP3MO6Yf/ysh/yPwHQz/NiAetcqYLl10Z3Y125uBazh4UjPIc/5vWShrSZM9d0rU9kO
         clCSvLfQVA94seBfKO5jtEhYaveq3pdNW6Pusd2OBYEqsAe70inYClwk96WG/TLAV57J
         u0+sp3Chz3yNW3XQixOMw+XRcCruxhWxwS3b3ShaOwKfuRa6RP8XwZqNACjlepV0o94R
         uD3A==
X-Gm-Message-State: AOJu0YxUWSnDuOmA+92g2UMXtpI+4gYrGlHQvrjZO+aLwC83zaxUm4/G
	9a5mG/fF8+kqN/ZE4iZACXMjLhk7vKIEQQM0EEDxuW86C//ocbpLTF3eEJ0pQ39Gs+f2/nHfFdN
	/1K5ckEj0nC+53XZHpHZdQNOa22Rs
X-Received: by 2002:a05:6a00:13a9:b0:68a:6173:295b with SMTP id t41-20020a056a0013a900b0068a6173295bmr11687173pfg.2.1695084580787;
        Mon, 18 Sep 2023 17:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oVg5VMiqyNQpSBftI/mkgS1m694rJEONxMKwBMkdMp9Ry/rErZrzBJO2CPP2aN+mnlKKqg==
X-Received: by 2002:a05:6a00:13a9:b0:68a:6173:295b with SMTP id t41-20020a056a0013a900b0068a6173295bmr11687156pfg.2.1695084580437;
        Mon, 18 Sep 2023 17:49:40 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id i13-20020aa787cd000000b0068fe76cdc62sm70310pfo.93.2023.09.18.17.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 17:49:39 -0700 (PDT)
Message-ID: <54c91de8-f0d2-787f-5710-2da1dfc80937@redhat.com>
Date: Tue, 19 Sep 2023 10:49:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 23/35] ACPI: Warn when the present bit changes but
 the feature is not enabled
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
 <20230913163823.7880-24-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-24-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_174946_107071_A2D8DAF8 
X-CRM114-Status: GOOD (  20.41  )
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
> ACPI firmware can trigger the events to add and remove CPUs, but the
> OS may not support this.
> 
> Print a warning when this happens.
           ^^^^^^^
           error message
> 
> This gives early warning on arm64 systems that don't support
> CONFIG_ACPI_HOTPLUG_PRESENT_CPU, as making CPUs not present has
> side effects for other parts of the system.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 

Maybe a warning message is enough, but a error message
is also fine, I think.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 2cafea1edc24..b67616079751 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -188,8 +188,10 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
>   	acpi_status status;
>   	int ret;
>   
> -	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
> +		pr_err_once("Changing CPU present bit is not supported\n");
>   		return -ENODEV;
> +	}
>   
>   	if (invalid_phys_cpuid(pr->phys_id))
>   		return -ENODEV;
> @@ -462,8 +464,10 @@ static void acpi_processor_make_not_present(struct acpi_device *device)
>   {
>   	struct acpi_processor *pr;
>   
> -	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
> +		pr_err_once("Changing CPU present bit is not supported");
>   		return;
> +	}
>   
>   	pr = acpi_driver_data(device);
>   	if (pr->id >= nr_cpu_ids)

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
