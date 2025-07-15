Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1FEC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKxe4N+o5eUGbTvlJHvNDIsX46WyYvKHvdd/f/dOuEc=; b=M22tuPPlnLJrfl
	lKnsDavpJXlYQiKZ8HC8SAZt12GLMEJMrd9IJnaqOBLnlmDhE8c/9f6UaJ0PswvY+gZV3r47m0uXi
	3apUaE51I7sc7LGCHEM8ZycHmSMUtrz2Ab+u54vJ4tkz0KmhNdE0INs28bKklUn7FUHt2l37aWOxp
	Ew165D4SNwxrIrhXHRFYVD7d3kYhFjlYVZVqNyGHN/M5QAF+HM0TXDgGNDagCif18Km5EgY9MygeT
	SeuouwyINDyYFnNT3w7qqW/CP7l7GaCfCxDcJSZwRAduH0oSNPgXqR48tBm0iXU6DVY4g+e8hR60g
	3wve3doJjRnzMlQqfVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnfs-00000006I2I-480T;
	Tue, 15 Jul 2025 21:58:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnfq-00000006I1x-1WJ1
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 21:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8997C44ED9;
	Tue, 15 Jul 2025 21:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0828BC4CEE3;
	Tue, 15 Jul 2025 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752616733;
	bh=Al5kTu9Lb20vAaMzt40O4A44pcAsNVuFu/MblkMyb8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRKHUwWsDZfT1cr9LLqWHAGI8/kk6IWN2osmRUqW1jZPUziDpH6lBVTtVtRKZoBes
	 GoTfuSUHSJzfuwN9MrcleKx6N2DdNTtB43kXBuSFVRxLDJjWW8C90XeztmIJBnilBJ
	 ev1ZBgF4PU25HgyeuK4CwqRx57hZ9khwdOsX0DObxC/KEvrbvTasZsrbhTVW5FIWBd
	 w0Sx9E0kpK02iRA4D9h+74ut6KuaClygsi0kZ0+x0dscDAdBhp6YeotyFdf+tyYmeM
	 +jgo31hXtR5IiQzfnwR9xJL/uCP3TC1kJRRGfAYdtnMrxlFrU2i0l7/OfVOhgcA5Sv
	 VPysWZuFfb+7A==
Date: Tue, 15 Jul 2025 23:58:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alex Guo <alexguo1023@gmail.com>, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <6r6vbagr23kf5qyfmnmy7hkdljvu73sgakalqmbmdodf5rf4e2@fld6reoqfz5p>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
 <aGBMDFLH7aJGFyQ2@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGBMDFLH7aJGFyQ2@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_145854_422713_30F3342F 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Wolfram,

On Sat, Jun 28, 2025 at 10:09:48PM +0200, Wolfram Sang wrote:
> On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> > The data->block[0] variable comes from user. Without proper check,
> > the variable may be very large to cause an out-of-bounds bug.
> 
> Okay, okay, instead of adding these limits to all these drivers, let me
> start adding SMBus3 support to the kernel which allows for bigger block
> sizes. I probably won't have time to export this to user space yet, but
> let's at least make sure the kernel, and thus the drivers, won't suffer
> from buffer overflows anymore.

in the meantime, what should i do with all these patches? They
are not wrong and I agree that we need to work on the i2c core.
Besides having something like this might help all those drivers
using i2c by removing the need for their own specific
i2c_read/write methods.

Some times ago I started working on this and I have it still
laying around in one of my branches. If you haven'd done much
progress, i can bring it to life.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
