Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAqcvUMtFVn52q+CMJFIb600VZgMvBZGprk8BXEgF30=; b=zzTcbxvQTwLQ5T
	t05IDeoXl1CjmV213RoP+++KHOcF3mY7w8Jp2fQqUGr6lSJ8YT6k+gTpCUUz84OMNIIoSwvVi8AGI
	z/FrOkeSjWwtndRmD3z2wg8rbd8WwmbpR6jaZVygxA/XxZif9LO3Yze+yxIaIg0k8BsB3brAI/l1s
	G+UYIBuETuqpswSmz/rr2G/gLxgys7V88OkcacBJzelZv0JgsLInIjv0hwCH1Fbei1gVKBigNUnUW
	JLkGwLS/wfpJnUQldoEWGItjVusSLfyUkPfwlnHZNGP8+0Ikfthb8wJuiRvh60zD7Xu67FMx1WHjt
	I6w3DOjP6K8AeqsRuG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2L4s-00CwMB-2o;
	Mon, 13 Nov 2023 00:45:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2L4p-00CwLF-2z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699836319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
	b=WIy5zAvInhpPvNYpp5Nk+NgvUBFL6o3h3mA/MeAzwJLp2ZusOLVDuIpjpm3A+K8LNFh8Qb
	3GTLMn1QQ2kpWvLcQ6YeMZKIwME4xlEomluMu0LJN+E4xfFtJA5v3nXCPq+wonLx5NY/HR
	FkMTntMTVw0oJuP4VblDhLWx7UUMPHQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-vO_YrW61MPCmItitgLxVyg-1; Sun, 12 Nov 2023 19:45:15 -0500
X-MC-Unique: vO_YrW61MPCmItitgLxVyg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1f4ddfe6fe1so1318745fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699836315; x=1700441115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
        b=ifimDJXXlgfIRlIHE3JHycQXUP16mFqKm/ipNgfiH5Pkz/ZdYHkwC3ECiE2w3R0F4i
         sZHM29w/nh3i9g1Y5n7/GSuh0OqAZAHIk/4V1V1iNZ4sxPOXuDU9KpAj1RYAVGfVt/qT
         sKfcm0I6h3QHY3lZDgkpN09rRfZNCRf1pVY0Rsi0uE19CSD5Aa/KoK7704Z9bbOSGwEX
         kW3bcMjJ+QP9N77MuL6jvYTMoo2DFRWl6TMlK4oQgKR9azWMpMbLl1drZ+L1WPDcQ+xe
         LHrolXvBkoH13lVyMU9cTI0lXT3FnEoGNufxBRjcCBXb3T15m0xl7TS+2Qi1C88HoqO/
         1JSQ==
X-Gm-Message-State: AOJu0YyrAm8QjQuworEd/5nRo1cSmhhteUC91+w3JAccFhWC5iiV9NJY
	8ckZz8RMSXlflvKQaIPsFOwp+ovmmwXLgPXpD7vNjuzloHLwjPpC/ee+pO1q6LsRY/AWhqP2bLK
	RyksrbmiIerls5hFV+qWRJyO3xTWE
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060139oac.13.1699836315189;
        Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rLDeDKmdt9jI4rfj9b9OvZLsFOMuiJgoFwWcjW46CaFvA839DNqkdgqlkT2G64l2xzZLdg==
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060111oac.13.1699836314952;
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id hq18-20020a056a00681200b006933822e7a6sm2957854pfb.66.2023.11.12.16.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Message-ID: <df5fb117-96e0-4231-85c6-70c960fbb6c4@redhat.com>
Date: Mon, 13 Nov 2023 10:45:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/22] drivers: base: Implement weak
 arch_unregister_cpu()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_164520_033289_0B42E73E 
X-CRM114-Status: GOOD (  11.39  )
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


On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
