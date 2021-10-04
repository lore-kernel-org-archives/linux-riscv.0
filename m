Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DB9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 07:16:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5766124D
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 07:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C5766124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5vrSXoujNyHedVUJnFeJucJsLYeqzobuPTgFe5m8IY=; b=yQsXBwuCL5N2R9
	5YIMOSfjExj4ZodXsXbq+z6VB79IRQchcTyWKrERWG1u1hOwWXbNn6lsDPKaPtn6ybixA2i1Hy4nq
	85tQvmYQh7txDan1l5eML9wYTRdxndzkFoHwUu66jZtgJo6IEOV4K5q4aXRpXlR0IEOrYf9gKSK9K
	wN1Nsa47TiE0Ef6g9Lzg41W2KrqRe4is6Sqnk20L5PMmCNchdHMtrbl3JcxX+M/qz2E72HkZ46psS
	i3T9Svxv9DtkcT9i6f5zCZeGYTuCf+A/jrWMEun+7Ji31yelDNek2SUz/kGC0wqNpvIRemuN74ttL
	7BgMdvxRH4x8a37ffz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXICO-005SkL-KS; Mon, 04 Oct 2021 07:15:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXICL-005SjT-Mc
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 07:15:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3683610E6;
 Mon,  4 Oct 2021 07:15:38 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:15:36 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 christian@brauner.io, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Include clone3() on rv32
Message-ID: <20211004071536.hloqmba6y4cw3hli@wittgenstein>
References: <20211003002120.198752-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003002120.198752-1-palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_001541_773597_57A25B00 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sat, Oct 02, 2021 at 05:21:20PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> As far as I can tell this should be enabled on rv32 as well, I'm not
> sure why it's rv64-only.  checksyscalls is complaining about our lack of
> clone3() on rv32.
> 
> Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
