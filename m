Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB13EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aY+7mCadzkYIlFQArl8P+DSEEM2n11AmleQ/RAQXXs=; b=iiT03wUPx9cl1y
	21Z1jXkhr4pQUXi/U8/yxO6SCXUCxnywk9X5oAv5VNWRKFIMFSwHW3hFW6vdVeSYUNYJcgPAoWTus
	OIT5AEWxpulpAUY3FVzxbgdwfG+kXg0ubDX/BHL6MLWPsfOHkenLaPWdz/tKzA+hrRVNn7zL4UJ5S
	dUkFy1/QWkcJqZtIVN7wupEHqju4Ncv2t55hG4YBdrM+JwPEDk+M5j6AfKHBzQ8pQfQkKMWkqDeZ1
	IFg22T9px4gMr9l4Jf/tcROsJ7DeZb2Wo6vO7xECqWGmEkJP3JDnKylrSoxSWekpv4XPSon/jTeH9
	95NnTA8auHQWkZqAmmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTxZK-007bAQ-JB; Tue, 15 Mar 2022 03:09:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTxZI-007b9Y-30
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 03:09:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso654348wms.1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 20:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEEwRw8+0oWuduV8yqxbjfqDtS7mxY03eu7dCRX8Jmk=;
 b=D73mRn9qJPT/lNMgz1PI6Ul2I3MQY+JMoB5S5t1vU3cz1uquuRX5ykZbF6gV0j2b07
 V4pxr9+sP5cj+BxujKLiC6XGCmpy0EFHXZL4XLtrY+9EEHdzeePt3EeCbhxBna5uRtUO
 +w9hzl8kSyToqOLNNU/4fCsHPuhg9vfeFQvXt58KVAB5X07oPtgH35or2cG297J/sUVO
 g1tHrGS+bsejIDsGIerLDZAk3KKVaX8NrmKqkj4v0dzBL3ppuqbIr2TE3T6kAEHKpMjJ
 1RyLzDplSxFbkNpJNDghAMLKx81gQx2cNm1UHEAbIM7FyaABoDbW9NGo6W/zJYTH2e7Y
 uE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEEwRw8+0oWuduV8yqxbjfqDtS7mxY03eu7dCRX8Jmk=;
 b=oQJVbGGFKmM5IrAA0ZAZbFfD5jELJ2xPi7naWrJOgaQzWEMamNDh2VNutsnonVlWD8
 D3ZNXg5uBo/rpJIL/IVndgEn/V3hTBtgrH6W+XZa9aP27sxhRRSbk5JxQ0VNGwRbXOyK
 BeiQ7D3ghlLH/jf/587D3xY5imlPX/qCCkbGToA5GgQeYxDf1pIz66cTeVDzDkpANYDF
 VlbefA6GqSeUxXhPwn17mR+iDNnpnTgysuO2Mto6GOZ2g73zhTKATpu+By2uCtxin7k4
 ky2nc0/dzDXxqbnevw4ylqF5ih+hkhGJd/54qLCceIk6GseUZGWnpUUBPsso2Ei61z+4
 YgCw==
X-Gm-Message-State: AOAM530zhofSbFUjSG7ja2Vmb9aYOjvQpx8ROzu3YCDWtngq3R5VdC4v
 6KKsajU7j1BR9LvX0InOTfN12QzRIkmGIjy/1k7UlQ==
X-Google-Smtp-Source: ABdhPJxMLszud/s52lgLbocLUt//aWIhTSEqW5XvUnf3pW3nxpRuNWQiJaZxYVdb1AqBk7JLjx7cPIYSElDxkulSEyo=
X-Received: by 2002:a05:600c:3c9c:b0:389:cc3b:9462 with SMTP id
 bg28-20020a05600c3c9c00b00389cc3b9462mr1529325wmb.105.1647313790542; Mon, 14
 Mar 2022 20:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220314203845.832648-1-atishp@rivosinc.com>
 <20220314203845.832648-6-atishp@rivosinc.com>
In-Reply-To: <20220314203845.832648-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 08:39:37 +0530
Message-ID: <CAAhSdy0E=UssRZN1NwmvOMcxVHhDDghU1_w2PuZEAYkuDcmqag@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_200952_161379_A2C7B805 
X-CRM114-Status: GOOD (  16.87  )
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

On Tue, Mar 15, 2022 at 2:09 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The isa string should begin with either rv64 or rv32. Otherwise, it is
> an incorrect isa string. Currently, the string parsing continues even if
> it doesnot begin with current XLEN.
>
> Fix this by checking if it found "rv64" or "rv32" in the beginning.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3455fdfd680e..a43c08af5f4b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
>         for_each_of_cpu_node(node) {
>                 unsigned long this_hwcap = 0;
>                 DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +               const char *temp;
>
>                 if (riscv_of_processor_hartid(node) < 0)
>                         continue;
> @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
>                         continue;
>                 }
>
> +               temp = isa;
>  #if IS_ENABLED(CONFIG_32BIT)
>                 if (!strncmp(isa, "rv32", 4))
>                         isa += 4;
> @@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
>                 if (!strncmp(isa, "rv64", 4))
>                         isa += 4;
>  #endif
> +               /* The riscv,isa DT property must start with rv64 or rv32 */
> +               if (temp == isa)
> +                       continue;
>                 bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>                 for (; *isa; ++isa) {
>                         const char *ext = isa++;
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
