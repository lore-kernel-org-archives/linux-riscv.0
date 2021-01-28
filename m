Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F625C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:56:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C25C564DFB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C25C564DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zQqw1MfsqtEU9zpZaVLn6RVWQLjGn3mWQ9zgTyIWzts=; b=ptDlx4gJk9Dd45bfrJP16jwmu
	abjMVi3ypHP0d7lFC/TiL0zf1hnmnvsGsfcH+cZNSTcVLk3axm6jwCJijrMeBxmnJlGP/DG8mQci3
	G1l3Fsjnw/y9/X445lInSpiyQ6gjZ02NImEtKa8VPxaWfttwdbwjeXUUJMnBvpv6JReTmckOkrnth
	aVteKGJcPcBekUkvKBxen5VycEZFjdxM3dIICcfdlhMai/ksk2D38oZBaXlXVev95enk5Cb2oUbl7
	zeIiwVVHHdsmsjtgLSyqCypFK23VjRyD3m0uYUInfV3SRhYHvBqpEJ99NYj66gyYgs4Ws3L9pfosN
	9r9v8vzYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l59f4-0002aL-Oa; Thu, 28 Jan 2021 15:56:46 +0000
Received: from gentwo.org ([3.19.106.255])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l59ez-0002Yi-E1; Thu, 28 Jan 2021 15:56:42 +0000
Received: by gentwo.org (Postfix, from userid 1002)
 id 70A813F4C1; Thu, 28 Jan 2021 15:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by gentwo.org (Postfix) with ESMTP id 6DA583F461;
 Thu, 28 Jan 2021 15:56:36 +0000 (UTC)
Date: Thu, 28 Jan 2021 15:56:36 +0000 (UTC)
From: Christoph Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
In-Reply-To: <YBLA7sEKn01HXd/U@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.22.394.2101281549390.11861@www.lameter.com>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org> <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz> <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <alpine.DEB.2.22.394.2101281326360.10563@www.lameter.com>
 <YBLA7sEKn01HXd/U@dhcp22.suse.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_105641_540204_EA6C0C6F 
X-CRM114-Status: GOOD (  18.92  )
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

On Thu, 28 Jan 2021, Michal Hocko wrote:

> > > If you kill the allocating process then yes, it would work, but your
> > > process might be the very last to be selected.
> >
> > OOMs are different if you have a "constrained allocation". In that case it
> > is the fault of the process who wanted memory with certain conditions.
> > That memory is not available. General memory is available though. In that
> > case the allocating process is killed.
>
> I do not see this implementation would do anything like that. Neither
> anything like that implemented in the oom killer. Constrained
> allocations (cpusets/memcg/mempolicy) only do restrict their selection
> to processes which belong to the same domain. So I am not really sure
> what you are referring to. The is only a global knob to _always_ kill
> the allocating process on OOM.

Constrained allocations refer to allocations where the NUMA nodes are
restricted or something else does not allow the use of arbitrary memory.
The OOM killer changes its behavior. In the past we fell back to killing
the calling process.

See constrained_alloc() in mm/oom_kill.c

static const char * const oom_constraint_text[] = {
        [CONSTRAINT_NONE] = "CONSTRAINT_NONE",
        [CONSTRAINT_CPUSET] = "CONSTRAINT_CPUSET",
        [CONSTRAINT_MEMORY_POLICY] = "CONSTRAINT_MEMORY_POLICY",
        [CONSTRAINT_MEMCG] = "CONSTRAINT_MEMCG",
};

/*
 * Determine the type of allocation constraint.
 */
static enum oom_constraint constrained_alloc(struct oom_control *oc)
{


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
