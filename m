Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A174FC433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:27:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44ADC64F68
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44ADC64F68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=anwzX3soLGdlWmsSWnTg95LS/2k84F7uvU9IGyPqbBw=; b=qOPCHOjUjn9PLKokhiDYWmVvM
	5L0sgj7inpjEHzrBx0DvHVwXQP77Sxudvtu92JVQp8Pw2+O7rOoQDUWb/f7a+aCCeyHSbZeqIByuZ
	CFRKnELf/d8wca0J3o13ivEiXpu9JydbZb4l+5sjmxzbYd6TkgG84x1OhsNU5qP3ejpXl9NhPmoyE
	ynKljndeP2+O1N0h/ayacGtqJqxo2dUUsumgtY4f0zqVBQJC3ZflbuEoAvXrf7vUD9PHx3hcW59Uy
	xXet6EHIkM5OEtzxb+wbVW/HM3BooKPlUfyDoybE9x/WRc0LNc8xxxhSyePL6sjWiiprxsP1k+Phb
	DrK1lnsXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70OR-0005G3-4n; Tue, 02 Feb 2021 18:27:15 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70OP-0005FF-1k
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:27:14 +0000
Received: by mail-io1-xd33.google.com with SMTP id e133so11546526iof.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sO45hddV4SFvCIJx/H8JjvwkptnOnST0NRJqIDfcvAw=;
 b=haGA9pofOxAw8R+yTCDViL2ai4UOWRphsuuFxNbv1c/P5oAAvOOJnWQ4mrb0/1nV4j
 uRWiFwBTmHNomtCw7p9YSXXMCzbwTOksiy8CBkvEiwWi/E5v9K01iKCu/tNjEQbtplpm
 L1ibZ+KNu4FWS5U0Q6L/Z/bJiJAmH7BiRNWXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sO45hddV4SFvCIJx/H8JjvwkptnOnST0NRJqIDfcvAw=;
 b=OeW7uudtCixpQ/9OnsFt6YOxAAyL/X5wkYW99uSlXcjmhJeo2iqcYaqtBwIN65B6bA
 rV7xXIiuZtPe7EPXxA8jaqB7/CQfs5XD740nkoa3MKYg1IvHp9k9udrtX0L6icJ2U1yh
 /ITZEFLw/na80JezMWF98R5apPY3QDO+wJPjBNhy/VU/JGLeB0AxnWpBg4e1BCY9+IS7
 KRDQMPCxkvwAgLu0+52P4AEquL/yin9gQdoDv5UYCSO4oACncsCDkdzuFOJKGu+y9CaW
 X2xuze061UudJARrwQoxybKXvBnxJBxOFkkKiGD9FGzi4I+1FBiBzUy8vGIXolVBr8QZ
 1t0Q==
X-Gm-Message-State: AOAM532sond6Gzs0T5b0iY53jeryWLopox+umaKbCFay0EFhlESlvl/I
 SHUme0bu8oYsmafYVBj97H2yXEcEwVmLLwOVPBCv
X-Google-Smtp-Source: ABdhPJzEtajs+ltmE06IYaBT7IB2gM2CPxjo0h1wGG8p11J07dRxyA7dSIaSzYInnkSjBfizJQJmBkC14QjGI9wF/kw=
X-Received: by 2002:a5d:96d5:: with SMTP id r21mr18497123iol.53.1612290430810; 
 Tue, 02 Feb 2021 10:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-7-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-7-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:27:00 -0800
Message-ID: <CAOnJCULuBKGMDt_CdijiS_zBdyN=xATaEmBy_+0wgRL0PATfsw@mail.gmail.com>
Subject: Re: [PATCH v14 06/16] dt-bindings: update sifive uart compatible
 string
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_132713_195712_EA327967 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add the compatible string "canaan,k210-uarths" to the sifive uart
> bindings to indicate the use of this IP block in the Canaan Kendryte
> K210 SoC.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
> index 3ac5c7ff2758..5fa94dacbba9 100644
> --- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-uart
>            - sifive,fu740-c000-uart
> +          - canaan,k210-uarths
>        - const: sifive,uart0
>
>      description:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
