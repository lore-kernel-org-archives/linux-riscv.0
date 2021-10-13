Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A1CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C88E60E74
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C88E60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWghYFrSQQXPhWi8a67VwM98I4pNwExLRGD/pEawJrA=; b=L/AdP7uc8bMFjb
	v8h+kdIAzBQ+sJObPwOZgyU2O1tcqv44Dh29kd/oxJEKMGoxgROactuROVqNAudNUNuE+C6Jz9ZGg
	wVUhsUFIeD3UHlaMG7V0vl7ilEtB9ud0+Nh7rKxs0AUOQvseMDEuR1zDuuLSUTQM1G1x3Xng1CW3y
	xJMZnMdtKi3XzPTzqS0FZykDpEV3DRD6shDwyZeXZCrNI4fqvbGA3CJVYMiiwQODo+9x0RzzOiw5C
	owGxIw2zFcGoW85jHMI9U/92I/fA/psXjIQW6mkv7AWSmDODnD/iy7fekbM0SLaaZ7TCRVBkIqoUj
	tSlwh8klIG7+4uGMFbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maV4p-00ElAw-IY; Wed, 13 Oct 2021 03:37:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maV4m-00ElA9-7H
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 03:37:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB3B1610CF
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634096227;
 bh=hTlf7sTMBOXUv6/B2hQkKRwMWrRMRFh54bzp89OP9DA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RqnCmIv9WhurJLj/9eSsS07KK+ZUpi+9qmCzse5Y83S/LApsXQU3poffL3rWb2sdq
 3r7dkdfXVR+AchA7Zcczl9kzhS+ff3dZFix3+X9UmZgrLCxtt2IzwAiOcor/WBCwBN
 SrO8m50svxi/9GrkJn/o1hWBqdFW7Pc+26+4o8LLqfVZBGZIbjetP7P8AbeqkHlcdM
 KQSc26c6qQ9/pwM2/3D8RxgJAGVRrCZsxMMFWGuE8PUQrfwv7XbciqMnTqPJoZD/uT
 wVfueOpyG3hHzmr2iH9VbvQYZJshGu7jrYb58WNzT/f7Vxtxx2IGlcn2dNjVu2N35m
 RH6T92dWfCpAg==
Received: by mail-ua1-f48.google.com with SMTP id u5so1785364uao.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 20:37:07 -0700 (PDT)
X-Gm-Message-State: AOAM5332vGqczj22go80xfzLu4V9O5PBGhN++MBLsddRH9eYyOzIvGs7
 dQC6RBlxXPrS80GZGmsez3Y6uwun6aC/1h0Nf3g=
X-Google-Smtp-Source: ABdhPJypr78ABw3NJ+GHflDLyAsmpFGEXSkcC6fwy/AzKQzS5xqcI96oVqxGLyy4dSNrg+uD/WGKOORSYtpwlDzf+pk=
X-Received: by 2002:a67:c08d:: with SMTP id x13mr36141812vsi.43.1634096226559; 
 Tue, 12 Oct 2021 20:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183344.105637-1-wefu@redhat.com>
In-Reply-To: <20211012183344.105637-1-wefu@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 11:36:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ90iYCniasERD4F1sME8iqt3xqOJa4k0zNxpQcZHgiRA@mail.gmail.com>
Message-ID: <CAJF2gTQ90iYCniasERD4F1sME8iqt3xqOJa4k0zNxpQcZHgiRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Add RISC-V svpbmt extension supports
To: wefu@redhat.com
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Fu Wei <fu.wei@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_203708_305990_10634607 
X-CRM114-Status: GOOD (  12.58  )
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

Please add V3 in the prefix, I think you need to resend it with PATCH
V3 and abandon this one.

On Wed, Oct 13, 2021 at 2:34 AM <wefu@redhat.com> wrote:
>
> From: Fu Wei <fu.wei@linaro.org>
>
> This patch follows the standard pure RISC-V Svpbmt extension in
> privilege spec to solve the non-coherent SOC DMA synchronization
> issues.
>
> Wei Fu (2):
>   dt-bindings: riscv: Add mmu-supports with svpbmt
>   riscv: Add RISC-V svpbmt supports
>
>  .../devicetree/bindings/riscv/cpus.yaml       |  5 +++
>  arch/riscv/include/asm/fixmap.h               |  2 +-
>  arch/riscv/include/asm/pgtable-64.h           |  8 ++--
>  arch/riscv/include/asm/pgtable-bits.h         | 41 ++++++++++++++++++-
>  arch/riscv/include/asm/pgtable.h              | 39 ++++++++++++++----
>  arch/riscv/kernel/cpufeature.c                | 32 +++++++++++++++
>  arch/riscv/mm/init.c                          |  5 +++
>  7 files changed, 117 insertions(+), 15 deletions(-)
>
> --
> 2.25.4
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
