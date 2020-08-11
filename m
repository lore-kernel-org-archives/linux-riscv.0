Return-Path: <SRS0=5c4l=BV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0050FC433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 16:40:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD7620825
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 16:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PoVtDuHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD7620825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1IIDWBB5OAS3Ajz2LWvAxvVfxBIJmJuiaW65NsX8To4=; b=PoVtDuHez3to3cR4E3cL74TJ9
	XLFrXGfwsrgRK+TgdXWxR5xr0ojGWmd01G9KHdQN1ikeMtmB259AQnNFQkCGCjPLTEBl8vn6NA57b
	SvdrkUXsJKYuq1MFej/QyKlJvhDk+AYuNEF3SWQwhxdA/x89kwyeJy7nVZ3zEtvSlqabjb+QNBZvV
	csuqjPFm2QyodRX9OkPVhHdtqWIi1vBS/vGX0LyQS7IB2f3HHTpphqOnIEkJUuLg0iE8RM9PejA/b
	n1Qc8MOYe9XpQgDSgxNa5DQbKcMV+VwSEIQrJO1DjHYGhqVZz1j2nA+HNmlNrK5MeBTDikmVyCZqI
	X9qARhqhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5XJW-0007Bz-Ek; Tue, 11 Aug 2020 16:39:50 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5XJT-0007B6-2O
 for linux-riscv@lists.infradead.org; Tue, 11 Aug 2020 16:39:47 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 75A794FA;
 Tue, 11 Aug 2020 16:39:41 +0000 (UTC)
Date: Tue, 11 Aug 2020 10:39:40 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Tobias Klauser <tklauser@distanz.ch>
Subject: Re: [PATCH]  Documentation/features: refresh RISC-V arch support files
Message-ID: <20200811103940.0a9229b9@lwn.net>
In-Reply-To: <20200810095000.32092-1-tklauser@distanz.ch>
References: <20200810095000.32092-1-tklauser@distanz.ch>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_123947_340683_95632578 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-doc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Aug 2020 11:50:00 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

> Support for these was added by the following commits:
> 
>   f2c9699f6555 ("riscv: Add STACKPROTECTOR supported")
>   3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT").
>   ed48b297fe21 ("riscv: Enable context tracking")
>   cbb3d91d3bcf ("riscv: Add kmemleak support")
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  Documentation/features/debug/kmemleak/arch-support.txt        | 2 +-
>  Documentation/features/debug/stackprotector/arch-support.txt  | 2 +-
>  Documentation/features/locking/lockdep/arch-support.txt       | 2 +-
>  Documentation/features/time/context-tracking/arch-support.txt | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
