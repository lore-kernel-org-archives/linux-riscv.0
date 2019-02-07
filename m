Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDF4C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 23:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6A22175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 23:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K7qq3s9K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJDyH/K9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6A22175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9h2BSop+wvPZA1Kj/ubyjq1+BgXMTS4Q1hq7vq8Xw4=; b=K7qq3s9KXotYDb
	Zk1QCMaDRLWl1XYHhHtIwzkqwdJ4YHK8T1BYGzb2lLQDvZB6EV21xNgk90CUE0U7tonY279dSFLgz
	+zO4/lUfQ0M1ohtpzs4RQWPguquDsVmXB+x36L3ymL4i5BN9+u37UqYKfDv1HMWo5yrREghjfSgem
	RL3af+NecP/8gLIW6e+egBgkBjkWgEoZacc11hS65iCTmikC5ic9vW7Y8U/K5bjELO9+JHIEataOV
	56F3rx0bHYnqSFbdFy8jhXr5r7m6L4rQtDqG3Y/H20zk3mfDu/aDISV1odawz6lO56QQ52cfw+t5p
	x5B4hWTwqOr75FzUEXgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grsiC-0005qI-U6; Thu, 07 Feb 2019 23:04:04 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grsi9-0005pl-Hm
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 23:04:03 +0000
Received: by mail-ot1-x344.google.com with SMTP id 81so2892861otj.2
 for <linux-riscv@lists.infradead.org>; Thu, 07 Feb 2019 15:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCv5/PGVNNWxs0HHsLz6/g8Xq2Ki+V4/UVfXStq6QTQ=;
 b=hJDyH/K9RtnTqhzjiYKO1iihOp8ZCRB4XYt2ZFijtvcO1PJ6NSKdbxbjStcqu0lU+C
 7Amr8/zEBKs03xXLMQ+2GIBKCQCqT/lptZx/E0hN8PURkqQbpVb6NS43u0OG5ra0y5W3
 nac7YdRtLG0GARFTHhkcv6NYiOf4SnQz5igyOadUhPmQUKO7k/T2aJ8VqfXUTnNN6/5I
 XjLPDyHkWYjI4/kShesbVqkaGXS1ZbTQbG2uOJ4EDxbBZv7NfGURLBFvs3+YSwvlDQYD
 txhfYSFkc9zOQ9JET8EXNW566W2IjDs9Fqpm66ChDtsqvJvqs41i7KCWaAiTxYbOMibU
 lg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCv5/PGVNNWxs0HHsLz6/g8Xq2Ki+V4/UVfXStq6QTQ=;
 b=g8b2Apf4YFfuYes1jv3GQ+SmGc1a2baZqsDk66Bb3UyFgbf9Ly2r0F73xww6UdLOEd
 IBHK5+M7qUBIiFLDstSQdISCYHoNEF8BSfpmWr8lHhQ1rjm7cFssO2te1hcqKAP5I5Xe
 BKtCs6wdP45IDlm3oOR+uQMHgOosKUgeBC7YBXAwVtALCWlqrtQ9fTDMsXCuz9HuYFXk
 dI+IQSzpKPSrEkNxRKy9dLcJgGLyoHqIDnGEqCRtt/HqZBi28o+qNFIkGwFplwSBCAXV
 P90MqlYpV8Io8GuA1y0+jcytk2OsfCUW8Qx6u1Mj6a2RfmoXiRfQuv+J6RqVAaFmgn9w
 ngLg==
X-Gm-Message-State: AHQUAubbL44wIh/Wve1Z33r82oqEmtbS5ommpJqFidokGd22wDnksRGi
 c8cwdEvMMBxjBJsONhuUmLb6ef3PtAzq5hJTdyk=
X-Google-Smtp-Source: AHgI3IaAREbWknrsBfsKb7o6FpuXeHyLnoRE5xTFSSfTnK9cPkwr6zw/WPqP++sm+8YdQX7/k9zjqRhc2vBLXTKqDbI=
X-Received: by 2002:aca:1b18:: with SMTP id b24mr317645oib.152.1549580639857; 
 Thu, 07 Feb 2019 15:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20190207225531.19219-1-alistair.francis@wdc.com>
In-Reply-To: <20190207225531.19219-1-alistair.francis@wdc.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 8 Feb 2019 00:03:48 +0100
Message-ID: <CAEn-LTrQtL3+MQSDKQmBBx4PJGox4r5yEyHxh35VVd_D4dg0Dg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Partially revert "Remove stat64 family from
 default syscall set"
To: Alistair Francis <Alistair.Francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_150401_592975_9616EAE9 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 7, 2019 at 11:56 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> To fix systemd/sysVinit crashes enable __ARCH_WANT_STAT64.
>
> systemd failed to start with this error for 32-bit RISC-V:
> [    2.833864] Run /sbin/init as init process
> /sbin/init: error while loading shared libraries: libsystemd-shared-239.so: cannot stat shared object: Error 38
> [    2.933593] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
> [    2.934120] CPU: 0 PID: 1 Comm: init Not tainted 5.0.0-rc4-yoctodev-standard #1
> [    2.934589] Call Trace:
> [    2.934919] [<c0048a30>] walk_stackframe+0x0/0xa0
> [    2.935243] [<c0048c14>] show_stack+0x28/0x32
> [    2.935518] [<c05fa418>] dump_stack+0x68/0x88
> [    2.935788] [<c004de48>] panic+0xf0/0x252
> [    2.936041] [<c0051780>] do_exit+0x7de/0x7fc
> [    2.936387] [<c00517f4>] do_group_exit+0x2a/0x82
> [    2.936674] [<c005185e>] __wake_up_parent+0x0/0x22
> [    2.936982] [<c00475fa>] ret_from_syscall+0x0/0xe
> [    2.937673] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00 ]---
>
> sysVinit had a similar problem as well. By enabling __ARCH_WANT_STAT64
> for 32-bit RISC-V the problem disapears and 32-bit RISC-V is able to
> boot.

Hi,

This is expected change for riscv32. More details here:
http://lists.infradead.org/pipermail/linux-riscv/2018-November/002062.html

david

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> This was tested with this fork of glibc to enable 32-bit RISC-V support:
> https://github.com/riscv/riscv-glibc/tree/riscv-glibc-2.29
> commit: 04fdd476160a55792a75375ba2bf56c761f811c2
>
> I'm not sure if this is a glibc problem or a kernel problem, but this
> commit caused the breakage between the 4.19 and 4.20 kernel so I'm
> sending out a patch. Let me know your thoughts
>
> arch/riscv/include/uapi/asm/unistd.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
> index 1f3bd3ebbb0d..031b7d78e11c 100644
> --- a/arch/riscv/include/uapi/asm/unistd.h
> +++ b/arch/riscv/include/uapi/asm/unistd.h
> @@ -20,6 +20,9 @@
>  #endif /* __LP64__ */
>
>  #include <asm-generic/unistd.h>
> +#if __BITS_PER_LONG == 32
> +#define __ARCH_WANT_STAT64
> +#endif
>
>  /*
>   * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
