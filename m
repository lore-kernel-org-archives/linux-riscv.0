Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF068C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/RMAsRbpCwqWv3AGxCRxAAeSsePkCW0wGf3TSjqhcY=; b=EHbUhRfcWs1kdU
	Dk4NLwEzw3rrktGNmXMx1jTmtbdxMoHH7gwwiSIHGBfIBoFL02arAVuUcKBBeEzBBZ7EPBBT/vjgi
	J3mAzwY/epNNopH5LWf4HGkmyLSDpWTqsR5fUSVoBuxugjycfFKFTW6J9C+Bn4j/MmHuJcMnsoOdO
	8TzXNZTALNpIo+fzbvN1GxuzRyYm+yr38qFf2q+JE3BZO9ooL26wGDaD7hXHuwn4wYYBagMCENoiT
	8QjoYVTblXdJIhP/0ZDqbxIOTG767efunY+f0n1LfmMsXBEaS71LqaeTfNpWJDr/4VCb2/uv+OemR
	/3o9Itn8B3nbuwc+ztQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlr9U-00000007QXI-0Dsi;
	Mon, 20 Jul 2026 16:47:36 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlr9R-00000007QWS-2jm2
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 16:47:35 +0000
Message-ID: <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784566050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NxQvnwYlpKK36SWC6+zTzcYERz5XJIYpkhO8WkhgIA=;
	b=ICBjY20DjdrJPYGZwJ25e7LdKK4Pnj3v+NZ8P/FWIrw5qTXFDS3nH94Zq4DFH6zQawGS2v
	c1sfPFNiRgf9n8LSmFXCHl5gjix/kR4YdHtiuAh9OdlXIdgTXW4QZ3kHJ3hVue3qhGTBZB
	XlTLcBfDBPHrZPKa7Guw+MzBMIngEkY=
Date: Mon, 20 Jul 2026 17:46:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@meta.com, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
References: <20260720115741.239657-1-usama.arif@linux.dev>
 <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_094733_837005_31AEC555 
X-CRM114-Status: GOOD (  16.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 20/07/2026 16:08, Rik van Riel wrote:
> On Mon, 2026-07-20 at 04:57 -0700, Usama Arif wrote:
>> On Fri, 17 Jul 2026 13:00:32 -0400 Rik van Riel <riel@surriel.com>
>> wrote:
>>
>>
>>>
>>> mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL and
>>> is stable
>>> afterwards, so it can be read without the mmap lock, as it already
>>> is from
>>> untagged_addr() and mm_untag_mask().
>>>
>>
>> I think it might not be stable? set_tagged_addr_ctrl() can change it
>> repeatedly until a CLONE_VM operation sets MM_CONTEXT_LOCK_PMLEN.
> 
> You're right, ARM tagged addresses seem to work a

ah do you mean RISCV here?

> little differently from x86 LAM.
> 
> It looks like on ARM with MTE, the top 8 bits of
> the virtual address are available as tags, meaning
> that address space cannot be used for VMAs.
> 
> For purposes of accessing process memory, this
> is a little more stable than LAM, because the
> number of bits we need to mask out of the address
> is always the same when MTE is in use.
> 
> At least, I think so. Am I overlooking anything?
> 
> I will clean up the changelog like you suggested.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
