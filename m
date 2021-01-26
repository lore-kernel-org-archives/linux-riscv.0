Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DCFC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 14:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E887D22EBF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 14:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E887D22EBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AI+mVaas+nEjfb5esYfG5LUV/2cvB+1Kcx2Vw/VKsxI=; b=nT7b6UYZtvhl5i+7o1vPpjTQt
	rQesnNvsvCf/a7aiXwnsm7/osAnMF/35pd8LoMhV2tVfkAPtUY6Yys6R0fl9QM2PX1FFC8Bpobhft
	lBDUM9qs8+wPpbD+Vv4MPX7/jmkqQZZFcKwDEbwAXsVdk0a9tRv77z9XGHSedNqDRDaNVByIQ5FPO
	tOPtnnrGknXd2I2QFLnqaEE9wAI1Xqc8eXkz1cFCOCZZb3HQ7egJQJvelmcIfKTTw1AGUWLdrrgTw
	kzqfss0CRWqng+JB7QQ34jILqMpPHxRGjj8Rq/KRYae5w8AO97aE8XMu6kiBt4toRkBlq8EeuZF8o
	RZcisMF/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Pfd-0006J0-8d; Tue, 26 Jan 2021 14:50:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Pfa-0006IM-BR; Tue, 26 Jan 2021 14:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AfVmvy0+ars8vSXgUaa4Ou66AyTq8tua1GFfd4k4JEw=; b=nAP0nDbV1kwONwbXFxyftiqDWQ
 jHiVYK1NDKnF8QM69l3dG2FMsAL3iwGEI4VIpsVWD8NwGnDS/qwfGpm/s7IvdCmdZxN6z0NBOUOMX
 YsXcAxL04Ph78LoBwNMMvjI8JoSKao4Y2A92kUpREHLGb8TP6wqGFn4Z5Qa6E4pplksDWHdn/YL/T
 u1awwBPfVKq2MKlAnFFBbUPwFq/kxETbl3BSIto9xDeIvrQZNrjdM6PseQVL1Nu+JuoDOKC4BRjze
 R1vY4iXhTAIC177ONzK6Rj9jUVuhpyOkmi7Bw4tq7Ewm0jKEb9qOFULDXkvUQhNufow0/F7nS9cKe
 A0rXnu7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l4Pe2-005lWp-2r; Tue, 26 Jan 2021 14:48:57 +0000
Date: Tue, 26 Jan 2021 14:48:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210126144838.GL308988@casper.infradead.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz>
 <20210125213817.GM6332@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125213817.GM6332@kernel.org>
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
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 11:38:17PM +0200, Mike Rapoport wrote:
> I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
> Besides, kmem accounting with __GFP_ACCOUNT does not seem
> to update stats and there was an explicit request for statistics:
>  
> https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/
> 
> As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:
> 
> https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/
> 
> I think that a dedicated stats counter would be too much at the moment and
> NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.

That's not true -- Mlocked is also unreclaimable.  And doesn't this
feel more like mlocked memory than unreclaimable slab?  It's also
Unevictable, so could be counted there instead.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
