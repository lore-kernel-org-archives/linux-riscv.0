Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB7EC5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U73El4VZhKA+9XC7cosHa6K2vbWaicA1RdKBUPrI0E=; b=2OBApepTRE1geE
	jBHnqlZmXDH63Cjme9lCjcXaS+rg+7jdW5Xaq0CK5WwqHTL6mZKSPkxnIrGyiCQWcIW8b3oepoWJq
	lwn9bKlldWUHYMznTRScLzRB+EwbOIqZP7KoCCT+MUk334oZ2v+qIoJ7FZsKyuabnykBgk/bYZx0e
	ZZe1xq0v7aNqysO5sGW4/tI+PhyjNPaQfrp58ZaJTsv5m7LqF/cAyFZpc/TSZ72987eL7Df0UDTPS
	C7dSfF7VyhBedUIUKneaLctM3GKrUICg59j2ERfj6lwT9CdzGGBEOioAdRcisJFuVtx6ah0qGoPEh
	iLRHGeKCDczdayh+tHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxWn-0000000B644-2tJo;
	Thu, 20 Aug 2026 07:49:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxWm-0000000B63w-2oBm
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 07:49:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5CAC60AA9;
	Thu, 20 Aug 2026 07:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17B31F000E9;
	Thu, 20 Aug 2026 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787212171;
	bh=9XO9eowd/dV84ZAx7gyqi5XboHHy2Bt3ikU1Np6lzWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=oUzV5NUTVMcg+oCn9sknOgXRHHQIy/jQzVjA0KpZowQtICOExz9e60beuCG/g8H6A
	 FVFRZBDWtsY+YyAlTWPSQ9wq6y+MFSi5SEPhSxl260bfErJwlFACSXiL4ujByDBULd
	 7NcbJ9oi3YAXx+8t9wpC368F83gbmWezhTq1De5gPZ+bcVyXwlrIC1frGpwXrdneJv
	 d+rcUGAuE/1F2vCEaW9iAczW5zX9nLzZhSteiQznj2Fm992DvaKHjYME30Xgbt6nvA
	 S8PVPUdKAkam19RBt7hkLOT8dpQnFv0Xyz/f/2kZ4KXbNTr3rUnfJZ3J2QuSdH6+o7
	 Bd7V+RJ6+2WKA==
From: Thomas Gleixner <tglx@kernel.org>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Haofeng
 Li <lihaofeng@kylinos.cn>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Radu
 Rendec <radu@rendec.net>
Subject: Re: [PATCH 00/16] irqchip: harden initialization error paths
In-Reply-To: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
Date: Thu, 20 Aug 2026 09:49:27 +0200
Message-ID: <87y0e1i648.ffs@fw13>
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

On Tue, Jul 14 2026 at 20:23, Haofeng Li wrote:
> An audit of irqchip initialization and allocation error paths found a
> collection of resource leaks and lifetime issues across several drivers.

A lot of these "fixes" are purely cosmetic and create a false sense of
correctness because if the initialization of the root interrupt
controller of a system fails then machine won't boot at all.

So instead of adding tons of cleanups we rather go and analyze which
controllers are actually root controllers and therefore essential for
the machine to boot. For those the only valid error handling is:

__probe(....)
{
        all setup magic
}

probe(....)
{
	if (__probe(..._))
	    panic("Failed to initialize root interrupt controller");
}

That is the proper hardening and allows to remove a boatload of
pointless cleanups.

Where cleanups actually matter are for secondary interrupt controllers
which are not essential for the machine to get up and "running",
especially those which can be built as modules.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
