Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C2FCC9AF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPHQFk6sX9rLsyMIXqOInWoEFjVDE+GdenMmntTcNc8=; b=ZCCHNFPhDC7q1m
	kFpucx4pJH+d10rVL9Y/mIyIf8K+3dajkyhDanQ2AiPYw5+mZfFblpuCsgfmfQ4yru2CSQ6nw2xCz
	gd6kf/4l3QbLaKlwiKQruX0L92hfyL5Vgvzv9QbNT/rxzOcPOHxp7tLLIDK7zEbv20CrCP1s653ZF
	ZyiWlfk6R0pY9ZKHrrmFAKqOYs322lRyEzUVj+QS8G61cSuJTKKLVnnR6Ah6ELvx0Ld2ImaCuCgYt
	b962HwgGBucphMpyDqyHtp1jZTECltcKxoT+QmNH5JRwm6ArdIcjoZZjjAzMRLBNhjUf/woRw485r
	Y4eyD+8pM0E0T2unf2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWZ-00000008KZQ-2H0E;
	Tue, 10 Mar 2026 00:00:35 +0000
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.197.217.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWUb-00000003yKN-25Ef;
	Fri, 06 Mar 2026 14:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772808569; x=1804344569;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=NrzHXx0Lp7Elw8ALF5D0u+kNkH3P0Dcowz8U+9XDncM=;
  b=JF8M40jG1RYIVatOlRZ2CqOb3BU+ftZ6H1UsIQ8V49OkXZiRblnzYzcD
   lwsTrNX2Ak8Uzxz6YlcceM5qy5uW5/1ad9ygHDhkhEvNeH+REkwG/ehK2
   hJnxbzfiuDDaSq41yyj9YNw6LZM0G2DPucgUqa+LJhHBJk5IMmEEQg8PI
   UzfavGT7CHSPCLSFhRbpb/YZN0NoehEnODnrYaZy1ugMYGbxuNMZQLWW3
   AciBzfFcrYlb5IOrhrrphx/ShWLuryuB6k8JqlT2lmPaqHlg687/LJ3ho
   rgkGQmTKB/kAzr7WLBfwP2Sv2Xze8paHGvrtKMeyjbaVs0Wz+XLlbZI1f
   g==;
X-CSE-ConnectionGUID: 5IccaEBNQVSWRB5rNmqQOQ==
X-CSE-MsgGUID: 2TQ5H7tGR3uCD8Jr0npB8Q==
X-IronPort-AV: E=Sophos;i="6.23,105,1770595200"; 
   d="scan'208";a="10436907"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 14:49:25 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:3701]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.26.205:2525] with esmtp (Farcaster)
 id 00a2718f-a0c4-43d5-bed7-970a51d610b2; Fri, 6 Mar 2026 14:49:25 +0000 (UTC)
X-Farcaster-Flow-ID: 00a2718f-a0c4-43d5-bed7-970a51d610b2
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 6 Mar 2026 14:49:24 +0000
Received: from [192.168.2.180] (10.106.83.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 6 Mar 2026
 14:49:19 +0000
Message-ID: <936fa782-d937-4b14-b92d-cc8707336e5e@amazon.com>
Date: Fri, 6 Mar 2026 14:49:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/15] KVM: guest_memfd: Add flag to remove from
 direct map
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Kalyazin, Nikita"
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
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org"
	<andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>,
	"haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org"
	<jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com"
	<jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com"
	<mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>,
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com"
	<gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com"
	<urezki@gmail.com>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com"
	<jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org"
	<pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>
References: <20260126164445.11867-1-kalyazin@amazon.com>
 <20260126164445.11867-10-kalyazin@amazon.com>
 <13ed00e1-f0db-4326-a800-2ba306833921@kernel.org>
 <690c22f9-b71a-4f14-9857-008c7c858373@amazon.com>
 <0c0b911c-cda2-44a4-897e-361e02be7da5@kernel.org>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
In-Reply-To: <0c0b911c-cda2-44a4-897e-361e02be7da5@kernel.org>
X-Originating-IP: [10.106.83.26]
X-ClientProxiedBy: EX19D001EUB001.ant.amazon.com (10.252.51.16) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_064929_832976_5ED48D36 
X-CRM114-Status: GOOD (  16.26  )
X-Mailman-Approved-At: Mon, 09 Mar 2026 17:00:27 -0700
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



On 06/03/2026 14:22, David Hildenbrand (Arm) wrote:
> [...]
> 
>>>> +     /*
>>>> +      * Direct map restoration cannot fail, as the only error condition
>>>> +      * for direct map manipulation is failure to allocate page tables
>>>> +      * when splitting huge pages, but this split would have already
>>>> +      * happened in folio_zap_direct_map() in
>>>> kvm_gmem_folio_zap_direct_map().
>>>> +      * Note that the splitting occurs always because guest_memfd
>>>> +      * currently supports only base pages.
>>>> +      * Thus folio_restore_direct_map() here only updates prot bits.
>>>> +      */
>>>> +     WARN_ON_ONCE(folio_restore_direct_map(folio));
>>>
>>> Which raised the question: why should this function then even return an
>>> error?
>>
>> Dave pointed earlier that the failures were possible [1].  Do you think
>> we can document it better?
> 
> I'm fine with checking that somewhere (to catch any future problems).
> 
> Why not do the WARN_ON_ONCE() in folio_restore_direct_map()?
> 
> Then, carefully document (in the new kerneldoc for
> folio_restore_direct_map() etc) that folio_restore_direct_map() is only
> allowed after a prior successful folio_zap_direct_map(), and add a
> helpful comment above the WARN_ON_ONCE() in folio_restore_direct_map()
> that we don't expect errors etc.

My only concern about that is the assumptions we make in KVM may not 
apply to the general case and the WARN_ON_ONCE may become too 
restrictive compared to proper error handling in some (rare) cases.  For 
example, is it possible for the folio to migrate in between?

> 
> [...]
> 
>>>> -     if (!is_prepared)
>>>> +     if (!is_prepared) {
>>>>                 r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>>> +             if (r)
>>>> +                     goto out_unlock;
>>>> +     }
>>>> +
>>>> +     if (kvm_gmem_no_direct_map(folio_inode(folio))) {
>>>> +             r = kvm_gmem_folio_zap_direct_map(folio);
>>>> +             if (r)
>>>> +                     goto out_unlock;
>>>> +     }
>>>
>>>
>>> It's a bit nasty that we have two different places where we have to call
>>> this. Smells error prone.
>>
>> We will actually have 2 more: for the write() syscall and UFFDIO_COPY,
>> and 0 once we have [2]
>>
>> [2] https://lore.kernel.org/linux-mm/20260225-page_alloc-unmapped-v1-0-
>> e8808a03cd66@google.com/
>>
>>>
>>> I was wondering why kvm_gmem_get_folio() cannot handle that?
>>
>> Most of the call sites follow the pattern alloc -> write -> zap so
>> they'll need direct map for some time after the allocation.
>>
> 
> Okay. Nasty. :)
> 
> --
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
