Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C970C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2EA60F0F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A2EA60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dXW1UMEOzOg0njxohkPbRZDkcLJeVa47c3OoFPsOoQ=; b=iiCCHDdfJcKGif
	OARAFXsPPfkPTp1BmSKlQJ1rl8TsQhvPooc6hoGEbfdwldkM3BS+L2piC/t3K7Yyc6F02Xin9XAXA
	HOGnhpLVJVykuIVogCKq0D56XsiRvWHDaN2NUVXiUPDeI4PFZhBqnQprPDb2w3lOKgKgo3yEze/vx
	EjCMjdDSoGHOiaCTii9fdoNyOgO2X7B30kt+uIoJS7mFd4vCgwg92c6jxLEQAgKUZ/8UcqH4bhptB
	AxWWYOLvmiNOipyKeSNoMeeA8lPs6gUKnPLElf1T7FWtlsT3VN3vZwhM9NJS1cklDVEpRxTBYCXvq
	Q2i0jCuAL9gyknLEAroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNt3P-006AwQ-V9; Wed, 08 Sep 2021 08:35:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNt3N-006AvG-06
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 08:35:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id n5so1966655wro.12
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+gTvqPkBS/9NQBkBlzTyY1pPZIuXVfqF0gdAjXvmEQ=;
 b=wDveK5lAB6l1NMxSINMMJExaTElhC1Hadv0ygYAfqTxaaYMv3IySUTUjp8bzuOPdRa
 bMndFJRdmVlulEHWcXp/LnteEs6vsNeOY8CT4htoyWxrJ74sTlvSEcRcZYgqmPILmOgc
 A4YtqmDEVblPPqigSHeeg7ICEqSpsHoL+p3C+kiue48QmlrgGL7sE0GJBJTwLjbOXfPl
 zJv9eJtsccvxTHkrB0VgN6p+n3N0t44AZxg77NZHqqyxv0+iSx2wngp0tllluH8IfgqJ
 G3WtqLaUK9i4s9Jzl6JIqkwOmtk7byhNg775DAh2t0Kjhwx/p35yVj+EesJNoCQpB2Rw
 NnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+gTvqPkBS/9NQBkBlzTyY1pPZIuXVfqF0gdAjXvmEQ=;
 b=HvrHRF7mSEis0sDJEP02FOOjCsIdop2tY8/EMAjIVU4LZJ6J5mSI1NQKclBTYKbwCv
 2X0b2r7YvWC/tyoEUlkOwASg8rnNnjQo04Q+VOfqXmi4zjjUuIidoK65DW7Fpoof8yna
 2uLEETPDvUv0Dx73rVKrWQzqCD3giLYmsNjUdfOxofoTZDffrkxgf1PA2G2+yDRI+QUm
 E/kRwj+NfVSHdqYH2FTEba2sKf5WNa/T2pV286/XSZ9ksjTy/Abx8wbVfmILtIrK1J9B
 e4ZJJmOxfbMnrHRWLMKWB1xtKCMl5spF0jjAU+og6BURYWiu6nB3x1nY+0kItHR/3/dv
 IFwg==
X-Gm-Message-State: AOAM530B1CFY6iSMbYxJo119PTvBwpdTMOn+Ae6/j4PHDBI36eXKMgaU
 6End0gA+APGa2yXz2xlQXAcldqtaO9z0IcTR7Rnq3A==
X-Google-Smtp-Source: ABdhPJxnmqEbAAXw4ZZscbrlTqRG8a/a1xTdLDZhNeb4FqiNF0dwRr/GBN9JwQCWTsqYDoM7El3dNiZ090+mHhCE49A=
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr2667202wrc.306.1631090129589; 
 Wed, 08 Sep 2021 01:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210907200254.467375-1-vgupta@kernel.org>
In-Reply-To: <20210907200254.467375-1-vgupta@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Sep 2021 14:05:18 +0530
Message-ID: <CAAhSdy018QJ2hdqL2BSZXV81-CVbTf_g6chJSHM4UH2EhLUpCA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: don't advertise 1 num_asid for 0 asid bits
To: Vineet Gupta <vgupta@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_013533_124935_D42339CD 
X-CRM114-Status: GOOD (  21.64  )
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

On Wed, Sep 8, 2021 at 1:33 AM Vineet Gupta <vgupta@kernel.org> wrote:
>
> Even if mmu doesn't support ASID, current code calculates @num_asids=1
> which is misleading, so avoid setting any asid related variables in such
> a case.
>
> Also while here, print the number of asid bits discovered even for the
> disabled case.
>
> Verified this on Hifive Unmatched.
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/riscv/mm/context.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index ee3459cb6750..c8c6f8831a3b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -233,8 +233,10 @@ static int __init asids_init(void)
>         local_flush_tlb_all();
>
>         /* Pre-compute ASID details */
> -       num_asids = 1 << asid_bits;
> -       asid_mask = num_asids - 1;
> +       if (asid_bits) {
> +               num_asids = 1 << asid_bits;
> +               asid_mask = num_asids - 1;
> +       }
>
>         /*
>          * Use ASID allocator only if number of HW ASIDs are
> @@ -255,7 +257,7 @@ static int __init asids_init(void)
>                 pr_info("ASID allocator using %lu bits (%lu entries)\n",
>                         asid_bits, num_asids);
>         } else {
> -               pr_info("ASID allocator disabled\n");
> +               pr_info("ASID allocator disabled: %lu bits\n", asid_bits);

May be use:

pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);

for consistency with the ASID enabled case.

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

>         }
>
>         return 0;
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
