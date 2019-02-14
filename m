Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D50C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2017721920
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VdryKNYn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="XKrJ9+pB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2017721920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uxH8Hu3C4S8pmyXxOmAeECcBCmVvyZ+Qoausi5GfLE=; b=VdryKNYnKoI3xB
	cCwpVSBLwOl6UJDwxWa61nwhILF0n8yUSU0mc6bdP1jbJWpsVAv59CTg8EC9uc4991Q+4Yzw7ie9F
	MNbTl9YL1Z3Sgs4AodT4CsMZuUmSpcwS6BOdY1x5XjrC1D7/PvYZhgm9Ra1hdYT3ieGQT0uqIv0gl
	o2oVTbIseZHU6oIa2cIAMhNn4qAFMFYTms7AZpHtHM22qMMOViwQZARzr4NfDwzcsYzgpdXcG5nez
	uQi5MNcSJXd40LJIGUVp+dD4s0h9A6wjaxAsXcegzh1inPpqM4yrhSgW2jxuSgmYZGGeLvUhqi+sz
	APxJg+3jlatiqvRL6uhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guCO9-0007vn-E6; Thu, 14 Feb 2019 08:28:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guCO6-0007vG-84
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:28:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id v26so5130055wmh.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhCnZvf23aeo06nIRSdaHF4egKBLiYeTJxSjOgwTDYc=;
 b=XKrJ9+pBjGPkXDmUzz4oN+e+A16SNuQde6dQsKxEmM5tWCWdAQNdGYwIz3NaP8t5XZ
 bAVPl89OWKreVzDzPzItjlcir/pZqRItpGNPN6iFmxlRFwpn8M2aDqh0464VaVAsRK8W
 wMzReVl6xLnrnSd8xO+SM0H4vwftkROmNAoYyxvO81FxRjjxDOlkwyPq7Y3Nt9jU5Lg9
 AUzIMrKaoQXwtLmyUDS1m0DKmX31bC4vprp+5LE2fOnATIQ6DN3blenE+C/mspP6cL45
 q0hYlBnkrzZ9+O2NqACS2OV1MCeFlW4moNgPa0h7cih+dgh29xlZkgk+oxJjk+2PAdsi
 GfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhCnZvf23aeo06nIRSdaHF4egKBLiYeTJxSjOgwTDYc=;
 b=f4AlJE+idMBnBcYKLBCfPZfjOq2SrqvwCVB0/Cd4kWZwH8VPq9k7RV3kK5L6/jljd0
 48W9UMzZ4xnPd0hOzoDvn2uyaqOfc92XZJoBWUepiDYZkU4SEnY22VyLFIdCVU2NpuIw
 Q+z7AiIv3Mv4FUCRbKxjPO3MUmtGnCsuwgWSP9Mpx+ZOGw2t+6tztU+Bzi1pQ181RXcd
 bi99yYYIQ+Qa6JPUB8EUY1wt7mCzbWns7Qf6otT/vRMuM6cvLuTP2MEe00CxXt5fzX7m
 dMdKXcuDKRWzx4yfVJDreSJgNWkF/7oxZ5uN83rsrd0NS0FpoBDWsaXTHOTiYLPDzIoR
 4HyQ==
X-Gm-Message-State: AHQUAuboBGbfBSQOLFOUuQME/qmP0aJFGQvqgQS1r7UvAuxy4vxkuAzA
 y6+3UCG8fYvlNjPyngQDuJwfHMWLUOA6fPSwhuZyOg==
X-Google-Smtp-Source: AHgI3IYDDZrhBQ1SSy2IPkGdV8sM0X0rEyH2uMYWDKF2iPyTd6VJWPmoAUXFYvC2E6MQWIOCXZkS8B9csMW+LaiqGEA=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr1685443wme.16.1550132931258; 
 Thu, 14 Feb 2019 00:28:51 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy25GUFWfkQHBDy6HysVCVFOpv-ZLY6vr+oH34XbqScYFQ@mail.gmail.com>
 <mhng-c25efbc6-094f-46ab-a4d8-480b53944cde@palmer-si-x1c4>
In-Reply-To: <mhng-c25efbc6-094f-46ab-a4d8-480b53944cde@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Feb 2019 13:58:39 +0530
Message-ID: <CAAhSdy3Bnpq7MawudNB_XyQYxBOietdp4vWyB5aoj06o+8yNSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_002854_337889_9DE52A53 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 6:07 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 13 Feb 2019 00:21:43 PST (-0800), anup@brainfault.org wrote:
> > On Wed, Feb 13, 2019 at 4:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Sat, 19 Jan 2019 05:27:53 PST (-0800), Anup Patel wrote:
> >> > This patchset does:
> >> > 1. Moves MM related code from kernel/setup.c to mm/init.c
> >> > 2. Implements compile-time fixed mappings
> >> >
> >> > Using fixed mappings available, we can now get earlyprints
> >> > even without SBI calls. For example, we can use kernel
> >> > parameter "earlycon=uart8250,mmio,0x10000000" to get early
> >> > prints on QEMU virt machine without using SBI calls.
> >> >
> >> > The patchset is tested on QEMU virt machine. It is based on
> >> > Linux-5.0-rc2 and can be found at riscv_fixmap_v2 branch of:
> >> > https://github.com/avpatel/linux.git.
> >> >
> >> > Changes since v1:
> >> >  - Use more characters per line in changelog of PATCH3
> >> >  - Removed #ifndef __ASSEMBLY__ from PATCH5
> >> >  - Use more characters per line in commets of PATCH5
> >> >  - Added PATCH6 to implement keepinitrd kernel parameter
> >> >
> >> > Anup Patel (6):
> >> >   RISC-V: Move free_initrd_mem() to kernel/setup.c
> >> >   RISC-V: Setup init_mm before parse_early_param()
> >> >   RISC-V: Move setup_bootmem() to mm/init.c
> >> >   RISC-V: Move setup_vm() to mm/init.c
> >> >   RISC-V: Implement compile-time fixed mappings
> >> >   RISC-V: Implement keepinitrd kernel parameter
> >> >
> >> >  arch/riscv/Kconfig               |   3 +
> >> >  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
> >> >  arch/riscv/include/asm/pgtable.h |   1 +
> >> >  arch/riscv/kernel/setup.c        | 114 ++++++----------------------
> >> >  arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
> >> >  5 files changed, 189 insertions(+), 97 deletions(-)
> >> >  create mode 100644 arch/riscv/include/asm/fixmap.h
> >>
> >> I'm getting some git issue when trying to merge the third patch via email
> >>
> >>     $ mhng-pipe-show_stdout 4 | git am -s
> >>     Applying: RISC-V: Move setup_bootmem() to mm/init.c
> >>     error: patch failed: arch/riscv/kernel/setup.c:163
> >>     error: arch/riscv/kernel/setup.c: patch does not apply
> >>     Patch failed at 0001 RISC-V: Move setup_bootmem() to mm/init.c
> >>     Use 'git am --show-current-patch' to see the failed patch
> >>     When you have resolved this problem, run "git am --continue".
> >>     If you prefer to skip this patch, run "git am --skip" instead.
> >>     To restore the original branch and stop patching, run "git am --abort".
> >>
> >> can you send a PR with a signed tag?  I'll include this as part of the next
> >> merge window.
> >>
> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >
> > Okay, I will prepare a PR with following patchsets:
> > 1. Fixmap support and MM cleanups (Author: Anup Patel)
> > 2. riscv: minor fixes and cleanups (Author: Johan Hovold)
> > 3. RISC-V related changes from "Various SMP related fixes" (Author: Atish Patra)
> >
> > All above patchsets touch same source files so this will
> > help you.
>
> Thanks.  There's also a handful of comments from Christoph that I agree with
> about the keepinitrd stuff.

I have sent PR with Fixmap patches only.

Johan and Atish will rebase their patches based on your tree.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
