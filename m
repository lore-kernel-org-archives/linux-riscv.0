Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246B3C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yEKoQfgcPnLIIapfTR6obwekjWNOUfLhyk8dEcFFcQ=; b=Qy18jc7x26yY+c
	M8zSraho7xxBgfg5EZUimIuMtqZOKiXox+GAAprcxUBhrmHNjsFF8gdJn/bLX0Zl9WX6Qx0AFYkTG
	UwTWvA1MZIkUachbAdWHEErKU5JPbf27sm5deTnB2zX7zSeB0TDDYrqGEcKL+M5Igzjng9fcy21xW
	g9WtLfdF4Df/m5XN4dr2FCSmywSg0jkRWtf5v7jN2Bl18kOeflU0LfbRaJAtto7sSQ+BvVzW1lFc2
	ZYSxyQzSQ1fe3AMuv6/jCVrakrb1nTJOH9r4JyI9ppj/yVtR8vhdzyZk9EHlrXgFQK/qzoTDA8bun
	ZbPA9Ftol3Li2vhaJdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9RE-00000001bm4-11yu;
	Tue, 09 Apr 2024 11:14:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9RA-00000001bk5-16iO;
	Tue, 09 Apr 2024 11:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4F12CE1DAF;
	Tue,  9 Apr 2024 11:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FC7C433F1;
	Tue,  9 Apr 2024 11:14:41 +0000 (UTC)
Date: Tue, 9 Apr 2024 12:14:38 +0100
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
Subject: Re: [PATCH v2 1/7] arm64: mm: cleanup __do_page_fault()
Message-ID: <ZhUjHkyIjalU0MAA@arm.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403083805.1818160-2-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_041448_570072_CE9074F9 
X-CRM114-Status: UNSURE (   8.15  )
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

On Wed, Apr 03, 2024 at 04:37:59PM +0800, Kefeng Wang wrote:
> The __do_page_fault() only calls handle_mm_fault() after vm_flags
> checked, and it is only called by do_page_fault(), let's squash
> it into do_page_fault() to cleanup code.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

As I reviewed v1 and the changes are minimal:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
