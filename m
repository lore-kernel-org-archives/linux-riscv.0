Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BBBC02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2bpBMPNXrfZMFooOTfqhAGYV1QkD6dhUgsbpXqlm7k=; b=Bb67nlSnW8QQ0W
	hQik8xTVpG60CEiCPdkGNAfkPv25lDac3tbLFc4+cnfeuq4HzxgxfDBxiyGVj35binfspnAIAOFeK
	IX4K0UNE4EfK6ahbCBsbNDB41iwMjJTvNkC3LncsVRcdBNKvXoBoSMBXrX+2MLCGR5OWk6/rszp5D
	+s4pjfH2TYto3S8GUp1WOqeq3gUThi96Yh+V3hX3dht9u0n8zYi/8KFUNJwuI8T6m7YTI/JNfw7II
	rsvwLeCFr44Y/HWBSvJzfAQ/uAFtznoclO2ZbKCyVwPn0KGLhApJXEj7ktPRZ5ZSZsaCZORrTbGo8
	cybuubZxx53obq8FLI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNZD-00000005ugd-34mN;
	Mon, 13 Jan 2025 16:45:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNJv-00000005rK3-0tK5;
	Mon, 13 Jan 2025 16:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D37DA5C56E5;
	Mon, 13 Jan 2025 16:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749DDC4CED6;
	Mon, 13 Jan 2025 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736785782;
	bh=G/WL7za6/FhMEJQUPPYaVa5AR3im6p6zdx508VpTd8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPMzoMzonmm2uaOFLfrdzxlqYEZB9gyC4UNDIA7tmVyD1CdeiDw/0q7HTvvJaEdU9
	 O8zfvzFkV7uaD3Eeih9wt9NYEMgB9jFV0IHWkVr1H3T/eBEPpuOfFcMO/Ou4iLVDWQ
	 Hml2UsTpltlAGqg8dCV2vjov8Jfdy8hAWDfRY3MLkqHK6jF+OtTwqCUS2Mr7UtQJAG
	 LdHkSaSmCjlHGRuBlI0oL1FiCdYRvc0JfAH5RdDfH6z1lRwE3aqHCLNuC9IujuiGvW
	 +MOXpYRLwV7Hg46tyDx5cj6hTBCHBY3taAzyPWeFgdxktJaT7Of+Zg4hhGTcDn07vF
	 bC7Um3/mpT7aQ==
Date: Mon, 13 Jan 2025 16:29:32 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 09/17] arm64: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Message-ID: <20250113162931.GB14101@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_082943_289473_43DFBB9E 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Jan 08, 2025 at 02:57:25PM +0800, Qi Zheng wrote:
> Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
> table pages can be freed together (regardless of whether RCU is used).
> This prevents the use-after-free problem where the ptlock is freed
> immediately but the page table pages is freed later via RCU.
> 
> Page tables shouldn't have swap cache, so use pagetable_free() instead of
> free_page_and_swap_cache() to free page table pages.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/include/asm/tlb.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
