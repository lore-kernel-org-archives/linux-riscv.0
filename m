Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D69C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DPWJqw4Ew7JR1IxBFxNzSFoYBC4kmJ3e3hJWpyep0A=; b=hN4yFQck8ZaZUx
	SgMwdMwRPYch+bz6y9JgZM4u8gUZpvDr6kQDH6h7m4J5sp2U1QaJv30SgLMZ6NJLfWYAXjaKucgv9
	lLDjVGy425WeIo58dfWg6GRWwiBGmwlghz3KxgjWabV1PbJpP34stQEU29Cenit/gxla8b9I1Z0+q
	dGncvHiYcCgZWWycpE2mMDDe0MUy8738i5gRE9w/MDK5lpkrsCigAWX57GJcdSi7eNZ45V1/u//GQ
	/Nf0m5s6cCAhKQlEb5GcVRAhTwrOkLzIHP46p+aYpkKDAn3ZUkVWr8AdDMc+CC+ZmfdWWvoxrATcx
	XEWQALitqPEdZLu1IIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnG3-000grC-Sk; Thu, 31 Mar 2022 05:22:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnG1-000gqT-3Q
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:22:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8990B81E46;
 Thu, 31 Mar 2022 05:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C93C340F0;
 Thu, 31 Mar 2022 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648704121;
 bh=mcpxMkNMcpIlYQUa58BATurZoUD7VVJ6ZND97kCSnXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pRdzYTk6mAg1IM92bAPvM2X6NqMt8fQbd+EcDDdzUwqaRA+5L+czyvNXrdTrYEezA
 jeSUz011ZrWkRFWJ6oddYzbd1zLRd7FwrLuGThxbqQ3kUwbUAW95ln1ncBeWQSqIAn
 vvHkIDjEprrq5dsyE6rtexyPNNrrYGdEMqiWNlQ0+mqkpz+X5L+aHpDKEQ8xP6t5xC
 9T6nc/2ivi7v9di4JB4Moc2aG+gw3KIGm93qSoC8aI3uv/mc1PmfEeNzaYVHRb5oD4
 SVLIj/lKRmv6m6FsKhbHnzSkjm8W7Y4MY1MohKdebDq53yqNGp8aAbvtBITSXYNy1t
 2+oDmVp+ZBMNA==
Date: Thu, 31 Mar 2022 10:51:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zong.li@sifive.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 krzysztof.kozlowski@canonical.com, conor.dooley@microchip.com,
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
Message-ID: <YkU6dPFNPkD0Jay+@matsya>
References: <cover.1648461096.git.zong.li@sifive.com>
 <mhng-6ddf988e-9f86-4f3e-8b6a-6be65f384829@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6ddf988e-9f86-4f3e-8b6a-6be65f384829@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_222205_335565_96960219 
X-CRM114-Status: GOOD (  22.30  )
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

On 30-03-22, 20:15, Palmer Dabbelt wrote:
> On Mon, 28 Mar 2022 02:52:21 PDT (-0700), zong.li@sifive.com wrote:
> > The PDMA driver currently assumes there are four channels by default, it
> > might cause the error if there is actually less than four channels.
> > Change that by getting number of channel dynamically from device tree.
> > For backwards-compatible, it uses the default value (i.e. 4) when there
> > is no 'dma-channels' information in dts.
> > 
> > This patch set contains the dts and dt-bindings change.
> > 
> > Changed in v8:
> >  - Rebase on master
> >  - Remove modification of microchip-mpfs.dtsi
> >  - Rename DMA node name of fu540-c000.dtsi
> > 
> > Changed in v7:
> >  - Rebase on tag v5.17-rc7
> >  - Modify the subject of patch
> > 
> > Changed in v6:
> >  - Rebase on tag v5.17-rc6
> >  - Change sf_pdma.chans[] to a flexible array member.
> > 
> > Changed in v5:
> >  - Rebase on tag v5.17-rc3
> >  - Fix typo in dt-bindings and commit message
> >  - Add PDMA versioning scheme for compatible
> > 
> > Changed in v4:
> >  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
> > 
> > Changed in v3:
> >  - Fix allocating wrong size
> >  - Return error if 'dma-channels' is larger than maximum
> > 
> > Changed in v2:
> >  - Rebase on tag v5.16
> >  - Use 4 as default value of dma-channels
> > 
> > Zong Li (4):
> >   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
> >     modify compatible
> >   riscv: dts: Add dma-channels property and modify compatible
> >   riscv: dts: rename the node name of dma
> >   dmaengine: sf-pdma: Get number of channel by device tree
> > 
> >  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
> >  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
> >  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
> >  4 files changed, 38 insertions(+), 18 deletions(-)
> 
> Thanks, these are on for-next.

The drivers/dma/ should go thru dmaengine tree. During merge window I
dont apply the patches

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
