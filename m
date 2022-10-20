Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C6BC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Yjjd1nSBpFe9Q9bUATKj3r1rxxFAikeHe1CY0Hh+G8=; b=oie2vibhSqP9P2
	WzrdjwwQvAoD5rXgfUN9wXk1bXTiw7bg+ctQea9sjq8TIXUD/DR2rDGs9DZCAxsL/Bsl8Lri1LlDs
	atBoHrmx9/EQdfArGFoQs1zT/sYaXTtaoA8R1k8o+kv3/BURO3kMtANPW7f7I5d2/Hl9MkzVZNFQA
	+EQGYfDAmLeZTsvi1eltS4Iv8HDw0JH78SExe3+tACj2HKcR0qv0s5qsNoLGY6dH2WTbhpshWDGep
	NV+VsIoyPevchVcV0STTlgZY79bvSh9VJnkAeMLaXTbR2i8+LWtbHmeIddGzHfUV005ffBnBF7V9e
	7EvTIjAg/AO/GIf534Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ91-00Bps6-2q; Thu, 20 Oct 2022 07:39:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ8y-00Bpl6-SQ
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:39:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id j4so32158631lfk.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXSAoATQCgV1tkrtFlfAwHc5TCrnlZk59AbU4gXCz/M=;
        b=IQfGk/QydWspEikjitqgDAHA8Z7JztQjBAYZGBr5InCIRR+Vu2vkQ17YbWK5o0slwI
         siwCWxTauWfOZqnJV6vguVBXJtdXU5ztDjEJFaJUGHIzWKa8B/sVSlrfkxV0lXa0uMKl
         6LO6jj/easqGTbyTkqFUKFRRqybL3jPvYHm3Mfm8wG9SQZe3K1MdJCjdwlNKhqWdFDrq
         zDiVYpViBJ8Po8lHQ6LPiGiIN1VFFl6Z8iAZ5JLjLyWY6iiCwL7M3/+5lJZvGa0rEwID
         eWUyLNce+YmQ20G+1Y6pZiHwPk6vEnPlZjw5szzgrySZrVn+JM+F34UKijg6Fiw4hyUx
         bm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXSAoATQCgV1tkrtFlfAwHc5TCrnlZk59AbU4gXCz/M=;
        b=hnTA4TbhRkVpO5UJyBPCxoPRtr7skTySdUBAxrrCNgCUTqUKp+ipDScUlylbCacfBn
         M5gPFsCTGF2ABe2mWCSdTFjYo5CLIrlpksufy+tEzXfyMar8cmmWvaDKB/cMEEPGet3q
         9EXkR6HFiYmU2ANo/WVwPEE1ORN2u1CFnhxBawUCdqYN7nd1hOs65UeqfSYR8b3o30IH
         UXYtEIsGMr07Np248yK1JDph7UYiQNG/+s/El5OrqAco41fpEtXnPKORm9P7cBcVr4hJ
         efiDCdkICW9YBOxwXO9t+iYamSsGR1e0hlhAS4Is1iju4Wkawhd6sbCY1ly8SMbNwe5C
         6/yg==
X-Gm-Message-State: ACrzQf1iCWuelgqkGx0Xg6mVyAqgejYu5ZFMl4RFeSdltsYKY1jZq68k
	TGhpZA2Cq70hEfgE7FD38DQ9ebeeWCKeuvmtSxskBFMPXprh3A==
X-Google-Smtp-Source: AMsMyM6SDl9FiSkW9loqo2yrBaOay/BZwucTn9j+98fVGc6fP1g+2B8E0KPcVC1zc+vUaBrhB0PVltQtdWOm31s1yaQ=
X-Received: by 2002:ac2:5616:0:b0:4a2:61f6:85e9 with SMTP id
 v22-20020ac25616000000b004a261f685e9mr4072003lfd.419.1666251545918; Thu, 20
 Oct 2022 00:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221019131128.237026-1-apatel@ventanamicro.com>
 <20221019131128.237026-3-apatel@ventanamicro.com> <13122510.uLZWGnKmhe@phil>
 <CAK9=C2WaoqAaVa2fo9E7cGXMy-MKpj-xLN6LoMHyq_g1psGLUQ@mail.gmail.com> <20bfd8a3-3836-46b8-9fdd-a407973224ba@app.fastmail.com>
In-Reply-To: <20bfd8a3-3836-46b8-9fdd-a407973224ba@app.fastmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Oct 2022 13:08:54 +0530
Message-ID: <CAK9=C2V4EUm_ff4+LidHyO86gBJ4ys=Gh+4jzZAD35+dz037Tw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_003908_940471_C8DC464B 
X-CRM114-Status: GOOD (  22.29  )
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

On Thu, Oct 20, 2022 at 2:20 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Oct 19, 2022, at 18:10, Anup Patel wrote:
> > On Wed, Oct 19, 2022 at 7:49 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >>
> >> Am Mittwoch, 19. Oktober 2022, 15:11:26 CEST schrieb Anup Patel:
> >> > Currently, all flavors of ioremap_xyz() function maps to the generic
> >> > ioremap() which means any ioremap_xyz() call will always map the
> >> > target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> >> > ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> >> > remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> >> > page attributes.
> >> >
> >> > To address above (just like other architectures), we implement RISC-V
> >> > specific ioremap_cache() and ioremap_wc() which maps memory using page
> >> > attributes as defined by the Svpbmt specification.
> >> >
> >> > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> >> > Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>
> >> Wasn't there discussion around those functions in general in v2?
> >
> > Yes, there was discussion about a few drivers using ioremap_xyz()
> > which is discouraged and drivers should use memremap().
> >
> > We still need the arch specific ioremap_xyz() functions/macros
> > added by this patch because these are required by the generic
> > kernel memremap() implementation (refer, kernel/iomem.c).
>
> There is a difference between the strongly discouraged
> ioremap_cache() that pretty much has no valid users, and
> the ioremap_wt/ioremap_wc functions that are sometimes used
> for mapping video framebuffer or similar.
>
> It should be sufficient to provide a arch_memremap_wb()
> and no ioremap_cache() to make memremap() work correctly.
>

Okay, I will simplify this patch to only implement arch_memremap_wb().

This will make the MEMREMAP_WB flag to work correctly but other
MEMREMAP_xyz flags will always use non-cacheable IO mappings.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
