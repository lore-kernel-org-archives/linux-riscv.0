Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C587CC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 06:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=e1Hsn4fWmReYGN0QLwS2YV4OACYjgJVBjyu/lOnjhxE=; b=Kp/woFV4ZtsnI0FJkrlceXIBdU
	ECEP/TfchgaJoVSc0kZ/KvKhESELwlThxtSJ852mZnkSdvqwrAPB6xGxhYYl1jCTYBeC8fZvN3k65
	qHe88MZ28UUElErl35BqDTp8pH5X8WJBYtY+THky/j39cbD+CoAudu/TrE83Pf5isuKRvgwsh5ijy
	TTzS+jlGUIhfIQqNIsVxFCc+EzGwwhtac++bKEhIGxHVr0vGXNf/braW3VDvwKceCZF6V68cfN1+a
	nAJuHBOp9oznZancRKUPBQqX2hTNXg8gHVCksI+VAlbkfj9msYHOuA1p1faaZLvvY1HKK+CsRip2Y
	baZC+1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Ff6-00De6P-01; Sun, 11 Dec 2022 06:18:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Ff1-00De31-PZ
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 06:18:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id k79so6463874pfd.7
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 22:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRXGqW6LKv+O98IDnEbymxxSgNQqMDjFc6OS+Rapwyo=;
        b=jlLNrLrdlC6Ecqqm+duNB6r/VLLI9i+rg6zI7FY8RNEjZIJBfF1U9gFEmI7akl9gwY
         Dw+ZskgYryRjOPYOl13S7bkNEfZWWOdadwNi3o4gUM85vJJ04Z1M5qyodZ9o3jXI4FiN
         unHA8vniPyWa5MrQWbHTToX+nQqV7CwLNN0ePFb8ueganhqAUjHYm0xsJOxC0cNz9JXX
         Vbhl56WQU5C3APOi0h9uuWf4E0HU306tY4wX5EMe2lxCSeecf38oLXGCPwbPON9bik9A
         +G06ZrSA9fPc8iwUuFvUD0M+jDQsyjigAuazhy/U1x3HankaoqTXYGFaBip6xMniWUig
         v1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRXGqW6LKv+O98IDnEbymxxSgNQqMDjFc6OS+Rapwyo=;
        b=pRNGH9yjluxkUjuZtHKrVGwxiUOW9gWca3L4Vi5d9yQEWPEdbHsEMgTwL4k6TKngki
         B7ped00swH1ws4F3Zvb+/RcBWxIhV001GxiGTsl0T+hNb0cqaQSQJJxyk1NVjwyBamF4
         oZCOHeuCVvnkakt9Wvzkz/6Qc2HrDDv4uyWdDabOZMhLPDSQOKi1MYVP3z0Mz8nzEchI
         f5QDsVnH9ZgyMVREgYR6XCEapU1ksZcccGGu1piL17tSWTjBDMGiD/q0QeXR3PTBad+0
         88E01tR/rF7fdAqPN5LDPWxS6jC+2XrtJ9VlaJyI2GeWKJj+xzojvx/yTD88IhSSiDu/
         R6cg==
X-Gm-Message-State: ANoB5pnCqP8CVCFT9JUYlHXG8Jrvp81U6laL+D57P6nBDgPNmBKyIbl7
	EZIusN9ZOPLxXdW7vxRZJsK4Uzqw/ddIiV5m
X-Google-Smtp-Source: AA0mqf5xXR0ca7y5CYmWfIv0Y64a0lOCnPAdEr3gwQpQ1dspMK+bvpmbbDCkg+BOKaSisa6eTE/ILA==
X-Received: by 2002:a05:6a00:194a:b0:56b:e6b9:9338 with SMTP id s10-20020a056a00194a00b0056be6b99338mr15304446pfk.12.1670739479777;
        Sat, 10 Dec 2022 22:17:59 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id w29-20020aa7955d000000b0054ee4b632dasm3501432pfq.169.2022.12.10.22.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 22:17:58 -0800 (PST)
Date: Sat, 10 Dec 2022 22:17:58 -0800 (PST)
X-Google-Original-Date: Sat, 10 Dec 2022 22:17:17 PST (-0800)
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
In-Reply-To: <Y4JpmEoKOBIbaVLi@righiandr-XPS-13-7390>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  emil.renner.berthing@canonical.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andrea.righi@canonical.com
Message-ID: <mhng-453c777d-2bda-4b15-914b-aeacc4551ff1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_221804_050306_58225649 
X-CRM114-Status: GOOD (  30.08  )
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

On Sat, 26 Nov 2022 11:31:36 PST (-0800), andrea.righi@canonical.com wrote:
> On Sat, Nov 26, 2022 at 07:25:01PM +0000, Conor Dooley wrote:
>> On Sat, Nov 26, 2022 at 08:18:43PM +0100, Andrea Righi wrote:
>> > On Sat, Nov 26, 2022 at 06:46:05PM +0000, Conor Dooley wrote:
>> > > Hey Andrea,
>> > >
>> > > On Fri, Nov 25, 2022 at 02:37:13PM +0100, Andrea Righi wrote:
>> > > > Kernel parameters string is limited to 512 characters on riscv (using
>> > > > the default from include/uapi/asm-generic/setup.h).
>> > > >
>> > > > In some testing environments (e.g., qemu with long kernel parameters
>> > > > string) we may exceed this limit, triggering errors like the following:
>> > > >
>> > > > [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>> > > > [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
>> > > > [    3.333233] Hardware name: riscv-virtio,qemu (DT)
>> > > > [    3.333550] Call Trace:
>> > > > [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
>> > > > [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
>> > > > [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
>> > > > [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
>> > > > [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
>> > > > [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
>> > > > [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
>> > > > [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
>> > > > [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
>> > > > [    3.335857] SMP: stopping secondary CPUs
>> > > > [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
>> > > >
>> > > > It seems reasonable enough to increase the default command line size to
>> > > > 1024, like arm, to prevent issues like the one reported above.
>> > >
>> > > error: arch/riscv/include/uapi/asm/setup.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
>> > >
>> > > Unfortunately this does not build :/
>> > >
>> > > Thanks,
>> > > Conor.
>> >
>> > Oh I see, because it's uapi it needs "WITH Linux-syscall-note",
>> > wondering why I can't reproduce this failure...
>>
>> tuxmake --wrapper ccache --target-arch riscv --directory . \
>> 	--environment=KBUILD_BUILD_TIMESTAMP=@1621270510 \
>> 	--environment=KBUILD_BUILD_USER=tuxmake --environment=KBUILD_BUILD_HOST=tuxmake \
>> 	-o $tmpdir --toolchain llvm -z none -k rv32_defconfig
>>
>> (copy paste from a script)
>> That's what caught it initially & I think should be reproduce able. My
>> own standard build script also runs all of the HDRINST stuff if they've
>> changed since the last time a given toolchain was used so it reproduces
>> locally for me too.
>
> Ah! I'm pretty sure it's HDRINST, I'm just doing make, cross-compiling
> the kernel, and running it directly from the build directory with a
> custom script (that is basically a wrapper to qemu), so I don't need to
> actually install anything. That's why I didn't catch the error.
>
> Thanks for sharing that, I'll make sure to test also a proper install
> next time. :)
>
> -Andrea
>
>>
>> > Anyway, as pointed out by Alexandre, there was already a previous
>> > discussion about this topic:
>> > https://lore.kernel.org/lkml/CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com/T/
>> >
>> > Hopefully this change will be addressed there (and the patch land in
>> > -next at least), otherwise I'll post a v2.

I posted a new version of the asm-generic changes here: 
https://lore.kernel.org/r/20221211061358.28035-1-palmer@rivosinc.com/


>>
>> Yup, I noticed that thread - in fact I was going to link it yesterday
>> before I saw Alex already had ;)
>>
>> Thanks,
>> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
