Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F87C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:18:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0FA613AB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0FA613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XZFGpjvIJ5YWspXvYimsR4csQ6lmWL/5s8+vsmhF5/g=; b=S1B3LlPIvFW31yfwRO2UsH5mn
	Yzf2XqzBituYK8ukio/KWo5S1TfzXf5RqMPyth//3NFppDX8KOYVARKSHIqinAJrwFQnucE3Hcln+
	baXrOwdidcPihV2NJtfXw5jJ9xhV1k5kUein4HdJZLDeqSNfQUtzvZiJsJT6qt6M1laoI148JHwgd
	TNkUIkLCgj0e3YUmhsr6mf17SAuI1ehpfr8gPR/+1N4sY4BCv+KdMCml4b7lfrv9iKylDx2pSBHCI
	5OJDkh7edLsz6iWopJX+nwikpeUeVTQogsdNW48x1WXcAwVhwvFtFEEb52Rxfl6sFXyBMhi5yE/TO
	b0L6ln0Ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYs8g-00CRsy-8g; Tue, 20 Apr 2021 15:18:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs8e-00CRsn-2h
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 15:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=I5ndW6k8mLw6k1PzLhNPYJ9rDrEc5/TU+m57YMg1P3Q=; b=oEpCRGK65wTjfCQ/CUIVyAAg3s
 TSQcwFNgE+j+0hmWv9WTRj9M02eRIA3ZuO65of+y6Hb6aliWjB1ryJ6p5DZ6xyvFqUW0AdaJtHohS
 4bYQfIvDzXyNMV53srQFMyevGMBOsRTfQZ1W6yJMjVQX5ly4FAePyaFFTs0gYSLOpQaT4lwMPsXcu
 8WDVeU8NV/f6RL9wkbpBY9hkJT269JHvMnv+S2ScPPJw6iEeRz/zrku0AFH+oNxSmnMRWzlS/HfTQ
 X3gIXo0KIxzKbBScaC3gMR+iwATCf2TsSviXyrzeVSrT8W7i5R/C2wOGnL20gyP4umgx73BFPW4Pn
 7GwRuv2A==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYs8b-00CEA3-H3
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 15:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618931884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5ndW6k8mLw6k1PzLhNPYJ9rDrEc5/TU+m57YMg1P3Q=;
 b=QFO9Tz1K14ojRc0Ur8YaRpu7HffNsZzrA93cd5y7I1UfBEO775ZhgTgnsGIFvCx76KMn3d
 u3vfMqPdlkh+SlHn+Yiac2yTojPywjqv1QZ4kknEqod/xwcxzXLyFJ7TfKVbhMDXM+PuX3
 U/3zkkvp7QSBQml6j9K0Icd2ndEQNTI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-IbeR32h7Oi6sxj4oRpvAhg-1; Tue, 20 Apr 2021 11:18:02 -0400
X-MC-Unique: IbeR32h7Oi6sxj4oRpvAhg-1
Received: by mail-ed1-f70.google.com with SMTP id
 bf25-20020a0564021a59b0290385169cebf8so5915213edb.8
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 08:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I5ndW6k8mLw6k1PzLhNPYJ9rDrEc5/TU+m57YMg1P3Q=;
 b=SzqskS8WqSYjxqCjOQrC7DEetpod0sZZt+BT0NWRMqK7SQiY1jYYu4U4afNG9xzvfI
 sU1qd285uSn5kceWN/bCDcRYxkIpeCbInhmbp4fAuXUQWZGuv9AtlqW+lKCKlCFZjERq
 qi7J2A+2YmOhwBHj9dmrqoexNEGRqZq0g9iUROZH9z9/+i2/hB7XQumBWEONxYsDSmTJ
 82gCBraYzCRuiP0EcLSpYYU2c3ZLv16i7lj5aV6c65ExHYxGMjnYC3OUvN9M/7am06fi
 yynPnOf2cSW3EaDlaEdEdFZxGJqEPnb5aIKeXTfEFSOdIU/zD3k69CoRWbQLr+3+YQ/V
 U6zQ==
X-Gm-Message-State: AOAM5300u6HqQxe/JQsrAs3MWdHIBp4DgvC+r4Mo5Y7mMeGoa1vdrixE
 fH6ESln7Ikb9QaLZ+X6l/YfyLv+SWG+TdAh6V2U9HCov671XoZC4n9uPIkrK0T4vATW2rRc3V+K
 ubhsLCnjycp2Tn8UEc6YhTFE4KfMl
X-Received: by 2002:aa7:c683:: with SMTP id n3mr32232734edq.214.1618931880951; 
 Tue, 20 Apr 2021 08:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKrP/Z3igfJPaQi8yJZtC2FjNZPIjMXhA64NexGRfIVc/CrlZnXvE6wVD3xtThrpBxYqmr/Q==
X-Received: by 2002:aa7:c683:: with SMTP id n3mr32232708edq.214.1618931880725; 
 Tue, 20 Apr 2021 08:18:00 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 a17sm13193206ejx.13.2021.04.20.08.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:18:00 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] secretmem/gup: don't check if page is secretmem
 without reference
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210420150049.14031-1-rppt@kernel.org>
 <20210420150049.14031-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f906a634-ee25-5a8b-6cdf-3651832dbe99@redhat.com>
Date: Tue, 20 Apr 2021 17:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420150049.14031-2-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_081805_671700_CFD65579 
X-CRM114-Status: GOOD (  21.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 20.04.21 17:00, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The check in gup_pte_range() whether a page belongs to a secretmem mapping
> is performed before grabbing the page reference.
> 
> To avoid potential race move the check after try_grab_compound_head().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   mm/gup.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index c3a17b189064..6515f82b0f32 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2080,13 +2080,15 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>   		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
>   		page = pte_page(pte);
>   
> -		if (page_is_secretmem(page))
> -			goto pte_unmap;
> -
>   		head = try_grab_compound_head(page, 1, flags);
>   		if (!head)
>   			goto pte_unmap;
>   
> +		if (unlikely(page_is_secretmem(page))) {
> +			put_compound_head(head, 1, flags);
> +			goto pte_unmap;
> +		}
> +
>   		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
>   			put_compound_head(head, 1, flags);
>   			goto pte_unmap;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
