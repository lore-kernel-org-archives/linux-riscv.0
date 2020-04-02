Return-Path: <SRS0=CVuh=5S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777C1C2D0F3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 17:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1420B20737
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 17:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4wLMGaT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="DIJgguHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1420B20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=guC1fZiSgEL3S0epJpXk9N5uLkHmIuEzGe6F9jNE+kA=; b=q4wLMGaTFuR1uQSxYG1IfoNu6
	crlpcuNw6L2Y6bTvs7KLzD4yTlFESKvbNqiE1UsaADcTlC7bU4+xsjU5bm4qJVsw9F5UhXqO0x/u0
	viVgeWcMvV4J+LBPzH0Fi/esPHK3sFn5WtzWdj/8gRRpoWeOGLQ+Jx5M3qkdFQ8y7ID8K1uDELVfR
	gcY8xdWoANa1pvN+l7iNql0aEwbPohRYAeXq6qefVftv9fT4XCV+/kNvDSCXYYfpShgQ3z3sIkukn
	CCfAT/gsp+8gHy8mId3961VjauqcTHXiTNJ789X07bRmKOhC18d3axM8n+XD1VmRFTzV4UnPT7sl5
	EW5HcCTZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK3kZ-0001aZ-SA; Thu, 02 Apr 2020 17:35:31 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK3kW-0001Qa-By
 for linux-riscv@lists.infradead.org; Thu, 02 Apr 2020 17:35:29 +0000
Received: by mail-pl1-x643.google.com with SMTP id g2so1604230plo.3
 for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2020 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=guC1fZiSgEL3S0epJpXk9N5uLkHmIuEzGe6F9jNE+kA=;
 b=DIJgguHk3AE09VWT3DJ0sns+lyhLL5Fek9BYoWxSc5CAyxUPHF+0d3SAzh2aoCH+g/
 tdzWagcY2wv1NyirdNP1ougSZVhHIAU3nf+C+k9UAE5QrzKkhWUXY5jaA8WFTh8TXVro
 KmMngX6pdwvGHDuEsGFv+J/XtSwp6DVcObvu7eWpDXubSTbezSR2uwW64ePCmA5lJ5aj
 pNBzC24v4klZBN5zPkGmA4bQsDW/d0iAYlz0j22OcMq8+W5tW90FUxMK6bkblWHlQ46H
 pyiR/AVnm3nJp+REdEuSr+biVXtMYfN3SXd9IZRqOjaxFXnfy/F28VYBjOsjnXPQmoqG
 MrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=guC1fZiSgEL3S0epJpXk9N5uLkHmIuEzGe6F9jNE+kA=;
 b=KDZnWc8elMK4lhUPLTuXThciAvKWv8iFlc0aa46ceBx7sWiNIhuSUiJvi6v55PQ0R9
 OPR0cZ4kFZ1d+b+Se942sgnqdDO/K1AA/ZaL1b2btTSKo1kYngh26B6KRraVbjHKrWZj
 Hq3u/0aIBnuKoojmJy4pphJ23HCV7PPYJcec4+aHv283opOOIobcFLf3H3QG7p+H8AVM
 wWFmhZ8o2BuCFDXuMpt4d7M95DKc+GwAnM3QXI9zzQ5HXFxoVmKjiwYiD4zww3aztMbG
 RdOJWhwkGWqcK+Y3+JWgKxdE31v/XKZrzkNMPVHY0aSiDtahDjjkTPqBhkj0E5fMiStk
 q2xQ==
X-Gm-Message-State: AGi0PuZHWjpIwxubhQPAWPDReX+qobw6rkXs3bwoNas7Cu9lHd+p5HCw
 QtRKhlGBN9hW8UPyUO56TE+r0tEtam228h9j9vMV9w==
X-Google-Smtp-Source: APiQypKhhA4JgOWnzW9wlptC/W+qeaOvq+oNcufY7wMKg5yeRE+JqU1hM/6XjzCHlWWNA5gkYgZOQdGXMZeGsT4I9PU=
X-Received: by 2002:a17:90a:8085:: with SMTP id
 c5mr4543968pjn.186.1585848925816; 
 Thu, 02 Apr 2020 10:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200402085559.24865-1-ilie.halip@gmail.com>
In-Reply-To: <20200402085559.24865-1-ilie.halip@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 2 Apr 2020 10:35:14 -0700
Message-ID: <CAKwvOdnasXV2Uw1r4we_46oGD_0Ybjanm7T_-9J83bdf6jeOAg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix vdso build with lld
To: Ilie Halip <ilie.halip@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_103528_437384_8AF352A5 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jordan Rupprecht <rupprecht@google.com>,
 Fangrui Song <maskray@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

+ Jordan, Fangrui

On Thu, Apr 2, 2020 at 1:56 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> When building with the LLVM linker this error occurrs:
>     LD      arch/riscv/kernel/vdso/vdso-syms.o
>   ld.lld: error: no input files
>
> This happens because the lld treats -R as an alias to -rpath, as opposed
> to ld where -R means --just-symbols.
>
> Use the long option name for compatibility between the two.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/805
> Reported-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 33b16f4212f7..19f7b9ea10ab 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -41,7 +41,8 @@ SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>  $(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
>         $(call if_changed,vdsold)
>
> -LDFLAGS_vdso-syms.o := -r -R
> +# lld aliases -R to -rpath; use the longer option name

Thanks for the patch.  Maybe the comment can be dropped? It doesn't
make sense if there's no -R in the source file you're touching.  If
someone cares about why `--just-symbols` is spelled out, that's what
`git log` or vim fugitive is for.  Maybe the maintainer would be kind
enough to just drop that line for you when merging?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Jordan, Fangrui, thoughts on this? Sounds like something other users
of LLD might run into porting their codebase to LLVM's linker.

$ ld.lld --help | grep \\-R
  -R <value>              Alias for --rpath
$ ld.bfd --help | grep \\-R
  -R FILE, --just-symbols FILE

> +LDFLAGS_vdso-syms.o := -r --just-symbols
>  $(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
>         $(call if_changed,ld)
>
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers

