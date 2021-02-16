Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6B8C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:34:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AA464DF0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AA464DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U9gDnr0Y+F28syniksBL0iOhdKRlLpCwaUeaMuHvKpk=; b=t6piFj4vJvhgXXfg2AjFi0D7J
	FiqUFt6G8S41tiNJXU9Y1Ua5xzC5sxFotk0XcTffSLc9wfP2KVtZhiz2ltrQXJy6vk93mEz5eu/sH
	2aV4cfmQOr4bBku7HZuGnPDbmaznrkOYciM8VwQHmsHn9jQVBiZDarOoKJCojaAKWS5OwUgFiLNcq
	ToHIZlDL3UoHhtqWfQdORrH6CZjhKDQPF5//l/KQ4HYnDPJOTKdUU2KKWc5hyr6PrPy2LFiktERAD
	SL15KGiQzx6GD7he9HMFvOlqav51QFyFdcGq+LdwXajfjyqHkvUrPz2dSplwbgtxo66bOBAOxeMJ0
	28n/whP/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3JB-0003ZC-Om; Tue, 16 Feb 2021 16:34:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3J7-0003Wb-M4
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 16:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613493275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KysYIYMpQ7qMwmL/JUOCOKvLfXo3jE4QCyxH618MYzE=;
 b=YOYDTf7Trq50U2iN2ri3ebMVB/pbjAdiqZeHv8At2BKNYOswrJirI8kB1TbesObe/kJwF6
 sukwNjy6F1RB/9+0tlMP1KGSx/zseuyNpexWV/eJO+LThf4778H+Ky3IqPklNjMTAR11hm
 BzKTUuH/MWO2whGJTBQMTTFkLiHUdW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-p1-EOjkyMC-fthVSXfK3rw-1; Tue, 16 Feb 2021 11:34:33 -0500
X-MC-Unique: p1-EOjkyMC-fthVSXfK3rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B1051E561;
 Tue, 16 Feb 2021 16:34:28 +0000 (UTC)
Received: from [10.36.114.70] (ovpn-114-70.ams2.redhat.com [10.36.114.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8E31970A;
 Tue, 16 Feb 2021 16:34:18 +0000 (UTC)
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
To: jejb@linux.ibm.com, Michal Hocko <mhocko@suse.com>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
 <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
 <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <dfd7db5c-a8c7-0676-59f8-70aa6bcaabe7@redhat.com>
Date: Tue, 16 Feb 2021 17:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_113437_999274_F9C1932E 
X-CRM114-Status: GOOD (  21.24  )
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
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

On 16.02.21 17:25, James Bottomley wrote:
> On Mon, 2021-02-15 at 20:20 +0100, Michal Hocko wrote:
> [...]
>>>>    What kind of flags are we talking about and why would that be a
>>>> problem with memfd_create interface? Could you be more specific
>>>> please?
>>>
>>> You mean what were the ioctl flags in the patch series linked
>>> above? They were SECRETMEM_EXCLUSIVE and SECRETMEM_UNCACHED in
>>> patch 3/5.
>>
>> OK I see. How many potential modes are we talking about? A few or
>> potentially many?
>   
> Well I initially thought there were two (uncached or not) until you
> came up with the migratable or non-migratable, which affects the
> security properties.  But now there's also potential for hardware
> backing, like mktme,  described by flags as well.  I suppose you could
> also use RDT to restrict which cache the data goes into: say L1 but not
> L2 on to lessen the impact of fully uncached (although the big thrust
> of uncached was to blunt hyperthread side channels).  So there is
> potential for quite a large expansion even though I'd be willing to bet
> that a lot of the modes people have thought about turn out not to be
> very effective in the field.

Thanks for the insight. I remember that even the "uncached" parts was 
effectively nacked by x86 maintainers (I might be wrong). For the other 
parts, the question is what we actually want to let user space configure.

Being able to specify "Very secure" "maximum secure" "average secure" 
all doesn't really make sense to me. The discussion regarding 
migratability only really popped up because this is a user-visible thing 
and not being able to migrate can be a real problem (fragmentation, 
ZONE_MOVABLE, ...).

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
