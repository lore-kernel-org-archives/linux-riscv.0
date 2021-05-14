Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC8FC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:28:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E3A61457
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E3A61457
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=30wQjcDQ7JMyfj4bdm8gcDTwadOzSIhv5TL5ALgTt74=; b=H2SllKZg5Ot9JGZTcKIqnuCqM
	tEeKaR/2PEEOkHpNrtFsluB+ugrQbVYpiqwrF6rp/A+oGvylWcA1TNOXb2vhYh4d9WV1PsHNBjNdH
	7Xhux9F8Po5yiUE4PypHSC72g08+O42LxcTlH3OPpAY0FP6MylmoOgNDKVnW2xJqGHAOnwqm5yxxn
	mDHdEXl14C54kTuJPLLxgQjv+Pnz1kw4IlE70A+wCKdJhHJ9Z4ZCS7rPwrGr4JGe1Llt+rwKlogl2
	8Fjn598l7V3EnyrptyFwH0zTgfnWbpOi04PWWsBqqduvJ6GjOUp/cTzb1yNd82pK+oxdXadQNclyz
	gDTrn4ozw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTB2-007V56-Ls; Fri, 14 May 2021 08:28:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTAz-007V4S-A9
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 08:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1mI4ocY2raC+FaNmp1QLwbvQ7SwKQVD3QJeG7UD1jEM=; b=N9EmMtJjmQOmQdcgmEwkXhhGeV
 LCa5m4EeQZyhvfNHHN4k41YqVr54uyUmF2kvMumQOa6raVFQdvdWBWuGBIf/ns9tH89wBxJCsli2Q
 8oUA1FdvXDCfn9gJ3YxbPbCH/OZbz2/d4tML5TpBXd+wVC7yx5l508yef6xdvaSByUTDC1Jn0dFhy
 W1TGXeJqewxZmLU+Cl4oz/b+px863HXTSXSrFiyiERrANIj70/2kbDUk3R8IOfYugmZy3xGOWBHud
 6wyJHAMAyLbY+/8Ms8Huu6dGV1NfqOYQbR712JRMWlnDyZ3wi1s0GAGmKQnxXlXkPfnJJes7+ideG
 mhYwU0AA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTAt-00Bohb-IV
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 08:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mI4ocY2raC+FaNmp1QLwbvQ7SwKQVD3QJeG7UD1jEM=;
 b=SoJsFqQTNvxWOrB82XHKxHgyrVNqEOdvmRLKtCDUgsH8urgdQY9+Yp58aCeZ3Ff3QPW7jg
 BuRBlw3qKf5mk9rFupuMjlmiDlEoUkexGirBRHq1TBNb3O+BKxCzJHOJHLRAnfpFZV0gdH
 I7ZxjfGVyTWMuvsSfFoo09+Bj78EKko=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-_X-w9YBmMHqtpfHHL4d1tA-1; Fri, 14 May 2021 04:27:55 -0400
X-MC-Unique: _X-w9YBmMHqtpfHHL4d1tA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d13-20020a056402144db0290387e63c95d8so16046551edx.11
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 01:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1mI4ocY2raC+FaNmp1QLwbvQ7SwKQVD3QJeG7UD1jEM=;
 b=FG0fGSUphtdc3zTDAm4n20VN6jY4rzdJNk2lXOUZTM7OrEV/zl3uTngKEWSVxCAu3s
 xfqZy7XZzC11AOSeawehCAMC4GmkTKarsbTy02UL0E+3rsgi4BkHORYfsT7FlE717x7a
 6RMep8KXX8QEQw9detmI5c3FBz9s6FbDJHueGGewMD9ydM5Aaf5ZftGHfxxoUG6ivuYt
 qL02gu9USzySSC7BAl2HCt2NpMeuJ7tK4Kozu3eFFSYVr6lcvc6wGESQvyKYFk1P/Sm3
 nqzfCGmtrhoMbgce/70bt1z55IM+8kqQVYuJaCeO5TtbBqb9Ai3WkVgSkKk40BYe9V5G
 NRhw==
X-Gm-Message-State: AOAM531B0Doqn4PlDX4PD5QvMmn+wZ86iVC/y8b0pCQuH88krGT/wWDo
 eOGPMKF5lWORwu9N5Yc/aeke8l1FIdk4NawURjTnqL1t3f6TGVOkBCGVOUoht3PYBLXWvbWitPk
 CGzVyTtXXwZpC8UYuprv4a8voDC+f
X-Received: by 2002:a17:907:2136:: with SMTP id
 qo22mr5726960ejb.246.1620980874020; 
 Fri, 14 May 2021 01:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYM3IfGE3NxrG0ZrIWpmGkbHrM02LfrvrKJb1wjjik/A6PZcbISFg2IAai8LzSK6j7yfSBCQ==
X-Received: by 2002:a17:907:2136:: with SMTP id
 qo22mr5726935ejb.246.1620980873769; 
 Fri, 14 May 2021 01:27:53 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 z26sm3292663ejl.38.2021.05.14.01.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:27:53 -0700 (PDT)
Subject: Re: [PATCH v19 1/8] mmap: make mlock_future_check() global
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
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
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8bb6ca25-5d30-70e6-c590-5930832ec9b2@redhat.com>
Date: Fri, 14 May 2021 10:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-2-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_012759_720417_910A609B 
X-CRM114-Status: GOOD (  24.79  )
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

On 13.05.21 20:47, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> It will be used by the upcoming secret memory implementation.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Hagen Paul Pfeifer <hagen@jauu.net>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Roman Gushchin <guro@fb.com>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tycho Andersen <tycho@tycho.ws>
> Cc: Will Deacon <will@kernel.org>
> ---
>   mm/internal.h | 3 +++
>   mm/mmap.c     | 5 ++---
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 54bd0dc2c23c..46eb82eaa195 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -373,6 +373,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
>   extern void mlock_vma_page(struct page *page);
>   extern unsigned int munlock_vma_page(struct page *page);
>   
> +extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> +			      unsigned long len);
> +
>   /*
>    * Clear the page's PageMlocked().  This can be useful in a situation where
>    * we want to unconditionally remove a page from the pagecache -- e.g.,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 0584e540246e..81f5595a8490 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1352,9 +1352,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
>   	return hint;
>   }
>   
> -static inline int mlock_future_check(struct mm_struct *mm,
> -				     unsigned long flags,
> -				     unsigned long len)
> +int mlock_future_check(struct mm_struct *mm, unsigned long flags,
> +		       unsigned long len)
>   {
>   	unsigned long locked, lock_limit;
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
