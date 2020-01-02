Return-Path: <SRS0=K0nT=2X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F0FC2D0DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 03:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A54215A4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 03:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/eoa2EM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PeAnZdpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A54215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IAZWbwwfUkVb6p5+Q1nHSm8L0LTm2aiAcQDF8GpNwZk=; b=A/eoa2EMredgp79o9JjoFAvhb
	5VBc90gR4GuM0d2wMKe+WuM31ESpLuaO81gXmetEnoL7nOcEBqlA1oQNIIHTiRhaJaVO0Hr6ZYTLZ
	x77j2X93e5v+zs3EdPH5V9t/zgEMZaCcOdkaPxbHGXmSmEI7lUbMkRCLnYUJgItXUk2S9JwewtK+K
	KhDAuxBqJP5/s2ehfLihX+CIUKWx8AsfgQskL8VqSzJzK166XT5x+wvlq471jOgpxBym3oT8SkiiL
	GFqh4bsL/tDnUYE4o/XsnE8/Lq2d/g6x0GOB71pRy4vmsH/r6qnXAbnog7ei/si7+4evLSsjhyW5k
	/8WkMYcZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imrUi-0007H0-9i; Thu, 02 Jan 2020 03:49:56 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imrUg-0007Gg-AB
 for linux-riscv@lists.infradead.org; Thu, 02 Jan 2020 03:49:55 +0000
Received: by mail-ot1-x343.google.com with SMTP id 59so55343056otp.12
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jan 2020 19:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IAZWbwwfUkVb6p5+Q1nHSm8L0LTm2aiAcQDF8GpNwZk=;
 b=PeAnZdpzin0SiweJmAKbZ7tGf+WHxWKMuQUAn0R1Q4X5MBtUILBw0be0mCzLxx7dLg
 Y1ocadO2QeXjNPfozXkEfcDoeWxKGE4bD2+a+MAHtUj3+UfbuYGFBVxz95GJMM6Aqcfe
 lf7Q+McdAhwi/DAEGGwKKBN12Gz1cs8sUiOjgTC5hD17zw1d6+r+FXjnQM8JshU2FF8h
 F4PfDMeaLqw9jymonBBuPSy+N41OQfdChjwuO68xSeGXfu8hm2nb8S/bbzxWmIJhKDA8
 m6HB4c3v4Z5NDxR5mnWiZt4shOJj2rmdulKEdZGXd17ggTOe6RjkoPCxj+3HreSv3rsL
 uZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAZWbwwfUkVb6p5+Q1nHSm8L0LTm2aiAcQDF8GpNwZk=;
 b=HBpMa2YfvIfyp4xLMHjmCm9rH6PEHIDDDO8SLhwQ/FGVTZW8k5ctV85Ztt/pGF8AeO
 ifbSip4OOkwNI8A0Vcv3904cypkAjEQ+zj5qca7d1lw81Vx6iijPmEE5aHnNVYxu+K9p
 S9CpPHH20mgMg9YvSVchGMuoXdX41X0Ax8cZUH4Ey0q3mgxATEO0gG8KNJJg/QtjaNBN
 pd0NsQPo/z/+dod9tzRozodriFD6zI501YKCePzyuIncEW2zG/KOL2zC6+yQXseCekZx
 HXx+P9Pa+h+u8eoiODJCsQ7kWgQ/b5i/D9eOn+evVC420UJKrajgLKNUkJJE0bbZGBXC
 m2cw==
X-Gm-Message-State: APjAAAXJdmVcwatZFSClNzpu1+4uy01e6cnGXmbr+QeRs/P6OkBGl4g/
 ezjMGA1m1ff4mZuqqlmcChUTl6Ek/GaB7dlcBOO3rw==
X-Google-Smtp-Source: APXvYqywXpa/Npr3CqGui1M+Ck/9E84gKqQV0hHmjJWX1i+iiistDvuhhUTd0M/gmnfwxd9OX67eXymSKvDEkkHWs0c=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr92201599otq.75.1577936993075; 
 Wed, 01 Jan 2020 19:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20200102031240.44484-1-zong.li@sifive.com>
 <20200102031240.44484-3-zong.li@sifive.com>
 <CAAhSdy0sp_=nwAKxphA8of4UV_NfxHE-KXyTPekmHkieq_XyVw@mail.gmail.com>
In-Reply-To: <CAAhSdy0sp_=nwAKxphA8of4UV_NfxHE-KXyTPekmHkieq_XyVw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 2 Jan 2020 11:49:43 +0800
Message-ID: <CANXhq0rHOj6_UetWEnvNw4TzwWR9tzWTAJysxqknPN1Ng1Pu8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: use __pa_symbol for kernel symbols
To: Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_194954_357505_6EED10B1 
X-CRM114-Status: GOOD (  18.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 2, 2020 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jan 2, 2020 at 8:42 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > __pa_symbol is the marcro that should be used for kernel symbols. It is
> > also a pre-requisite for DEBUG_VIRTUAL which will do bounds checking.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/mm/init.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 69f6678db7f3..965a8cf4829c 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -99,13 +99,13 @@ static void __init setup_initrd(void)
> >                 pr_info("initrd not found or empty");
> >                 goto disable;
> >         }
> > -       if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> > +       if (__pa_symbol(initrd_end) > PFN_PHYS(max_low_pfn)) {
> >                 pr_err("initrd extends beyond end of memory");
> >                 goto disable;
> >         }
> >
> >         size = initrd_end - initrd_start;
> > -       memblock_reserve(__pa(initrd_start), size);
> > +       memblock_reserve(__pa_symbol(initrd_start), size);
> >         initrd_below_start_ok = 1;
> >
> >         pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
> > @@ -124,8 +124,8 @@ void __init setup_bootmem(void)
> >  {
> >         struct memblock_region *reg;
> >         phys_addr_t mem_size = 0;
> > -       phys_addr_t vmlinux_end = __pa(&_end);
> > -       phys_addr_t vmlinux_start = __pa(&_start);
> > +       phys_addr_t vmlinux_end = __pa_symbol(&_end);
> > +       phys_addr_t vmlinux_start = __pa_symbol(&_start);
> >
> >         /* Find the memory region containing the kernel */
> >         for_each_memblock(memory, reg) {
> > @@ -445,7 +445,7 @@ static void __init setup_vm_final(void)
> >
> >         /* Setup swapper PGD for fixmap */
> >         create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> > -                          __pa(fixmap_pgd_next),
> > +                          __pa_symbol(fixmap_pgd_next),
> >                            PGDIR_SIZE, PAGE_TABLE);
> >
> >         /* Map all memory banks */
> > @@ -474,7 +474,7 @@ static void __init setup_vm_final(void)
> >         clear_fixmap(FIX_PMD);
> >
> >         /* Move to swapper page table */
> > -       csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | SATP_MODE);
> > +       csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
> >         local_flush_tlb_all();
> >  }
> >  #else
> > --
> > 2.24.1
> >
>
> Overall looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> I have not tried this patch but can you confirm that
> __pa_symbol() works fine even when DEBUG_VIRTUAL=n

Yes, it works fine through original way when DEBUG_VIRTUAL is not set.

>
> Regards,
> Anup

