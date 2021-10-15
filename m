Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDB7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 10:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0E360FDA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 10:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F0E360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmZjjoT+xvv5hVesI4ldGJhZqxAs0pYrxbJWaxelNl8=; b=2CXt9wmHJ7PJf2
	m8VEfTyGIG0DS58kr2rIydawto+t1lIVq96KixcoCNf/f2xK6HwKCKHn8awRdLel3u7tFiDBCn9BI
	SyFy99iveF1PAgQDzskBswjEmMVx0XU24AEzCyG0zxViNgtAggYbz3bUbm7GH5Xas3JAu/regIesp
	AT6CL99ec7PAE06y/meTNCo4f6y/FY5GXfwKK4FeDBTqcfsIUrdQrvxfZr20qSPB3vpe98N3W8QIN
	0mBWtlFdvLYLoOSUdgFmaXp1I9MFLedHqP950BrWGZ56udlTEMF05WlB0OYnUnhrHcrHUA9HdB/Vi
	/7X8Rz+T7iAjWBlqN92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKF1-006SA5-92; Fri, 15 Oct 2021 10:15:07 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKEt-006S6h-Ts; Fri, 15 Oct 2021 10:15:01 +0000
Received: by mail-yb1-xb31.google.com with SMTP id g6so21513604ybb.3;
 Fri, 15 Oct 2021 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZTDCpxGbeuWo2eDKtm3bA2A8qW6ZaIJb8O6pyREdQeA=;
 b=Oo9miBv8zvbpx9UbpKzN5puJZy7wQq6nWt4BuBIXYZZsDZdwKmPGjKeWxVig0J0J9U
 YxS1NeNWePdLu5ro2hpjheWwl8/9D3MzSDN7kgjxKsWmqACP+Xn4VjDjo7ORtN6k6dPW
 Xxo0nmVPM2kgaurX2RqeHG5G6g8GieY2Os26DwcIzmUS6hZUibUnDR17MY2zow2pjE8Z
 FBWyGIbVergDurjvgN353Lkvqd8vrFGmSlMY0NdnyvIZRYh5syMm/4uyfwpnFgklCMjy
 8MwzKjWKuVJ3qeCThCp0GayV9E4ktFP/WuzdV/OsZ3FtuqZttx1oVitCV4+G4vf5BDDf
 IaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTDCpxGbeuWo2eDKtm3bA2A8qW6ZaIJb8O6pyREdQeA=;
 b=R8gzabfZ3riICYLj6hktwo+/O/ubUJk9JDNfLvaxISKVeZ3nO5ZZEuKipHr3+PitfU
 fV62E5aLWSeTwjf9CZvs9oBPvmoQm5rUXKLhZ69FXiMEkdQASqXRbMPTWOm3pHgoLw91
 hHPUq8Mh7BNDoVtSCyiMbAMyzWqx2tFP/+i6zV3qjeEWkEICvymS4xFzHnj1WxQNobKs
 tGt1MvdR9k0YSXXgTE/trBOpGDISJeihCrbKrWwjdORvRvsqB0Jw91NIJLRKdYyEsX3C
 /mnKIbsAQjKTK6R36SSFJvObtJrxUbRI2fyM2aweewbWb9aWQ1ry9u3fjgTHvQIoMNh0
 NXIQ==
X-Gm-Message-State: AOAM531RaiLF96tqv0nLRzqt655hZudp4ySINTLljIM5F6MZ4xVaKkXd
 oNXE1V70lBFhO1i/up9cQGs9K8asP+8AJX4NLec=
X-Google-Smtp-Source: ABdhPJxZCLP+mddS3lhVDgJN0jp2gMO9M1+8VzhY+veemJYIZYG/1ydxrTn3ALlotQ5/YbUymtiyTdwL1VhxymGR2FE=
X-Received: by 2002:a25:346:: with SMTP id 67mr11229803ybd.345.1634292897782; 
 Fri, 15 Oct 2021 03:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Oct 2021 18:14:46 +0800
Message-ID: <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_031500_010525_5D1CE273 
X-CRM114-Status: GOOD (  18.86  )
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

On Fri, Oct 15, 2021 at 6:09 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
> the MTIMER device. The current schema does not allow to specify this.
>
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction. Samuael Holland suggested in
> lib: utils/timer: Use standard property to specify 32-bit I/O
> https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
> to use "reg-io-width = <4>;" as the reg-io-width property is generally used
> in the devicetree schema for such a condition.
>
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases
>
> Add reg-io-width as optional property to the SiFive Core Local Interruptor.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a35952f48742..266012d887b5 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -41,6 +41,13 @@ properties:
>    reg:
>      maxItems: 1
>
> +  reg-io-width:
> +    description: |
> +      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
> +      32bit access for MTIMER.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 4

But this is not a "sifive,clint" anyway. Should there be a new
dt-bindings for T-Head clint variant?

> +
>    interrupts-extended:
>      minItems: 1

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
