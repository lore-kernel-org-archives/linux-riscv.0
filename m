Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B65EA71AA
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNI9G1OBCa3JA8SefFCE04W5A29CwSIFFmn5a6MU0pc=; b=fs+rRxVcaTe1G5
	rVcL1BkDc7exKnlho8GTfgSnNR7ZU+JIjppi+Tg3Lx1iJpAZZy2iReYc3nAyuFrUB9URI+kQ3gZSP
	9u/1DP8jhzUKs60MEqtuHVeUrWIP0fGD+X+m8xOyeAv69VcKP0WzE3dzCrNqxnsCli42gpACwFdNj
	ne0eFSxAZWHcak4OUq2dO9jVS/9LxcbR60x4hqRjYtzZ8gnHwb1amgs3hIi8s/QGaCAWbVvRV8T5u
	qKayJqrLNESBr1ptutT6kGVXPJJj9UI8MhppuxF9EMMlHUYUZ2lvLiK7cLFYmiYZRozk6Orw5S7ZY
	3wL482Z/BTBjGfLuAWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEb91-0000000697U-2PVr;
	Sun, 19 Apr 2026 23:01:39 +0000
Received: from iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com ([13.216.7.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDmn-0000000CSzJ-1haG;
	Fri, 10 Apr 2026 15:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1775834925; x=1807370925;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=SAFosHbtBbXBFEeuEoVMlIweSzaAowN27zlshlTqt9A=;
  b=KSXUVQDVgD3LD76wfZI8d7zpAV1F0UGCi080sNtAudG44p/4im/ZiWTP
   0YfZ8fB5Wo8L+8ekx2DY3Lye1Vw4Z2bdpm/VgKMi/k+JiLOwikkExyTfm
   FiFWPKZYkJ/wLXlIO9WlvpurqGMgSCx3cxrLFF/S58npNQH5x5y33fhvD
   t5p5xKtf4XxyHmPlfanMTT5RDenWtisGI69JZ6Kdk+ycaPZ7vQENBnk5m
   KLMlCmlMhJvhXLF0ezCQIGzcEq38bPzGO1CYcyzsuzNl+j9OJB3fHMYBf
   2IUGvzv4MkwwPCc+70NB+06Fj6Cgr5y0ga9/Ctm3Xr7KvzO+YcfiNpxUd
   A==;
X-CSE-ConnectionGUID: izDL0MYqSwOQy5f8rYYb8w==
X-CSE-MsgGUID: T6sVodo7TcqvgyBOYnLnbA==
X-IronPort-AV: E=Sophos;i="6.23,171,1770595200"; 
   d="scan'208";a="15811989"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:28:43 +0000
Received: from EX19MTAUEC001.ant.amazon.com [52.94.133.134:8917]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.29.254:2525] with esmtp (Farcaster)
 id 363576ad-4054-4b70-ad88-80e87a8ec583; Fri, 10 Apr 2026 15:28:43 +0000 (UTC)
X-Farcaster-Flow-ID: 363576ad-4054-4b70-ad88-80e87a8ec583
Received: from EX19D027UEC003.ant.amazon.com (10.252.137.250) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 10 Apr 2026 15:28:42 +0000
Received: from [192.168.12.97] (10.106.82.30) by EX19D027UEC003.ant.amazon.com
 (10.252.137.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 10 Apr 2026
 15:28:30 +0000
Message-ID: <978f1fea-19bd-4e92-961a-080136441e4f@amazon.com>
Date: Fri, 10 Apr 2026 16:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: Ackerley Tng <ackerleytng@google.com>, "David Hildenbrand (Arm)"
	<david@kernel.org>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
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
	<lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>,
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
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com"
	<riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com"
	<yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com"
	<coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>,
	"wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com"
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
	"Manwaring, Derek" <derekmn@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
 <20260317141031.514-11-kalyazin@amazon.com>
 <50bfaeb5-551e-403f-bd00-a7d8b6bbf6e2@kernel.org>
 <CAEvNRgEXp6busURR20cazeG2DQWdU5=ZaJv21OcSq+mhVKwJ4g@mail.gmail.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJp2NfjBQkGQlIzAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPPNDAEAvsw8vEWj8ArWQ1QJNufjrvobU/cE8MLKdBxbSE8CyZQA/0BldKxNAtAwG4qw
 wCLxsZ5vBL3Zkh/PdvtFCj/VGscGzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmnY1+MFCQZCUjMCGwwACgkQr5LKIKmaZPPQKgD/f3FtERbJ+LYHLSG/ZbLNAOLngUlQ
 qo5VfIyJOzeLzC0BAP2PIUFIHo7vmia/PXEmT+ve4c5rx+EkH/Dx1GRpjWoI
In-Reply-To: <CAEvNRgEXp6busURR20cazeG2DQWdU5=ZaJv21OcSq+mhVKwJ4g@mail.gmail.com>
X-Originating-IP: [10.106.82.30]
X-ClientProxiedBy: EX19D003EUB004.ant.amazon.com (10.252.51.121) To
 EX19D027UEC003.ant.amazon.com (10.252.137.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_082845_588555_739BA09E 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 19 Apr 2026 16:01:33 -0700
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



On 23/03/2026 20:47, Ackerley Tng wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>>
>> [...snip...]
>>
>>> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
>>> +{
>>> +    u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
>>> +    int r = 0;
>>> +
>>> +    if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
>>
>> The function is only called when
>>
>>        kvm_gmem_no_direct_map(folio_inode(folio))
>>
>> Does it really make sense to check for GUEST_MEMFD_FLAG_NO_DIRECT_MAP again?
>>
> 
> Good point that GUEST_MEMFD_FLAG_NO_DIRECT_MAP was already checked in
> the caller. I think we can drop this second check.

Dropped, thanks.

> 
>> If, at all, it should be a warning if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is
>> not set?
>>
>> Further, kvm_gmem_folio_zap_direct_map() uses the folio lock to
>> synchronize, right? Might be worth pointing that out somehow (e.g.,
>> lockdep check if possible).
>>
>>> +            goto out;
>>> +
>>> +    r = folio_zap_direct_map(folio);
>>> +    if (!r)
>>> +            folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>>> +
>>> +out:
>>> +    return r;
>>> +}
>>> +
>>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>>> +{

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
