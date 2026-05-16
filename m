Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC239CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPD0K3pr+iOfQVATqB71Nn0mm2P7UKvZJEAg1RI1sZU=; b=luisWfLZxnQ/RF
	bjEJkAVmMtEqIJK+bW+LGLIqvja0u+TaU9wfak5AdiuQq1Yg330+O0hEiJeT/UOiyCBW8P+OEWD3p
	mSOhJ/Km8BV7hjXKc/JHeGcMUq+byOwCWTSyu1pROkk0+DH21Z6ECk8d4V/LKDtaHSPwepm2z6nfD
	dRx9IwJv+VzqV/IscQNOHFawJ3JKgJfaS8vqWXrYUqcwoT183KgajPyUBqxnv7QRqsp/8+h2AS8Q/
	8l5Jnju0Fm2vnsaeE8Ar0fq6Kwnq+WECSuSPx36aMctnhE6wNwOHijnfTAtuzk4HPh0FnBberOyaE
	lKzyBk1p+8IubgJ9m/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJ7n-0000000B92V-2r3R;
	Sat, 16 May 2026 17:48:31 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJ7k-0000000B91t-1naM
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 17:48:30 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-65c21049dafso1084390d50.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778953706; x=1779558506; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h1tBZhEj0+N7xH8mR9DXL2awOx7YE8ulJfOJ3TwcS84=;
        b=XuyhywWKbRAIBEd5UR9khVterOgVDz0+S0JdVYwOEuSof/5ftHgP45mkUIVTXLkYaS
         PeDddAFWe4MSvylkG7RXq6YJlMjICWmalgIqlCs82To+VzPOHONELJYs19GLDJ2tdtwn
         a5KqpNym4mf4HaxUAfIQZMxfCdOprL7PjVleqQMeOiHslBEJh7k0vhvXI3tMLQt4VrBn
         Lkyt5D+XCjz4/+V86ople7S6Urc4Xxg7XeSPIcr6ZK3UrqFIyYWpyF7z6LLMIMaqnVJa
         fwIRwvuv8KZ7r1S+VPGKKm5vZqsxaDd29dlLAotUbHsu92NdlzQ60Gn5FQ7RhAz/7fY8
         2ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778953706; x=1779558506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1tBZhEj0+N7xH8mR9DXL2awOx7YE8ulJfOJ3TwcS84=;
        b=c3pzLj64QTDp2ZRkfjJZ9+vsWFh6LQjD5qGJV4iWnYmH6N8J8vqNQcByHpIzTBn+S+
         ne0sEM67F5afHtHU3BN6WB6szfCgD66bVcp4ZVXgDeHL3XMOoPjUuPOEbLn2BgTztPnS
         SjSh/aJnUIWpI2sEAd/uvt2Rgc2pkn3X5ycMzxXJNgfwKqrcx6C5dAwTVliSmcK+qsbL
         4nlmTpp9D81VwLeyQ/kM/jA8LVXm33eyUwRzT03s7zXcV/4KuIlNwpcFZvaaDKeBsjyc
         GFUuwYzVXFanxCwRg14O3+us4nU94+9tBesDKFo6PK3RO5EXJP2uTYuJq4P9UUrJtoiy
         H9NQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UVHwmHOLuyMdUzuZk4YEiVmcKSQQ1MYpAm0poWD49sj+x/1paik63zHiQ7DEGbTJ64cnSySId2TuvTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4DTBD/Apc879OehN9XD6PqUNlaa3ZKqeugjIVOTAhJXOuUL51
	poRxGveoxQ++vrQa3Kd98tztwXPuoWhtQotv1X2p5V0aU6XGNymMM0OE63EIzts0M0I=
X-Gm-Gg: Acq92OG4LmxY9DVCq8x4raEKzw9ArIXs4yVJr3eJil4aUwCO/YO9+CouqhpZyPk8pjW
	reUUvSnc4v5HvTRhGFO708vC4iAW8ZiDzjlY+gScqQpj3BQx7K2JroOgQXtfqWDopKYZwQtGwiM
	UX6hdGOMHjZzQjhklYZvv0Gwq78+efVq1v8z5tdWQrQTH47LkVC5hZBMficqlroXWlVMG31Sq1d
	dnV5lIRT8eGQKSB8PpLTVP0K+F/0a0OaFJQ355JLlJJLeHdycsHfNcekHQUfts2fwIOT4g0X/5/
	J8WDgJ91CjeJl8ba4XW666ytjJE732WMFysDjJZyglzvDYLm5/hDMHsqZ2MS14hBNl4aeo6AG/q
	ArmGL6r1YG4U+ox1JyQk+N338j9WzFoABUiAFpW7pX8wFbXv1Z0jSgy5wii2HFtirO25pFleXNz
	3OOcult9WC/0CRad1siOcuwBcJI/EZnFkQh4yjQTRhZqbsRWyBqX+BQBefsIq/g66k5cCb
X-Received: by 2002:a53:ac96:0:b0:65b:f634:e89b with SMTP id 956f58d0204a3-65e22834cd7mr8785006d50.48.1778953706528;
        Sat, 16 May 2026 10:48:26 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:404d:bcd6:3f7c:3a9c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db6f4f4sm4146949d50.15.2026.05.16.10.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 10:48:26 -0700 (PDT)
Date: Sat, 16 May 2026 12:48:04 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cfi: gitignore generated vdso files
Message-ID: <6u2ysyepovq5w2vffev4snbtj536sieivk2m53edenfbobx5rr@lkuwbv6rbw2c>
References: <20260418-vdso_cfi_ignore-v1-1-f4b89f5b0d3b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260418-vdso_cfi_ignore-v1-1-f4b89f5b0d3b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_104828_593860_F2854F8A 
X-CRM114-Status: GOOD (  21.52  )
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

On Sat, Apr 18, 2026 at 12:31:08AM -0400, Charlie Jenkins wrote:
> During compilation, the standard VDSO files are copied into
> arch/riscv/kernel/vdso_cfi. Add a .gitignore to prevent these files from
> being tracked by git.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>  arch/riscv/kernel/vdso_cfi/.gitignore | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/vdso_cfi/.gitignore b/arch/riscv/kernel/vdso_cfi/.gitignore
> new file mode 100644
> index 000000000000..8bc6f31c8ee6
> --- /dev/null
> +++ b/arch/riscv/kernel/vdso_cfi/.gitignore
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +*.S
> +*.c
> +vdso.lds
> +!vdso-cfi.S

Thanks for this patch. I was seeing a bunch of files in gitignore like
this and this cleans this up.

Sashiko [1] seems to say that *.tmp should be added to this gitignore.
I think it's correct. I see some vdso-cfi.so.dbg.tmp files being
generated (and removed) in the build logs if I run make with --trace.

arch/riscv/kernel/vdso/Makefile:81: update target 'arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg' due to: arch/riscv/kernel/vdso_cfi/vdso.lds arch/riscv/kernel/vdso_cfi/rt_sigreturn.o arch/riscv/kernel/vdso_cfi/vgettimeofday.o arch/riscv/kernel/vdso_cfi/getcpu.o arch/riscv/kernel/vdso_cfi/flush_icache.o arch/riscv/kernel/vdso_cfi/hwprobe.o arch/riscv/kernel/vdso_cfi/sys_hwprobe.o arch/riscv/kernel/vdso_cfi/getrandom.o arch/riscv/kernel/vdso_cfi/note.o arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o FORCE
set -e;  echo '  VDSOLD  arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg';   trap 'rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; trap - HUP; kill -s HUP $$' HUP;  trap 'rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; trap - INT; kill -s INT $$' INT;  trap 'rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; trap - QUIT; kill -s QUIT $$' QUIT;  trap 'rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; trap - TERM; kill -s TERM $$' TERM;  trap 'rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; trap - PIPE; kill -s PIPE $$' PIPE; riscv64-unknown-linux-gnu-ld -fcf-protection=full -melf64lriscv -z noexecstack --no-warn-rwx-segments  -shared -soname=linux-vdso.so.1 --build-id=sha1 --eh-frame-hdr -T arch/riscv/kernel/vdso_cfi/vdso.lds arch/riscv/kernel/vdso_cfi/rt_sigreturn.o arch/riscv/kernel/vdso_cfi/vgettimeofday.o arch/riscv/kernel/vdso_cfi/getcpu.o arch/riscv/kernel/vdso_cfi/flush_icache.o arch/riscv/kernel/vdso_cfi/hwprobe.o arch/riscv/kernel/vdso_cfi/sys_hwprobe.o arch/riscv/kernel/vdso_cfi/getrandom.o arch/riscv/kernel/vdso_cfi/note.o arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o -o arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp && riscv64-unknown-linux-gnu-objcopy  -G __vdso_rt_sigreturn  -G __vdso_vgettimeofday  -G __vdso_getcpu  -G __vdso_flush_icache  -G __vdso_hwprobe  -G __vdso_sys_hwprobe  -G __vdso_getrandom arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg && rm arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp && if riscv64-unknown-linux-gnu-readelf -rW arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (echo >&2 "arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: dynamic relocations are not supported"; rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; /bin/false); fi; printf '%s\n' 'savedcmd_arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg := riscv64-unknown-linux-gnu-ld -fcf-protection=full -melf64lriscv -z noexecstack --no-warn-rwx-segments  -shared -soname=linux-vdso.so.1 --build-id=sha1 --eh-frame-hdr -T arch/riscv/kernel/vdso_cfi/vdso.lds arch/riscv/kernel/vdso_cfi/rt_sigreturn.o arch/riscv/kernel/vdso_cfi/vgettimeofday.o arch/riscv/kernel/vdso_cfi/getcpu.o arch/riscv/kernel/vdso_cfi/flush_icache.o arch/riscv/kernel/vdso_cfi/hwprobe.o arch/riscv/kernel/vdso_cfi/sys_hwprobe.o arch/riscv/kernel/vdso_cfi/getrandom.o arch/riscv/kernel/vdso_cfi/note.o arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o -o arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp && riscv64-unknown-linux-gnu-objcopy  -G __vdso_rt_sigreturn  -G __vdso_vgettimeofday  -G __vdso_getcpu  -G __vdso_flush_icache  -G __vdso_hwprobe  -G __vdso_sys_hwprobe  -G __vdso_getrandom arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg && rm arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp && if riscv64-unknown-linux-gnu-readelf -rW arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (echo >&2 "arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: dynamic relocations are not supported"; rm -f arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg; /bin/false); fi' > arch/riscv/kernel/vdso_cfi/.vdso-cfi.so.dbg.cmd
  VDSOLD  arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg

Sort of related, but I noticed that make clean doesn't cleanup these
files in the vdso_cfi directory. I can send a patch to clean this up.
Something like this

diff --git a/arch/riscv/kernel/vdso_cfi/Makefile b/arch/riscv/kernel/vdso_cfi/Makefile
index 8ebd190782b08..5aa78b85bbed8 100644
--- a/arch/riscv/kernel/vdso_cfi/Makefile
+++ b/arch/riscv/kernel/vdso_cfi/Makefile
@@ -20,6 +20,8 @@ $(vdso_S_objects): $(obj)/%.S: $(src)/%.S
 $(vdso_c_objects): $(obj)/%.c: $(src)/%.c
        $(Q)cp $< $@
 
+clean-files := $(patsubst $(src)/%.c, %.c, $(vdso_c_sources)) $(patsubst $(src)/%.S, %.S, $(vdso_S_sources))
+
 # Include the main VDSO Makefile which contains all the build rules and sources
 # The VDSO_CFI_BUILD variable will be passed to it to enable CFI compilation
 include $(src)/Makefile

[1] https://sashiko.dev/#/patchset/20260418-vdso_cfi_ignore-v1-1-f4b89f5b0d3b%40gmail.com

> 
> ---
> base-commit: 08ee1559052be302f1d3752f48360b89517d9f8d
> change-id: ${change-id}
> 
> - Charlie
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
