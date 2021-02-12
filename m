Return-Path: <SRS0=T1n8=HO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEABC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 09:19:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023F564DE3
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 09:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023F564DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2stmFfKDPjkUzzTp5gp/k5KQDk+OvIje4jE3JRoFfqQ=; b=x0Dx8pvHt+wt3YxRcLWzotjky
	rI0Jc8YSJ8IBQkthIrYf/VLtKtpPUwFLepSTS2Y0YveBHoHsvv3fJ1W4D1Zc3PiTm9Bq283aYk1pB
	LOtrzFB8t2U3oOmO3Vgx0+Qt5qVaIgGN++fI1NUw3wVrIx23bnpEdcgAnsxwvSVgyb2QXUupgOSc9
	CWedrUiiJO1B/YQOh/HaRQz0Gu6U/SHTkTHXpLsjclvhe6l2G13hsKLpUQyxBL9SDUVX747kkCYwv
	qxNfUUIA7UUiOiXcRp1oBPIvR1WEIhzeKNmfO11IxjNJXyrkwYMUCzR6Lka5mGoMwA3a1K5dzxUTL
	xQQCu7UDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAUb7-0001Ir-Nq; Fri, 12 Feb 2021 09:18:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAUb4-0001Gs-8n
 for linux-riscv@lists.infradead.org; Fri, 12 Feb 2021 09:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613121519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baunC+JA0c74vn12rH+deswOvAmvXs+9aRij2anuo18=;
 b=MkC/0aY1zksQt9Ga+cXM/PRFIKRMO4EnLeUU3QqKg7GmRmLysHxSNetWiWzHiU8v+hVny4
 G26gMeaq0/vudwx33BQ/H0qa4vHxajIBtuzpJkMdtzWfeRKQO46rrA/uRbwSj0wMv4jp97
 82KFQFfGEvTBkel+v3qfEpLKV4RDNbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Led8hCyZOVOQcxBvYOphjw-1; Fri, 12 Feb 2021 04:18:35 -0500
X-MC-Unique: Led8hCyZOVOQcxBvYOphjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA327192CC41;
 Fri, 12 Feb 2021 09:18:29 +0000 (UTC)
Received: from [10.36.114.178] (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA5E310023AC;
 Fri, 12 Feb 2021 09:18:20 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>
References: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org> <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com> <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org> <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <20210211112702.GI242749@kernel.org>
 <05082284-bd85-579f-2b3e-9b1af663eb6f@redhat.com>
 <20210211230910.GL242749@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <a903338e-3d56-ff0a-4f4f-0f23db7ec0da@redhat.com>
Date: Fri, 12 Feb 2021 10:18:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210211230910.GL242749@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_041842_427760_6560818D 
X-CRM114-Status: GOOD (  23.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12.02.21 00:09, Mike Rapoport wrote:
> On Thu, Feb 11, 2021 at 01:07:10PM +0100, David Hildenbrand wrote:
>> On 11.02.21 12:27, Mike Rapoport wrote:
>>> On Thu, Feb 11, 2021 at 10:01:32AM +0100, David Hildenbrand wrote:
>>
>> So let's talk about the main user-visible differences to other memfd files
>> (especially, other purely virtual files like hugetlbfs). With secretmem:
>>
>> - File content can only be read/written via memory mappings.
>> - File content cannot be swapped out.
>>
>> I think there are still valid ways to modify file content using syscalls:
>> e.g., fallocate(PUNCH_HOLE). Things like truncate also seems to work just
>> fine.
>   
> These work perfectly with any file, so maybe we should have added
> memfd_create as a flag to open(2) back then and now the secretmem file
> descriptors?

I think open() vs memfd_create() makes sense: for open, the path 
specifies main properties (tmpfs, hugetlbfs, filesystem). On memfd, 
there is no such path and the "type" has to be specified differently.

Also, open() might open existing files - memfd always creates new files.

>   
>>>> AFAIKS, we would need MFD_SECRET and disallow
>>>> MFD_ALLOW_SEALING and MFD_HUGETLB.
>>>
>>> So here we start to multiplex.
>>
>> Yes. And as Michal said, maybe we can support combinations in the future.
> 
> Isn't there a general agreement that syscall multiplexing is not a good
> thing?

Looking at mmap(), madvise(), fallocate(), I think multiplexing is just 
fine and flags can be mutually exclusive - as long as we're not 
squashing completely unrelated things into a single system call.

As one example: we don't have mmap_private() vs. mmap_shared() vs. 
mmap_shared_validate(). E.g., MAP_SYNC is only available for 
MAP_SHARED_VALIDATE.


> memfd_create already has flags validation that does not look very nice.

I assume you're talking about the hugetlb size specifications, right? 
It's not nice but fairly compact.

> Adding there only MFD_SECRET will make it a bit less nice, but when we'll
> grow new functionality into secretmem that will become horrible.

What do you have in mind? A couple of MFD_SECRET_* flags that only work 
with MFD_SECRET won't hurt IMHO. Just like we allow MFD_HUGE_* only with 
MFD_HUGETLB.

Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
