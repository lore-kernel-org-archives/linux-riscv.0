Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65F8C11F67
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 22:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B59061D00
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 22:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B59061D00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bR7faxRRTpFJ0RTFJ4vr0lSapaHhzGxa6Z/3CfEDVG0=; b=G6T7KG6HbpnYzb
	gb1BB4hO1tmpDkG1TbgWs9QKR5xslTdN/jKMp/lkjkZJmSCTiaajYGCtJl63MCmVquol0NyFue0WE
	56/R0o0Q8o7lifPMVMs8h0Iqw8bYKqbj12eCWENWjWOlXTsLxVr9NQytTYQZe4iE/t5ETIXqxb6o7
	Vbn48y/7AXxyEDBfqSswm4b/4iMpwqyojlt6h0cse4hJq8Q4W9QJUppMyJ2Mh1020/7BOyKPPDsgX
	L8aSb1XIF9Hevsq2pMyb7gQ9PAaSM3Jugwx26VBAVcY96wWxF6CXxfM0yPIzKGqnuYSGhvt5tJnG3
	O8+3mWANMEc+vXDfLk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyMec-00CCGm-Uq; Tue, 29 Jun 2021 22:56:31 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyMea-00CCG3-4v
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 22:56:29 +0000
Received: by mail-yb1-xb32.google.com with SMTP id b13so1657119ybk.4
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jun 2021 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCtwoOT/gDcMzaHNoMO9WyHOwg6yfJH1zJcW1hYKrHY=;
 b=I1saaJtdLgSOlHpzEgzntpt8NBggCFBbOpKnGTQ2TP41LkoltDKckTr8Kzz7VLNYKi
 llXELWkSWMjC1DBe0jj8zIxjwk8bE9r5M+6oc7WPlqnW/UI8Ww0TSqKJEWcKQz09oipR
 zKRNJjNNFp0Zl7dbjT5hw7pril0Y1uasrZeaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCtwoOT/gDcMzaHNoMO9WyHOwg6yfJH1zJcW1hYKrHY=;
 b=d/Ev76UJFJPsj8RRxQxpRibFgWcuB6Nuh0V/GO4/M8pP5nhM0ExUdv7HOnf8YD5ohu
 ga2ni8Gq4jfdI2rFX3A5XHnY9zIDQZIWOKihZ8uc1VwglRIoul7D/a+HsC99Du2oaGNb
 CU4pUfHiD4vsUyv7OOTJG1sKkjAZc3BABbknD4HLHMoAn7d4ISpIOaNMoTRv+v1fm9HE
 UszjUF30IUKhMECi5eyUwRKP/pTRdcf+We7UsHguDEtjkT9ezOuNSXW5CL39hq3PCqU0
 WyrC4JGL1vrC6pktQOEi700xnf/tIWLuY4d2L40XOmH7S6FWJX6/Xq2cUQHB4BZgDr+j
 5fgQ==
X-Gm-Message-State: AOAM5314G4JZo6oV/epFvzdVIFpBH/FD5JS+YP2wgHo5Q1Imc7udkAiP
 TxXWaP2X9kLpLkuJZX1N82Lq5kxPkzdJ+tf6DBHX
X-Google-Smtp-Source: ABdhPJxvpbX85dvBFDwzDQylCz6CI54+dCjhGMQg01ThMLjX1IQs9fM49Hgtyr4s0oCv6IU15TnnrZ6bJAY+UWbI9zs=
X-Received: by 2002:a25:d015:: with SMTP id h21mr6968289ybg.202.1625007385657; 
 Tue, 29 Jun 2021 15:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
In-Reply-To: <20210629134018.62859-1-xypron.glpk@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 29 Jun 2021 15:56:14 -0700
Message-ID: <CAOnJCUKuHGUZi-13PpnZGHKkXxhj3asVJgaNMTv3=830eVwi=g@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Andreas Schwab <schwab@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_155628_290133_CA7D91B3 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Jun 29, 2021 at 6:40 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> to boot SUSE Linux with GRUB on QEMU, cf.
> https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
>
> Remove the constraint.
>
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  arch/riscv/include/asm/efi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> index 7542282f1141..649ab513dc99 100644
> --- a/arch/riscv/include/asm/efi.h
> +++ b/arch/riscv/include/asm/efi.h
> @@ -33,10 +33,10 @@ static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
>
>  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
>
> -/* Load initrd at enough distance from DRAM start */
> +/* Load initrd anywhere in system RAM */
>  static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
>  {
> -       return image_addr + SZ_256M;
> +       return ULONG_MAX;
>  }
>
>  #define alloc_screen_info(x...)                (&screen_info)
> --
> 2.30.2
>

LGTM

Reviewed-by: Atish Patra <atish.patra@wdc.com>

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
