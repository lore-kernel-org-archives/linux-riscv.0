Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9672AC369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx09I4sH1zT55+vebdkCiFQ8pNOx7NWHtYKcqTd3Yb8=; b=p8nuTJ1V5dHM82
	21ZHs0qoJUG61cedCrW7sNVq/62D9ZUyGi2FnNar+G1kRhNZJmzDEAb7DTYL0rX8VOlDnTDAIVySh
	gQ3W6iTEC7wsc+00xWiGoF42RfaQeb+2wYEBIkQLNxOEN4dW1HdVoYIKqWSMgIWJWyXU8JfNHnMr7
	cN5jo2xM78von7ZE1UtGbrJM9IZyNeDiMkb+qsTiTKbKSFBZTbx/kGJRHvJ8w9KcWUmCSQ9mXMNvE
	KxqoNjzg9ZWws1Kp/t7MExBVushiq7tkqjepUvmTat8VL5kdJxnfJH+lwie8CJgdr8xjPb+IJ5Oll
	fbhr+iFix/YbjZT1vDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAasx-0000000Gju0-3h0Q;
	Thu, 01 May 2025 20:51:59 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAasu-0000000Gjqq-1cg2
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 20:51:58 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CDA2E92009C; Thu,  1 May 2025 22:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C110F92009B;
	Thu,  1 May 2025 21:51:54 +0100 (BST)
Date: Thu, 1 May 2025 21:51:54 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
cc: Peter Zijlstra <peterz@infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
    "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
    "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
    Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
In-Reply-To: <alpine.DEB.2.21.2505012126250.31828@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2505012150460.31828@angie.orcam.me.uk>
References: <20250414123543.1615478-1-cleger@rivosinc.com> <20250414123543.1615478-2-cleger@rivosinc.com> <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr> <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com> <20250422094419.GC14170@noisy.programming.kicks-ass.net>
 <6e2ed6a9-aed0-4727-b1e3-903d3a7751b5@rivosinc.com> <alpine.DEB.2.21.2505012126250.31828@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_135156_585841_C5F53CDC 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Thu, 1 May 2025, Maciej W. Rozycki wrote:

>  Hopefully not in the hardirq context though, and the usual approach is to 
> keep interrupts disabled in the emulation path if arriving from the kernel 
> mode as we don't expect kernel code to be ever paged out (the same applies 
> to all kinds of machine instruction emulation).

 s/code/data/, obviously.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
