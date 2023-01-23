Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD0C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0ZZ1GMdcMMvwFF5p9HKbOGwMnmfUKYEXg/81uyZp7o=; b=XjveDgGvwp6kFm
	E60oEx46fP3ZNoTn+JZgjWop7U9TWaIqk6Cif4nXyqHl7nJjKAm1k4L7E3e719IFJm9FIjFFAZFmQ
	J611aMG+AE8Pq4aD+QPu6Cc5dF9q6u6bR3coLxhY2R1/8G5vGfKVGyZpaSgUrVgk4KB6ClPwxBzz0
	FxfdYuO9scxPxdnX4p5egaz9UYXxCGdXp8IG4gZdvwWQvZGY4IlTsTaqeOfW/4q/DOgB48Sc2ZQB8
	otsiTYEvjmagHOQVQTdyBAoWwsAWMrK4WDKsgWoY+bV/dzkywONZ0rusUXcmHvdPcJWhrSSuIHFgC
	Tzzl+fnaYprv0aUbupHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu36-00Golv-6C; Mon, 23 Jan 2023 10:27:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtvI-00GlIG-2O
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:19:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA9D4B80CBB
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 10:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C476C433A0
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674469168;
	bh=1MvSRUAOzKE+a90tCBvVLkylK82rha/QCQWLgVfCltk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qyAVZIfrSxljckr6paKaAvkrfUHIHj7wUv64VH5np6cFl5xqxvlm74q4EtrYtLq5X
	 tcPCCWE4G+tWCLKTPJr/swWLBnyg7XSw3wiTsFkC1aAYcGVzos1mWRcGIpql9bmxj6
	 VzxlEEWEhfTwVuYiV0QhRmHGNSrWKU3aljOEnv6uTiyVEqqfw0601zI01gOmiG1foe
	 WPeVzTju4o47eweoEo4m5lIsmStAAIdWEu8YVyxUkReGKnN8rlmhdJDd3fvAtdzSM6
	 P0V1jbhOOwJs55X7/rXm0KUnhiz7B5XHNryhT4+pE4SrA7GtehC1liznfu6Gvnylh6
	 M0lMkEJwG4NFQ==
Received: by mail-lj1-f180.google.com with SMTP id by7so11593627ljb.6
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:19:28 -0800 (PST)
X-Gm-Message-State: AFqh2kpguVpiW4BCihIIeeNP1UPTbZ1ZYUqNGIkoVt7zU2vDjMCW+I7J
	QEX5Q+tBS29n6BS7ZsqHbxVVpvI/7LdiWMspFbU=
X-Google-Smtp-Source: AMrXdXuV+YvUcgUKs//ofpl9C6bOG97YA1tziN0Q7mYtszCfszfBMOgqRuExMzsmqv+/3z7ce4+CPdP6WyOI6u0UXVg=
X-Received: by 2002:a2e:964e:0:b0:27f:b833:cf6d with SMTP id
 z14-20020a2e964e000000b0027fb833cf6dmr1969790ljh.291.1674469166406; Mon, 23
 Jan 2023 02:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20230123100951.810807-1-alexghiti@rivosinc.com> <20230123100951.810807-5-alexghiti@rivosinc.com>
In-Reply-To: <20230123100951.810807-5-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 23 Jan 2023 11:19:15 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEk0Vpf6-_iVwyg36MWtQa5HXGdExDzaFU5-12179shmw@mail.gmail.com>
Message-ID: <CAMj1kXEk0Vpf6-_iVwyg36MWtQa5HXGdExDzaFU5-12179shmw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] riscv: Fix EFI stub usage of KASAN instrumented
 strcmp function
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-efi@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@alexghiti.eu.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021932_322955_D7C1164A 
X-CRM114-Status: GOOD (  17.14  )
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

On Mon, 23 Jan 2023 at 11:14, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Alexandre Ghiti <alexghiti@alexghiti.eu.rivosinc.com>
>
> The EFI stub must not use any KASAN instrumented code as the kernel
> proper did not initialize the thread pointer and the mapping for the
> KASAN shadow region.
>
> Avoid using the generic strcmp function, instead use the one in
> drivers/firmware/efi/libstub/string.c.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/riscv/kernel/image-vars.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7e2962ef73f9..15616155008c 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -23,8 +23,6 @@
>   * linked at. The routines below are all implemented in assembler in a
>   * position independent manner
>   */
> -__efistub_strcmp               = strcmp;
> -
>  __efistub__start               = _start;
>  __efistub__start_kernel                = _start_kernel;
>  __efistub__end                 = _end;
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
