Return-Path: <SRS0=0+L8=4P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0463C3F2C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 23:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA7B246A2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 23:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M67h2+rx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TyZ+g8V1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA7B246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5TBV80+atYTW8ayxk/2OyPSXwC1dT0+88WbtQJtma0=; b=M67h2+rx9KlvEN
	gpmFU1sAMgwnkmNznyR8mRUgTJWUHSO3Xnl6kMKMUqmTxyL2NpHFmB093XFOlKZgVVuLTSi9cwazw
	LUzpJETYb8K3LmroSj//MEiPCRjdPq7TIoJmKPh0h1KrUglbd4HC28c9nST6N4Mk5vlsn1lABGtiW
	qZAwk7YUjXc5IrUhfPnkQGmG3Jivmi028gVsVtS/W0snk7jecrclScUR7gFcMqbPziXrVz8Ds0emz
	RLSjRK9+biTsIEwkRQyptpZQrlsynxngOwjZoyExE2Apa0xVp+P+MD5Kptj8YjcXwMAqFdKUuqZKa
	6PDz9m7SdlSsA8H7dXFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7SCD-0005pa-FO; Thu, 27 Feb 2020 23:03:57 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7SCA-0005oo-LO
 for linux-riscv@lists.infradead.org; Thu, 27 Feb 2020 23:03:56 +0000
Received: by mail-pg1-x544.google.com with SMTP id u12so441059pgb.10
 for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2020 15:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M5TBV80+atYTW8ayxk/2OyPSXwC1dT0+88WbtQJtma0=;
 b=TyZ+g8V1WfnaJON7zD8Ec81jO2Z40pkqQWa6hyyZCnV354hxhWGgiBFKJLHROU19zb
 VYQqMyaUaAueAFY3bGVjnWtJx9QR1psqSyy+vJDqCWGIhBaMzRIvLWSTVEMu6B6rWEwf
 bFbs8D26P21YH7ZfHJL2uYp2Vp4B3CJp0yfxS7Lx9UU3Ng2nssusMx2Bfn9+rl0jYzlP
 mOL4v8lkMQiYD9zQ4KosYUdWWQmbGFAy7vPzKR5az8/vdbNqAD2RCUwfSrbJl4jBdDLB
 wdPPA2iWyMiarQnWnG1e6xCcwa/n/q1KWSMyN+V7Bb/n3SQA8vWRyCTYasI+HKJi8RbS
 EPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M5TBV80+atYTW8ayxk/2OyPSXwC1dT0+88WbtQJtma0=;
 b=J6o20PU71FyFp7g/yeeL3PsjOB0Mcaz9gt3b1FFYXXhIcsEPjki5lmmE8YEEQs9RWv
 0iq8FgGcx4rDbsE3aNmB7VxOlrVhCAybvGV8N+HxLiud6b5uEVELTbMmG6DY4/lT9V64
 1Kiwzn+LWImY/IBRlCw/3gm3zTzUnt+qGi7f7fvEAeOil8nftEed77JH0WBD8/jFULBo
 prlLZhLBHVxX+d8+Dhs0o8tvgA81ev7Flkh9Trze1C03RlCc6UB6OGQZWPYDKkM/8Xzl
 dC1s/CA7k36mEykfOi0pUEHNB5dan7vgUq5qqnmLuIgBjWHAR33dAENpLDEkGA/go/bK
 50mQ==
X-Gm-Message-State: APjAAAXyx5h0AxZuVduyZTKOzhA5WgJXWX9WpZKaOnTU5d/C89mCaMvy
 B35QVf0GNnleM+YzW/5TkybW/l7vsxH0sXIwcN+KPjoh7Bo=
X-Google-Smtp-Source: APXvYqzOdtpqBR+VS0k6Ta6hNeonPjvN9b9JGNm7ZW91LH9shGbZqxwmzdnKUNUq9kFDLxoZhEzRRXBvMLuLd4eDGiw=
X-Received: by 2002:a63:4d6:: with SMTP id 205mr1586151pge.10.1582844633220;
 Thu, 27 Feb 2020 15:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20200227213450.87194-1-palmer@dabbelt.com>
 <20200227213450.87194-4-palmer@dabbelt.com>
In-Reply-To: <20200227213450.87194-4-palmer@dabbelt.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Feb 2020 15:03:42 -0800
Message-ID: <CAKwvOdn0wuytFTkJRm7u5vGUTWyYnrXdGGXHfoOfg6ndzT+u8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Stop using LOCAL for the uaccess fixups
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_150354_732548_66548F8D 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 kernel-team <kernel-team@android.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 1:35 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> LLVM's integrated assembler doesn't support the LOCAL directive, which we=
're
> using when generating our uaccess fixup tables.  Luckily the table fragme=
nt is
> small enough that there's only one internal symbol, so using a relative s=
ymbol
> reference doesn't really complicate anything.

Is `LOCAL` a macro for `.local`? (Looks like no). I would think
`.local` is supported, but `LOCAL` isn't something I've seen before.

Ah, looks like it's local to macros:
https://sourceware.org/binutils/docs/as/Macro.html#Macro
"Warning: LOCAL is only available if you select =E2=80=9Calternate macro
syntax=E2=80=9D with =E2=80=98--alternate=E2=80=99 or .altmacro. See .altma=
cro."
https://sourceware.org/binutils/docs/as/Altmacro.html#Altmacro
Link: https://sourceware.org/binutils/docs/as/Local.html#Local

But these macros are setting .altmacro...
So it looks like Clang's integrated assembler doesn't yet support
`LOCAL`. Filed:
https://bugs.llvm.org/show_bug.cgi?id=3D45051

If we're no longer using LOCAL, do we still need `.altmacro`?

I also see two usages in:
arch/riscv/kernel/entry.S

Would you mind fixing those up, too?

Otherwise patch LGTM.

>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/lib/uaccess.S | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index f29d2ba2c0a6..40bf130073e8 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -5,12 +5,11 @@
>
>         .altmacro
>         .macro fixup op reg addr lbl
> -       LOCAL _epc
> -_epc:
> +100:
>         \op \reg, \addr
>         .section __ex_table,"a"
>         .balign RISCV_SZPTR
> -       RISCV_PTR _epc, \lbl
> +       RISCV_PTR 100b, \lbl
>         .previous
>         .endm
>
> --

--=20
Thanks,
~Nick Desaulniers

