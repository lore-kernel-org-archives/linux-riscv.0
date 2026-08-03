Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD28C55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H4O+YIV3vd1Bs03Ir6Mjp9DwB3ldNoPldtxdyGlSFw=; b=c+YsmTxWPMCMBF
	G/zLuGa1p44Kjh5lfV8qrM40iRyVA6BF2Qpayc4ZiwvnsdFJTOONZeG2i5Lt1+n0/YrGHH3vHhW9a
	hy4noIZp+3/QHxiM3Cwn4WqJL3iouSBeXjxnN+IIzWfjiu7JH3vR2hIMS1BkcIwbFWB1WXRPF35Lk
	xBn6lUyH/LQUYTJ5lRSGx7lHVTDhz9gmTI3e9zNzvqzntUHHShqtZSgAiWiy9WoXYVgo0wMxi12gm
	//GzeRh+8GgITumTtRimO39hqKAAqLFcpm7YPZp6ZPN3xTmEqas1nibRhevawuFaA/ODTkm0NMOdU
	OgvKPl/+c4fTdXCYS60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr28I-00000000hW0-3ja5;
	Mon, 03 Aug 2026 23:31:47 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr28F-00000000hTf-01FB
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 23:31:45 +0000
Received: from [192.168.0.109] (unknown [123.116.48.73])
	by APP-01 (Coremail) with SMTP id qwCowAC3ie3VJHFqZVFiAw--.39677S2;
	Tue, 04 Aug 2026 07:31:34 +0800 (CST)
Message-ID: <ecac8e71-c7d1-49bd-97f9-469ce38ba1ac@iscas.ac.cn>
Date: Tue, 4 Aug 2026 07:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: add ntl_hints.h for non-temporal locality hints
To: Omer El Idrissi <omer.e.idrissi@gmail.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260803225551.142098-1-omer.e.idrissi@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260803225551.142098-1-omer.e.idrissi@gmail.com>
X-CM-TRANSID: qwCowAC3ie3VJHFqZVFiAw--.39677S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWxKF18tw1xZry5AF13Jwb_yoW8Ww13pF
	WakrsYkrWkGF1fC34Ik34UWF1Fyw1DWayFk34kWr45Jr98tF10krs5trW5Xry5tF4kKr10
	vFs5ur4ru398X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jrdbbUUUUU=
X-Originating-IP: [123.116.48.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_163143_415534_451F7414 
X-CRM114-Status: GOOD (  14.18  )
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

On 8/4/26 06:55, Omer El Idrissi wrote:
> Provides asm volatile wrappers for all NTL hint variants
> (P1, PALL, S1, ALL) defined by the Zihintntl extension.

Doesn't seem to be used anywhere? That's a NAK from me.

> These hints request non-temporal caching behaviour for subsequent
> loads and stores.
>
> The new header falls under the existing riscv arch maintainers
> in MAINTAINERS, so no separate entry needed.
>
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  arch/riscv/include/asm/ntl_hints.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 arch/riscv/include/asm/ntl_hints.h
>
> diff --git a/arch/riscv/include/asm/ntl_hints.h b/arch/riscv/include/asm/ntl_hints.h
> new file mode 100644
> index 000000000000..0c51cb8b49c2
> --- /dev/null
> +++ b/arch/riscv/include/asm/ntl_hints.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_NTL_HINTS_H
> +#define _ASM_RISCV_NTL_HINTS_H
> +
> +#define ntl_all()	({ __asm__ __volatile__("add x0, x0, x5" ::: ); })
> +#define ntl_p1()	({ __asm__ __volatile__("add x0, x0, x2" ::: ); })
> +#define ntl_pall()	({ __asm__ __volatile__("add x0, x0, x3" ::: ); })
> +#define ntl_s1()	({ __asm__ __volatile__("add x0, x0, x4" ::: ); })

And there's no way these would correctly do anything anyway. The
non-temporal hints must come exactly before a load instruction, which
your asm blocks don't provide.

> +
> +#endif /* _ASM_RISCV_NTL_HINTS_H */

If you need this anywhere, roll this into the same patch series where
you use these hints. And you want to be sure to use them *correctly*.

Vivian "dramforever" Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
