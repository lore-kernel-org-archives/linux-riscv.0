Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8EDC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 08:23:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BEF64DEC
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 08:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BEF64DEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gEQn2k0+nw6U3CTbIo6k/B8/zjsxVH2Xpe/BJ8+eVG0=; b=cQxDxU5paXP5JPirP+Y3l/R9u
	9zJv6J48YBagWeQLmuAHgXn7djgwDAjPqoVMM1sgUWjT/ImMsrHkAtykKyEb2rK9t7ZQepmpAjYQF
	Tc4fdfZNsGj+8iB3wCilAM/U/Ypew9tdk7/Cq/K1kcP/nLrBer+HYAV6qell3yFax9sYqpUp7Zf9n
	1mh1c3BDW4n25QY0Kk57quOIhP+jONfMaxBTITmw6TDE/vKDh8EEEaYlRTV/WXjcwwBNUROtFw46l
	Se5Hr729aTw4daF8xC+hUFUXghkgPhxVYvLYXt3rCP+tsjdpuJT83l1G/5Z1nkS5+5BA1RlFRDa6C
	7mAmu73WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5P3x-00043l-Th; Fri, 29 Jan 2021 08:23:29 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5P3j-0003yo-8T; Fri, 29 Jan 2021 08:23:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611908593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/Q67vMMYuPsjuSK9sLzU1LCeFaWe4xF/l4UFNZMONQ=;
 b=AVLJQflv/+SYkSv4ERXyiT7/jY3GzNjJm97jAboIN3LMwVBbN2x7H/KCFiEihomOMdrfsH
 gcyRhiH9LkuycXyRf5uQ6UzJ7Ci67vQ0hTzLhrvCsqWvWU3wqQc1iBhmw76ZvSCZGUhLvj
 8w0LFU8kORoRU9LyGyyHc/SD3SCCYBo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D1A8AFEC;
 Fri, 29 Jan 2021 08:23:13 +0000 (UTC)
Date: Fri, 29 Jan 2021 09:23:12 +0100
From: Michal Hocko <mhocko@suse.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_032315_597756_C02FA41C 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu 28-01-21 13:05:02, James Bottomley wrote:
> Obviously the API choice could be revisited
> but do you have anything to add over the previous discussion, or is
> this just to get your access control?

Well, access control is certainly one thing which I still believe is
missing. But if there is a general agreement that the direct map
manipulation is not that critical then this will become much less of a
problem of course.

It all boils down whether secret memory is a scarce resource. With the
existing implementation it really is. It is effectivelly repeating
same design errors as hugetlb did. And look now, we have a subtle and
convoluted reservation code to track mmap requests and we have a cgroup
controller to, guess what, have at least some control over distribution
if the preallocated pool. See where am I coming from?

If the secret memory is more in line with mlock without any imposed
limit (other than available memory) in the end then, sure, using the same
access control as mlock sounds reasonable. Btw. if this is really
just a more restrictive mlock then is there any reason to not hook this
into the existing mlock infrastructure (e.g. MCL_EXCLUSIVE)?
Implications would be that direct map would be handled on instantiation/tear
down paths, migration would deal with the same (if possible). Other than
that it would be mlock like.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
