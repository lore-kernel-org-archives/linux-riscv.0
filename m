Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4933DEEE27A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 02:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Taws9Y//xpk0jOiP/T/Y6IjNdS4kNqelL7zld/4Avgg=; b=0sGUNL6tSmcFab
	HYoG/rkHPr0yiw6YyHLRW6x0fx/bF0gQZZ8gPKnkw/M3+Tn8JI2w8kHuPR76AXAVjlsojfO+Sy9Nz
	FUjemYiXwypXZNjCOZ9eNyw9vKRk0eYZnUA8Rf0wxlVcMs3VgWN4bnCqc2MorLlYBOzVgzKE5t7ip
	IogOqzEgW0kGfp4jfWXIbgoGEMtxqPDyXOwbL87Wcpl1pcRGIy6uNOiXKYH4UD+eXH9ceI1wQ2cIm
	J8DcpyztojBpMqS2Ce1O65B1A8J53+K6Zm66oinjXxj/Fo/Ia1Q8Gww42OQiofhCgavtXAmZ81r4N
	mws4YJr3OLG+QRH03V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovjI-0000000EiKb-00jc;
	Fri, 13 Sep 2024 02:08:12 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovjC-0000000EiJQ-3YNK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 02:08:09 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3e033e37bc9so136843b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 19:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726193285; x=1726798085; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s7cimPnDbBKYHrFkLn6Bf+Cga62onzQ+Q3eQb/Boxbw=;
        b=Z5lrp/lwLU/kFIMUcedgDlmAtLKtZyrfaarjmss2XcXJeA1/f/gIzY1rAbOhVSELuV
         igN04IV2oN4GuYiqT+aslyzNEx0DnOZloP8jVp9X5OtzrxxyuCR6OX4TbhKl+vQ9Fd46
         zbOr2PhXTF5lYszoLt6kq4RWi6JnpCqoqjSFT16yiFhoVDxtXRTYkeIDXCksfRThxQO2
         R64+OyVWux8dcD3KqAw5lGPj4bklIRO/53QBGK95JkZ3Nn4bbo6EByKXNyek5JBH5vXs
         TRY57mfmRbj+79gEX+KVXIhoCRU26htuo0PbBL23/pXJKvt+DOENynZP5Sm75q9kMAuX
         W2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726193285; x=1726798085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7cimPnDbBKYHrFkLn6Bf+Cga62onzQ+Q3eQb/Boxbw=;
        b=UeH407OqPIvk97BfSLhYSpuj0D+OBO7k82YJIYZU0lMg4llY9Kji+gIJmVq1VvRZOP
         sDZAwFI6KIcZZxiUhKB4jzsNFQn5rv1BoGYz+nZtPPJuRbHHR0MSVfjO4QMLtj+OYEUA
         n2zB1d9qnZGZvAV6THCcaqSgOrQ9fqltBnqNo47e0KJzk49ya0O0KZg5hAOkwPhGZlKY
         xby/Dyg8RDesOWEu4ij+fnC6Z7VsQUC0cywKRJ3lCRth3aSEFDb0W6cwVorJ/m0scmeS
         vc1ZUcVCJgdcxuKLQVbEE4bUEw46Y36HeRNMBY2u5ESbkbHesNP93+Em+iiNtcTyx20n
         cY9g==
X-Forwarded-Encrypted: i=1; AJvYcCWZM3rDGHXM3YGLuafGHw1rgpJQOuv829J5OdakIEirtZo2Qb/YvJF0AXMZfkjL00yx00/1iW45xyKWsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzydJEbMxLHxpD2ZBCGWJWuclxrCZP8pKKVIOPnHygR/tXYxNcI
	Rpj+JW1dyAnsRiV5a6EFUfS/LL4TxwKt8MGKyiR2HocKHm1KmXetJHyNOhTjA1prISlWMKLZ/Is
	XI6DvY0uhhOOtn8/LJjyqQGx92p8=
X-Google-Smtp-Source: AGHT+IHggupOHNWQQGi87kpgjxoBFmwiJyJeCdJM1Ufdym7+4NlW81mIMtLq1f/ocpWT1XwYREsvFBgQ5gHmWI0LRtQ=
X-Received: by 2002:a05:6808:14cf:b0:3dd:cc7:957c with SMTP id
 5614622812f47-3e07a0eee2bmr659522b6e.8.1726193284860; Thu, 12 Sep 2024
 19:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240912100018.736447-1-zhangchunyan@iscas.ac.cn> <ZuNTWCsPPLTm1zdX@ghost>
In-Reply-To: <ZuNTWCsPPLTm1zdX@ghost>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 13 Sep 2024 10:07:28 +0800
Message-ID: <CAAfSe-sfv2n85-XtYBqegCH+n=XR1KN+v6oJu+5d0_y_z9toTQ@mail.gmail.com>
Subject: Re: [PATCH] selftest/mm: Do not use hint for riscv mmap
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_190806_946910_D39CAF67 
X-CRM114-Status: GOOD (  29.31  )
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

On Fri, 13 Sept 2024 at 04:47, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Thu, Sep 12, 2024 at 06:00:18PM +0800, Chunyan Zhang wrote:
> > When the virtual address range selftest is run on RISC-V platforms,
> > it is observed that using the hint address when calling mmap cannot
> > get the address in the range of that validate_addr() checks, also
> > that will cause '/proc/self/maps' have gaps larger than MAP_CHUNK_SIZE.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >  tools/testing/selftests/mm/virtual_address_range.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/virtual_address_range.c b/tools/testing/selftests/mm/virtual_address_range.c
> > index 4e4c1e311247..25f3eb304999 100644
> > --- a/tools/testing/selftests/mm/virtual_address_range.c
> > +++ b/tools/testing/selftests/mm/virtual_address_range.c
> > @@ -64,6 +64,14 @@
> >  #define NR_CHUNKS_HIGH  NR_CHUNKS_384TB
> >  #endif
> >
> > +#if defined(__riscv) && (__riscv_xlen == 64)
> > +static char *hind_addr(void)
>
> This is not a typo by you since this is the name of the original
> function but this should be "hint_addr" right?

Right, didn't notice this typo, let me fix it.

>
> > +{
> > +     return NULL;
> > +}
> > +
> > +static void validate_addr(char *ptr, int high_addr) { }
> > +#else
>
> This is something that I am trying to solve over at
> https://lore.kernel.org/lkml/20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com/
> (the solution is still in flux). Since riscv doesn't currently have this
> behavior of restricting the virtual address space, I think it is more
> reasonable to disable this test entirely. After we have a longer-term
> solution with the patch I have up we can adjust the test and re-enable
> it. What do you think?

That also makes sense, I will send another patch to do that.

Thanks,
Chunyan

>
> - Charlie
>
> >  static char *hind_addr(void)
> >  {
> >       int bits = HIGH_ADDR_SHIFT + rand() % (63 - HIGH_ADDR_SHIFT);
> > @@ -81,6 +89,7 @@ static void validate_addr(char *ptr, int high_addr)
> >       if (addr > HIGH_ADDR_MARK)
> >               ksft_exit_fail_msg("Bad address %lx\n", addr);
> >  }
> > +#endif
> >
> >  static int validate_lower_address_hint(void)
> >  {
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
