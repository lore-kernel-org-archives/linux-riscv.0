Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23502D42B8E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNjI/rD6y3oOwiiXfzl6kzph24eqgBxs8nxYMRKTM44=; b=pz0KLNBgq0bpLs
	tCl+1qB9dLfGPA+7B2HpM9HeWZba3fa+T8gp2hmSz5XqGXmvYItoELZj1ebhExVoucQ2DKjz8lYjV
	Q+DiURmunApDUd+BNLLe4d7DgG1N4GkI06TEyCRGM5+tYJ6D7CzQifKD+qynuKiIbN5iypSck8pBo
	Sqk5gLyO0X/H6CtRBDXnEWFGxyjeBnJjWMlcG3X2MprBzcyC4QEmQx3khYqKRPgwLNBhZbE4ztglA
	cU21/WBMdhFQ5gOu1lbbvCgAZJ8sEF+jGkl/VrshCyBmjIVzovMHLaKuADiftJPLXJMeY4K/wgD0B
	h6tKvmK2SN2RdlMHyaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsJj-00000003qXe-00w9;
	Tue, 12 Nov 2024 14:56:31 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsCe-00000003ots-2I6Y;
	Tue, 12 Nov 2024 14:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1731422953; x=1762958953;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jmAWYVWTItYY6sYiriVLXoFyHZtABKNORDlLDv0YA8o=;
  b=eftSeqtAHquxUn222RRkgQdn4Di4itqbY3B42T0O+k6S+nXLZ76jJV1e
   3UKGmzkWUNOsfaEyQqdAJxmS1l8DfrwZVJiJGAL0bwzsqSNNRPu7Rk4cb
   2Chw5kbgzB2uBPuhER+MFy0pboo40n1pI8gaCvpPZ4Vbj8VUaX3C+8ZVh
   Y=;
X-IronPort-AV: E=Sophos;i="6.12,148,1728950400"; 
   d="scan'208";a="384565955"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:49:07 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.10.100:13328]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.18.131:2525] with esmtp (Farcaster)
 id 10c75058-a729-46eb-ac89-a0cf40349664; Tue, 12 Nov 2024 14:49:05 +0000 (UTC)
X-Farcaster-Flow-ID: 10c75058-a729-46eb-ac89-a0cf40349664
Received: from EX19D030EUC001.ant.amazon.com (10.252.61.228) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 12 Nov 2024 14:48:58 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D030EUC001.ant.amazon.com (10.252.61.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 12 Nov 2024 14:48:58 +0000
Received: from email-imr-corp-prod-pdx-all-2c-619df93b.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Tue, 12 Nov 2024 14:48:57 +0000
Received: from [127.0.0.1] (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-pdx-all-2c-619df93b.us-west-2.amazon.com (Postfix) with ESMTPS id 842D1402F3;
	Tue, 12 Nov 2024 14:48:49 +0000 (UTC)
Message-ID: <bb534fec-b45d-4ff8-aa55-7201766936b5@amazon.co.uk>
Date: Tue, 12 Nov 2024 14:48:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/6] arch: introduce set_direct_map_valid_noflush()
To: Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
	<tabba@google.com>, <quic_eberman@quicinc.com>, <seanjc@google.com>,
	<pbonzini@redhat.com>, <jthoughton@google.com>, <ackerleytng@google.com>,
	<vannapurve@google.com>, <rppt@kernel.org>
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
 <20241030134912.515725-2-roypat@amazon.co.uk>
 <a774e13e-0616-4d96-bb51-bac0fcb2cb9b@redhat.com>
 <440b2682-dbfb-4a5c-927c-2397413a7f9c@suse.cz>
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
In-Reply-To: <440b2682-dbfb-4a5c-927c-2397413a7f9c@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_064912_699890_1F0F946C 
X-CRM114-Status: GOOD (  24.28  )
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



On Mon, 2024-11-11 at 12:12 +0000, Vlastimil Babka wrote:
> On 10/31/24 10:57, David Hildenbrand wrote:
>> On 30.10.24 14:49, Patrick Roy wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> From: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>
>>> Add an API that will allow updates of the direct/linear map for a set of
>>> physically contiguous pages.
>>>
>>> It will be used in the following patches.
>>>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
>>
>>
>> [...]
>>
>>>   #ifdef CONFIG_DEBUG_PAGEALLOC
>>>   void __kernel_map_pages(struct page *page, int numpages, int enable)
>>>   {
>>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
>>> index e7aec20fb44f1..3030d9245f5ac 100644
>>> --- a/include/linux/set_memory.h
>>> +++ b/include/linux/set_memory.h
>>> @@ -34,6 +34,12 @@ static inline int set_direct_map_default_noflush(struct page *page)
>>>      return 0;
>>>   }
>>>
>>> +static inline int set_direct_map_valid_noflush(struct page *page,
>>> +                                           unsigned nr, bool valid)
>>
>> I recall that "unsigned" is frowned upon; "unsigned int".
>>
>>> +{
>>> +    return 0;
>>> +}
>>
>> Can we add some kernel doc for this?
>>
>> In particular
>>
>> (a) What does it mean when we return 0? That it worked? Then, this
> 
> Seems so.
> 
>>      dummy function looks wrong. Or this it return the
> 
> That's !CONFIG_ARCH_HAS_SET_DIRECT_MAP and other functions around do it the
> same way. Looks like the current callers can only exist with the CONFIG_
> enabled in the first place.

Yeah, it looks a bit weird, but these functions seem to generally return
0 if the operation is not supported. ARM specifically has 

	if (!can_set_direct_map())
		return 0;

inside `set_direct_map_invalid_{noflush,default}`. Documenting this
definitely cannot hurt, I'll keep it on my todo list for the next
iteration :)

>>      number of processed entries? Then we'd have a possible "int" vs.
>>      "unsigned int" inconsistency.
>>
>> (b) What are the semantics when we fail halfway through the operation
>>      when processing nr > 1? Is it "all or nothing"?
> 
> Looking at x86 implementation it seems like it can just bail out in the
> middle, but then I'm not sure if it can really fail in the middle, hmm...

If I understood Mike correctly when talking about this at LPC, then it
can only fail if during break-up of huge mappings, it fails to allocate
page tables to hold the lower-granularity mappings (which happens before
any present bits are modified).

Best,
Patrick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
