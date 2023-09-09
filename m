Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D147EE14AA
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVl9i99kF+Tg4RVDPb5nTz0h2DF2eg/uOwClfUYkiD8=; b=Vm7ycZ0iQD8tpw
	LIQR+xAJDDP7waiKmEAMywKTqnf5p4JuekNEStv2hBTbfMWWsIH6U9CbZoXPGtxmjhaAFArqMNyVJ
	88tXU5kyohqfik21/wWMkdAFWOkgf3d/WniIjKHvR+AWf4zV5bWL50lTjRxauTbblHtzWZapC8WGM
	fTqjYxHLwPaNA9qPbYiciLiN5FNDA4COcxNMkieM0iA9IwNS56w7D9SERFlfxONffP+bDq0/X1tLs
	4UIHL+JbVtIeMj9iLXJJf2pk62PMUgkgjm4R2TbfFl94SM6BOUjR9/92H20puggQQ3Ts7jCsLTr9B
	H9/BcedQ7Nk0L1wRbsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4JR-00Fka1-2n;
	Sat, 09 Sep 2023 20:12:13 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4JO-00FkXX-0t
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:12:11 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 97AC9320031A;
	Sat,  9 Sep 2023 16:11:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 09 Sep 2023 16:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1694290319; x=1694376719; bh=zFPfJmkCicfpsW/Di0U8iA3BaJhU5h7wnTH
	y7qw0czU=; b=gFy0O1/wAKi4K5GDJJ9Cye9qUwU4RiR4mXj/oed9PUtpOKb5ukt
	8R5ocgXAYJwu5qk1zVqe3sIPt6qZDDkLeGwZAVp+uzsyoL0LFMTy84HPIL1aDt7Q
	8YUcwK20OGbtVZMErC9TPD1HHMPVxPd75g19DqBwzr6yb7H+LfH0MiRoQt2FOhXy
	9Y8OeEaCKnJIGekOYPr9RyfjspMu5ldVcuaADaA0IZ4lADiVvYhsO183D6SBfRKn
	q4jgCxwp7/2pzJmQqyhSQU1pGo9nwf6J5FrLYyNWgDshu+slbNmbj7sw5NdF9qyM
	eGkS30uIVBkCiCeQ/+3h382FKVM/12veeDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1694290319; x=1694376719; bh=zFPfJmkCicfpsW/Di0U8iA3BaJhU5h7wnTH
	y7qw0czU=; b=N+8j8kNhAc0RFRDzU1ddxe8A81rWMqO8xuL+fdT1WwRKlwkCFW9
	P3MOpFj5kA1YOz+ycot5Pf4r4/0YuYi1ACXlR2VUIAA4de8eFr8W76hSPJ2nwScP
	gFUVXFXfag98IE83rHDBX3Dcsi0yBdenU7f5UVnvsDB5DiAloDYEZ0ObtbXwES1X
	qmOw3swBG6OvrzxCJfTk7t+ONkC96QrzENw8X8cjFGuxIuW0faiK72AtxDgFBI8M
	BtlFz5CJxhjmV6oQEJIslkty6TKRi5RWMC7GsXHsQWzsudTOOVM8Ry1G3j4nfAEc
	3lpNoEvdvFwN5QGPtR5bSWj0/eG/KgLRyAw==
X-ME-Sender: <xms:jtH8ZJCZJr-ISXwvM97HIa0hXnp2P2UKkMLMtecNx0eRMiHRBJRqAQ>
    <xme:jtH8ZHjeHMoQi6HOYwwVd-sPvFSlLcxIP6pMw7Tq-Hph-vBy-H_p0YOYQpYqGqa4b
    ZI82bpN87SLTYnp3Q>
X-ME-Received: <xmr:jtH8ZEnhKhy-BmMkDPFWzS1SP9_OPftPmst665cn21gp7qZ34bxdaIKBhs7HjTJgLXkYGDOvWs_gkr2wqQrKIHf1X60DFZf3DR-zDfY0CKkKLjoO9TrsceEfEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfhfvefhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepffeliefgfefhgfelueejkeefueffteeiiefhudeghfeuleff
    geefleelgeegtdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhl
    lhgrnhgurdhorhhg
X-ME-Proxy: <xmx:jtH8ZDzu2MaUeLfILkpT2Fe5ReUb89yNSeLMTiaMe9CTCKe5Vqqd7Q>
    <xmx:jtH8ZOQb-3PqEXEVcNnEspKrJ49RWddKXx_brPTZ-fGhzUI5LJA5Mg>
    <xmx:jtH8ZGZUEOx0kAbo479CiMdBcjTJ2-AnnGNvqsQSoUdoob2y3Li_gQ>
    <xmx:j9H8ZIDMavRXNS-pKzc9aEEwVMAG_SxqyC0PcrxrP3jF9EGl4tjF4Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:11:57 -0400 (EDT)
Message-ID: <bd7f8612-e9bf-deab-450d-f0cde52cdd1b@sholland.org>
Date: Sat, 9 Sep 2023 15:11:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/4] riscv: tlb flush improvements
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230801085402.1168351-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131210_345565_35F7AADB 
X-CRM114-Status: GOOD (  17.33  )
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

On 8/1/23 03:53, Alexandre Ghiti wrote:
> This series optimizes the tlb flushes on riscv which used to simply
> flush the whole tlb whatever the size of the range to flush or the size
> of the stride.
> 
> Patch 3 introduces a threshold that is microarchitecture specific and
> will very likely be modified by vendors, not sure though which mechanism
> we'll use to do that (dt? alternatives? vendor initialization code?).

Certainly we would want to set the threshold to zero on SiFive platforms
affected by CIP-1200, since they cannot use address-based sfence.vma at
all. At least this case could be handled in the existing errata patch
function. I don't know about other platforms.

Regards,
Samuel

> 
> Next steps would be to implement:
> - svinval extension as Mayuresh did here [1]
> - BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
> - MMU_GATHER_RCU_TABLE_FREE
> - MMU_GATHER_MERGE_VMAS
> 
> Any other idea welcome.
> 
> [1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale@ventanamicro.com/
> 
> Changes in v3:
> - Add RB from Andrew, thanks!
> - Unwrap a few lines, as suggested by Andrew
> - Introduce defines for -1 constants used in tlbflush.c, as suggested by Andrew and Conor
> - Use huge_page_size() directly instead of using the shift, as suggested by Andrew
> - Remove misleading comments as suggested by Conor
> 
> Changes in v2:
> - Make static tlb_flush_all_threshold, we'll figure out later how to
>   override this value on a vendor basis, as suggested by Conor and Palmer
> - Fix nommu build, as reported by Conor
> 
> Alexandre Ghiti (4):
>   riscv: Improve flush_tlb()
>   riscv: Improve flush_tlb_range() for hugetlb pages
>   riscv: Make __flush_tlb_range() loop over pte instead of flushing the
>     whole tlb
>   riscv: Improve flush_tlb_kernel_range()
> 
>  arch/riscv/include/asm/tlb.h      |  8 ++-
>  arch/riscv/include/asm/tlbflush.h | 12 ++--
>  arch/riscv/mm/tlbflush.c          | 98 ++++++++++++++++++++++++++-----
>  3 files changed, 99 insertions(+), 19 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
