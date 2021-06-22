Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4975C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3B661001
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3B661001
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD2g+jgO3c04oUwlrF+yw5iv4IDHOCm03Cn54Jthe1U=; b=nQbZuvwOxVhm7x
	K1a0pIWUCvy4cg9662bz1UyTJEVSNfudF4wmuHw5G6BrZN9cH1tb8CeTOFXIQvAPNgM2kioxYL3H/
	Gwx/VwbaUspD3MWLwjbaeV2TuDl48lIhsmot0sMV/zxuyu4oVwL9TWOgV6/92ZG7T3xqo5HHebBqQ
	eNENBmNbdE5e8Jq/iGKz0K92lwwUvZ4jwxqCU2ok/M0DqTX6xknbwTzIoc5nCXmUBTYIsDezbPDDj
	G2o4aD8Epxf4ZXlQh47A76RWJgg4voGtWPJvslr/Rtb/UBlwOaRiXH4JJRJFCzfJcDUBmc9VOh3tE
	64U4FwFKrzuYkOdOV4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvhsH-007Zen-FB; Tue, 22 Jun 2021 14:59:37 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvhsC-007ZZK-UZ
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 14:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=aR8G01IJ+UceVFDgRJW6BYPthEX2HmXBea
 Q0eDZtDvc=; b=rN9/qI/+KZUTwcPnMglDwR/DmH325OzAcRRpUGkBv94ONCmds6
 6g2xr9YsPWvYuurbncwEpXiKTKACK+TnKPMBNCA0Ok2hGSDkI6FR0a9222czloFq
 l3LGBjEqQPdQ9N2gdyCsZ5AKE+woSn8YaXAJ6arwFC3vIiszvc3M+frqY=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCHjoql+tFgLsMbAQ--.20215S2; 
 Tue, 22 Jun 2021 22:58:45 +0800 (CST)
Date: Tue, 22 Jun 2021 22:53:04 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>, Zong Li
 <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] riscv: Introduce set_kernel_memory helper
Message-ID: <20210622225304.53d94c0b@xhacker>
In-Reply-To: <20210622082134.2404162-2-alex@ghiti.fr>
References: <20210622082134.2404162-1-alex@ghiti.fr>
 <20210622082134.2404162-2-alex@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCHjoql+tFgLsMbAQ--.20215S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw17uFy3ZrWDXry3Zw4DXFb_yoW5XFy5pF
 48Jw4DCrWagF9rGFWI9ryq9w1xJwn5Gw1jyrW3A34DuF47XrWUCw15tw1DJr1kGFyqgF4q
 kay5C34Duanxt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
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
 0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8489tUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_075933_692187_3F5087E1 
X-CRM114-Status: GOOD (  16.42  )
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

Hi Alex,

On Tue, 22 Jun 2021 10:21:33 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:

> This helper should be used for setting permissions to the kernel
> mapping as it takes pointers as arguments and then avoids explicit cast
> to unsigned long needed for the set_memory_* API.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/include/asm/set_memory.h |  8 ++++++++
>  arch/riscv/mm/pageattr.c            | 11 +++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 9d4d455726d4..4f9fc54d1806 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,6 +16,8 @@ int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
> +int set_kernel_memory(char *start, char *end,
> +		      int (*set_memory)(unsigned long start, int num_pages));
>  void protect_kernel_text_data(void);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> @@ -24,6 +26,12 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> +static inline int set_kernel_memory(char *start, char *end,
> +				    int (*set_memory)(unsigned long start,
> +						      int num_pages))
> +{
> +	return 0;
> +}
>  #endif
>  
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 5e49e4b4a4cc..11d0b0f4c65d 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -156,6 +156,17 @@ int set_memory_nx(unsigned long addr, int numpages)
>  	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
>  }
>  
> +__always_inline int set_kernel_memory(char *startp, char *endp,

If __always_inline, can it be moved to set_memory.h?

Thanks

> +				      int (*set_memory)(unsigned long start,
> +							int num_pages))
> +{
> +	unsigned long start = (unsigned long)startp;
> +	unsigned long end = (unsigned long)endp;
> +	int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> +
> +	return set_memory(start, num_pages);
> +}
> +
>  int set_direct_map_invalid_noflush(struct page *page)
>  {
>  	int ret;



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
