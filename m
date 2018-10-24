Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD12ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3F020652
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 21:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EiSLbJ8d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCBsGSPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3F020652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8AcqA0rb6M8TtWWinmWi8obki58rKkCVxFzBSiIjLM=; b=EiSLbJ8dYuGvpT
	HKdSAAu7DsPbK45lHjsh6BsSB/WGZ6KPicYShuIbI2jn4VbmegQ/JiS4I1tPGYL9EHo7+PAa0TNdx
	9q1dYyT1ixXuJTqwqqiY3u2/bkBaTnTo2lQ3+LwHppnyxyH0qt5XvotYL99kMPNKiGUWFa2tLkzbO
	2LVbIjyeVqm9At33oYAT6/PkLySUTYy2UHq5L838I4Ku85fQ/dTlxmquAlTddzWBU747niYuWVwK2
	HBDCl6uwN2CFBisvKeLPT4WYqA0yF7uPTY61ftJnkkV30xY20YZgEYC3R7W9/ihUENHt7FRsH1n7p
	ONgJpgGQgUMJc/sYwiUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFQzu-0001rj-Dx; Wed, 24 Oct 2018 21:47:26 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFQzr-0001rN-Uk
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 21:47:25 +0000
Received: by mail-yb1-xb44.google.com with SMTP id e16-v6so2795095ybk.8
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SpR5PQEROeAv83K8afXyXqw/J6C4jmUgmC8hplFSm64=;
 b=oCBsGSPvBXL9EdKvmdPAdDzC7A9Qss8d1x8bQ/yaE6M3uDeDhAAvtguMgfVypcGsiO
 /+jdM/3i/GmYoSHC3u1q61BcgiwQkl4nPwCVqmcxJlUl5lrx2OfUcDtPYzUU0e5TkFqI
 86g4SpeZkJr47G5yf6Y4PY5xW7HlrHr5Vn9Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SpR5PQEROeAv83K8afXyXqw/J6C4jmUgmC8hplFSm64=;
 b=Dkc7N0f8yYoEVWqN/8s1Uu6ydkjzhwNyhDSVQI5+mKw8BfKvtf9UKQ+DcGQvT6GJlp
 ikSwI8ZGGBe5omEoRCoH1v12w/KtLeKWQXMtN4qq9TACcINkQfdVng9wj0scc8A1hyNm
 8NosVhxNcdEWi5qwraCoGGDDnktAFx5BmJR6RQ/xtt1fyddIfXagsAzA0DXC9SE6JC83
 8X+149K47tYGsKn/mHd1g5rUZIpn3cjX/JYPgy7OQxOcJixOsEkp9PxFg5AhWdkJgF24
 mfN30ADuFey6mHzay2tbrDdcfEU50fbzeHT8mGo4Wpi8NeX0/xNqFWPJTVyH1aTmzPDv
 DlYA==
X-Gm-Message-State: AGRZ1gLbtEc/5a5j88yHfazwmK9HBZCh6OpKxfc9up9txVn2kdAg5zKA
 oHawpAO3x3aTs85XZG+9WXkTLvSKwck=
X-Google-Smtp-Source: AJdET5c3WIuzLqv8/U1HUQY7fUdJ3dA2yt95gszoYXQ68WT0weWcWd9fN+d8qy+GFkVIRmC2xO4PxQ==
X-Received: by 2002:a25:bdcd:: with SMTP id
 g13-v6mr4079667ybk.253.1540417631932; 
 Wed, 24 Oct 2018 14:47:11 -0700 (PDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com.
 [209.85.161.54])
 by smtp.gmail.com with ESMTPSA id a189-v6sm2588159ywg.65.2018.10.24.14.47.11
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 14:47:11 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id v199-v6so2745270ywg.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 14:47:11 -0700 (PDT)
X-Received: by 2002:a0d:fec6:: with SMTP id
 o189-v6mr4082861ywf.237.1540417324661; 
 Wed, 24 Oct 2018 14:42:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 14:42:03
 -0700 (PDT)
In-Reply-To: <20181024204036.8799-3-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 24 Oct 2018 14:42:03 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
Message-ID:
 <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_144724_033629_C1CFC2C4 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Paul Moore <paul@paul-moore.com>, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, David Howells <dhowells@redhat.com>,
 Linux Audit <linux-audit@redhat.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024214203.--r16WEJ637kvwHCuQ8-w-wJuiN-6AIfyyu-JvJpuy0@z>

On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> This is a fairly straight-forward implementation of seccomp for RISC-V
> systems.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>  arch/riscv/include/asm/syscall.h     |  6 ++++++
>  arch/riscv/include/asm/thread_info.h |  1 +
>  include/uapi/linux/audit.h           |  1 +
>  5 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/include/asm/seccomp.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a344980287a5..28abe47602a1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>         select GENERIC_STRNLEN_USER
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> +       select HAVE_ARCH_SECCOMP_FILTER

I think this patch is missing most of the actual seccomp glue?

config HAVE_ARCH_SECCOMP_FILTER
        bool
        help
          An arch should select this symbol if it provides all of these things:
          - syscall_get_arch()
          - syscall_get_arguments()
          - syscall_rollback()
          - syscall_set_return_value()
          - SIGSYS siginfo_t support
          - secure_computing is called from a ptrace_event()-safe context
          - secure_computing return value is checked and a return value of -1
            results in the system call being skipped immediately.
          - seccomp syscall wired up

I only see syscall_get_arch(). Nothing is using TIF_SECCOMP (I'd
expect a masked check in entry.S -- it seems like tracepoints are
getting missed too? I see it handled in ptrace.c but not checked in
entry.S?) There's no checking for seccomp in ptrace.c, etc.

At the very least, I think the Kconfigs should not be included in this
patch. The other things are needed, but without everything else,
seccomp isn't actually available. :)

Reading the per-arch Kconfigs, I am reminded I still need to move
CONFIG_SECCOMP up into arch/Kconfig. :P

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
