Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8EEC2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 14:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D293361369
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 14:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D293361369
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJDvIXcjWde0YILqhi6Vo6o8/kBSx3SFwkWh9DLDQes=; b=QKlGq8kCktz9PI
	tS6zbqtbLWgunfVQ7pP/6CeIVsOmmm+m/yPHIN/lg86tSZJps9acNN8CeYTyOisc0A+9DDwSUIHNd
	yAOGFztvAuXamLOdO292s5ZfAzh0rcwzO7vPtSyy77rgJ+U/danpYdCakGYly57Chxy11hZGSJyON
	E5u9G1p7DMxJmC73qMYvQOBrAYwIN09dft/n19fBLgd4x6BqN50bzNro0LVaA6PqJ0i1QZfZsOjoM
	QwFR2uIg3+E7SB4KoQckN6YiCBAXOWuBVLzQOcTVSEqdIaqFrjEJ/KP+j+AaqmJAYsk8tLg7kxvrf
	9Vgy6mTuTuwwpb3lNAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvh0K-007Pu8-QO; Tue, 22 Jun 2021 14:03:52 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvh0I-007Pt9-4r
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 14:03:51 +0000
Received: by mail-ua1-f49.google.com with SMTP id x22so7684794uap.0
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 07:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DhiBJqgLPI4mq7rTlL2ewwRyBrH0IFpl65vmKyq+QM=;
 b=GMg4szEsF55092GVB4eTKJjHlqI95JmoCV/TIqNLuYhx8k8I3o77ybkkfaV0NgNOvm
 yLsAKjJ2u8Qq+06xVUNcXlOvg7VFmxo/3lQSn4pxfPEwKcoPnHH+OYcSE312BSHQl19u
 wSXi7xDxbO7koOsmwa3W34Lt0aDhErDa9ciIMAgYCo5M7KDhBMxMExptn1mGdoNM1miy
 OgfkQC4qzxvUAfyCjVai8z3MUsyq9rQNgau2w6zVHk4FZ55OLyokE50IV6hS2gOwsFt/
 qSoQoAghEmqsqkHtlXlcEhFEeVaIvru2xSo3H+/zJly6Re3WH4xrBHbZb8qI8QtmAK5r
 FtUg==
X-Gm-Message-State: AOAM530BeQ8kksu32p4nZdgBUO+/fWI9Lqri3NEjm8Vbb4DjpsfrB0cE
 a3dKPt8IUlkQhvZO1BEYdZZsrqrKzM6k3+spm5A=
X-Google-Smtp-Source: ABdhPJzQv09D4jymRC3aBNx7ZtOolbMBnl9c7deoMJlJV4fHFTlR4u2FiwP7APo9Br/AdiKJF5V3XZTDCBRUIYDQvGw=
X-Received: by 2002:ab0:3734:: with SMTP id s20mr3756611uag.106.1624370627124; 
 Tue, 22 Jun 2021 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210617095831.2398438-1-sunnanyong@huawei.com>
In-Reply-To: <20210617095831.2398438-1-sunnanyong@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Jun 2021 16:03:35 +0200
Message-ID: <CAMuHMdU6ngi50vXn--fNDy6BCOz=U34FDhw7iHvqKrNQqSHw-w@mail.gmail.com>
Subject: Re: [PATCH v2 -next] riscv: mm: fix build errors caused by mk_pmd()
To: Nanyong Sun <sunnanyong@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Atish Patra <atish.patra@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_070350_232809_B26E5903 
X-CRM114-Status: GOOD (  19.22  )
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

On Thu, Jun 17, 2021 at 11:28 AM Nanyong Sun <sunnanyong@huawei.com> wrote:
> With "riscv: mm: add THP support on 64-bit", mk_pmd() function
> introduce build errors,
> 1.build with CONFIG_ARCH_RV32I=y:
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> arch/riscv/include/asm/pgtable.h:513:9: error: implicit declaration of function 'pfn_pmd';
>  did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
>
> 2.build with CONFIG_SPARSEMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section';
>  did you mean 'present_section'? [-Werror=implicit-function-declaration]
>
> Move the definition of mk_pmd to pgtable-64.h to fix the first error.
> Use macro definition instead of inline function for mk_pmd
> to fix the second problem. It is similar to the mk_pte macro.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>

Thanks, this fixes my rv32 build.
Works fine with litex-rebase on VexRiscv.
No regression on BeagleV Starlight-beta.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
