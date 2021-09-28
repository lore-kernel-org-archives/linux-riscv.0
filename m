Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2A0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBB7611CA
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BBB7611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPzCiQS/owewvTQdMwzsFd3nb50NBviRuhxKoPrYx8M=; b=XOs5pw1wzcHNmH
	GQJ+L0EdxSvwxFbOCZmbgY2lYvbixkCSF16U5P//oNAlyfDAuw/gbAyItdDKKx7SC/zZvpeN6Nzl+
	kcE/MPlK3gGohgMd6oAeyMLfBi0MC9NW1wW0nhV9jxXLYI7O5mGN0vHKWTOHp6VRUxogcBwzf99O5
	BDwl+07kVBxm47W4+Zf2D2KwQsfESdFTPkBH3uavCAWu9yBFBlFpov4P9drDmfGVmFPPT0B8hBJez
	kk5ku12kmVZy+qgGWB5D1Kg/Z8hfTlAAuFbM5LYZ306meX6GO52kwZRwOmQCDWneBoT6lFzE0pLQA
	2Ks2YavqkaHIy2iGQLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDY6-007RCq-9k; Tue, 28 Sep 2021 13:53:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDXs-007R9o-5u; Tue, 28 Sep 2021 13:53:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDBA1611F0;
 Tue, 28 Sep 2021 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632837199;
 bh=jrbVenceAWLgQkHzrFIo4zTN1wFu086UNecp+tCchZ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MtU6qqn+kJSqX0pnHB39Hyt4TlXOGkDoOSpdfiFiizMF3zB6K4Kj1qU67ylirdEoA
 M3uIAYetRVNsArPrQ3wtdz7x1/5FDCW77d18UD0OLFfJBWxyEh5F3pP3BmIpYNEwux
 nxumzBozjIm4l2W1h2P/shzeKp0uJokfThTl9GfRer/LCavK13SDzYkN7Km4b/b0IU
 6zSnfS+7+K+WzzCYJgtVdE9FSdZlJJYYHowlP8QpW3ZSfwpzF+dIo4iNQ9RF3bzhES
 W8HnaBJnTgw3Rxsa8c+h19aOA0hPFU2qT/RDYAef3kAS6B5jGOrULAJPErmQwD14Ur
 NFI4KYTvgDq7A==
Received: by mail-oi1-f181.google.com with SMTP id u22so30048059oie.5;
 Tue, 28 Sep 2021 06:53:19 -0700 (PDT)
X-Gm-Message-State: AOAM531vpTnJ8VDfRrM90VcI7O+WQg0OR6xfanBKqshXzp81inDFwkxr
 mg8E73v/WOTXLc1Eovt3R36CZCcmAl4TiTirn4I=
X-Google-Smtp-Source: ABdhPJz9to8lWFr60Gpre4Od/46x6s4Nrtse/34SwP3rmoXnxlQkLzOc/1tmIX3U1LqO/1/3HTa84J5WaQo7iINmJLs=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr3628695oiu.33.1632837188990; 
 Tue, 28 Sep 2021 06:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-4-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-4-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Sep 2021 15:52:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGfPYBRKoj5eBefr61kHc=m336g0EbPUeDRy+GZVGw26w@mail.gmail.com>
Message-ID: <CAMj1kXGfPYBRKoj5eBefr61kHc=m336g0EbPUeDRy+GZVGw26w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] s390: add CPU field to struct thread_info
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>
Cc: Keith Packard <keithpac@amazon.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_065320_249421_F56D7803 
X-CRM114-Status: GOOD (  18.47  )
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

On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to s390's definition of
> struct thread_info.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/s390/include/asm/thread_info.h | 1 +
>  1 file changed, 1 insertion(+)
>

Heiko, Christian, Vasily,

Do you have any objections to this change? If you don't, could you
please ack it so it can be taken through another tree (or if that is
problematic for you, could you please propose another way of merging
these changes?)

Thanks,
Ard.

> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
> index e6674796aa6f..b2ffcb4fe000 100644
> --- a/arch/s390/include/asm/thread_info.h
> +++ b/arch/s390/include/asm/thread_info.h
> @@ -37,6 +37,7 @@
>  struct thread_info {
>         unsigned long           flags;          /* low level flags */
>         unsigned long           syscall_work;   /* SYSCALL_WORK_ flags */
> +       unsigned int            cpu;            /* current CPU */
>  };
>
>  /*
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
