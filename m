Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAC0C43381
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 10:20:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8416E23108
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 10:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8416E23108
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hOLDqBk+0y8YaeLvgk801PX2ITMD2i40PPITjyILqs8=; b=Oqg0fW0ZoMa6zUGAuwFoY0eHh
	+T1h+fLFbnO+SYmn75EY1gKBOu1VmhK5w8FVNiMv88LDJL39p/S7wqjixjx3vxhsi+dFORzRHdnRX
	aBucX/mPNaLBCrOcj6eG9Spfz7HICp3ElNFYHC4Iy+ZDgFa7/k6qTESILihfR8SPGCf15S2xA94nb
	DYDxTnZxX/V/Xm1jtge+DTJooUKAUgeeHFlw4oMr205adgPouGuEVdYXBfC6MhEmvvqOsusxn/y5C
	dcAmZuUOQAzI+q5p7QkgE0AVxUjSV2ZG0euADfCRRMYJrEthEbU9hEgEQiYWfcsUlXYNL5Ysvmwia
	nC4FcDDxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4LS2-00065K-Ix; Tue, 26 Jan 2021 10:19:58 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4LRx-00063A-J1; Tue, 26 Jan 2021 10:19:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611656392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FkBlpLaDLCjmZaDvBj+nmc1/By5Jyg5M7J+fO4B7Whk=;
 b=mtCxn6j0A/mh0LBKPiDz4ztviV4HkdrzPqf3uj9oB4ypZic601FKrti0WVEckGQnRr99Cd
 49ulTY0OojdKvVqB8DyMLyGtVT3l1L6HWwjvOsiIsbmeTyXT7T1PhEh7zUswGx3af0EVxk
 q5DAUvY+as7fxIaUNVFBvFArUNaDp8E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B6D6AE40;
 Tue, 26 Jan 2021 10:19:52 +0000 (UTC)
Date: Tue, 26 Jan 2021 11:19:50 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210126101950.GJ827@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <20210125170122.GU827@dhcp22.suse.cz>
 <20210125213618.GL6332@kernel.org>
 <20210126071614.GX827@dhcp22.suse.cz>
 <20210126083311.GN6332@kernel.org>
 <20210126090013.GF827@dhcp22.suse.cz>
 <20210126092011.GP6332@kernel.org>
 <20210126094903.GI827@dhcp22.suse.cz>
 <23850371-a19f-51fa-d813-6e78624ee8f8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23850371-a19f-51fa-d813-6e78624ee8f8@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_051953_765809_0BB9A4DD 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 26-01-21 10:53:08, David Hildenbrand wrote:
[...]
> I assume you've seen the benchmark results provided by Xing Zhengjun
> 
> https://lore.kernel.org/linux-mm/213b4567-46ce-f116-9cdf-bbd0c884eb3c@linux.intel.com/

I was not. Thanks for the pointer. I will have a look.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
