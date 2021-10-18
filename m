Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B44C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F361460EE3
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F361460EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxKefDP2NPCfueoxAhJzr8EjCrYO1LzJkBmdrif/hGE=; b=JxeL3VpqjKUUro
	Bftyu8wJLCA6duM0Y7sruCj6d2wuabM5uVRag9MQSbNJTGjVtvlZ3P4ydbdXfcloYOrUY6vDOgeDD
	PRJbDuPG7L/T3vg2SVu7X9gt8r0pFzzMSOoowEmjnnOfkQMjg04JYFuQWUyzCsa1S6ir2qCiBvK23
	vad89HI3z/thT4CsRGkx6VO5DTUduUqwDtvYIdPzEnPZhMMsLqouWHRu/F+Jk5i8ts3UH0srUL6gS
	24vN7Z3S7tXFonE802OHwmV7EzhbPxpSWPbFwwS2xT49reyyfl96ttIqVzfxwNdCJzElo52FGfnZJ
	b+E67U2PpXdIt2WeQ97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcLFQ-00ED0v-5N; Mon, 18 Oct 2021 05:31:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcLFO-00ED0M-42
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 05:31:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id i12so38959056wrb.7
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 22:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kalz1nB74nozhEOhe3SpsXwwy/AUBS/hhCESynMhNCg=;
 b=vcm8kDbjfXcP+AsgYBDSK0JwgDRDUKU8iV6wkORf60lcgB+4553Zw9mxIyEuTT+LRR
 N2alooVlhn4UFgX4r09/HpuGxakyiIevsH0F95QXCDEyVBWdaA3A8T0u1VDeGZt0IftK
 5L0sjEgKhVHRD4XE9WDsYZyaSYQa/dw9nE5Kfi6W9XsBcEWiqkS4HTtOmFgcpqBxb9+S
 lPT7a08caCnGFa6qOtK6usXZuD//rIrWyfSpcYXU+W0Knj74pMiCKf3mgbyiO14ZXNrO
 fjQUtfZcAxOI+SEK9PrJ573FueEuFzlXw8XBjMPmTqBX+wLS8DKmBYEvbqeEMvmbkBDt
 SRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kalz1nB74nozhEOhe3SpsXwwy/AUBS/hhCESynMhNCg=;
 b=iqiAK7cOGsnJvFQ/ljVbLgGLV1ulBmrJqh7xOpxIzMT50LqO6rdGT0HT38Q12+tL0U
 p8ZtYeFjnxfICra4VRqnK1fSy6Sv8Cn4Xe348j/F6ynYQP13+KR03qoAAsogMQaxGS9S
 d3WDpGo2oP77OJy1hLgUGI6qyrintT9Dt0lZ1piSdmETwpcG6NyVSQmPb32byDz55FIu
 Qhk1+WWHtwOdqDxgvxZ0fR4a0+VBTrQ9T0XP+ZrlK7jPsMHxTj5wSZVEKMhwe2Oucnev
 +Ru3upYArHCrayl9qU7YNamOWXJwk8rUwzkKKq7yRdC7NofbafYteSQqV9y8k4iIDIca
 FhwQ==
X-Gm-Message-State: AOAM5331StvflCZsd1mr6AqajTWsnLfm7flgjXCuSqwlwPGKnB+zU3FN
 0s6oD9dRTZbRHVtYmXfgiHqlEkJztVkdLa1bZ1dE8g==
X-Google-Smtp-Source: ABdhPJwk8c07pKaRMyt6V2ad1dl0e3RpJwQZ4NmkrRHE0QTXVoEocZD651tPbUlpLVG18tBS8aFKk9CL8zyHqFQhh9I=
X-Received: by 2002:adf:e60a:: with SMTP id p10mr32309485wrm.306.1634535100133; 
 Sun, 17 Oct 2021 22:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211018052238.522905-1-181250012@smail.nju.edu.cn>
In-Reply-To: <20211018052238.522905-1-181250012@smail.nju.edu.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Oct 2021 11:01:28 +0530
Message-ID: <CAAhSdy3-hgdSH-B1cfO6C+5Fi-_DX8-ycRHi_ovVOzae1sRGzA@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix misalgned trap vector base address
To: Chen Lu <181250012@smail.nju.edu.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vitaly Wool <vitaly.wool@konsulko.com>, Sean Anderson <seanga2@gmail.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Zihao Yu <yuzihao@ict.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_223142_257934_6BFB7B2B 
X-CRM114-Status: GOOD (  15.54  )
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

On Mon, Oct 18, 2021 at 10:52 AM Chen Lu <181250012@smail.nju.edu.cn> wrote:
>
> * The trap vector marked by label .Lsecondary_park should align on a
>   4-byte boundary. If not, CSR_TVEC may be set to an incorrect address.
> * This bug is introduced at commit e011995e826f8 ("RISC-V: Move relocate
>   and few other functions out of __init").
> * This bug is exposed with an educational emualtor.
>

Please add "Fixes:" line here.

> Signed-off-by: Chen Lu <181250012@smail.nju.edu.cn>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  arch/riscv/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fce5184b22c3..52c5ff9804c5 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -193,6 +193,7 @@ setup_trap_vector:
>         csrw CSR_SCRATCH, zero
>         ret
>
> +.align 2
>  .Lsecondary_park:
>         /* We lack SMP support or have too many harts, so park this hart */
>         wfi
> --
> 2.30.2
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
