Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BE4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zi2A2LvsPQGGuTsJ72ppYttVy71o6Zro0nbpM5uXYZA=; b=hb3wGFfDtRW/MQ
	ck4qdB3mYXiyD9j7ddGKTOnqAZA19SbuIxbTj6eX4dUwT6aXSpzSYaTnECDpoHyUIl8zok65YItbi
	7tBqHmhLtnezPY709hsHzwIikVFs+b4ATmXy4tVyPvBDRr2WZPMvb+T+skASfQOpwLTZHfIjJZLC2
	8euWUT2BxVZ6SGxMKgERwYEKM3sTdnxBiGY3EwTGF2x/4Geywr8YBS+uXN5UuGErgEokz1qEa3/te
	9lDF95sPu8b9D5sGTIRe528QzuPzSs4ak9kirfrwJTSvJa+12rghCECE+c78Jnwse2sUtpG97NncQ
	/WkNnlrDhOwM1EaAGk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4FP-00FNbQ-B9; Tue, 15 Nov 2022 22:17:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov4FM-00FNac-JC
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 22:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41AFDB81B50;
	Tue, 15 Nov 2022 22:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D82BC433C1;
	Tue, 15 Nov 2022 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668550652;
	bh=0hu7rKCEN7EFEfQlBLLzIaScplCM3c5RZS+5NSeqKAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEMH4orDzHDiNvbLvQQI0vvUFneS7XXW+lBWsmjjvGTxHw7FthyZ8ACBRJ9ZAafEp
	 8fXBRcxEjfmu/ZkqgZg6FjJqrL461SNq4SN3KBAlqcrAxI+0UWreMhHdkCZBExDDyg
	 bt9Rofs8zCs3WqEiSDNYCoWQhf9AFb/TpwOIzVmS3LIIViZnio42Z3WQGN2cBNDTV0
	 o6HWlJ5MmUZ2EQNX1RARcN2M2ronhI1W5ZfCeBYJXiVcR66EwfjDmoWFPtm7daUw3F
	 RoNmU+0HUjSop/wTxPsuJalBuPFAhczLY0W7/1QgXxXRhgSwZ/N/XOwEhZt/0fCxQC
	 xpsduM0buvSrg==
Date: Tue, 15 Nov 2022 22:17:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Conor.Dooley@microchip.com, bjorn@kernel.org, stillson@rivosinc.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	vincent.chen@sifive.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
Message-ID: <Y3QP9zjM3a4yifvi@spud>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
 <98343aa8-b04d-fe58-8af8-4eeca03106d1@microchip.com>
 <9cda597c-1d31-4b8b-99ba-deab58975976@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cda597c-1d31-4b8b-99ba-deab58975976@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_141736_813719_C7A33B80 
X-CRM114-Status: GOOD (  21.56  )
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

On Tue, Nov 15, 2022 at 09:38:53AM -0800, Vineet Gupta wrote:
> On 11/13/22 08:16, Conor.Dooley@microchip.com wrote:
> > > > +config VECTOR
> > > > +     bool "VECTOR support"
> > > > +     depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
> > > > +     default n
> > > > +     help
> > > > +       Say N here if you want to disable all vector related procedure
> > > > +       in the kernel.
> > > > +
> > > > +       If you don't know what to do here, say Y.
> > > > +
> > > > +endmenu
> > > "VECTOR" is not really consistent to how the other configs are named;
> > > RISCV_ISA_V, RISCV_ISA_VECTOR, RISCV_VECTOR?
> > It'd be RISCV_ISA_V to match the others single letter extentions, right?
> 
> Yep.
> 
> > The toolchain dependency check here also seems rather naive.
> 
> Indeed. I can build the code just fine with gcc-11 (and gcc-12), although my
> reworked patcheset doesn't include all the orig patches including the
> in-kernel xor stuff.

By naive here I meant that checking cc alone is probably not a
sufficient check for whether the toolchain supports the extension.
What about the assembler etc?

With Zicbom and Zihintpause we ran into problems with mixed usage, eg
binutils 2.35 + gcc 12. In his Zicboz series Drew has gone with insn
definitions - but while that's okay for something small like Zicboz,
do we want to do that for something with as many instructions as vector?

The alternative is cc-option, but that feels a lot less clean than what
Drew cooked up here:
https://lore.kernel.org/linux-riscv/20221027130247.31634-1-ajones@ventanamicro.com/

I've not checked this because I am lazy, but I am also assuming that
whoever put clang-13 in there picked it such that it doesn't require
experimental extensions flags. Mostly just writing this to remind myself
to check it at some point.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
