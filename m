Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B24C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gAaIota5VN3Xbht2s5WdTkuKaFNZSht7wdd6l57Png=; b=bOosLF73nJhGrAEN4ct66Scf3V
	cbUxFXG4Uxxvv3kViv5IcWUaFucoOenrccZF28KDB7ciGyjvSYcAlztRk9e1FRv+k+eMaMkyOou3Q
	imx0oJElgCxbe6lHSRQpEnir/XG6j3RtceXAQFhWqSwoJZANArVmlIk5J2ZLT2igJN1nyFgovJMME
	6Q1B541gZZVrcIpNyeEP68aXpnCqn9MkWW5UuRNp91vKIDaq5MvNAJ4CV17YRMvUmxpC/yxE22rMk
	OWgFqgJ2uIn3+xSt0tIeagxEnPrNNBYdtTott+7TUbO64YM3hXO8Aq9pZvGAYUcGaiNnlxF47Uxbj
	IbXb7JyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9KS-00000006vzo-33tB;
	Fri, 07 Aug 2026 01:24:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9KR-00000006vzi-1MHd
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 01:24:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7CB3414C6;
	Fri,  7 Aug 2026 01:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260451F000E9;
	Fri,  7 Aug 2026 01:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786065894;
	bh=w8dZVwSWnTiOsh25aqMgrphNVrTFl6QFD7i9CH3J/R0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ILQ1qpuU7oTm836U24DfU9nCs1c2d43bkg3ZDT3l1Xgymm7sM17WpPouA1epbxKo0
	 WiwTx838sAlVnW1QSGR/tU41rSpFIk70oxZldNS1yQpNh4gwsm4U9nsvO4R5Q3PkjC
	 FRrCRcEig8kGqxRsREU6mlvSNiZ7ttvnwzqFfFhjmaqxRQiWUZ+dfosqzpQ4FsRqNF
	 XndAGh/wi4km5OCGmdtOXGucRmStu282PdShUHneGC0fOYNg8Z9Pf6+4S4hnRK5ftl
	 n7si6kZ1X4fSpLf74ztGVjKmmJc4dQmcNyU5zVNh04y04+ca4WPFxuhOPWVxSMjbgo
	 yrBvWcM81xZMg==
Date: Thu, 6 Aug 2026 19:24:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 0/3] riscv: alternative: Statically compute alternative
 section boundaries and patch compat vDSO
In-Reply-To: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
Message-ID: <ba779b46-156b-61ae-ea35-6f575f6428a9@kernel.org>
References: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1803050006-1786065894=:31658"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1803050006-1786065894=:31658
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 30 Jun 2026, Thomas Weißschuh wrote:

> Currently the alternative sections are extracted from the vDSO
> binaries at runtime. This has runtime overhead and also doesn't
> work for the compat vDSO.
> 
> Extract the offsets of the alternative section during the build with the
> existing symbol extraction machinery and use those.
> 
> Also add support for the compat vDSO.
> 
> Link: https://lore.kernel.org/lkml/cover.1781876501.git.namcao@linutronix.de/
> Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>

Thanks, queued for v7.3.


- Paul
--8323329-1803050006-1786065894=:31658
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1803050006-1786065894=:31658--

