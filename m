Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BA5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiuL0RvaoRrDKniAMcGVru3+qVR2d06Jq0TqH4FZoY4=; b=y9/YBpJIXgrR7L
	rkTijx95FMadCylU3N0aobF5/sHFLtnvw+7e1BiQ9zK/8rg6uWIRuTljSIXS2eBEeO6YZTcrqk/b7
	t3eZAmmmpvJJgw7+NgInqXu4SZlCXPPI28UFw1Lo81g16JzsO6KEifL/D8dsDZDNaMMcvARhaFsbr
	VE7bhE2tknh9F47RSE8pkYDR5/FrQX6i8jLhLY9WCOO9R9Wb3dzYfOCAJmCgBxOnYy+6coFMlOTcf
	a9ULXRW1COB5p/43zO9HO43k6zGJpRhdHukrstBgGKkTigW4isMxZ8YwNwdqoRrRjxzQyCKeMie+9
	KTnfm7R3hOKrIWX2mSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3A5G-002yNZ-Rg; Thu, 08 Dec 2022 06:08:38 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3A5E-002yBU-TF; Thu, 08 Dec 2022 06:08:38 +0000
Received: by mail-wr1-f49.google.com with SMTP id y16so428806wrm.2;
        Wed, 07 Dec 2022 22:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdO3M4VLxTphcxgv9reIX5OeBW+Opupnq1O9ICQuNB4=;
        b=s97S5LKKmOQU5JSDoUFLp7W7hBgFtTLgmShyp4+tUapjR8KBVQHQ3PscSk/g1l8CIF
         3qbHpJuwVxO4wFu3q5N51czwB62O+JUYO7GJZOxfBGVnTOH+8LtAGPnWGq4ap4sP7lMe
         UUaF0o6GonqZMw8+AEUoNcIbTrbXyTErVIjpUrPbNiyypipY1WgtZIhUvQKspy9jPFvW
         /ON/3k80LSp7zC1aSJ4/+PFf0av+qseps67cvdRJri19uFyDF/0LlY3jZZMFAsKjuSei
         f3iXA/ONU/XMTvM6Ofg5aErh/2zFOFlVwHPgZEysJwbBSX32LTJcWq4F2CA0lsI33wQr
         EgTA==
X-Gm-Message-State: ANoB5pkHoZhM7FjSl8GSbOCew+rB4XFw81tE39dlPOH20tSZQs66S8AO
	ULS1XBaPI9J/RrLWVBsBrqI=
X-Google-Smtp-Source: AA0mqf7lxoQKokXxjdZsYvTxsGgExAkaZEk7+P4TZNw91MWt4o3d93lsiW94n/OhA/2dzdza7A6CMg==
X-Received: by 2002:a5d:5a90:0:b0:242:6af:8a26 with SMTP id bp16-20020a5d5a90000000b0024206af8a26mr960431wrb.70.1670479715067;
        Wed, 07 Dec 2022 22:08:35 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id bs21-20020a056000071500b002428c4fb16asm1027522wrb.10.2022.12.07.22.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 22:08:34 -0800 (PST)
Message-ID: <0443d5e9-b2ce-7e6b-c69b-708d67a5bf97@kernel.org>
Date: Thu, 8 Dec 2022 07:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/3] serial: earlycon-arm-semihost: Move smh_putc()
 variants in respective arch's semihost.h
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221207135352.592556-1-bmeng@tinylab.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221207135352.592556-1-bmeng@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_220836_994126_6193307F 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 07. 12. 22, 14:53, Bin Meng wrote:
> Move smh_putc() variants in respective arch/*/include/asm/semihost.h,
> in preparation to add RISC-V support.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
...
> --- /dev/null
> +++ b/arch/arm/include/asm/semihost.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Author: Marc Zyngier <marc.zyngier@arm.com>
> + *
> + * Adapted for ARM and earlycon:
> + * Copyright (C) 2014 Linaro Ltd.
> + * Author: Rob Herring <robh@kernel.org>
> + */

Much better. There are three minor issues:
1) protection against multiple #include-s is missing here.

> +#ifdef CONFIG_THUMB2_KERNEL
> +#define SEMIHOST_SWI	"0xab"
> +#else
> +#define SEMIHOST_SWI	"0x123456"
> +#endif
> +
> +static inline void smh_putc(struct uart_port *port, unsigned char c)

2) port is unused in all implementations. So it should be dropped.
3) can you make "c" an explicit u8?

> +{
> +	asm volatile("mov  r1, %0\n"
> +		     "mov  r0, #3\n"
> +		     "svc  " SEMIHOST_SWI "\n"
> +		     : : "r" (&c) : "r0", "r1", "memory");
> +}

thanks,
-- 
js
suse labs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
