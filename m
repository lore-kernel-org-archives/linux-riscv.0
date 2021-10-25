Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2D4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCE660FBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECCE660FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fyfpjOJqpYekbCjgPaxkTdOnc58kSphqmGX2QGNlOA=; b=wC0qcS1Pnu+9qH
	9gFVKSn4dRchylrkljpE3332PpBbTJPtPdRX1kf78hNYA4m3SQyil+NmK/JbveaP43325/XNbQTpE
	n3pT8ReGQgtvZn/y2e3P7Iybbw0m81fBmT7JF+xVreI5810r136DqqEeSIMSYVt6Q0KV94DxQGslq
	+B1gq7NVhkmDjPED+Hw04ixIjZfG0/araZnbViYZ6DylF8WNpzqD9DbUcBMlou6CrYzviOwMQ/u5D
	smjN0Rv99+c57VWWlKJL2bife/p6uMLF4pgmx5XFxU960Dy0jDjAeiU52deCsMzfcLm/vwrcZO5rj
	xT/Qwwi9xGQXqIQbblpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mettp-00FSTf-T1; Mon, 25 Oct 2021 06:56:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mettn-00FSTF-3k; Mon, 25 Oct 2021 06:55:59 +0000
Date: Sun, 24 Oct 2021 23:55:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: wefu@redhat.com
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu,
 philipp.tomsich@vrull.eu, hch@lst.de, liush@allwinnertech.com,
 lazyparser@gmail.com, drew@beagleboard.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, dlustig@nvidia.com, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com
Subject: Re: [RESEND PATCH V3 2/2] riscv: add RISC-V Svpbmt extension supports
Message-ID: <YXZU/3/YmRGFrOXK@infradead.org>
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025040607.92786-3-wefu@redhat.com>
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

On Mon, Oct 25, 2021 at 12:06:07PM +0800, wefu@redhat.com wrote:
>  static inline pmd_t *pud_pgtable(pud_t pud)
>  {
> -	return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
> +	return (pmd_t *)pfn_to_virt((pud_val(pud) & _PAGE_CHG_MASK)
> +						>> _PAGE_PFN_SHIFT);
>  }
>  
>  static inline struct page *pud_page(pud_t pud)
>  {
> -	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
> +	return pfn_to_page((pud_val(pud) & _PAGE_CHG_MASK)
> +						>> _PAGE_PFN_SHIFT);

>  static inline unsigned long _pmd_pfn(pmd_t pmd)
>  {
> -	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> +	return (pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT;
>  }

The "(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT" expression begs
for readable and well-documented helper.

> +#define _SVPBMT_PMA		((unsigned long)0x0 << 61)
> +#define _SVPBMT_NC		((unsigned long)0x1 << 61)
> +#define _SVPBMT_IO		((unsigned long)0x2 << 61)

0UL << 61
1UL << 61
...

> +#define _SVPBMT_MASK		(_SVPBMT_PMA | _SVPBMT_NC | _SVPBMT_IO)
> +
> +extern struct __riscv_svpbmt_struct {
> +	unsigned long mask;
> +	unsigned long mt_pma;
> +	unsigned long mt_nc;
> +	unsigned long mt_io;
> +} __riscv_svpbmt;
> +
> +#define _PAGE_MT_MASK		__riscv_svpbmt.mask
> +#define _PAGE_MT_PMA		__riscv_svpbmt.mt_pma
> +#define _PAGE_MT_NC		__riscv_svpbmt.mt_nc
> +#define _PAGE_MT_IO		__riscv_svpbmt.mt_io

Using a struct over individual variables seems a little odd here.

Also why not use the standard names for these _PAGE bits used by
most other architectures?

> -	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
> +	return (unsigned long)pfn_to_virt((pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT);

Overly long line, could use a helper.  Btw, what is the point in having
this _PAGE_PFN_SHIFT macro to start with?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
