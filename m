Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5F3C54FCC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 17:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A822070B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 17:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hV6hzlht";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="g9fSM/1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A822070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TqOZ+NIxx7CWkAc2Z7tIWcdMGQ0rKBuiSDleHFlId2w=; b=hV6hzlhtrwmw2g+HVpGUcyV7B
	Et9AaOx8RWAVKyeqOGo7cyc3cYh40kQUeIEkLPSGx6lrhAt5l1SCUKl3LcwYKUjLXk1Ki6/SFz+zB
	rwdAJgl9lfXT+Kz9vrYVzMYq70LIKVg/MenhQ+xGo/f+ERFnCCGD2vA8pvOAKzaCWrDW1K/HgCfhI
	5VdLRhzECUXV4ncIV5yDS0aCses7ouoeIXnikjwmz24zsK9qkCquzopoP0iMbOOGw7il5Njbou2oL
	WhBO/FsxLjEKQgnch/L//Jqhs3NsmXw5fZ5KR4unxrOyYhH6ABmXL6IBWUk4Z23mOvgqRLf3XAaxf
	9kOJXpoRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQwjA-0001bP-Ew; Tue, 21 Apr 2020 17:30:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQwin-0008JY-RY
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 17:30:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id j1so11939741wrt.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TqOZ+NIxx7CWkAc2Z7tIWcdMGQ0rKBuiSDleHFlId2w=;
 b=g9fSM/1mOQ8JhLXjvEAT44BjKSCUS05HYGGctXhqW0SL/vlyMFcaFjr7QjobHlV5g7
 t1lv6BTJzwmxXK0MeqbycCPy1qDf6jW3MvwiZdm6Ax+YnsOwi752gyD7RrdCigNe85Q3
 XT/7Bak1Vio3Vj0UA73N0ze5mbj60iDMf/38CTtK4bR4GJyHWWWgaKSb2PYH/FaoAPaN
 puKtbXD0U7DMTOzqdmBPFJMRDOJ76At8MSAJH9ISkeq68N+UPIzpLNiU/6m5BUOOwFaW
 FVe5v0qaaDqzbZOKoZDzQKit6MPiOhfy0axa97GmsqyJTYsQQzq8okwvRUmuXhuoLtF1
 fILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TqOZ+NIxx7CWkAc2Z7tIWcdMGQ0rKBuiSDleHFlId2w=;
 b=Tu5Q5/mhys2ADLmzIkbg6AyOYcPHr5vHi99uxLKuKOheAWncTIVkMnZnACenjNMp00
 EDE9iyoRnCu8r0Gf1WH95LOtRcEGVhFUAtOjyETK1m2/w/YqR49HwJ64dzb0C08aqOI9
 7jGiHG4+DdaiMKpZZ9DnwxStk17rR+7FzRceUBjckKyznq+Cwhl3lX84KVt7Vhu5FbfJ
 6Ca6gKyW0Wfwu2R/j/9SI3XSA+OaBd4bpvkjTKM9sZjG39H8Pg8tIkk0AhDMrUCuwsJX
 p+ErjHZC7MMl476NBY6AXMQ1jbjzrxBoCcWPVVqY0MTWqgjA1SXJjZc9CsayFBRugL8j
 OLHQ==
X-Gm-Message-State: AGi0PubYoKTu720GEmbIvBahkLKGEoVTFjqC29YNsAL3f1oKVOO4V2Xe
 21Kl0Ly7+nRiNrUH0mC8duJLIag1jcO4GT3/Nqoe
X-Google-Smtp-Source: APiQypKwTgmDh5dweCPXKSpnKdXbfJfMUJkZfbPD8dt0zPOvwlJJ58AVBwoIgpbu3/5RiL/cVKnV3rc2Bn1Qof2L61g=
X-Received: by 2002:adf:ab5c:: with SMTP id r28mr21585012wrc.384.1587490206521; 
 Tue, 21 Apr 2020 10:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200421033336.9663-1-atish.patra@wdc.com>
 <CAMj1kXEXTq8RhD-AM4i3ZmXRcLDTW8waNDbWNa0V8V1nz4zb_A@mail.gmail.com>
In-Reply-To: <CAMj1kXEXTq8RhD-AM4i3ZmXRcLDTW8waNDbWNa0V8V1nz4zb_A@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 21 Apr 2020 10:29:55 -0700
Message-ID: <CAOnJCUK3kTVo7fMWto0GtQ2RCVeP_WgFhkCgdnGj1XOteMjT-Q@mail.gmail.com>
Subject: Re: [v4 PATCH 0/3] Add UEFI support for RISC-V
To: Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_103010_207602_3C4E1AFE 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2020 at 12:24 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 21 Apr 2020 at 05:34, Atish Patra <atish.patra@wdc.com> wrote:
> >
> > This series adds UEFI support for RISC-V. Currently, only boot time
> > services have been added. Runtime services will be added in a separate
> > series. This series depends on some core EFI patches
> > present in current in efi-next and following other patches.
> >
> > U-Boot: Adds the boot hartid under chosen node.
> > https://lists.denx.de/pipermail/u-boot/2020-April/405726.html
> >
> > Linux kernel: 5.7-rc1
> >
> > OpenSBI: master
> >
> > Patch 1 just moves arm-stub code to a generic code so that it can be used
> > across different architecture.
> >
> > Patch 3 adds fixmap bindings so that CONFIG_EFI can be compiled and we do not
> > have create separate config to enable boot time services.
> > As runtime services are not enabled at this time, full generic early ioremap
> > support is also not added in this series.
> >
> > Patch 4 and 5 adds the PE/COFF header and EFI stub code support for RISC-V
> > respectively.
> >
> > The patches can also be found in following git repo.
> >
> > https://github.com/atishp04/linux/tree/wip_uefi_riscv_v4
> >
> > The patches have been verified on Qemu using bootefi command in U-Boot.
> >
> > Changes from v3->v4:
> > 1. Rebased on top of efi-next.
> > 2. Dropped patch 1 & 2 from this series as it is already queued in efi-next.
> > Changes from v2->v3:
> > 3. Improved handle_kernel_image() for RISC-V.
> >
>
> Thanks Atish. This looks nice and simple now.
>
> I will need an ack from the RISC-V maintainers on these, and it is up
> to them to consider whether the changes to core kconfigs and makefiles
> are likely to cause trouble or not. If so, I am happy to work out a
> way to merge this via a shared stable branch.
>
@Palmer Dabbelt : Can you take a look at the series whenever you have
some free cycles ?
We would like to merge the series sooner than later.

>
>
> > Changes from v1->v2:
> > 1. Rebased on 5.7-rc1.
> > 2. Fixed minor typos and removed redundant macros/comments.
> >
> > Changes from previous version:
> > 1. Renamed to the generic efi stub macro.
> > 2. Address all redundant comments.
> > 3. Supported EFI kernel image with normal booti command.
> > 4. Removed runtime service related macro defines.
> >
> > Atish Patra (3):
> > RISC-V: Define fixmap bindings for generic early ioremap support
> > RISC-V: Add PE/COFF header for EFI stub
> > RISC-V: Add EFI stub support.
> >
> > arch/riscv/Kconfig                        |  21 +++++
> > arch/riscv/Makefile                       |   1 +
> > arch/riscv/configs/defconfig              |   1 +
> > arch/riscv/include/asm/Kbuild             |   1 +
> > arch/riscv/include/asm/efi.h              |  44 +++++++++
> > arch/riscv/include/asm/fixmap.h           |  18 ++++
> > arch/riscv/include/asm/io.h               |   1 +
> > arch/riscv/include/asm/sections.h         |  13 +++
> > arch/riscv/kernel/Makefile                |   4 +
> > arch/riscv/kernel/efi-header.S            |  99 ++++++++++++++++++++
> > arch/riscv/kernel/head.S                  |  16 ++++
> > arch/riscv/kernel/image-vars.h            |  53 +++++++++++
> > arch/riscv/kernel/vmlinux.lds.S           |  20 +++-
> > drivers/firmware/efi/Kconfig              |   2 +-
> > drivers/firmware/efi/libstub/Makefile     |  10 ++
> > drivers/firmware/efi/libstub/riscv-stub.c | 106 ++++++++++++++++++++++
> > 16 files changed, 407 insertions(+), 3 deletions(-)
> > create mode 100644 arch/riscv/include/asm/efi.h
> > create mode 100644 arch/riscv/include/asm/sections.h
> > create mode 100644 arch/riscv/kernel/efi-header.S
> > create mode 100644 arch/riscv/kernel/image-vars.h
> > create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
> >
> > --
> > 2.24.0
> >



-- 
Regards,
Atish

