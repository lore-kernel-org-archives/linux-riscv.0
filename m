Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5307C25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 May 2024 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SDjWiwCvfYn8JZx2urJA13r6mqH4l3jziH2OJT6WUc=; b=P9caQnlFyPM1zm
	Mkt1bSoudp4JdLJONwTX8x9wsodeQ4I9tzhNQXBFT+Jt2BoQtO6FBtOwJvVpBwRjoEaXvZGbtPGyM
	us3UjO8qHlvoB78Vl95UXK37iQl0dkJ5HS4htomhp2V4v5iNRzJAXjnfiW+WKiT08K19x38bdh7s+
	uxMHXzRwtailRtRBdEDSkyHwXDAEfYeqjonNfZO/+wE2SQgZoGdpGEHGliqqKolsylT/HMj4G1s72
	WmWohINZiz3asGkdAtFL+/hSLHCfi/4b5zVBcri9CXs7Ij7yEt5ocn59YHQra4kiSW4XERn09GBLf
	wV86QAuhuvXD6WJdajtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C7o-0000000AKsW-367a;
	Sun, 12 May 2024 16:32:36 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C7m-0000000AKrT-17NT
	for linux-riscv@lists.infradead.org;
	Sun, 12 May 2024 16:32:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C83DD40004;
	Sun, 12 May 2024 16:31:25 +0000 (UTC)
Message-ID: <276fa17b-cd62-433d-b0ec-fa98c65a46ca@ghiti.fr>
Date: Sun, 12 May 2024 18:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/29] riscv mmu: write protect and shadow stack
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
 rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
 kito.cheng@sifive.com, keescook@chromium.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, alexghiti@rivosinc.com, samuel.holland@sifive.com,
 conor@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
 shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
 jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com,
 evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com,
 willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org,
 samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org,
 heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com,
 cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-14-debug@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240403234054.2020347-14-debug@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_093234_604221_E505D726 
X-CRM114-Status: GOOD (  20.56  )
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

On 04/04/2024 01:35, Deepak Gupta wrote:
> `fork` implements copy on write (COW) by making pages readonly in child
> and parent both.
>
> ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
> Assumption is that page is readable and on fault copy on write happens.
>
> To implement COW on such pages,


I guess you mean "shadow stack pages" here.


>   clearing up W bit makes them XWR = 000.
> This will result in wrong PTE setting which says no perms but V=1 and PFN
> field pointing to final page. Instead desired behavior is to turn it into
> a readable page, take an access (load/store) fault on sspush/sspop
> (shadow stack) and then perform COW on such pages.
> This way regular reads
> would still be allowed and not lead to COW maintaining current behavior
> of COW on non-shadow stack but writeable memory.
>
> On the other hand it doesn't interfere with existing COW for read-write
> memory. Assumption is always that _PAGE_READ must have been set and thus
> setting _PAGE_READ is harmless.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9b837239d3e8..7a1c2a98d272 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -398,7 +398,7 @@ static inline int pte_special(pte_t pte)
>   
>   static inline pte_t pte_wrprotect(pte_t pte)
>   {
> -	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
> +	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
>   }
>   
>   /* static inline pte_t pte_mkread(pte_t pte) */
> @@ -581,7 +581,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>   static inline void ptep_set_wrprotect(struct mm_struct *mm,
>   				      unsigned long address, pte_t *ptep)
>   {
> -	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
> +	volatile pte_t read_pte = *ptep;
> +	/*
> +	 * ptep_set_wrprotect can be called for shadow stack ranges too.
> +	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
> +	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
> +	 * but we dont want this wrong configuration to be set in page tables.
> +	 */
> +	atomic_long_set((atomic_long_t *)ptep,
> +			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
>   }
>   
>   #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH


Doesn't making the shadow stack page readable allow "normal" loads to 
access the page? If it does, isn't that an issue (security-wise)?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
