Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F354ACD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6QgZ+JdZwVoIY9889jv6N9QuLRm1TFORTnZp+V9YFM=; b=moY0eJrhrl4c4a
	aBGMdmL/CD3H6d0YQ1GNJGOU3HNKfm7o2OvpAaQYbqnM0DlGhlBZFSzd3j3cb7tyczq5MJ5vSLMc4
	EaPujOaxXsVMDFT990VKccMScvQ/HzrSkAhBg7Ef4KCV04SyAKsIakHNaYK7zMG2OdM2b/nA8/rDa
	hGLzaOrJadLfGCzaQC+Uc5JxZr71HWKlnnuYt9R4Mf/2xIIMbdewi9hvwvWbaeimWoZr750fEiCsx
	kEfAFiEBfvu5Li/och6AZcWiwMjYnPKMpPT2gRIGb1aBKo4OILImFgbRh6OFjdeI98Qionn8R02ff
	U3yxa+lO9pgiD9srNrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSM2-00000003xGT-0UhA;
	Thu, 04 Apr 2024 19:02:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSLx-00000003xEy-3f0P
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712257344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IDcxlS8RojgeD/IGab9+Y1i9FcxVlQ2WZxdgyok4TGM=;
	b=STHBcDKuxN/CTdkwMroH4x0pNCFqov4XPNhzuiYsZPX17aF+v72XdcfuxMoSCi1jUILgLd
	VO5ymBfGyVE8rmsPa7mSNlYaWQa+ghwAV8RsPxrd7I8nohalLZ6uWKC4Y5XZBOw4YJH/9/
	wAcTitO1AsYhMJ879olXW57wSJKlDYk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Pi3wX5uGNw2EXXFqADLI7g-1; Thu, 04 Apr 2024 15:02:23 -0400
X-MC-Unique: Pi3wX5uGNw2EXXFqADLI7g-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-343da0a889dso110871f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 12:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257342; x=1712862142;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDcxlS8RojgeD/IGab9+Y1i9FcxVlQ2WZxdgyok4TGM=;
        b=AwH4N2U6SXjw5ujSMLn5HadgPjAyaDdYfPuC06OfUYAVAlrG1A5sN7KV+znvuEMvx/
         +DKy07qxdMnHN8E/3/TPUocvfh24u28nj0tS+lltQIF9RvzuOBz4UReWHg5xZKEalPzt
         5H3v+Cm/NltEk7B496IstMFsTmltjkk0p6BwNws34q6L5IMKlP+qCKU0UilrpZX7VNkf
         3/zLlgV0GL2zjmVAtA/FJ8rHe+yTJHdb7Zb48KzL1Gm0tSxWNpuiHFq1e8c9Bq+61byz
         /GhohBt8hpXuHerRDSD+ZF+ZNu+inQkwCk1RohWvenNqDQsgrunlrUy8HN4a2h0HImPV
         EzEw==
X-Forwarded-Encrypted: i=1; AJvYcCWCoXrV5WFsQXu1DWHxeZgweqOMif3zz65WiTteDaBdkTS4WfUtBveb5kqxm1PSih2UKwQ0Kj92c8XVmQu0TboYRonxbISRDx8bBfPbKP/l
X-Gm-Message-State: AOJu0Yzw1TuOwkcblXEy/D72wgczy8gxhnMXXrnD0BxxPG4T6PYbXaAK
	YVI25f6nY9IporIqwZAtVTq6tvvBzwt+x/GbFcBEB7enwK0Ah1WOmRJ5mETp1xjNlY3rE/5Ghsx
	SMM79lP6ZywxdwcIf8MexH6jE2QX59lDPtIzrcyDes88/yESdwh8q2vzKiZNybEzu/A==
X-Received: by 2002:adf:ec44:0:b0:343:9d4b:19b3 with SMTP id w4-20020adfec44000000b003439d4b19b3mr376491wrn.21.1712257341857;
        Thu, 04 Apr 2024 12:02:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc3F8jSmzcueZ4ylAzvl2l7H+r7gGFUado11QSdwSJjhCvanm86xwbQhGmWG7xABmEZT5p6A==
X-Received: by 2002:adf:ec44:0:b0:343:9d4b:19b3 with SMTP id w4-20020adfec44000000b003439d4b19b3mr376421wrn.21.1712257341428;
        Thu, 04 Apr 2024 12:02:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c743:de00:7030:120f:d1c9:4c3c? (p200300cbc743de007030120fd1c94c3c.dip0.t-ipconnect.de. [2003:cb:c743:de00:7030:120f:d1c9:4c3c])
        by smtp.gmail.com with ESMTPSA id m28-20020adfa3dc000000b003435e1c0b78sm84999wrb.28.2024.04.04.12.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 12:02:20 -0700 (PDT)
Message-ID: <c438ea3a-24bc-470b-a2eb-6e7517bd4362@redhat.com>
Date: Thu, 4 Apr 2024 21:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/29] mm: abstract shadow stack vma behind
 `vma_is_shadow_stack`
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
 rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
 kito.cheng@sifive.com, keescook@chromium.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 alex@ghiti.fr, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 samuel.holland@sifive.com, conor@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
 shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
 jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com,
 evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com,
 willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org,
 samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org,
 heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com,
 cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com, Mike Rapoport <rppt@kernel.org>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-10-debug@rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240403234054.2020347-10-debug@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_120226_035496_8C6ACA45 
X-CRM114-Status: GOOD (  22.25  )
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

On 04.04.24 01:34, Deepak Gupta wrote:
> VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow stack VMA.
> 
> This patch changes checks of VM_SHADOW_STACK flag in generic code to call
> to a function `vma_is_shadow_stack` which will return true if its a
> shadow stack vma and default stub (when support doesnt exist) returns false.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> ---
>   include/linux/mm.h | 13 ++++++++++++-
>   mm/gup.c           |  5 +++--
>   mm/internal.h      |  2 +-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 64109f6c70f5..9952937be659 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -363,8 +363,19 @@ extern unsigned int kobjsize(const void *objp);
>   
>   #ifndef VM_SHADOW_STACK
>   # define VM_SHADOW_STACK	VM_NONE
> +
> +static inline bool vma_is_shadow_stack(vm_flags_t vm_flags)
> +{
> +	return false;
> +}
> +#else
> +static inline bool vma_is_shadow_stack(vm_flags_t vm_flags)
> +{
> +	return (vm_flags & VM_SHADOW_STACK);
> +}
>   #endif

You can simply do outside the ifdef

static inline bool vma_is_shadow_stack(vm_flags_t vm_flags)
{
	return !!(vm_flags & VM_SHADOW_STACK);
}

This will work even when VM_SHADOW_STACK is defined to be VM_NONE.

>   
> +

unrelated code change

>   #if defined(CONFIG_X86)
>   # define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
>   #elif defined(CONFIG_PPC)
> @@ -3473,7 +3484,7 @@ static inline unsigned long stack_guard_start_gap(struct vm_area_struct *vma)
>   		return stack_guard_gap;
>   
>   	/* See reasoning around the VM_SHADOW_STACK definition */
> -	if (vma->vm_flags & VM_SHADOW_STACK)
> +	if (vma->vm_flags && vma_is_shadow_stack(vma->vm_flags))

Pretty sure:

if (vma_is_shadow_stack(vma->vm_flags))

>   		return PAGE_SIZE;
>   
>   	return 0;
> diff --git a/mm/gup.c b/mm/gup.c
> index df83182ec72d..a7a02eb0a6b3 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1053,7 +1053,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>   		    !writable_file_mapping_allowed(vma, gup_flags))
>   			return -EFAULT;
>   
> -		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
> +		if (!(vm_flags & VM_WRITE) || vma_is_shadow_stack(vm_flags)) {
>   			if (!(gup_flags & FOLL_FORCE))
>   				return -EFAULT;
>   			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
> @@ -1071,7 +1071,8 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>   			if (!is_cow_mapping(vm_flags))
>   				return -EFAULT;
>   		}
> -	} else if (!(vm_flags & VM_READ)) {
> +	} else if (!(vm_flags & VM_READ) && !vma_is_shadow_stack(vm_flags)) {
> +	/* reads allowed if its shadow stack vma */
>   		if (!(gup_flags & FOLL_FORCE))
>   			return -EFAULT;
>   		/*

Unless I am missing something, this is not a simple cleanup. It should 
go into a separate patch with a clearly documented reason for that change.

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
