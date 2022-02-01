Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0AEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 19:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCYOjJXx5ejvB/a/d4ovIgxNJ2g/U9YfkNehVo3Mk4s=; b=PyikfJeY9cNdD6
	Z6WoVBRBZb2YHyfUNKnlX6CYj9Ejq7aUFlVtuvfRl28Q+W9QDVrPElrXpl8HOuAID2RxKG/vfg+3n
	0DlvgfBOys91bKw+ZutBR0l3MArKc4ra/fzlZHjZ0M1nTtNgCQbDcu8LPPXsNAs2Gua1iGoOn2HlO
	Au7h1TVGuvsFzitqGvX34pyjhJkbjVSpS4Q9Fxcw2VfGRPMc9k1/5pWGoDxDJ4ZrW8t8b5vBwt+h4
	agve/h5CMPIlR2655lhKC/uBcDW/kQpT20OBNHKBOUueD/46iiVytP14IA5cjRDWfwvvsQWCZvWwV
	Ybays/nFRQdVK2KUYbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEz3c-00DZOo-0L; Tue, 01 Feb 2022 19:43:16 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEz3Y-00DZO8-Ur
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 19:43:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id b9so36031053lfq.6
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 11:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zz0Xmt+zBtk7CUu8XqSyog1XhQotf3FMA2GYjydlfL0=;
 b=Htw1wDOLdqMNCyrnaaITsbOvlAbxwjaEwcX4XYqlgm3Z1LbJ3RYWnOO2iaVRV9G1DI
 jpWXX/sIE5H39nMTY5p0razkshDoBz/F6McO6YAl4cwVeBGrzqrKxlpCylg0X1daUYGM
 pN1+7jnIfqpzP1w/68gLZUxAYx6q5/epW6c8ZzbqTYLBdgBSYEuSIbf4RTYvtgOQqKhn
 6hVoaVpvltyP6VYnAqlza4uDqz2I8UVPlLlizImeDbsYw9ZdcKTRrWPMDYiVd4LnvIfl
 bLMUat+d1svMKOEcMMktaoHDYaIAxYouw3HK/LdxvxHdRjoGqvxMk1UmJZ5DI4v2Q+k6
 /e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zz0Xmt+zBtk7CUu8XqSyog1XhQotf3FMA2GYjydlfL0=;
 b=fRWeUFkRLqF9KvAUw7osUjRn9F5tQHlwdB/4BTrQAmKKK5yc3UBDPS6nopiLQSrw0b
 MuD5VLV99+AdPhtQs4bvmBADrBVZsox/lclWeW2qB96vJCLYozcKiqfRTM2SIdqBwftR
 su7mgjlv6QjZMCa10wYSsUq9LrSoCht5C0VaRg/SQyG7UOhjrqtF12K6qAjUe3KseSv5
 il6glGF+kN68qHkMXoH4Gw914OAyJ8iLtpN3FK8AoWhS8Bzut71g7Gp2o7Bvv7zxIica
 tNd5WpN4bzHZD9sC9MZ87Q9GEs4Sn9IMnmfeK0IDpP+a8CoyP1EMlUwcUv71oB6uVSNq
 A/6g==
X-Gm-Message-State: AOAM533TNfpXpyvmcLaR1P6Dlw5kAS0y4NGML6AYVES+qN8tTgqpKyUm
 KTvpjNmhkLtRl+7BlCP/NmxKMl7ATdpvl/5bc4Othg==
X-Google-Smtp-Source: ABdhPJzBJdDca+G7ILqunsKdkfH03kHFBWuIxCxfb5qUaZqVHDaeZa+DmsszEC1qJYB5VVzT0+wAjJ7b2e5N+kgFJto=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id
 g37mr20511313lfv.651.1643744591095; 
 Tue, 01 Feb 2022 11:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20220201013257.17926-1-changbin.du@gmail.com>
In-Reply-To: <20220201013257.17926-1-changbin.du@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 11:42:59 -0800
Message-ID: <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
To: Changbin Du <changbin.du@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_114313_039086_331526AD 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon, Jan 31, 2022 at 5:33 PM Changbin Du <changbin.du@gmail.com> wrote:

Make sure to mark the version of your patches (this is v2, IIUC). `git
format-patch -v2 HEAD~`

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> And they might overlap with handwritten symbols.
>
> Before this change, a dumpstack shows a local symbol for epc:
> [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> [    0.040452][    T0]  ra : restore_all+0x12/0x6e
>
> The simple solution is that we can ignore all local labels prefixed by '.L'.
> For handwritten symbols which need to be preserved should drop the '.L'
> prefix.
>
> After this change, the C defined symbol is shown so we can locate the
> problematical code immediately:
> [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> [    0.036567][    T0]  ra : restore_all+0x12/0x6e
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..8caabddf817c 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
>         /* Symbol names that begin with the following are ignored.*/
>         static const char * const ignored_prefixes[] = {
>                 "$",                    /* local symbols for ARM, MIPS, etc. */
> -               ".LASANPC",             /* s390 kasan local symbols */
> +               ".L",                   /* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
>                 "__crc_",               /* modversions */
>                 "__efistub_",           /* arm64 EFI stub namespace */
>                 "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
