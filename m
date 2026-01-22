Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C673D6CFA5
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KV6+v7Wfu0qF3Uo6Zi+Aieug8TjpdnE0fsnLY8Tv6w8=; b=e/jmZfNN0yCPZN
	7s8E+QM2HSrH81knDKCqzidVLkAS1wGLmPiqAg46nyIEmLuyjCdIWWGM7dzkZRzqy2HXgY53my4Fg
	TH6g8WUcBT8AnrxcsUyKi5Hlc4PiDTqFEyH1dqu3gpCQClINGlQObgrZK1C3KG5F77rMnlDBSP5Yj
	xLqn6ukx0WECbI6H9zFhs3n4qvF7TeKWxpjJzisPj+ZEKaP3P+XI6FxBLb+VlG4TnQBWlpTR61ERB
	14kdzGXHkrfZYr03QGd9K8VbLoi7XdEOR29hd8G/WZar72NoNxfTJH1liM1TBPc6sn5bul1d60h6h
	caxqtJx0ST9UqbbGXqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1US-00000007kaQ-1GHj;
	Thu, 22 Jan 2026 20:41:16 +0000
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1UO-00000007ka2-0XyU;
	Thu, 22 Jan 2026 20:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769114472; x=1800650472;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=L060fUvGttxYBIHa6eLU8Z48SLaOwnhKGvQs72E5QZs=;
  b=X5yCaNSmUf8a0W33UpKWpgBsocDSApY/yYziziQa+BbGDQ1SAp3sUEa4
   BSO8UlbIy36w7j9wYy/caZZ8uKbxy4WZfmeqn5QPv0xNay49Zx46pl19/
   pyjkZ8TCbcZTSeuRcwcZpniVJgdRMyq76Ox9PS8eWDVTQMYs9UWajChTA
   XH9NNIVYjUb8GtGsLWWNRWK0SVeRXcsL/7VUsOKXdEo5tYLR04/Fk+u6W
   3cNGwFG+S3UJG8W0niZcL23V6FadO+9qcfKkm3Rd5D/TGo+szvX0a1ya9
   CuKnWTZG8UbhCVqXv14c8/XSaf7uUTzATaSVi5YI9yjAIoXiO3h5V5HTA
   g==;
X-CSE-ConnectionGUID: Eq/qtYVnSJqlAvEbKUczXA==
X-CSE-MsgGUID: JuRcDWNSTV2iEyPOM5D09w==
X-IronPort-AV: E=Sophos;i="6.21,246,1763424000"; 
   d="scan'208";a="8319239"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 20:40:53 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:3034]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.29.47:2525] with esmtp (Farcaster)
 id a5dd7989-855e-4510-b2e9-5fd9107a3c02; Thu, 22 Jan 2026 20:40:52 +0000 (UTC)
X-Farcaster-Flow-ID: a5dd7989-855e-4510-b2e9-5fd9107a3c02
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 22 Jan 2026 20:40:51 +0000
Received: from [192.168.23.186] (10.106.82.17) by
 EX19D005EUB003.ant.amazon.com (10.252.51.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 22 Jan 2026 20:40:47 +0000
Message-ID: <0635e64a-2194-4a6c-b772-28af54d58e3b@amazon.com>
Date: Thu, 22 Jan 2026 20:40:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct
 map
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
 <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com>
 <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com>
 <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
 <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
 <CAEvNRgEd=Uh09dU_P7_vvzRpOyMYd=OKazpkxzr=VLe5HcQhGw@mail.gmail.com>
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
In-Reply-To: <CAEvNRgEd=Uh09dU_P7_vvzRpOyMYd=OKazpkxzr=VLe5HcQhGw@mail.gmail.com>
X-Originating-IP: [10.106.82.17]
X-ClientProxiedBy: EX19D004EUC003.ant.amazon.com (10.252.51.249) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_124112_762120_822779F9 
X-CRM114-Status: GOOD (  11.90  )
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



On 22/01/2026 20:30, Ackerley Tng wrote:
> Nikita Kalyazin <kalyazin@amazon.com> writes:
> 
>>
>> [...snip...]
>>
>>>>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>>>>          kvm_pfn_t pfn = page_to_pfn(page);
>>>>>>          int order = folio_order(folio);
>>>>>>
>>>>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>>>>> +
>>>>>
>>>>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>>>>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>>>>> time it's a folio-specific property being checked.
>>>>
>>>> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
>>>> case.  How does the fact it's a folio-speicific property change your
>>>> reasoning?
>>>>
>>>
>>> This is good too:
>>>
>>>     if (kvm_gmem_folio_no_direct_map(folio))
>>>             kvm_gmem_folio_restore_direct_map(folio)
>>
>> It turns out we can't do that because folio->mapping is gone by the time
>> filemap_free_folio() is called so we can't inspect the flags.  Are you
>> ok with only having this check when zapping (but not when restoring)?
>> Do you think we should add a comment saying it's conditional here?
>>
> 
> I thought kvm_gmem_folio_no_direct_map() only reads folio->private,
> which I think should still be there at the point of
> filemap_free_folio().

Oh, I misread your last reply.  What you're proposing would work indeed.

> 
>>>
>>> [...snip...]
>>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
