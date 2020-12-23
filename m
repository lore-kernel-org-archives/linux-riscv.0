Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEDBC433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 03:32:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7B42076D
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 03:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C7B42076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LI++lWzSKM9vNZvNbHXgEB18IHtOMLFLAx7C5sH8/8=; b=vaN4p9WrPQ2BKVEUuTu6TLT/J
	BuxU8nO6TmWGACLXxBEKxWU+/YJaKXIqf8IhMSBBArYyQ4eo4aDx4Er2JWMicqG5dDBADbHqKyAMR
	zz3zzREDfS7+um1JPNuk7GDc/fyhgjdOl7XJ3lAnPVvRiWEX2DVD/+fjpvDqXHSlWYgtiCRtrSIX0
	fIRlYn6uUaQ3Bz7JZ4lrkfW9HGYavnO09PkSJ15fUKuhORhRwfiyKJME0e/VU5hQKglvMNwXyXduC
	C850tGnO9k2eXe6TTDdtEYUNLAK0085//TDjdzzUdKcydAJdJy7p1IxJ0nm97qjB3awMDjK7ZhhtV
	2cBpXVABQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krutJ-0000QT-Mp; Wed, 23 Dec 2020 03:32:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krus3-0000MG-UF; Wed, 23 Dec 2020 03:32:43 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4D0zGN2jMkz13XWq;
 Wed, 23 Dec 2020 11:29:32 +0800 (CST)
Received: from dggpemm000004.china.huawei.com (7.185.36.154) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 23 Dec 2020 11:30:43 +0800
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggpemm000004.china.huawei.com (7.185.36.154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 23 Dec 2020 11:30:44 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Wed, 23 Dec 2020 11:30:44 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: RE: [PATCH v15 12/17] RISC-V: KVM: Add timer functionality
Thread-Topic: [PATCH v15 12/17] RISC-V: KVM: Add timer functionality
Thread-Index: AQHWtoyLg56Gu0NX0EGJJ8nRAPiOhKoERjWw
Date: Wed, 23 Dec 2020 03:30:43 +0000
Message-ID: <d3f3a7aea01c49afb9cadccd47498854@huawei.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-13-anup.patel@wdc.com>
In-Reply-To: <20201109113240.3733496-13-anup.patel@wdc.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_223242_693253_219A8928 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 Alexander Graf <graf@amazon.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Anup Patel [mailto:anup.patel@wdc.com]
> Sent: Monday, November 9, 2020 7:33 PM
> To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> kvm@vger.kernel.org; kvm-riscv@lists.infradead.org;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Anup Patel
> <anup.patel@wdc.com>; Daniel Lezcano <daniel.lezcano@linaro.org>
> Subject: [PATCH v15 12/17] RISC-V: KVM: Add timer functionality
> 
> From: Atish Patra <atish.patra@wdc.com>
> 
> The RISC-V hypervisor specification doesn't have any virtual timer feature.
> 
> Due to this, the guest VCPU timer will be programmed via SBI calls.
> The host will use a separate hrtimer event for each guest VCPU to provide
> timer functionality. We inject a virtual timer interrupt to the guest VCPU
> whenever the guest VCPU hrtimer event expires.
> 
> This patch adds guest VCPU timer implementation along with ONE_REG
> interface to access VCPU timer state from user space.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/riscv/include/asm/kvm_host.h       |   7 +
>  arch/riscv/include/asm/kvm_vcpu_timer.h |  44 +++++
>  arch/riscv/include/uapi/asm/kvm.h       |  17 ++
>  arch/riscv/kvm/Makefile                 |   2 +-
>  arch/riscv/kvm/vcpu.c                   |  14 ++
>  arch/riscv/kvm/vcpu_timer.c             | 225
> ++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c                     |   2 +-
>  drivers/clocksource/timer-riscv.c       |   8 +
>  include/clocksource/timer-riscv.h       |  16 ++
>  9 files changed, 333 insertions(+), 2 deletions(-)  create mode 100644
> arch/riscv/include/asm/kvm_vcpu_timer.h
>  create mode 100644 arch/riscv/kvm/vcpu_timer.c  create mode 100644
> include/clocksource/timer-riscv.h
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h
> b/arch/riscv/include/asm/kvm_host.h
> index 64311b262ee1..4daffc93f36a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_types.h>
> +#include <asm/kvm_vcpu_timer.h>
> 
>  #ifdef CONFIG_64BIT
>  #define KVM_MAX_VCPUS			(1U << 16)
> @@ -66,6 +67,9 @@ struct kvm_arch {
>  	/* stage2 page table */
>  	pgd_t *pgd;
>  	phys_addr_t pgd_phys;
> +
> +	/* Guest Timer */
> +	struct kvm_guest_timer timer;
>  };
> 

...

> diff --git a/arch/riscv/include/uapi/asm/kvm.h
> b/arch/riscv/include/uapi/asm/kvm.h
> index f7e9dc388d54..00196a13d743 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -74,6 +74,18 @@ struct kvm_riscv_csr {
>  	unsigned long scounteren;
>  };
> 
> +/* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> struct
> +kvm_riscv_timer {
> +	u64 frequency;
> +	u64 time;
> +	u64 compare;
> +	u64 state;
> +};
> +

Hi,

There are some building errors when we build kernel by using allmodconfig.
The commands are as follow:
$ make allmodconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
$ make -j64 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

The following error occurs:
[stdout] usr/include/Makefile:108: recipe for target 'usr/include/asm/kvm.hdrtest' failed
[stderr] ./usr/include/asm/kvm.h:79:2: error: unknown type name 'u64'
[stderr]   u64 frequency;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:80:2: error: unknown type name 'u64'
[stderr]   u64 time;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:81:2: error: unknown type name 'u64'
[stderr]   u64 compare;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:82:2: error: unknown type name 'u64'
[stderr]   u64 state;
[stderr]   ^~~
[stderr] make[2]: *** [usr/include/asm/kvm.hdrtest] Error 1

Is it better to change u64 to __u64?

Regards,
Yifei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
