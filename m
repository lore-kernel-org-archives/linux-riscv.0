Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352C8C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:35:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70976197C
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70976197C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zKXjquP2vpGd6t0GpkQ9UPwFDffNQsAAJNYCrzSYhw=; b=BhBaGvznVPftnR
	sCDW5D+NvUeU5aEGZeM5u8C4lDysQKlKZBGj58IEjV70BkQpHESSNsbCbZE33o+Cr7HvCbfUzu/ez
	H2k3bK0g2iYz87ixnFKOrqqgi8njNQKNbOgjKXDzXqyIakyqIvBkQ1mKYz+z05qsAc7tXO21LVW9Y
	P2JG9qbkgy5EFRENuwbLLlJfC3Cm49YiNjcvsRvnjBVRfx2/3B9KN4M11BTxt9NEIigGVVHyKveDw
	y78f8AWCFh8n1DcuQcoRKvGg9DfIApy1zvYvuophwUDVDTzrETnWEMTtRW01qqFCC0LXTg/7w7sCM
	OoORhlnA0L51CCaPHNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwlzJ-001hMx-DM; Fri, 25 Jun 2021 13:35:17 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwlzF-001hKc-TF
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 13:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=fNsdP1h8nt16cy9XNDlUuz7NRuDExXgQbd
 +Sq1hHnEI=; b=GLvTYLIzNRT77vXZvtdLVEd6b2L0EypGi9LCUXX/fgmSf4gQuc
 zUhoTS7DVNBArsFJjeQKIoqC/Mg/D9lCyqpkTwc93G+jIQ85+dLNUBlX3kZIb/Um
 sjaWqx9e99ZvISScOD7P2WC7fVKgU6egxLqfQQ8l4GS5fEpBXVtBWoUWg=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygA3PMB529VgZw00AQ--.11612S2; 
 Fri, 25 Jun 2021 21:34:49 +0800 (CST)
Date: Fri, 25 Jun 2021 21:29:02 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>, Zong Li
 <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] riscv: Introduce set_kernel_memory helper
Message-ID: <20210625212903.4a2ff309@xhacker>
In-Reply-To: <20210624120041.2786419-2-alex@ghiti.fr>
References: <20210624120041.2786419-1-alex@ghiti.fr>
 <20210624120041.2786419-2-alex@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygA3PMB529VgZw00AQ--.11612S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyDZF1fAw4DAw1fGFyUWrg_yoW8uw47pF
 48Jw4DCFWagF9rGFWI9r98ua4fJwn5G342yryak3s5uF47Xr4UZw15tw1DJr1kCFyv9F42
 kay7C34Duws8t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fwIDUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_063514_629810_08F6C61B 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, 24 Jun 2021 14:00:40 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:

> This helper should be used for setting permissions to the kernel
> mapping as it takes pointers as arguments and then avoids explicit cast
> to unsigned long needed for the set_memory_* API.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/include/asm/set_memory.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 9d4d455726d4..96e317dcab13 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -17,6 +17,16 @@ int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
>  void protect_kernel_text_data(void);
> +static __always_inline int set_kernel_memory(char *startp, char *endp,
> +					     int (*set_memory)(unsigned long start,
> +							       int num_pages))
> +{
> +	unsigned long start = (unsigned long)startp;
> +	unsigned long end = (unsigned long)endp;
> +	int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> +
> +	return set_memory(start, num_pages);
> +}
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> @@ -24,6 +34,12 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> +static inline int set_kernel_memory(char *startp, char *endp,
> +				    int (*set_memory)(unsigned long start,
> +						      int num_pages))
> +{
> +	return 0;
> +}
>  #endif
>  
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
