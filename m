Return-Path: <SRS0=YwND=JX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5237C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Apr 2021 16:46:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6616101C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Apr 2021 16:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6616101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tDuLELCSbM9EvQnjXjZ0Oeg+ALuEZ76EG3BvYPrfVu0=; b=lkWzGb7Im24bcS6x1s3fn1bXX
	uej/zjHrhXMej4Sv9NkOVJttX418m/YP9eS0IJwmfLvQwvnH+j1UGmBeMGivvR8rGze/F9bmaUZiF
	PHt0XfHkWh14xa8eEjT3YNbAA1fJt3+8cTiOzMKEipCtg3u2lcuGte7BDV/5LEH4rDCq/Soe9Lz3B
	QQKL3SVztwHjfg1I+OqKG2xskyr4221c9nqLYbppoywvlT1dyZKfuLOZCT4QmvjIxssXQUbGwTaN1
	hGvAiHxdENZUICFuYsGWc9FbS9Ox2po01EACwBlztmdE9ZGyMR44si0lelxuRS2Op5c8DECPpTee5
	K8uhVi21w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb4Nd-00876I-D0; Mon, 26 Apr 2021 16:46:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb4Na-00875z-2E
 for linux-riscv@desiato.infradead.org; Mon, 26 Apr 2021 16:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S+cgDeAfZzzmuCTTq4lC5PvZ1hvbfvFcMRWuLEIgDNM=; b=LDVBqGA2DGfO34iRoigOxl+aNY
 ToiZppVncIUmRFLCfRBJ03yIFtJdk0dogQnblE/hhKVls6uTMut0upWEtx4KABFwa2OAt4LboyMZF
 /M8vjox+jFUg3HUJdoMHHOWIxueOxz0ywkM797zBKFzPJnlEsTNKHHFIHnZdrGyY//8La1iFcCeRt
 KGsFkZboVx52Wd/SsANLJoAqmFMwMhZsgZIBj8da+tecOp5KxVxG2yJdeM00AXIEZid9Ecu44xr67
 nXP/EpiaeDY9iQ6jVcLJXKHGUWKMwfZ4xEmz4UA5ijpcxrBIfXjjz1nq2YGfIyCBZJYUHIfoVfnMw
 61odoNVw==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb4NT-00G6SI-H1
 for linux-riscv@lists.infradead.org; Mon, 26 Apr 2021 16:46:33 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n21so9236313eji.1
 for <linux-riscv@lists.infradead.org>; Mon, 26 Apr 2021 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+cgDeAfZzzmuCTTq4lC5PvZ1hvbfvFcMRWuLEIgDNM=;
 b=lkECTZxtYGXafDLJP7gcUe64u+wM11kk0hx2AVgnxCgsxjNdrKGXelp0XWzjzW8BaV
 NiJWu26mb53eN/c3AjVrdTyjhbQU8SVvQGEaZCWuaB0IHie1Y7FC+5jurVJIviX0HYt7
 D8mdWbMEF8cqs3fPeUQ0ilHqkrRBSevyC7rL61Gj6Yq7Qbklr7m2UtnK0I9TlbXKbCpy
 /cbvn1TLcOxrOFC+bWhLc1IUWFFowNWOTpHL92+8AGzgtTvS3Yvx+imkFtEHDCFsQ6lw
 UERhY0vkTjn13WVfN9A2gBJi9+S7DnXOeFKWv2rK3LenyunLxtbckBK0Sej49btV/Rm0
 7Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+cgDeAfZzzmuCTTq4lC5PvZ1hvbfvFcMRWuLEIgDNM=;
 b=ED6uzSQxBaOKs7oAZI4/0XYBdYycl0rsJs25gSXrX50nv9RJ5JPE1AvMysKqGw+oKu
 6j5Z4mhLv3Dn3pFDZE3E8qwLrBLTs+yRI5JShTF/yj1UQ2y4jQjyF2TjTh4Cj+WsVJvO
 1jPntEhbw4aF05Zs/udmsXJhNZ+q/aJaNwjUoEqXb0+XRcCp36DiIqxCm4aeDReIH48A
 OdYCfiJ+kBQlylZMgfQTMOsVPklj0uSRc2g9yDOZ0MGN5z4IEw5M8DoRLJjENhwl46Pw
 Vdr5neQkoZC1ToCyta/e4CAtVlSuUsLVewvlB43vMOOVfq09f9hiXoEh+2dKdsrkG99u
 bAiQ==
X-Gm-Message-State: AOAM533nSMQawZrNKq1TflMR3wkDttOOaFd/QGW0Yh9B+wTkSeQ4Pa2Y
 jvJKfXIdRBJo1dyESnMq2Td9I4AZE88lgXIfGRcNPQ==
X-Google-Smtp-Source: ABdhPJws/y0oULVP57G4/mhkzRlFFYXwQtjXS/r9gsn/T4CCZJ9e2nplrFWa9TdmZd0Bs4ayfImWcKyFyY4sxmAp7k0=
X-Received: by 2002:a17:906:688e:: with SMTP id
 n14mr8886230ejr.375.1619455587957; 
 Mon, 26 Apr 2021 09:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4kBBJChiqkarKwn3roe+BLotsGDptfmYKKDxE45AnFZNUoPw@mail.gmail.com>
 <mhng-08bcf932-3a06-43cf-b0b0-9614d09aa17d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-08bcf932-3a06-43cf-b0b0-9614d09aa17d@palmerdabbelt-glaptop>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Apr 2021 22:16:16 +0530
Message-ID: <CA+G9fYv4y+n6PoYf1jOPZbjPxY7rTi+Ajc89zsNzTS0_uL+RJw@mail.gmail.com>
Subject: Re: [PATCH v8] RISC-V: enable XIP
To: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr,
 vitaly.wool@konsulko.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linux-Arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 lkft-triage@lists.linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_094631_666807_8E956F02 
X-CRM114-Status: GOOD (  15.50  )
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

my two cents,

The riscv build failed on Linux -next 20210426 tag kernel due to
below warnings / errors.
Following builds failed.
 - riscv (tinyconfig) with gcc-8
 - riscv (allnoconfig) with gcc-8
 - riscv (tinyconfig) with gcc-9
 - riscv (allnoconfig) with gcc-9
 - riscv (tinyconfig) with gcc-10
 - riscv (allnoconfig) with gcc-10

> >> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >> > index 30e4af0fd50c..2ddf654c72bb 100644
> >> > --- a/arch/riscv/kernel/setup.c
> >> > +++ b/arch/riscv/kernel/setup.c
> >> > @@ -50,7 +50,11 @@ struct screen_info screen_info __section(".data") = {
> >> >   * This is used before the kernel initializes the BSS so it can't be in the
> >> >   * BSS.
> >> >   */
> >> > -atomic_t hart_lottery __section(".sdata");
> >> > +atomic_t hart_lottery __section(".sdata")
> >> > +#ifdef CONFIG_XIP_KERNEL
> >> > += ATOMIC_INIT(0xC001BEEF)
> >> > +#endif
> >> > +;
> >> >  unsigned long boot_cpu_hartid;
> >> >  static DEFINE_PER_CPU(struct cpu, cpu_devices);
> >> >
> >> > @@ -254,7 +258,7 @@ void __init setup_arch(char **cmdline_p)
> >> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> >> >       unflatten_and_copy_device_tree();
> >> >  #else
> >> > -     if (early_init_dt_verify(__va(dtb_early_pa)))
> >> > +     if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))

arch/riscv/kernel/setup.c: In function 'setup_arch':
arch/riscv/kernel/setup.c:284:32: error: implicit declaration of
function 'XIP_FIXUP' [-Werror=implicit-function-declaration]
  if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
                                ^~~~~~~~~
arch/riscv/include/asm/page.h:112:62: note: in definition of macro
'linear_mapping_pa_to_va'
 #define linear_mapping_pa_to_va(x) ((void *)((unsigned long)(x) +
va_pa_offset))
                                                              ^
arch/riscv/include/asm/page.h:156:27: note: in expansion of macro
'__pa_to_va_nodebug'
 #define __va(x)  ((void *)__pa_to_va_nodebug((phys_addr_t)(x)))
                           ^~~~~~~~~~~~~~~~~~
arch/riscv/kernel/setup.c:284:27: note: in expansion of macro '__va'
  if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
                           ^~~~
cc1: some warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>


steps to reproduce:
---------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch riscv --toolchain gcc-8
--kconfig allnoconfig

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
