Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64072E99052
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/pyINzXpKsZA6AiC/2O3LZN92emA6ngEL8FaRgCCAo=; b=2fhpSPyfe20wvJ
	OJGY2FkBvzJkcx0LV8DLrDWyVszgnmA1gK6c8fV5x0SXujj/d6OOXFAGRGe0XOxxRAh6pwRI5yLtg
	X+wzqAmChDw1TdXJPLhChxzMsiIkSYbJ8UEqEXxdRGrfo20HcBMmOGY49K72thkEnGeG0keeJR+cP
	P6pZNhd8zRv9KZhN4g7ogV+cMq64NnMKidIPNJ1nboOZHZApLulmh6FMy1/Z3IEJd34WheHjpByNy
	oc5+rhpTBrYSMIcsn0ldgxri/GSi0UuEsMft/Tm2Nbe7QlnrzbYzHsJjKqUqWYUpi5tYbYxMxqyPM
	rPZcMOLDno+RhfpJHYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6gs-0000000Bnfy-48Fz;
	Fri, 10 Apr 2026 07:54:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6gr-0000000Bnfs-21Au
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 07:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E35B6013E;
	Fri, 10 Apr 2026 07:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA59C19421;
	Fri, 10 Apr 2026 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807648;
	bh=lyEPxIQgdgDhkm5+q3i8AVYjElyUkUFGJlpM1WnOCMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+LCs10/aPOGuTAHAFIjBy+ergqO1WXDb4Z95VST4uXqo9yfBxjMZrzf7X4WeGxyi
	 Epv7B4UjQ7Wl+BGTD9GjFeyIhgaboDcQD5maYfnZ2GYW9/xmskm9ZCXuk68+ckW/ea
	 Bj0JuCh5dmInlXg53wKTAssBk5HLM6Am2bBTvnoDkG9wGZInmn5xRkmG0YY0QM2VrJ
	 icIaQqA6zbovqI1/VkXnwkKm2V9fFe0xSPLaolLey4dcACEeGDAfFZSwdtbkGLvKE6
	 kVCD/mtKoKBN01IUXR08XneQB2LBtuyTSEgRkr+ZK6CKKxS1+P/HT49dbC1sREBGUz
	 ZXYzexxdS4B/w==
Date: Fri, 10 Apr 2026 10:53:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Michael Neuling <mikey@neuling.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Guo Ren <guoren@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>, Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] riscv: mm: Fix NULL pointer dereference in
 __set_memory
Message-ID: <adislUQ_dddOZZlW@kernel.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
 <20260409091143.1348853-4-mikey@neuling.org>
 <b3466f28-0d0f-4ff8-8542-e53216cf3667@kernel.org>
 <CAEjGV6yKKtN3kGeQ+tdz1xy-DDS2FD0C0X4qm-iZ3zq7LEyhHQ@mail.gmail.com>
 <c390be36-ac4a-4964-9072-7ccf074d2f7f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c390be36-ac4a-4964-9072-7ccf074d2f7f@kernel.org>
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

On Fri, Apr 10, 2026 at 09:42:26AM +0200, David Hildenbrand (Arm) wrote:
> On 4/10/26 08:23, Michael Neuling wrote:
> >>>               area = find_vm_area((void *)start);
> >>> +             if (!area) {
> >>> +                     ret = -EINVAL;
> >>> +                     goto unlock;
> >>> +             }
> >>>               page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
> >>>
> >>>               for (i = page_start; i < page_start + numpages; ++i) {
> >>
> >> Which caller would end up calling __set_memory() in such a way?
> > 
> > It wouldn't. You're right on this and the other two. Sorry for the noise.
> 
> Slopped-by: Cursor:claude-4.6-opus-high-thinking
> 
> :)

It's a general tendency of LLMs to generate overly defensive code and raise
concerns about theoretical issues.
Maybe it's worth taking into account when writing prompts specific to
kernel development.
 
> Patch #1 seems reasonable (although non-critical); not sure about patch
> #2, leaving both to Risc-V people!
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
