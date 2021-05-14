Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BE1C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:27:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1056B613F6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1056B613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WJTECJZuoBImiG145hmOTMigzVDrbpu5QdCSGb2a+xo=; b=mWyUxgqJYhUJ1/zo1JWSMcfPw
	Uv+9FOh5avgRYF3KJWqaO/PeSMUjgb+Zzwm65Up0KGF22Xs1D659uHvoo3wOPl5yHJVpl9ZU+7XKL
	/k56KfJ//d2ardlzk/oMezAcCubBxFi5A2uvjQRpsTesNo9OgkGl9hutotJtvAhjJbZBHRxdrC4C/
	t7UCLEEieCz+haSDo+fFCd+zYeu/b6d8I6HiLyueLo/Iz7UuBdCx9/Ty5d5HQ4qKsHkPsuP9bL6zH
	98NbIA1s/VpGuqbMjst9/AVDoCG98rvx6+aroBnGof6+RoIlyD6XZabxWPGQ4kYjL3lkGpIS0/p2g
	hyhvQGJIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhU6Z-007d2n-N2; Fri, 14 May 2021 09:27:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU6L-007d0Q-T2
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 09:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=yW2asbdUagGat2ijahWn20ew93BwpmErRmbUGUDMNcY=; b=d1eEDp+yorkXdxcEX+xcb3jfel
 RltwxvsSUW2rwU0AvOIZdSxlfY8Ipq69UCCYj4zmB1TcHoDJp+Y64RpL4tWbZkcNQ7TuvYFHYYqC+
 ujxrpp07hcx9FzzUpYQl3Vyo8AX6mnTm6iJUgJ/SzMLTQigvnF99FpY41hTO+22DZwTKBZiMm5qeM
 ionchFv0nIi9o6jYHZ0t/T7L0RDszH9XkdYnsWPXG4cdNDnWFYgNtJv5ZSLhbQA7R1i05LtGPnKL+
 hqU3mUlV1+HZ8fRd/UnTH/vEYLLqlhoCm6eTjO9tinEu5lI95TqWZCVB5Kv9DRgwiCrldTb/SmE0g
 Y9+AKrKw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU6J-00BrHc-2e
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 09:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620984438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW2asbdUagGat2ijahWn20ew93BwpmErRmbUGUDMNcY=;
 b=F3K9A+rC136Eqdkqk5fITbuifX7Z8+mW7DIBhw3Ucdl4OOm85uB++HqmwTz5RA5aVoVFDQ
 mnWi3YtOdaL01NVHBdtYSEVRHD8KSPIsVWtI0RNik46+L5C7FT7ULmP641/Zjnv9sc1wbG
 zI2v9eOvChONlXQNF9ajOAc2g9jpraE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Ep884cPSPCKKUfFnF6Y9og-1; Fri, 14 May 2021 05:27:14 -0400
X-MC-Unique: Ep884cPSPCKKUfFnF6Y9og-1
Received: by mail-ej1-f69.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so2048924ejd.13
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yW2asbdUagGat2ijahWn20ew93BwpmErRmbUGUDMNcY=;
 b=b8Ofs1bROhOA+OOCHWBIDTw5ZHLM/jUAAw4p81Plke6SCamaaq+Gu51v+cQLl1nmEd
 jBsQHSNCza3AToRy3YJEs8bFBIOYPEv7ypyC4OSQrJZWnAQH2R7XmKBUAcrw9ctRt9cC
 EQryR0RDQkM0FjztAjrr7NcSZoFuP6RG9LVZPvc33WcFboXcr2zR302glihfKpTn0jD4
 +6yZ9Y2PGAm07KyIWPwKFT+2sZlnl7jC4KDpPvwyT/qVuCf2Z1RHMDS2R3fkFqor3fGB
 9iQOpEQDJ3UE3IBjWDRqc/KybP9lOJjlTPlcLlK0YwoCsrEnjH8CsTw4YzWR91M6I915
 0alw==
X-Gm-Message-State: AOAM5319OgmYPS9XzSJB7EbarTE7pU7kJLf3VB6nsiuimpR1GNIjWhK4
 vdigdFW3amvj8yBUDqLQI2b0i9o5kw78WSDrG5KNf7gBGiBxNBwfPd3Eo/KQGLgbyVOYGU2aCJ5
 +RP3CtW0ZUh5GRIkdmiBBlqE/sKJj
X-Received: by 2002:a05:6402:10c6:: with SMTP id
 p6mr55735309edu.241.1620984433540; 
 Fri, 14 May 2021 02:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEtOCv5Ls17oMjk/nlAqkQoSV5N2CP4kQHSOXjzJBX9acMLtoFBB9xjtabyDhiKP+sEIswPA==
X-Received: by 2002:a05:6402:10c6:: with SMTP id
 p6mr55735269edu.241.1620984433367; 
 Fri, 14 May 2021 02:27:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 m9sm3510728ejj.53.2021.05.14.02.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 02:27:13 -0700 (PDT)
Subject: Re: [PATCH v19 6/8] PM: hibernate: disable when there are active
 secretmem users
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
 <20210513184734.29317-7-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d243610c-78df-5e25-cb60-320e7a352d82@redhat.com>
Date: Fri, 14 May 2021 11:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-7-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_022719_205981_51D0B69E 
X-CRM114-Status: GOOD (  30.65  )
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
> It is unsafe to allow saving of secretmem areas to the hibernation
> snapshot as they would be visible after the resume and this essentially
> will defeat the purpose of secret memory mappings.
> 
> Prevent hibernation whenever there are active secret memory users.
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
>   include/linux/secretmem.h |  6 ++++++
>   kernel/power/hibernate.c  |  5 ++++-
>   mm/secretmem.c            | 15 +++++++++++++++
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index e617b4afcc62..21c3771e6a56 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -30,6 +30,7 @@ static inline bool page_is_secretmem(struct page *page)
>   }
>   
>   bool vma_is_secretmem(struct vm_area_struct *vma);
> +bool secretmem_active(void);
>   
>   #else
>   
> @@ -43,6 +44,11 @@ static inline bool page_is_secretmem(struct page *page)
>   	return false;
>   }
>   
> +static inline bool secretmem_active(void)
> +{
> +	return false;
> +}
> +
>   #endif /* CONFIG_SECRETMEM */
>   
>   #endif /* _LINUX_SECRETMEM_H */
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index da0b41914177..559acef3fddb 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -31,6 +31,7 @@
>   #include <linux/genhd.h>
>   #include <linux/ktime.h>
>   #include <linux/security.h>
> +#include <linux/secretmem.h>
>   #include <trace/events/power.h>
>   
>   #include "power.h"
> @@ -81,7 +82,9 @@ void hibernate_release(void)
>   
>   bool hibernation_available(void)
>   {
> -	return nohibernate == 0 && !security_locked_down(LOCKDOWN_HIBERNATION);
> +	return nohibernate == 0 &&
> +		!security_locked_down(LOCKDOWN_HIBERNATION) &&
> +		!secretmem_active();
>   }
>   
>   /**
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 1ae50089adf1..7c2499e4de22 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -40,6 +40,13 @@ module_param_named(enable, secretmem_enable, bool, 0400);
>   MODULE_PARM_DESC(secretmem_enable,
>   		 "Enable secretmem and memfd_secret(2) system call");
>   
> +static atomic_t secretmem_users;
> +
> +bool secretmem_active(void)
> +{
> +	return !!atomic_read(&secretmem_users);
> +}
> +
>   static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>   {
>   	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> @@ -94,6 +101,12 @@ static const struct vm_operations_struct secretmem_vm_ops = {
>   	.fault = secretmem_fault,
>   };
>   
> +static int secretmem_release(struct inode *inode, struct file *file)
> +{
> +	atomic_dec(&secretmem_users);
> +	return 0;
> +}
> +
>   static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
>   {
>   	unsigned long len = vma->vm_end - vma->vm_start;
> @@ -116,6 +129,7 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
>   }
>   
>   static const struct file_operations secretmem_fops = {
> +	.release	= secretmem_release,
>   	.mmap		= secretmem_mmap,
>   };
>   
> @@ -202,6 +216,7 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
>   	file->f_flags |= O_LARGEFILE;
>   
>   	fd_install(fd, file);
> +	atomic_inc(&secretmem_users);
>   	return fd;
>   
>   err_put_fd:
> 

It looks a bit racy, but I guess we don't really care about these corner 
cases.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
