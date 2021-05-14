Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70974C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:51:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF229613C9
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF229613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FFazI286P5M8E4YlvdgCjTbUdwsg3azjHJtBRSd3lDk=; b=UMFiwEpN+3co8UiUiUb0cMGT3
	4gYrXztpO+poW5swAYhv9/WbDcEfRTGzQqJajvhb25Fg29OkiTYGoaMjXHSkD5/0KhtZca1kv/DqF
	VyZY++4ZDdr6ZP5cphc499X8L+RJ24GF5dnJ7PAs/Xb+3VBTtRZSMqyD+eLPpaZ5F68tJaQ+G34EV
	H3hO73N7FX1tlOtWH1E2YwcKypELDeeuuDLchy4h9mlPOhWcjBbqMslZOA86UE9VtDUa8rY2kn4ot
	Xoj2UDdSuvfTL0j+5XpP1ePd1bzCu6za/m5GuFw9l321dHzIm77Zbd1SKhqqi0J81ZNS3pplvr35Y
	+lq7ddx4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTXI-007YOg-FB; Fri, 14 May 2021 08:51:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTXG-007YOK-9w
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=A6IAZwI0xwEgxZkIPkaUDpjaSLTjanXMP6EohDn10+Y=; b=1ctQVweXhYz7o1fWbcl94++B9J
 ToXvTF6oCuHMoaJpeHu9BD0fH9fMOBZULI4lXhCA2uu9qyTFwxyRPFoUukI5bNfaHe+FbnFRAWKPa
 OlObjuUaO3uyEJJ8KIEEDZ9xbzwSW+fKn/LAeb8BVlUF1orX74J3KNwonLP9Ci3cS9wmT0jWxHXNP
 WuEg4q64Q8GbvpQgyzF3mIeGLFcuKNjXEuS3Ge22NuZ6B8UbLc50FUEGqwmN4exvRje8kcOY/naP6
 RhelgwDNiCC8oNvNqORITdWCqnsNVS6rl9AzADhbmesWKY05tVwh5RD8lKUIaYi6KtWmbcsG+wiov
 GnP5FkjQ==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTXC-00BpiB-L9
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 08:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620982261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6IAZwI0xwEgxZkIPkaUDpjaSLTjanXMP6EohDn10+Y=;
 b=eDmPlB4ZidLGZMxAQ1alx5ZUBc3d/lvPkq03fZ9lChKsM+1s5P4GvBy3q2UHeX5VhapPA4
 zGmSKvNigepDz+IBW6AjsuJQFH9l80UwoxkdT3Lqc4qHN95zpL+L/iJKmbRSHQmg832S9T
 qImZuRwx/AreJMSpUERZpZ3gpd8nF+U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-WdX7DlGHN2-ItlpnnXrmSg-1; Fri, 14 May 2021 04:50:59 -0400
X-MC-Unique: WdX7DlGHN2-ItlpnnXrmSg-1
Received: by mail-ej1-f70.google.com with SMTP id
 o18-20020a17090637d2b02903bf3465db95so5250222ejc.18
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 01:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=A6IAZwI0xwEgxZkIPkaUDpjaSLTjanXMP6EohDn10+Y=;
 b=WncugScU398//oKgsku0zhzGEQUQMCz8a473zbBMzsgIWIarwsKdiRnSBRoGdq5jYE
 oCZchtiGh45tGRG/8J7ZoVJhY9QZJ9T2eK+4/Ix9bRRr8cIXkgAhiNJQjDXV/DQ7zf7T
 ON7bpvPut+T0lnboVe7/jpI2uX5C8AwtDaimTYx8nZnzN2jVQQ60csPvgpAro8MOvWZ6
 opkhNSoVJarq81G+ADEb1OBFFm3Nu4V3rMq1xAXaBmpPdLaRXiB2nwNFaySfZUHgGLPv
 5fpkqfLAqTSE8p8nZVviMPmwuNApEYsPHBU+wRHkcu99ueSMrms6oylY9BLkL4jMGyDy
 cLKA==
X-Gm-Message-State: AOAM5318rUxvLOeAJTRgcMRI+J9GnMCRMLNwrwIxlUdCYVqOXPnzVryQ
 oW83gCLZlRivfDpmMcHQz1sq12Ecv6z0zaCqGrpmuYwhhJAVU5nXBlvUPG5KKf6ultDaWOh5bB2
 GSX2t3sqwyoS9Y2nosyl0rVfeVqE1
X-Received: by 2002:aa7:de02:: with SMTP id h2mr54907497edv.61.1620982258507; 
 Fri, 14 May 2021 01:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbFV5SCx4C1Oa2Pq/TZ05TRM0enPIT1usIgqsxFBagAMreWK04a8ZIkxs0DNaI7qx1TZ7bmg==
X-Received: by 2002:aa7:de02:: with SMTP id h2mr54907444edv.61.1620982258235; 
 Fri, 14 May 2021 01:50:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 yw9sm3241097ejb.91.2021.05.14.01.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:50:57 -0700 (PDT)
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
 <20210513184734.29317-6-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <ea1ddcfa-f52d-9a7d-cb7b-8502b38a90da@redhat.com>
Date: Fri, 14 May 2021 10:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-6-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_015102_783238_371227E2 
X-CRM114-Status: GOOD (  40.43  )
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
> Introduce "memfd_secret" system call with the ability to create
> memory areas visible only in the context of the owning process and
> not mapped not only to other processes but in the kernel page tables
> as well.
> 
> The secretmem feature is off by default and the user must explicitly
> enable it at the boot time.
> 
> Once secretmem is enabled, the user will be able to create a file 
> descriptor using the memfd_secret() system call. The memory areas
> created by mmap() calls from this file descriptor will be unmapped
> from the kernel direct map and they will be only mapped in the page
> table of the processes that have access to the file descriptor.
> 
> The file descriptor based memory has several advantages over the 
> "traditional" mm interfaces, such as mlock(), mprotect(), madvise().
> File descriptor approach allows explict and controlled sharing of the
> memory

s/explict/explicit/

> areas, it allows to seal the operations. Besides, file descriptor
> based memory paves the way for VMMs to remove the secret memory range
> from the userpace hipervisor process, for instance QEMU. Andy
> Lutomirski says:

s/userpace hipervisor/userspace hypervisor/

> 
> "Getting fd-backed memory into a guest will take some possibly major
> work in the kernel, but getting vma-backed memory into a guest
> without mapping it in the host user address space seems much, much
> worse."
> 
> memfd_secret() is made a dedicated system call rather than an
> extention to

s/extention/extension/

> memfd_create() because it's purpose is to allow the user to create
> more secure memory mappings rather than to simply allow file based
> access to the memory. Nowadays a new system call cost is negligible
> while it is way simpler for userspace to deal with a clear-cut system
> calls than with a multiplexer or an overloaded syscall. Moreover, the
> initial implementation of memfd_secret() is completely distinct from
> memfd_create() so there is no much sense in overloading
> memfd_create() to begin with. If there will be a need for code
> sharing between these implementation it can be easily achieved
> without a need to adjust user visible APIs.
> 
> The secret memory remains accessible in the process context using
> uaccess primitives, but it is not exposed to the kernel otherwise;
> secret memory areas are removed from the direct map and functions in
> the follow_page()/get_user_page() family will refuse to return a page
> that belongs to the secret memory area.
> 
> Once there will be a use case that will require exposing secretmem to
> the kernel it will be an opt-in request in the system call flags so
> that user would have to decide what data can be exposed to the
> kernel.

Maybe spell out an example: like page migration.

> 
> Removing of the pages from the direct map may cause its fragmentation
> on architectures that use large pages to map the physical memory
> which affects the system performance. However, the original Kconfig
> text for CONFIG_DIRECT_GBPAGES said that gigabyte pages in the direct
> map "... can improve the kernel's performance a tiny bit ..." (commit
> 00d1c5e05736 ("x86: add gbpages switches")) and the recent report [1]
> showed that "... although 1G mappings are a good default choice,
> there is no compelling evidence that it must be the only choice".
> Hence, it is sufficient to have secretmem disabled by default with
> the ability of a system administrator to enable it at boot time.

Maybe add a link to the Intel performance evaluation.

> 
> Pages in the secretmem regions are unevictable and unmovable to
> avoid accidental exposure of the sensitive data via swap or during
> page migration.
> 
> Since the secretmem mappings are locked in memory they cannot exceed 
> RLIMIT_MEMLOCK. Since these mappings are already locked independently
> from mlock(), an attempt to mlock()/munlock() secretmem range would
> fail and mlockall()/munlockall() will ignore secretmem mappings.

Maybe add something like "similar to pages pinned by VFIO".

> 
> However, unlike mlock()ed memory, secretmem currently behaves more
> like long-term GUP: secretmem mappings are unmovable mappings
> directly consumed by user space. With default limits, there is no
> excessive use of secretmem and it poses no real problem in
> combination with ZONE_MOVABLE/CMA, but in the future this should be
> addressed to allow balanced use of large amounts of secretmem along
> with ZONE_MOVABLE/CMA.
> 
> A page that was a part of the secret memory area is cleared when it
> is freed to ensure the data is not exposed to the next user of that
> page.

You could skip that with init_on_free (and eventually also with 
init_on_alloc) set to avoid double clearing.

> 
> The following example demonstrates creation of a secret mapping
> (error handling is omitted):
> 
> fd = memfd_secret(0); ftruncate(fd, MAP_SIZE); ptr = mmap(NULL,
> MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> 
> [1]
> https://lore.kernel.org/linux-mm/213b4567-46ce-f116-9cdf-bbd0c884eb3c@linux.intel.com/

[my mail client messed up the remainder of the mail for whatever reason, 
will comment in a separate mail if there is anything to comment :) ]

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
