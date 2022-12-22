Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rF7dBELaEcocynGzYug9G1ljcw5X+AGs7fxYsrNxL2A=; b=I1zwpmTnAkJWYS
	MZ5r7vgkqv+nhLaqe71h82hjr7juSDRr0QwPnZrKr0Y2gvIUiMHD2tWavPlUhEwslqoFsx6PqS5FX
	5TnzGQ34vLYP/cvm968A1n6JZGq9gOfu1mrh2ZiCZpdNEoS67bYP13oMM9VBPjUhsPviXT6wBwiCX
	/cLBN3zY16/bd8gsl/0rvQqAkVjMM18CzB/kT5mUwVfcnFJNc1UGbMljwP+tasnCpeuCPGL/kGtxF
	rHzkDIXFCgPi70jJCVDqe1ie1WyN/D3uy9Qt1etBK11GH6hhXuw6hz2AzrLBk6XbXKt03iFuBjjWH
	dnow/UmpokdJFI58Jhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Rpm-00GY1i-5Z; Thu, 22 Dec 2022 20:06:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Rpk-00GXy4-0K; Thu, 22 Dec 2022 20:06:29 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bf43so4302970lfb.6;
        Thu, 22 Dec 2022 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xJWdK6g8RNg0tbX7DSdDlyoxHtFOwWkvjJQ959FY74=;
        b=QqZn58xjqXdTXRFOZ9n/cNbHc2HPSzK3pEW4GXVdeTcBmqLU40uL55OX2zgWp4LZYl
         QorS9Sl65LDN3NbsM+sEw1aauMYnph8tHnACNBsrjyx5HvFE3kBfoWiwKNaRgEX4sdPQ
         DNgjwxzKBTCwf7ZNjRaH/VmNb2n6JEB9ctBcXmbXB8M3Zy5fT3suv9eFKMD2a0FBKSEb
         MnBvv/xZwEvkgnul6SaupsScNvx2oFVIsY8xIW2xliXfnB1iSQkTzYgJxFYwvLQKWq7k
         RtWyPou0NkecpkIxD3sREwJn6n5NrsEEPf+FWTEjP6JaLU8soLUqWuldMRkKYbgUsqWx
         DncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xJWdK6g8RNg0tbX7DSdDlyoxHtFOwWkvjJQ959FY74=;
        b=LxFYh+K8CbxiVravTF04pw0TiVG871MMpY4wgCBFnLvhtgIxYSJTwUWiziKkdgNg7S
         cSq+sdMZFZnvva7YA7iNb2hrbERsRXuCBBrVNFYQujL9EkQfSVgfqwxQChjcMR96OzNP
         2/eXnKhv+X855TOEGsDL5VHju6OZjwDT3mrI26rU7BYMldSky4bJTVLre19Z3zTHuO/m
         /osaLK6yKvIdxA1TGe5UKBZPnh72EmlseYZzU3iSmTKn8+/g1trJKaoTUsFuagtoFaBX
         hyH3kbugJIGu5NABvOXJ4MQeBCIhyl6ESqh31C0mX6tqUU2C0MPz49ejfsJOkGUSKdN3
         mDgQ==
X-Gm-Message-State: AFqh2kpPVP4OuaBFtahoNG9ofIzCmHHNmIYAXgU7fz2zXTHG/dYoeYqQ
	sq+BB8RA1aCSfU3DQdWI9vc=
X-Google-Smtp-Source: AMrXdXu3IYj35bd8BBRhLKnppBsoqCruE0oNBLAv1GAPxljH5POv5pCeEQRfRoyNEWD3bVAZ57fCfw==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr2053171lfb.41.1671739585506;
        Thu, 22 Dec 2022 12:06:25 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id y11-20020a19750b000000b004b4b0a68f67sm184767lfe.185.2022.12.22.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 12:06:24 -0800 (PST)
Date: Thu, 22 Dec 2022 23:06:23 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Bin Meng <bmeng@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon
 semihost driver
Message-ID: <Y6S4v7t0n0BI1P7d@curiosity>
References: <20221209150437.795918-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_120628_071972_F66E81E4 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Bin,

> RISC-V semihosting spec [1] is built on top of the existing Arm one;
> we can add RISC-V earlycon semihost driver easily.
> 
> This series refactors the existing driver a little bit, to move smh_putc()
> variants in respective arch's semihost.h, then we can implement RISC-V's
> version in the riscv arch directory.
> 
> Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]
> 
> Changes in v3:
> - add #ifdef in the header to prevent from multiple inclusion
> - add forward-declare struct uart_port
> - add a Link tag in the commit message
> 
> Changes in v2:
> - new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"
> - Move the RISC-V implementation to semihost.h
> 
> Bin Meng (3):
>   serial: earlycon-arm-semihost: Move smh_putc() variants in respective
>     arch's semihost.h
>   riscv: Implement semihost.h for earlycon semihost driver
>   serial: Rename earlycon semihost driver
> 
>  arch/arm/include/asm/semihost.h               | 30 +++++++++++++++++++
>  arch/arm64/include/asm/semihost.h             | 24 +++++++++++++++
>  arch/riscv/include/asm/semihost.h             | 26 ++++++++++++++++
>  drivers/tty/serial/Kconfig                    | 14 ++++-----
>  drivers/tty/serial/Makefile                   |  2 +-
>  ...con-arm-semihost.c => earlycon-semihost.c} | 25 +---------------
>  6 files changed, 89 insertions(+), 32 deletions(-)
>  create mode 100644 arch/arm/include/asm/semihost.h
>  create mode 100644 arch/arm64/include/asm/semihost.h
>  create mode 100644 arch/riscv/include/asm/semihost.h
>  rename drivers/tty/serial/{earlycon-arm-semihost.c => earlycon-semihost.c} (57%)

Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Applied the patches on top of Linux 6.1 and tested earlycon logs from
RISC-V target in OpenOCD.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
