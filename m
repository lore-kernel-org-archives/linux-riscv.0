Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2474EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zo06qVkt2V7xIZHDa10uUhjsWvvg9/KAo3d4gF/CYE=; b=cy//4xDOk9e9fs
	9kHYzw5sE6gAymI4/7a6ttqOTEdorX5Z76CTydPe6nDQMOptXWdzx7oLU9lZxvVlqiJtn7yZJ6dvN
	klvc8B17BSK6Q79LR4teAdoIIT/5nhCtWPorl7ZejVCNHI1prQ9SdpK4ETU31gQBlp5+5+iAdJMdh
	CLSkIBVviVWAEqExiYNcgCS3+n6T9huZkJRpKWDExIYrm2Km4UASQcJqJxszyCz7YawrcwuLA1A98
	Vh/8WgCdHNMn4mNZlhKct1MmaCHUWWgnAOCjXJivDfhnmMTvj8NFooeNK8jMfbaBpIi1WkGgvGnFt
	ik9/F/KQo3e9Q5Q7a8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3ui-00E6Ev-9m; Wed, 05 Oct 2022 12:54:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og3uf-00E6EM-Ub
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 12:54:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a13so22884390edj.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+/BpHNUiX7JadelGxCPFlNmOoEOJtPwIvuyPjnCDWlw=;
        b=e6fMM1BObwqE0wCzwzVi+O9wL9KCw6rpt+K5AX6yF1M3XtoO4odTQWR/BN64rJMnLu
         O+qTNHQH8wGgicBOpPJlk0I2X4fyHJ8K40TB6xXmPWAP77uBxYD5QJusdMe/r8ZBmm+C
         UkaqYh7sbI/hwmtTzZ482u7hK7qz3ZqsQ9SU5vKT9FbwPzuHKVwMII8q2u4o1TDSzHDi
         Xz3j+33pbpb/abtNZy14KFzbpmfsCwOtgAIUOi5z3VQuVmPxBQEJdVqOYiyAm9WPRBXq
         WVc9vhXOcr4vkm+NyMhIdpX+QpCjKKa0U2fLjtSKEQoRT8C53PuERGoAMRKBmDhqp/fH
         rbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+/BpHNUiX7JadelGxCPFlNmOoEOJtPwIvuyPjnCDWlw=;
        b=e7q6Scl0wMIIg/TBZ740KoU80DzvALDV8DgPnWyOtIMUWh0nq4X7WQbgDEvnw4qbuj
         1PHfPH14WVpSJLzm8pDUebZG/ViP3FdzxPagf+0xqDzFeum4/u9RnAlXOoYTO4ae5rNV
         2h1s1P1UXxthCN05AtORoL8ERVAhm81W5Y9AplpaD9qpBgozKAlg6bchVldRAQ+AB8CD
         zV+axsvErdKvhn+FGciMLAp0S4jCQMpWJja6JK+ToOMfkbdJtFULgsOKecDCmKgEoFhv
         /Vhu+1yCur1ZRBa9WwYQZyNx45Glmjm3elX/uT+K7TpEKH33rPii19Bs8lTUG93oJppO
         mi+w==
X-Gm-Message-State: ACrzQf2aO0iytLmiHLPJ/RN8iZfw//YGyiW/Apw/OQyOLTwed0B3+soD
	lrruN2evOmigLNCqHRXhf7mJVCUv9zM9N38qOEE=
X-Google-Smtp-Source: AMsMyM68FFkOONmspqWdcj7OVMrZtTASnunn2gJ0ZrCK2kwFFJdpz25HPbRCfns2zjcZ8yq0n+iRi5/tOZOg8OBAiIw=
X-Received: by 2002:a05:6402:50d1:b0:452:899e:77c with SMTP id
 h17-20020a05640250d100b00452899e077cmr28041684edb.0.1664974451331; Wed, 05
 Oct 2022 05:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJF2gTQuSX9idEyNmGRwpAsSP8V=+QKQ7UAp28T-seM8rbkwOA@mail.gmail.com>
In-Reply-To: <CAJF2gTQuSX9idEyNmGRwpAsSP8V=+QKQ7UAp28T-seM8rbkwOA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Oct 2022 13:53:44 +0100
Message-ID: <CA+V-a8smkDmQbz76sTA5XfUm7bkY4Ee-L5xYW+-xRWkE1TYiAw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_055414_022069_45682FC7 
X-CRM114-Status: GOOD (  20.71  )
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

Hi Guo,

On Wed, Oct 5, 2022 at 2:29 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Oct 4, 2022 at 6:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the AX45MP core, cache coherency is a specification option so it may
> > not be supported. In this case DMA will fail. As a workaround, firstly we
> > allocate a global dma coherent pool from which DMA allocations are taken
> > and marked as non-cacheable + bufferable using the PMA region as specified
> > in the device tree. Synchronization callbacks are implemented to
> > synchronize when doing DMA transactions.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> >
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> Seems Svpbmt's PMA, IO, and NC wouldn't fit your requirements, could
> give a map list of the types of Svpbmt? And give out what you needed,
> but Svpbmt can't.
>
Sorry I didn't get what you meant here, could you please elaborate.

> Here is the Linux dma type to Svpbmt map:
> PMA -> Normal
> IO -> ioremap, pgprot_noncached
> NC -> pgprot_writecombine
>
> How about AX45MP?
>
Svpbmt extension is not supported on AX45MP (reported by
riscv_isa_extension_available())

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
