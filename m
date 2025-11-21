Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB702CFC29A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODYJQSrD3v2MaU45eDhXWoX9vuRfigleJg1HfB/KEos=; b=DYliQssuhQ8ox9
	53czzLzVYqhU1gm/9uPeIlhfnBymHLvwQQbdgb3OlgAWUCPUyOjPzcKAcwH1aNR51GxKb483mDHxi
	BKOLzstjAlQGR/Q2NCAM06wwHp1ImIwuEhjGXjrsxiyfRjcpwQHG/Ly7mwIga4mc7eEk+JT7AOrh6
	RnC22qv6AhIs4y4D7aM1ppNZ10Eyrk7zgKzRxfiMYLiqXAcOPwMt7ABJXCUagSB4uiUmMiZbVHWDk
	ZzFHeo4QsYBnYf4nklGBrAVOcMmSIpY3jPXjQsr5lG99+xlPbj/ubtvIgdRkhHQL3DmpsGDHVzjWC
	aaFfPgQ6gtAmxmEWo03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVzt-00000008rJm-3THe;
	Fri, 21 Nov 2025 18:36:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVzs-00000008rJe-07Cz
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 18:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11AD660139;
	Fri, 21 Nov 2025 18:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C2AC4CEF1;
	Fri, 21 Nov 2025 18:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763750197;
	bh=crGPPT0AtAuzG2UEVBlxUERhuPjW93cug8nah7uLwPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEx6H1kx4LH2VEQuGtG4dDTBfQimoEx6dOPrEkpMfabhu8lvBwbefk1rGdOBtVACD
	 QZKA8vPhUokAEv0JJOZyDEHGcBf++sPmEabuLzPJH1etPYvKiGFWYCxM0l12ChfFsx
	 m1HWtmpBhooqID4D5faCmw1veUK4HRjgPAR6uS0U=
Date: Fri, 21 Nov 2025 10:36:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, Peter Xu
 <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>, David Hildenbrand
 <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil
 Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue
 <ved@rivosinc.com>, linux-fsdevel@vger.kernel.org, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V15 1/6] mm: softdirty: Add
 pgtable_supports_soft_dirty()
Message-Id: <20251121103636.22321ceb37093370e59cb6e1@linux-foundation.org>
In-Reply-To: <dac6ddfe-773a-43d5-8f69-021b9ca4d24b@lucifer.local>
References: <20251113072806.795029-1-zhangchunyan@iscas.ac.cn>
	<20251113072806.795029-2-zhangchunyan@iscas.ac.cn>
	<dac6ddfe-773a-43d5-8f69-021b9ca4d24b@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri, 21 Nov 2025 16:57:17 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> This breaks the VMA tests. Don't worry it's not exactly an obvious thing.
> 
> You can test this via:
> 
> $ cd tools/testing/vma
> $ make && ./vma
> 
> (Currently we also have another breakage too which I'll chase up separately.)
> 
> Andrew - Could we simply apply the attached fix-patch?
> 
> I know this is in mm-stable now so ugh maybe we'll have some commits where VMA
> tests are broken (not nice for bisection), but anyway we need to fix this even
> so even if it has to be a follow up patch.

"mm: softdirty: add pgtable_supports_soft_dirty()" is still in
mm-unstable so all is good.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
