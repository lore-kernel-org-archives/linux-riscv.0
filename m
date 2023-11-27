Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E57C07CB1
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avrYcx2QYXvLhPQp0X2P/+fkE1x+gFXCi9baqlNj4xo=; b=nOxILRPpBF/q4j
	TMO2mgmZiMuAEj7gfXAvtjsbE9cLVfXhBkOlCjZI3RDHvJYVkTtbRxlJ5IPTUDGUlruWcj6QwkgaG
	qfNN1YVw8wZ4vjx7lAyHbdJtev558pzSxv6spJwLUf5HrjKZYv0ifu1S6gPvQxIQWaEdrdrXBJfcG
	tP6Cv5Jk78rd/U6kegCfyCA+gxn64cuHLms3fYEwoYCkTw1GVYfVHOLACH6PQxW7eUmPX4IRBHasF
	ENpEDAPdFeyH5rkwipkNSy/emCwgQCZGuJtd8YvUXgzF+hfKiLquZm6D8LKd002mvYtOODJtg278d
	PZWExmBGESxOegLF/q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aVM-002QZD-2C;
	Mon, 27 Nov 2023 12:14:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aVJ-002QYJ-2x
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 12:14:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70492F4;
	Mon, 27 Nov 2023 04:15:07 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.43.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59403F73F;
	Mon, 27 Nov 2023 04:14:16 -0800 (PST)
Date: Mon, 27 Nov 2023 12:14:13 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?us-ascii?Q?Bj=22orn_T=22opel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <ZWSIFV9JGc-Mysvh@FVFF77S0Q05N>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <59da3e41-abb3-405a-8f98-c74bdf26935b@huaweicloud.com>
 <20231124115430.GS3818@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124115430.GS3818@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_041422_000869_98772DFE 
X-CRM114-Status: GOOD (  16.14  )
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

On Fri, Nov 24, 2023 at 12:54:30PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 24, 2023 at 12:04:09PM +0100, Jonas Oberhauser wrote:
> > > I think ARM64 approached this problem by adding the
> > > load-acquire/store-release instructions and for TSO based code,
> > > translate into those (eg. x86 -> arm64 transpilers).
> > 
> > Although those instructions have a bit more ordering constraints.
> > 
> > I have heard rumors that the apple chips also have a register that can be
> > set at runtime.
> 
> Oh, I thought they made do with the load-acquire/store-release thingies.
> But to be fair, I haven't been paying *that* much attention to the apple
> stuff.
> 
> I did read about how they fudged some of the x86 flags thing.

I don't know what others may have built specifically, but architecturally on
arm64 we expect people to express ordering requirements through instructions.
ARMv8.0 has load-acquire and store-release, ARMv8.3 added RCpc forms of
load-acquire as part of FEAT_LRCPC, and ARMv8.4 added a number of instructions
as part of FEAT_LRCPC2.

For a number of reasons we avoid IMPLEMENTATION DEFINED controls for things
like this.

Thanks
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
