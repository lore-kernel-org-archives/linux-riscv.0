Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28283C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01AI3ZHotktYM+FvQKZTQz5znsUfVjDk5K5bXW93JS4=; b=nhPMlrSUom68Ti
	0j8MF2NiP5l8XPdZLnHj4pP/GDjaQ2nTTEfPhGN0Ob1+r9Ta3RAwj5dwbQdtePCJUAfM+rjxY5QU5
	yt9B+xA+UJZu7tErALZ3vhIPrPjJPHpW6DOGUIu4SFDtYWAAJAUUskgupToX8QsMCoTr2+GTjPt57
	j3l5T3aWzyKUz3Hg3oH+OZ+BBX1eFNyfxBchW9CbsgfULZqXoneCtW2knUsQFvUxMKsFGDOQIIZOc
	aIK9gj2tI7cuXULAz7MbCAJUZK/3ByPtGtxSyuQo/Ev/CSYxvPV778tiJA1FUbpNrkOMdRGoTdlfx
	LevIZevm9JLilc09bTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Kxx-00Cvj3-2F;
	Mon, 13 Nov 2023 00:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Kxv-00CviP-0y
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699835889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1nf6XEV98s0CEk667q+uBgTZE/SGODZkiF15Lal4kk=;
	b=h8KQd98/GEKJzORHx2wfKS2d8qiY110UBpsBEbdRXv4/y5PivgPj1JbxDbPZfB/3DNYR3T
	q6BDqln+8FIoznZ0EG2zfUCjCovb/uDlIxVUJoGzTB7QCrvpNzS3Bpxc1ZOm27oiyA11iq
	2Q6QXeGzN0ooFxHKhSCfkip+mko+0es=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-LSwxaZk9M4aEp4YjvJiLkQ-1; Sun, 12 Nov 2023 19:38:08 -0500
X-MC-Unique: LSwxaZk9M4aEp4YjvJiLkQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1f08758b52cso3720923fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699835887; x=1700440687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1nf6XEV98s0CEk667q+uBgTZE/SGODZkiF15Lal4kk=;
        b=djv1vWIsJldwxkZX0hiVFxqc3zQmrJVMZ2WSFsPYrVdR+LujzUOjfVcOUkdirTdAsO
         ESLeQoFPxBXbyXsh0igvRqmQQiAku7F1j2WdyB/v7TKIGU1LcXeE5POL2iRWpXXda/5G
         402NcGlM368T4RYc65A8vNhcxtiSFGnOcbNyaN3SH6gmX3F5tf0bJvER1n/C/D7u3Ljf
         nae86rhqDZeRHclZA4fUL3m9RGIE+LbGYQRGPlPSXf418kNRl8q0RuuwVG0M3iZ3q8aD
         RIW0qLVxB613SBHaD4GqPlqeMmBU0W0GXAVJskQJQ+v2Fg6v4CHvYREFsSJE8llXWkyD
         k4PQ==
X-Gm-Message-State: AOJu0Yzhn1ju6rxX59al6v23awZJZklvaSjKIUbQeiccQEXUHkV4RyDW
	7nd++6pEaH88jR3CJYUXqfpgyonXh5KkrbopiG7vk1Ge+L87o+1GLkjC2wbIfeUu4ykCC1vTC0W
	7k6v4oR0Wtxl2NH/0EpHclT7zOOyH
X-Received: by 2002:a05:6870:d0c6:b0:1e9:e605:27a2 with SMTP id k6-20020a056870d0c600b001e9e60527a2mr7371009oaa.40.1699835887694;
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHcRcNW/0WRXgRcvJUbygUPuUiuO/tgZdTNz8Uw3rp5U7itGOHSrxQdNmH0YwAJkfF7sIkzQ==
X-Received: by 2002:a05:6870:d0c6:b0:1e9:e605:27a2 with SMTP id k6-20020a056870d0c600b001e9e60527a2mr7370991oaa.40.1699835887444;
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id lx7-20020a17090b4b0700b00280c6f35546sm2774851pjb.49.2023.11.12.16.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
Message-ID: <8cdb97b5-515a-474d-918c-2f0d5ecad266@redhat.com>
Date: Mon, 13 Nov 2023 10:37:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/22] drivers: base: Use present CPUs in
 GENERIC_CPU_DEVICES
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
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLB-00CTwy-7y@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLB-00CTwy-7y@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_163811_420427_4B2EE737 
X-CRM114-Status: GOOD (  22.47  )
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
> Three of the five ACPI architectures create sysfs entries using
> register_cpu() for present CPUs, whereas arm64, riscv and all
> GENERIC_CPU_DEVICES do this for possible CPUs.
> 
> Registering a CPU is what causes them to show up in sysfs.
> 
> It makes very little sense to register all possible CPUs. Registering
> a CPU is what triggers the udev notifications allowing user-space to
> react to newly added CPUs.
> 
> To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
> it to use for_each_present_cpu(). Making the ACPI architectures use
> GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
> cpu_register() logic, before moving it into the ACPI processor driver.
> When ACPI is disabled this work would be done by
> cpu_dev_register_generic().
> 
> Of the ACPI architectures that register possible CPUs, arm64 and riscv
> do not support making possible CPUs present as they use the weak 'always
> fails' version of arch_register_cpu().
> 
> Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
> distinction between present and possible CPUs.
> 
> The following architectures use GENERIC_CPU_DEVICES but are not SMP,
> so possible == present:
>   * m68k
>   * microblaze
>   * nios2
> 
> The following architectures use GENERIC_CPU_DEVICES and consider
> possible == present:
>   * csky: setup_smp()
>   * processor_probe() sets possible for all CPUs and present for all CPUs
>     except the boot cpu, which will have been done by
>     init/main.c::start_kernel().
> 
> um appears to be a subarchitecture of x86.
> 
> The remaining architecture using GENERIC_CPU_DEVICES are:
>   * openrisc and hexagon:
>     where smp_init_cpus() makes all CPUs < NR_CPUS possible,
>     whereas smp_prepare_cpus() only makes CPUs < setup_max_cpus present.
> 
> After this change, openrisc and hexagon systems that use the max_cpus
> command line argument would not see the other CPUs present in sysfs.
> This should not be a problem as these CPUs can't bre brought online as
> _cpu_up() checks cpu_present().
> 
> After this change, only CPUs which are present appear in sysfs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
