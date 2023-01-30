Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA899C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCBzxocs5IQoBRew8G+1ahyNV/y32Y6m12dVudHHEic=; b=ly59BQd3OQ1cNL
	buz7/9mKeSV9vQvk8ddLvJAH5kXWyYjpo9FGv5k7g6bJCIzio8z5YD4++BGZ/4SnvbSrxscgAr2Tj
	dSglyaWuN6a4Q01LuXmZEcuSY++PXYn8HiQUGEBJFwvk+B0GGHGpG+kl05fqVteu8l/hFHcvu5ZLI
	SOLNbzRf0Lb0/0Ep9RSPk+8onpL1TLHz7HG1F+0NBRTUZHL6XmkzJ5/CWtRE0Ug8dzvMY61ZU/qHl
	i0/yyLvBe1I82dHt6B/uS4GrwOP5q9R2C6aa/NgCIKBwC+Gedn0vrj0xMcm17ZpiV+r1Gk/UXIWoh
	/qC2ziQhkPUtlyL/zotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRjC-003Bht-Qx; Mon, 30 Jan 2023 10:49:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRii-003BdA-9h
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 10:49:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o36so1631507wms.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SaqOey6takqXeZ8f0/kRCVEhlQpWs2nzQX4ec1B7cGw=;
        b=AZJbWWO1gFB7jtxzXSoG06CX5t1F9m7wuJQaTL25u0qZSfjmlTN8zFIp3n9uCrVfiZ
         JRNavrjnrkEIGNNcT1YMWdUT7z5m17mFK/3gGERCqIPpGgpL5YUbRYZ/01OPmRvnd+tZ
         NdbDUkL9Qy5UAfS1QoONoX2eg+CB2fxuDqR4O2SH4+vvBSa4DQHSHTZW+le49dnVlcxY
         2Or3crt25V4t+roMEsh9CxJsWysT2ya2BurNrtaYOMbQkzFnwDCkX7Hnd+3+rxGPWnf4
         vwpKV3iTV6yUYPxMARk3i9O4Msv5rbbBuKSl1lE5yyExkkB6qywuBPfuQsUhwD2oGqMr
         aFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaqOey6takqXeZ8f0/kRCVEhlQpWs2nzQX4ec1B7cGw=;
        b=h7vX8jZWtV7J9kLgHGR9jvus/WVWj0Kco7hW3rzbA1UQiZrVOBAVG+69/Wt8Tcv07E
         ImMtNBs/didT4+itPdA3QKIqnosOyG7Ex9y0r5ej4YzZJW7ZyxJ/gkVffGMAYhbKIPxw
         RStKLnjl75Tbuse9/OxdvqmxkwZXkUtrmmOWE/5rTjIWxEAIpftbt5Uzc+vXDbWYv+nc
         AhiN+1Ffmlj7LV4AveZ5t+cw4V1f/cc8PSE4De/Kp+IErqwUfdH+l4Js7rhgYAsvmZ3b
         +cgofQQSroL80K71NmfH0lmO+mgQLt4njUkCj47zJGaPIJ2+D3NT2/pG/fDg+IGN6YXr
         SdJg==
X-Gm-Message-State: AO0yUKVv07nJNMA9a2cmxL4rhfy2xQA5oiSanOCOe6wJ0LTJP6BcjcTH
	UJ0iY9Strb6pBP/nEKZd2T92FQ==
X-Google-Smtp-Source: AK7set+jzH5DbXimXIu/PLpv0ONHG0IeYaZOzibiKULpjUegqIkW8pznBX7JLvV6A6P125z8hVfdhA==
X-Received: by 2002:a05:600c:1e0d:b0:3dc:3f1b:6757 with SMTP id ay13-20020a05600c1e0d00b003dc3f1b6757mr10561869wmb.15.1675075741688;
        Mon, 30 Jan 2023 02:49:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db0bb81b6asm12927057wmb.1.2023.01.30.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:49:01 -0800 (PST)
Date: Mon, 30 Jan 2023 11:49:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Jinyu Tang <tjytimi@163.com>, palmer@rivosinc.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, yuzhao@google.com,
	conor.dooley@microchip.com, guoren@kernel.org,
	tongtiangen@huawei.com, anup@brainfault.org,
	akpm@linux-foundation.org, falcon@tinylab.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
Message-ID: <20230130104900.muwgikgkvkn2byna@orel>
References: <20230129064956.143664-1-tjytimi@163.com>
 <CAK9=C2VaxNezv+M=s=ZSA-YDf_17+hcom_z1=_j2YkRHg-yg7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VaxNezv+M=s=ZSA-YDf_17+hcom_z1=_j2YkRHg-yg7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_024904_357261_953FEA03 
X-CRM114-Status: GOOD (  28.04  )
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

On Mon, Jan 30, 2023 at 03:55:55PM +0530, Anup Patel wrote:
> On Sun, Jan 29, 2023 at 12:21 PM Jinyu Tang <tjytimi@163.com> wrote:
> >
> > The arch_has_hw_pte_young() is false for riscv by default. If it's
> > false, page table walk is almost skipped for MGLRU reclaim. And it
> > will also cause useless step in __wp_page_copy_user().
> >
> > RISC-V Privileged Book says that riscv have two schemes to manage A
> > and D bit.
> >
> > So add a config for selecting, the default is true. For simple
> > implementation riscv CPU which just generate page fault, unselect it.
> 
> I totally disagree with this approach.
> 
> Almost all existing RISC-V platforms don't have HW support
> PTE.A and PTE.D updates.
> 
> We want the same kernel image to run HW with/without PTE.A
> and PTE.D updates so kconfig based approach is not going to
> fly.
> 
> >
> > Signed-off-by: Jinyu Tang <tjytimi@163.com>
> > ---
> >  arch/riscv/Kconfig               | 10 ++++++++++
> >  arch/riscv/include/asm/pgtable.h |  7 +++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..17c82885549c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -180,6 +180,16 @@ config PAGE_OFFSET
> >         default 0x80000000 if 64BIT && !MMU
> >         default 0xff60000000000000 if 64BIT
> >
> > +config ARCH_HAS_HARDWARE_PTE_YOUNG
> > +       bool "Hardware Set PTE Access Bit"
> > +       default y
> > +       help
> > +         Select if hardware set A bit when PTE is accessed. The default is
> > +         'Y', because most RISC-V CPU hardware can manage A and D bit.
> > +         But RISC-V may have simple implementation that do not support
> > +         hardware set A bit but only generate page fault, for that case just
> > +         unselect it.
> > +
> >  config KASAN_SHADOW_OFFSET
> >         hex
> >         depends on KASAN_GENERIC
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 4eba9a98d0e3..1db54ab4e1ba 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -532,6 +532,13 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
> >          */
> >         return ptep_test_and_clear_young(vma, address, ptep);
> >  }
> > +#ifdef CONFIG_ARCH_HAS_HARDWARE_PTE_YOUNG
> 
> > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > +static inline bool arch_has_hw_pte_young(void)
> > +{
> > +       return true;
> 
> Drop the kconfig option ARCH_HAS_HARDWARE_PTE_YOUNG
> and instead use code patching to return true only when Svadu
> ISA extension is available in DT ISA string.

Indeed. I should have checked if there was an extension for this
first. It crossed my mind that we should only be enabling features
when the extensions are present, but looking at the privileged manual
isn't sufficient to learn about the Svadu extension. I should have
checked https://wiki.riscv.org/display/HOME/Specification+Status

Anyway, I retract my r-b and agree with Anup.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
