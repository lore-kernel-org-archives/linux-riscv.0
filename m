Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BC9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0241160BD3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0241160BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6h2XIDX0BRbzSnhyudnteiGccfBUadIOIkwM456zU8k=; b=PYX2arEvQHRJfs
	Yy5sQZrNS2y8avOL8vsjTJQAoOlo/eAtKkjGZD2bE2cY7JVcup582e1BprKdo0qdUX+GJDjCBoxpC
	2/xYO5fotmbrTXZq5OFvaldLyS/XVznxeLPrQyuufA2Nq4oi9hZuwlzwSvt2wQGT25DTj4DjTL5zN
	t0vOGX4J8s1lBBtEgzuxOYmxZGO9zWjhKuLwqUtGN2YKDZrrruoS5w8XTaiAnvmvc7PYqTZCAG2AG
	ctCeadqFY5PoyQFWYMiBZ5qzQOivmPhnSDOebGb79ilIvQQdF8R4ml7nG9HAEzGcuTdvPsWlUhUjj
	xnYc+DJIYO9XyfaassHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwfR-009pM6-R6; Mon, 11 Oct 2021 14:52:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwfP-009pKU-Bn
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 14:52:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r10so57145169wra.12
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5acyx8mtWXW7VMwQQTn2016+YkzgOn6sSwlU3dh0rXE=;
 b=FzkiXRZ5VhkrJM6F+VlDWN8+7gpi+N5jpIJyNhMNGX1Pvie6baSCXvEOq//F5INNoK
 CSCWIdPcK1UoliuPOdY+HFIy3KxSyxzB5argZRa39cHIOQsRnl+inw1vcZQE+Xtnrj4L
 pLxGC7BgTTcnXomAGvKpb8/rfE5bZ83ENw47muAxNScAmQw9cf9KZT4gyccNQTooDwH2
 24xPNp6zl0NOWVuLTKunM16xgJqkaZHdO/XUNtfHExzPP67F4eFGd2T2cmOlxGP3QV84
 MYgTemob4zvzvDW3dxItlyTAMA5QbciuxpHhSEhSIlarubIbIdUsAvB51MatL8sk2h1m
 NYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5acyx8mtWXW7VMwQQTn2016+YkzgOn6sSwlU3dh0rXE=;
 b=YTUfyzqWcO3r9oSu7hMqvioNnRAnSg7Apk+I5VGLhLpFVdXdJxecJIrKa05oeA/gwC
 tlwf2GAUX7P/qgL1MC8snCZhcSR/vHj1hxdvhkT8iNoeCAfM0RCHISIWpPVmoKWOQAJd
 JbpyN3Iia0pXxrFoGOLwA0/aWZsqkyPYHWra5YTOaSn2yvX3RfCxd0U7Wv9McAG8z2LB
 rpv3e/HUJ/grbWPc9JWvURcz49hx3LDjqaaB0m4lvJRMNq7MCC6vCC5tDvTKcW9TqMos
 sFMLJGlgboSMPzuCEH4BOQvtS/Eo20jNwaM3V15r0YkTVgiK+JCqSrDxyMhUP4VRl1ap
 kSug==
X-Gm-Message-State: AOAM531yloHeoLmSVM1Rf1aibNK9mefzsDpIEXID2qfRCipD9fVVzVAy
 cxyXNmgRT9MlrscwRBnS8NC3gAmHOKwxdV1CsGyl7Q==
X-Google-Smtp-Source: ABdhPJyny/1ehYP8OU2mHUCswZL621CNkDqilAKZiJavzBHnmKYteFSk6vwdGZcV8mKtKOx7X1JSRF0kPmdXzGd77FQ=
X-Received: by 2002:adf:e60a:: with SMTP id p10mr5880295wrm.306.1633963956181; 
 Mon, 11 Oct 2021 07:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211011132431.2792797-1-guoren@kernel.org>
 <20211011132431.2792797-2-guoren@kernel.org>
In-Reply-To: <20211011132431.2792797-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Oct 2021 20:22:25 +0530
Message-ID: <CAAhSdy29awBS7cATQjGvP1nqC_aYJgKvAQBxMxvhJAOK7VPr9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: update riscv plic claim-mask-support
 property
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075239_473479_EF611ED2 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Oct 11, 2021 at 6:54 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add claim-mask-support to control riscv,plic don't call
> unnecessary mask/unmask operations.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 08d5a57ce00f..f32c1792604c 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -71,6 +71,8 @@ properties:
>      description:
>        Specifies how many external interrupts are supported by this controller.
>
> +  claim-mask-support: true
> +

This DT property does not describe HW in any way, rather it enable/disable
a SW behaviour in the driver. IMO, this DT property should not be added.

Regards,
Anup

>  required:
>    - compatible
>    - '#address-cells'
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
