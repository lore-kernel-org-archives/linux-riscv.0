Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEDEC54FCC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 21:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB55206D9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 21:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O0/W23Iy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="KlbdCHno"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB55206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mGu2WThtBl1zhV27yQH4z0XnKDROJXQ5WmCKZObfX6U=; b=O0/W23IyTweNkp
	Wgi4FOUi6uKNWj2L0pvVOgP9AUNM+7+zXMV10xf/QYNAGMsduqDgM4ORvtgEe5elFQyoypDXJdSAJ
	BBswqa3htMjhUqnmB4GwNy8tWexiEavJjIFUWSPjBYoS/Vf3ezTEf6UIERXLik5rqY5SdamMGeyEL
	IP5u5H3cgK/drig4ev7F9icI7ASrslAHSlK1WSkBnvt8ZpyheniiI3UmHxp1cWpQEuCH8RAEXdi7B
	Q0XYQ9bueWAMktosbnZEjCRLwnJjxP10KyzWTY0rRmiyUURUCLvvZpuoxSdRRc+Y9Wpfn3B0SEVRK
	fbd41PbeaAdHnxVtIpPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQzzr-0001oC-RX; Tue, 21 Apr 2020 20:59:59 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQzzn-0001m6-U6
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 20:59:58 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 7so1595701pjo.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 13:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mGu2WThtBl1zhV27yQH4z0XnKDROJXQ5WmCKZObfX6U=;
 b=KlbdCHnojvjaEF7+cAxyf78C/VlfZSzasrdQ3RUbK9QsCxPbTNAm2nSkTQtm2PrkPw
 lxPZo9y1i8VC+MUrciBYyjYrDZoMoC/wrCiIuzwB1xCmJ+fVFv7Ns/LcnTU4oLSr9IhH
 BwTnF6cvtZQ+whqoUU2nu7mSQxNJfMCZdWNCkw4moeOYYS0ZOX6Y60e3+a+z6/RZoI+Q
 u+e7nlBVK6OF4dFpl70X56alU0aphwO82jX2ZFFY1LgAnI5zXze0HswnR+VeO3ZPgOHk
 lCnEJ3XE+ViryTY7yrq6QuPxfpgHnx+o4DntVa7UpAPteJ1fOACt+pVJDo6C3rZCMXuq
 23eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mGu2WThtBl1zhV27yQH4z0XnKDROJXQ5WmCKZObfX6U=;
 b=jINYifjF4O8yllb96VqxwT6kWdUDEPUBcE4RjZtMLT1WD0Ewi6iRHqYYZh+TyVREMK
 Aag00NYX+yRLKY7dVUVFarM2Z/T1DaMF/m3QvULKQXsMsICb3OBLELLO39jYAe/yofvE
 nfJA5qwAiHWwgFES8QEYsWi3t3kxQdkhMBAcdVj2TG/mzL8uD2+NHOlaOHodDNgjHCsF
 UFnSOGpENUYQhFtm6KQcDKa+YMzdf/UJ3crA+df5dbpcAMCQd4bwBWcI+4J+cLxaEuVK
 RBPben+sTfteiM7sH12Chpx7mjX5Wm6bIBudv6h4vz/8WgFWXfC9U0eCtg8SxtYgf5Cd
 u7jg==
X-Gm-Message-State: AGi0PuZCIdhWJpE7MySDnIryo9eqPZhyFWgE9Kj0pD+DQXNGhz9+QiaB
 gsWEMtuJ1fgQYYEAnQhMdtvkAYFltxX3Kw==
X-Google-Smtp-Source: APiQypLv+j0RYHdFp0/n8b33KtcEXNR6QCRYZKtbqHWmvnR+xe04MGRkOQVquloZaURvXnCSFOZ+1w==
X-Received: by 2002:a17:90a:1b26:: with SMTP id
 q35mr6266948pjq.149.1587502791514; 
 Tue, 21 Apr 2020 13:59:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f70sm3266534pfa.17.2020.04.21.13.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 13:59:50 -0700 (PDT)
Date: Tue, 21 Apr 2020 13:59:50 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Apr 2020 13:59:44 PDT (-0700)
Subject: Re: [v4 PATCH 0/3] Add UEFI support for RISC-V
In-Reply-To: <CAMj1kXEXTq8RhD-AM4i3ZmXRcLDTW8waNDbWNa0V8V1nz4zb_A@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb@kernel.org
Message-ID: <mhng-2320bbe6-c880-40f4-914e-a6209d0f2f95@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_135956_031574_FE3A620D 
X-CRM114-Status: GOOD (  22.41  )
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
Cc: linux-efi@vger.kernel.org, xypron.glpk@gmx.de, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 00:24:04 PDT (-0700), ardb@kernel.org wrote:
> On Tue, 21 Apr 2020 at 05:34, Atish Patra <atish.patra@wdc.com> wrote:
>>
>> This series adds UEFI support for RISC-V. Currently, only boot time
>> services have been added. Runtime services will be added in a separate
>> series. This series depends on some core EFI patches
>> present in current in efi-next and following other patches.
>>
>> U-Boot: Adds the boot hartid under chosen node.
>> https://lists.denx.de/pipermail/u-boot/2020-April/405726.html
>>
>> Linux kernel: 5.7-rc1
>>
>> OpenSBI: master
>>
>> Patch 1 just moves arm-stub code to a generic code so that it can be used
>> across different architecture.
>>
>> Patch 3 adds fixmap bindings so that CONFIG_EFI can be compiled and we do not
>> have create separate config to enable boot time services.
>> As runtime services are not enabled at this time, full generic early ioremap
>> support is also not added in this series.
>>
>> Patch 4 and 5 adds the PE/COFF header and EFI stub code support for RISC-V
>> respectively.
>>
>> The patches can also be found in following git repo.
>>
>> https://github.com/atishp04/linux/tree/wip_uefi_riscv_v4
>>
>> The patches have been verified on Qemu using bootefi command in U-Boot.
>>
>> Changes from v3->v4:
>> 1. Rebased on top of efi-next.
>> 2. Dropped patch 1 & 2 from this series as it is already queued in efi-next.
>> Changes from v2->v3:
>> 3. Improved handle_kernel_image() for RISC-V.
>>
>
> Thanks Atish. This looks nice and simple now.
>
> I will need an ack from the RISC-V maintainers on these, and it is up
> to them to consider whether the changes to core kconfigs and makefiles
> are likely to cause trouble or not. If so, I am happy to work out a
> way to merge this via a shared stable branch.

Sorry it took me a while to get around to these, but they're essentially good
with me.  There's some comments about needing ISA_C/c.li, but that's pretty
trivial.  In terms of mechanics: I don't really ever understand how to do these
multi-tree merges.  In an ideal world I'd like to have the arch/riscv/ stuff
stay in riscv/for-next, both because I don't want to deal with merge conflicts
and because that's where the RISC-V autobuilders look.

The best I can come up with is to split #3 up such that drivers/firmware/efi/
is its own patch and then send that up along with the PE header definitions
into an RC.  It'd be unused code at that point, but at least it'd break the
dependency between the trees and it'll be getting tested in riscv/for-next so
it won't rot.  We can ARMSTUB->GENERIC_STUB by just having the RISC-V support
select woth ARMSTUB and GENERIC_STUB, with a cleanup going in after everything
is merged.

That said, I'm happy if there's a better way to do this...

>> Changes from v1->v2:
>> 1. Rebased on 5.7-rc1.
>> 2. Fixed minor typos and removed redundant macros/comments.
>>
>> Changes from previous version:
>> 1. Renamed to the generic efi stub macro.
>> 2. Address all redundant comments.
>> 3. Supported EFI kernel image with normal booti command.
>> 4. Removed runtime service related macro defines.
>>
>> Atish Patra (3):
>> RISC-V: Define fixmap bindings for generic early ioremap support
>> RISC-V: Add PE/COFF header for EFI stub
>> RISC-V: Add EFI stub support.
>>
>> arch/riscv/Kconfig                        |  21 +++++
>> arch/riscv/Makefile                       |   1 +
>> arch/riscv/configs/defconfig              |   1 +
>> arch/riscv/include/asm/Kbuild             |   1 +
>> arch/riscv/include/asm/efi.h              |  44 +++++++++
>> arch/riscv/include/asm/fixmap.h           |  18 ++++
>> arch/riscv/include/asm/io.h               |   1 +
>> arch/riscv/include/asm/sections.h         |  13 +++
>> arch/riscv/kernel/Makefile                |   4 +
>> arch/riscv/kernel/efi-header.S            |  99 ++++++++++++++++++++
>> arch/riscv/kernel/head.S                  |  16 ++++
>> arch/riscv/kernel/image-vars.h            |  53 +++++++++++
>> arch/riscv/kernel/vmlinux.lds.S           |  20 +++-
>> drivers/firmware/efi/Kconfig              |   2 +-
>> drivers/firmware/efi/libstub/Makefile     |  10 ++
>> drivers/firmware/efi/libstub/riscv-stub.c | 106 ++++++++++++++++++++++
>> 16 files changed, 407 insertions(+), 3 deletions(-)
>> create mode 100644 arch/riscv/include/asm/efi.h
>> create mode 100644 arch/riscv/include/asm/sections.h
>> create mode 100644 arch/riscv/kernel/efi-header.S
>> create mode 100644 arch/riscv/kernel/image-vars.h
>> create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
>>
>> --
>> 2.24.0
>>

