Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB788C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSkBUlB0P/9lzm8SoPsoHtKnCuUaWsq1CPS+YeB6/Sk=; b=XV3qHjWYoTTqYi
	kTJQU6goyqx4NMrVBpjN+T9A9Bca9PyS+YlEH8TW7DEUnsv5wjy7dWOTNf/WX98SQ2nls65KKtdL1
	3VuFsdg8Dq2OsksjDUT20A/J/rleT0GgMsxuS3H0A+UZCK3pjdCak6qRVO7NAqj8543m3IlnuDf+8
	Iay/yY7AAZcxbbP0MDFYHT/DnBFplr1SSV0k6xs8IhvchslyLdr9bEhJgwVBT9485X4DfVdKtzwVd
	0r12m0rBfSOq9f39LJ40M3HXXvPCNbZBBY48t1FnNa/UQ1tI4l0De2lQETbSKr2xGpzRAghEsQg6g
	7as85yN7rJPt3qExBwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n0M-003G4z-5W; Mon, 12 Dec 2022 17:54:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n0J-003G0K-Fp
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 17:54:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D852B80DDA
	for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B894C433F0
	for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670867651;
	bh=bY7EznKOlvKF57kav1/EOPRkTTovAkvgGO10ZJYhYcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NEporkZyXqNlMag6C+Ps4PX6ja8kKKVrOxDL6x7PvrW29OHC5W7xSZmu9SXEhpBDY
	 r1u0NtAsgcxkxPcQGQjTp4P081cKY5afiq3hBpyqb8ksluhHUS5it/MZoiatczV6JH
	 ErPOt/bfTUkHCttuiZxR8DlXZ1p2iBR1iFmUONW/rnl3CRTN/Xym7Q/ukReNxEOkBz
	 agZsF0SFjFWHfrcnfKp4uW7qiDrRYv7ZSPw/I/MO5A+rLqbj5QVp2tGHlePHBBrWHd
	 2jow0BX/dlgEayePuD8xDV4UPierEokD1T+CIpif0qvZJIIHKb7v8eCOnKD+rhSP6j
	 +rOk2OjxV9xEg==
Received: by mail-ua1-f45.google.com with SMTP id q6so3394871uao.9
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 09:54:11 -0800 (PST)
X-Gm-Message-State: ANoB5pn3dHLKIVJwtOIWOs8E41Oc3YIU1WiGYlCeKOPpDJqqnl07EvLO
	PcAYSFGspoTWavwjr6Xy1GbeOPC9JphFR76A7g==
X-Google-Smtp-Source: AA0mqf573L42dMXtmZJVUUuskEYLV16yalBiJSgkJa1EEtoeIRtYyXQ3qTxa95wj6G+9q09neTNW9b+h3tdGkRXlLMY=
X-Received: by 2002:ab0:3a96:0:b0:419:678:cf31 with SMTP id
 r22-20020ab03a96000000b004190678cf31mr35543884uaw.63.1670867649788; Mon, 12
 Dec 2022 09:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20221212143102.175065-1-alexghiti@rivosinc.com>
In-Reply-To: <20221212143102.175065-1-alexghiti@rivosinc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Dec 2022 11:53:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJz4uf+956oC4BfZGdjb+rfAZqduexLw3=D5HHjtyBC+g@mail.gmail.com>
Message-ID: <CAL_JsqJz4uf+956oC4BfZGdjb+rfAZqduexLw3=D5HHjtyBC+g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_095415_881481_DA6BA9FE 
X-CRM114-Status: GOOD (  34.76  )
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

On Mon, Dec 12, 2022 at 8:31 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
>
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
>
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
>
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
>
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
>
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
>
> Note that we rely on the firmware to protect itself using PMP.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>
> v2:
> - Add a comment on why RISCV64 does not need to set initrd_start/end that
>   early in the boot process, as asked by Rob
>
> Note that this patch is rebased on top of:
> [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping
>
>  arch/riscv/include/asm/page.h | 16 ++++++++++++++++
>  arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
>  drivers/of/fdt.c              |  7 ++++++-
>  4 files changed, 57 insertions(+), 7 deletions(-)

[...]

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 7b571a631639..012554445054 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -895,8 +895,13 @@ static void __early_init_dt_declare_initrd(unsigned long start,
>          * enabled since __va() is called too early. ARM64 does make use
>          * of phys_initrd_start/phys_initrd_size so we can skip this
>          * conversion.
> +        * On RISCV64, the usage of __va() before the linear mapping exists
> +        * is wrong and RISCV64 rightly calls reserve_initrd_mem after it is
> +        * available where it actually resets the translation that is done
> +        * here and re-computes it.

No, I want a single comment that covers both cases (and the next arch
we add here). Something like this:

__va() is not yet available this early on some platforms. In that
case, the platform uses phys_initrd_start/phys_initrd_size instead and
does the VA conversion itself.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
