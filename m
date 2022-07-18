Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06115C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEXNLDR+xDnKIoe0bZbcr+/WPWbKt06NwewsaiQxPqQ=; b=Hd6Yqsc89s1Ut4
	C1SaMRjcleNvL5Xz3S4caW5ZQl+Io30JgQvsMdD29JGdt5iygnth6/Ol98wHISLe/lrzvVDW11jeb
	BVYYn0dP1MUs6EONhWeM9XTadMoQbAzZPMmEAJVLwFkdEPNr2SpsBZdUHpezjyYlfZvodvLR0WWup
	vhd3LWp4Li1N4pjCnhfFd7rce5UCjn9nJqqHO9Srpy/i52/fzLrmYs+WYcb6mOpAor81tD2PU+x9Z
	v6dsoKzrqsp8y4fLaDVsKNwIfnYkfnqlFUDoypsAWLwWXDx2iE48Rt7SXXSG78JUm6zxhJGu+jKI+
	o/qgumcavqEqcGC3drSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUlB-00HGjf-Vc; Mon, 18 Jul 2022 17:42:22 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUko-00HGSR-Lv; Mon, 18 Jul 2022 17:42:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q13-20020a17090a304d00b001f1af9a18a2so4831806pjl.5;
        Mon, 18 Jul 2022 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C4O6r+k5Vcq3IoZ3ErxSK8ZS5w/UHQdAiIwAjbRevsY=;
        b=C8A+rB9Dh7xy7CaBvi9sXwV42l/8tSQ84C1sidb+Xm2jtR2aKBTK7ehnqHkTB+WvYl
         4zjXqWtDV3EYQgKAY8INEW78xVOEkFZj19BjDVUXFW8ixzr3q0AqS5opiCT+stLd6Wsp
         7+eaGoqnHV9MHs2ZooMukqvPjzQiGa8jghfDbAlmFDgyujm5ueBJ8Sojd4Di14jUxXSz
         3fHUZ5Agdm92pEJ8RbEkdouiuy8f1OBlyVKl4g9Mr24E3j3lc1PNwizsyHRKxNFZgzXc
         +eF2s41OHvVs/0J/Uw90MV2WPbS6M0ciApjCKfA9BREyR6adjn+fIGPR5jPNwZyyRjd+
         rZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=C4O6r+k5Vcq3IoZ3ErxSK8ZS5w/UHQdAiIwAjbRevsY=;
        b=ZU5IVoSH9AXpQm4YCku7kcsIW62+GLIwiKxMA7wjCcINsKOsXQFmkz4pm14VlOD7xl
         hPxcoYd5qck5lIsINEkWvnPaCDUK0WL1GKAwbXEHZAIDHWsz21Nxg1UFc8geOs04Clss
         exDXzjd2maVBIT5lGAyCDTWpV2uNze1nkM21T29gucqrOKZhyTvOkaUZU3inBr9WJIj3
         BqImaBEURvQGXxOfjZEiY0NPPr9rqsLND0TDw74IqZTygyew60HNgiGCb/f1/AQyilyU
         +Ks2w+zRdkpzoJJRgmQTK2jArcqIolbR+3pLMd9Ih01lb7NOd3nVeYRB3h2khCQf+ox0
         h7FQ==
X-Gm-Message-State: AJIora+6QRbQd+DkBq0XY2xLMu3Mua8zaDDLsiZir+O3TkaIBbth0S1d
	Uk6y+NeqKS2F9Lc9fFAXpTw=
X-Google-Smtp-Source: AGRyM1vCcyqIijrxFgGKLBprW59kceAvPSBuVHhf3/0uCj6DCnHbCJA4rxkVl1m9bdSXz9QUv5Afgw==
X-Received: by 2002:a17:903:1207:b0:16a:7e87:dad3 with SMTP id l7-20020a170903120700b0016a7e87dad3mr29500323plh.99.1658166114240;
        Mon, 18 Jul 2022 10:41:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i35-20020a635863000000b004126fb46b02sm8352955pgm.82.2022.07.18.10.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:41:53 -0700 (PDT)
Date: Mon, 18 Jul 2022 10:41:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <20220718174151.GA462603@roeck-us.net>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713133344.1201247-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_104158_738994_35D7B6B6 
X-CRM114-Status: GOOD (  23.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 13, 2022 at 02:33:44PM +0100, Sudeep Holla wrote:
> init_cpu_topology() is called only once at the boot and all the cache
> attributes are detected early for all the possible CPUs. However when
> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> attributes are added back when the CPUs are hotplugged back in as part
> of CPU hotplug state machine, it ends up called quite late after the
> update_siblings_masks() are called in the secondary_start_kernel()
> resulting in wrong llc_sibling_masks.
> 
> Move the call to detect_cache_attributes() inside update_siblings_masks()
> to ensure the cacheinfo is updated before the LLC sibling masks are
> updated. This will fix the incorrect LLC sibling masks generated when
> the CPUs are hotplugged out and hotplugged back in again.
> 
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> Hi Conor,
> 
> Ionela reported an issue with the CPU hotplug and as a fix I need to
> move the call to detect_cache_attributes() which I had thought to keep
> it there from first but for no reason had moved it to init_cpu_topology().
> 
> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> cpu in the secondary CPUs init path while init_cpu_topology executed
> detect_cache_attributes() for all possible CPUs much earlier. I think
> this might help as the percpu memory might be initialised in this case.
> 
> Anyways give this a try, also test the CPU hotplug and check if nothing
> is broken on RISC-V. We noticed this bug only on one platform while
> 

arm64, with next-20220718:

...
[    0.823405] Detected PIPT I-cache on CPU1
[    0.824456] BUG: sleeping function called from invalid context at kernel/locking/semaphore.c:164
[    0.824550] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/1
[    0.824600] preempt_count: 1, expected: 0
[    0.824633] RCU nest depth: 0, expected: 0
[    0.824899] no locks held by swapper/1/0.
[    0.825035] irq event stamp: 0
[    0.825072] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.826017] hardirqs last disabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
[    0.826123] softirqs last  enabled at (0): [<ffff800008158870>] copy_process+0x5e0/0x18e4
[    0.826191] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.826764] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc7-next-20220718 #1
[    0.827397] Call trace:
[    0.827456]  dump_backtrace.part.0+0xd4/0xe0
[    0.827574]  show_stack+0x18/0x50
[    0.827625]  dump_stack_lvl+0x9c/0xd8
[    0.827678]  dump_stack+0x18/0x34
[    0.827722]  __might_resched+0x178/0x220
[    0.827778]  __might_sleep+0x48/0x80
[    0.827833]  down_timeout+0x2c/0xa0
[    0.827896]  acpi_os_wait_semaphore+0x68/0x9c
[    0.827952]  acpi_ut_acquire_mutex+0x4c/0xb8
[    0.828008]  acpi_get_table+0x38/0xbc
[    0.828059]  acpi_find_last_cache_level+0x44/0x130
[    0.828112]  init_cache_level+0xb8/0xcc
[    0.828165]  detect_cache_attributes+0x240/0x580
[    0.828217]  update_siblings_masks+0x28/0x270
[    0.828270]  store_cpu_topology+0x64/0x74
[    0.828326]  secondary_start_kernel+0xd0/0x150
[    0.828386]  __secondary_switched+0xb0/0xb4

I know the problem has already been reported, but I think the backtrace
above is slightly different.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
