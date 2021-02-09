Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A5C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 13:25:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4EC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 13:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D4EC64E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lmna/oU4ATcDroUX0rrSg1EmdFbFPn5L/SlGa3FjQCM=; b=neBK07m0DDgLRO44rG5FRV7an
	NRtVtK/tRwwlnt0MKsOFtj4ozDjrq1SzcHK4vi2VuGKFNWiNx8yACn+eFgPdw7GVaekkQtk6+Bu6q
	/NvfxCvK5tfLAcaL0kRh+H69Zm63HneUsw9IyRITF4KNMdAQi3n3Z/sRrnYHYpM71dNeczTqqx5mq
	xJe3ufvODBS+9nObm8z/oAzJst/3FMMNpwEZTDfZYl8sl0xCRyGmQWbGuzNwv5UrRGRGyWPiiRebM
	3SM0dAI6FIiG3IyXLQfCxI7yp0YPVcOMW986TsacIJUD31JGcCGziPJJqDvOSm7DXRgYkxI3t4WoM
	4t//H5Yrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9T10-00017h-5Y; Tue, 09 Feb 2021 13:25:14 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9T0u-00015A-E9; Tue, 09 Feb 2021 13:25:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612877107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZVdQYAWpX2uS4c8GuGsp90KbxvIcZCLSEozx0GHShkA=;
 b=AMu2gqbj/4bFKubqIvA00x5aKR/RM0bxKuI5rFq/VIF9xzAE5jv4eYLmgTbusqtjFAY5Df
 Aox1zELPhI/1rzb/LrFIULNqnHdWSAlWT1TNgH3OziiDEXT769CiOawfnAmhijx6/V4k/9
 8MT4wMa2DixXuIxBTpeQxrZHRPB3LL4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E7E2AD6A;
 Tue,  9 Feb 2021 13:25:07 +0000 (UTC)
Date: Tue, 9 Feb 2021 14:25:06 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCKNMqu8/g0OofqU@dhcp22.suse.cz>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
 <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
 <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
 <c1e5e7b6-3360-ddc4-2ff5-0e79515ee23a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1e5e7b6-3360-ddc4-2ff5-0e79515ee23a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_082508_695790_AFA1B50E 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue 09-02-21 11:23:35, David Hildenbrand wrote:
[...]
> I am constantly trying to fight for making more stuff MOVABLE instead of
> going into the other direction (e.g., because it's easier to implement,
> which feels like the wrong direction).
> 
> Maybe I am the only person that really cares about ZONE_MOVABLE these days
> :) I can't stop such new stuff from popping up, so at least I want it to be
> documented.

MOVABLE zone is certainly an important thing to keep working. And there
is still quite a lot of work on the way. But as I've said this is more
of a outlier than a norm. On the other hand movable zone is kinda hard
requirement for a lot of application and it is to be expected that
many features will be less than 100% compatible.  Some usecases even
impossible. That's why I am arguing that we should have a central
document where the movable zone is documented with all the potential
problems we have encountered over time and explicitly state which
features are fully/partially incompatible.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
