Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AB5C5AE59
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1ZoGKDZ6wvMuGIj+NwSCtHk2PO8ZMcg7zqtbWoPyW4E=; b=jO0itszfqFNRuNrKK47/UPf99/
	L04BPJzz8IEqMZz+Ecs+uTh4IlXxbfolXiSvUpve7oqDHX5rf2zX8No+Qa4UrmgatSkGtcCwaEL3U
	8OSQNJrAOFKRQMlVsgiHnaoqFgrh1UcFooQNd4upr9TWWF6ZR0w+DtqCH00E57QfA8Y7iXI4LvfuP
	hLhyjv89UoWCOOFGU5ioOIyz6jqN/Abv9sxkki7EStHGlqFYlc/9nr8B4nnKwOOllfcS6mXV1/Nbg
	RrowOSrnkIaAOb12yqecqRKlpKPMwCexGv1O4pvyV6e7aOAJTMRDAGDXkexYQk2Nax2EN2q1CkoDN
	tqvzNddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLKlv-00000003hLz-3j86;
	Sat, 31 May 2025 11:53:07 +0000
Received: from mta-05-3.privateemail.com ([198.54.118.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLKlt-00000003hLa-1DmS
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 11:53:06 +0000
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
	by mta-05.privateemail.com (Postfix) with ESMTP id 4b8dlc38sqz3hhVV;
	Sat, 31 May 2025 07:53:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1748692380; bh=ZqEA3lY58sHUP6hm3TaLzmg215uhz+4IvCjcFgwxtJY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eiCQzkLOYvvS70DtlQVbO/wXbYTrj0ctl3ppfNKdpA+bEm4ZCwuvQe0h9YFWkKXit
	 B7OQF+zim8XVzkUWUqKb3LJMjbN7U1P3OhqL/a0RrpaRwD0mg+XIl/8VrmBQu7MCxp
	 oFY0wTYju1Ay7P7rTpM6BMsamF2GQ8xVFZX7UYHBI7vMsHus8s5Kw6lQRv6XEL868u
	 oPuiKmtc3ecg0lTjEfnREV1XxYcIlXaJaFOJm6d/7btzKKeMas0aK7Ue5Bg0/w6H8l
	 kSdguuoaGjr+xpAQ7wZQzpGvsYA1LLEuIxXUP+FovHDvV1TxZmLmPYGlHZtTsVDnWD
	 QnyFKtx69CORA==
Received: from APP-18 (unknown [10.50.14.242])
	by mta-05.privateemail.com (Postfix) with ESMTPA;
	Sat, 31 May 2025 07:52:51 -0400 (EDT)
Date: Sat, 31 May 2025 13:52:51 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Message-ID: <1552795452.650306.1748692371190@privateemail.com>
In-Reply-To: <960240908.630790.1748641210849@privateemail.com>
References: <960240908.630790.1748641210849@privateemail.com>
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev75
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_045305_398516_D5796B19 
X-CRM114-Status: UNSURE (   2.17  )
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

> Steps to reproduce:
> 
>     export ARCH=riscv CROSS_COMPILE=riscv32-linux-
>     make distclean
>     make defconfig
>     make 32-bit.config
>     ./scripts/config \
>         -e DEBUG_KERNEL \
>         -e DEBUG_INFO \
>         -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
>         -d DEBUG_INFO_NONE \
>         -d DEBUG_INFO_REDUCED
>     make olddefconfig
>     make -j vmlinux

Sorry, forgot to add "-e FTRACE" to the steps above. Here it is:

	export ARCH=riscv CROSS_COMPILE=riscv32-linux-
	make distclean
	make defconfig
	make 32-bit.config
	./scripts/config \
		-e DEBUG_KERNEL \
		-e DEBUG_INFO \
		-e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
		-d DEBUG_INFO_NONE \
		-d DEBUG_INFO_REDUCED \
		-e FTRACE
	make olddefconfig
	make -j vmlinux

Everything else still applies.

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
