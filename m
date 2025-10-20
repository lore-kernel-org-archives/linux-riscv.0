Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D72CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abWg4GWAbFv7aVRO3ncxeUG3n6RkiuVCyLvSoHxJkrE=; b=iDpz3unEuzJDrJ
	ZKazjHXUsbWrqDpo8ZR+1/coVGHaqCYRPeRl/x0EuY9cWKaRI4iVkq+HZZEdKtR4BXq907iczlVLv
	HknaryqpmsKEURYV2gG48lQ78TAOctr3SWmUV6UERxfK4cZJXaEDxEWawAAlEBQ5NE3UJm16gmXHl
	QOXbDEXNAkWlTi0vPMWjvt1mxw97djEyNONl5HVGBNG2/7gA8d6u7fJuRPZf/0XT+aMkZZpyzAwDr
	fTJS9ik4mpAE9sS7YaVrfkUZpqzgPZXLiNzkuTcRXcP9HxABSr++P59f3bx8iew4SsyWlVOoYezHZ
	1bgwbq5xGRDRXAA5plZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmw-0000000Eomu-3yd0;
	Mon, 20 Oct 2025 19:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmv-0000000Eolc-0ktR
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hM5MMLXsYM69EBdIPQteBCdcHt+2UMoOmn9dDxRhd44=; b=Z9zncQgpD15AiorxYyvOjMQ53S
	WfBa73xGy4pP/NYBWyJXTKySaLl14L07EVdRiSD2R6NJfZWpgjVF2WoP5UHx3jIGzTsk7tC0vII8S
	jcmPCRynX4D5hCqPMKmC0YXrxthDiQ6WAwTAWvgAuPJPnzwEH4mhPGorFleC9G1IIGVUSGOvGsKOG
	dwFCg65lPLNEG0GydiaR4TOGZJKiukIsrlBnD28RCfNsoGMV13bvW3p9925v0/LUS9ZefKAvV6PrC
	62jbWOT2NpamYcPQwM3IJI/fjCyg1E2qVlUCChnXCFumGtcOiAwdRZbp6JALD7tmMqIWuI4mi9/uO
	iW7rjUbw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuvB-00000000Ag3-3VKg
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:47:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-781206cce18so4848727b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 12:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760989400; x=1761594200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hM5MMLXsYM69EBdIPQteBCdcHt+2UMoOmn9dDxRhd44=;
        b=a2k2NmkcuVARtZh2tFVvBlfGQWG5uPkV3ZMdR17V/32CbWRzgG9U9NAp7EggcYiTSd
         lfSVs2wNWuaxRnQ3Xs5YgiAckXhy/dV25aZTIDvMdcJapKuBuY6EtHdAR1oH31M8XWuB
         dJJs19ovLwiv3kStKTJLo4G/GbSIBtI/IamJHUVQ+iPZQH4Wb88dsFWQSD3jg7v2PwoQ
         I1LPqSbwgvOv2/8E1PiGkz0G9ksM/6iWr8cVjTMmYAOkvoKtz288weOnwX58rRbUQFcw
         Quz+ZTER80rL4dTQKczI4hZ9qszvYwMq5vxa5qtR2oFZSmRwlMy6PUlJAR/OnncBHxpU
         5CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989400; x=1761594200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hM5MMLXsYM69EBdIPQteBCdcHt+2UMoOmn9dDxRhd44=;
        b=VAnXSTw4rBjXFL6boOQxYVocVtJVS40fLdBDmdGa+KsaXeKIW5thFGDAQPMEOmhbMT
         plSbLZcw+8CFwWvFGBHfKkTSifBPDRclIOl+d0fWoZa7z50l6E7RavEH1FDRIwTI6xNu
         ZIy4uYSsu8qa/FLvefARvLW7qGkSQdfj3Q27VeAdEnWg0GSnQV2oyIZ7DnqMA4Ch6c3o
         nLy88dzGOe7c53nErXtui6PKpYTh5+xYk1kf1lH6A2BYgGVLI9/Fb81lolu/RF8i8ieF
         9/CzfCbf4nlsebkSCeiC7SbU3kk2ORQLvx+YILQF4Fp6vHs30IoCLiT27vz4t0/g4agr
         M1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHYaDgkrMkPtjZMVv+R+rA5n6nuayyakaAxNkDggc3clXMx6IB4KjY1GQMKkNVfWY64iKj5oHhRNj9Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx487ocXXX+Zc+scMx5lgN6aGQCmwg6SFWM1O+QCWclLtKlAHhT
	/ZgxJGYMIFUEYVIMAFTQeg+2kF9bo9/a6Hcwe9bgAvnEG1rhO38QJrXLAduG8Z8kbv8=
X-Gm-Gg: ASbGnctWOmUvs3uLtE8Xm4da6M1v4dqYxS2whsGzUnt4ZLDAcSrVJtTqwxTXP70A1In
	kv6XghhPKWnvXTVgUIyy9oYiDndPYYg5i/II6WaAIgWLz2wk1trbcWysAVLGRUpda5f4tK8vHWL
	Cqu3htaxVPAt7X6a9MGX7kP17xqHRR/S3yQ3ANFH4f2gR9HJbCv4FobbeMrTr3S1qHiV+uxgRqw
	8J5EUYs2+C9rAYJtKLAkj5O1iRg9R4KFb3WwjuFBKi84g/haIweGXNYGUXs8/9jtM+s4T+0cLQS
	MbysCcn0wdZDSHPrXSbVSEhviyCZGDA/jmqC7DXKHkmOcROHUGZbtojtG4ZGHDD9h4sZtFnZ9FF
	G+Ok1M6FCFX/ENAlE+rqExw65w5/obEYIh+XeN94KdcwNH3PiSeFavQZSXLXc7dcb/V/X3CTa++
	ldUc6AfAbjFYCX9Ag9uQ0K++u66JCqLJNfFXE9FgFS+pQ9YgAIaiac9A==
X-Google-Smtp-Source: AGHT+IEz0c9auRC0TwjskGJJcvcC5ayj8gqgof4QV51C8KuJdIiqhiUNN8QL7OYGY673kk8y9oGq8A==
X-Received: by 2002:a05:6a00:784:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-7a210d8ffd0mr15317951b3a.1.1760989399677;
        Mon, 20 Oct 2025 12:43:19 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030? ([2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff158f8sm9251975b3a.8.2025.10.20.12.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:43:19 -0700 (PDT)
Message-ID: <ca6a8e5a-f14d-4017-90dc-be566d594eee@ventanamicro.com>
Date: Mon, 20 Oct 2025 16:43:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 pbonzini@redhat.com, jiangyifei@huawei.com
Cc: guoren@kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_194753_994395_95C5B80F 
X-CRM114-Status: GOOD (  18.94  )
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



On 10/20/25 10:08 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
> vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
> regions. Using vma->vm_pgoff to derive the HPA here may therefore
> produce incorrect mappings.
> 
> Instead, I/O mappings for such regions can be established on-demand
> during g-stage page faults, making the upfront ioremap in this path
> is unnecessary.
> 
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---

Hi,

This patch fixes the issue observed by Drew in [1]. I was helping Drew
debug it using a QEMU guest inside an emulated risc-v host with the
'virt' machine + IOMMU enabled.

Using the patches from [2], without the workaround patch (18), booting a
guest with a passed-through PCI device fails with a store amo fault and a
kernel oops:

[    3.304776] Oops - store (or AMO) access fault [#1]
[    3.305159] Modules linked in:
[    3.305603] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4 #39
[    3.305988] Hardware name: riscv-virtio,qemu (DT)
[    3.306140] epc : __ew32+0x34/0xba
[    3.307910]  ra : e1000_irq_disable+0x1e/0x9a
[    3.307984] epc : ffffffff806ebfbe ra : ffffffff806ee3f8 sp : ff2000000000baf0
[    3.308022]  gp : ffffffff81719938 tp : ff600000018b8000 t0 : ff60000002c3b480
[    3.308055]  t1 : 0000000000000065 t2 : 3030206530303031 s0 : ff2000000000bb30
[    3.308086]  s1 : ff60000002a50a00 a0 : ff60000002a50fb8 a1 : 00000000000000d8
[    3.308118]  a2 : ffffffffffffffff a3 : 0000000000000002 a4 : 0000000000003000
[    3.308161]  a5 : ff200000001e00d8 a6 : 0000000000000008 a7 : 0000000000000038
[    3.308195]  s2 : ff60000002a50fb8 s3 : ff60000001865000 s4 : 00000000000000d8
[    3.308226]  s5 : ffffffffffffffff s6 : ff60000002a50a00 s7 : ffffffff812d2760
[    3.308258]  s8 : 0000000000000a00 s9 : 0000000000001000 s10: ff60000002a51000
[    3.308288]  s11: ff60000002a54000 t3 : ffffffff8172ec4f t4 : ffffffff8172ec4f
[    3.308475]  t5 : ffffffff8172ec50 t6 : ff2000000000b848
[    3.308763] status: 0000000200000120 badaddr: ff200000001e00d8 cause: 0000000000000007
[    3.308975] [<ffffffff806ebfbe>] __ew32+0x34/0xba
[    3.309196] [<ffffffff806ee3f8>] e1000_irq_disable+0x1e/0x9a
[    3.309241] [<ffffffff806f1e12>] e1000_probe+0x3b6/0xb50
[    3.309279] [<ffffffff80510554>] pci_device_probe+0x7e/0xf8
[    3.310001] [<ffffffff80610344>] really_probe+0x82/0x202
[    3.310409] [<ffffffff80610520>] __driver_probe_device+0x5c/0xd0
[    3.310622] [<ffffffff806105c0>] driver_probe_device+0x2c/0xb0
(...)


Further debugging showed that, as far as QEMU goes, the store fault happens in an
"unassigned io region", i.e. a region where there's no IO memory region mapped by
any device. There is no IOMMU faults being logged and, at least as far as I've
observed, no IOMMU translation bugs in the QEMU side as well.


Thanks for the fix!


Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



[1] https://lore.kernel.org/all/20250920203851.2205115-38-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/




>   arch/riscv/kvm/mmu.c | 20 +-------------------
>   1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 525fb5a330c0..84c04c8f0892 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -197,8 +197,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>   
>   	/*
>   	 * A memory region could potentially cover multiple VMAs, and
> -	 * any holes between them, so iterate over all of them to find
> -	 * out if we can map any of them right now.
> +	 * any holes between them, so iterate over all of them.
>   	 *
>   	 *     +--------------------------------------------+
>   	 * +---------------+----------------+   +----------------+
> @@ -229,32 +228,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>   		vm_end = min(reg_end, vma->vm_end);
>   
>   		if (vma->vm_flags & VM_PFNMAP) {
> -			gpa_t gpa = base_gpa + (vm_start - hva);
> -			phys_addr_t pa;
> -
> -			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
> -			pa += vm_start - vma->vm_start;
> -
>   			/* IO region dirty page logging not allowed */
>   			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>   				ret = -EINVAL;
>   				goto out;
>   			}
> -
> -			ret = kvm_riscv_mmu_ioremap(kvm, gpa, pa, vm_end - vm_start,
> -						    writable, false);
> -			if (ret)
> -				break;
>   		}
>   		hva = vm_end;
>   	} while (hva < reg_end);
>   
> -	if (change == KVM_MR_FLAGS_ONLY)
> -		goto out;
> -
> -	if (ret)
> -		kvm_riscv_mmu_iounmap(kvm, base_gpa, size);
> -
>   out:
>   	mmap_read_unlock(current->mm);
>   	return ret;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
