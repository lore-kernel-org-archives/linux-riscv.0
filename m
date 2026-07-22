Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9006AC44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws2id+ridox+HjhRjcGozTgZIXHIPSwjPeA/6dc7GDA=; b=rE0suhn69zrQg1
	qBDrwj0FaT/i43RvFe6B+W+DTt+xik5Yb1bje3j1nDejS6Ks6r6v6APm+OfV+yxHQT9PnBQ5tNqtu
	KE7Y9tJ3hoEJ9Ys2J0d1mxb2AC2fOtfhsdiQgIV+WkIOcASD3pO4RBDTTdgVT5XKm4UQD2hdewieH
	rEArUq8vfpExaCTboDoPlgwqvnjtgPuVh0K16/qkPcr5LCw61iOOEUMNp80yVXDEb2MLrvuUcaQYt
	yWw3yf/xzZ4c0bCD0Yhwi/RZY1+rZRCFkPCunqsb5CnU/8us4bS2J/VQL8R5W6Y5b47sUNHd8TR+q
	/KJtwT/yncY+9zEQRrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW4o-0000000BlYJ-2g4j;
	Wed, 22 Jul 2026 12:29:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW4m-0000000BlY9-48vT
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:29:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D3C7429E9;
	Wed, 22 Jul 2026 12:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245C51F00A3D;
	Wed, 22 Jul 2026 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784723368;
	bh=papv7YXw5e9qr9TxOo/7XQD2ZbIK8UNV5R7RthYAaH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYnoVDpube2nUxmuXxJGH6/oVcQZCukst05/PgbOP4Gt4qTsl22I0OVMaEp80tC3u
	 WewK4Rc1cl230aZ794/FgJfEuZpT64GQbmotN0+e3k4++xlRO6ymC4qxRQ2Wpc6k7Q
	 26+/ZvRH6N57IzolfLnNBNbz05NXxMFWzJ842SrVx1v3VHW6hL4yLaVYxoAFbL3T+1
	 O5pU2MpAQxD4ekUb1fbBmCgRGhKWHKNlRzcpxiGH6uneIlGNMZU+UUkxBMho7bBSrh
	 Vibpuqs51y2kKUw0sK9iw/nziRr8evIPPMvQUUGpeiHniF4h5cLg4ursE9MMYQRrYP
	 WFGKL2l6Sq3Rw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4F445F40079;
	Wed, 22 Jul 2026 08:29:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 08:29:27 -0400
X-ME-Sender: <xms:p7dgahjgoQwvtbrqV17q1YeAKh5wxNyjDqMvmgxjkbJ7nYLKMgWNCQ>
    <xme:p7dgajq1AYSrCF4o-80gtdV6bOwVsMVuzBPP_g6qBxw0Rrd1y4EbSYIDv5XojbBi4
    b9p-Geh_xUvpXp96LmzM_XxYMfu8NW3_qQbHC1Qo9EVZLTeEw21Tvg>
X-ME-Received: <xmr:p7dgaofXPOo2Ejn-NfaE9Uq8uZ3Cve-baeZuZkmQ87W_QdklNBIto4v1NzJBTg>
X-ME-Proxy-Cause: dmFkZTGPHf2oLZcBTXKE6VHMmNdjiu3OVwopU375jI5mGyjx5MTNfFKZDDYFAjfASgfQ9p
    pCgV1iuV9gZ2ZJUyga/sMkP4ZQ78Oz0k6IaZYq66oKgJbir/8pHqk3Pz2yD9JOucmuuUMd
    ACF/r8Gfs10FHRBCMoQpVHVcxX3HoZpzcOEx4geJsXQGMcUwBoK6w0nVJg54ru6LtS/VQd
    ipW01CD8D0rICOCqx1JcMZ+DsjFfUCHsR1j7LCBeI1HuFvlPG2Pwdn6dUpDddJLkpR5a6P
    Kr39m+yAfhUC3bm5YeqMY9gdD2Pvcu16gpQii6zdusGiVw7RbLfNcu857+dbcsKTdQiFhU
    hrdLSV1/CK5a39CYFT4mB3ro4v5wyKGR+zmT9RTpZSbPKnG12jkuu/6DMxHoqQgfZA/a7H
    WLbqA+RINseTq8cMxylFuByGcDNuxXEOtjzJh0r1Q/nQKxw3LH3DLczlf9kff9IGRCYgWq
    E+Rl0gLheZN0K8v4HiAIZEYeQmgXtn0av5s/z1KdLNke7jHrN0MNy4UjMfg7Dfj5dU7Ix/
    3rSE1G07fKdFfRYkiTLMnM3dUaV1WggeeAMLNkXXvX3Axi/l79F96meVXNiMomsL9HSbht
    QjxZKQA3GWHrnG+lBOH9BygwUKnMZKes/vVWFk5XY6GKx6NvAf9/Cn9Tp3wQ
X-ME-Proxy: <xmx:p7dgaufaJvr-dcmLleKtuoMWWuCZ9JQcadxQIce3OjGGeWMnCpuxzg>
    <xmx:p7dgamd2EpRJ7lXg_tRXx01T8K4wdL9teLjtcshAAVKW7kF0NnXdzQ>
    <xmx:p7dgasp0wP7wdwd9QMHABLn3bX1tJbyLghrsaT2uuJJbhaqRF09o1g>
    <xmx:p7dgauyA9UGBuF8wTp5Njb3fagh_HwpVP4kFYPG1nRp4D9vAw24XaQ>
    <xmx:p7dgaqcIQeaUd3J6VjPAL3p0h1R3tAPAtiKGqWlNNskOFqHqsgh0ZYyL>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 08:29:26 -0400 (EDT)
Date: Wed, 22 Jul 2026 13:29:25 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, David Hildenbrand <david@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vishal Moola <vishal.moola@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Nam Cao <namcao@linutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
Message-ID: <amC3cuIMjMPikf4u@thinkstation>
References: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
 <599C4370-89C3-4C73-8296-5723D73DDBB8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <599C4370-89C3-4C73-8296-5723D73DDBB8@linux.dev>
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

On Mon, Jul 20, 2026 at 05:20:16PM +0800, Muchun Song wrote:
> 
> 
> > On Jul 16, 2026, at 19:53, Jiakai Xu <xujiakai2025@iscas.ac.cn> wrote:
> > 
> > RISC-V computes vmemmap_start_pfn by rounding phys_ram_base down to
> > VMEMMAP_ADDR_ALIGN. That alignment must therefore be expressed in the
> > physical-address domain.
> > 
> > Commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> > attempted to account for the maximal folio alignment by feeding
> > MAX_FOLIO_VMEMMAP_ALIGN directly into VMEMMAP_ADDR_ALIGN. However,
> > MAX_FOLIO_VMEMMAP_ALIGN is measured in bytes of struct page storage,
> > whereas VMEMMAP_ADDR_ALIGN is used to align a physical address.
> > 
> > The mask-based compound_info encoding requires pfn_to_page(0) to be
> > naturally aligned to MAX_FOLIO_VMEMMAP_ALIGN. Commit 9f94db4c7eaa
> > ("mm/sparse: check memmap alignment for compound_info_has_mask()")
> > added a check for that requirement and exposed the unit mismatch on
> > systems such as QEMU virt, where the DRAM base is not aligned to
> > MAX_FOLIO_NR_PAGES * PAGE_SIZE.
> > 
> > Convert MAX_FOLIO_VMEMMAP_ALIGN to the equivalent physical alignment
> > before using it in VMEMMAP_ADDR_ALIGN. This keeps the existing
> > round_down() logic while making the resulting vmemmap base satisfy the
> > mask-alignment requirement.
> > 
> > Fixes: 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Assisted-by: YuanSheng:DeepSeek-V4-Flash
> 
> I've always wondered why RISC-V uses a complex logic to calculate the
> mapping relationship between vmemmap and PFN. We could easily follow the
> x86 approach to make it much simpler.

I am not an expert in riscv mm, but the git history suggests it is
deliberate. See a11dd49dcb93 ("riscv: Sparse-Memory/vmemmap out-of-bounds
fix") and f754f27e98f8 ("riscv: mm: Fix the out of bound issue of vmemmap
address").

As far as I can tell, the constraint is the size of the vmemmap window:

      #define VMEMMAP_SHIFT \
              (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)

On sv39 that is a 4GiB window, enough struct pages for a 256GiB span of
physical memory. The vmemmap_start_pfn bias anchors the window at the
DRAM base, so any base works as long as the span fits. Base vmemmap at
pfn 0 and the window becomes absolute: physical memory above 256GiB is
not representable and struct page addresses run past VMEMMAP_END into
vmalloc space. Unlike x86-64, sv39 doesn't have the virtual address
space to size the window for the whole 56-bit physical space.

It boots fine on QEMU virt because DRAM sits at 2GiB there.

Whether any real sv39 platform places memory above 256GiB is a question
for the riscv folks. But if the answer is yes, the simplification is not
available on sv39.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
