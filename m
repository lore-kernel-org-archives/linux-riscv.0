Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC97C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E470222BB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FN4+0IXr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="mxQubxva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E470222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8lWawUIcmxiaYGjkM+w1OxFyCj2bhXm2sqzn5E6TXU=; b=FN4+0IXrtifkVc
	RNn3xuSNoi8YX86fQBJvEB9oohmqGhYnXG65z0/U5XHTMc8QOBdI8/RNLJxCDAcU9rq/tLU3UOYXP
	1tTmEuxDXNZou3MjdIROMH01NLXC/qHHplphpMj3kfQ0TXaMasHgPRelXLFJDC0ZHeOmg/1M7pepN
	dj94e6roaOe/56g5ADRtdd6palDklqKZn/aGfE4h/5VlNeJ2ivAgr61aqYTqsqxg/fyXxyetlyO+s
	58CenL6hgTpZjiWmURZDZz+O06CU34JqCZHfuRMMDodwFZex9suaNf9xCs4ATZrJHCbc2Lo9G7OyF
	lsiazRB21gUjtY0Zg3Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtpnz-0005rW-Rs; Wed, 13 Feb 2019 08:22:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtpno-0005gl-Pl
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 08:21:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id r17so1387913wmh.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCtzblF1jR9J0InpD4f0Wn6K8qgn39HtvksF7U+weeU=;
 b=mxQubxvawRjDb/feJX9gA2kRRytn5nwW6fNlmaQ09uB3tGhWC8g/Le/lwk/5b2qYYS
 v/VFadsIk9rGglWewtmksg8i6h5nMh7K0XQY8HhtYhahQenlebgT4pWK9X4LjYYTsYin
 Ag1dSAiGM9H9Vv7IuHWvbfMCyFQvIbN42FSKFdYqqT+5OQGYVuU5k9l7cUTPMN9+JrEQ
 yBpjE/stdtiLozPiUyRBvwww83D1IDeZgSlx3H/4yedHJqphJRUH4uJ/H/mFpkq5+q4b
 djx37mGUj9PkN/QkmSj1eI6GcboP9IcdgNdCeTzLIrVCEuTQZHwoFrhodzaTty/0WUXB
 rmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCtzblF1jR9J0InpD4f0Wn6K8qgn39HtvksF7U+weeU=;
 b=XnqRHt6E/jgouGMW8VqsE4jDsloWjqr6+u/5/X0MUY3PVy1o4GwJcv0g5SoTiLhHpC
 gWk7ADp7xz2PQb5rVhTmwRZq8Z490I6gC1xQSrfxlMeMOM03At0DIyNw5aZqnZzS5+5N
 D8PCaLPBzRBX2PuxSoNe/asOcyEe5rEqKckqvS4gmomcA2Z/3PUvRpYoy9QUN3x41maT
 qzXHF/2rSLxGLhbkaK8vuUbV1plye7lMsP2EegtCoKeeLPgNnzLfFyDo/MtLX+JLFEHn
 ghKl9k1eLv/CUYXx00YmAIMOrAm1V08WyIYK41EZ5GvrBTGEStYzl6fRdiQvJVxb9uGJ
 FQfQ==
X-Gm-Message-State: AHQUAubxO61Ak2gzhqDfI6k7iottldLp31cPD0a/j7y7hjiwmgftlbBv
 II04uDMCOZH2zU5AspTAcy6LFxtjxrnqmdxaDGLJNw==
X-Google-Smtp-Source: AHgI3IYOJXhh5BrMsE9kb/yfz3C0meGmQ1t7EEUghhGy0SLqR8+PRrhHhdMBB1zzlPhNl8HtACSDVXlDeRizyYnx35k=
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr2128285wmd.132.1550046114963; 
 Wed, 13 Feb 2019 00:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <mhng-3acc6cf0-4c86-4929-a653-11e87d0c6b48@palmer-si-x1c4>
In-Reply-To: <mhng-3acc6cf0-4c86-4929-a653-11e87d0c6b48@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Feb 2019 13:51:43 +0530
Message-ID: <CAAhSdy25GUFWfkQHBDy6HysVCVFOpv-ZLY6vr+oH34XbqScYFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_002156_885327_81C213D1 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed, Feb 13, 2019 at 4:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sat, 19 Jan 2019 05:27:53 PST (-0800), Anup Patel wrote:
> > This patchset does:
> > 1. Moves MM related code from kernel/setup.c to mm/init.c
> > 2. Implements compile-time fixed mappings
> >
> > Using fixed mappings available, we can now get earlyprints
> > even without SBI calls. For example, we can use kernel
> > parameter "earlycon=uart8250,mmio,0x10000000" to get early
> > prints on QEMU virt machine without using SBI calls.
> >
> > The patchset is tested on QEMU virt machine. It is based on
> > Linux-5.0-rc2 and can be found at riscv_fixmap_v2 branch of:
> > https://github.com/avpatel/linux.git.
> >
> > Changes since v1:
> >  - Use more characters per line in changelog of PATCH3
> >  - Removed #ifndef __ASSEMBLY__ from PATCH5
> >  - Use more characters per line in commets of PATCH5
> >  - Added PATCH6 to implement keepinitrd kernel parameter
> >
> > Anup Patel (6):
> >   RISC-V: Move free_initrd_mem() to kernel/setup.c
> >   RISC-V: Setup init_mm before parse_early_param()
> >   RISC-V: Move setup_bootmem() to mm/init.c
> >   RISC-V: Move setup_vm() to mm/init.c
> >   RISC-V: Implement compile-time fixed mappings
> >   RISC-V: Implement keepinitrd kernel parameter
> >
> >  arch/riscv/Kconfig               |   3 +
> >  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
> >  arch/riscv/include/asm/pgtable.h |   1 +
> >  arch/riscv/kernel/setup.c        | 114 ++++++----------------------
> >  arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
> >  5 files changed, 189 insertions(+), 97 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/fixmap.h
>
> I'm getting some git issue when trying to merge the third patch via email
>
>     $ mhng-pipe-show_stdout 4 | git am -s
>     Applying: RISC-V: Move setup_bootmem() to mm/init.c
>     error: patch failed: arch/riscv/kernel/setup.c:163
>     error: arch/riscv/kernel/setup.c: patch does not apply
>     Patch failed at 0001 RISC-V: Move setup_bootmem() to mm/init.c
>     Use 'git am --show-current-patch' to see the failed patch
>     When you have resolved this problem, run "git am --continue".
>     If you prefer to skip this patch, run "git am --skip" instead.
>     To restore the original branch and stop patching, run "git am --abort".
>
> can you send a PR with a signed tag?  I'll include this as part of the next
> merge window.
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Okay, I will prepare a PR with following patchsets:
1. Fixmap support and MM cleanups (Author: Anup Patel)
2. riscv: minor fixes and cleanups (Author: Johan Hovold)
3. RISC-V related changes from "Various SMP related fixes" (Author: Atish Patra)

All above patchsets touch same source files so this will
help you.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
