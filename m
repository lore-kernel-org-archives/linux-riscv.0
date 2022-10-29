Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EEEC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt+ni/AC4K5soDUk0zx7/1dNUT6dJwnbT8velJtRU6A=; b=EmF1UbTKyX+fgd
	3xzAh5IEGDhJ6Uuht8YG5DeweVFpt9l6iNgPM/MoZsXsL4WdAj1JuEgk1ZoieVvMCevbIlzePEhV6
	xVD9ozMCSQ2JSm6bVxvCHUKgZFigj9ltaMns4KoMJuisqPNBhyNFcom75m+ZfgOKEImAU3FatgVs8
	48ZE78gy/xKmYbUztivW0YnWCiPeRaiYOtVCb/Ghf5GzAD6UCeLJ9/uxAX5VtwBrwD9yHKSN6Quqy
	F5dtV9OwAK8HC89qtZgk/ZikKkKjeTyUt+acPYPL+V1N9+YHdDD27c5qxaNxnEZiKlQOnjpaYd/Sd
	jJDITvbKZvqsIYRd/MsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooiZc-005kLm-QS; Sat, 29 Oct 2022 09:56:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooiZZ-005kKg-VD
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 09:56:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id bs21so9476356wrb.4
        for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYbKJy82Ni1WaoAt3JW0zUHd/xH1wOyaSoMpg/ZR0OY=;
        b=bLhX/kZFyXVpmYfpxWl6HQgmppZ702qNue6v4l5Y0OSDVLLwaJRwSQp+xPzw8IzQAM
         sv88mhhgp6tWBB8xWomwR5TA4OBUf95xlP9libLLWsTDb3vFXqmWpb4Fj85Y60odWe/G
         beT1Q31mX2+S+nh7GniEbhwtR5C/Cfu3O04Pb8bjRMd32IZCzS9H3mkRtuMgxOfA0/Hg
         pPmnXcoYHtvF6740mQNwGW39Enk3PoEulh5+66sKHY26CvFNdMyeMB2p8khjZQxG9AJ2
         1ZVrSqq1RB25zGYB8eHskOqRVN4KYKyoVhUxulY0x50w9oihx7/7oawb9g2Xw+eW3y1R
         3ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYbKJy82Ni1WaoAt3JW0zUHd/xH1wOyaSoMpg/ZR0OY=;
        b=ngPIn3KRM63NDETm/Pbp6i4BmD/Z/R3r77dL2Yoyk7QpIhHvT7IsycBLIBQXHINaT9
         Up2Y8sHOCAtOZaKlYUvXSSWI/9o81erXixxhlWiKzSlCx3BCNEobvJMKuWpaBcfpBrrG
         FSrAYIFWgnUsd0xvS5J3PqFMP1JFnECSYuwqFvL7bZYF2O7IRpCG41wSgY2ajPSRMG9R
         9A/aN5pErjWaNlUswBSiGl6NKSlh2/7Tnr8Fa4EjWYKj+vv2ZvkMFdQPLfIg5PyNWEOv
         NRB0me2zAdxqlyZSW521Au848/JwPy2u9CzwZUsZhIHNtPRQLGiA9Tm5jyWab/uJy/Pu
         0jaw==
X-Gm-Message-State: ACrzQf2tjfsHQihnu/Jd1pKYAiZsUt52K+TcuD/biH7xxKYXY8O96j4H
	wvLJrAfORoA54QAHlszCf+xdOg==
X-Google-Smtp-Source: AMsMyM5Ccre1kyxGZ+/+2ktSKgdZW715lhzzsFNX3RK0O1Aj3vYKinBl9M+grR87oRML0yCye+l3yA==
X-Received: by 2002:adf:a31c:0:b0:236:ba0d:246b with SMTP id c28-20020adfa31c000000b00236ba0d246bmr98769wrb.448.1667037371161;
        Sat, 29 Oct 2022 02:56:11 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id i19-20020a05600c2d9300b003cf5e445f5dsm1145974wmg.25.2022.10.29.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 02:56:10 -0700 (PDT)
Date: Sat, 29 Oct 2022 11:56:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: improve boot time isa extensions handling
Message-ID: <20221029095609.e4ymkbnk2hl3kxzc@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_025614_033191_AD33304A 
X-CRM114-Status: GOOD (  22.22  )
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

On Thu, Oct 06, 2022 at 03:08:10PM +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, that's to say, the hart features won't change any more
> after booting, this chacteristic make it straightforward to use
> static branch to check one specific ISA extension is supported or not
> to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> Basically, for ease of maintenance, we prefer to use static branches
> in C code, but recently, Samuel found that the static branch usage in
> cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> Samuel pointed out, "Having a static branch in cpu_relax() is
> problematic because that function is widely inlined, including in some
> quite complex functions like in the VDSO. A quick measurement shows
> this static branch is responsible by itself for around 40% of the jump
> table."
> 
> Samuel's findings pointed out one of a few downsides of static branches
> usage in C code to handle ISA extensions detected at boot time:
> static branch's metadata in the __jump_table section, which is not
> discarded after ISA extensions are finalized, wastes some space.
> 
> I want to try to solve the issue for all possible dynamic handling of
> ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> riscv_has_extension_*() helpers, which work like static branches but
> are patched using alternatives, thus the metadata can be freed after
> patching.
> 
> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> [2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland@arm.com/
> 
> 
> Jisheng Zhang (8):
>   riscv: move riscv_noncoherent_supported() out of ZICBOM probe
>   riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
>   riscv: hwcap: make ISA extension ids can be used in asm
>   riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA
>     extensions
>   riscv: introduce riscv_has_extension_[un]likely()
>   riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
>   riscv: cpu_relax: switch to riscv_has_extension_likely()
>   riscv: remove riscv_isa_ext_keys[] array and related usage
> 
>  arch/riscv/include/asm/errata_list.h    |  9 +--
>  arch/riscv/include/asm/hwcap.h          | 94 ++++++++++++++-----------
>  arch/riscv/include/asm/switch_to.h      |  3 +-
>  arch/riscv/include/asm/vdso/processor.h |  2 +-
>  arch/riscv/kernel/cpufeature.c          | 78 +++-----------------
>  arch/riscv/kernel/setup.c               |  4 ++
>  6 files changed, 71 insertions(+), 119 deletions(-)
> 
> -- 
> 2.37.2
>

Hi Jisheng,

I just tried building this with LLVM=1 and fails to compile with messages
like

 ld.lld: error: relocation R_RISCV_64 cannot be used against symbol '.Ltmp1'; recompile with -fPIC
 >>> defined in arch/riscv/kernel/vdso/vgettimeofday.o
 >>> referenced by vgettimeofday.c
 >>>               arch/riscv/kernel/vdso/vgettimeofday.o:(.alternative+0x0)

It does compile and boot with CC=clang and binutils 2.39, where my clang
version is 14.0.5 (Fedora 14.0.5-1.fc36).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
