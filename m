Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61408C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 08:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42A3610C7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 08:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D42A3610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2bfkgUdg5QZb8FVBHNV9IriN5Q41WZcEej5zrpQwVU=; b=p18uRTYgwO7RSG
	Gu6K+BerposSG/AwGyXbYkyv+jqN74NGjPdeiH1gaP/bnxzM8yny0gskwM9wlsQHU8zRtQ60l6avS
	qxmCIL1zcsy3hRHcpBM8mJ/QjsqCDoDTQeF3gkhhng8LP1mqxLWOW1Pst0Ej6BeA0K6cbBaUQS1yx
	YWd8/W6HRyLT40Fx9fkaJMT+C4qQFtubMc69HIBJ3t1Ew0jupKroA/Q5oxywPwEXZRmZ37BqUby71
	qtLrUBSdaIKPmwhbfkPr3NJZXtfom6HOV04OGECEO5tLtQmEK//mxuyGYiXci6yWN10Iq0sJTh+dq
	fxSgfLB3BvcAqAPU9zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdrZ-004FVd-8x; Wed, 27 Oct 2021 08:00:45 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdrW-004FU4-72
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 08:00:44 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HfLhx2vHqz1qwdr;
 Wed, 27 Oct 2021 10:00:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HfLhx1z0dz1qqkG;
 Wed, 27 Oct 2021 10:00:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id lnOeicQQ8Db8; Wed, 27 Oct 2021 10:00:32 +0200 (CEST)
X-Auth-Info: x+8QjqTD1V1ACKg/WDk8SUlDVnu/BmJKfvIHSrNqoqQSSJ4hj/hMiZjB0S6pDmtP
Received: from igel.home (ppp-46-244-163-205.dynamic.mnet-online.de
 [46.244.163.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 27 Oct 2021 10:00:32 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 901CE2C0C9B; Wed, 27 Oct 2021 10:00:31 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alex@ghiti.fr,  Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,  kernel-team@android.com,  Palmer Dabbelt
 <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
References: <20211026212847.43108-1-palmer@dabbelt.com>
X-Yow: My ELBOW is a remote FRENCH OUTPOST!!
Date: Wed, 27 Oct 2021 10:00:31 +0200
In-Reply-To: <20211026212847.43108-1-palmer@dabbelt.com> (Palmer Dabbelt's
 message of "Tue, 26 Oct 2021 14:28:47 -0700")
Message-ID: <87mtmuaodc.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_010042_456650_14B973FB 
X-CRM114-Status: GOOD (  12.54  )
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

On Okt 26 2021, Palmer Dabbelt wrote:

> +config RELOCATABLE
> +	bool "Build a relocatable kernel"
> +	depends on MMU && 64BIT && !XIP_KERNEL
> +	help
> +          This builds a kernel as a Position Independent Executable (PIE),
> +          which retains all relocation metadata required to relocate the
> +          kernel binary at runtime to a different virtual address than the
> +          address it was linked at.
> +          Since RISCV uses the RELA relocation format, this requires a
> +          relocation pass at runtime even if the kernel is loaded at the
> +          same address it was linked at.

When in doubt, do what?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
