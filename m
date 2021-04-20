Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47842C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:20:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966E16101C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 966E16101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nsIYLDqVtPLAR5x4TKPn0qc4dC5gJrfkZa2iMJIXcvI=; b=k5wQWvR5caDhT2ANXfLy2whqU
	Qst6Me9B7Gbx7HwcwMt9JRfD7JtTsPEK6yv9hO8CGG6MELeN+P1maBumQw4+phwmS1NTBlJ+5IEFA
	42n57BVYOBLXfXwsl7HC700DkhbXFGEOSIWm7o7u8UNtHr7c9MPsDs0ozMuSKdCZnk/lpTeJEjD2j
	9Ru2htqD+uFVZhdtbAKk4xK/MteVNvV7h1AsHEpHi8RSepn2sYkEmSPyxGyZHBsnA+fZXODfNIuaE
	+7R5UL5h2F8mCeepj68YsphT/nI1NLm38wqv/yKcux9fkeudeRVCzZfiDpJg76LVcKDRzUr46NLIw
	gWV9XDQqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqIg-00CC3R-VH; Tue, 20 Apr 2021 13:20:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqIU-00CC1t-HP
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 13:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=QYX7/AuHi6hgPHf6tRYqK2+HrNaM+fnSnNKD7KzrRzs=; b=ciuh+kyfNk69WwKRGXeWDwtfyc
 CNXSM4WMGCamK6c4HJX9Ko6udTYVVdJo1czm4GyIZfUf8AG3X5knBlAwJRNJiGhnSb2s52yesp/ee
 Zp4SvidUBgH7qZiw5mVCVWsXS3/LypIhIb/r3m6OONWikZeAb7auSyZaZpnOxAfcMxn3hIVj49gYQ
 Hktg03BL1iHxkqHsXwqinzJq2S3QkPF0wLPwtFCHeWEjc3GUCk32slrejh9i2XXe2FMCTMXybkWP9
 bDEe3PvPz7Zx8ddk7DMjrJNg/5l8+XYUr45JXzE0gQmqJq8K4YtGoFiMay3KRLtc6Xq+oulp0nWLA
 /J8SqMyA==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqIR-00C8aM-WE
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 13:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618924807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYX7/AuHi6hgPHf6tRYqK2+HrNaM+fnSnNKD7KzrRzs=;
 b=fTJz8bd2ajNGxw3Wb3iuvAa697e6s5nqngRdfCpc4QSuwXa+4b3Ns021ap1NSxes5I1tkU
 vN00C0U/pMpPm++E9UBYrjezKjQRjvV3Xv818NwieI100DoaVSw8pF9PkD3vfPXuiMw1UX
 IInzwU2vtekwVA6cAfRr7XzgGkT2PtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-2-MjfekdOh6JwJH7pswGnw-1; Tue, 20 Apr 2021 09:20:00 -0400
X-MC-Unique: 2-MjfekdOh6JwJH7pswGnw-1
Received: by mail-wr1-f71.google.com with SMTP id
 91-20020adf92640000b02901060747826eso9097184wrj.13
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QYX7/AuHi6hgPHf6tRYqK2+HrNaM+fnSnNKD7KzrRzs=;
 b=QgPERj+HGG96f09KwnwGylcJuXFAzmJ/4QAYNQ6WXtiGJd23lIngLFG9Y/+Z9PG4x/
 JZMNwDByr2vZNcIjck5zlv+mwQbrNu+1fvp3Jj82hw3+4sZM8KT4SoGatjtVqt6m5cbo
 acj6DP41sC1zwgDyaFZ7rP2GeijiTRhpghHoNSjEca+LlkctrohvyhVSiTPK0Gv46zdV
 HTBKIVpmiOwt7WZWwkPiECfFNQeH7cWWftfg8rBDivkRbb5kvBIAnArwYPbc7NSwFI8v
 sVNnSpaIVyswBBEJlL8OuFeHgAUDYRoQWlThd224gurAbEu7LywvvXKC2FEoxOOkuOL0
 yQAQ==
X-Gm-Message-State: AOAM530vNqz+SlNVM98wAF7/KOGJmI7Sy+nGh5TWiFtflBI/o3TWyjxl
 +jtSbUoJ1Z/FzVBmE21jpp3z8mzkRf05i4+lB2lK8ZCVZ94e1TOtLnYXcJLyPfg4se1TmlEDBfx
 Ya7yRu+ypiA+Uf2jJlWuBVoM3Rn81
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr20916785wrx.19.1618924799173; 
 Tue, 20 Apr 2021 06:19:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfOGjRv02X/zmH7pcY7EIgqs8w+z5KR0gU0RfoaYN+dlGesRC5fI0lFDDiwZRbvB39JmbKYA==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr20916761wrx.19.1618924798995; 
 Tue, 20 Apr 2021 06:19:58 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 f6sm3291518wmf.28.2021.04.20.06.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:19:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] secretmem/gup: don't check if page is secretmem
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
References: <20210420131611.8259-1-rppt@kernel.org>
 <20210420131611.8259-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <95b7fa81-f72e-c63f-0456-4c25dee8a5eb@redhat.com>
Date: Tue, 20 Apr 2021 15:19:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420131611.8259-2-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062008_125376_D81CD098 
X-CRM114-Status: GOOD (  22.39  )
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

On 20.04.21 15:16, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The check in gup_pte_range() whether a page belongs to a secretmem mapping
> is performed before grabbing the page reference.
> 
> To avoid potential race move the check after try_grab_compound_head().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   mm/gup.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index c3a17b189064..4b58c016e949 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2080,13 +2080,13 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
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
> +		if (page_is_secretmem(page))
> +			goto pte_unmap;
> +

Looking at the hunk below, I wonder if you're missing a put_compound_head().

(also, I'd do if unlikely(page_is_secretmem()) but that's a different 
discussion)

>   		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
>   			put_compound_head(head, 1, flags);
>   			goto pte_unmap;
> 


-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
