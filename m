Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D24CC47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 11:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC196613E7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 11:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC196613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psOvwn+fYujddUAzfHjTn2+eevxA2hPvfT132RAjkII=; b=phoiyN5doKJ0tO
	GtLi5BhmJFAHtNDMgXYKdZ9x8NNxVMpWsZ5IoEyeguj7r/dTWl3/BGG54InRz4lHyBJSlsCWcrA2u
	nItPUvW8cTsCw+lefMqxu0WdCH4N1IPzvz7sl2wAfnV5TCJ8vCdu8ZU9TL5PK47/mzY2cy2BfnhIr
	bN+p5Qh/if6LU7lYPhAVqFlATdgqZNm6sSuBNDfq5VTQDO/qt8e6t1uNmDSsY2jOXScWK4o09RD++
	ha6bQ49Tjeyxh1/K68htG2VUh8y1HrpmZK9a7gpkSGvwodFek8CT3nxOa8sBlu04htZHIYhBpRKuj
	OE3NPcRfEnlV+WxB1SZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loldy-008NN6-Ro; Thu, 03 Jun 2021 11:36:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loldp-008NKa-27
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 11:36:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id i94so457940wri.4
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jun 2021 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUWQYY6cwXoInPRfC/THU59jRaVeDOI2+m6C3p5kdkg=;
 b=2POa4/DxL3JRww/m2F5CWyfeZDJIbslwiPuE4VWvkdtk0v8fJgU1idUSWF09zSdpqi
 mfwRoAXiRBkv20g32UdgxUkb4qcetzXTquQ8NNgFNiJ3rAkXvcH6/zZQwTXMNrEzeqZT
 U4Kwg5Za/uNzxxBdM3YExgc3L+pw9b6Pdff0cZN6hoNxJCAq+nq/UrHgBBooW0OJUl6d
 N1qIh3w0wFmBIRnlQNtR+W5kiSUb/Af1wZxa1gaAeTg/SLrqidOB8vkIrxg8u8iAC9E6
 ikNQoeiEaIBi+iVyUg1vJqXQnX6vPxVRJI6WaNABewvgqrctE0clhGEdUtbSbIyk4sPE
 aXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUWQYY6cwXoInPRfC/THU59jRaVeDOI2+m6C3p5kdkg=;
 b=PH+FQgzOcbm+cgfXxge+wIfknUZHAtMcwFlMqFlHWniXxNKrSgEL8QlmOkgyx0eRwd
 1rhXasFQ+oZaidyzWX999mtG4QtBsFwNMVdNZGVP7z92BBoTbWn2c295vyIjs8F3ICtw
 lt6qUdt6HBXOF/D2yIRVOTCS5SoldR4fsNzi/N67u12jlLbMxJwDiB84w7ekC2zO55FV
 +gpclC7kMSK/uo9p82Wleitn0eLSPNKMLSJgX7ON9lomo8g0FvCwVG+Cwgak7B2FhT8P
 xD6RohzrWqupITMjQqrPg0Zl0F4X2aSiAqZHPLqE2KfRKOP19ppmsBq4Y6IKtueaoC/q
 bU6w==
X-Gm-Message-State: AOAM532AiLDmY1nlqBLW3p5oTlOqCe4Meq48cxYMPknJygHoke8etqjE
 9URS6Sg7FcabQydgk9fDhOekuL5stPcaAeBIw5msPA==
X-Google-Smtp-Source: ABdhPJyIhL6hTINCWDRrrSltrfTkfJaKF204Cw9/Y/5S0gfYKtqafpFSdqhlMdgytjfSJIu53WXZwcV8KyjqDBS+V5E=
X-Received: by 2002:a5d:540b:: with SMTP id g11mr11167932wrv.390.1622720157797; 
 Thu, 03 Jun 2021 04:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210603082749.1256129-1-alex@ghiti.fr>
 <20210603082749.1256129-3-alex@ghiti.fr>
In-Reply-To: <20210603082749.1256129-3-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 3 Jun 2021 17:05:46 +0530
Message-ID: <CAAhSdy0w4DsGMdWZ3k2Qti0mwQQmFXHbJw2RXbjH+hQ8fPKxfQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: Introduce set_kernel_memory helper
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_043603_576674_CF8B146E 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, Jun 3, 2021 at 2:00 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This helper should be used for setting permissions to the kernel
> mapping as it takes pointers as arguments and then avoids explicit cast
> to unsigned long needed for the set_memory_* API.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/set_memory.h |  5 +++++
>  arch/riscv/mm/pageattr.c            | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 086f757e8ba3..7a411fed9e0e 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,6 +16,7 @@ int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
> +int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int));
>  void protect_kernel_text_data(void);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> @@ -24,6 +25,10 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> +static inline int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int))
> +{
> +       return 0;
> +}
>  #endif
>
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 5e49e4b4a4cc..c47ac6a432ac 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -156,6 +156,16 @@ int set_memory_nx(unsigned long addr, int numpages)
>         return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
>  }
>
> +int set_kernel_memory(char *startp, char *endp,
> +                     int (*set_memory)(unsigned long start, int num_pages))
> +{
> +       unsigned long start = (unsigned long)startp;
> +       unsigned long end = (unsigned long)endp;
> +       int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> +
> +       return set_memory(start, num_pages);
> +}
> +
>  int set_direct_map_invalid_noflush(struct page *page)
>  {
>         int ret;
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
