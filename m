Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0242EC4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114BA206FA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgAu/Bzh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="jdKpI7zj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 114BA206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=38GzrUEZpMd7n60Ghc50gOtpy4FIa6AY0+tgY9OoMi0=; b=cgAu/Bzh9o+YmYqH8CCznE2kV
	zTJzCTR8KXSNz5fLtW4TSmHqiH/3YykJTvKOrcBxJ97j+gv8vFHDWjA2TtyAy8CNJ5xgZOeKqNwVs
	KaMxz8E7/Jh93JvHzSXIRM3zbrGcDm9OJAvY7hnttXj/Jm6IB+QOo+BopPCap/XfazB9TUWYHfCvB
	+9eqcWsd1/89pFYswaE2MhGb48UjJrPXMq1FCeBHNY76AZVqWjdBi3x+9FPzWzSqSDUR9X1ap0BEa
	AtNVIcir74Y3vcG5lkGK/9IrOOISW3wvcVzjbaOJSyK4aV8qeAlDY/+2Z0hxZnGb7CaBIUeiZ8hKB
	4TvIFRoog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOI2x-0002Es-Tm; Fri, 02 Oct 2020 10:12:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOI2w-0002EL-2k
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 10:12:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id y15so1138254wmi.0
 for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2020 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/SMXR0WTC1i07sAp2rBkJenFVz4ZRXCT9v8+fEk1HM=;
 b=jdKpI7zjeEpre1vYKl1llHg5roONWPJQ7JqKVv4Wo2qu1suhAE0WqQM/HfxZ4v+Kcu
 /uZ4IgzzHXpzPn9a1kScghdKdKvT640vpxoDs48TH1ihs6yhvT2IFiw57Wsnuxu/Mo0w
 6TgD2Ed/NRtog6sM1gzWjqg9I1iCNm8vLn0Wvgb5687+eqVeGmZIw5oUi5Gfz7ALnNl2
 2Gj5dYpRebGJ9tNEXWrKwTcApfuAxHZGuVWaRHys0G2csZI16dkp2dIVX/5LEAQW513i
 1ES7Po0MZsPPCoQcuPTePlgIs2qj/oJTfxFOOqzt2/mQ3Tic7iEPLDLforbotWP/cuWy
 L7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/SMXR0WTC1i07sAp2rBkJenFVz4ZRXCT9v8+fEk1HM=;
 b=HNKUs50UVBgssLBRJ9mFg77CWy6lK0BGwUrr8O919hD0i8mLtExR7yUxtLjyCgMilS
 Iir4hMz0bEaFP2FtO4xdPQjamzSJBcYzePy87jtwHOQdVxeTAP0VVpi8V0+a5P5jNukJ
 DKoC1f0ITp2gYsLnsiOfYYlVIWfofqgUn20jOZXdqjBriaOdkUkQ6Dvn/3J0QpxMSkff
 NUiQnngo5GG9hoHo7JkYZAY0QtaaS3cv6yd07jlFKkCg/sW3vTMq+wh6hL6z2fQqQHJJ
 yk1tdGLOnHJcA7xthuzAUZz+ZDISeWZ5w7dPm42/fsAyraLug4X213+0rXLos3nFpx1Q
 J7Nw==
X-Gm-Message-State: AOAM531jL5fCye1w929onJQm1H3zsi0rsMm549AI76nDkWL3pxVCDe/I
 NlYrO3ziDaBGrOPZBINKuQMhpxVBHNvqNRFO2TMRkA==
X-Google-Smtp-Source: ABdhPJzjtu2ldCXGUZ6c7WUNaHsuBBr/EaRswVbZdK5JyiNzslXpkSJaUDTMRj5g8PDDkhAQ7IDHk2IKQu0FN0+hABs=
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr2106354wmj.134.1601633530944; 
 Fri, 02 Oct 2020 03:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201001190456.2860155-1-atish.patra@wdc.com>
In-Reply-To: <20201001190456.2860155-1-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2020 15:41:57 +0530
Message-ID: <CAAhSdy11LqKFGA37cz8jYw9UtT+Niu7qKFm38jHP=49OYs0PFw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make sure memblock reserves the memory containing
 DT
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_061214_287766_EF769F81 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 2, 2020 at 12:35 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, the memory containing DT is not reserved. Thus, that region
> of memory can be reallocated or reused for other purposes. This may result
> in  corrupted DT for nommu virt board in Qemu. We may not face any issue
> in kendryte as DT is embedded in the kernel image for that.
>
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> ---
> @Palmer This patch is applicable for v5.9 & before. This fix is already
> part of the "RISC-V: Move DT mapping outof fixmap" patch from UEFI support
> series. That's why, this patch doesn't need to go into for-next.
> ---
>  arch/riscv/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 564e0be677b7..cabf1697e748 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -510,6 +510,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  #else
>         dtb_early_va = (void *)dtb_pa;
>  #endif
> +       dtb_early_pa = dtb_pa;
>  }
>
>  static inline void setup_vm_final(void)
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
