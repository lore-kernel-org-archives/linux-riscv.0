Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788E0C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 16:24:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1886D64DED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 16:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1886D64DED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pc/JZ+m+6y+xh7U2+6yT0rroTcG9vJBFPnIK2MggISU=; b=b8jtD7MpwY0Vt5X0X44rWg6qJ
	TabOdzmqc8kki1sMWCsqTpZt1Xitm0gbUzjl8elrgBOsnaaN4m4G7vJbdPbJbrnJIT3UPF72THAZu
	wR5JQuJ0sle8Oed5BWsIhwqx5ydOJK9BNmqbHUMM0RdJJP+/bUbtHYDsvZhFcWyQVbLowhcAwKaIF
	aOrMQe9HJgPbJs0bjraHptfEFdMfq//RpP8YrseKb/IpdsT6CUg+pTtpVTQwjx5FcDY15zWCwSzmk
	UhAL/qoh3xcV3oqogCCzA5DAYEVbTOvnR1PP7J1qx7R3lm2DFSmFpxdN2sOjtGvEonz85XNqmqUTb
	CFSY9vcMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5A5X-0004Wh-JP; Thu, 28 Jan 2021 16:24:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5A5R-0004U1-Ga; Thu, 28 Jan 2021 16:24:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611851039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WWmcYeElb62qutT0Kcoo6xDCdrj66eelF83EHgFDfB4=;
 b=ZJlUD8pQK2nIX/Cnj1UyvowYIjPxyyZKq5kI8NYKzxJt5tEqE9314CXd37wDkUTpPEa6Vf
 YEZQtVEmaZg8j88rldXEzhTt3tU4zmyFht8LR4yeM3dwIAsKI4509bn1BlnRgtEZNO+G8l
 DXrH4A5dU/j38+v0Vo5e/8cwta9YIu0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6C7DAC41;
 Thu, 28 Jan 2021 16:23:59 +0000 (UTC)
Date: Thu, 28 Jan 2021 17:23:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBLlHpJj0sjzrxFv@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <alpine.DEB.2.22.394.2101281326360.10563@www.lameter.com>
 <YBLA7sEKn01HXd/U@dhcp22.suse.cz>
 <alpine.DEB.2.22.394.2101281549390.11861@www.lameter.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2101281549390.11861@www.lameter.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_112401_829040_1E994066 
X-CRM114-Status: GOOD (  24.23  )
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
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
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
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu 28-01-21 15:56:36, Cristopher Lameter wrote:
> On Thu, 28 Jan 2021, Michal Hocko wrote:
> 
> > > > If you kill the allocating process then yes, it would work, but your
> > > > process might be the very last to be selected.
> > >
> > > OOMs are different if you have a "constrained allocation". In that case it
> > > is the fault of the process who wanted memory with certain conditions.
> > > That memory is not available. General memory is available though. In that
> > > case the allocating process is killed.
> >
> > I do not see this implementation would do anything like that. Neither
> > anything like that implemented in the oom killer. Constrained
> > allocations (cpusets/memcg/mempolicy) only do restrict their selection
> > to processes which belong to the same domain. So I am not really sure
> > what you are referring to. The is only a global knob to _always_ kill
> > the allocating process on OOM.
> 
> Constrained allocations refer to allocations where the NUMA nodes are
> restricted or something else does not allow the use of arbitrary memory.
> The OOM killer changes its behavior.

Yes as described in the above paragraph.

> In the past we fell back to killing the calling process.

Yeah, but this is no longer the case since 6f48d0ebd907a (more than 10
years ago.

Anyway this is not really important because if you want to kill the
allocating task because there is no chance the fault can succed then
there is a SIGBUS as already mentioned.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
