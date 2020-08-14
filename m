Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC7C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 08:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56769206B2
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 08:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RMFSsBoJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zjAF2U3Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56769206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFbiYgcXCn8MHk/X2+xhZ3oKk1fbIGhbAkAB5bK1Jog=; b=RMFSsBoJPfKqGCIgQv4E6hAns
	QCd1g0oP/pEfj/Mcxt3h4p0yZz7bLuWoZW5+ecWry+Raw/GZYqwVmJDR9pMwnqutTf6+Xqax3x37t
	4X/8wqhTIbi1JJvO1qPY1YCieIQGjE5o95RCW0b+RJlXRm4ZFcuyvLrxFn/ig1/69RksNzX4Zt6u+
	WcsHOaCiOVE+BrsxOJcFU9I5p8fXtTXMu8+oXYs2wNjMwUtNQWKbd49LStLyFC06w0OMoj//H0uyK
	o4a6MvzhPzjJGshjR/IR3RfmJhiQs4uXPoaUMNjQUW1Bj2gkPUSXvV8X5WJrYg7Ir4S1zFHosESW9
	bWXEy2Ymw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Uu0-0006Js-6D; Fri, 14 Aug 2020 08:17:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Utv-0006Iv-Pd
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 08:17:25 +0000
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0969D221E2
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597393043;
 bh=HY+m6iT/uKtSV5so9rt7C5SbeoJZc1Tb9Nu33p1f+dI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zjAF2U3QtvbdVbmBZL64LWKNRCIfq2QOSRlURJtS+XX0RvrrqQ39DmDlicM3G7j4L
 cW1rNC9hufaJk/Mqi1+xKr+EcLsnQZ50Vvn9nG7GNwZ4KmgSxStXhX3AyQTRjgqPWv
 nlDiYXrfYQXYktHs5DZPAk6FC0jm2ZlFJQXVg3iw=
Received: by mail-ot1-f42.google.com with SMTP id h22so6942609otq.11
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 01:17:23 -0700 (PDT)
X-Gm-Message-State: AOAM533GuichspLCgvl1wDXtPudY7Ips0wQanfmVNFzZdQlt53LpmC7X
 wRrSA9AhPDVTE3WsF1cK4mYlidLi32cNOjJ7yUM=
X-Google-Smtp-Source: ABdhPJzRybShq6srZ6XFNiYV43pOVqNtu3RNcUAnCec0hfJX8drqSxl/WwXak700MtVkwfkN6afAHT2A49b8QcP/RmU=
X-Received: by 2002:a05:6830:1d8c:: with SMTP id
 y12mr1175113oti.77.1597393042323; 
 Fri, 14 Aug 2020 01:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200812234758.3563-1-atish.patra@wdc.com>
 <20200812234758.3563-8-atish.patra@wdc.com>
In-Reply-To: <20200812234758.3563-8-atish.patra@wdc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Aug 2020 10:17:11 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHH6sn+9EiOPi4ViHgLn3SYQ7GOCaRf1c2GJ6YDC1uavw@mail.gmail.com>
Message-ID: <CAMj1kXHH6sn+9EiOPi4ViHgLn3SYQ7GOCaRf1c2GJ6YDC1uavw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] efi: Rename arm-init to efi-init common for all
 arch
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_041724_016212_611C1004 
X-CRM114-Status: GOOD (  23.42  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Waiman Long <longman@redhat.com>, Borislav Petkov <bp@suse.de>,
 Greentime Hu <greentime.hu@sifive.com>, Mao Han <han_mao@c-sky.com>,
 Daniel Schaefer <daniel.schaefer@hpe.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Aug 2020 at 01:48, Atish Patra <atish.patra@wdc.com> wrote:
>
> arm-init is responsible for setting up efi runtime and doesn't actually
> do any ARM specific stuff. RISC-V can use the same source code as it is.
>
> Rename it to efi-init so that RISC-V can use it.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

Note to the maintainer: to the extent possible, please put the patches
in this series that touch drivers/firmware/efi on a separate branch
based on v5.9-rc1, and merge that into your for-v5.10 branch at the
appropriate spot. I don't have anything queued in the EFI tree at the
moment, and so these changes can happily go through the riscv tree, as
long as I am not forced to merge a bunch of unrelated changes on the
off chance that something does come up.


> ---
>  drivers/firmware/efi/Makefile                   | 2 +-
>  drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
>
> diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
> index 7a216984552b..61fd1e8b26fb 100644
> --- a/drivers/firmware/efi/Makefile
> +++ b/drivers/firmware/efi/Makefile
> @@ -32,7 +32,7 @@ obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)   += embedded-firmware.o
>  fake_map-y                             += fake_mem.o
>  fake_map-$(CONFIG_X86)                 += x86_fake_mem.o
>
> -arm-obj-$(CONFIG_EFI)                  := arm-init.o arm-runtime.o
> +arm-obj-$(CONFIG_EFI)                  := efi-init.o arm-runtime.o
>  obj-$(CONFIG_ARM)                      += $(arm-obj-y)
>  obj-$(CONFIG_ARM64)                    += $(arm-obj-y)
>  obj-$(CONFIG_EFI_CAPSULE_LOADER)       += capsule-loader.o
> diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
> similarity index 100%
> rename from drivers/firmware/efi/arm-init.c
> rename to drivers/firmware/efi/efi-init.c
> --
> 2.24.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
