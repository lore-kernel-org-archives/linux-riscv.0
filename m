Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A4FD68BCD
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Haq7ADY4YaPT12nnENaZqpN3Dxso5oL1VjG5c2Qst5M=; b=etTWqFvuY1pP5a
	+u/EfKkT1l2ctp1P9ZmWoUcLXt8eeIFgIamGlXoRh/fmJRKWcd3twDF7uwnePXC6TzYmGE9bg5/We
	zuoOLgoKR4DqUto0Bj3vQ2e0mcDy905Das3zPPhW24Eu3EvAcMx2+FTwR1P0Ow0lIT0iMO/fxmpiX
	qtCAHG7zFsBhBAUeqlF4wRq8HiUr9WgcP7IGxXvUTLx/bX1fLal7JrrCPBrekfaNHpLZTO92NuO9J
	x2BL1qMQyIPT2iBDGPqj6jEsmbXWW6SRUSMAIjqGmrn4q8yKLN25TzSX3pg7PSX1DUO0r/jd/unF9
	wiycoy1ty1YYya9DkHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC03J-00000003Xdh-23N2;
	Fri, 15 Nov 2024 17:24:13 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC03G-00000003Xb0-1ZDJ;
	Fri, 15 Nov 2024 17:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1731691450; x=1763227450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Bk0JymAs/OEj+UcEvmUanxee/ezdfeE24i85gdC/NwU=;
  b=LCAoJk7AbyeCpFaUK4clMR069EWBeQDnZ3Hchv9d2HUdkDAyXhEYe03a
   9y/k1nq7YTXowCDrtE4r1WEK76JH8/X54be4Pp3RgP6VsiN4ODb373JKW
   XMVHgSy9fdVOOOenGeiPeily1mNvIwO1kKgBsC2meW2CQDkT1RH6T7O1w
   g=;
X-IronPort-AV: E=Sophos;i="6.12,157,1728950400"; 
   d="scan'208";a="470536855"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 17:24:02 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:38135]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.223:2525] with esmtp (Farcaster)
 id 5ff6a4b3-184c-4e50-9e2d-e5baf28ad41c; Fri, 15 Nov 2024 17:24:01 +0000 (UTC)
X-Farcaster-Flow-ID: 5ff6a4b3-184c-4e50-9e2d-e5baf28ad41c
Received: from EX19D003UWB004.ant.amazon.com (10.13.138.24) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 15 Nov 2024 17:23:56 +0000
Received: from EX19MTAUWC002.ant.amazon.com (10.250.64.143) by
 EX19D003UWB004.ant.amazon.com (10.13.138.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 15 Nov 2024 17:23:56 +0000
Received: from email-imr-corp-prod-pdx-all-2b-a57195ef.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Fri, 15 Nov 2024 17:23:56 +0000
Received: from [127.0.0.1] (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-pdx-all-2b-a57195ef.us-west-2.amazon.com (Postfix) with ESMTPS id AE0FAA04A5;
	Fri, 15 Nov 2024 17:23:48 +0000 (UTC)
Message-ID: <81d14448-29eb-4496-b876-ef6de526a840@amazon.co.uk>
Date: Fri, 15 Nov 2024 17:23:47 +0000
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
 <f1f34ac0-d505-4982-aad9-86a0db9f4a35@amazon.co.uk>
 <dcdce8e1-51da-42da-a892-59c6ccd9de23@redhat.com>
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
In-Reply-To: <dcdce8e1-51da-42da-a892-59c6ccd9de23@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_092410_467588_F894152D 
X-CRM114-Status: GOOD (  13.92  )
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



On Fri, 2024-11-15 at 17:10 +0000, David Hildenbrand wrote:
>> [...]
>>
>> I've talked to Fares internally, and it seems that generally doing
>> mm-local mappings of guest memory would work for us. We also figured out
>> what the "interrupt problem" is, namely that if we receive an interrupt
>> while executing in a context that has mm-local mappings available, those
>> mappings will continue to be available while the interrupt is being
>> handled.
> 
> Isn't that likely also the case with secretmem where we removed the
> directmap, but have an effective per-mm mapping in the (user-space
> portion) of the page table?

Mh, that's an excellent point, I never thought of that. But with
secretmem, the memory would still be protected by SMAP (admittedly, I
have no idea how much this is worth in the face of all these speculative
issues), right?

>> I'm talking to my security folks to see how much of a concern
>> this is for the speculation hardening we're trying to achieve. Will keep
>> you in the loop there :)
> 
> Thanks!
> 
> -- 
> Cheers,
> 
> David / dhildenb

Best,
Patrick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
