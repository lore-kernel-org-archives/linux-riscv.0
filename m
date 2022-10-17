Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA45C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 00:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2gui5cBrXhjZcMegunXgin4LV0ZgyK8pwQ4/BrqUDo=; b=ySC2UTzH60cQvH
	bhVsaN8wZdxaUmOF2KAYYbQvwIVwl1mlHS/OED25MOJ+6dmdKM61dNtcHXFThwTw8bSQMKy0G3zIj
	GvsrcFDw+COJpk6k44Ddh2oz4veSD5V7v18E3f3Aj+C6pz1sMCd5jtqWS2UhskqSpcLCXKTqOgpVw
	rsXDZxC1s+RRubvG0GmKUDBHBpXEBhoGiDIxyS2gWLgXLeklJ+qdFW9ORuVi33R99qPMVbHY2HR13
	tQt6ZymWk6sCQAUX/WW9YUP7HxOltHRPWcJ659XD0Q2lX6LTd7CKJdggzi3F6QgdTgdHm/4DsbakI
	kGwg7jJY7G0st4Ii713g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okDzS-005Adb-51; Mon, 17 Oct 2022 00:28:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okDzQ-005AcS-9Q
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 00:28:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52500B80CC3;
	Mon, 17 Oct 2022 00:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D909C433C1;
	Mon, 17 Oct 2022 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1665966496;
	bh=8WWs9l2qmGMghweN7Ckgt8DaX3cG0OZdXxkM6TKYH6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XvguAicoL8TSob5RaCJ1spC8fTW535GDGPGmIeJqsUbMegUQgUfIZqKLGN8doPap6
	 rlQcttXjKZaERBO515DWE+A4kKsh18wQ4rFtJj6yPsLVghtZ8l21QGuWZNDBiY6bxl
	 ticivMkLffHyBnxcxWZes4OauqiUkqBsk9jAXjGc=
Date: Sun, 16 Oct 2022 17:28:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
Message-Id: <20221016172815.f5a5f1f86af7ff1937a2e273@linux-foundation.org>
In-Reply-To: <20221014204210.383380-1-nathan@kernel.org>
References: <20221014204210.383380-1-nathan@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_172820_504351_132F02CB 
X-CRM114-Status: GOOD (  11.52  )
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

On Fri, 14 Oct 2022 13:42:11 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> When building with a RISC-V kernel with DWARF5 debug info using clang
> and the GNU assembler, several instances of the following error appear:
> 
>   /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported

hm, which kernels want this?

I could merge it for 6.1, which seems suitable.  If we want it
backported into earlier kernels then a Fixes: would be nice, to prevent
it from being ported back further than necessary.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
