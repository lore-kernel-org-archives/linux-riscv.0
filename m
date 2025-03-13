Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD29DC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJWF/uFu9KuGRqzZADIm5sYVEZnzt1T1bkYONdBDNh4=; b=0o/ue8kMMYP25M
	UFoOHOZdY2juqh4IWRq9gh5CZw6xECWeD9ogrY1+M3FfQ1CY8YrVqTuqvpHt5tH7EPG4I13GgsG2z
	RsiPzgOXaToLC6xX1gZUZStSS8yNEZPn9gDA9z0F+X2iR+ESXnIsod9MXqYjf39APWX26q5RSfSYe
	ncfajmM2Tmv4nQ0//7Q3gMPMd7iiyiHqRrG3wXGenLL2if9odYG1yCYZ5tCuNZUMDMiZSaWqG9waN
	+QaR0qufL3RV9+vb2hinP5llsSZeXHXXgLy2gTil8vDCR79AKI7MyoqGeaIPnaw2KsOFrU/z+eL4W
	bQ/1i6ecin9OIhbLB8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsriy-0000000CgOH-4BvJ;
	Thu, 13 Mar 2025 23:12:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhI-0000000CgBB-433s;
	Thu, 13 Mar 2025 23:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5095C0F92;
	Thu, 13 Mar 2025 23:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839ACC4CEDD;
	Thu, 13 Mar 2025 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741907439;
	bh=85C5EaLBPcNm+VfXMxlgckNkHScFkxqfwrT4hbCXaS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r1LbO++h2zt9ITOCp8zaBNp5bCW3oO8IYrW9fm3oZilRLz2OfzDBHOVialXmivLvD
	 bsPejXMhoq8EeEH1UfZGgQO5BcyfMZ6opeDWAKOUunCcWeso9WZv2uAjmotrBYRJrB
	 wRsd1Lld8tuszHDkPkn9GPUZwcBYsR4A0hlP64N8=
Date: Thu, 13 Mar 2025 16:10:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me
Subject: Re: [PATCH v13 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
Message-Id: <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
In-Reply-To: <20250211161404.850215-5-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
	<20250211161404.850215-5-ajd@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161041_107367_37BBA68E 
X-CRM114-Status: UNSURE (   9.25  )
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

On Wed, 12 Feb 2025 03:13:57 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_clear").
> 
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.

My x86-64 allmodconfig exploded.

./arch/x86/include/asm/pgtable.h: In function 'pudp_establish':
./arch/x86/include/asm/pgtable.h:1443:46: error: passing argument 2 of 'page_table_check_pud_set' makes integer from pointer without a cast [-Werror=int-conversion]
 1443 |         page_table_check_pud_set(vma->vm_mm, pudp, pud);
      |                                              ^~~~
      |                                              |
      |                                              pud_t *



#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
static inline pud_t pudp_establish(struct vm_area_struct *vma,
                unsigned long address, pud_t *pudp, pud_t pud)
{
	page_table_check_pud_set(vma->vm_mm, pudp, pud);
	...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
