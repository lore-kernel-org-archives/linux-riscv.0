Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B8C982DB
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbn2n0TYk/5/viTTAl4cA9NsHyhNV9IVgMb6j96EN9c=; b=1JDJQ0EKSu0fM3
	Eey2SHCxv/X0lI9Pv4Nr1J4z7CSwR/XDspjXeRCFPbqrsiG2WayIJOzwWeIPW8EAVHymlNSt7/Srq
	kE7FvwbkuTtfICGsWG9sS9aFxRyf0joGXrExslF42W9P2V0uWZhaaU/Dy8PjbtGBD+Pi7WLa0yvMs
	sfmoaZ+8nTo/s1HUObqAwc2wsFZn5QcZCg6IVaQwhYvpsHiJuznemXJkYrH2faYFVx71AdvPoSknc
	YBdWf3CLnndXpDgzCyoRcSvfJlvsZDHYTiK4fEY7igsSAznZXujBDSaVLAW9byCq4t0hPHVrRP3OA
	OxBcuzDfs1Q70sH3GgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnhJ-0000000EaPr-3bJF;
	Fri, 16 Jan 2026 17:33:21 +0000
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnhG-0000000EaPE-3lUf;
	Fri, 16 Jan 2026 17:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1768584798; x=1800120798;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=JQ9fdAQPvfKL0BQ6nuE1OPJD9/1hgfxOsOgzcBIqcCo=;
  b=Ue/k4BveUWlb/FVFDf8RxOEulFH3VnqGMIfLe3gmP9kmaKAQo9f4VVqP
   PNd9YvoNY27sLusouwJiAuW/suQkeTaMr0YloEpUQI4Z3AiA0fzmns887
   ypBgeZbf2KqvlCIItDm4o4Z1Ndf5+S0elfhCMLFuglXHDWTuLLHnkjtch
   7vxdU7/glhdG50YzREK3FHFaHQZ3TA6NoeIr5/e3KuM4VAU+JR9viq2e/
   qlmEDUU+YLkaRXFRKSLYQNSrM5gKb8ssGTceM9zoJScQIK1lYAzfjrFMu
   jlXzzOAp/2+vkthsgvUzS7dX9Y0sKYMC4euHsXh2LUhP1lxQI9caQcZx6
   w==;
X-CSE-ConnectionGUID: mXXvV+M+RuK453p+B3eBMQ==
X-CSE-MsgGUID: MMzLzIdgRnuHEkpgLhJoQw==
X-IronPort-AV: E=Sophos;i="6.21,231,1763424000"; 
   d="scan'208";a="8021986"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 17:32:46 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:17904]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.6.3:2525] with esmtp (Farcaster)
 id 3abbcd19-66b6-49c8-82e3-6953c2e4c901; Fri, 16 Jan 2026 17:32:46 +0000 (UTC)
X-Farcaster-Flow-ID: 3abbcd19-66b6-49c8-82e3-6953c2e4c901
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Fri, 16 Jan 2026 17:32:40 +0000
Received: from [192.168.12.13] (10.106.82.9) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Fri, 16 Jan 2026
 17:32:36 +0000
Message-ID: <31e7d93d-0e0f-4976-bff6-84f484a8a6f3@amazon.com>
Date: Fri, 16 Jan 2026 17:32:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct
 map
To: Sean Christopherson <seanjc@google.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>
CC: "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "david@kernel.org" <david@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "ast@kernel.org" <ast@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "peterz@infradead.org" <peterz@infradead.org>, "oupton@kernel.org" <oupton@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "jthoughton@google.com" <jthoughton@google.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>,
 "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "ackerleytng@google.com" <ackerleytng@google.com>, "jannh@google.com" <jannh@google.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "will@kernel.org" <will@kernel.org>
References: <20260114134510.1835-1-kalyazin@amazon.com>
 <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <208b151b-f458-4327-94bc-eb3f32d20a68@amazon.com>
 <4781ba9c5d16394cdd785d008cf2a2d81c5cda35.camel@intel.com>
 <aWpcDrGVLrZOqdcg@google.com>
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
In-Reply-To: <aWpcDrGVLrZOqdcg@google.com>
X-Originating-IP: [10.106.82.9]
X-ClientProxiedBy: EX19D008EUC003.ant.amazon.com (10.252.51.205) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_093319_225005_732D47DF 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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



On 16/01/2026 15:41, Sean Christopherson wrote:
> On Fri, Jan 16, 2026, Rick P Edgecombe wrote:
>> On Fri, 2026-01-16 at 15:02 +0000, Nikita Kalyazin wrote:
>>>> TDX does some clearing at the direct map mapping for pages that
>>>> comes from gmem, using a special instruction. It also does some
>>>> clflushing at the direct map address for these pages. So I think we
>>>> need to make sure TDs don't pull from gmem fds with this flag.
>>>
>>> Would you be able to give a pointer on how we can do that?  I'm not
>>> very familiar with the TDX code.
>>
>> Uhh, that is a good question. Let me think.
> 
> Pass @kvm to kvm_arch_gmem_supports_no_direct_map() and then return %false if
> it's a TDX VM.

Sounds good to me, thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
