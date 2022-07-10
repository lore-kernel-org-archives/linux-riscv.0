Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B0DC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 19:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMlFy3HCAsTqd7u+RmMgAmisJzKmhSDDGkn7lv52cpU=; b=mZDXOPWHWuQUc0
	RHWl6uj03QrTbv8V8ZfoTPsktjnFN5+lkHSREQbuTvx3hWAxpvyM97KZpol9r7UzPzYl2whXeqNt2
	i7PdY7Q2jcq/v+a2qJq9cox8FmlSqOZA9EVIn/mpX7jEVPYplrc7iKpfCWBmAZuRGSa31rw8zYeso
	fcOPHJk+f0AycXL8IR2qP9eG5QosRXy2KIq7/ETWkC6XPYJESMxsTpbElvwhPBj6MMKov5iH3h/jJ
	UadC8a9G7yt2gEfbyr8F1tTgTHB6qHC7RJk8ibXuiHevE6wqDNKybimS8gSHuvW1gRCM6ANzMLami
	At3WGqv3Fv/5xo2kS9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcFs-00D6Ax-UX; Sun, 10 Jul 2022 19:06:08 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcFp-00D66Z-Cb
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 19:06:07 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 098513F496
	for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657479959;
	bh=AU84a54LMQtAp4Bbn2Cb/ADxUGGKmX/FMvyOTlD3ev0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=R38ZHDBHtKWLd/c1tZ9xKRb0xBTnMS3JGZdidMJ9IVC+yzbes3diVbMUhdtEQpXYH
	 SL6QmBUmuHwIjbEhfQBfRdOrFyZ4RDbahBH313tUX7Ydz5POxjYOW6SsHgQTJufk0Z
	 YsK5WI7V9IbfVA6xg2CgaoQLirl4O/qUxORtMqx247Y0D+vj28qHhcuhiHVFo/d+Mp
	 8AhiNGzSrCoEU+eVeknNcCWviz35vDfTjqRglUYoemI3OrrA1Zr78X1EIwr9nx9LWs
	 CU5w9H4DbSw4u1x9M1OyXg1XJlcWi380A1q2cjr52Eoa2/fNsw2Q7gJj7mVOPrrMTP
	 LWOpJxZLj3MjQ==
Received: by mail-wm1-f70.google.com with SMTP id m20-20020a05600c4f5400b003a03aad6bdfso1827405wmq.6
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 12:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=AU84a54LMQtAp4Bbn2Cb/ADxUGGKmX/FMvyOTlD3ev0=;
        b=7FKXwUth6rzkH0aCq0HhtXbll1/Wj2Rq5SV5CgSfyVms6RHv1sRV1yVcH2Sk/vsS+4
         qdoZvYurDXkLwW4nRNnQTmRx19y/flu5iyLDIWV9Qq75QL7sGQItZOJLGIHZimrzUmaZ
         5v87a/yjCwPVN/64P5DCCTM0uIFLhXo5R85YiC3s1HaFk3YAZ4D3SMarGoZMP+PZtr+X
         lddN3JDjhiCWz+/d9yod57q22IOQJe8KYthnmVxXoJDHRFSFKxjTqF+Ln0Gc7+hPsj5Y
         yflCdWweVN5n4UWG8AIB+W2iuV+4nZ/vXx0ET7I55CZGoUGV9cIAd6MTdt+2QeY64ePG
         pk5w==
X-Gm-Message-State: AJIora/mM+FR3CNI7H6muS76/9o+rD6fGgYiJwSSBSJQw0islOtAeSuL
	qm7roCiwCBH5rAzjYZYeFtXPilMEQ57W3nhnjQNLUY0ukYsuWahpsi4ZjqxNEUoVe81nUutJf7H
	z07MZZSoVwT0SUivkancpCxXEimJyc1bq8pLAqHcx+lQhUQ==
X-Received: by 2002:adf:9d82:0:b0:21a:3906:59cc with SMTP id p2-20020adf9d82000000b0021a390659ccmr13390627wre.289.1657479957816;
        Sun, 10 Jul 2022 12:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTmcZGS2GmMhtTGPs6e5tbzWV9u22k/C3/DFFLtfaa1HhYBjA1R2z3j5+wfx5jO4c3eS1COA==
X-Received: by 2002:adf:9d82:0:b0:21a:3906:59cc with SMTP id p2-20020adf9d82000000b0021a390659ccmr13390612wre.289.1657479957561;
        Sun, 10 Jul 2022 12:05:57 -0700 (PDT)
Received: from [192.168.123.94] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm6889262wms.13.2022.07.10.12.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 12:05:57 -0700 (PDT)
Message-ID: <c7093349-1a1e-bbad-d7bc-57056008e63c@canonical.com>
Date: Sun, 10 Jul 2022 21:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by
 kvm_riscv_check_vcpu_requests()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20220710151105.687193-1-apatel@ventanamicro.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220710151105.687193-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_120605_594806_54F8A7BA 
X-CRM114-Status: GOOD (  21.71  )
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

On 7/10/22 17:11, Anup Patel wrote:
> The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
> and for KVM_REQ_SLEEP request it will block the VCPU without releasing
> SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
> other VCPUs of the same Guest/VM to hang/deadlock if there is any
> synchronize_srcu() or synchronize_srcu_expedited() in the path.
> 
> To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
> read unlock before blocking the VCPU and do SRCU read lock after VCPU
> wakeup.
> 
> Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
> requests handling")
> Reported-by: Bin Meng <bmeng.cn@gmail.com>

Thanks Anup for resolving the problem originally reported in

https://lore.kernel.org/all/5df27902-9009-afb9-68d3-186fdb4e4067@canonical.com/

Thanks to Bin for his analysis.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

With this patch applied to Linux v5.19-rc5 I am able to run U-Boot 
qemu-riscv64_smode_defconfig on QEMU 7.0 with

qemu-system-riscv64 \
-M virt -accel kvm -m 2G -smp 2 \
-nographic \
-kernel u-boot \
-drive file=kinetic-server-cloudimg-riscv64.raw,format=raw,if=virtio \
-device virtio-net-device,netdev=eth0 \
-netdev user,id=eth0,hostfwd=tcp::8022-:22

and load files from the virtio drive.

Without the patch virtio access blocks:

[  +0.102462] INFO: task qemu-system-ris:1254 blocked for more than 120 
seconds.
[  +0.004034]       Not tainted 5.19.0-rc5 #4
[  +0.001145] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  +0.002189] task:qemu-system-ris state:D stack:    0 pid: 1254 ppid: 
1068 flags:0x00000000
[  +0.001546] Call Trace:
[  +0.000389] [<ffffffff806b1340>] schedule+0x42/0xaa
[  +0.008026] [<ffffffff806b6164>] schedule_timeout+0xa0/0xd4
[  +0.000086] [<ffffffff806b1c0a>] __wait_for_common+0x9a/0x19a
[  +0.000057] [<ffffffff806b1d24>] wait_for_completion+0x1a/0x22
[  +0.000053] [<ffffffff80063a88>] __synchronize_srcu.part.0+0x78/0xce
[  +0.000049] [<ffffffff80063b00>] synchronize_srcu_expedited+0x22/0x2c
[  +0.000474] [<ffffffff01417560>] kvm_swap_active_memslots+0x12e/0x170 
[kvm]
[  +0.000864] [<ffffffff01419ad2>] kvm_set_memslot+0x1e8/0x388 [kvm]
[  +0.000267] [<ffffffff01419da6>] __kvm_set_memory_region+0x134/0x2f8 [kvm]
[  +0.000439] [<ffffffff0141d412>] kvm_vm_ioctl+0x1fc/0xba0 [kvm]
[  +0.000232] [<ffffffff80176af0>] sys_ioctl+0x80/0x96
[  +0.000129] [<ffffffff800032d2>] ret_from_syscall+0x0/0x2

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kvm/vcpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b7a433c54d0f..5d271b597613 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>   
>   	if (kvm_request_pending(vcpu)) {
>   		if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
> +			kvm_vcpu_srcu_read_unlock(vcpu);
>   			rcuwait_wait_event(wait,
>   				(!vcpu->arch.power_off) && (!vcpu->arch.pause),
>   				TASK_INTERRUPTIBLE);
> +			kvm_vcpu_srcu_read_lock(vcpu);
>   
>   			if (vcpu->arch.power_off || vcpu->arch.pause) {
>   				/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
