Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDE3D4662B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aoCuzsSiFtRMoM8r946ivDZ1iumTRPuQwzBbwixmUvQ=; b=d7hY38EtdmtYPgp3WJQjeqlwo0
	jQULGok7RGa342rCJS468HbtYHvGbKvs4na5/tVTCBaIGHIb+yjDmWTwJbXqHQlMf9IYUVVkfwM2i
	YhPuy7m1PGEKdikL0iE4ynLXLxDcJknoahbkG8A7LHbna/+IzArKB8ZMKJTaQb9jvq+dPz9YtWJZb
	PO2GbUiQroe/f7hUP94BGgVwh4G7sKLnHrbV+hElqkeBS8fGilgkZ72o2bKsWAlVFz4me7m9ve8fb
	I4lA9ZKrmJQwsZFBmb3sGz7vVlkYCtNpGcrObep+XX8k22xNHTtO+AAt79xAbr8NTnWNJKFDNpw2N
	sIgcLnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVCU-0000000DEj7-2q9v;
	Thu, 15 Jan 2026 21:48:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVCT-0000000DEiX-0CiH
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jan 2026 21:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:MIME-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=; b=Jj5Ef/XCXSXPNtOTMyZa+qz30q
	bc7B2E2RjZ/aG6J26n6Me2PnsPJy6F8eZqBB9cjf1mdtDqjPRcI9r1VQittT1jw0rxJS7LZZKyRO7
	b8HgYP27cnoynUt9LxfKX2n9M81ZA3faa6+KDLyRTZDXZ0ug85xtuQT4E1c+ausZFbm1HQeZeVki1
	QI8NphnUAjnNB6dEBNu9Ha3GvZTKUPkybxZmN4VAa+M55UQYzH5uLUg8NBQtybxEccZ3ldk1GAD0u
	XfoxbXbHesU3Lv0Zbw3/CMFcwyF6BijyUB+z49Vch1so5EECLkFoVC/wGifxvlsbrFpm7iPwKUNRF
	1r9TIV6A==;
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVCO-00000008VSJ-1nc4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 21:48:15 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-5ef31a77afbso1723981137.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768513690; x=1769118490; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=JRty/CXw8HIK3qNWhRo5MKFBLW76ZLDFo9TBfr/gZVYc+XibH0F+EtHyUYEcRL77Cb
         myUfm9vmNje2r1+LzNIbKvvsaswfEmppIeqEuHZdafiOzRL4sEr1xZwgbNCvR0O7DP3z
         amK2qMJHwxcOT1pG4XUs0LPj0u3wMOeMVlQwgL8ep3iRIqRc5wcb7sFR3Bm3s7rE3dlf
         e4jMOk7i9B5L2pn/ZwV5xGKWjhsceCuwz8I2xBqNBOigL0ipwtCtW+iNqWCjpO5GGoa2
         YG0/6QdyK5d2BHc2Cy/z6zDl7xRta3ty/8a1oKvo9bCBW2hm6iqPN6v5YmuQWP63sNdF
         XZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513690; x=1769118490;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=sikRZ6EAPZ9s+ndvWSU2UGZuXU3y+/TFp+ssBeMk3aPyZQ8cob9nNSBWEKr5h/zOXE
         9bkH/P0Ktg5WLEjnzBPTfFXRaaBXsRZMg2eYkQgN8YMCK/Do6x7CPZ/IBve0XVv0KBjG
         u+yU6RXyjL9VJ0Hl2PK4YsQXQ4O+xvkx+OzhOIIhoidZrwSlSoyzr48DRdu3LBLlEu7J
         ZPUaZbZ4tYhpHjb3709DCY1ycPZHcqZHwNm9I2LGnJQngX4H36l9p4yjVC1pI4FiYnOm
         tNdekhJSvguwb7+9hT3WpJmgZbkMxgBrsJjYyLklrl0Hru6fUglph9cRlcmuYDeXz78x
         1CCA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ox1K3q2pOFgFfR7xi2OLPIGUH3AeJgwmUzoIii2pCUoRWuO3fb2IDqyKTB+5mIZ7SrShBump+bJ5gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/1nE7xteYxmpqIuXQzG/a+TIou9xJmAA2595bvAR12vC3+v6/
	AyThyVYTX69bkbdH8PJW1IWURGf7335w2JGZBcLGi3P+D/2YJbGFPcj3LH7rchRRxCj6jWLwMYl
	z/GQk7RenSz+GztPNVIP7Mt5HRoXWoAKiCssvKe8J
X-Gm-Gg: AY/fxX56qcA0fel8NT9uNbIB8FNbsL3Om9E3nE7Rkk33zwkSudZsRrnc/CuJxTbGWEM
	Ap1STC/DqO2//ehp1oscCkCncOO786ZarO3Ie6df1IE9EdHjB1viTVxoAMO9MgOwfckBWioDZqQ
	ZcZ2nxpwhlngcai6RZDF0dyl9gEEoJgc5VwykVWxaPfhz82nIxaY/N/H6H0W8C/wUE7MpnbTVgy
	ivA+owhl7xo78lQBLOc05KR4lLL60afXGBssxPRgCQhveHjnfN2jWvL9OHoMPnQjvW0Hisex1jI
	xCc30wID4kcV9tP29HOc/TLNUNxO6sPN4S6a
X-Received: by 2002:a05:6102:f13:b0:5ec:3107:6b71 with SMTP id
 ada2fe7eead31-5f192508297mr1821684137.14.1768513689093; Thu, 15 Jan 2026
 13:48:09 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-6-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-6-kalyazin@amazon.com>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:48:08 -0800
X-Gm-Features: AZwV_QhGkMBioMKFssSOB50hq7Zm3qSZq1aP9Of9c8wem-vUHGjRo2vWaCWRwKU
Message-ID: <CAEvNRgEhcTE70RLiQo2C_XUdF31qSkQ6yHwpUiXPWb6+6mmA0A@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] KVM: x86: define kvm_arch_gmem_supports_no_direct_map()
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
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_214812_497738_B250F0A3 
X-CRM114-Status: GOOD (  10.12  )
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

> From: Patrick Roy <patrick.roy@linux.dev>
>
> x86 supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP whenever direct map
> modifications are possible (which is always the case).
>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 5a3bfa293e8b..68bd29a52f24 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -28,6 +28,7 @@
>  #include <linux/sched/vhost_task.h>
>  #include <linux/call_once.h>
>  #include <linux/atomic.h>
> +#include <linux/set_memory.h>
>
>  #include <asm/apic.h>
>  #include <asm/pvclock-abi.h>
> @@ -2481,4 +2482,12 @@ static inline bool kvm_arch_has_irq_bypass(void)
>  	return enable_device_posted_irqs;
>  }
>
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +static inline bool kvm_arch_gmem_supports_no_direct_map(void)
> +{
> +	return can_set_direct_map();
> +}
> +#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
> +#endif /* CONFIG_KVM_GUEST_MEMFD */
> +
>  #endif /* _ASM_X86_KVM_HOST_H */
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
