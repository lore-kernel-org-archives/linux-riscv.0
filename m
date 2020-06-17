Return-Path: <SRS0=u9L5=76=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8F5C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 06:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0A420663
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2020 06:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKSDE661";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="jeG4FjV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0A420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xyNqLKkTkvhzaA5WIPNmUhrKUCZ/UNf8ZXPhmsM3X28=; b=cKSDE661C1DtxqZ1zoA3jlV5J
	VDWc2clVFi8yBcfmw6j3kW6cJlYT24ECTLQh3tfRgLI6yK5xKIlekigE96E0Ao6jUQkQSu8WIJuOH
	tn2KPuXkcmVFR05AbxpkhSy+eKn3Z7A5t67Oa4aj/CZqGDOGJekbyk9SYe7cB6dtXOu4QalDVI+EI
	u20Ki0RDMTMbqwAP8yn9O/I0sVjGaFEtVgGUXEvRH8JCGXvzwpvfx6Knjv+p0QjXh871mHQKs/7Eh
	djpUMKUA4YikEF5i1ECzOMFg9+iVe+UzTliTzeCbRcALEK6qg6n7lQMj0WiEAfUY2i9nATkUqet6g
	ShtbxSfaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlRaP-00050B-R1; Wed, 17 Jun 2020 06:30:13 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlRaN-0004mZ-Gf
 for linux-riscv@lists.infradead.org; Wed, 17 Jun 2020 06:30:12 +0000
Received: by mail-yb1-xb42.google.com with SMTP id y13so701820ybj.10
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xyNqLKkTkvhzaA5WIPNmUhrKUCZ/UNf8ZXPhmsM3X28=;
 b=jeG4FjV0hqv4kB0BcxsmpyNd4zjKL6ficNUfH93IC2J1884QNcosr9HycGBrsTPv/q
 LmSvrISeT8v6kC4YnEGAlsIZmgfxXlMMWN10yCoXrOe6ZHWndNq0GtrPoKIojS58AhQZ
 pxJgXPdE4QFzmV7iebWvHWUn9aZ9Bk/u8Zh4pFFNJaZN5oXsjH/1crWyAAyKzrZzkzKG
 z8micmgTnmFlVMl2AMmykSHgc+m2QzKEmbXOlh9jIEF4SgI9srlGewJ6IUgGK7yo8wbI
 GOt47oJjXfy23FPYiDT6T5KM0LWxai87OTjEkl3UD7r6ukE3gbkHGuRM2ijvG2lu/Z3p
 t4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyNqLKkTkvhzaA5WIPNmUhrKUCZ/UNf8ZXPhmsM3X28=;
 b=cQrDg2s6L4i4eveSYMfFidWrjY0vlHt0krr7bpP1mdTNIpjhEFOlshsG7hRl/cPk+E
 h4WvASY26YCu4rU1ui2hnvDssMgw0vPAeUvOcacr56VYDBPULVnZbR6+1Cu6h2vIlEHa
 QRfvHZYXA9QSNhtDWUNtkEasuQ3OadVbm4aJkiL+msjguWl6yNTpl7Et4kj+eOZgk3WV
 ABldyyKTFWyvFk5ejpUFLjS13p1r1/WXWDptEwqsFBTvMfHlApZ5az0jGACcSF8KVBhZ
 CVdPybwDf43FVtISc5GLYS3mgm+dhnwa5L6lswaBQyVItoqxApCmbvx23/1r1L+LuhQT
 pikA==
X-Gm-Message-State: AOAM5325DO+aQGqPy4h5WtvJZQDJgr4ThOTG6U6tokD5brbHFOqVzgqy
 SZ1qIQPeZUKcHyYUZWoz4Q4lyabsq8vHTCuTZ6SQBw==
X-Google-Smtp-Source: ABdhPJyafZnN0ctIFbYd/5SRMcYycPseuNzhF5a0gXfZLMaBVK661uHzzcWhI4C66oUf5llSdJqZ2D3pLGub+3UYvZc=
X-Received: by 2002:a25:2f4f:: with SMTP id v76mr10953670ybv.7.1592375409854; 
 Tue, 16 Jun 2020 23:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045108.GP75760@lianli.shorne-pla.net>
 <mhng-b86477b3-4134-4023-968e-532ca0b33125@palmerdabbelt-glaptop1>
 <CANN689GkUUfpTn+fkjsC-a=RwGsxVwsg-QXKDnVe6zXLjvuZWA@mail.gmail.com>
 <20200616191943.GA1401039@lianli.shorne-pla.net>
 <CAOnJCUL52Ch3QHikik=DYJYciFE0e8zhrSL-AgaZPensXyZqyg@mail.gmail.com>
 <CANN689Ek3szVSVC4H0NKpkdZes82VW_Xvs4+GLTGCWES7A-ySQ@mail.gmail.com>
 <20200617053539.GB1401039@lianli.shorne-pla.net>
 <20200617060734.GC1401039@lianli.shorne-pla.net>
In-Reply-To: <20200617060734.GC1401039@lianli.shorne-pla.net>
From: Michel Lespinasse <walken@google.com>
Date: Tue, 16 Jun 2020 23:29:56 -0700
Message-ID: <CANN689F=LKGprNx9_Wb5HOvT-Fvv8WUR_T2DJPhy0u2HeT-A7g@mail.gmail.com>
Subject: Re: mm lock issue while booting Linux on 5.8-rc1 for RISC-V
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_233011_575627_04BF0912 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: Bjorn Topel <bjorn.topel@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2020 at 11:07 PM Stafford Horne <shorne@gmail.com> wrote:
> On Wed, Jun 17, 2020 at 02:35:39PM +0900, Stafford Horne wrote:
> > On Tue, Jun 16, 2020 at 01:47:24PM -0700, Michel Lespinasse wrote:
> > > This makes me wonder actually - maybe there is a latent bug that got
> > > exposed after my change added the rwsem_is_locked assertion to the
> > > lockdep_assert_held one. If that is the case, it may be helpful to
> > > bisect when that issue first appeared, by testing before my patchset
> > > with VM_BUG_ON(!rwsem_is_locked(&walk.mm->mmap_lock)) added to
> > > walk_page_range() / walk_page_range_novma() / walk_page_vma() ...
> >
> > Hello,
> >
> > I tried to bisect it, but I think this issue goes much further back.
> >
> > Just with the below patch booting fails all the way back to v5.7.
> >
> > What does this mean by they way, why would mmap_assert_locked() want to assert
> > that the rwsem_is_locked() is not true?

It's the opposite - VM_BUG_ON(cond) triggers if cond is true, so in
other words it asserts that cond is false. Yeah, I agree it is kinda
confusing. But in our case, it asserts that the rwsem is locked, which
is what we want.

> The openrisc code that was walking the page ranges was not locking mm. I have
> added the  below patch to v5.8-rc1 and it seems to work fine.  I will send a
> better patch in a bit.
>
> iff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
> index c152a68811dd..bd5f05dd9174 100644
> --- a/arch/openrisc/kernel/dma.c
> +++ b/arch/openrisc/kernel/dma.c
> @@ -74,8 +74,10 @@ void *arch_dma_set_uncached(void *cpu_addr, size_t size)
>          * We need to iterate through the pages, clearing the dcache for
>          * them and setting the cache-inhibit bit.
>          */
> +       mmap_read_lock(&init_mm);
>         error = walk_page_range(&init_mm, va, va + size, &set_nocache_walk_ops,
>                         NULL);
> +       mmap_read_unlock(&init_mm);
>         if (error)
>                 return ERR_PTR(error);
>         return cpu_addr;
> @@ -85,9 +87,11 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t size)
>  {
>         unsigned long va = (unsigned long)cpu_addr;
>
> +       mmap_read_lock(&init_mm);
>         /* walk_page_range shouldn't be able to fail here */
>         WARN_ON(walk_page_range(&init_mm, va, va + size,
>                         &clear_nocache_walk_ops, NULL));
> +       mmap_read_unlock(&init_mm);
>  }

Thanks a lot for getting to the bottom of this. I think this is the proper fix.

