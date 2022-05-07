Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86B6C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  7 May 2022 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYiayxZSLliA7Ch6J60Ki8Ne1fMK5FmBLD9DuLbqCsU=; b=FCazg65kQrZfpK
	/t90mWfm1wcb0WlIcR5yjO/4jDogMVv2yPAGAhT8dRgC4jxR5vnSXjzwr8ytPNUWkJUUVHJXxiXUn
	/TKqnGzoXlOOhq+I6xBbxWoY6bQmXpdDO5fT/s2ncQYMmFZb70iGHumpjmcvGiOcGQCfSZoaTfvee
	dzEWzZGkYkxg4NmDxqlveFtMDujPevq4FlsHJTYt+hK36BSP9q6kj18fn9FhmQNiRhBThSzECSOKf
	a4vpeXQElG7nA5J48IbCcd0CnvzvV22dpe62/YvL1vq6gXWsw/drBYHAJWzDYCbP0a1ce5FP1DxrJ
	LxV9IGziipNJicI7YoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnOzy-007uht-09; Sat, 07 May 2022 18:17:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnOzm-007udP-Dh; Sat, 07 May 2022 18:17:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF8EE6137B;
 Sat,  7 May 2022 18:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45C9C385A6;
 Sat,  7 May 2022 18:17:28 +0000 (UTC)
Date: Sat, 7 May 2022 19:17:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v7 5/6] arm64/mm: Enable
 ARCH_SUPPORTS_PAGE_TABLE_CHECK
Message-ID: <Yna3tc9nnfG9r2aY@arm.com>
References: <20220507110114.4128854-1-tongtiangen@huawei.com>
 <20220507110114.4128854-6-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220507110114.4128854-6-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_111734_535547_629B8590 
X-CRM114-Status: GOOD (  10.45  )
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

On Sat, May 07, 2022 at 11:01:13AM +0000, Tong Tiangen wrote:
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> As commit d283d422c6c4 ("x86: mm: add x86_64 support for page table check")
> , enable ARCH_SUPPORTS_PAGE_TABLE_CHECK on arm64.
> 
> Add additional page table check stubs for page table helpers, these stubs
> can be used to check the existing page table entries.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
