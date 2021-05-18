Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3DBC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:28:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519826108D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 519826108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zo+hkWmHhbnu3HM1VWmz8zszRGVfUBq7t7c0swJfwFk=; b=l+TG7xqFkprgew/a7rhi6ioz7
	ut6/TxZ3KRwEut/r1/U5+DQTAnUsfDeaqf1CMDF91FppQGgclTFoPM9aci4632t+hoicinBHycLab
	JysvDu/aV7R9N1m3UzjBb7j31wNsz7lqn8quxVIiUEugfcyeP1Sefe2l/t4A20sHc5cBNXU5kK7Zz
	ccyGN5syimcMo1H0gWugNXFwu3C10P+jRrdUH3IMfgRXSzXfdXrDSRxWsi0bRoZG0Xge5a4cUn1N2
	NaV+fH5sNOMyicQxQqE8JPcI/Z16O3Kl5VT6RCpdx9fnIDJ/Wdi8Znza1gpzt172t8c3F8/68bRMN
	s1Cla0PoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwxO-000NXs-JY; Tue, 18 May 2021 10:28:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwu3-000MYo-Am; Tue, 18 May 2021 10:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+M4SPB2npTSXrrT5IyACJlR75qyvTKXfqOO8cStmqqs=; b=2Wgv32H6tLZ7Nod1C/ljfzW4RJ
 2UfFnfNcS9Pedv5rhjIVC3ExfiaR0mqiRJTQpjkRdfkENtP2DNncZBa6Vg4v2YLJArM2WuPL/7W+c
 8cm3MWVocVlht3t7zBPnDy6IM3PRkxe1etMt53ZTHqQ10zcTaQLYbBm+qz8ByezdBaIVlLcAvWhQZ
 wkK1Z3ajRwxoZlDhXIeHMVzPs13Mp7c/EfClCz5QlaQBBIIFfkDlkPOd6OISaJG62A3Uyf5BXrbru
 PlWUqam+GRqsgV9E2XpD6M7VfzHEA9DnmLq6lynHyW5kAMWrUnHGoh35g5/y7WXIhvIcAoa6j8jUD
 ZKw8Jj6A==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1liwtx-00EYoj-K3; Tue, 18 May 2021 10:24:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F83E1FB;
 Tue, 18 May 2021 03:24:36 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.6.226])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A1EB3F719;
 Tue, 18 May 2021 03:24:27 -0700 (PDT)
Date: Tue, 18 May 2021 11:24:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v19 6/8] PM: hibernate: disable when there are active
 secretmem users
Message-ID: <20210518102424.GD82842@C02TD0UTHF1T.local>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513184734.29317-7-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_032437_781513_AAABD26B 
X-CRM114-Status: GOOD (  29.13  )
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

On Thu, May 13, 2021 at 09:47:32PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> It is unsafe to allow saving of secretmem areas to the hibernation
> snapshot as they would be visible after the resume and this essentially
> will defeat the purpose of secret memory mappings.
> 
> Prevent hibernation whenever there are active secret memory users.

Have we thought about how this is going to work in practice, e.g. on
mobile systems? It seems to me that there are a variety of common
applications which might want to use this which people don't expect to
inhibit hibernate (e.g. authentication agents, web browsers).

Are we happy to say that any userspace application can incidentally
inhibit hibernate?

Thanks,
Mark.

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
>  include/linux/secretmem.h |  6 ++++++
>  kernel/power/hibernate.c  |  5 ++++-
>  mm/secretmem.c            | 15 +++++++++++++++
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index e617b4afcc62..21c3771e6a56 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -30,6 +30,7 @@ static inline bool page_is_secretmem(struct page *page)
>  }
>  
>  bool vma_is_secretmem(struct vm_area_struct *vma);
> +bool secretmem_active(void);
>  
>  #else
>  
> @@ -43,6 +44,11 @@ static inline bool page_is_secretmem(struct page *page)
>  	return false;
>  }
>  
> +static inline bool secretmem_active(void)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_SECRETMEM */
>  
>  #endif /* _LINUX_SECRETMEM_H */
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index da0b41914177..559acef3fddb 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -31,6 +31,7 @@
>  #include <linux/genhd.h>
>  #include <linux/ktime.h>
>  #include <linux/security.h>
> +#include <linux/secretmem.h>
>  #include <trace/events/power.h>
>  
>  #include "power.h"
> @@ -81,7 +82,9 @@ void hibernate_release(void)
>  
>  bool hibernation_available(void)
>  {
> -	return nohibernate == 0 && !security_locked_down(LOCKDOWN_HIBERNATION);
> +	return nohibernate == 0 &&
> +		!security_locked_down(LOCKDOWN_HIBERNATION) &&
> +		!secretmem_active();
>  }
>  
>  /**
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 1ae50089adf1..7c2499e4de22 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -40,6 +40,13 @@ module_param_named(enable, secretmem_enable, bool, 0400);
>  MODULE_PARM_DESC(secretmem_enable,
>  		 "Enable secretmem and memfd_secret(2) system call");
>  
> +static atomic_t secretmem_users;
> +
> +bool secretmem_active(void)
> +{
> +	return !!atomic_read(&secretmem_users);
> +}
> +
>  static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  {
>  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> @@ -94,6 +101,12 @@ static const struct vm_operations_struct secretmem_vm_ops = {
>  	.fault = secretmem_fault,
>  };
>  
> +static int secretmem_release(struct inode *inode, struct file *file)
> +{
> +	atomic_dec(&secretmem_users);
> +	return 0;
> +}
> +
>  static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>  	unsigned long len = vma->vm_end - vma->vm_start;
> @@ -116,6 +129,7 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
>  }
>  
>  static const struct file_operations secretmem_fops = {
> +	.release	= secretmem_release,
>  	.mmap		= secretmem_mmap,
>  };
>  
> @@ -202,6 +216,7 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
>  	file->f_flags |= O_LARGEFILE;
>  
>  	fd_install(fd, file);
> +	atomic_inc(&secretmem_users);
>  	return fd;
>  
>  err_put_fd:
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
