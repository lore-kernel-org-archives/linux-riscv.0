Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC2AC07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmGiHMv17pLYN4fJVZrTiW2npq0MSRiZffl6tps8Wx8=; b=mqvyfzG9oA2yrP
	6b6itPDWRxJuvYwNRuHO4rNWq1Syr3qSSlhquKzESBp/K9eBqa9dTu/QvhGlfEfUkNVLRiGm46uSB
	4uC0X5Y4fyF0TeSkCL3b1H733su6l2cL7/RAv04LgrJzYKN+Xw8uajN0U/muDMlOZstcjcnf2dfT1
	WHbR+IUrXOe9mJu6BB/3FoZzpgXkg13MkPjgmTi1Fuv3xa6mQhSvvdpnknfLz1rFQVLKIvGornbs+
	NWhFrSdgAiJll46ZablhpJ5iG1t22QWyPTOwFUUIL0I9LeIj2IgatZcwXQHU9+rw1JD9y+fyStIDd
	NKZFFLE3c0Qb9yhRE5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocrzt-00631u-64; Mon, 26 Sep 2022 17:34:25 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocrzq-006311-4O
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 17:34:23 +0000
Received: by mail-io1-xd33.google.com with SMTP id h194so5832610iof.4
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=W2BQpTCH8MRwUWScqQRgT6QBfLLj/9g8kWX3PKbjTOY=;
        b=ln5PM7A4qmFShf94iUZ3hjSMZpOSGqMUEfp+K1n1SyB2gVdgbc2XQiWFcxcec4jh35
         DcgoX3Im1qRoO4JQBQ3TxwMLso3cF61OM43YYqx2ElyY93R/5YPoX2OjHVsROYH7Q6ck
         neB5E7ucY3ezUTnmNvVsPlGxRRiYrE2hr63og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W2BQpTCH8MRwUWScqQRgT6QBfLLj/9g8kWX3PKbjTOY=;
        b=2qGVvS+DDZX6W2Kd0LuGj1xfuoICPIKBgrtUctWmsKQpbOJdF15HfTS8B6smQVVxYT
         uOm3ncD5O/3USk3Oxv1YjgYlDQeIU/UfZFaOBM9GdFqt/zH8eCzPzTIpGOPoZfYOawDH
         0Trw5zrG0LZbKJgWVqIwch6c64Wef2kp886lLVE7k+HIpkOwRTL6eBiHL/A7C2ELF2JZ
         ua25VZFcah7Arh2du7hmAg464ra2qsLztyAW+rSt0IZ8as5mUnbVSWMRinL1+PcLuLB5
         +DzCcuWl3i29FF2Y675oTqf4vgOa891D6h6sX5lDlALDaAd46Pr1o3hZ33G2J7Q7eFSl
         eSXg==
X-Gm-Message-State: ACrzQf1DlHV0qMCgTJczVQJb56Ht/U/DOGWAwvrmI3TLXMu6BpBuB8id
	ok2yr0gietkH+4GXrYokPV5BGIrb37RfMHVO39ypY/HXUqw4
X-Google-Smtp-Source: AMsMyM7LslIxJhs/TK7j2BkuzFh7pnIQxGY4jQjteYL+IIsf55ww6g8Ak9eG9mdy3V4Rc4tbZc8k0Eg/MpkTgAZzzHo=
X-Received: by 2002:a05:6638:2602:b0:35a:66ec:8d99 with SMTP id
 m2-20020a056638260200b0035a66ec8d99mr12677381jat.170.1664213658204; Mon, 26
 Sep 2022 10:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220920140138.27210-1-palmer@rivosinc.com> <20220920140138.27210-3-palmer@rivosinc.com>
In-Reply-To: <20220920140138.27210-3-palmer@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Sep 2022 10:34:07 -0700
Message-ID: <CAOnJCUJW2Zp22b7=hwUaevp1fiB1t5Xiz1La5C5yp9yxmOWQUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Documentation: RISC-V: Mention the UEFI Standards
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_103422_460380_0EA39438 
X-CRM114-Status: GOOD (  27.37  )
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

On Tue, Sep 20, 2022 at 7:31 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The current patch acceptance policy requires that specifications are
> approved by the RISC-V foundation, but we rely on external
> specifications as well.  This explicitly calls out the UEFI
> specifications that we're starting to depend on.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This also came up during the Plumbers BoF.  The other discussed options
> were to wait for an ACPI/UEFI specification to be published or to just
> not wait at all, but this middle ground matches how we handle the RISC-V
> specifications and it seems like there was broad agreement on it.
>
> As usual with policy stuff I'll wait a bit for others to have a chance
> to chime in, but I think the wording on this one is at least easier to
> reason about than some of the others.
> ---
>  Documentation/riscv/patch-acceptance.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 8087718556da..08cb92324eaf 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -20,9 +20,11 @@ Submit Checklist Addendum
>  -------------------------
>  We'll only accept patches for new modules or extensions if the
>  specifications for those modules or extensions are listed as being
> -"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
> -course, maintain their own Linux kernel trees that contain code for
> -any draft extensions that they wish.)
> +unlikely to make incompatible changes in the future.  For
> +specifications from the RISC-V foundation this means "Frozen" or
> +"Ratified", for the UEFI specifications this means a published ECR.

It would be good to explicitly mention "UEFI forum specifications"
or
UEFI/ACPI specifications.

> +(Developers may, of course, maintain their own Linux kernel trees that
> +contain code for any draft extensions that they wish.)
>
>  Additionally, the RISC-V specification allows implementors to create
>  their own custom extensions.  These custom extensions aren't required
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Other than that, LGTM

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
