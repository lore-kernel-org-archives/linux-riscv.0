Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581B5F483EC
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5Tr0PV+K94WKy3/G/l+as126VzB4Sl7cB/rUlo1CHhI=; b=WyQh/thikLVl0fH8ViYk1v4dj+
	LEMlLj0XOyjvmafgU1y0+qhJp4YvbgCT4leynTZg7SQCZQEX2t8b+XBf5TtAuVzPYfBn7BHnHkrSt
	FWN4kVexJMoRTDD3tlce6ZIvzhhgNIevCCDMjg1t6f+lAwKT66pKlMpG7hGpePQAL1Q5bYfzt/fzp
	qaxfZFWVhmEzRVr+eARSFQqLn8dUPcVwHkhxemhTiIJSzexMPeVW+GOjtEPPl22KFp3CGGvG2UbOW
	mBAiYtqP9tkZyMLi12C+siMaXhlQ9Wsm2+cm+isS/+ct+GDXZaVlNZqD5/egzWk9yQeWHrVUw9itj
	DIPd4VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lJ1-0000000HVaA-3GPP;
	Mon, 23 Mar 2026 19:51:19 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ja4-0000000HIC6-3vgS
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 18:00:50 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-6027a750ad0so174327137.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 11:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774288847; cv=none;
        d=google.com; s=arc-20240605;
        b=VYit019mcbvK1ih5MoP3XtWhh4g4LqfcKbnN9/3nEft7NoCYLup0vH8a3zo6je7UEU
         0JJrLzLjPLDSaUo/GQHWZFOlagtQvzUIKwuEIThvKmWoxtDEi6bNBg5Xr/ubzXXdMQp+
         RK9y34Sq2vlQdLCOqUhe1t6BQ9Kuvx09gR43dYuL9P++S3QWJc+G1zeBZ4LCGabKCiGD
         q9R1nUtNzPBsjgCOzn3x3W1nujbqb5N95DfsQm827b2Y75iIB0jLyjBYR00K6Cj5odCf
         WDHB3DVsyI01Jng5tT55On5hMpTZk/4Sg4NA37/3uRg+OetO+11Gc7Sh0AcA008j3jLT
         QgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dhS8A80UKHVBBONMyyB3JNJOZLsQWUQ/neWlg69pPXo=;
        fh=B/DczK24GxBzbtOBjgh1QMjwStBuMVJjpK8qgXCts1k=;
        b=Fj7UlMer/4MbJCK+k/TKFUqn9uQ4nqCB0na5FQkKgHkQ2Zy90uUBv1yCtFkgs3ZJop
         s7j/ro/4aY+j74wC/mFzdcJlPDx7yoUvezoVyCt1SFWsVcNGZMFDsonCaTdb8JK1Qw5g
         759UKzxhVbm3YkTZg3iYiyPvjhZUzuAxvnkUln6+SfiJ/ET9HSW7ycEBh8Lc4RCdXKqv
         F/icXjEFgf82l6i2qVZkptpT+hSX/xC1mbPhJR9pmOZOd2vh71ZmPum5r9bLwf3Cp4Jo
         vmHSECnouC7vJUQXMSEGtpnSii0IXTcLK18dipxNjmLbdq9FlOD9lj+cCf2bh80IfsWA
         PROQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774288847; x=1774893647; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhS8A80UKHVBBONMyyB3JNJOZLsQWUQ/neWlg69pPXo=;
        b=g1PzjhjgVdkiig3SjmFzZtmXEfj98uUDqJPpSSqlO5RKIcqShuTh+WTU/HHENVVUIF
         CQD+W8whDVNw9PBYNMVLZH9vN5iUOT5B+6hLE8SkrIITBW4J3n+kVhPTCuRGqXnWzqiX
         FV1coeWoTmUlSPNUvcACJH54xl75QZl8WNRQ1N3JCMgL46zDwXR66Nhq0B1bCnYM3M+b
         +Mxdm4S4Stshe0Dv0EBmUwgzwhlvMb07NELZgj5TGwlnC1pFjasl2kTgk29hFWvFlq9m
         01uJgawC6TUqHTYx2axhNP10INqb8drY6xN7lo8L4YuJs6yR29v2/7DnexngfzF5H+Z2
         Hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288847; x=1774893647;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhS8A80UKHVBBONMyyB3JNJOZLsQWUQ/neWlg69pPXo=;
        b=EyXkIpsW8SC5yaS17an0fvGwlinZyWstn3A6YoUOgi0dVE2hb8SCsRImPzYbrDRSCj
         rx2GtzcXRiILP+THnMbMfuc5zz68N6reyawfrzWVKeY9sc1ENW/EoIDXZ3KFl3G3RXW4
         VEqWu45qrkZGj8Wv3N0bzxMOMzxCN5xLPa5Mm3xzf8RwB5yj3gL5+AdDubVLtiaAlVTk
         Q5JTODfc7wVzYoOJWxCzpTGwJcqPgGXlQZNA3V9zihYXQ/wpuzCqnMTWHt0KCKT7bdMa
         pLXEK1dkeO0RPwX13nXgDdPxE3rIic/fqp69heaoEGJyILqDGqAL1bscCJ53przapyHA
         zNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5cOc4Ph0mhMb8Nk6QhXpMkcK+IV2ciExSvAoASRmyhyrQgdQrBHhxS8hLS91fPgD0QqzQVvQ//ZEYgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIp04YKu0hp4K7zULp2Spk+vqlub9yfDf6vsAh9GgGdMyjZfuH
	UwM9pEFEX/5lFKhVnk4zBBpYTO3bNxdDFvt1dVH3ZvXOZy/Px3t07li1q4BMDE4F0INfaGBDAwK
	SyeMGz5AywdlqPI9uiZQZOMI1MMv7K/D2FC7emM54
X-Gm-Gg: ATEYQzyeGRllE3OG6rXT/8CSGXxq+pRDILkh02dDhg3fcMCyNk/mjSVRYwlYVVIwIbH
	VMCrbiSUlURyg9GBnGYeQqxPuZ5JOODUROKJ5bZVnagZ5t78INZCNF/r0nRZDBw4xzwzO1AFsMI
	P3qqyFZN1pfoCOJ+dEwFn+0OqR12ziwhf6gnqEzM8Bdc2x/XstDTZ5TAtXBh/e6Eo5dMvNoqEzX
	KUfa037zecSnht9DwmeSJVWYFGQ7Ufy0wMK6UcByHSBN/A2vUbZsa3px2K3K84i39KP6h9SrJTw
	QghBbg0EVLHITZFcaPd7C5iCUY7fr6KCR9R56cOfRNDXE5w7aFtVLGw7d15XCRDHrLTwAQ==
X-Received: by 2002:a05:6102:26d1:b0:5ff:ea89:44b5 with SMTP id
 ada2fe7eead31-602aed5357cmr6709465137.32.1774288846075; Mon, 23 Mar 2026
 11:00:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:00:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 11:00:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260317141031.514-2-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-2-kalyazin@amazon.com>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 11:00:44 -0700
X-Gm-Features: AQROBzCftGX5aQ7J_uujSzbFVwlRhmdq4pmEC-kWuwHc-7ThhwmICNIjXxt4gxA
Message-ID: <CAEvNRgFUXsO4HLVvyjfU=UX9cO6UrRppyTu1X0_+6SXLhDEN=w@mail.gmail.com>
Subject: Re: [PATCH v11 01/16] set_memory: set_direct_map_* to take address
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_110049_020561_83F374F5 
X-CRM114-Status: GOOD (  20.02  )
X-Mailman-Approved-At: Mon, 23 Mar 2026 12:51:17 -0700
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

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> This is to avoid excessive conversions folio->page->address when adding
> helpers on top of set_direct_map_valid_noflush() in the next patch.
>

I can't take credit for what Sashiko [1] spotted.

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/arm64/include/asm/set_memory.h     |  7 ++++---
>  arch/arm64/mm/pageattr.c                | 19 +++++++++----------
>  arch/loongarch/include/asm/set_memory.h |  7 ++++---
>  arch/loongarch/mm/pageattr.c            | 25 +++++++++++--------------
>  arch/riscv/include/asm/set_memory.h     |  7 ++++---
>  arch/riscv/mm/pageattr.c                | 17 +++++++++--------
>  arch/s390/include/asm/set_memory.h      |  7 ++++---
>  arch/s390/mm/pageattr.c                 | 13 +++++++------
>  arch/x86/include/asm/set_memory.h       |  7 ++++---
>  arch/x86/mm/pat/set_memory.c            | 23 ++++++++++++-----------
>  include/linux/set_memory.h              |  9 +++++----
>  kernel/power/snapshot.c                 |  4 ++--
>  mm/execmem.c                            |  6 ++++--
>  mm/secretmem.c                          |  6 +++---
>  mm/vmalloc.c                            | 11 +++++++----
>  15 files changed, 89 insertions(+), 79 deletions(-)
>
>
> [...snip...]
>
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index f5e910b68229..9e08905d3624 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -198,32 +198,29 @@ bool kernel_page_present(struct page *page)
>  	return pte_present(ptep_get(pte));
>  }
>
> -int set_direct_map_default_noflush(struct page *page)
> +int set_direct_map_default_noflush(const void *addr)
>  {
> -	unsigned long addr = (unsigned long)page_address(page);
> -
> -	if (addr < vm_map_base)
> +	if ((unsigned long)addr < vm_map_base)
>  		return 0;
>
> -	return __set_memory(addr, 1, PAGE_KERNEL, __pgprot(0));
> +	return __set_memory((unsigned long)addr, 1, PAGE_KERNEL, __pgprot(0));
>  }
>
> -int set_direct_map_invalid_noflush(struct page *page)
> +int set_direct_map_invalid_noflush(const void *addr)
>  {
> -	unsigned long addr = (unsigned long)page_address(page);
> -
> -	if (addr < vm_map_base)
> +	if ((unsigned long)addr < vm_map_base)
>  		return 0;
>
> -	return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
> +	return __set_memory((unsigned long)addr, 1, __pgprot(0),
> +			    __pgprot(_PAGE_PRESENT | _PAGE_VALID));
>  }
>
> -int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
> +int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
> +				 bool valid)
>  {
> -	unsigned long addr = (unsigned long)page_address(page);
>  	pgprot_t set, clear;
>
> -	if (addr < vm_map_base)
> +	if ((unsigned long)addr < vm_map_base)
>  		return 0;
>
>  	if (valid) {
> @@ -234,5 +231,5 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
>  	}
>
> -	return __set_memory(addr, 1, set, clear);
> +	return __set_memory((unsigned long)addr, 1, set, clear);

Sashiko also spotted that there is a hard-coded 1 here. Before this
change, it was already hard-coded to 1. Not sure if this is a
bug.

Could this be addressed in a separate patch series?

>  }
>
> [...snip...]
>
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 40581a720fe8..6aea1f470fd5 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2587,9 +2587,9 @@ int set_pages_rw(struct page *page, int numpages)
>  	return set_memory_rw(addr, numpages);
>  }
>
> -static int __set_pages_p(struct page *page, int numpages)
> +static int __set_pages_p(const void *addr, int numpages)
>  {
> -	unsigned long tempaddr = (unsigned long) page_address(page);
> +	unsigned long tempaddr = (unsigned long)addr;
>  	struct cpa_data cpa = { .vaddr = &tempaddr,
>  				.pgd = NULL,
>  				.numpages = numpages,
> @@ -2606,9 +2606,9 @@ static int __set_pages_p(struct page *page, int numpages)
>  	return __change_page_attr_set_clr(&cpa, 1);
>  }
>
> -static int __set_pages_np(struct page *page, int numpages)
> +static int __set_pages_np(const void *addr, int numpages)
>  {
> -	unsigned long tempaddr = (unsigned long) page_address(page);
> +	unsigned long tempaddr = (unsigned long)addr;
>  	struct cpa_data cpa = { .vaddr = &tempaddr,
>  				.pgd = NULL,
>  				.numpages = numpages,
> @@ -2625,22 +2625,23 @@ static int __set_pages_np(struct page *page, int numpages)
>  	return __change_page_attr_set_clr(&cpa, 1);
>  }
>

I agree that in arch/x86/mm/pat/set_memory.c, __kernel_map_pages(), has
calls to __set_pages_p() and __set_pages_np() that seems to have been
missed out in this patch. Those calls still pass struct page *. Maybe
that's because __kernel_map_pages() was guarded by
CONFIG_DEBUG_PAGEALLOC, so if you were using an lsp-guided refactoring
that call was missed.

Should probably try a grep to see what else needs replacing :)

[1] https://sashiko.dev/#/patchset/20260317141031.514-1-kalyazin%40amazon.com

> -int set_direct_map_invalid_noflush(struct page *page)
> +int set_direct_map_invalid_noflush(const void *addr)
>  {
> -	return __set_pages_np(page, 1);
> +	return __set_pages_np(addr, 1);
>  }
>
> -int set_direct_map_default_noflush(struct page *page)
> +int set_direct_map_default_noflush(const void *addr)
>  {
> -	return __set_pages_p(page, 1);
> +	return __set_pages_p(addr, 1);
>  }
>
> -int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
> +int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
> +				 bool valid)
>  {
>  	if (valid)
> -		return __set_pages_p(page, nr);
> +		return __set_pages_p(addr, numpages);
>
> -	return __set_pages_np(page, nr);
> +	return __set_pages_np(addr, numpages);
>  }
>
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>
> [...snip...]
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
