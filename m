Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3348C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Va9vifO1/4+ytVIOf+TbZpkljyqrRLVgKexDRt/L58k=; b=q1i6+CN6BP4J8lIayIw4uUpCKj
	v1TU8DOZ6e7/TduOgty4T+XfCLy2BxNAQM5vBHtW3RhtkI9KylmGD6ryxxROYtPSr47V5SslhKrzL
	AwkajopNg2DvNFxbop5MYXh9UZ1g7hC5mF3ZarEyKHbtpzOp8jVJLDe76iRGOjPGxyPc3yKRaW42Z
	ljK5qladCtozQL28NJAB/05+4BcVHnJyx65dKK+/V2Qunsg1rWn6RdYulCX0s4nUgPapPykUjF2FD
	2pwR4Xe5VF6HC/I7MOhELfNqa4yvmObcZpOWIEQEbmhPXr7ZOMJClxnd5tTdFaG2YRFWvFBT4pEsA
	/VXLLNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoXe-0000000DUr7-07Cb;
	Wed, 04 Jun 2025 13:52:30 +0000
Received: from mta-07-3.privateemail.com ([198.54.118.214])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoXb-0000000DUqL-1ETz
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 13:52:28 +0000
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
	by mta-07.privateemail.com (Postfix) with ESMTP id 4bC8CM4Y08z3hhTq;
	Wed,  4 Jun 2025 09:52:15 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1749045135; bh=J79gwTBZarVe0RuxSdrktqBoJC5jYm4za3pkIZqUA8w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gAGNm8sfyCZCVI3cvBf7RX5tqhyDmGogOAEXGIrCUSCP5SgSzND30lWdyj1ucoiAI
	 VYV8MYuA6qUWmAet9oMgPLc3adBB4iQ6xCjHD8xwHIHK+rqlzlPw9yueg4J3mHB8Ut
	 BFYyTqhQhJgBLTq72/Z1EP6L2Pqb9mV+fzew4SQAFQMf6B5GqJUKNwE+B2qaHNExFY
	 vkHdwrdkGJCOLR84zy+RUZOecV89LFRsEgbVgUzuaa8SxuiXo1bfrMSCbPncYpxnMn
	 xree7zyxKjXjX0jETNiYgnyYrLvv8J8M0fK6O3xvFDT418BkT2DUiKzoxYWrC72haZ
	 sV8T7x+CG7MIA==
Received: from APP-18 (unknown [10.50.14.242])
	by mta-07.privateemail.com (Postfix) with ESMTPA;
	Wed,  4 Jun 2025 09:52:05 -0400 (EDT)
Date: Wed, 4 Jun 2025 15:52:05 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: Alexandre Ghiti <alex@ghiti.fr>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Message-ID: <1338988468.1011577.1749045125350@privateemail.com>
In-Reply-To: <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
References: <960240908.630790.1748641210849@privateemail.com>
 <1552795452.650306.1748692371190@privateemail.com>
 <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev75
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_065227_387988_B40F3058 
X-CRM114-Status: UNSURE (   6.76  )
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

> Can you attach your full config?

Here it is: https://pastebin.com/raw/wL2Q38g0 - uploaded to pastebin to
avoid clogging everyone's inbox.

> I unfortunately cannot reproduce this issue locally, I tried on both 
> v6.15 and latest linus master, with gcc 13.1.0 and gcc 14.2.0 . I made 
> sure that I have FTRACE, ZSTD_COMPRESS and DEBUG_INFO enabled.

Are you building on a x86-64 host? Maybe something in my build environment
is relevant (not sure what it could be). I am building on x86-64 Debian 12
with host GCC 12.2.0, target cross GCC 14.2.0 [1]. 

Here is a minimal Dockerfile that reproduces the issue (docker build should
fail on the last command when it gets to MODPOST vmlinux.symvers):

	# docker build --progress=plain .
	FROM debian:12

	ENV DEBIAN_FRONTEND=noninteractive
	RUN apt-get update && \
		apt-get install -y \
			build-essential git make gcc-12 binutils util-linux bc gawk flex \
			bison dwarves tar wget

	WORKDIR /work
	RUN git clone --depth 1 --single-branch --branch v6.15 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
	RUN wget 'https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.2.0/x86_64-gcc-14.2.0-nolibc-riscv32-linux.tar.xz'
	RUN tar xf x86_64-gcc-14.2.0-nolibc-riscv32-linux.tar.xz

	WORKDIR /work/linux
	ENV PATH=/work/gcc-14.2.0-nolibc/riscv32-linux/bin:$PATH
	ENV CROSS_COMPILE=riscv32-linux-
	ENV ARCH=riscv
	RUN make distclean && \
		make defconfig && \
		make 32-bit.config && \
		./scripts/config \
			-e DEBUG_KERNEL \
			-e DEBUG_INFO \
			-e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
			-d DEBUG_INFO_NONE \
			-d DEBUG_INFO_REDUCED \
			-e FTRACE && \
		make olddefconfig

	RUN make -j19 vmlinux

Hope this helps. Let me know if you need any additional info or test.

[1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.2.0/x86_64-gcc-14.2.0-nolibc-riscv32-linux.tar.xz

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
