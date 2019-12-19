Return-Path: <SRS0=oSsB=2J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9938C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 06:54:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5D42465E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 06:54:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNqe7U46";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YDfSnniH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5D42465E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2ZYEST654EPj+GcWTNQOV1oMctV/osDgh0tGsFOxh10=; b=rNqe7U46VcR2voSpz86vQUbcD
	9hOkzWOLSiweDJ5JUehl9HnsfesvvIAFijEdCLgH/JV04t4T0Jh4xMqU+PJ0/RL9woZjY/f7/2kuc
	cC/OfRaCrB9tI46te/8A0vW3BsT6iCN+BY3utSRtjGuCSOCUb+Ije4q0s6ioeDKTieGvKjYiWEhE0
	XpUTQ3KNA2hacwbnxYumkAiAZQ8tCAdJIPLObczeuB/0Z5LnIs3sQrFIv3DRfohvGZSjA6Ns28Ht8
	NoIfjm56OOOeFRXHkvM/79eLVdY65XLXPhRFLNKFPoP+/x55kv6IdSnOsohqpDCmw7dVTS06YECpM
	jyyQTYbXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihpi2-0004EJ-EM; Thu, 19 Dec 2019 06:54:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihphz-0004DC-Fv
 for linux-riscv@lists.infradead.org; Thu, 19 Dec 2019 06:54:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id 20so4292521wmj.4
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 22:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZYEST654EPj+GcWTNQOV1oMctV/osDgh0tGsFOxh10=;
 b=YDfSnniHMo1ze5p//Ojnq6p+aH51B2xTum5mra74NQ7gI1fYwq8c8SbumlhaxTc5FP
 Hxul15bxq5xJrl4Nz4AXI3oIoZJ3i+E+QWBbcjPCVcFyf0CLhyswHOONKFQIDtNXlm3p
 XHonHMoygIaQj8ugJNmIJVYNIopO11p2TUJS/kx0DGzbSyiTpexkWyWMmhr65dtM+Z1Y
 C5kiwkyCP9WCyr2zvybPcTyVynRLUFTAFzlwjrWglx1CmUzvMxOSzbN2zNFdm1SEZhMf
 RFSs2lpQQ9HnSaAST5m9WXIbDq5XnV77+N3asSWnXc7RRIaBJdOy7jf2TPpf96G1XELc
 zg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZYEST654EPj+GcWTNQOV1oMctV/osDgh0tGsFOxh10=;
 b=GzgZpBWdb9QL81UDLyPf/mc/S+3jMQZcFxpxxUJ2bylN0CZCDSkFHEXeE9ND8Vfgq9
 znnJpjNwHcw+tYm8MgC4Jz5rXaKGcqPAS13YOuDxixtK2b3HUmYxmsfiDMhNzbbDP5Vw
 xN3LMmmI+5mlCvTjZL0QE9TSU0DhEHsrZALvijU6UjZiiUWgeRQzUx/4PSM5tKoFKanD
 YYK3PRKfVGXArK0hEQwB+G/pwF3l3+LNrWoA0jsqr/VKRnRFTn/yT0/WdfXKcMAvGbgr
 HvmFdo2QvhbqIR+G0+rOEy8uClpsNsJgi6NiNNwOTosJEogchEKl4Nq34+Mtqnq3QGI+
 83vQ==
X-Gm-Message-State: APjAAAUggHYJSAKUU34fNz9hlZNxBBTASvKL6ygAoEKurWku4s0WBKpp
 yaNMhPgjMZicFQhBstts1Vdr0c1kRcBHEoR+Xu7Tkw==
X-Google-Smtp-Source: APXvYqx9Izz/vOq2IgwO77jkGILqeBjq3n3wK6m4tpwlJ37kHRwFBLZQo1SDNzyxJjWHNS7oSufxMny7B41SHpvCSMk=
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr7793295wmc.64.1576738488999; 
 Wed, 18 Dec 2019 22:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20191219064459.20790-1-greentime.hu@sifive.com>
In-Reply-To: <20191219064459.20790-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2019 12:24:37 +0530
Message-ID: <CAAhSdy0mxfA=VbDF0E29sVgHd4cdAvq3G0jeMRCbViaVWpnPsg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix scratch register clearing in M-mode.
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_225451_601067_22803655 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime@kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 19, 2019 at 12:15 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> This patch fixes that the sscratch register clearing in M-mode. It cleared
> sscratch register in M-mode, but it should clear mscratch register. That will
> cause kernel trap if the CPU core doesn't support S-mode when trying to access
> sscratch.
>
> Fixes: 9e80635619b5 ("riscv: clear the instruction cache and all registers when booting")
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

In any case, we should always prefer accessing CSRs using CSR_xyz defines.

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 84a6f0a4b120..797802c73dee 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -246,7 +246,7 @@ ENTRY(reset_regs)
>         li      t4, 0
>         li      t5, 0
>         li      t6, 0
> -       csrw    sscratch, 0
> +       csrw    CSR_SCRATCH, 0
>
>  #ifdef CONFIG_FPU
>         csrr    t0, CSR_MISA
> --
> 2.17.1
>
>

