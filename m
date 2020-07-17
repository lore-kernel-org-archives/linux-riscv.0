Return-Path: <SRS0=PiI0=A4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6DFC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6F421744
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zoz5vlzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6F421744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lWqU/I/Cx9Vz1N+7tajMaWHrGrWHhRhjPdA1DW7E64w=; b=Zoz5vlzv+eFzqI1Q3K2fCLgLk
	DNSxVowK1jOA5oiSM4ToiacrZ48vvBYEHgQPaWENrqwdBi3ks2zkQzuKGcNVSxllcV2w/TXJ7LJOC
	gzGR/rzykW54Pu8D4ehYgXkR7ETTe/yKxmoZ09ItKIkZFgE66A8SZY14vmQvAjgZ2ESx7wvY6P7er
	2+KdbE2/dqByGtNMO6WhP32Lvws7tEcpFltTNT77EzkksFmbUcCyTMCJP5HOz6j5iHZVXHe1x+EDJ
	wy8mr0fuUXxEEUWZP+G41PEJEMqVZIwjjU7oVfN4RO74U8xkQO3+tWLPVa0tyUErkCMH50GX0VwmB
	FWblrUgag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwJvJ-0008MM-C1; Fri, 17 Jul 2020 06:32:45 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwJvC-0008Lf-SZ; Fri, 17 Jul 2020 06:32:40 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MOi1H-1kD2vm40dD-00QEYb; Fri, 17 Jul 2020 08:32:34 +0200
Received: by mail-qt1-f175.google.com with SMTP id e12so6858091qtr.9;
 Thu, 16 Jul 2020 23:32:30 -0700 (PDT)
X-Gm-Message-State: AOAM531GHue6LSeLqjOSB+qY67SLZ6aXrJ05o/5N+ksfhd+mH08v9zkY
 Qryt468Avv0wGzf9yc7UuC/L6LwElp8MqKKtaB4=
X-Google-Smtp-Source: ABdhPJyIrO2tNL5pNeYwr+F4lkpDFfuG2l4JzP4UiWOMuiMb/Y+pJ5JATQyrKH/OqOT80hdzcJy8yYsZ1YnAf3q0N6k=
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr8943304qtb.204.1594967549456; 
 Thu, 16 Jul 2020 23:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
In-Reply-To: <20200716234104.29049-2-atish.patra@wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Jul 2020 08:32:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
Message-ID: <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Atish Patra <atish.patra@wdc.com>
X-Provags-ID: V03:K1:AdClur1+WtzBJBPh9T+kNr/9k0jIOr8xkiW2NK/a5sAE+7CilPf
 Fus0MKRNRNqPdqSAPqQ6A47YyNyPhEZcogvClDqIRjClNLh3cR9DwwtQB6ISZ8w7j7Y+V67
 OkKNQkgj5ZOccj2WbaKoEsie7Vbsgrx5e5vGeVrUpO9TFzO5bucM233blHhXkrY8/gxvljF
 5hOtrkI6t2FVVSGAR4Msw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1AZYG+Ka4k=:y7/t42FTGkPAhso94U86LE
 YWD2b0Rd9RDgqmUryFEnNJzYLPqqHRLRxMmzTt1HrP5ICGx1bMbTHme76gzeKpS2reGs0jd7b
 +ssyu5FmtX023TdClelelBO25uojA9n/cvBlkfCfxj0XDFpioU7L9FN8WWYguz3B8mu9sss1d
 p0wW5SRcxBqN9+vYrEZpSNmDhxH3CFWkGYXiMk/pFDnUoiFIehem335UFF9gFcVQYf7VK5QI6
 F4EaCSSWarzyoFsGcQIOmn+XeGXai5OpnyYHamX4cLCpielt+xtlEDvbpqdqtkmYvkoDlG8PE
 1GsueNVKiOq7GOCOH2DlC06PTVeMXpEGb692SPUm1PzNb8skotQg/AI7CTESZogJB3nw9WEvl
 30xKGYLlu27kzd1p8HhVba1mYpqmjLH7/g+j+rgmayVPXwKv1Y61rc2VRS/bx2FWcVpmUpQNc
 2izaR9DZZ73b9B8pGe60/nfMibVcbN527R2W4xhY0E2iAX6kvleOI0YSQRwuUc06WBcYjxK9C
 bMOqTy/GhlMmmhjfPs+aiH43CVhM5DtPW/4onM69mEVJFEwG1xdsn0fQs62GvefvBLuiBa7/a
 bV76TRfTJVWYc7pWxJCAARGJPC+ELTkvrfa9zTxPZ4rifQ1Q+J5v6HNx/Zh29cXol7GJmztoi
 3P+VtK8sIpg15eh8nJOG/nGfEF7nOi0SN7gD1DbdiB4TtXeHXn1XdUlFooTHUx9Y4MuEHRxIH
 2GidW8V6HWDoX/Uzyh/IMSlYeWmBIoVLLiW0RrQ3EllaCEcNYqT/HKL/zNiTTXa34wde9MfXh
 ue1K6Xw2muTraBzEmp86A2wKEMXy+uaqweH3nsRg4EviH+cG1GLj4mmIbSlaMYs9GTYwvZX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_023239_158832_BDA6122C 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 1:41 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> Currently, RISC-V reserves 1MB of fixmap memory for device tree. However,
> it maps only single PMD (2MB) space for fixmap which leaves only < 1MB space
> left for other kernel features such as early ioremap which requires fixmap
> as well. The fixmap size can be increased by another 2MB but it brings
> additional complexity and changes the virtual memory layout as well.
> If we require some additional feature requiring fixmap again, it has to be
> moved again.
>
> Technically, DT doesn't need a fixmap as the memory occupied by the DT is
> only used during boot. Thus, init memory section can be used for the same
> purpose as well. This simplifies fixmap implementation.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

The patch seems fine for the moment, but I have one concern for the
long run:

> +#define DTB_EARLY_SIZE         SZ_1M
> +static char early_dtb[DTB_EARLY_SIZE] __initdata;

Hardcoding the size in .bss seems slightly problematic both for
small and for big systems. On machines with very little memory,
this can lead to running out of free pages before .initdata gets freed,
and it increases the size of the uncompressed vmlinux file by quite
a bit.

On some systems, the 1MB limit may get too small. While most dtbs
would fall into the range between 10KB and 100KB, it can also be
much larger than that, e.g. when there are DT properties that include
blobs like device firmware that gets loaded into hardware by a kernel
driver.

Is there anything stopping you from parsing the FDT in its original
location without the extra copy before it gets unflattened?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
