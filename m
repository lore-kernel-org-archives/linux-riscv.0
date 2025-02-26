Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902BC021BE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mmP43AsvdJa3PeqYok60Yh7JzTK4vkICqwHJJwoE88=; b=e90x4vzoJh8g9D
	r10GB2MSp7YJRbal4JjkLbAks3ptRjoozMTHwT3g/sX0PeQakb9WJc+a9gktKPAdrra1QuJPkRj1L
	kAEtF3/b0iVebqrpqEK3Y6Rov29x2WxYs1TxBC/yT1M2/fn59Fy6OgjUnzl1VchZbhld7arh0FRsZ
	rC3ymwbZmZ1ES9oIiYlzayUSrGTzwxFfCdYN34B+LE5V8yNmeM/j/NsGz/3qxWEbwJwgBht3j52vk
	23a9Y5UbbSnfhx5wmHg404LpwM2DM+bp5Eu5znToguu4PzyH6qaxGA/L8oIAaATouZIr4gAa5K+SH
	7PcCQjRvhPpIEDI/OhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7Ge-00000002Bix-0tFl;
	Wed, 26 Feb 2025 02:35:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7Gb-00000002Bi8-2Byp;
	Wed, 26 Feb 2025 02:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1B905C42C6;
	Wed, 26 Feb 2025 02:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C5C4CEDD;
	Wed, 26 Feb 2025 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1740537320;
	bh=D1D8rS483Kvk10lvdoELGqdaSPPJ8+RwRwWrcJv/f3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S1gwcxb1U5NetK3xMsHF5vM6u60LvjvD37R2V7WH6p4gYsrCTXOx/Tm8FgtAbjivR
	 qz+7qiIisTFHmeHWl5R9WetoFdsZhGC4DSBkZuJtQrrOYkeMmMmZLGVAL4e/QXKk4q
	 rWdAk6qG/KIo4K2Hgo8x/4gNeZ32aVYhEb8keWT8=
Date: Tue, 25 Feb 2025 18:35:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Message-Id: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
In-Reply-To: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
	<36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_183521_607021_B5F7393D 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> The x86 has already been converted to use struct ptdesc, so convert it to
> use tlb_remove_ptdesc() instead of tlb_remove_table().
> 

This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add
Rik's patch to mm-unstable also and shall figure it out during the
merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
