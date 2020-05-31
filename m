Return-Path: <SRS0=oXW+=7N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAD1C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 01:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8642073B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 01:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKKXC00T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zjkQad07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C8642073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4l38koLnhzyQ4ndkN0TUtPQ4teOjqIMakPsvgnmVO5U=; b=lKKXC00TAm2ArzQKbtbjYiAYy
	QZznRy7auEvLVK6RauVz3t94x2UshhxcfHlpMcJd+jv3MobkU85Y6Ss9+wKqDDydFlpnG34e/rI58
	zNTzovkGnl4elSW7843XXk/6MWilTCT1r/ynDXzQPocCdYlp9DcH2TYY+SUSgMM8sbCk/hqjz85sd
	TRASWddf4G4M+AIlBegDVNVkaqphDZYbx25V4S8hggX3iLZ+vcP/eewyUFmAMv2nJ9Fbmp9B9dfZm
	MbwoJXo2yiTRAwKIpR7Ed5j1T47xQY4gJQJrBwfajm0k4JDfUfTymCXhs55f3ymCAikvQYqgtWVSv
	iW/BWSHvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfDDO-00040e-0X; Sun, 31 May 2020 01:56:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfDDL-00040I-0L
 for linux-riscv@lists.infradead.org; Sun, 31 May 2020 01:56:40 +0000
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3E73207DF
 for <linux-riscv@lists.infradead.org>; Sun, 31 May 2020 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590890198;
 bh=aV7Yv2k4mvodEUB9KbV6pGSLhLcWgkbn0lTY/BBREVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zjkQad076gevko7EXf7J/BHhctHOSkrzb1I5EtvWrEIi+qLxpO4iF5ouDE+/HROLh
 QePnLWoyADhuFORb4RhxmsrL/bTV7eph1Bd/315DvGfSNTxTznZ2/N0RxXr8PzzNLO
 APxvUPK/iiIXng6H5N/U8vk5sG7corvWzB7AFnFc=
Received: by mail-lf1-f54.google.com with SMTP id z206so1917818lfc.6
 for <linux-riscv@lists.infradead.org>; Sat, 30 May 2020 18:56:37 -0700 (PDT)
X-Gm-Message-State: AOAM5305uJoEClFy3p4HWYxM0mdYNcKrfi8ImK+zgIaLSRw7DBGz9EIO
 Qrum5XxtOZUIqo5xlc3x2n/K1DLPNP9B+FLXc2E=
X-Google-Smtp-Source: ABdhPJwHNdagqFyLRCjUuwXRrjjZ5K9b6OQEZPVGRzzRKra0hLRV9+eJ+7l8PkMtyn2Csl/7CaUuJ4aI9bOztFfghjA=
X-Received: by 2002:a05:6512:3291:: with SMTP id
 p17mr7856343lfe.41.1590890196106; 
 Sat, 30 May 2020 18:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590474856.git.greentime.hu@sifive.com>
 <fe966314eae51a5089033f7186ac86c39719e0a0.1590474856.git.greentime.hu@sifive.com>
In-Reply-To: <fe966314eae51a5089033f7186ac86c39719e0a0.1590474856.git.greentime.hu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 31 May 2020 09:56:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTnLNmNUvDwRSsmD9auaOGuqYXjuucKSyXZQKoEWEq4Ow@mail.gmail.com>
Message-ID: <CAJF2gTTnLNmNUvDwRSsmD9auaOGuqYXjuucKSyXZQKoEWEq4Ow@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/13] riscv: Add new csr defines related to vector
 extension
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_185639_088297_7168BC69 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, palmerdabbelt@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, oleg@redhat.com,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Greentime,

Why remove vxrm and xstat ?

> Appendix B: Calling Convention
> In the RISC-V psABI, the vector registers v0-v31 are all caller-saved. The vstart, vl, and vtype CSRs are also caller-saved.
> The vxrm and vxsat fields have thread storage duration.

As spec 0.9 mentioned above, vxrm and vxsat are thread storage duration.

When timer 's interrupt coming, we still need to save them in context_switch.

On Tue, May 26, 2020 at 3:03 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Follow the riscv vector spec to add new csr number.
>
> [greentime.hu@sifive.com: update the defined value based on new spec and
> remove unused ones]
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 8e18d2c64399..cc13626c4bbe 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,6 +24,12 @@
>  #define SR_FS_CLEAN    _AC(0x00004000, UL)
>  #define SR_FS_DIRTY    _AC(0x00006000, UL)
>
> +#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF       _AC(0x00000000, UL)
> +#define SR_VS_INITIAL   _AC(0x00000200, UL)
> +#define SR_VS_CLEAN     _AC(0x00000400, UL)
> +#define SR_VS_DIRTY     _AC(0x00000600, UL)
> +
>  #define SR_XS          _AC(0x00018000, UL) /* Extension Status */
>  #define SR_XS_OFF      _AC(0x00000000, UL)
>  #define SR_XS_INITIAL  _AC(0x00008000, UL)
> @@ -31,9 +37,9 @@
>  #define SR_XS_DIRTY    _AC(0x00018000, UL)
>
>  #ifndef CONFIG_64BIT
> -#define SR_SD          _AC(0x80000000, UL) /* FS/XS dirty */
> +#define SR_SD          _AC(0x80000000, UL) /* FS/VS/XS dirty */
>  #else
> -#define SR_SD          _AC(0x8000000000000000, UL) /* FS/XS dirty */
> +#define SR_SD          _AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
>  #endif
>
>  /* SATP flags */
> @@ -114,6 +120,12 @@
>  #define CSR_PMPADDR0           0x3b0
>  #define CSR_MHARTID            0xf14
>
> +#define CSR_VSTART             0x8
> +#define CSR_VCSR               0xf
> +#define CSR_VL                 0xc20
> +#define CSR_VTYPE              0xc21
> +#define CSR_VLENB              0xc22
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS    CSR_MSTATUS
>  # define CSR_IE                CSR_MIE
> --
> 2.26.2
>
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

