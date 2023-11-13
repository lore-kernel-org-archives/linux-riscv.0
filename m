Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E653DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/UT4vDPx3R+6cg1D867OpkaWND33gKcneT+2xLuneM=; b=Nls3w1DLkBA27s
	XBLhYnlm78L7fNffTOP2vupgQmbs0POBNoKkuculNmtYGFj/OEO4sqyxqK+IOtVF6I2UXuV/b7GEd
	ETTy/4vRwk15+/aCAPTkvPucrML4hhyVxnzo2im1lNqJ5EDgrLhgA6L6kr20Lf26O7j5C+iISy6Ue
	uxk6cAIWWJVIavzUMJz+3SWg6/XdSxQfYvJyhHG9TiTrBGMWtabu6KDEBbU/LtNJ5qOHXvLy6AfdV
	MvSs5Sx8j7xwqNLD2zaFJMVNHGVNyFJsHsNACMeDtL6WtORbCGpctCWW6wpT+omUNKLOhdp/+JjP/
	O4XqjcKkQY0ryvz2agng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OEo-00DBoq-1u;
	Mon, 13 Nov 2023 04:07:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OEm-00DBoC-2I
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vPpPFrFkMrzqnxNhFYjlLboUr7aR9ku5ew8hulbyck=;
	b=Tl0rzoI74P3uRhdZNOWfq9ghanjrVgBgRFf0yMpA6exJql/JFGnqPFqP36LHOhwBWEu5TP
	VpSX+G7yodqh/PGPrisxDN7OklAmfrUaQZsekZxMRbRVDFhx/SBKizBXv7b1lBqXGoO705
	xdOdXInOafXfa8jEoqAEDdHpe17wDjw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-zAgQhgPZOVaB32x2KrjJFw-1; Sun, 12 Nov 2023 23:07:46 -0500
X-MC-Unique: zAgQhgPZOVaB32x2KrjJFw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cc1682607eso45360155ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848465; x=1700453265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vPpPFrFkMrzqnxNhFYjlLboUr7aR9ku5ew8hulbyck=;
        b=Qwc/JuWHqf6Oth7KH3kHqUdzw5k6qQeYP+inSO51Znd1MHQVSVk6PeKVR84rHnzsPQ
         HbwyT6ahU4SMBAuBqEv7rCHMAScj20bOhulZeCPtO7D/aUivQpyjVxNtzcOtzCpi1bdO
         h/L1ErtH5OLnLeP0YMch9PmxuSvyFREnV/i32ofwtgFk79d6D0sCK20jBv29RIA6BuYT
         yURMPL/a69qwPaTMal5s4gNGx1y28Bu1yzRZLK6X745/4HvMq9X50QgU0tYAfh+nUEol
         0AsKfkTedoabLlFDouGXMx7r8P6wzLthwKbbufzd5/h+mb57Cj3YgvVex4dtdl+kMLXY
         FQuA==
X-Gm-Message-State: AOJu0YylZayU2bTXQEbTZOUilu1ROLcnBfAux0ZrKgMf35oBO9zpat27
	plSTqARTPzG/NmQUv5IsQu2tzVcipO2100ve2xO3kG0yLkmjYxyxBwvfDOhV3WOIWLrsOYZAuBj
	8UtOhotcRqn7E9nGAAKt+JaczG62h
X-Received: by 2002:a17:903:18f:b0:1c9:b2c1:139c with SMTP id z15-20020a170903018f00b001c9b2c1139cmr7261838plg.62.1699848465410;
        Sun, 12 Nov 2023 20:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWMylLMVWpWug6Cxx/NC9nXPjOFm1HEloPQE99Sn7p/Alc1N4hJ0inQY3toOaSbmTdKDWFaA==
X-Received: by 2002:a17:903:18f:b0:1c9:b2c1:139c with SMTP id z15-20020a170903018f00b001c9b2c1139cmr7261816plg.62.1699848465098;
        Sun, 12 Nov 2023 20:07:45 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001cc3098c9f8sm3225162plh.275.2023.11.12.20.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:07:44 -0800 (PST)
Message-ID: <a6fe7a98-d215-4639-9949-b0044313681f@redhat.com>
Date: Mon, 13 Nov 2023 14:07:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/22] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_200748_823616_5CDA52BD 
X-CRM114-Status: GOOD (  16.02  )
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

On 11/7/23 20:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> To allow ACPI's _STA value to hide CPUs that are present, but not
> available to online right now due to VMM or firmware policy, the
> register_cpu() call needs to be made by the ACPI machinery when ACPI
> is in use. This allows it to hide CPUs that are unavailable from sysfs.
> 
> Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> five ACPI architectures to be modified at once.
> 
> Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> that populates the hotpluggable flag. arch_register_cpu() is also the
> interface the ACPI machinery expects.
> 
> The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> it to use the one GENERIC_CPU_DEVICES provides.
> 
> This changes the CPUs visible in sysfs from possible to present, but
> on arm64 smp_prepare_cpus() ensures these are the same.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>   * Add note about initialisation order change.
> ---
>   arch/arm64/Kconfig           |  1 +
>   arch/arm64/include/asm/cpu.h |  1 -
>   arch/arm64/kernel/setup.c    | 13 ++++---------
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
