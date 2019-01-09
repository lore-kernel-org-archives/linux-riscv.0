Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF49BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 03:36:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881C1206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 03:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mvsHtQLB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ro1reaVK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881C1206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5rX821j4/kgO7QSg+20yIivHOQLKGsq6usMp6Xo6iE=; b=mvsHtQLBX0k3ui
	JS34kmu0+aLyLlXNnkw5Rc719BUaOaUSAbxUSp2E3PWsbtp/SjqACAIJ47dJWx1137N0mHKvOHBdt
	cAUhCAO2hbXbWvqo+pX92Oj00DTTZWnS7mAPEcU+k+bCWFPLo2OzSxgKOVf+tT7312YU4/YFY1lnQ
	gFRPsEjKjRpA6dI2IFFlYzngvH7eSvG8Z4dQvVYS0lxgb8TM7fc78NqeynG9mfaZ6xdOKcJVaYKIh
	sZu0ZSCsHkw9kfBJfP+fXPGbmsNCda2Hzva1ZwkJ0S1zfAZCXyH3J32ijOJ7NQuKGEtdmvA6TCNGz
	LWMqfDVIo26y6PHHZzTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gh4fV-0001ar-Dg; Wed, 09 Jan 2019 03:36:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gh4fP-0001aJ-Ni
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 03:36:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id f188so6552684wmf.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 19:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qESw6VKl9t3uJHVZ+VDdznWtA1im3wNlCBKU/B4uAUA=;
 b=ro1reaVKCGl/2b6jMFP//mrfe3YedeWrwEm2PMSFVkADMBH5O+uRCq+1Ugyv8MtX/0
 jwYUPwCYHbFvQHFz4/dzIELAf5TDPjvpMallyoq4PcxFTwcogMT3csPIWfwKbWW0GRYe
 EWc/XKMPOY42YB+l2A4oOCiaV4B+HOBmry+dGN6gh5LoP7fNSaniBFIDOsz57eVgOi9d
 3Pe7dA1K8L6k5b9E7ec9XXiHFgB1NbZJLF7/1mBiDAfANPKZjUbVVVEl8YX91ijec7SJ
 FarMHcKxRgHl+BMC8NPifoZ6BdDzPaDIQ6RLYkHImRJqXdtWkqDoykw75/l/nLSJJsHu
 /1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qESw6VKl9t3uJHVZ+VDdznWtA1im3wNlCBKU/B4uAUA=;
 b=Ac2h3615PUdZBTlwAPDKXaGsmgDEtwWz19jaaUIZLQzDV6bfuCvAIxslAQbIKoAXyY
 C8QrDEogYHmYTRs3YdqO59B/+qMwjr83V4O5hCuyyrHiSQwO2wQpg66HHQVlzSpKc+4F
 lw2goxMxHMQdTaBh0pdMzwkhK9E0EMFTgOnU2zv7pgS0Ld2F0Z/4AptwXMeBxj3+IwVB
 nb93m44QbNXUBSR0/sgHhY7v6qCXTySpCqOY4kADrVuSg3G8si7gsUU/oJweFH3mlIh4
 Af/smlaXZYe0c93UJa2UYX8TYd71ynWAEDezEAhgDJ48yBi7jARwGYj8ohmukxbAkVem
 N5sg==
X-Gm-Message-State: AJcUukc/rbHbbxh/uAlIozx5S6lmDzkxMd9AkDL0HE9iUnOihluK/8I5
 SPnlHYkCzWBN1qFcOrqkLoTahxsins2YgyHu1a/ozw==
X-Google-Smtp-Source: ALg8bN7EGqSF9T+oE5pWXgVfuZyGKXtuQnszClr9X6n6fJMDxI9TcEwyZFeFlq/1W+nDEPY4UjHftbnZd8n/sj/Wfsg=
X-Received: by 2002:a1c:1801:: with SMTP id 1mr4003030wmy.153.1547004986633;
 Tue, 08 Jan 2019 19:36:26 -0800 (PST)
MIME-Version: 1.0
References: <mhng-c1a58f9d-cb8d-4c16-8f2b-1d2857244f8e@palmer-si-x1c4>
In-Reply-To: <mhng-c1a58f9d-cb8d-4c16-8f2b-1d2857244f8e@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Jan 2019 09:06:15 +0530
Message-ID: <CAAhSdy2T9xctceKds8a-PKdxN_x3AQbB-zH8sPZbtty=vc=gWQ@mail.gmail.com>
Subject: Re: [PULL RFC] RISC-V Updates for 4.21-rc2
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_193631_841932_E8E74C5E 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 8, 2019 at 11:23 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-rc2
>
> for you to fetch changes up to 801009424e05cf110f016d7fac7fcf20ef94941a:
>
>   Fix a handful of audit-related issue (2019-01-07 08:45:47 -0800)
>
> ----------------------------------------------------------------
> RISC-V Updates for 4.21-rc2
>
> This tag contains a handful of updates that slipped through the cracks
> during the merge window due to the holidays.  The fixes are mostly
> independent, with the exception of one larger audit-related branch.
> There's more information about the audit branch in that merge, the rest
> are:
>
> * The BSS has been moved, which shrinks flat images.
> * A fix to test-bpf so it compiles on RV64I-based systems.
> * A fix to respect the kernel commandline when there is no device tree.
> * A fix to prevent CPUs from trying to put themselves to sleep when
>   bringing down the system.
> * Support for MODULE_SECTIONS on RV32I-based systems.
>
> As usual, I've tested this by booting a Fedora-based image on a recent
> QEMU (this time just whatever I had lying around).
>
> ----------------------------------------------------------------
> Andreas Schwab (1):
>       riscv: don't stop itself in smp_send_stop
>
> Anup Patel (1):
>       RISC-V: Make BSS section as the last section in vmlinux.lds.S
>
> Aurelien Jarno (1):
>       tools uapi: fix RISC-V 64-bit support
>
> David Abdurachmanov (6):
>       riscv: add audit support
>       riscv: audit: add audit hook in do_syscall_trace_enter/exit()
>       riscv: define NR_syscalls in unistd.h
>       riscv: define CREATE_TRACE_POINTS in ptrace.c
>       riscv: fix trace_sys_exit hook
>       riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig
>
> Palmer Dabbelt (1):
>       Fix a handful of audit-related issue
>
> Paul Walmsley (3):
>       arch: riscv: support kernel command line forcing when no DTB passed
>       MAINTAINERS: SiFive drivers: change the git tree to a SiFive git tree
>       MAINTAINERS: SiFive drivers: add myself as a SiFive driver maintainer
>
> Zong Li (1):
>       RISC-V: Support MODULE_SECTIONS mechanism on RV32
>
>  MAINTAINERS                                     |  3 +-
>  arch/riscv/Kconfig                              |  4 ++-
>  arch/riscv/include/asm/module.h                 | 28 ++++++++--------
>  arch/riscv/include/asm/ptrace.h                 |  5 +++
>  arch/riscv/include/asm/syscall.h                | 10 ++++++
>  arch/riscv/include/asm/thread_info.h            |  6 ++++
>  arch/riscv/include/asm/unistd.h                 |  2 ++
>  arch/riscv/kernel/entry.S                       |  4 +--
>  arch/riscv/kernel/module-sections.c             | 30 +++++++++--------
>  arch/riscv/kernel/ptrace.c                      |  9 +++++-
>  arch/riscv/kernel/setup.c                       |  9 +++++-
>  arch/riscv/kernel/smp.c                         | 43 +++++++++++++++++++++----
>  arch/riscv/kernel/vmlinux.lds.S                 |  8 +++--
>  include/uapi/linux/audit.h                      |  2 ++
>  tools/arch/riscv/include/uapi/asm/bitsperlong.h | 25 ++++++++++++++
>  tools/include/uapi/asm/bitsperlong.h            |  2 ++
>  16 files changed, 148 insertions(+), 42 deletions(-)
>  create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Hi Palmar,

GregKH wanted SBI earlycon driver patch to go through RISC-V tree.

Refer, https://patchwork.kernel.org/patch/10711809/

Can you include it your PULL request for  Linux-5.0 ?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
