Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A07DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 16:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0867164EB8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0867164EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uZ9guUlBO1FciCvyJapvItkmx9IOjuj247Q1EdfIQ94=; b=GNCBvnAlf0yoeZA5Y9ASh+wv5
	RLW9a9UbzLY+RHfV46Nqz5+GYzgVSBk4p39wnWLCtkQM4e1Gv3Ve35ksAmmVZhFBxmSqb3nwa+Kw4
	aLAfRhT5V2PtlWFTrJWCA+cztVQorJVhxD4dYeW6IpmatveyrLz4GkpMJfaMRYeh7B0ozxnVrewdj
	w1U9DrOVtuOrsJgi5mAhK+2eUggRSeOLYLptBEVV5hXX7yc7pY8uwVG9/r86wSAFPKPi+xyZ8h8VB
	1T6TMMgSCYtHodoxmF5AmhXhe5EimuJ7Zin0T2/iMtux/YpRdB18AivbeBnObqD1z7dPyNUNOr25k
	nuMj3sCQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Vhy-000681-PW; Tue, 09 Feb 2021 16:17:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Vhu-00066L-LA
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 16:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612887462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPEBUfuoE8xnXkHqh37MN3V58bCQtUE2J2aM+0+7Hhg=;
 b=Nf6OwzPQL9E+BCpfO/5dlFw2eKFDLEAZn4GqsRBaMmn6Or2fz3CZQYKrOOw4a/UIxzZHd8
 bUa5Ue6nbIdfWSGcbzu1fxs3iL3ABVjFMZbigtveAW38TUT0HSXH0oY4NmsDRYzxc/MsiZ
 StUK7VW+LDzBFNFN6OF85wBFajVIkB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-uL8BkgqBNoSU9TSinWcnBQ-1; Tue, 09 Feb 2021 11:17:37 -0500
X-MC-Unique: uL8BkgqBNoSU9TSinWcnBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9332C801979;
 Tue,  9 Feb 2021 16:17:31 +0000 (UTC)
Received: from [10.36.113.141] (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16AE60BD9;
 Tue,  9 Feb 2021 16:17:23 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
 <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
 <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
 <c1e5e7b6-3360-ddc4-2ff5-0e79515ee23a@redhat.com>
 <YCKNMqu8/g0OofqU@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <8cbfe2c3-cfc6-72e0-bab1-852f80e20684@redhat.com>
Date: Tue, 9 Feb 2021 17:17:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCKNMqu8/g0OofqU@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_111742_763043_01D64789 
X-CRM114-Status: GOOD (  19.92  )
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
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
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

On 09.02.21 14:25, Michal Hocko wrote:
> On Tue 09-02-21 11:23:35, David Hildenbrand wrote:
> [...]
>> I am constantly trying to fight for making more stuff MOVABLE instead of
>> going into the other direction (e.g., because it's easier to implement,
>> which feels like the wrong direction).
>>
>> Maybe I am the only person that really cares about ZONE_MOVABLE these days
>> :) I can't stop such new stuff from popping up, so at least I want it to be
>> documented.
> 
> MOVABLE zone is certainly an important thing to keep working. And there
> is still quite a lot of work on the way. But as I've said this is more
> of a outlier than a norm. On the other hand movable zone is kinda hard
> requirement for a lot of application and it is to be expected that
> many features will be less than 100% compatible.  Some usecases even
> impossible. That's why I am arguing that we should have a central
> document where the movable zone is documented with all the potential
> problems we have encountered over time and explicitly state which
> features are fully/partially incompatible.
> 

I'll send a mail during the next weeks to gather current restrictions to 
document them (and include my brain dump). We might see more excessive 
use of ZONE_MOVABLE in the future and as history told us, of CMA as 
well. We really should start documenting/caring.

@Mike, it would be sufficient for me if one of your patches at least 
mention the situation in the description like

"Please note that secretmem currently behaves much more like long-term 
GUP instead of mlocked memory; secretmem is unmovable memory directly 
consumed/controlled by user space. secretmem cannot be placed onto 
ZONE_MOVABLE/CMA.

As long as there is no excessive use of secretmem (e.g., maximum of 16 
MiB for selected processes) in combination with ZONE_MOVABLE/CMA, this 
is barely a real issue. However, it is something to keep in mind when a 
significant amount of system RAM might be used for secretmem. In the 
future, we might support migration of secretmem and make it look much 
more like mlocked memory instead."

Just a suggestion.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
