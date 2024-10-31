Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D4E68974
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9gs8AO5y1wlbw6UCojltIHWx5dfG/odfK6r2KFCsac=; b=2ErxZ+7SbGqUV/
	neUd/OzXB4BBZ2Jjqnuaq0fcRJxrj0l60Og1HnZahSmlq5g2XWXbItNkmSChsw+LwFD8REwH1Y60t
	emmBclXqjRhKSLsGfP6vC3hO+E6/mYpWIAN8dSrol5LMwd5Ufq2kF9aL968mgCFcA3dIYHXmao6G4
	b0XJJu7aZF1NIrflmITpPymhFTkXJarFl1gLGSZBEq1zbhuOeSPLjmEfFcMB8TBFUhWqZb75RuEgi
	V0cg5Kfu34lFhmWjFbmr0ukbfYysiKzVEy0KQjVqTugi8aB8ibS/ZvMvW7+Cegl710wM05caPqE5+
	x5mI0w5WnBCRch91Dpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SdJ-00000003Has-0Y9r;
	Thu, 31 Oct 2024 10:42:29 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SdF-00000003HZX-3T3d;
	Thu, 31 Oct 2024 10:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1730371346; x=1761907346;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2XSQmg9XPL/tUl5Uy9X9cqzqndsoHfM/nyIda+DnmYs=;
  b=G1ybttS3y3zx+KEFtHXzeCg7NdXJenfGQeVa3GuZ6ji81NAGtPbD11jN
   8dgTsRI5WNNTysregZm4Heg1qvpRjE6/KBBofi/MR8lBUpVE0HbJL7xmn
   MsNmv4HBhTfTN0qU8KXXJl/QzfwdlUdmfyGdi8nGNEfa4xMZEzfffU6CX
   0=;
X-IronPort-AV: E=Sophos;i="6.11,247,1725321600"; 
   d="scan'208";a="37873631"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 10:42:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:53488]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.121:2525] with esmtp (Farcaster)
 id f575b9e2-c87c-4dc7-9ccf-8641a67b176b; Thu, 31 Oct 2024 10:42:18 +0000 (UTC)
X-Farcaster-Flow-ID: f575b9e2-c87c-4dc7-9ccf-8641a67b176b
Received: from EX19D003UWB002.ant.amazon.com (10.13.138.11) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 31 Oct 2024 10:42:09 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D003UWB002.ant.amazon.com (10.13.138.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 31 Oct 2024 10:42:09 +0000
Received: from email-imr-corp-prod-iad-all-1b-a03c1db8.us-east-1.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Thu, 31 Oct 2024 10:42:08 +0000
Received: from [127.0.0.1] (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-iad-all-1b-a03c1db8.us-east-1.amazon.com (Postfix) with ESMTPS id 524C0804C3;
	Thu, 31 Oct 2024 10:42:02 +0000 (UTC)
Message-ID: <27646c08-f724-49f7-9f45-d03bad500219@amazon.co.uk>
Date: Thu, 31 Oct 2024 10:42:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
To: David Hildenbrand <david@redhat.com>, <tabba@google.com>,
	<quic_eberman@quicinc.com>, <seanjc@google.com>, <pbonzini@redhat.com>,
	<jthoughton@google.com>, <ackerleytng@google.com>, <vannapurve@google.com>,
	<rppt@kernel.org>
CC: <graf@amazon.com>, <jgowans@amazon.com>, <derekmn@amazon.com>,
	<kalyazin@amazon.com>, <xmarcalx@amazon.com>, <linux-mm@kvack.org>,
	<corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <hca@linux.ibm.com>,
	<gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
	<svens@linux.ibm.com>, <gerald.schaefer@linux.ibm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <shuah@kernel.org>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20241030134912.515725-1-roypat@amazon.co.uk>
 <4aa0ccf4-ebbe-4244-bc85-8bc8dcd14e74@redhat.com>
From: Patrick Roy <roypat@amazon.co.uk>
Content-Language: en-US
Autocrypt: addr=roypat@amazon.co.uk; keydata=
 xjMEY0UgYhYJKwYBBAHaRw8BAQdA7lj+ADr5b96qBcdINFVJSOg8RGtKthL5x77F2ABMh4PN
 NVBhdHJpY2sgUm95IChHaXRodWIga2V5IGFtYXpvbikgPHJveXBhdEBhbWF6b24uY28udWs+
 wpMEExYKADsWIQQ5DAcjaM+IvmZPLohVg4tqeAbEAgUCY0UgYgIbAwULCQgHAgIiAgYVCgkI
 CwIEFgIDAQIeBwIXgAAKCRBVg4tqeAbEAmQKAQC1jMl/KT9pQHEdALF7SA1iJ9tpA5ppl1J9
 AOIP7Nr9SwD/fvIWkq0QDnq69eK7HqW14CA7AToCF6NBqZ8r7ksi+QLOOARjRSBiEgorBgEE
 AZdVAQUBAQdAqoMhGmiXJ3DMGeXrlaDA+v/aF/ah7ARbFV4ukHyz+CkDAQgHwngEGBYKACAW
 IQQ5DAcjaM+IvmZPLohVg4tqeAbEAgUCY0UgYgIbDAAKCRBVg4tqeAbEAtjHAQDkh5jZRIsZ
 7JMNkPMSCd5PuSy0/Gdx8LGgsxxPMZwePgEAn5Tnh4fVbf00esnoK588bYQgJBioXtuXhtom
 8hlxFQM=
In-Reply-To: <4aa0ccf4-ebbe-4244-bc85-8bc8dcd14e74@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_034226_063699_D0A009D3 
X-CRM114-Status: GOOD (  19.88  )
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

On Thu, 2024-10-31 at 09:50 +0000, David Hildenbrand wrote:
> On 30.10.24 14:49, Patrick Roy wrote:
>> Unmapping virtual machine guest memory from the host kernel's direct map
>> is a successful mitigation against Spectre-style transient execution
>> issues: If the kernel page tables do not contain entries pointing to
>> guest memory, then any attempted speculative read through the direct map
>> will necessarily be blocked by the MMU before any observable
>> microarchitectural side-effects happen. This means that Spectre-gadgets
>> and similar cannot be used to target virtual machine memory. Roughly 60%
>> of speculative execution issues fall into this category [1, Table 1].
>>
>> This patch series extends guest_memfd with the ability to remove its
>> memory from the host kernel's direct map, to be able to attain the above
>> protection for KVM guests running inside guest_memfd.
>>
>> === Changes to v2 ===
>>
>> - Handle direct map removal for physically contiguous pages in arch code
>>    (Mike R.)
>> - Track the direct map state in guest_memfd itself instead of at the
>>    folio level, to prepare for huge pages support (Sean C.)
>> - Allow configuring direct map state of not-yet faulted in memory
>>    (Vishal A.)
>> - Pay attention to alignment in ftrace structs (Steven R.)
>>
>> Most significantly, I've reduced the patch series to focus only on
>> direct map removal for guest_memfd for now, leaving the whole "how to do
>> non-CoCo VMs in guest_memfd" for later. If this separation is
>> acceptable, then I think I can drop the RFC tag in the next revision
>> (I've mainly kept it here because I'm not entirely sure what to do with
>> patches 3 and 4).
> 
> Hi,
> 
> keeping upcoming "shared and private memory in guest_memfd" in mind, I
> assume the focus would be to only remove the direct map for private memory?
> 
> So in the current upstream state, you would only be removing the direct
> map for private memory, currently translating to "encrypted"/"protected"
> memory that is inaccessible either way already.
> 
> Correct?

Yea, with the upcomming "shared and private" stuff, I would expect the
the shared<->private conversions would call the routines from patch 3 to
restore direct map entries on private->shared, and zap them on
shared->private.

But as you said, the current upstream state has no notion of "shared"
memory in guest_memfd, so everything is private and thus everything is
direct map removed (although it is indeed already inaccessible anyway
for TDX and friends. That's what makes this patch series a bit awkward
:( )

> -- 
> Cheers,
> 
> David / dhildenb
> 

Best, 
Patrick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
