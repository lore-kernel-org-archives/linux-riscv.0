Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA18AD68BCD
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Al33wn9YNzRprA+DD1O5wciNYi+y6SwYZf66t5PHLM=; b=p6eXMdtn/RSsOg
	E1v3JADbDyuGWRSar/W4JX6U/Ee+7Asj2INEMONWdRV6is94auLlnyUtQStR7/6cvAp0QfvKGkn4R
	r1pYNEI5teog9tz7pzs2sg6smpfJ9EG/Ej/NNkbZxFFVoDqsm1e10t2qzIoB/duPSW8gYYhgW1Zn4
	eYHjeTrhSJV3+Xb5W2BY6KBuySxYsq6GSekSwOsrsehFTJ9vsZjUu3S+MQn9UgMnNBnI29q3S4Ho9
	grix2MDvGVo1/aaAEDElXdTBr/zJdK7GMLLyyAQCxtLuGOgsUVrllgRNW89RAz9ZnhhLxexwiPYlf
	7D/zqWK85oWTgtMGvtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzfW-00000003SgP-40Tm;
	Fri, 15 Nov 2024 16:59:38 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzfU-00000003Seq-3EDv;
	Fri, 15 Nov 2024 16:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1731689976; x=1763225976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r+ZYPqHoQHDHwa2VIgKNI6m+YZlhrBPHGnCuiE8lbJI=;
  b=RQbvrV8cNR/ILWFeM+8K8oeGK1smZl0mCXxL1fWiyLQa0kl62twgOoIc
   M+m+kDnjLZrsswhTBgZW6g1zID5YLaHWlx2lr+N4F5g0C8RIo6v2FhaEN
   2uwAe28IS520CZJ4xm6Dfhr6W7Kv28W6TU2YD8iCTPJD5Y92J+ol6t5EC
   o=;
X-IronPort-AV: E=Sophos;i="6.12,157,1728950400"; 
   d="scan'208";a="41628339"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 16:59:29 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:9599]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.54:2525] with esmtp (Farcaster)
 id 2d14af0a-2929-4c9e-8d1e-34cbf239d5b8; Fri, 15 Nov 2024 16:59:28 +0000 (UTC)
X-Farcaster-Flow-ID: 2d14af0a-2929-4c9e-8d1e-34cbf239d5b8
Received: from EX19D003UWB004.ant.amazon.com (10.13.138.24) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 15 Nov 2024 16:59:20 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D003UWB004.ant.amazon.com (10.13.138.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 15 Nov 2024 16:59:20 +0000
Received: from email-imr-corp-prod-iad-all-1b-85daddd1.us-east-1.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Fri, 15 Nov 2024 16:59:19 +0000
Received: from [127.0.0.1] (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-iad-all-1b-85daddd1.us-east-1.amazon.com (Postfix) with ESMTPS id 3F35B404E4;
	Fri, 15 Nov 2024 16:59:14 +0000 (UTC)
Message-ID: <f1f34ac0-d505-4982-aad9-86a0db9f4a35@amazon.co.uk>
Date: Fri, 15 Nov 2024 16:59:13 +0000
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
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<faresx@amazon.com>
References: <20241030134912.515725-1-roypat@amazon.co.uk>
 <4aa0ccf4-ebbe-4244-bc85-8bc8dcd14e74@redhat.com>
 <27646c08-f724-49f7-9f45-d03bad500219@amazon.co.uk>
 <d1a69eb7-85d5-4ffa-88e2-f4841713c1d7@redhat.com>
 <90c9d8c0-814e-4c86-86ef-439cb5552cb6@amazon.co.uk>
 <10e4d078-3cdb-4d1c-a1a3-80e91b247217@redhat.com>
 <02f77d32-e2a1-431b-bb67-33d36c06acd3@amazon.co.uk>
 <f4c5d0a6-a582-44e3-8949-c199cc0bfba7@redhat.com>
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
In-Reply-To: <f4c5d0a6-a582-44e3-8949-c199cc0bfba7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_085937_069570_7B1D58DD 
X-CRM114-Status: GOOD (  22.60  )
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



On Tue, 2024-11-12 at 14:52 +0000, David Hildenbrand wrote:
> On 12.11.24 15:40, Patrick Roy wrote:
>> I remember talking to someone at some point about whether we could reuse
>> the proc-local stuff for guest memory, but I cannot remember the outcome
>> of that discussion... (or maybe I just wanted to have a discussion about
>> it, but forgot to follow up on that thought?).  I guess we wouldn't use
>> proc-local _allocations_, but rather just set up proc-local mappings of
>> the gmem allocations that have been removed from the direct map.
> 
> Yes. And likely only for memory we really access / try access, if possible.

Well, if we start on-demand mm-local mapping the things we want to
access, we're back in TLB flush hell, no? And we can't know
ahead-of-time what needs to be mapped, so everything would need to be
mapped (unless we do something like mm-local mapping a page on first
access, and then just never unmapping it again, under the assumption
that establishing the mapping won't be expensive)

>>
>> I'm wondering, where exactly would be the differences to Sean's idea
>> about messing with the CR3 register inside KVM to temporarily install
>> page tables that contain all the gmem stuff, conceptually? Wouldn't we
>> run into the same interrupt problems that Sean foresaw for the CR3
>> stuff? (which, admittedly, I still don't quite follow what these are :(
>> ).
> 
> I'd need some more details on that. If anything would rely on the direct
> mapping (from IRQ context?) than ... we obviously cannot remove the
> direct mapping :)

I've talked to Fares internally, and it seems that generally doing
mm-local mappings of guest memory would work for us. We also figured out
what the "interrupt problem" is, namely that if we receive an interrupt
while executing in a context that has mm-local mappings available, those
mappings will continue to be available while the interrupt is being
handled. I'm talking to my security folks to see how much of a concern
this is for the speculation hardening we're trying to achieve. Will keep
you in the loop there :)

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
