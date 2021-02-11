Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90BCC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:49:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7528064E92
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7528064E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b66N7wSgUnB5Z0wsY06Sr9hnQBY5hzetmeWWocypcEU=; b=SoE/mzv0rQmrm90wLr6LRdJZH
	IZnazzNa5nSSWWcj2gCxkmTre5gSFMFBajWaUIsZG/VfpAajWTczPV2qxg2SXPXEpd0UTR/eQH2WS
	W/sMJFi3qpFoW3JQQV2Hg/5KIQoTdP6TWw8od8so3LeaS5Mk5m6NuTl2WfiJzyMDpQ3KW3ykd1F5J
	xRQdZK/zL2YB1ZDCIkOG/pbhrbfcGXsGZBbII6ykbTiLIwBeuNk5WTV5B7QZG2ACrvkW4Lw1/vDrd
	459UVFMytj0qv5AMtYAV76Bo52Fk6NZt/zk0a1p9x+bymtzJjsWnV4FLQhUNcWLuD3aKKs9MI1ZYw
	eKfURn3+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA8b4-00081z-Oi; Thu, 11 Feb 2021 09:49:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA8b1-000803-7i
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 09:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613036947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4KClAbW7qAjd5KF/8/23pSoF5vXBE09nxYc8TlmEUM=;
 b=Wvdx4T0etpdPbxWRf+PxEFJXyobCquw7Ia8NzvSSWzmUeffoQFWCwdClzG+m2Hkk8SGnwz
 YemrIMC0OdkIuCDMBpWRJZLYEyOEpk0bZYvgjNDOCVi2cH9z7BygdvvfF0ff+TP6/Zp8DF
 XksTP0UZovQLIQrBYO+RF7TlE+rTDvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-9tsn6XZgPY-p0wHYN_-nmw-1; Thu, 11 Feb 2021 04:49:03 -0500
X-MC-Unique: 9tsn6XZgPY-p0wHYN_-nmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F49280364D;
 Thu, 11 Feb 2021 09:48:58 +0000 (UTC)
Received: from [10.36.114.52] (ovpn-114-52.ams2.redhat.com [10.36.114.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AE5010016F4;
 Thu, 11 Feb 2021 09:48:49 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org> <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org> <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com> <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org> <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <YCT6+9YW474IaKrm@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <367808fc-8f5c-10a4-fc0b-a71df616dfce@redhat.com>
Date: Thu, 11 Feb 2021 10:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCT6+9YW474IaKrm@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_044911_362913_E7D1B024 
X-CRM114-Status: GOOD (  24.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>> Some random thoughts regarding files.
>>
>> What is the page size of secretmem memory? Sometimes we use huge pages,
>> sometimes we fallback to 4k pages. So I assume huge pages in general?
> 
> Unless there is an explicit request for hugetlb I would say the page
> size is not really important like for any other fds. Huge pages can be
> used transparently.

If everything is currently allocated/mapped on PTE granularity, then yes 
I agree. I remember previous versions used to "pool 2MB pages", which 
might have been problematic (thus, my concerns regarding mmap() etc.). 
If that part is now gone, good!

>   
>> What are semantics of MADV()/FALLOCATE() etc on such files?
> 
> I would expect the same semantic as regular shmem (memfd_create) except
> the memory doesn't have _any_ backing storage which makes it
> unevictable. So the reclaim related madv won't work but there shouldn't
> be any real reason why e.g. MADV_DONTNEED, WILLNEED, DONT_FORK and
> others don't work.

Agreed if we don't have hugepage semantics.

>> Is userfaultfd() properly fenced? Or does it even work (doubt)?
>>
>> How does it behave if I mmap(FIXED) something in between?
>> In which granularity can I do that (->page-size?)?
> 
> Again, nothing really exceptional here. This is a mapping like any
> other from address space manipulation POV.

Agreed with the PTE mapping approach.

> 
>> What are other granularity restrictions (->page size)?
>>
>> Don't want to open a big discussion here, just some random thoughts.
>> Maybe it has all been already figured out and most of the answers
>> above are "Fails with -EINVAL".
> 
> I think that the behavior should be really in sync with shmem semantic
> as much as possible. Most operations should simply work with an
> aditional direct map manipulation. There is no real reason to be
> special. Some functionality might be missing, e.g. hugetlb support but
> that has been traditionally added on top of shmem interface so nothing
> really new here.

Agreed!

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
