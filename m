Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56939CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jvftiIF7s1MDcvVJg7C9RE9lRLm+xqm3QQbwR/hUwo=; b=rrUO19YO+iq05D
	4FnIyiG6MD58SAT8+KDkx8jMHWju2Chg8SbgLn0wBoUCU2G6aikM3TXow9MAk1j+F3QOxYkr6w0j5
	BMOSdwuxMU/ulj2TrndYXjAIj5cvgvqSEuVvcAbz66km72KT1+iYNqRPYyEG6KOrTh1Lm8r0ZbfUu
	i/Wa9859kgMLeXMjiFV/GZR0QVtJq7csYMyNc+yGzZ5oqcwa6mqkNtuxfk1PKRjWeSs/8aMejdepo
	VRy2Bmp1w2jStvtvgeamiXZZbz4iKhRI3L7HGADtuB8gPwKRvzDmBzsExehb306MWkHUarkV2JW+q
	ZbQRs8ojf/NoH+nbMVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvqj-0000000EpVb-0QPG;
	Mon, 20 Oct 2025 19:47:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvqh-0000000EpUz-2fTL
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T29G72fExJyk8VtqV3YJi7ZBrueGLIkeAq2lMcMuWYA=; b=QOEiE1BdBLIvE5QTW5BCTExRvL
	1SNWFOzgmxOP7xa1jf7NRlF0akSEavxXqnTEqOZe5qZg9x3Jo452Og7E/IAr9/9NzXtAKoHEI27zH
	1YtXq0hFJL93Z2sg6WFW8SmPDblptcNgZWvZbczZCvUsp4SH7coHFqiCVxVTpGHEhlItKyY83GY+m
	RZ2l9vHuHWPfm/hSljw98a4OQDhdA2i8cT/vXgV2uSDQaV3db8WqY1P5E4OmTfvQ47Gw/CgtwlNwR
	K3Vl1X1ksUnNHGFak/VOy4QrZuzEg4PpDc4EbbFE/aS4zBeskiaMhgJVj0JE4Xv125wmYX8SpnQxl
	H5JosZMQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuyy-00000000B6h-13yJ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:51:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33ba38ed94eso5210967a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760989635; x=1761594435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T29G72fExJyk8VtqV3YJi7ZBrueGLIkeAq2lMcMuWYA=;
        b=dljiuWTnfVSe2W9hWExSlw/liAVaw6Pt//0lIQHvWA3iW55/tpclKS+sOko+bsE+eX
         Kw9OmZCtnXdcK6ls3x0gHhVeWjraCFyE1Jp6vJ9FN8Lxb1W9+TT8JZJ3TH2gAe8Lkzq5
         94GBCLpfVCSX1tiUv0Ms8jEr9YXtduQWh31S6hcNDBgMXqYXTJHM4mcgDo15FXi1CR/o
         6+aCk41/tI0mVtwCQCUqo7DwWj5HTDkxfJxY0HkFIkNgFlzJ+SgH0VGc2YH63dkSlw60
         3kCGK9D81N/tAZ4uAP1dJT0guczbRa7XHViaW3u1RXj9k6WIRIgQ/EQnE5pb/CpjM5r0
         cagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989635; x=1761594435;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T29G72fExJyk8VtqV3YJi7ZBrueGLIkeAq2lMcMuWYA=;
        b=Rm/K2qCiPiG/kq7Tt9T7YS2JMQpZaq5h/agskioyLfFrqcrfGpA3TeP7Ng/4t0zahI
         XLVfSv4E31x9+Cv7gjvgKTDXihkO6YZLG709npwUaoKy1WhnqVtJi/4OVptjTZvdoq2X
         1mUCt8xDuFcUE4pfvNkilMF8cm/JhvoM1hTSTs5o8Oj/RovgDGy8iZELqd5JCGx1mM9S
         31wYdzBWexzj4oxCfFeF/oB6RSJEj6C/NiNDv9NPyP3fqj4hOpoZlkS3AZRUoge09r9J
         43s+9WBT+deZZWFJ7nYnz9RHLalUU2tgTgp03Jq8mwLfY90nC43LDU1dVYBE74GBVyNU
         AXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8ioscbboERHS9kVIR1mlOtdi4pAgqxUtYtHVwApuK3F5cxBq6YDQ7EF8jdM+Cyil6jKC+8vImDo6SmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxA2voPTG4LXMiDbqFop+NtOGnvo+L0XnFS5TkE2dL8oyOPK/G
	XNLToWJhfKZzsyGE6AbNGLvokq9Qam5PbkpDOz5OnFZW1QB0bp0G3mSLBoym4aXn6UQ=
X-Gm-Gg: ASbGnctoTLy1YLp0t2C95tITNfa3Fx0lRmZpWpg4Q9bejqiXXVPYz8QCw90Zn2xUVjF
	lqIrO3IA9n8/lRA6fbO/tgLCjIHjbd8T/MtXQ26vFMgvPP74aivvMcw1kHvJr3zlKDgeBQdGKmM
	fd2EkC6Nkxz+G64TC/mBlEm2TWIuFb9K/Pltf6PXvgY9k31oZcnom2fsIH8TsVsxCuz4lG7S30x
	5MIiUXhBeKUgehO98KTgR/7tXwD8sTfkhl9P1NbzH2+L+TazcnhBH3IjCE4LSsCccMllKuvAqZn
	JKBnMBCTprvDpoOGIOe6syX1lYBZ1oSJshybDTLPKMgY4GKX7tLMcqJIJqkalVs7VUKNXeVBOqY
	GeSn+4kGBCJwqFPY1UhtqP+aBbBg9oMhApj/kePABi+o2m2o9dh5yJF923JHQjEUifLG+64IxyN
	9Zix/BIXdone+hEPHv/+XATt+M2NCu59l5RCLMoea4F3t1hkQLmnpJwNynTB2FmCeO
X-Google-Smtp-Source: AGHT+IHbuqXK1u6LquvMt8XAnfwihmyV2uHtYn9qEdWcAtI1wb6x8mv/e+BQVy3+n2euvz+X557SNA==
X-Received: by 2002:a17:902:e88e:b0:290:a3b9:d4be with SMTP id d9443c01a7336-290c9ce63cbmr161125965ad.24.1760989634647;
        Mon, 20 Oct 2025 12:47:14 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030? ([2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd5d76sm88303565ad.39.2025.10.20.12.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:47:14 -0700 (PDT)
Message-ID: <4d1e8b55-e404-466b-a2d6-b189de910637@ventanamicro.com>
Date: Mon, 20 Oct 2025 16:47:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 18/18] DO NOT UPSTREAM: RISC-V: KVM: Workaround
 kvm_riscv_gstage_ioremap() bug
To: fangyu.yu@linux.alibaba.com, ajones@ventanamicro.com
Cc: alex.williamson@redhat.com, alex@ghiti.fr, anup@brainfault.org,
 atish.patra@linux.dev, iommu@lists.linux.dev, jgg@nvidia.com,
 joro@8bytes.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com,
 tglx@linutronix.de, tjeznach@rivosinc.com, will@kernel.org,
 zong.li@sifive.com
References: <20250920203851.2205115-38-ajones@ventanamicro.com>
 <20251020131218.68932-1-fangyu.yu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251020131218.68932-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195148_494953_5E79D063 
X-CRM114-Status: GOOD (  15.16  )
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

Drew,

On 10/20/25 10:12 AM, fangyu.yu@linux.alibaba.com wrote:
>> Workaround a bug that breaks guest booting with device assignment that
>> was introduced with commit 9bca8be646e0 ("RISC-V: KVM: Fix pte settings
>> within kvm_riscv_gstage_ioremap()")
> 
> The root cause of the guest booting failure is that an HPA is obtained
> in the kvm_arch_prepare_memory_region.
> 
> Here [1] might be the correct fixes for this issue.
> [1] https://lore.kernel.org/linux-riscv/20251020130801.68356-1-fangyu.yu@linux.alibaba.com/T/#u

This patch fixes the issue we've been seeing with device assignment inside a
kvm guest. I suggest folding it into this series and dropping this workaround
patch in the next version.


Thanks,

Daniel


> 
>> ---
>> arch/riscv/kvm/mmu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>> index 525fb5a330c0..994f18b92143 100644
>> --- a/arch/riscv/kvm/mmu.c
>> +++ b/arch/riscv/kvm/mmu.c
>> @@ -56,7 +56,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>>
>> 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>> 	pfn = __phys_to_pfn(hpa);
>> -	prot = pgprot_noncached(PAGE_WRITE);
>> +	prot = pgprot_noncached(__pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ | _PAGE_WRITE));
>>
>> 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
>> 		map.addr = addr;
>> -- 
>> 2.49.0
> 
> Thanks,
> Fangyu
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
