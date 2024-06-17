Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B2C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGFebCEl9c8q0wQU8I8lSEvoxevj+ExmfKyQc/jhGyw=; b=M77znONx/tLNwq
	Dl7Ifx6NOKSeEB9WkNyl1707RgcKcXG8f4IlNzM5g9eSrM91KBegFnkN3xUWIrAuU8QU3Ya8WCzu+
	4IXqtHA6ml/i/jmHrBCxWF7chdqMCVznf3IvRzOiOVv+/hGHwY2rBMCkeaEdhekh4Pvc24GmE6czs
	UHddzzg+7VHSXwSbTslISUU/X4td+/DfN/hzZ4mCiYEmBPhYYwKKlhw/tOvrcIsftB1DLLZ37D8Mm
	Xgsz5yQql4iYblwEcPK6qLiy0dnbDlGEFHOaJV+FDaaGwE6FbGU8YwpJrYNggYgckNwnnecE2gw4G
	A/X6m0cC06Htb0Z7RiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCfp-0000000Avn5-1d1J;
	Mon, 17 Jun 2024 13:45:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCfm-0000000Avlt-3V33
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C257CE11E3;
	Mon, 17 Jun 2024 13:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64783C2BD10;
	Mon, 17 Jun 2024 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718631923;
	bh=4iVfyEz9rC5f5VhbEizq/D4gDbwzw56EP8r/d+CALXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlAH4DUkW1fOUYBYa90CiYLEhyPwhHj7gWkqqw8iS7jJJmVEDYBMUZtl2LDO6+4kR
	 NAQlfwuYGf5OH8S/RabV+UY1lvNd615atdQLwJiLtMMCHHznPNIagjH+6JIFvMLWcn
	 fOKmrJom+rr3vJXeB/BrG5ErfCQY2Vu4i8OaIjMQJ1CcNRgvq0LEqMjg6sxAQCrWFW
	 WL9WIyL3mMg4hkLHD3m5npeG2PBCO+NefrJQm8umO8P0brhsQ+JQS60HZO0I6IvndQ
	 9xqtwnS38uxG0R9MfwbU84d93oWeNZH9zFSM2MizMZMdCzGQjGLGWKifHdsL0ZAouw
	 Fu1/kjOZ6/SAw==
Date: Mon, 17 Jun 2024 21:31:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <ZnA6pZLkI2StP8Hh@xhacker>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <ZnAw9QrSD-svYqQ5@xhacker>
 <20240617-carat-poise-ee63ed6a224e@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617-carat-poise-ee63ed6a224e@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_064527_075223_E1D52364 
X-CRM114-Status: GOOD (  21.53  )
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

On Mon, Jun 17, 2024 at 02:29:46PM +0100, Conor Dooley wrote:
> On Mon, Jun 17, 2024 at 08:49:57PM +0800, Jisheng Zhang wrote:
> > On Mon, Jun 17, 2024 at 01:20:52AM +0800, Yangyu Chen wrote:
> > > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> > > 
> > > Key features:
> > > - 4 cores per cluster, 2 clusters on chip
> > > - UART IP is Intel XScale UART
> > > 
> > > Some key considerations:
> > > - ISA string is inferred from vendor documentation[2]
> > > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> > > - No coherent DMA on this board
> > >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > - No cache nodes now
> > >     The parameters from vendor dts are likely to be wrong. It has 512
> > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> > >     When the size of the cache line is 64B, it is a directly mapped
> > >     cache rather than a set-associative cache, the latter is commonly
> > >     used. Thus, I didn't use the parameters from vendor dts.
> > > 
> > > Currently only support booting into console with only uart, other
> > > features will be added soon later.
> > 
> > Hi Yangyu,
> > 
> > Per recent practice of cv1800b and th1520 upstream, I think a complete
> > initial support would include pinctrl, clk and reset, I have received
> > the complains from the community. So can you please bring the pinctrl
> > clk  and reset at the same time?
> 
> What sort of complaints have you got? That the support is too minimal to
> be useful?

For example https://lore.kernel.org/linux-riscv/95c20c6c-66cd-4f87-920b-5da766317e19@sifive.com/

Now, I think it's better to "model the clocks/resets/other dependencies"
in the initial support. So lacking of pinctrl, clk and reset doesn't
fully describe the hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
