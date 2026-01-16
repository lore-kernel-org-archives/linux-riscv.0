Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF3DC982C7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GTNXIVfQ55DW6MLcgRwpqs/9HbFEbyYhrCZERqkIA8=; b=fVza6ZfLYlw1MX
	IN0wAGYBNo1X7qup0RaaL2gDBHIPdZpZOtbbwOW/iPjB26LXcS/+3GVFn1QvZeHCjRmS1YCa2XvGZ
	XsBU5hZdFtr6eksQDxDH0WgoycqdTvfKDIYXU+zQtDAav0lrXXO4hdZbQC7XBuvf1aOikwHeSxIoi
	7nN8QGHJAMSqI5W6632rfCdui/gRCLWI1zMKDTVMl69TyAvUd7xuHVTzgL5iqbvv7MRYuvSDHdzIE
	/EPYhY2b931Nhm+plO80PWWt9SVNTULMj2UAUViupnbW6kOrdhUusW8XY/DP01B0N1QsROLI02Xh0
	1T27UGx1SUc1qadqSBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglFS-0000000EIKh-0gCU;
	Fri, 16 Jan 2026 14:56:26 +0000
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglFO-0000000EIJS-2b6A;
	Fri, 16 Jan 2026 14:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1768575382; x=1800111382;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=IEO4wkDrWsP8gb8dVRwVt7tfKvgBUuiF6zz/e0uDn6E=;
  b=qLjsGKnfjFqgrd9xJSZ4rJ87mYcg7yUn6KkST+zRBnRjvngAEHbnRhfC
   Tu+Ff2dxZbzVRtLvMRxv9grgtJotBpERHSC84D90ob9m1ZC8Nq9eMm1XT
   pDK8FdEtIbFwLnfYcosr0j9yY/DUE2maIco/5Z1L3OgxLOUr3o2lbNQV3
   gDzECjcbawVBf3aw6WU5nDWF7DbeWGtFO0KCVcVxTUXq4TY6pkPe/VV2G
   0XQzT1tgspTRp3Ro2Fx2M4lSL48S28RfC7rD/ptl/fB4VKTydqkJJHh5T
   dnPLdiaQbQ86oDNYJVn6PyOZvNi32tMKYtb2ez8ngpvo5xDbQ4+a7xK/Z
   Q==;
X-CSE-ConnectionGUID: t80jrskTRzKiYCPAndralA==
X-CSE-MsgGUID: hn4FZT+mTRGLqNyYAxxD5Q==
X-IronPort-AV: E=Sophos;i="6.21,231,1763424000"; 
   d="scan'208";a="7704673"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:56:02 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:3849]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.41.192:2525] with esmtp (Farcaster)
 id 260b6298-10cb-4eed-9151-e85b598fcfcc; Fri, 16 Jan 2026 14:56:02 +0000 (UTC)
X-Farcaster-Flow-ID: 260b6298-10cb-4eed-9151-e85b598fcfcc
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Fri, 16 Jan 2026 14:56:01 +0000
Received: from [192.168.12.13] (10.106.82.9) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Fri, 16 Jan 2026
 14:55:57 +0000
Message-ID: <6b50a83e-acd7-4db3-ae9b-015ffad4f615@amazon.com>
Date: Fri, 16 Jan 2026 14:55:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/13] mm/gup: drop secretmem optimization from
 gup_fast_folio_allowed
To: Ackerley Tng <ackerleytng@google.com>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org"
	<luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
	"willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org"
	<ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>,
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev"
	<martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>,
	"song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev"
	<yonghong.song@linux.dev>, "john.fastabend@gmail.com"
	<john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com"
	<peterx@redhat.com>, "jannh@google.com" <jannh@google.com>,
	"pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>,
	"riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>,
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com"
	<jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com"
	<dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "Jonathan.Cameron@huawei.com"
	<Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com"
	<shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com"
	<wyihan@google.com>, "yang@os.amperecomputing.com"
	<yang@os.amperecomputing.com>, "vannapurve@google.com"
	<vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev"
	<patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri,
 Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>,
	"Cali, Marco" <xmarcalx@amazon.co.uk>
References: <20260114134510.1835-1-kalyazin@amazon.com>
 <20260114134510.1835-3-kalyazin@amazon.com>
 <CAEvNRgGrpv5h04s+btubhUFHo=d6mBFbr2BVrMt=bWuWOztdJQ@mail.gmail.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <CAEvNRgGrpv5h04s+btubhUFHo=d6mBFbr2BVrMt=bWuWOztdJQ@mail.gmail.com>
X-Originating-IP: [10.106.82.9]
X-ClientProxiedBy: EX19D012EUA003.ant.amazon.com (10.252.50.98) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_065622_960572_D2EC4344 
X-CRM114-Status: GOOD (  22.46  )
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
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 15/01/2026 21:40, Ackerley Tng wrote:
> "Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:
> 
>> From: Patrick Roy <patrick.roy@linux.dev>
>>
>> This drops an optimization in gup_fast_folio_allowed() where
>> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
>> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
>> by default"), so the secretmem check did not actually end up elided in
>> most cases anymore anyway.
>>
>> This is in preparation of the generalization of handling mappings where
>> direct map entries of folios are set to not present.  Currently,
>> mappings that match this description are secretmem mappings
>> (memfd_secret()).  Later, some guest_memfd configurations will also fall
>> into this category.
>>
>> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
>> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>> ---
>>   mm/gup.c | 11 +----------
>>   1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 95d948c8e86c..9cad53acbc99 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2739,7 +2739,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>   {
>>        bool reject_file_backed = false;
>>        struct address_space *mapping;
>> -     bool check_secretmem = false;
>>        unsigned long mapping_flags;
>>
>>        /*
>> @@ -2751,14 +2750,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
> 
> Copying some lines the diff didn't contain:
> 
>          /*
>           * If we aren't pinning then no problematic write can occur. A long term
>           * pin is the most egregious case so this is the one we disallow.
>           */
>          if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
>              (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
> 
> If we're pinning, can we already return true here? IIUC this function
> is passed a folio that is file-backed, and the check if (!mapping) is
> just there to catch the case where the mapping got truncated.

I have to admit that I am not comfortable with removing this check, 
unless someone says it's certainly alright.

> 
> Or should we wait for the check where the mapping got truncated? If so,
> then maybe we can move this "are we pinning" check to after this check
> and remove the reject_file_backed variable?

I can indeed move the pinning check to the end to remove the variable. 
I'd do it in a separate patch.

> 
>          /*
>           * The mapping may have been truncated, in any case we cannot determine
>           * if this mapping is safe - fall back to slow path to determine how to
>           * proceed.
>           */
>          if (!mapping)
>                  return false;
> 
> 
>>                reject_file_backed = true;
>>
>>        /* We hold a folio reference, so we can safely access folio fields. */
>> -
>> -     /* secretmem folios are always order-0 folios. */
>> -     if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
>> -             check_secretmem = true;
>> -
>> -     if (!reject_file_backed && !check_secretmem)
>> -             return true;
>> -
>>        if (WARN_ON_ONCE(folio_test_slab(folio)))
>>                return false;
>>
>> @@ -2800,7 +2791,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>         * At this point, we know the mapping is non-null and points to an
>>         * address_space object.
>>         */
>> -     if (check_secretmem && secretmem_mapping(mapping))
>> +     if (secretmem_mapping(mapping))
>>                return false;
>>        /* The only remaining allowed file system is shmem. */
>>        return !reject_file_backed || shmem_mapping(mapping);
>> --
>> 2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
