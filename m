Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82241C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5C420878
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4/v3wga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="izoUNn+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5C420878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+oI1jnLJHrfN5d3pMB4L3AY2EHAVTtuL6k00SPlIIuo=; b=Z4/v3wga3rYkcD643s2NXe3WI
	9hhhpTcG0IdA6a4rJLoDbN4cfFjZYtdF4w1xkOFLb+6DuNsfjvp1VqUOWCiMVXy9kTxFAbORy10AN
	6zTZnLADFRqL85bARVl6abMO+0II40sZ1Nl8Sk8NSOo5GvKG7mu25BUjo1N/mH88ybJbLm94j1Rgs
	+AEboghcznIbt60mgFsn9j+Or6RFVjmMeghhiOzUXMc5ZfpaBocJIyAXoGQv9U9+X6eQkIZFTZnoP
	4++oPDX4OuVhralGNuGLsRp8YgXArJrx//ExfiQ8tIT7neCKTJdtZmp91V8ouSH9Mt9pRsYFBahmL
	9Ccf1EWXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXK60-0000DV-8G; Tue, 27 Oct 2020 08:12:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXK5y-0000CS-FE
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 08:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603786361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAcngyuptikvYGGpjHccIA10XCuP57p7z320i7MuxeE=;
 b=izoUNn+IN3+rLS+uPI2ugr4fH+bhc/8RPUCdLmHQIEXxgvGOf/wvzyyTrPB7qcmHFQ2/9k
 jP0M+oSqKNyCy5F/nPCcgGu5+Edrzwpx40MNjSwx+9dsA4lbuVaukTsfGMoLisbpSEBr0C
 4lEF0MXlDJeKQKu8jfH/D549QgKlgzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-Q8AvrUgQOMaVTr9oXfijqA-1; Tue, 27 Oct 2020 04:12:38 -0400
X-MC-Unique: Q8AvrUgQOMaVTr9oXfijqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1338664085;
 Tue, 27 Oct 2020 08:12:33 +0000 (UTC)
Received: from [10.36.113.185] (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB67E5B4B3;
 Tue, 27 Oct 2020 08:12:24 +0000 (UTC)
Subject: Re: [PATCH v7 3/7] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20201026083752.13267-1-rppt@kernel.org>
 <20201026083752.13267-4-rppt@kernel.org>
 <e754ae3873e02e398e58091d586fe57e105803db.camel@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9202c4c1-9f1f-175f-0a85-fc8c30bc5e3b@redhat.com>
Date: Tue, 27 Oct 2020 09:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e754ae3873e02e398e58091d586fe57e105803db.camel@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_041242_601973_74F24873 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "shuah@kernel.org" <shuah@kernel.org>, "cl@linux.com" <cl@linux.com>,
 "Reshetova, Elena" <elena.reshetova@intel.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "tycho@tycho.ws" <tycho@tycho.ws>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "will@kernel.org" <will@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 26.10.20 20:01, Edgecombe, Rick P wrote:
> On Mon, 2020-10-26 at 10:37 +0200, Mike Rapoport wrote:
>> +++ b/arch/x86/mm/pat/set_memory.c
>> @@ -2184,14 +2184,14 @@ static int __set_pages_np(struct page *page,
>> int numpages)
>>         return __change_page_attr_set_clr(&cpa, 0);
>>  }
>>  
>> -int set_direct_map_invalid_noflush(struct page *page)
>> +int set_direct_map_invalid_noflush(struct page *page, int numpages)
>>  {
>> -       return __set_pages_np(page, 1);
>> +       return __set_pages_np(page, numpages);
>>  }
>>  
>> -int set_direct_map_default_noflush(struct page *page)
>> +int set_direct_map_default_noflush(struct page *page, int numpages)
>>  {
>> -       return __set_pages_p(page, 1);
>> +       return __set_pages_p(page, numpages);
>>  }
> 
> Somewhat related to your other series, this could result in large NP
> pages and trip up hibernate.
> 

It feels somewhat desirable to disable hibernation once secretmem is
enabled, right? Otherwise you'll be writing out your secrets to swap,
where they will remain even after booting up again ...

Skipping secretmem pages when hibernating is the wrong approach I guess ...

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
