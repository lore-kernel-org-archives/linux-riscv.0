Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E9CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 22:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N42WjI12+0j3XrvhcTgJDIq8br66RscTJyCk9kD4q6I=; b=LK1hbDH1OKBlGi
	+COdtVus14z/N8qxusjDDVNy8LIOS0ztvQ6aGwkeA/wJ/t9xvIANaUL2O9Ha0mQPF5K575COnlGE4
	7AjA9W9kZvMKvrLAYzAZmTgPgInp/iTa1A+xTVL0Ca8Wix5jDLiMJIrdwPlibnm46td4GJ5VIlqsH
	8QyztzoyQv1y7kuoiAWN0VcaSWEZSn+grp4sMm00ymz3+9m15DnQAidHFJMfIIq9sMNCI7Rc1EBZ2
	T3UY+L+CGsT5QAYNlv9tiTPE54KrDCELFlYPzYD9qYt2Y6iptL+VLO3kjKvNMtPctQ1sOBLLNKWAr
	uqGg7TRCUjBtJRyRGuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUaP-0000000FQDF-1EAJ;
	Sun, 04 Oct 2026 22:21:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUaO-0000000FQD3-1ST5
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 22:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5A1743E59;
	Sun,  4 Oct 2026 22:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C5F1F00893;
	Sun,  4 Oct 2026 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791152495;
	bh=PwXClfBVN3IVDB6KiSTGz0B78VZtRvypodlscWOMyoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GOKvSeV4+ez5C5LqQqZBBUXHnqUAIdUc0ks/jjIHoFYbSXbkYD6+Tkj0laM1b8xiA
	 pjAIGP61HfV3JiV8NvaiWfmdoEgkGvduBWKzW8gRX1gqIh7JD9awF1gv825TDrfBEc
	 5Am6iVG4aMqlHKC9oO/WrQPvyi9DewMNluLR7D0u0NM7YIGlzokzmlke0GcOp+8/n5
	 lfBlA+qx/xEBKzfCuqxVac7wvlQOvgmk3PGxpE0qug5OsGzdxRLp2bKLrGEYGsrJCD
	 rX57pSc+JaedkViuyNB4PAVwh+SClTd2bQjooV3pdQkgGZqEQOWHlNpel6PO4VRGvs
	 QSypB1jZYeWbg==
Date: Sun, 4 Oct 2026 16:21:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
In-Reply-To: <20260911194233.3379532-1-aurelien@aurel32.net>
Message-ID: <6ce0769c-4683-0e62-e3b2-56b3300a45a2@kernel.org>
References: <20260911194233.3379532-1-aurelien@aurel32.net>
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

On Fri, 11 Sep 2026, Aurelien Jarno wrote:

> RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
> Replace GENMASK(12, 0) by GENMASK(11, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
