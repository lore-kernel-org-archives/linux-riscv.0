Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899ECCA47A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 03:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qOJWj9f+t1mDgJ2CSW/wzpMTnavHkFBMRYLg0eY8AVc=; b=cKgcGlvPYANTlgEzxjTueZKBGe
	3uHGb3f8Tg4A2bW1iWq1RBNWx3wA8HQZKTwzwaoeju6PCQ6OpDdGyW5Ze976hcREJoA+3Gn32j+Rz
	TwdqEdnCcvaoVZs/GSdxr3sv2lAqSAihSr7ohqa/PiPk4tRn5TlyxqaCRUZsLmQ8u2bO3tZlsN1R/
	8yBVTl8IIwwEw5LSCfGhepgEJMiK13/tR/tXT1aVe93GkqbT0vTY3gKdETjXtazm5ESogWEpIlBRV
	UNpWiSe3GIGjh0ho4qPPdf06skk7ZClO/mFx+7iwMm51jJPLinWygCNDSkRCOb9go7Au5R/Dcmr/P
	LWpoPXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtJ-001Hl3-Sy; Thu, 02 Jun 2022 03:52:57 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtF-001Hdq-Nh
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 03:52:55 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s68so3665981pgs.10
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=9BXiqY0Nj4Qb0AGk+OZU+gzffA0Ovn22KIfjbp+GvSA=;
        b=AxDIymCN3bLHZmx6tvL1KH2IoCyEXRQ4HdEz2zHuysCO6CYo8D2cHL5TRQgo2YcwF/
         WXqNAknFzdxPBgP7t4Y/cyo7ttklj1eF9kdjKVDRvScDCBED/muk67Ddm8WQIazVEEi9
         8jCHSSGsNIqmPd05mWtpzTfJ+1vR1E5U+W+KSe1iUy5RjQ8f2Zw3QX7OFVht6BkCYk+Q
         M9p65F3d58EoV/Xdp4r/dB3dZZEdLgJhPluLjNFwI8QjrcakwANH1fnUQjAOymqPnXM9
         wDDfOFx4c5M5/1K3lutdBMj5RVCQO+Ng3TazFBBYvrf8TuNQrZ6rX+BIGLNxMcGX4Xkz
         j1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=9BXiqY0Nj4Qb0AGk+OZU+gzffA0Ovn22KIfjbp+GvSA=;
        b=hUkReqCovB7Pi7OSdLCIWiBN9dr08puIrwUyOaT4SEhVCPM/NNL4Z2fRsT2nBRcY3n
         Cb+Z40sQJ3VUvO0964BV9DxNGt0084uVwi4+DyuqpdXIih0pDdfG/aI41+HXNKJZc6f5
         nabo/t2r3I+MvRTfr9TCtyifRdjTtIPzL27gc+Cbt9IN6rl3QUfmSsZv6RRLOBXVt2/D
         ZZEjNSFNLlSb/qH+Q5tTffdSt+kP8nPnSXtrxnmYS5nSF+uoPFiGbB5k16iCzbVsj04c
         UdC6+B9LvI8lQ3t0i7ue3Wq+LH0ecMXL+RO/fi8ynfUQ57Rmf/0sFE2uE3nuUFawhQYB
         8lIQ==
X-Gm-Message-State: AOAM530jhlrrdBJFjdPRgySFBjC4T36bWVpSLhwpwb2McxfR/4ZZ9PO+
	q7GkH+0bDEy8ppJ+73M3zRqXLqn62npVfQ==
X-Google-Smtp-Source: ABdhPJyBcoO5bc7s101SKAiYOj5Pize2k4RuOzVIAkcCa0OmvXdqyAi1eKrc3RgYzjTiKvVVkCTW1g==
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id h7-20020a056a00218700b0050cef4def3bmr2803986pfi.83.1654141961580;
        Wed, 01 Jun 2022 20:52:41 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090a8b8c00b001df666ebddesm4589047pjn.6.2022.06.01.20.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 20:52:40 -0700 (PDT)
Date: Wed, 01 Jun 2022 20:52:40 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 20:46:17 PDT (-0700)
Subject: Re: [RFC PATCH v2 0/2] Risc-V Svinval support
In-Reply-To: <20220424090216.21887-1-mchitale@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mchitale@ventanamicro.com, atishp@atishpatra.org, anup@brainfault.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-872c15d0-15ea-499f-8c83-f011ad460cb4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_205253_791380_7047FD1C 
X-CRM114-Status: GOOD (  16.77  )
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

On Sun, 24 Apr 2022 02:02:14 PDT (-0700), mchitale@ventanamicro.com wrote:
>
> This patch adds support for the Svinval extension as defined in the
> Risc V Privileged specification. This patchset depends on:
>
> https://patchwork.kernel.org/project/linux-riscv/list/?series=632984

IIRC Marc still has some unresolved feedback on that one, for the IRQ 
bits?

>
> The feature was tested with qemu from latest master branch with
> following additional patch:
> https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00142.html
>
> Changes in V2:
>
> - Rebased on 5.18-rc3
> - update riscv_fill_hwcap to probe Svinval extension
>
> Mayuresh Chitale (2):
>   riscv: enum for svinval extension
>   riscv: mm: use svinval instructions instead of sfence.vma
>
>  arch/riscv/include/asm/hwcap.h    |   1 +
>  arch/riscv/include/asm/tlbflush.h |  12 ++++
>  arch/riscv/kernel/cpu.c           |   1 +
>  arch/riscv/kernel/cpufeature.c    |   1 +
>  arch/riscv/kernel/setup.c         |   1 +
>  arch/riscv/mm/tlbflush.c          | 116 ++++++++++++++++++++++++++++--
>  6 files changed, 126 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
