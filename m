Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D8C27C55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 03:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=23ZtP2uYIPEdiGp24Qwb8qLzRyX7TYxvnWyWV0egMJE=; b=ILFqL4fysvTvaP
	gcqy80nigaMwYGvBrxDaM80KkWXEHUG3nSzQTQ5DZz0q6qT7FnnKFn+GaMADvurr87R1S/9zqR+B9
	ICLZ9tQggBS+cZkik3omjT1DCdfApoyHH90DfMEBoI7UCF6hXyGefYKVnLDo5jQWpCrfecbK31sjg
	FlbGRnbkHbco8CjhRKV0goB/iN2HjdY6dYG2oZssq9Cbsm2P1A/zWcw9vIFdmOtiJ4/GZs3eEZMeY
	AXNLXT4bdYvGHqDmC4mzPtOnaETnytYMVFZRyMT3dRZ8AFzdqpbKNkFvWyYtG4NdyrsRgWkz0svkg
	SVAHy8m+sxzrxKCi4I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGs0r-00000007EyW-3FYa;
	Tue, 11 Jun 2024 03:17:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGs0k-00000007Etu-3pIm;
	Tue, 11 Jun 2024 03:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C009FCE01BC;
	Tue, 11 Jun 2024 03:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A354C4AF1A;
	Tue, 11 Jun 2024 03:17:23 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.97)
	(envelope-from <rostedt@goodmis.org>)
	id 1sGs0v-00000001JgD-3KfX;
	Mon, 10 Jun 2024 23:17:37 -0400
Message-ID: <20240611030934.162955582@goodmis.org>
User-Agent: quilt/0.68
Date: Mon, 10 Jun 2024 23:09:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2] function_graph: ftrace_graph_ret_addr(); there can be only one!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_201727_146666_D9044DA3 
X-CRM114-Status: UNSURE (   9.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


I noticed a slight bug in ftrace_graph_ret_addr() for when
HAVE_FUNCTION_GRAPH_RET_ADDR_PTR was defined and fixed it up.
I then noticed it was buggy when not defined. Looking for an
architecture that did not have it defined, I couldn't find any.
So I removed it.

Steven Rostedt (Google) (2):
      function_graph: Fix up ftrace_graph_ret_addr()
      function_graph: Everyone uses HAVE_FUNCTION_GRAPH_RET_ADDR_PTR, remove it

----
 Documentation/trace/ftrace-design.rst | 12 -------
 arch/arm64/include/asm/ftrace.h       | 11 -------
 arch/csky/include/asm/ftrace.h        |  2 --
 arch/loongarch/include/asm/ftrace.h   |  1 -
 arch/powerpc/include/asm/ftrace.h     |  2 --
 arch/riscv/include/asm/ftrace.h       |  1 -
 arch/s390/include/asm/ftrace.h        |  1 -
 arch/x86/include/asm/ftrace.h         |  2 --
 include/linux/ftrace.h                |  2 --
 kernel/trace/fgraph.c                 | 61 ++++++++++++-----------------------
 10 files changed, 20 insertions(+), 75 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
