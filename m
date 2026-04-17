Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7CF8DFFF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOpo4fpuTmAhe2BGWn6vDLPmr3C7q3l3SjTJTOpXjwA=; b=Dl1mJw0bentEhG
	TACLTvXc4b/xA7ZqlNs+xjSiCJwkKvAR4zkDVoK6ALHXfw0Rk9tkKQcQpsKHwcTr4+i0P43nVqmHA
	EKMnQGqCq9bRNs0a3o+FDlXK+W5ao8JPMncLFoCLKzmmWZZiqTInwEzLjXWbBm5+NthllPyi7dxKC
	GneoqLpdJHY1RSapUMWYxSdtnn3pzjXdZMvIEpn4ZMdpB+ovzCir99yAmd80sU0GwlkqSju4vzKd5
	hVv7ShgqWZfARi0LoSahK0RdEAya7voxEzXb8r4LFQG7uCIqWt5109Bjg7uYIuuEdSU/JwgmK/Dyy
	UOakAkPd8W7pAr3d8J7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDo9h-00000004NfQ-3bPV;
	Fri, 17 Apr 2026 18:43:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDo9f-00000004Ney-2liQ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 18:43:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso10280655e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2026 11:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776451381; x=1777056181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrub1C4d7CDdCrR1P7BJnLdyF1FR8X46HxABz+9R31c=;
        b=tH086YWCLiouqiO/1b6dz/4j0Gf/Dje37eFriotckj053alji5AamGwc3qdz6UrsT9
         MqGwazIp0yjiqxDIBkJx+4TT6NKjwX9baloT4EbRvxHSIN6QJ4qom9SQbz2FAmMAca9k
         gS3brS6u5qtBAsUDTqe9frpITRTLXhKV29qyrscQyJwszRtWcsTzfUcf3IXWaUMrvp5C
         R6gR3qs3bwUladMdqtmvzETlx8DQH4y6Z61fda987G9QHhQKXaYy5+CMIiCh//KbQ+4+
         vz//7LCGbWtDOELhXa864j5LBsXOplLcEjhQjXQdukdU5RPqkF4odTo3EARX9IOZ3DXq
         Uqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776451381; x=1777056181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zrub1C4d7CDdCrR1P7BJnLdyF1FR8X46HxABz+9R31c=;
        b=aV83aM3vmj5+jZzYS6+Q8veHmGI49jyCi3U8WtksRj2y+hOLT1Av2Z6sEGUK2InUC7
         1ytidwxmX8krTm+/IrmA+yHhZprKrFhYyh4Zk9RTArNrVXWu21WMZGELACUcGLvUU3QR
         tWJv7K9tNlNFycMmUolAs1sfLCHkoNjICbO1ZQkjY0+6U6KZXU7JOhO1r10JYk8XSvsp
         /Zar5vxrgdLF7JpcekmC2Dy5TDGKRbF5w3y3AoCAgs3epWNofD6ccqfx/+fDf0pIA2iX
         3iH5InNT27hwXkFJLhvqCtkgjljKnVmSoU7CtR8kCni7YlgpsONxu6h2tXQ/M1esI0ZX
         L6VA==
X-Forwarded-Encrypted: i=1; AFNElJ+0qv/mRgZ86Z2tEqa2KF5D+oS2ClB7HOxW3Lw2RqJPJroXdaexqnU301cA4pbiJ8jUAfmtaaxBIg937Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn2XRLwOhR7+3sxrfOZLfx/oDWpFmAIIR6o4MSM3V8ARNFXZl5
	qpO0LpdBRl8CZL+jNqxPH45jbtQCW034iaxtEB6ly417tMJE4oFU1Sn7
X-Gm-Gg: AeBDievsvC7bNVU0GlXTRBxMbhNEbC7mqw4S0ppROphPwbOvKhHtYg2D6INBgKsxTqi
	+SD0WE65I3fap2xjUqY4M/CSaECK9ktYybQLH4MhhMS1ytERv1McQdoXJ87zWfSG4Am81ZeFJVb
	knuPtd5/UDog/HfRnvvL7XjFgDgWZdUlevGkMp/JFp3aY1z44TnCeYjlv+rAWgg8iW3STR9tl+d
	h0241IxM+bxxlF+nogmHH83p9Atu4gnWRv2nvpj/DDRPiehSz75u8v6NFq4Q7jLwoSaagqDFbAl
	Irt2urj6jdBrPr0Kb00n/T7tBNYl9zgKFcO3xWNFGLWLJ4Wd9vUKu9GnNLcCfUtEjDzgJRuSAEz
	zuNxxIQ9+edHdrjiae+CMwCYkAf2M6lBYHzSUN7ATFAdgBoSUQ0nONASKJIHB7aFz047yBm1O3t
	g2I434U8KuijcApR96BpjgoAUag5RvWAyZMfHoP6HTDGbj16giM+tTN9jChPPkn7VMsu1NxI3TF
	oc=
X-Received: by 2002:a05:600c:1554:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488fb77810bmr61308135e9.14.1776451381317;
        Fri, 17 Apr 2026 11:43:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c01cfsm68401345e9.10.2026.04.17.11.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:43:00 -0700 (PDT)
Date: Fri, 17 Apr 2026 19:42:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, arnd@arndb.de, akpm@linux-foundation.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, nathan@kernel.org
Subject: Re: [PATCH v3 0/2] arch/riscv: Add bitrev.h file to support rev8
 and brev8
Message-ID: <20260417194259.0c48d7ef@pumpkin>
In-Reply-To: <aeJbH7vfRpPuOGB0@yury>
References: <20260417093102.3812978-1-ruanjinjie@huawei.com>
	<aeJbH7vfRpPuOGB0@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_114303_718620_B9D4EA88 
X-CRM114-Status: GOOD (  17.15  )
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

On Fri, 17 Apr 2026 12:09:03 -0400
Yury Norov <ynorov@nvidia.com> wrote:

> On Fri, Apr 17, 2026 at 05:31:00PM +0800, Jinjie Ruan wrote:
> > Add bitrev.h file to support rev8 and brev8 for riscv.
> > 
> > Tested functionally on riscv64 QEMU with:
> > 	"-M virt,acpi=on,zbkb=true,zbb=true"
> > 
> > Changes in v3:
> > - Fix the build issue by remving the CONFIG_HAVE_ARCH_BITREVERSE macro
> >   for byte_rev_table.  
> 
> No arch needs byte_rev_table, except risc-v under a very certain
> configuration. Please find a better approach that wouldn't bloat
> random victims' .data section.

Eh?
x86 doesn't have a bit-reverse instruction.
The only arch that 'select HAVE_ARCH_BITREVERSE' are arm64, arm32 (some cpu),
loongarch and mips (for CPU_MIPSR6).

I think you mean that no arch that sets CONFIG_HAVE_ARCH_BITREVERSE needs it
except riscv.

Could you globally have:
	select NEED_BYTE_REV_TABLE if !HAVE_ARCH_BITREVERSE
and then riscv could also select it?
(And isn't there a method of including files in the build based on
kconfig options rather than unconditionally compiling it and getting cpp
to throw the contents away?)

	David

> 
> > - Update the riscv implementation as David suggested.
> > - Add Reviwed-by.
> > 
> > Changes in v2:
> > - Define generic __bitrev8/16/32 for reuse in riscv.
> > 
> > Jinjie Ruan (2):
> >   bitops: Define generic __bitrev8/16/32 for reuse
> >   arch/riscv: Add bitrev.h file to support rev8 and brev8
> > 
> >  arch/riscv/Kconfig                    |  1 +
> >  arch/riscv/include/asm/bitrev.h       | 55 +++++++++++++++++++++++++++
> >  include/asm-generic/bitops/__bitrev.h | 22 +++++++++++
> >  include/linux/bitrev.h                | 20 ++--------
> >  lib/bitrev.c                          |  3 --
> >  5 files changed, 82 insertions(+), 19 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/bitrev.h
> >  create mode 100644 include/asm-generic/bitops/__bitrev.h
> > 
> > -- 
> > 2.34.1  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
