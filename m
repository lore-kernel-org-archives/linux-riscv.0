Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C599AC636C8
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 09:32:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6710E61184
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 09:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6710E61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30qFPfNFs8z9U5qlZFCERcp7IPsOMZ1Wu9fYYMojpho=; b=aiDIyPoWC7SUsG
	tFiB5j3qOhegbArYNxztzVVQzIrPAPu6UsfU5FOtBBrnmU+EgJ3xPQwTiICBZoWdFh+Fvv14cAz0h
	F6bj0kaXTz8aE6WTdRFarTsx6uD1qj90QJyoYIW1Tvm2pSkGj5KU7q3VOy7yHnEHABI2F7wO8j/f3
	isnzKVjXhhqGg3nKLBMUUDMmObbqN2pYnjnMTZXY+lXfEAiPGPuUnnbzs7Wex91L1xh2q3RyEgPMg
	dXCH9Q47VGWnQOoFRR2sp6YDpP7qbMiInIhyQS9WXwyuJBYxEaYlE0XDrdF37pnWyXM66uO5dROk6
	tye1IX9styQ15dybIGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m539k-007Wu4-I4; Sun, 18 Jul 2021 09:32:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5394-007WrH-PZ; Sun, 18 Jul 2021 09:31:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34BC960C3F;
 Sun, 18 Jul 2021 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626600693;
 bh=+rDFm9FsoZ08b6sGG01ofP3oHAAfan2l2sSh1XQwSR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aAJYxQFsJbdGWKQX5mdFOrV/4Mbkl/qDKVE1yIy9pxZq4HHu+AWBm7dAXBHiriHrG
 M6m8IZZlz8muKxk60d6kD7Ci0+jfD6udeh8+tb/Wjp4ehaNbxOk+whVAujiNEkYQKS
 PHKvYjq3fNIu4UVm+Z7v4s1fZPkunITPVAf1yELADkVpf4vJWy/8lOCgPU6CkkrMob
 G2A2DWUH3/st5jP+5I66EBcTvI628tSgsh/H2qXMbgg5RGPD0p0Qgg9hCd2BSvFR0S
 Mooq4W/uqRwgTonQqFVILswVYaEe6mhHurnQ/7N9BoQJY/gSkg9c01sBSpCcowA3bv
 jBJiC2NBzPWPw==
Date: Sun, 18 Jul 2021 12:31:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <YPP06QG7hfypZgYg@kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
 <20210714135101.GB2441138@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714135101.GB2441138@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_023134_917000_4CE4B9EE 
X-CRM114-Status: GOOD (  25.33  )
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

Hi,

On Wed, Jul 14, 2021 at 07:51:01AM -0600, Rob Herring wrote:
> On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> > Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> > base address and size, describing a limited region in which memory may
> > be considered available for use by the kernel.  If enabled, memory
> > outside of this range is not available for use.
> > 
> > These variables can by filled by firmware-specific code, and used in
> > calls to memblock_cap_memory_range() by architecture-specific code.
> > An example user is the parser of the "linux,usable-memory-range"
> > property in the DT "/chosen" node.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is similar to how the initial ramdisk (phys_initrd_{start,size})
> > and ELF core headers (elfcorehdr_{addr,size})) are handled.
> > 
> > Does there exist a suitable place in the common memblock code to call
> > "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> > have to be done in architecture-specific code?
> 
> Can't you just call it from early_init_dt_scan_usablemem? If the 
> property is present, you want to call it. If the property is not 
> present, nothing happens.

For memblock_cap_memory_range() to work properly it should be called after
memory is detected and added to memblock with memblock_add[_node]()

I'm not huge fan of adding more globals to memblock so if such ordering can
be implemented on the DT side it would be great.

I don't see a way to actually enforce this ordering, so maybe we'd want to
add warning in memblock_cap_memory_range() if memblock.memory is empty.
 
> Rob

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
