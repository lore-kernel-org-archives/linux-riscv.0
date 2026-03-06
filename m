Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B199CFCC9A7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDZfO8ddc/iGNG0cRO0Qrk9xY21KFl2TO/E17SH5IFI=; b=N/VdS0qXGaLv/4
	RQA8Wpz+zgbpT1j9ZKR9FrEkKCH/iSFBm2JFfs0hxYpTUC/0Hp3Cq/GnKNr3+J8TqZMf6FW6eYd4U
	qj25yqqOHps1aGuRT99y8Ub8xFXsdJtFWpe8rJ6luOw5p48NprzSwPcNECcco+wCASbO6uxvVmGbi
	3WwHUM5pCT6l0N67nG8Uu6AHllX/H8d2DQ+5IlZnb+Ux6o2+V898VqIsv8OWLCHNau/7DcblZd3W0
	SqyJrT73h9jI5qfmUIxDzrBZtvpq/UrVKWyT68l7WGKT1NXVbBMAxD66H1e94IDMX5UBlaie95DTw
	3WEIVXhFMxKVJcwH8ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWa-00000008Kab-2AmD;
	Tue, 10 Mar 2026 00:00:36 +0000
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([52.28.197.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXJN-000000043Uf-4742;
	Fri, 06 Mar 2026 15:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772811718; x=1804347718;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=YnCR77bPkSJ3r6eLW+FO2o4FnCnPBwwukZtKN2qmask=;
  b=JtrpxJNRGmLk+k8fmAE1B2QvhHxakHYHnN8bFrhI2fYTq3LYC6xkCSD4
   ZqybcXR7xdxPM2i96nAhx70oEV4hPuPg1h9xrCR5kFlB5ulpiFM68gQ29
   +bSYC0SZ9LaWoDRQ7vv+qXh85ebq6p4At9p95t+TA0el2f45lTJgtwIlQ
   zuIXlY7vXK+hqITLLUuDeYF9R2g7qGeZz0Ei5OBXC8bOFRZ6XbocAbZre
   QDZDokR8KA8vAvWS2rLjxT63GdRjJbx5DU1fE8+Mjv63aJ2e/6qeLme0Z
   BWK8MmFEP2juQba5/o7162Na1KoButyGR2nuFhh0AFrChyfZDhLUaZo/u
   A==;
X-CSE-ConnectionGUID: GwEkaMEOTMKbobqyy3yX9A==
X-CSE-MsgGUID: di4IC+oOQpGwVPpG+YbSbA==
X-IronPort-AV: E=Sophos;i="6.23,105,1770595200"; 
   d="scan'208";a="10322839"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 15:41:52 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:9370]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.46.96:2525] with esmtp (Farcaster)
 id 5185657e-5145-4540-97b1-c86cd60d47dd; Fri, 6 Mar 2026 15:41:52 +0000 (UTC)
X-Farcaster-Flow-ID: 5185657e-5145-4540-97b1-c86cd60d47dd
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 6 Mar 2026 15:41:52 +0000
Received: from [192.168.2.180] (10.106.83.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 6 Mar 2026
 15:41:47 +0000
Message-ID: <5c322be7-ea81-4e6a-9689-978c35e93af6@amazon.com>
Date: Fri, 6 Mar 2026 15:41:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/15] set_memory: add folio_{zap, restore}_direct_map
 helpers
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
 <20260126164445.11867-3-kalyazin@amazon.com>
 <af2d4dcd-60a8-4a5a-b508-d9600b1f2275@kernel.org>
 <e2834fd9-e4ec-473c-90cd-6c3a5049747f@amazon.com>
 <40bd6f9b-d5c0-4844-81bc-d221cd9b058f@kernel.org>
 <38deb26a-918c-4743-b35f-92a1330dbf40@amazon.com>
 <efc1c39c-7eb5-488f-819c-0ca2149898c3@kernel.org>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
In-Reply-To: <efc1c39c-7eb5-488f-819c-0ca2149898c3@kernel.org>
X-Originating-IP: [10.106.83.26]
X-ClientProxiedBy: EX19D007EUB003.ant.amazon.com (10.252.51.43) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074158_401387_814498A6 
X-CRM114-Status: GOOD (  14.41  )
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



On 06/03/2026 15:17, David Hildenbrand (Arm) wrote:
> On 3/6/26 15:48, Nikita Kalyazin wrote:
>>
>>
>> On 06/03/2026 14:17, David Hildenbrand (Arm) wrote:
>>> On 3/6/26 13:48, Nikita Kalyazin wrote:
>>>>
>>>>
>>>>
>>>> Will update, thanks.
>>>>
>>>>
>>>> Absolutely!
>>>>
>>>>
>>>> Yes, on x86 we need an explicit flush.  Other architectures deal with it
>>>> internally.
>>>
>>> So, we call a _noflush function and it performs a ... flush. What.
>>
>> Yeah, that's unfortunately the status quo as pointed by Aneesh [1]
>>
>> [1] https://lore.kernel.org/kvm/yq5ajz07czvz.fsf@kernel.org/
>>
>>>
>>> Take a look at secretmem_fault(), where we do an unconditional
>>> flush_tlb_kernel_range().
>>>
>>> Do we end up double-flushing in that case?
>>
>> Yes, looks like that.  I'll remove the explicit flush and rely on
>> folio_zap_direct_map().
>>
>>>
>>>> Do you propose a bespoke implementation for x86 and a
>>>> "generic" one for others?
>>>
>>> We have to find a way to have a single set of functions for all archs
>>> that support directmap removal.
>>
>> I believe Dave meant to address that with folio_{zap,restore}
>> _direct_map() [2].
>>
>> [2] https://lore.kernel.org/kvm/9409531b-589b-4a54-
>> b122-06a3cf0846f3@intel.com/
>>
>>>
>>> One option might be to have some indication from the architecture that
>>> no flush_tlb_kernel_range() is required.
>>>
>>> Could be a config option or some simple helper function.
>>
>> I'd be inclined to know what arch maintainers think because I don't have
>> a strong opinion on that.
> 
> You could also just perform a double flush, and let people that
> implemented a _noflush() to perform a flush optimize that later.

Do you propose to just universalise the one from x86?

int folio_zap_direct_map(struct folio *folio)
{
	const void *addr = folio_address(folio);
	int ret;

	ret = set_direct_map_valid_noflush(addr, folio_nr_pages(folio), false);
	flush_tlb_kernel_range((unsigned long)addr,
			       (unsigned long)addr + folio_size(folio));

	return ret;
}

I'm fine with that too.

> 
> I mean, that's what secretmem did :)

With the solution above, secretmem stays where it was: no optimisation 
so far :)

> 
> --
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
