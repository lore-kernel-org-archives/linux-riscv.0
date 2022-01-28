Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED540C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lIm5OylwUBAFBfZbxQQYGL1zm2lBxqYf3+wi7RbZwg=; b=O0mDc2P/OGMBRk
	SbAtpAyfnXqDI/RTGsQ/LwwhFuB9jTIxEGHwPwc4uFIeWiE0GVrw1v9k0UMZXs4dYu/vW/eWdlOBR
	Wl9fctr7zfjkaJdDw2xLbfeI1evfovvenDIme5sLIUFndtNxcHEFdhsMT01kuE2gQu6+5rYkhzaEu
	M3e7F/UwLcsSu3aTN+ch4C8yxvESc5jxfHD7cnvxYx+3iBtLqWqHk/QLcn71TY50YAXOtv6H7s+Df
	TmjbxLAGoATzALvyJ6xEOSLx5FNlh2LvBy8Zh+TXBtE5LMojBpfr2zoOyT51MI3lrz3IedDF9u9AI
	WiQZJD/rYRQYG/5bM4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNDb-0018w6-HI; Fri, 28 Jan 2022 09:06:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNDX-0018sf-FP
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 09:06:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r7so3826383wmq.5
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 01:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6wIAYdGWZvgUsjPei+YbgKLlhX+BWcT4ZFFreUIf/o=;
 b=e73sSH1LXzCPedGG67Np0Stuh7FrNuD36SgjCIgJXn6tMAZP2RLyxpZ5numftYWMkn
 uUzxnPg8OT4ngevlyyJYj2XknPGqVKMYKBEtLa5Zc1qziBiUF3qPs7+sEiljmCKDxlvX
 v3D2EBhTMdw2JLJ1bdrtvFib+Cykh4rvp5b1zCbQzjgz4z2MjEzlUNP8MyHhkc64rC5O
 fj2p1owTF9KfsHFMViYbftU7c5/Ztvu0X0PHXW03QxyysfL3PaFxlGTQbx//YBCzdJux
 aCjfVRw5TADT5hyTzV2vsieM9Bm2AiKFR7EI33AWwGTHDQ6nRNwsEQ9LP5xc/F/B1972
 sUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6wIAYdGWZvgUsjPei+YbgKLlhX+BWcT4ZFFreUIf/o=;
 b=rMLTXCp7550+U8pF0mf56VR0DIHdB5uIwCJhwIHma24piPg0wABIc41iGHn0YWrdbt
 oNwtyXzntVx5kzGXXz/iJZdhbOr1tOInwEjqdRcatmNJPSY7Satnq2TXPiT67NGekarO
 As0WrB0rHtSr2QiRlrBE1G/tSTGpVM9aYwhq8Vz9sPB89dLqrQcgxeg/AcV3iJlcJGAx
 WW8vFr3HVVOiPqFxY2LrO9mUCQQe7q7Hzc9UG1H35S9Ibac47EU/7AcErls9EZVfV6c5
 gSJMfxa53A1abg86yRRkEMNfSyOY1WvM3RfdOO1wg+5XtK6IK+0Ocoku/17bFuAGoOTf
 RwUg==
X-Gm-Message-State: AOAM5327u7E1LxK9TXOmJgfrzW1euVXzcohRW0HtStfLNx4XQKVQqtJf
 DsQUFhnQBpkhEbxBlgwkO2CLbA6vmAniOR91SkEuhQ==
X-Google-Smtp-Source: ABdhPJwPIrr2gE94yvvHvP7GvT3Wa+RsEPzFUqQsChCTORUdOrGaMkrRfg9l3aIgiVlBuFYisnhQExd2es0kZuE0U8M=
X-Received: by 2002:a05:600c:21c1:: with SMTP id
 x1mr6622486wmj.59.1643360809397; 
 Fri, 28 Jan 2022 01:06:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643360419.git.geert@linux-m68k.org>
 <211705e74a2ce77de43d036c5dea032484119bf7.1643360419.git.geert@linux-m68k.org>
In-Reply-To: <211705e74a2ce77de43d036c5dea032484119bf7.1643360419.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jan 2022 14:36:38 +0530
Message-ID: <CAAhSdy1VfWaSxPb0kLFtxz4acX6fBOuZ=7y7QRiGp0SydqD6ZA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: interrupt-controller: sifive,plic:
 Group interrupt tuples
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_010651_561832_DDD27252 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, Jan 28, 2022 at 2:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v4:
>   - No changes,
>
> v3:
>   - Add Reviewed-by,
>
> v2:
>   - Split in two patches.
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 57c06126c99502fa..0dfa6b26e09910a8 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -91,12 +91,11 @@ examples:
>        #interrupt-cells = <1>;
>        compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>        interrupt-controller;
> -      interrupts-extended = <
> -        &cpu0_intc 11
> -        &cpu1_intc 11 &cpu1_intc 9
> -        &cpu2_intc 11 &cpu2_intc 9
> -        &cpu3_intc 11 &cpu3_intc 9
> -        &cpu4_intc 11 &cpu4_intc 9>;
> +      interrupts-extended = <&cpu0_intc 11>,
> +                            <&cpu1_intc 11>, <&cpu1_intc 9>,
> +                            <&cpu2_intc 11>, <&cpu2_intc 9>,
> +                            <&cpu3_intc 11>, <&cpu3_intc 9>,
> +                            <&cpu4_intc 11>, <&cpu4_intc 9>;
>        reg = <0xc000000 0x4000000>;
>        riscv,ndev = <10>;
>      };
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
