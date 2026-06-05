Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D3CD6E7E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YWkpWAhJSyZguHsoBgQPUtdUS2gzdxIRZiw44ZpOYo=; b=pZjOntAjjEwN5f
	a9R/KLN5ZEuYPSm47G77yaCYNkbPaFJQ/+gN5ER5bkpgnfc7AI1UMZjsHlZYTTEh1Dgf8YAxNS4S/
	07Op4S8AvPvliDuZtLtSDcBk5spoKLZlc1GfByS1P0/S1e9xfu3cZ8BFc9mcE29NooCOX5Vizc5dH
	hEQAo1WVjJrAdXDr1jGXeGH/hzpu/qrMXLRMqNEQaPIwXFvGK8MkgCgjKwAF/laE0W8kc2DcNJZ5N
	gLGJ6LWIvJf1Gr3u5cAyzo9y7XdSxPagztB5zt5NxxxT/DkcqcDAOS0XvTNF3CUBc9ams4COTRRiI
	HuM9+RQG2hxF0Z7Y3rAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVacQ-000000018Le-2E1U;
	Fri, 05 Jun 2026 19:54:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVacP-000000018LX-2iPk
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 19:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B99C4600AE;
	Fri,  5 Jun 2026 19:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E8C1F00893;
	Fri,  5 Jun 2026 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689252;
	bh=p/pcvISMdGSURalgNXTgQExEqZketLGMU2kKzQ/4vPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZzZCVn5kRIZSOzAFvVFc7wpjuGPGTJANdMjAMquYGdsX4iP1uzOZ5LDBCxW5pKt5T
	 h/3J1We9d9O3h+GXBFhP4dpim17XAvcjZYbIKD4HjhbNbFpNDGOb/1SyewVOcVJ8xe
	 gKsnt8cJJw3ZxiEPXW6WRmnFgrss5y5u1+H55PV5YM6pgpWGwXUOFiNFPsbCM2oe6O
	 4c+WfH0Bw+VbTAU+XC8xeEb6i8DWeE1FyMzgfa47J16BXe8oXgrpjeijbXfKpM3719
	 S/a83dTOMaNVseYpwYHJVvQWRAWzQGCaMZK0U7Kj5t5nHzc6Pl8d5xaENwwO3sxg0k
	 XKAKaUHVYb3Qg==
Date: Fri, 5 Jun 2026 12:54:11 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <aiMpY6tjGhv/cRWI@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-2-joel@jms.id.au>
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

On Fri, Jun 05, 2026 at 12:09:47AM +0930, Joel Stanley wrote:
> Add compatible for APLIC in Tenstorrent Atlantis SoC.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
