Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB3AC54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrCqzTgdk7LymbykdqmCbPxo2aPKlMi8oDh/Rkhhy+A=; b=NUI7OzY4w9IKph
	Hhppd3Fc8p4wac7mIN37YdSAfmjl7yGqqxF9uApQzIY9au+HqUYxORmxHEhySR2+ABuH7qo7qlKAb
	yMoyjxp6xJRqzbBdOQ7ggqoOp5SpHZK4E4wjAOg541PbvrlismiM3cYtQG+PS6qN3l51UPXTQi4+h
	aJ7D+zc6Yc8wzfkNUpcUJORAzVedEPO+Od7a5nJyLDR/eoZvNhmA6q7mrbTWU1mRX5dqxouaNKmFi
	w0LlS7Nni9Anr3l6K5EZcZ2KVN523xdF/+O/++GnpbVRyBT9CezFhuPhSia1QtDsmPt4kd9w5SMe+
	n/H6bpPfBcT1T00Hv/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcny-00Bx7f-2I; Wed, 11 Jan 2023 15:14:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcnv-00Bx5e-Iu
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 15:14:16 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFcnl-0006KT-Qy; Wed, 11 Jan 2023 16:14:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, jszhang@kernel.org
Subject: Re: [PATCH v4 1/5] RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
Date: Wed, 11 Jan 2023 16:14:05 +0100
Message-ID: <5637121.29KlJPOoH8@diego>
In-Reply-To: <Y7x+x3oiig3j94Bb@spud>
References: <20230109181755.2383085-1-heiko@sntech.de> <20230109181755.2383085-2-heiko@sntech.de> <Y7x+x3oiig3j94Bb@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_071415_653166_56ABECAF 
X-CRM114-Status: GOOD (  16.00  )
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

Am Montag, 9. Januar 2023, 21:53:27 CET schrieb Conor Dooley:
> On Mon, Jan 09, 2023 at 07:17:51PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions inside
> > the kprobes implementation. This got moved into a central header in
> > commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header").
> > 
> > Though it looks like I overlooked two of them, so fix that. FENCE itself is
> > an instruction defined directly by its own opcode, while the created
> > riscv_isn_is_system function covers all instructions defined under the SYSTEM
> > opcode.
> > 
> > Fixes: ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header")
> 
> Not quite sure why it needs a fixes tag, nothing was actually broken
> previously, right?

I was going with the thought of "this should've been in the original patch
already" / "the original patch does not fully do what it says it's doing"
hence the Fixes, but you're right - it's just cosmetics at this point and
would just incur more work for the stable people.

So I've dropped the Fixes

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
