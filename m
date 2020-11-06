Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8BEC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 17:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF5E22228
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 17:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8ljACuW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF5E22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y8tI8zSJHEy+52oHczPmDaIXTRQ3TxEqQgppqWzcnnw=; b=r8ljACuWn0oU+xCcJOhKGNYTv
	Xo9FTF0Nr8/GDYgwxnnXwB6I7MC09cAv1wbGumZnG5aMHa55uKKtsI2M7eNCNgfULOalJAAoS1Nyz
	RFA9MfvweoPEBe+G9cOGVSj5MwDX6ZL1pEmEw1yyvItWn7NClm1u8KZnrj/k0BZ8YtNeDsB7t/U6b
	js4DL66A6B8cqRA3Z+qfCahqtWT/QncFIuOSQ9GgKgljFmHT7rgC9Lz5EA2zCZNGBDpjVxvpCFMm7
	WG8F8fd0NgglQhkvoO9yuoDIcS2cKWr/EpEOrAqbCbDDGDpmCR4X1pt0XGPwX8NuXug9zovz3qPNT
	2Tos3wopg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb5Nf-0006dg-Se; Fri, 06 Nov 2020 17:18:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb5Nb-0006cW-E7; Fri, 06 Nov 2020 17:18:28 +0000
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90B4E22227;
 Fri,  6 Nov 2020 17:18:21 +0000 (UTC)
Date: Fri, 6 Nov 2020 17:18:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v4 0/5] Unify NUMA implementation between ARM64 & RISC-V
Message-ID: <20201106171818.GL29329@gaia>
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <mhng-6971ba28-0cea-42bc-a26c-c23b9ba2af9e@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6971ba28-0cea-42bc-a26c-c23b9ba2af9e@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_121827_590593_3ED7A0B3 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: wangkefeng.wang@huawei.com, david@redhat.com, Jonathan.Cameron@huawei.com,
 Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 linux-riscv@lists.infradead.org, will@kernel.org, linux-arch@vger.kernel.org,
 justin.he@arm.com, Will Deacon <willdeacon@google.com>, maz@kernel.org,
 rafael@kernel.org, steven.price@arm.com, greentime.hu@sifive.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rppt@kernel.org, anup@brainfault.org,
 akpm@linux-foundation.org, nsaenzjulienne@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 05, 2020 at 10:07:00AM -0800, Palmer Dabbelt wrote:
> On Mon, 05 Oct 2020 17:17:47 PDT (-0700), Atish Patra wrote:
> > arch/arm64/Kconfig                            |  1 +
> > arch/arm64/include/asm/numa.h                 | 45 +----------------
> > arch/arm64/kernel/acpi_numa.c                 | 13 -----
> > arch/arm64/mm/Makefile                        |  1 -
> > arch/arm64/mm/init.c                          |  4 +-
> > arch/riscv/Kconfig                            | 31 +++++++++++-
> > arch/riscv/include/asm/mmzone.h               | 13 +++++
> > arch/riscv/include/asm/numa.h                 |  8 +++
> > arch/riscv/include/asm/pci.h                  | 14 ++++++
> > arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> > arch/riscv/kernel/setup.c                     | 11 ++++-
> > arch/riscv/kernel/smpboot.c                   | 12 ++++-
> > arch/riscv/mm/init.c                          | 10 +++-
> > drivers/base/Kconfig                          |  6 +++
> > drivers/base/Makefile                         |  1 +
> > .../mm/numa.c => drivers/base/arch_numa.c     | 30 ++++++++++--
> > include/asm-generic/numa.h                    | 49 +++++++++++++++++++
> > 17 files changed, 199 insertions(+), 71 deletions(-)
> > create mode 100644 arch/riscv/include/asm/mmzone.h
> > create mode 100644 arch/riscv/include/asm/numa.h
> > rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
> > create mode 100644 include/asm-generic/numa.h
[...]
> arm64 guys: do you want to try and do some sort of shared base tag sort of
> thing for these, or do you want me to refactor this such that it adds the
> generic stuff before removing the arm64 stuff so we can decouble that way?

I had a comment on the second patch (probably impacting the first) but
otherwise they look fine.

I'm happy for this series to go in via the riscv tree but, if we run
into conflicts, please provide a stable branch somewhere containing the
arm64 changes (first two patches).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
