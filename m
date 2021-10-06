Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573BFC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209A861100
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 11:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 209A861100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZ05xNtSMCiqJN23iwuv3koCm5vS7ajHy2y8/MrQbQ8=; b=2qcdGYe/iCoQMq
	e1nOLFW1+CWTDgAcQm9ecliv0upwNSDmeHMxLhJL+qn+YNILlSaJsFOCBLSXugEEwyGa+JRnYFGAB
	4xG7WVBUykaO3QngDqmFWKbKFPhUgbDk3FozeyjnYZwKC4BarbqwtrAzgiF4HQXfF1Ki7aB8a5XQs
	pmGDPGhF6cVvsTuDVnFLfnGo+FhDAIDSvfQTxVR0K4e7yqBZtE/eOyEZdHs2hLlcLw8NkUU59Zapq
	ybf7OQUgX335zjlY8GETYX4JxgyvpmAFaOrkXrbq+IG8KwbqvuziQGHb0NdbSn7U+AqdQo2Hloyeg
	xzMBQDtp8o4ExMZDIjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY4rg-00E1k2-K5; Wed, 06 Oct 2021 11:13:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY4rT-00E1bj-95
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 11:13:25 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ECE2D3FFEB
 for <linux-riscv@lists.infradead.org>; Wed,  6 Oct 2021 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633518801;
 bh=FQo5Kx8XCwauwMhzMY/SvsywDQBLFcLxvkhl3IdJs2w=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=bgf+RRbOZDZkQ1Z8MKWrDtMXVZoYCRuB+bIfLq+OX8I7YMy5HOQLYK5TZW8YF7PQm
 iY4Xclbj24xsQT3NKAII5wuPoma99xzzMRiJYfotMNVgntZlT+twBqktuXaEjXnpZI
 /biaczbI7IGX8DWzfR1yGCuDkB8otXODA2C9Q3D2HJYqqnT4znRWSLbw0SPWer0NzC
 7F7gOq+LodPIJ7SbkRP4DjaPOPWqYiQ3YaNWfE8CWH35E5jhUXwbELV3FkeTvSGASx
 Nfu/uSXW4aL0z3fd1/p1cX0qr1PrfTmajEgEOwywGFYWboQlV8gb9cMUnThL6sFdg2
 NSt73aBAFJ9OQ==
Received: by mail-ed1-f72.google.com with SMTP id
 p13-20020a056402044d00b003db3256e4f2so2337803edw.3
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 04:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQo5Kx8XCwauwMhzMY/SvsywDQBLFcLxvkhl3IdJs2w=;
 b=y30EGWxJuU1wPhNHOjUmDh5RiiJExIGmD8BBzkGhlnMWv2shR8y4FtpVQi3t7rjDXV
 nvcjQTBWPuhtRXt8nj7ye7bKn/ovVLVoRgml6Q1Bdtfi+s777zEcE3+qeLsxpJPfY9RF
 jLTELdAoBEXdR1bbsc9YBbOVrJ8H6PicWXRCgNtevO9Tq9ZNYlaGdXBZM+TTPXoXTwZx
 +3hDzwbpJlNV+2hy2DykF/KFdVzMZUrEkQuADeaLsZaVA0iu97zXKbb5u6wO48hKWFWX
 gYH7uRf5mNdT5WRHMHe9lhksvVs5Q3ccjFZT+8Yw4tETy1n/uXncki2kSLQPMIXJwrv5
 s5+w==
X-Gm-Message-State: AOAM5300CHPQatQtF8KatpJRaOvb+kngeBIt9tQNao6zRUzMYhNaqpYm
 2vtWghMQGi2J4v8bCbFUUw8UfqgTXtmKMFPaaf6w7i4ipt2JcNnxfubNFN84RcOsKwM8B52mJiE
 B1Sy815xwYnHuY8SIfbE9xFGXcXiEsY3yGBNHAI71vbltz9jge8eEjSyOnEBAvw==
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr32331934ejd.241.1633518799063; 
 Wed, 06 Oct 2021 04:13:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw56RUWH3Ln9NmpWaSYjcwQWjjBmf/3L/T9WfjOSw9pUapVbZEPGUuOtn1C5DuHF6x0/CwjRTyEfj884yGdH28=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr32331806ejd.241.1633518797854; 
 Wed, 06 Oct 2021 04:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211002122026.1451269-1-mick@ics.forth.gr>
In-Reply-To: <20211002122026.1451269-1-mick@ics.forth.gr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 6 Oct 2021 13:13:07 +0200
Message-ID: <CA+zEjCtJqNVrtr_Wkij2c=3+P5kL6jJN5RPULfZj2c5mGzCVjw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Don't use va_pa_offset on kdump
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_041323_513629_F1C58314 
X-CRM114-Status: GOOD (  27.83  )
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

On Sat, Oct 2, 2021 at 2:23 PM Nick Kossifidis <mick@ics.forth.gr> wrote:
>
> On kdump instead of using an intermediate step to relocate the kernel, that
> lives in a "control buffer" outside the current kernel's mapping, we jump
> to the crash kernel directly by calling riscv_kexec_norelocate(). The
> current implementation uses va_pa_offset while switching to physical
> addressing, however since we moved the kernel outside the linear mapping
> this won't work anymore since riscv_kexec_norelocate() is part of the
> kernel mapping and we should use kernel_map.va_kernel_pa_offset, and also
> take XIP kernel into account.
>
> We don't really need to use va_pa_offset on riscv_kexec_norelocate, we can
> just set STVEC to the physical address of the new kernel instead and let
> the hart jump to the new kernel on the next instruction after setting
> SATP to zero. This fixes kdump and is also simpler/cleaner.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/kernel/kexec_relocate.S | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
> index a80b52a74..e2f34196e 100644
> --- a/arch/riscv/kernel/kexec_relocate.S
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -159,25 +159,15 @@ SYM_CODE_START(riscv_kexec_norelocate)
>          * s0: (const) Phys address to jump to
>          * s1: (const) Phys address of the FDT image
>          * s2: (const) The hartid of the current hart
> -        * s3: (const) kernel_map.va_pa_offset, used when switching MMU off
>          */
>         mv      s0, a1
>         mv      s1, a2
>         mv      s2, a3
> -       mv      s3, a4
>
>         /* Disable / cleanup interrupts */
>         csrw    CSR_SIE, zero
>         csrw    CSR_SIP, zero
>
> -       /* Switch to physical addressing */
> -       la      s4, 1f
> -       sub     s4, s4, s3
> -       csrw    CSR_STVEC, s4
> -       csrw    CSR_SATP, zero
> -
> -.align 2
> -1:
>         /* Pass the arguments to the next kernel  / Cleanup*/
>         mv      a0, s2
>         mv      a1, s1
> @@ -214,6 +204,11 @@ SYM_CODE_START(riscv_kexec_norelocate)
>         csrw    CSR_SCAUSE, zero
>         csrw    CSR_SSCRATCH, zero
>
> +       /* Switch to physical addressing */
> +       csrw    CSR_STVEC, a2
> +       csrw    CSR_SATP, zero
> +
> +       /* This will trigger a jump to CSR_STVEC anyway */
>         jalr    zero, a2, 0

The last jump to a2 can be removed since the fault will be triggered
before even reaching this instruction.

>  SYM_CODE_END(riscv_kexec_norelocate)
>
> --
> 2.32.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

This patch fixes a regression introduced when moving the kernel to the
end of the address space, so we should add:
Fixes: 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear mapping")

And it should be backported to 5.13 and 5.14. It seems that the
following tags should be enough:

Cc: <stable@vger.kernel.org> # 5.13
Cc: <stable@vger.kernel.org> # 5.14

And finally, you can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
