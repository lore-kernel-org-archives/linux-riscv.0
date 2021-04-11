Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEDC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:20:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 344056054E
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 344056054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Xs9cm82lnd+kHY8KrGU8ltATp5cWIIYMro9OtTgswmM=; b=DHCIA3fCvtUnV/9nMK1c+G6yU
	WFjWIFHkXi9MDU9q8yxeNP1/+hyR/3UdpyRD7INw7nox92Gv7NkzYz1TISImtm0f+Z+WG1HOC36Jz
	NBWYB0FHzcQstX8Jj4h3o77x8XxkhFgracoqCy15kDJFrzHRgm75MyHq7C3BwL5nUYx94ZT8h4PjB
	Ejz9ZZyHdEJ4rue3s3z0u5awflPpAouJgsxliSnwOq9N45ZP5k7dArg6/4ZlD0H39MFKkBtD+Z7v0
	oHXclxwkaRktv4SvCBjPl+rt0aDQv6/GyxO3thJWUOuqFlXx4fJgx3Z/FceYlzVpm/9fzGSHeHpTs
	wHycE/HPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVhVF-0057Cm-Q8; Sun, 11 Apr 2021 21:20:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhVC-0057CQ-Mt
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 21:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=7HORmDFkFV0uVOag+MJUkAhWb7+U98LNc9qMttc1Fk0=; b=pKTqG7j3hLHrvVKnI+7sqnvGYw
 UOJgTun0GyDiY6Hnce7keKmBQfN5aY92FL58XiraXC2FXZef21/PzOVwWpvbooJ465CSsyG+pG876
 7L3hNQdKIJoZqAsv1Wf47h4/IzOswHoo2+wc8islct2JKuYa85qAKeh3z+oHSeJ8GeE+A02bovipi
 3CLsAcnFNv2b6bnM8EQlO4TPDhwe4Dn3kDsG1xt/kYOAb+doL5U7vIG7ecqD7RwRjQZK8OzN2nT8t
 Z2mfIH6m3S8qaQlCGc7DNJQH4KPKWsvoGmcWzl+OZndphpx1bmBqInnwgwTIIghA9dDQ7fERq1LSz
 nW6viX7g==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhV9-005kQw-Lq
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 21:20:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id d10so7798109pgf.12
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7HORmDFkFV0uVOag+MJUkAhWb7+U98LNc9qMttc1Fk0=;
 b=rmvtpQ0BoMCl/PBNwx40Ear9D5vhEadV06ELIt/174+qAbgUiRR/mYCIq1sDtNOdl4
 aCgodxSgZmUzRekhsnxl/yNM7AyEKR4Mt1CIwL/dIc8NYGpvxawrJ+GUIZojdcRD+imf
 bNmj/W9E4QD6aO38agd6qUYhrY9CPhVzReE/zFusPUin7jsKrQEQHC1xXMV945MfNRrv
 Nmg+i4jBwMvyH2bm/6Muuu3A2bgRSmUYhjG833I32smDqpAghaFmrnwDpHTt5jphOAi5
 FDC1l1RuMCTfQ+3KInIANQjEmZRae0SzVlEI/9C4kPael8l8BMIOvu47pZVXFewXwQgN
 ihFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7HORmDFkFV0uVOag+MJUkAhWb7+U98LNc9qMttc1Fk0=;
 b=A8p3WEu5KQBfbNfR0wZKmAZ3hIfIxIpkCRz13dc7lQd4AOktcoXaB0kBPTTGoEjaQu
 TBSgoK8sFKJNxbilsmKfwt4zycinZ6J4jZ7Hhj6Pz+aRpCaUsHhQQmW3ds9YSgiUo3IN
 5+od8giXmLY2J5aPSK8BXrwYpHU3kZ2Bc+QgHbtRZQbI5ym/dgc81pvgHS+3DCtmQKAE
 UY0Vnr58iAFO3a3UcFwAQqPV3ynnfLcCvbAzn9yEkLdnhmscyOy6lsAztcZaa0JptY69
 jD7gcL86/g2auiue49HlVKwY+4YDlE6pRsvL+iK0x3ySo982ggBJBexCRuvv+TdMNxFW
 l2gw==
X-Gm-Message-State: AOAM531YqgIzL72gsHAi2tZmbo3hW9XhShmgcyYhga47E2zCQN8alyyI
 Vybml5L2cBJiSqYQOFxji0S6SQ==
X-Google-Smtp-Source: ABdhPJxZxPao1Kce4ZovCQiCxycS+kWi8jZjrAHWK87MN5OrHWXptmi4arfUWylnGV6V0DVSqNltMg==
X-Received: by 2002:a65:640d:: with SMTP id a13mr23133579pgv.272.1618176013615; 
 Sun, 11 Apr 2021 14:20:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a20sm6661204pfn.23.2021.04.11.14.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 14:20:13 -0700 (PDT)
Date: Sun, 11 Apr 2021 14:20:13 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 14:20:05 PDT (-0700)
Subject: Re: [PATCH] riscv: Use $(LD) instead of $(CC) to link vDSO
In-Reply-To: <20210325215156.1986901-1-nathan@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-8efacd63-c6b5-469b-9c64-2b8092f0d3e3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_142015_743036_9F759F85 
X-CRM114-Status: GOOD (  30.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Mar 2021 14:51:56 PDT (-0700), nathan@kernel.org wrote:
> Currently, the VDSO is being linked through $(CC). This does not match
> how the rest of the kernel links objects, which is through the $(LD)
> variable.
>
> When linking with clang, there are a couple of warnings about flags that
> will not be used during the link:
>
> clang-12: warning: argument unused during compilation: '-no-pie' [-Wunused-command-line-argument]
> clang-12: warning: argument unused during compilation: '-pg' [-Wunused-command-line-argument]
>
> '-no-pie' was added in commit 85602bea297f ("RISC-V: build vdso-dummy.o
> with -no-pie") to override '-pie' getting added to the ld command from
> distribution versions of GCC that enable PIE by default. It is
> technically no longer needed after commit c2c81bb2f691 ("RISC-V: Fix the
> VDSO symbol generaton for binutils-2.35+"), which removed vdso-dummy.o
> in favor of generating vdso-syms.S from vdso.so with $(NM) but this also
> resolves the issue in case it ever comes back due to having full control
> over the $(LD) command. '-pg' is for function tracing, it is not used
> during linking as clang states.
>
> These flags could be removed/filtered to fix the warnings but it is
> easier to just match the rest of the kernel and use $(LD) directly for
> linking. See commits
>
>   fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to link VDSO")
>   691efbedc60d ("arm64: vdso: use $(LD) instead of $(CC) to link VDSO")
>   2ff906994b6c ("MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO")
>   2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO")
>
> for more information.
>
> The flags are converted to linker flags and '--eh-frame-hdr' is added to
> match what is added by GCC implicitly, which can be seen by adding '-v'
> to GCC's invocation.
>
> Additionally, since this area is being modified, use the $(OBJCOPY)
> variable instead of an open coded $(CROSS_COMPILE)objcopy so that the
> user's choice of objcopy binary is respected.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/803
> Link: https://github.com/ClangBuiltLinux/linux/issues/970
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/kernel/vdso/Makefile | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 71a315e73cbe..ca2b40dfd24b 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -41,11 +41,10 @@ KASAN_SANITIZE := n
>  $(obj)/vdso.o: $(obj)/vdso.so
>
>  # link rule for the .so file, .lds has to be first
> -SYSCFLAGS_vdso.so.dbg = $(c_flags)
>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>  	$(call if_changed,vdsold)
> -SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> -	-Wl,--build-id=sha1 -Wl,--hash-style=both
> +LDFLAGS_vdso.so.dbg = -shared -s -soname=linux-vdso.so.1 \
> +	--build-id=sha1 --hash-style=both --eh-frame-hdr
>
>  # We also create a special relocatable object that should mirror the symbol
>  # table and layout of the linked DSO. With ld --just-symbols we can then
> @@ -60,13 +59,10 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>
>  # actual build commands
>  # The DSO images are built using a special linker script
> -# Add -lgcc so rv32 gets static muldi3 and lshrdi3 definitions.
>  # Make sure only to export the intended __vdso_xxx symbol offsets.
>  quiet_cmd_vdsold = VDSOLD  $@
> -      cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
> -                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
> -                   $(CROSS_COMPILE)objcopy \
> -                           $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
> +      cmd_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
> +                   $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                     rm $@.tmp
>
>  # Extracts symbol offsets from the VDSO, converting them into an assembly file

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
