Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273AFD44C66
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcdrdSTg5pGCewrLfi5q1H/yEk5FkeMrIap/LiH7Os0=; b=e3vxwq8pYtNCu3
	eNt0IisrS3b5iOOhDBa0sTm9TI7oAeJuqs0S0iwcIq/h8trpRBHYKEx7+YYbiPRVuDkk/JXYJ+uLA
	fsEQwZVaHZB9TkHb2eXpiku2yP4/DfXmL8Ime9NDz86HDgttZkdVdfJDMaTWLN9doMtuGMDSpnyC0
	S+qVrx/0+jxCMspv7/RBez7XBa4M3qdj7vUnRS/Vz5bcTUtwD8Mweywh4BEP71Sxkb4BFJnGXQAPl
	jBPPd4rjSnibVyh+DH5DEHpho51zXhNya/p3R2U7E5q5k3HvykhQ80qamUiEvBEjSq1GATOKdjEuW
	fjbfjUfGmFy51YwZtiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPEW-0000000Cav6-1WZM;
	Thu, 15 Jan 2026 15:26:00 +0000
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPET-0000000Cat3-1G0P;
	Thu, 15 Jan 2026 15:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1768490757; x=1800026757;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=ErA/nUzcQBK9RfXLPHVY+KZIrd4BxzBjllIcAZaOcaQ=;
  b=BEDCIdnXQ6iCt7lkU8Ts2NZkpexwaijUmInke0GQo4krtl/J2wR+Yu0I
   AP6UD+iuXNgC5Gau99+kjiGBnwPjMv1orOGFBBS93GpjcTsW4Q7vp1YtD
   sUJmeFb8eeQCo5dL/tAewb0/gWvkZ30D0U3oL0u4AEAZTW7U3T1EvI7+U
   eYdnvl91Hm+JTj+FW38/xhbyqrRvAc5C7/HLlOaXFHwOTqZB/heXOr7X7
   tQE1CaUKRYFKAa0TIKtNmkxa6rDZD1BieYiFLHy/baQB91OC2JK0csQZz
   ebwHzc9vbUhnMMldGGEj7yvc/BIDx9nYiZX5f9qffUUJj+KxnCp/yaFMU
   g==;
X-CSE-ConnectionGUID: JEI06koAS36Pqlka9p/LFg==
X-CSE-MsgGUID: fziZ5aPzRHWEX3iC92dDgA==
X-IronPort-AV: E=Sophos;i="6.21,228,1763424000"; 
   d="scan'208";a="7652838"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:25:39 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:3758]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.6.3:2525] with esmtp (Farcaster)
 id 78f75ae8-5037-4d9b-ae68-7dfcd2a25e3c; Thu, 15 Jan 2026 15:25:39 +0000 (UTC)
X-Farcaster-Flow-ID: 78f75ae8-5037-4d9b-ae68-7dfcd2a25e3c
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 15 Jan 2026 15:25:32 +0000
Received: from [192.168.15.69] (10.106.82.11) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Thu, 15 Jan 2026
 15:25:28 +0000
Message-ID: <094591b6-97eb-4cae-aa08-fececcba4ba1@amazon.com>
Date: Thu, 15 Jan 2026 15:25:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] set_memory: add folio_{zap, restore}_direct_map
 helpers
To: Heiko Carstens <hca@linux.ibm.com>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
References: <20260114134510.1835-1-kalyazin@amazon.com>
 <20260114134510.1835-2-kalyazin@amazon.com>
 <20260115121209.7060B42-hca@linux.ibm.com>
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
In-Reply-To: <20260115121209.7060B42-hca@linux.ibm.com>
X-Originating-IP: [10.106.82.11]
X-ClientProxiedBy: EX19D012EUC004.ant.amazon.com (10.252.51.220) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_072557_670094_25704476 
X-CRM114-Status: GOOD (  11.34  )
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



On 15/01/2026 12:12, Heiko Carstens wrote:
> On Wed, Jan 14, 2026 at 01:45:23PM +0000, Kalyazin, Nikita wrote:
>> From: Nikita Kalyazin <kalyazin@amazon.com>
>>
>> These allow guest_memfd to remove its memory from the direct map.
>> Only implement them for architectures that have direct map.
>> In folio_zap_direct_map(), flush TLB on architectures where
>> set_direct_map_valid_noflush() does not flush it internally.
> 
> ...
> 
>> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
>> index d3ce04a4b248..df4a487b484d 100644
>> --- a/arch/s390/mm/pageattr.c
>> +++ b/arch/s390/mm/pageattr.c
>> @@ -412,6 +412,24 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>>        return __set_memory((unsigned long)page_to_virt(page), nr, flags);
>>   }
>>
>> +int folio_zap_direct_map(struct folio *folio)
>> +{
>> +     unsigned long addr = (unsigned long)folio_address(folio);
>> +     int ret;
>> +
>> +     ret = set_direct_map_valid_noflush(folio_page(folio, 0),
>> +                                        folio_nr_pages(folio), false);
>> +     flush_tlb_kernel_range(addr, addr + folio_size(folio));
>> +
>> +     return ret;
>> +}
> 
> The instructions used in the s390 implementation of
> set_direct_map_valid_noflush() do flush TLB entries.
> The extra flush_tlb_kernel_range() is not required.

Thanks, Heiko.  Will update in the next version.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
