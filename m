Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE80EE57CC
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 00:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnGlTn5rlBP2hfvTk5tapEYpnO0C0K4uN/FpnC3KZlQ=; b=UkFZ8Gm6x7eR0r
	p+VpWiQYIDV/HAeE4+znJsA3GS+zgi38Qc3ZA1vw8wqpnO5PWFNdur5zp1yoMjz/5PrA4Jimy2iOH
	hPVyAvxC5pjxbFaM9dkye61vWYzePp1AevY9IvUCRBJ0KA9VzLmjZQ0IZ6XwJ93ifcUHdwmBuTRSX
	xnIZRAvPv0yYvyzxRs3jTb56WjBedRwLU2q0AwMTXltFTvrLP5b89oWt0w538Of2Ra4HgcYuKmkwS
	qCVLb3MNgYr9V7i/pTwXenTYk7hleY4tfajlPE3V9eBHiD+C1UF/hHcMK3mr8Bv4stDki2yvpRfow
	Y2IX4AvGlRsagnHL2c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vak7F-00000005V26-0CSi;
	Wed, 31 Dec 2025 00:31:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vak7C-00000005V1x-2wvA
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 00:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8CE060008;
	Wed, 31 Dec 2025 00:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EE7C4CEFB;
	Wed, 31 Dec 2025 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767141061;
	bh=8DsH0rZ65Z/UvLa0nkE/G0G86Zhg6WQwFd0CWhDEEr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nHB3jVKBI/qdutZRMky1723rGYNqEZBnM9repl3u0BSnOdTSfw21E1nRpx3Fwxyah
	 2UulhTlgxx+zDZUXEKwa91QXux23JUAcTUd+8QCwXxIK6TWm+hXXyXmIdvZkmmy+E6
	 UCzGzuvQBIuhgMGnnfAyF6amxPCGLV37giEORUbcd5Ry45qOX9Ddjy9pmgGjLV01DW
	 u+7sAxTrgRftwmoBug48O2o4VA4etzCOyMQnoxnAlzf79/LkSr22s9h0V2z0qwW+1g
	 uJ6yhNwWi7zRbnnCMT5qhBN4qElD0YUVNKg7Vey5S+AyNe5vvWHJp0YMgqTinR15JU
	 PneD5jgKIfZog==
Date: Tue, 30 Dec 2025 17:30:57 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nathan Chancellor <nathan@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
    Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Message-ID: <28f873a5-6e9e-f2d3-9eb3-587745705eca@kernel.org>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
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

On Tue, 30 Dec 2025, Vivian Wang wrote:

> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. 

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
