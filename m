Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC08FCCD1A3
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgQzRS33DI7XXJ4ZqonYUoaqPi2j/Vlv9mQYAG0sh/k=; b=EjvwjVACLpfhCQ
	AFP3xHsC624A19D9kKUxjMKt4pIooDdNftg2uiOdhyJuDtX7wk0DEIwque5I5ztgbt8zqnyV8N4oS
	eLt+V5pINV4dOhPDJ7Wwij4b7TWfTlAeB4RFsWrAJe86B6pcnWTCyZdLHycT8D+v+PVjg5hnQ+bV0
	jUYLonk4mcuhuwxKL2wUPEO4jVShos+W6s5CkhoXN8L8If5iVj4KaEtCWjJhph45ZYspekWmEk8xL
	/fzZWyaDn7XgarCTP3LOe0VSRvcba0EJvIA9Q6dUWpcWDB8pe8x8S8rebz56bKbJbfFhOwlGz1PP6
	8hFE38yoF8Lvqr2Un7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1squOF-00000008IQb-0gbb;
	Wed, 18 Sep 2024 13:06:39 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1squOB-00000008IPv-0MWO
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 13:06:37 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 641D23F664
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1726664792;
	bh=8l2x542gYIchymchoFuMWg32uMUCoYpfBV/jXlvRWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=PG7SvGYRuAHjL/d5F0CeYdwgdrZJZ09hIvIBF+xe6dHYse1SZgAFUxvqeUJJgoxrF
	 xHEbXKid76HeNo1FkhEYH7sFO6+zlwpmzprUmE2C7BQpfZe6kovI6RiF99D1K0pOnM
	 MKO1QLYKvvJE4y/c/HyzLtIc6y8vBjoA0c+rnAJwve8U4ChL6ClZYsWZ+lk7O7bxic
	 dAKzXY9o0rRbfornP+y0jlcI0qaYcAsxbSMp8Mfviq/+ircRLev6zCxJUdJbXdAYUJ
	 VE/sBDEsbFu+GnFHlmOgrOYSJpGHgp65bdMy/fAhnQlv+n7w3VN3IfNVpPLjghgNrU
	 aXNLWxfu2KYLw==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42cb89fbb8cso44310125e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 06:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726664792; x=1727269592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8l2x542gYIchymchoFuMWg32uMUCoYpfBV/jXlvRWAk=;
        b=rgwv4UXr/AReb2DY7AavnfQ4pY2wWtFcv6q+XaI5JObvCqBFYdieBW7pqhkQcjMiix
         7e7R/jg3dRxbvTsmITJCAuUtoDeZ4FOQ9HsCYmOX/Yhjuqu9+tzaxolHxcAHO+yOitvn
         lrmcmsRpZnHBMWQikihU5EunNppuKsQvA2fKDc+r3+ahLM1pAUluP5C/mzB3bp/A6SQf
         +aqyJGSqRLsoYVEtNEVodXmIvMs7xDDFZFETAPVmDlMNWeiNJLTBwVtMn4X3rkQnuvpn
         6wt3wneBx4IJBOtL3snZHWx6RWNGNE5zRKVKn8jJsMr4QQLsGnrGVO5W+ub+3RvXLthI
         3lBw==
X-Forwarded-Encrypted: i=1; AJvYcCWh4DUFnYtzdfBMuvoZk4Y3O9WADvqSa6JFN3cxNovTlAdJOjrb1UGeugy97MJsG+BEDLoaOLWAseFKKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuL5ecQ/km2ZpmiSW21gsN4IZadxH1ZDEZZlCi1aaWMIFPnhg5
	Azx/TLnsi0RiwuiCP0VRGrCxYnq+VPhkYnaf9q2s/PzZKXgoeBkTRaWFlvDNbNVwFzkrFzXzg80
	w4UQ1aXOaFFreoxi3iowwdlMV/UJTdf0sbuxnexlv37JfWIDrFnW6zORFTT+2JBcW6ZlTvjHx5g
	oeiQTIUQ==
X-Received: by 2002:a05:600c:511b:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42cdb5317cbmr172610065e9.14.1726664791865;
        Wed, 18 Sep 2024 06:06:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENUt5bat+VyuH/X8ftjxUcPkWydjb9viwhSYt5aRmGL/qmuhxrHiMPPpyLNd/r+qN+rQ2zTw==
X-Received: by 2002:a05:600c:511b:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42cdb5317cbmr172609685e9.14.1726664791267;
        Wed, 18 Sep 2024 06:06:31 -0700 (PDT)
Received: from [192.168.103.101] (dynamic-046-114-111-082.46.114.pool.telefonica.de. [46.114.111.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f99b0sm12303634f8f.60.2024.09.18.06.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 06:06:30 -0700 (PDT)
Message-ID: <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
Date: Wed, 18 Sep 2024 15:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_060635_568041_DDD6214B 
X-CRM114-Status: GOOD (  24.92  )
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

On 18.09.24 13:10, Peter Maydell wrote:
> On Wed, 18 Sept 2024 at 07:06, Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Tue, Sep 17, 2024 at 06:45:21PM GMT, Heinrich Schuchardt wrote:
>> ...
>>> When thinking about the migration of virtual machines shouldn't QEMU be in
>>> control of the initial state of vcpus instead of KVM?
>>>
>>
>> Thinking about this more, I'm inclined to agree. Initial state and reset
>> state should be traits of the VMM (potentially influenced by the user)
>> rather than KVM.
> 
> Mmm. IIRC the way this works on Arm at least is that at some point
> post-reset and before running the VM we do a QEMU->kernel state
> sync, which means that whatever the kernel does with the CPU state
> doesn't matter, only what QEMU's idea of reset is. Looking at the
> source I think the way this happens is that kvm_cpu_synchronize_post_reset()
> arranges to do a kvm_arch_put_registers(). (For Arm we have to do
> some fiddling around to make sure our CPU state is in the right
> place for that put_registers to DTRT, which is what kvm_arm_reset_vcpu()
> is doing, but that's a consequence of the way we chose to handle
> migration and in particular migration of system registers rather than
> something necessarily every architecture wants to be doing.)
> 
> This also works for reset of the vCPU on a guest-reboot. We don't
> tell KVM to reset the vCPU, we just set up the vCPU state on the
> QEMU side and then do a QEMU->kernel state sync of it.
> 
> -- PMM

Thanks Peter for looking into this.

QEMU's cpu_synchronize_all_post_init() and 
do_kvm_cpu_synchronize_post_reset() both end up in 
kvm_arch_put_registers() and that is long after Linux 
kvm_arch_vcpu_create() has been setting some FPU state. See the output 
below.

kvm_arch_put_registers() copies the CSRs by calling 
kvm_riscv_put_regs_csr(). Here we can find:

     KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);

This call enables or disables the FPU according to the value of 
env->mstatus.

So we need to set the desired state of the floating point unit in QEMU. 
And this is what the current patch does both for TCG and KVM.

Best regards

Heinrich


$ qemu-system-riscv64 -M virt -accel kvm -nographic -kernel payload.bin
QEMU qemu_init: Entry
QEMU qmp_x_exit_preconfig: Entry
[ 3503.369249] kvm_arch_vcpu_create: Entry
[ 3503.369669] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.369966] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.370256] kvm_arch_vcpu_create: Exit
[ 3503.378620] kvm_arch_vcpu_create: Entry
[ 3503.379123] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.379610] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.380111] kvm_arch_vcpu_create: Exit
[ 3503.394837] kvm_arch_vcpu_create: Entry
[ 3503.395238] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.395585] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.395947] kvm_arch_vcpu_create: Exit
[ 3503.397023] kvm_riscv_vcpu_set_reg_config:
[ 3503.398066] kvm_riscv_vcpu_set_reg_config:
[ 3503.398430] kvm_riscv_vcpu_set_reg_config:
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU qemu_machine_creation_done: Entry
QEMU qdev_machine_creation_done: Entry
QEMU cpu_synchronize_all_post_init: Entry
QEMU cpu_synchronize_post_init: Entry
QEMU kvm_cpu_synchronize_post_init: Entry
QEMU do_kvm_cpu_synchronize_post_init: Entry
QEMU kvm_arch_put_registers: Entry
QEMU kvm_riscv_put_regs_csr: Entry
QEMU kvm_riscv_put_regs_csr: Exit
QEMU kvm_arch_put_registers: Exit
QEMU do_kvm_cpu_synchronize_post_init: Exit
QEMU kvm_cpu_synchronize_post_init: Exit
QEMU cpu_synchronize_post_init: Exit
QEMU cpu_synchronize_all_post_init: Exit
QEMU qemu_system_reset: Entry
QEMU kvm_arch_get_registers: Entry
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU cpu_synchronize_all_post_reset: Entry
QEMU cpu_synchronize_post_reset: Entry
QEMU do_kvm_cpu_synchronize_post_reset: Entry
QEMU kvm_arch_put_registers: Entry
QEMU kvm_riscv_put_regs_csr: Entry
QEMU kvm_riscv_put_regs_csr: Exit
QEMU kvm_riscv_sync_mpstate_to_kvm: Entry
QEMU kvm_riscv_sync_mpstate_to_kvm: Exit
QEMU kvm_arch_put_registers: Exit
QEMU do_kvm_cpu_synchronize_post_reset: Exit
QEMU cpu_synchronize_post_reset: Exit
QEMU cpu_synchronize_all_post_reset: Exit
QEMU qemu_system_reset: Exit
QEMU qdev_machine_creation_done: Exit
QEMU qmp_x_exit_preconfig: Exit
QEMU qemu_init: Exit
QEMU kvm_cpu_exec: Entry
[ 3503.566493] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
QEMU kvm_cpu_exec: Exit
QEMU kvm_cpu_exec: Entry
[ 3503.568338] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[ 3503.568740] kvm_riscv_check_vcpu_requests: Entry
[ 3503.569534] kvm_riscv_check_vcpu_requests: Entry

Test payload
============


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
