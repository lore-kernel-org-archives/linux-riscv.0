Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5AD232C9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9W4P0TSSuX8edFSS9xGbmZvrCv+JHp+Z8Vk1jNpEpSA=; b=EGQaDCw7bqRLt4DtTpawpF5iNF
	t3VTogQjJHcluch/ibR6jK3dPNCOvG856afU30oXvUI7QqoyqBueyo8AdOuGpsLRao5iBi6Axmb0b
	cgGJEKKXHpG6EMOg+OIM2w4F9vMGKhzNzNaB8G1syKt/sVlR+Eb3H0hmJBLLNQT/sRF8lqKeh/jfk
	FyTs4JT+xC0JeRQqjc+tz8DaxWdEquuResRtAAoTdBGXHXyVwhqQ0qOUOAmmhbp6J39hrzfa8xqhj
	q7f1KNgy5p7Gfq788S821clS/PH6aAKLoK2uWYnZa5mROcJqjtCVn9uAb/CgyN80bs/7ofEhjJcpt
	TxfHbb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6GA-00000001cLu-2oIL;
	Fri, 09 Jan 2026 06:46:10 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6G7-00000001cKu-1a7p
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 06:46:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 5E7C313006F9;
	Fri,  9 Jan 2026 01:46:03 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 09 Jan 2026 01:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767941163;
	 x=1767948363; bh=YcpLjbUUzr6hWX16ZbkqNNqxEJmALGeA88q7/vc3Tno=; b=
	FL1EIOqNDjCoxZtxJZlPMTUcImjeFYxI5GvoXxr2aINNF5cJvBP6qwld1HmI5IW+
	lYFq1rbGYWIJHBHvvUxeF/W9V5IaSdAi4dE2aAdnXv8DIf66GasTGCgrcKsaCIxB
	dL+QZu8x8OdLBlsLjiKXov5DfDEgPsstqsyqyHNLBLukd1FKFGslaAX2QujTUHM0
	LhD8JDQzEzSlOwIQOBQt5HQMIoDfyDpzlucoVtFJ1ZGu/KW9Nlr4EbrzZflwP1QG
	Tezrn7FNxM8Sl3ZCDg+TYZHX6m8wDi4Os3C5ATiACOdj/9CR/GnhKtNoE60njC8f
	DD8m5pzOJkpB5kGcmCTGlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767941163; x=
	1767948363; bh=YcpLjbUUzr6hWX16ZbkqNNqxEJmALGeA88q7/vc3Tno=; b=e
	DIdxhQGenKWOA7r2WA6JIwuAZcouvq7tHPMOxI2Vl02A5XqcnwCkBW5iSwudYchf
	b/LfTjQjfv53enrbnv0PCeO+8766eO4Md6SjbFJzjhEmI5Vs2Aq+Ix6TK36WRej1
	NYxh08tROHtV7RXEWcyfEUU+qHbdFz25RSNCmCgcR6/A1/Pg8/i3wdJqdl6+aaHH
	r7P/Xw0zIVM234NG0Nois3RlPkQakllEUezxzFfV46CLJ/m3JkJTGQMqL0WS3zbp
	y90yfhE0muARRkXypS5d6NfiYLGplpId0XDjO39dlurftMjElCgisB1mSMRk+R4Y
	t7Qi6EU+ZtPlmE9XDKyCA==
X-ME-Sender: <xms:KaRgaa3Khu8_p__hPiKoYBztmrNDDM3V3caVmGHhybWbL4kHmdWlKA>
    <xme:KaRgaX6Nhs_HPUpYwdFnuUNIR8Qlz9S3P2s6MzYIbXJEf2OuBnSAzv8_gEALYQ7WO
    sdk_8RuaLyQpEOm_RkKaj93gWBHDZeNux0H48_5icdruZPSuzDwwI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehfvggrrhihnhgtvghsshesrghoshgtrdhiohdprhgtphhtthhope
    hjvghffhgsrghisegrohhstgdrihhopdhrtghpthhtohepkhgvgiihsghishgtuhhithes
    rghoshgtrdhiohdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprh
    gtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohep
    jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegrlhgvgi
    esghhhihhtihdrfhhrpdhrtghpthhtohepshhurhgvnhgssehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KaRgaa_yBMDXZQ4y1lytDTjAr6MjULMfC2vgxAbsR6lYDq6gYyrsDA>
    <xmx:KaRgaWKgwa5_pl8-4Xf_RzybCaHYtGE9IWzYYAKHh6SbxDJ0m0-4Qw>
    <xmx:KaRgaet70oQ_Z6JYxhhHOUCt4-WXFLuAehhs7adRoLSY9MIGOthfZA>
    <xmx:KaRgafkTOgh7fPXAV32jOzTZvLv7dGYA9ncAUIORK6M4rxxTc7lj3A>
    <xmx:K6Rgaagi4lhHKnxarQtcvcbjgm74mUyWlKC9ayZ0QvbAud9-HRnSgaSH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65A02700065; Fri,  9 Jan 2026 01:46:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AqT2GkHpMKdg
Date: Fri, 09 Jan 2026 07:45:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lain Fearyncess Yang" <fearyncess@aosc.io>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>
Cc: "Kexy Biscuit" <kexybiscuit@aosc.io>, "Mingcong Bai" <jeffbai@aosc.io>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 shuah <shuah@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <08f257db-5fff-4707-b89e-d62b7d592143@app.fastmail.com>
In-Reply-To: <20260109051054.188030-1-fearyncess@aosc.io>
References: <20260109051054.188030-1-fearyncess@aosc.io>
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_224607_748329_DEA1D950 
X-CRM114-Status: UNSURE (   5.32  )
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

On Fri, Jan 9, 2026, at 06:10, Lain Fearyncess Yang wrote:
> From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>
>
> LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
> memfd_secret system call, which depends on it.
>
> Signed-off-by: Lain "Fearyncess" Yang <fearyncess@aosc.io>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
