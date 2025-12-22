Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8677CD711D5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEJiqdgl+EjPxvP0EN6j2B6OZrzLrQqGXtT7s0lGMYA=; b=pSch+3EsBRHMhW
	MqVRe8wx+XUzUtlZlKadb+VvQJgRqTsgKfEJwN+7784sg5w5vZWnlKGFb8UmO2034zQHwDSnTcEVx
	yE4fRL06SOPgTiTW/nyS2x1TOGlzfDGUc4oFnBr6mlRRQfXvYOYXz4LRh/K17lGbnT2n0I8Nuiv4x
	RIVSYIz/6+wLUMAZl+9gP4F7N3Gr1xzsP4QwxQVW8VIBZNglQ2gQZ98QIih+XYKmq/YFkTSJW/67L
	GoNa0+SvWKmwj7DNhZ2kPjquokEs4wOu/bVXP9qV5lq7FfM1q17DxN3oC8pih43VnVzXo8HNf2H8y
	wZZl3M33rV2kEQr7/6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd9s-0000000Dcod-02kE;
	Mon, 22 Dec 2025 10:28:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd9o-0000000DcoG-2OHO
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 10:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 307FD40180;
	Mon, 22 Dec 2025 10:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFE9C4CEF1;
	Mon, 22 Dec 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766399331;
	bh=gpI81CYAZDI5HhhxXAwfSCUYaYR7sSbyLFN423qq0Z8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzi5UKY+SCvVFYHfm5csTU5OI5er+dNklX9M5m/zec7X5fgX33WqOMbRBtk83enAa
	 OvCxPPfAahY/yFpkkTd4hZ530UhdVQLFACAX1EHZBBAxzMcBLg3RdOTdKs8s0OGnoa
	 laMPM1Rh+W/W8wsGe4ej6Ds3yrnXVkVDiZTlkHGUJvPTdBlxF2qE0V2hDFEEeXLyWZ
	 hBDQGVdCa4J8o3OUq9ldWfnMXOi3+kNjaTgBbDq3Q0mjCHIm6QPqAlD2604+OaiqMJ
	 2AZ4wdtOrh99mmswzzFltUtta6Xn7nX84Aodf9HucX2Yc7T6xHrHjnlug9uPBbpQTE
	 0HhhJWryqziRg==
Message-ID: <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
Date: Mon, 22 Dec 2025 11:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
 <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
 <87fr93ky5i.ritesh.list@gmail.com>
 <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022852_750233_7836845B 
X-CRM114-Status: GOOD (  19.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/22/25 06:57, Sourabh Jain wrote:
> 
> 
> On 22/12/25 08:42, Ritesh Harjani (IBM) wrote:
>> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
>>
>>>> Coming back to the fixes tag. I did mention a bit of a history [2] of
>>>> whatever I could find while reviewing this patch. I am not sure whether
>>>> you have looked into the links shared in that email or not. Here [2]:
>>>>
>>>> [2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/
>>>>
>>>> Where I am coming from is.. The current patch is acutally a partial
>>>> revert of the patch mentioned in the fixes tag. That means if this patch
>>>> gets applied to the older stable kernels, it would end up bringing the
>>>> same problem back, which the "Fixes" tagged patch is fixing in the 1st
>>>> place, isnt' it? See this discussion [3]...
>>>>
>>>> [3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae
>>>>
>>>> ... So, IMO - the right fixes tag, if we have to add, it should be the
>>>> patch which moved the hpage_shift initialization to happen early i.e. in
>>>> mmu_early_init_devtree. That would be this patch [4]:
>>>>
>>>> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
>>>>
>>>> Now, it's not really that the patch [4] had any issue as such. But it
>>>> seems like, that the current fix can only be applied after patch [4] is
>>>> taken.
>>>>
>>>> Do we agree?
>>> I think we should document all that in the cover letter, an describe
>>> that this partial revert is only possible after [4],
>> Yes, I agree. Let's add the above details in the commit msg.
>>
>>> and that that must
>>> be considered when attempting any kind of stable backports.
>> Sure. I would prefer if we change the Fixes tag to the one which I
>> pointed in above [4] (with explaination in the commit msg). However I am
>> still ok if we would like to retain the existing fixes tag and show [4]
>> as a dependency.
> 
> I think we should keep the current Fixes tag with an explanation for
> dependency
> on [1] in the commit message.
> 
> Would anyone have a different view?

Whatever introduced the issue should be called out in the Fixes tag; if 
there are dependencies for the fix through other patches that were 
already merged, that can be documented in the patch description 
(relevant for stable or distro backports only).

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
