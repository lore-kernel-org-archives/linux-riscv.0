Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B130EB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy+QPfS4RJ+NPt0OSzGw+oF0HwzJzR25u1bWKrYJnlE=; b=SjG7WAzuTIMBjV
	iynPNmvsxgwus2PtWHNVfv9WJoieuZQBBq4zkRrMt7Nb6GQZSGSFJw8Q9PXYWdAtfpuGajWR7BPvI
	PhkLxJAiB2xwFEH1mOQ2F98kLCGZRMrAt635+1xy4Owrx4cCjVxM+u7bu0e+ATFO/btOIPlhZLztx
	IozXxAxkzat3XjMQruRrUFZWjUYZG9PddM4oXvr3DJsKGzdyp0jdEAeTtq3+wDj8KrpLZtluvg83M
	gnKX1omve523vpBXWRMfqUH07F8/kZGk7Y83DNKqyZS+wrKQI0dAqiY0TSzhlM07JAMHqsIQbi8Iw
	e6P/TU0WUDk5KG2KCfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBchP-00BZrr-1b;
	Tue, 20 Jun 2023 14:51:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBchL-00BZq7-2N;
	Tue, 20 Jun 2023 14:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E247612B3;
	Tue, 20 Jun 2023 14:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9B6C433CA;
	Tue, 20 Jun 2023 14:51:06 +0000 (UTC)
Date: Tue, 20 Jun 2023 10:51:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Mike Rapoport
 <rppt@kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit
 <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230620105104.60cb64d8@gandalf.local.home>
In-Reply-To: <87h6r4qo1d.ffs@tglx>
References: <20230616085038.4121892-1-rppt@kernel.org>
	<20230616085038.4121892-7-rppt@kernel.org>
	<87jzw0qu3s.ffs@tglx>
	<20230618231431.4aj3k5ujye22sqai@moria.home.lan>
	<87h6r4qo1d.ffs@tglx>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_075111_816710_EBFB2AC4 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, 19 Jun 2023 02:43:58 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> Now you might argue that it _is_ a "hotpath" due to the BPF usage, but
> then even more so as any intermediate wrapper which converts from one
> data representation to another data representation is not going to
> increase performance, right?

Just as a side note. BPF can not attach its return calling code to
functions that have more than 6 parameters (3 on 32 bit x86), because of
the way BPF return path trampoline works. It is a requirement that all
parameters live in registers, and none on the stack.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
