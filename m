Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Az5ibQexXjaplrVm33nCQkC/R7f8VfSGXbX4gQvx4Jk=; b=3TAOmdmv0hXloU
	+uYxT+p8fDwuwDbudfOHgFF2zB1sgdlTdOKreRBnUpXUvflia1+TJ17agAqS5oeaTqJnscLCYYXAU
	XroVPk35FFn8/OqLb+wl2ObysWti0dtCJSCbP9ev+BVvKiOY2GJqdKc/A1kzDpAiQmljJ8TzZ6Wwg
	lbZjibpG1VeeYoBbAZs9VGeqnGl3nCNgWSeWVS3sM8KvMcIbnYnnsMbgLNumgYFtmrFCs7BtPxpAW
	9R+Ez1POjpjwhy5xfi1Xf+8fYGoVShbQP8Q6S8k0WWs4ibh1d/M2IRg+XphYNp8oDB0D0tp55VNjT
	YfapNQNUdGggNJ1VG+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no90R-00G18e-8Z; Mon, 09 May 2022 19:25:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no8w5-00FzDX-Vb; Mon, 09 May 2022 19:20:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E536B61690;
 Mon,  9 May 2022 19:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25555C385B8;
 Mon,  9 May 2022 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652124048;
 bh=+bmICguv18jBXLXxrwEf33icObsc1fpHfVo5K9f7UEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lRqjkFhc7fprJOJNhXu8GtpXTXjxRgBD11PxUp5vgIDT+yvDiqJ87C3HYOFhA8jdg
 R+oLSULFkhfcr+yp9NkuWc5h6OLbSHeyLb6zDIUu9i0pBIxF8cBZ9+47e9zOg8aL9P
 l3EkaSgcNByUgdE0P9G+I68ZcKHTZ1mAOoFJ/VOnIL2LYNsiElmX6jWPxGH4z+/NOO
 VU3uxCgvT9hpeTUOTO486gfhJr2PzZkT7pf4U7L2PPZnk1wuVH58YvDIDcdFR26RRq
 tk62Ej4fdy95ArndH/Fj2+sajgYOO9SSXHbnnLJeycGEeWRhveSn+d7ISAMZgxGDvT
 bGW6RhhtE7Nyw==
Date: Mon, 9 May 2022 12:20:45 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <20220509192045.2nkiaw4ne2dnuuai@treble>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
 <871qx2ubu5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qx2ubu5.fsf@mpe.ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_122050_105493_E6178C7E 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, May 09, 2022 at 10:31:14PM +1000, Michael Ellerman wrote:
> Embarrassingly, we have another copy of the logic, used in the C
> versions, they need updating too:

Oops, thanks for finding that.

> With that added it seems to be working correctly for me.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks!

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
