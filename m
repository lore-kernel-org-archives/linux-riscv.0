Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91113C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ3dgbaJbuTGGK5QXUD775abLEAoI2UAb4AmRozqPWM=; b=JRQSW6g7NxQBkM
	Yk3Yke7PBTbI7kRhRpOhS+rU+sVfWIS17cD5iKTa9UOfI1tWtma6ATZ85KYdDxYVP1nUrwuEmSHB9
	u6mrc5sB2phtPVnTkWTPPaZ9hT2bn6XY67z1FqZ8BMkBkIFpGGJeIvJLb2PggEubNnTgLnZJWn+Ww
	pMehQ5E/6ImDbD6pZn3hw+HvAG+Weh9Jk3EfPQxd0ENcXC8YCusIXL3ogt2BSqDYtKwDnoktgqDSz
	nW4hy2VJnjs8BWaSJ246MJnO/GNxjBprpboWUXgyjACG9ngOVJW6KA8kk6Nwl08g0RI0lpBvUV3EG
	oW7VjXCZwGxnJsxdZy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL0T-0000000AAY5-1GIY;
	Mon, 13 Jul 2026 18:03:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL0S-0000000AAXz-1sFi
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 18:03:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A656C60103;
	Mon, 13 Jul 2026 18:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A7E1F000E9;
	Mon, 13 Jul 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783965831;
	bh=0R1cR7bKh7ixS3Ep3XrpKwenEOmJrkdIxyoKz6OerB0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ESOKP2rZPyACXFW/kfBTOgmI3+3qmraqLbjJMYdrj3rjM8G8wl+2yrsV7SboHyQbQ
	 cBQkXKgK008NzCXQZBYUI1VDd6+5Mm6vuxOTstiYXXI/Q3pDB2tCojuKfgnSuCvzjM
	 mN9qDvnOrt37OWH8edLykRMnH6QeT13rxLkBs8tWhSHW0bDEv2Ir070kOlNO1UcyVh
	 f6rkxiqi58tXvghJ0k6P9qzrj/Dwdz3FJfy2KGLkNvzJXlFaRJ3mvnyhXloQv8wM33
	 XLg8vWZPxDV6NMnxwRU0qLkg+LHyAJ8SoA/7d8IkuYuaefHVETGtQdaIk/CCXPTt4L
	 6ZeGlodc0aoBg==
Date: Mon, 13 Jul 2026 12:03:47 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
    daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
    eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, 
    yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org, 
    pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com, 
    ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
    rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
    conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
    seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
    cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
    apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
    arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
    morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
    linux-arch@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 1/3] riscv: io: avoid null-pointer arithmetic in PIO
 helpers
In-Reply-To: <20260703122832.15984-2-cuiyunhui@bytedance.com>
Message-ID: <74ffb0c5-4edd-7b64-3d3f-be76c2aec4c2@kernel.org>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com> <20260703122832.15984-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
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

On Fri, 3 Jul 2026, Yunhui Cui wrote:

> When port I/O is not supported, exposing the port-string helpers is both
> unnecessary and can make clang diagnose null-pointer arithmetic from the
> PCI_IOBASE based address expression.  Keep the MMIO string helpers
> available as before, but only provide the port I/O variants when
> CONFIG_HAS_IOPORT is enabled.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
