Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A99CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 22:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255F46108F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 22:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 255F46108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zys5uC9Bnu22dYnRSZWulnQ/tTrBgkbtzyeQiJqgd2M=; b=qkxx0JJW0yvgAk
	tlqXoZEGEv6aA+i7c/SQov0pT7OjYvBjIX4R3Kf1CXbsHZSQPtTI24gdkVPwA3ojbWr17wA5OjZon
	dhnuoVo463mBZF8VAv7AvWXtV/hxXgI6qfXhmK+f+vNYzphQIwe4x6PoZyW+qFcIEJW2xKhnmNed2
	5k/8CXVxzSJ+WpUByl6MMT7xrdbwn6ktDlLYDr2/mOpwkbcL2SJZYbCTbpfJn8ZJlDiXxAY4BiJMY
	MtznkjK9l5q5Yo5/UwISTiHm72LF3ZmHc+xcE67D23iMDqHEAeKyb6+xzY7E4h3K2yViZfZ/wNX9o
	siy3v0wRJwAuBPzhuG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNNYu-0022el-6d; Mon, 06 Sep 2021 22:58:00 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNNYq-0022e6-RO
 for linux-riscv@lists.infradead.org; Mon, 06 Sep 2021 22:57:58 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mhnnc-1ms1Px2PoW-00dorw for <linux-riscv@lists.infradead.org>; Tue, 07 Sep
 2021 00:57:49 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so872903wmq.0
 for <linux-riscv@lists.infradead.org>; Mon, 06 Sep 2021 15:57:48 -0700 (PDT)
X-Gm-Message-State: AOAM530unG6UIMqZLkX73RHHH8FTf612srldbapIos5pxFyv9n5RCenP
 zEb9OXJWqkOQfw3AX0ISfx9Lj+IJJXa05Ey5YYA=
X-Google-Smtp-Source: ABdhPJybd+qGwYmkgCeglOTQMpUSVdSEuz7TQynjmNjotazpBe8+sPR2Z8O9yxpMTxvTjr1O8ea6zGJB2jpUIPkruCs=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr1094147wmj.1.1630969068075; 
 Mon, 06 Sep 2021 15:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210906185201.368451-1-palmerdabbelt@google.com>
In-Reply-To: <20210906185201.368451-1-palmerdabbelt@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Sep 2021 00:57:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a19pW2o7TRKBgM5g3-=g_iZgS9pqdphNdu3fpY0d+L5Pw@mail.gmail.com>
Message-ID: <CAK8P3a19pW2o7TRKBgM5g3-=g_iZgS9pqdphNdu3fpY0d+L5Pw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Inform checksyscalls.sh about the rv32 ABI
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <Alistair.Francis@wdc.com>
X-Provags-ID: V03:K1:b0QtT5bjVZrDgPAXV6bnxMiWeq6o3+/jQmJKmnwsOMci0PLnhoR
 NF+tDMWIGj1XC+XSup2GfIS3QPhAVNBnkeD6x2gK2I+Y+G4SzT6t10dwd//Mxe6gybc1Hd5
 83+70nfYBNrIn5dSuIUe+PFWgOudCYXEtImcV1yBpbqgSzNhJb7NE6eGMeXJezEO5dinAAV
 3PpcW2rceClyqEf+gqsGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6SuOK37TI0w=:WJyQCjK3Yb1VWZLj3ESQhl
 8XICxM61Qe2upMEc81NhsKIGVi4R3Fx+Fh7VokVPebViJTOq3zNJrHIeE90vD3TFJFdV5q7mS
 UDbGUNCxo9YH27HURlg7Xw6m81QKk7Ipk4IPJ2R5pjWCxFQ0ZhgGKTcAKkbvviJ1SvKZVTaic
 /rgsbTRQ+Lhhp4rkzBDEwEx7FTgaScrVeeI4GyrT25KMX6jurlR3Aypvp8WPf1KpCGRjxWU+j
 RzzAprfCOGmNCkNE2VtNcxwAyKIvHy2hMOn3y/LsksVjLMPnjyqNqoW9D3RRLegeKOSU5MgCd
 3MJEWt1qzc/Y45Aga8gbtPsgPux+D6NA3jgTF6Ld9dp02bQAgeeSBkzvLhYfNQ0bL1mlHhD+Q
 ekPBnRuwEuVb7G5MqGctQZM3ZOS9XfAW0EA18Nv6BW3/hyid+bkVZgub6dtxhzr0c7PHxnhzV
 FDTYbKfev8fMSy7zcURO33v9BOPcrtTKChXDz8GuC0QtGQbJ4UXzsl4xPRyVWNQ9yWrXMOK3c
 xg2NP8hRQYhNg7rI0dLZBOe4skZADnaKeDQpOIAFV6/olhsP03OB16CYd1UVKBb0W+1nuf84D
 vKbfr1PBVPeayE41kR+344GkKPoVbxF44RlwKtq9LnkjpO47vAEV6RNlZQocjY3cZWK36wO1R
 QO47PoP+ORKJxVmD3KPNZhTy0MjQaw696gPGR8tVD4zMUOeWExlA+3Zlc8s9EormDlIzCGW9M
 sOitIYuxkXmqYo+4g1JWfByKQbn79Tna4FDYBA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_155757_218092_7F37E010 
X-CRM114-Status: GOOD (  22.00  )
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

On Mon, Sep 6, 2021 at 8:52 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> I remember having seen some build output from this before, but didn't
> know what it meant.  These are now showing up as errors.
>
> As far as I understand our 32-bit syscall ABI is fine, the issue here is
> simply that we don't need the syscalls in question because we never had
> the legacy versions to begin with.  One could imagine describing these
> constraints in an arch-generic way, but I'm not sure it's worth
> bothering until another arch comes along that behaves this way.
>
> Fixes: d4c08b9776b3 ("riscv: Use latest system call ABI")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/unistd.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> index 6c316093a1e5..cbc2646b4662 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -14,3 +14,17 @@
>  #include <uapi/asm/unistd.h>
>
>  #define NR_syscalls (__NR_syscalls)
> +
> +#if __BITS_PER_LONG == 32
> +/*
> + * RISC-V never had the 32-bit off/len syscall flavors, which means we don't
> + * need the the explicit off64/len64 versions.
> + */
> +#define __IGNORE_fstat64
> +#define __IGNORE_fstatat64

These should be in the checksyscalls.pl script: new architectures can all just
use statx() here. This has nothing to do with 32-bit off/len though, only
with time64.

> +/*
> + * RISC-V never had the 32-bit time_t syscall flavors, which means we don't
> + * need the explicit 64-bit versions.
> + */
> +#define __IGNORE_clone3
> +#endif

clone3 should be implemented, IIRC it's only missing because there is no
easy way to do an architecture-independent version.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
