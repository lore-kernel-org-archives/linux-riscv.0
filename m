Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E84C56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHbqJZd/5AB/mJbp71XnomoK8aGW/jT1NcAyqrSsLiQ=; b=h2RbDH3HWCdcY8
	JiF+QZ2A99Pm3E0uV7fqjCyRANJmucQd8ki0CCeBQbW9eAFgohn/zqFM7zXyOD8gj4ZPzr7TROz+E
	btT5LhJlAXpAdDxWnBQWQmIc2RkSuy+ZCHJDR5r3Kr6a2x4oJg2qGYJofoAshght/AwjiwDY2EwR9
	BK/tb2V95mVgWcKaZwqqWAorKR45geL3Rxgo6tLTRgVUXqEYHckJStuBlGJhqnxk0t2XSS7VupZLD
	XoUD0B0cF95q+lE/6Io5lslaNQhtLGjHJGBKqspl6PxQ2yTK51XsmI91V3T8gAqLE4ngaN5lW9JPc
	E9M0PBClxwyMeCDYERqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Al-00000006PB8-3ZA6;
	Thu, 06 Aug 2026 17:46:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Ak-00000006PB0-3Jy1
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 17:46:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CBAC415AB;
	Thu,  6 Aug 2026 17:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD931F000E9;
	Thu,  6 Aug 2026 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038385;
	bh=L9xxqnV9eTLoJ5I5u7yPUVEyyjn3FLmulSGTaZ2s0Uc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=aMLfcp5h0KABXIruZMK3FqMnCsAUbNe9eJyWFTNhuRJTLXRcNb6GyyvKxaXDfg4yj
	 tKVDmd8OX+UCgDnrYl4rdmXRR2mEhZaYYTNJDnoKZELBxTN8o5DXzdJJFV5vntR22C
	 iF52TYcsvS3MCwB5Jw1O3BD0No+i/CSfhYGsHwDhS+xBKqrTtD5QDUFLgYUIgka8Zt
	 Ml7BHiWrV4NCjd6z2nQHBZ12NRVhRpgvp6yX7SA7eBX7huCdSmGnEAEWAFHo3tji1O
	 nFxwbFqKxmc93v7NNcOg6q4GbluPyEj3oHuTxzapa3sSiul0Xyb816uG64XLkQOUBS
	 aUxYC3DoFUt/A==
Date: Thu, 6 Aug 2026 11:46:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: unexport satp_mode
In-Reply-To: <20260805010105.13934-1-jszhang@kernel.org>
Message-ID: <a527fac1-ba1c-68a7-b86b-2501058041bc@kernel.org>
References: <20260805010105.13934-1-jszhang@kernel.org>
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

On Wed, 5 Aug 2026, Jisheng Zhang wrote:

> Since satp_mode introduction, it is only utilized by built-in kernel
> code.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

As Sashiko points out, this breaks the build when CONFIG_KVM=m.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
