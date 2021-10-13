Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B777C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 05:12:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71FE60184
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 05:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B71FE60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7mRvrx5u58RQEnNPQa1ArRkKFigVVrslWGGjEa2vZg=; b=GJMMfJz4FnlvNA
	l+Hdf94T6uaiHMR6EtTSqwM8ChUq+OyfH5E8pF4v+rikoSwonX1cLsDuumjyibTsR6GlHDZGPwR4v
	ZaFCSvHjtiKAGuHitU1rTr6WF6KwV/4p8lM2OGmZC5oSunp/EKgf4pp3Pbqj10hrfKY4hg1zwdmDE
	rYFqDIba+7p8P5vIksYKoYeLAcjSMSLOwknWVAUspF7GKq16z1Gi/hwbQAWODPhlUo59MSs9lxNBg
	cBjG3JCIrzh2yndIh8uPr69Fjpa34tR/BBNRVB5ImEny98zV2Svri/21LsZdz9BUrH23CJf8LuywB
	TrHSO3+BmXZhyWQJ0wGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWYd-00EsuS-E6; Wed, 13 Oct 2021 05:12:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWYa-00Essr-E8
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 05:12:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k7so3912781wrd.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 22:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oEFV0or7PHUMQMd5+/L2xMc0OUI7R/fEGHl3NgZeoE=;
 b=P6BmYB+k8phnQzRTC3McT5TXQ8SpqX/hpEQgWN3LcU8BGs0jrFnydtG6bmNfoEuK3v
 cosAys/VatlzBRzIkb9in8GJt4YcCKeQeUott/GfXHGoNDxCAv6nMOU6yg9mW+d6TmKv
 iH1IxjgFVNeRJsRcFwvtLuusAhjniK8m2krvcsvLmmvFUtGnR11DbNzQZfpurHHXzQFI
 p2oKSpijSJ3Kt2Qh4bhcZnChgUHkqBC34WIzr5TdBJ9ZGPZd/iqEGbi5LiT9gP5TXtlQ
 ipyxeI5zNq33H8eFNddXucBXn7mCJJMETWx5qBJTUVt/PwQB9qkNaC+jcEfD0jYSKFY/
 378w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oEFV0or7PHUMQMd5+/L2xMc0OUI7R/fEGHl3NgZeoE=;
 b=N2ygc3RtB63Vq3S3c1xCcOxoNg2z9wkVAZKopPrHVkXk5ieNHfxts5BzCTubCSv0mL
 lhen7Q8CdMjS8jXUG7RSetOXwATTjCHdw8xWnpGxE6gXxQ2vUzM32Z+6liv9w8G6/dMr
 7gKBCKhwOqerdCSvNZPI2HGENxd3SqoUVWciXhERQ6kp+tMf4uD9rNnBVw08pBOsWPpS
 nPpWSeMzdG4Z85lr0S6KCFGfHiNVr+tXWUpdTngeKoexmui/3r/ot44NjBFmN3uEVV+X
 0SA5MIMr265E9BJlD4g5tdCB/P7OVzK3fXCFhOMxw2II8eQWgLpKUVLVVM/S81eNzomy
 kUJw==
X-Gm-Message-State: AOAM530+N2VR/jYNk5B7CcekGuaOedycg6YF3TGRBnPG12BrH5feUBEg
 +a1SeEmtTXtb8D9X3GoBVaT9fqdXNCqK7k4p1NBWcQ==
X-Google-Smtp-Source: ABdhPJzdApIqxACjaRv7O7yKEyaAFN2tRl4Gnw+yyNwEBbof7YhRHdzOv5Ct31NM/qV+9/G7APIy6OKxcza/LQfShAc=
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr10363683wmi.59.1634101918493; 
 Tue, 12 Oct 2021 22:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
In-Reply-To: <20211013012149.2834212-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Oct 2021 10:41:46 +0530
Message-ID: <CAAhSdy042JY_Vm2j_d5t4jweS3gf51h30j1O9LXDnE6KkB8AEg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_221200_511342_85590E28 
X-CRM114-Status: GOOD (  18.58  )
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

On Wed, Oct 13, 2021 at 6:52 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add the compatible string "thead,c900-plic" to the riscv plic
> bindings to support SOCs with thead,c9xx processor cores.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
>
> ---
>
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add thead,c900-plic in the description section
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 08d5a57ce00f..82629832e5a5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -35,6 +35,11 @@ description:
>    contains a specific memory layout, which is documented in chapter 8 of the
>    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
>
> +  While the "thead,c900-plic" would mask IRQ with readl(claim), so it needn't
> +  mask/unmask which needed in RISC-V PLIC. When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED
> +  path, unnecessary mask operation would cause a blocking irq bug in thead,c900-plic.
> +  Because when IRQ is disabled in c900, writel(hwirq, claim) would be invalid.

This is a totally incorrect description of the errata required for C9xx PLIC.

Please don't project non-compliance as a feature of C9xx PLIC.

> +
>  maintainers:
>    - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
> @@ -46,6 +51,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-plic
>            - canaan,k210-plic
> +          - thead,c900-plic
>        - const: sifive,plic-1.0.0

The PLIC DT node requires two compatible string:
<implementation_compat>, <spec_compat>

The C9xx PLIC is not RISC-V PLIC so, the DT node should
be: "thead,c900-plic", "thead,c9xx-plic"

You need to change "- const: sifive,plic-1.0.0" to
- enum:
    - sifive,plic-1.0.0
    - thead,c9xx-plic

>
>    reg:
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
