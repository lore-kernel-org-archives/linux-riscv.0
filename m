Return-Path: <SRS0=Os/g=AS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D120C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 06:41:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBBC20578
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 06:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fm7COgYv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tONDhxf0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBBC20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vvR+P/D1XkxndDxo5vhrIqgKpNrgXzr40hzXgs9CK2Y=; b=fm7COgYv/8srylSGWzz2d6LLM
	FVK3USSzdV9SQrENbiPoinYHT/mbgJiRME6Qr33/jJJphMVfQLETx5yIuvC9aWoQKLQksQrl7wJ5S
	6XTrMBgFv43us0OOJS6Gh8tXGs79NhE0MOuTjafeoPTwBb/Ii9k8f7wyAJXUDEy/OexWe8HoQlCRc
	unJAyLcBareRZBLlQ2uatTEYRH7/2n2pHNyFreNENhEbc3ZDtPzqPXpLQKBCV1/3CzMdiQwsOst5b
	ssYRGattVnlN7wor2X5okhbgpmPCISrRMQunNbeWj/j2wxPTl8eQr9SIvN2STc7f2sOeOVwaP0unf
	3JcxIF15A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshIV-0005tU-18; Tue, 07 Jul 2020 06:41:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshIS-0005sL-4z
 for linux-riscv@lists.infradead.org; Tue, 07 Jul 2020 06:41:41 +0000
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65A2520578
 for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2020 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594104099;
 bh=RJd5gU31yiOjajLt/tJJ7V/CSWnm1xiLjteER4WNP0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tONDhxf0QBJIM3f4VpihR47KunOjYPZ2jhFLTiV/wO/aflKiNmzVw6hAhqO8R/uIz
 Xlm1CiyD2g7ETZ5vfugzQD0D7Oy2DpcUXhX7bI7e6GzcAmTReWVA6Yr/NMj2N3HKdr
 VlWXtkBAG8D1E2VzGhNobzBmSCqlD2Qa9oJHvwB8=
Received: by mail-ot1-f54.google.com with SMTP id t18so20729865otq.5
 for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2020 23:41:39 -0700 (PDT)
X-Gm-Message-State: AOAM532AAY+wOsdrrC+Z3OH1CXuhfsLr4hc0u87Oy8UBB800LXKm5C6a
 Xbgwd5JcDBDC5O/Os4i39Iuv0jNBuibwnBhbnBM=
X-Google-Smtp-Source: ABdhPJwhDbsC77VdApD0Yu5jlF0o1Fbg6FB0JcBCaZr0l4MwXzKW782eArC4YsN/3RFShEqWA4n7wSNLntLdwVfHkGM=
X-Received: by 2002:a9d:4a8f:: with SMTP id i15mr47348216otf.77.1594104098794; 
 Mon, 06 Jul 2020 23:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200706172609.25965-1-atish.patra@wdc.com>
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Jul 2020 09:41:27 +0300
X-Gmail-Original-Message-ID: <CAMj1kXG5OxRod_-Z5K55XLXDda2ahfezm0yaRbv=82JmrFRZxw@mail.gmail.com>
Message-ID: <CAMj1kXG5OxRod_-Z5K55XLXDda2ahfezm0yaRbv=82JmrFRZxw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Add UEFI support for RISC-V
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_024140_418910_017AB5F7 
X-CRM114-Status: GOOD (  22.39  )
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2020 at 20:26, Atish Patra <atish.patra@wdc.com> wrote:
>
> This series adds UEFI support for RISC-V.
>
> Linux kernel: 5.8-rc4
> U-Boot: master
> OpenSBI: master
>
> Patch 1-6 are preparatory patches that fixes some of the geric efi and riscv issues.
>
> Patch 7-9 adds the efi stub support for RISC-V which was reviewed few months back.
> https://www.spinics.net/lists/linux-efi/msg19144.html
>
> Patch 10 just renames arm-init code so that it can be used across different
> architectures. Patch 11 adds the runtime services for RISC-V.
>
> The patches can also be found in following git repo.
> https://github.com/atishp04/linux/tree/uefi_riscv_5.9_v2
>
> The patches have been verified on Qemu using bootefi command in U-Boot for both
> RV32 and RV64.
>
> For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
> beyond 1G of physical memory for RV32.
>
> EDK2 can boot quite far into Linux with current series. Currently, we are seeing
> some traps from drivers (spi/network). At first glance, they don't seem to be
> caused by efi. I thought it is better to get some early feedback on the series
> while EDK2 issue is being debugged.
>
> That's why uefi runtime services are not actually well tested in RISC-V.
> Any suggestions to test the efi run time services are appreciated.
>
> Changes from v1->v2:
> 1. Removed patch 1 as it is already taken into efi-tree.
> 2. Fixed compilation issues with patch 9.
> 3. Moved few function prototype declaration to header file to keep kbuild happy.
>
> Changes from previous version:
> 1. Added full ioremap support.
> 2. Added efi runtime services support.
> 3. Fixes mm issues
>

Hi Atish,

This all looks reasonable to me, so I think we can merge this once you
can confirm that the runtime services actually work.

Could you explain how you are dealing with the memory map? Are memory
nodes in DT ignored entirely as they should be? What about memory
reservations?

In any case, I will take the first patch as a fix, so it should turn
up in mainline in 1~2 weeks.

Thanks,
Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
