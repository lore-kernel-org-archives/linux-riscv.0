Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E54CD1299
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHzONUHmJ5MubTKo7D7UVyqRbENoYaB4kmjCPyNT8bE=; b=ugPfPVgZT7i3Tk
	eAdrBenx6kWjQ+AOiVXusoXWMAl7bF876PxfzOKOj2jXOzHBSz/z9u7n3Xm3sYWzLfz1qze+NGIh9
	1f3wjN05ltgYl5IgTYwBBH1IdRL8ZtQvZrs4eG5pI2fWYGbgg0cYsh8G1IHMs0DZ4LAXV4c0SzkW6
	ZAyhy4WXG6omAxj9UFIU9cpSfbf5q/3HiGs7sQJSxVCeTdTCU4kq+lkeun3TqPyZbt4AwaTdGRbEP
	KXIKL8HWY1IAdPGjjwYYWs/vayVLb2PHjXyZB2nkj1V5YSEu9rxGLdDmG+TvrjMQbnRkIDZzO1138
	atSneLDyeGPNCOo10d3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9Rh-00000001bvV-3nQ0;
	Tue, 09 Apr 2024 11:15:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9Re-00000001bu3-0wPc;
	Tue, 09 Apr 2024 11:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D5BCCE1E45;
	Tue,  9 Apr 2024 11:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57168C433F1;
	Tue,  9 Apr 2024 11:15:11 +0000 (UTC)
Date: Tue, 9 Apr 2024 12:15:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	surenb@google.com, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/7] arm64: mm: accelerate pagefault when
 VM_FAULT_BADACCESS
Message-ID: <ZhUjPZj5dij8JM9g@arm.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-3-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403083805.1818160-3-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_041518_491054_ED36DEA9 
X-CRM114-Status: UNSURE (   9.29  )
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

On Wed, Apr 03, 2024 at 04:38:00PM +0800, Kefeng Wang wrote:
> The vm_flags of vma already checked under per-VMA lock, if it is a
> bad access, directly set fault to VM_FAULT_BADACCESS and handle error,
> no need to retry with mmap_lock again, the latency time reduces 34% in
> 'lat_sig -P 1 prot lat_sig' from lmbench testcase.
> 
> Since the page faut is handled under per-VMA lock, count it as a vma lock
> event with VMA_LOCK_SUCCESS.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
