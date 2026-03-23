Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E78CF532C1
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 00:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkaWzkwCTL4Tnqsx9d/29CYbAJgZigSll1K2rJBM/Mw=; b=VOwU2ekFDh+l2A
	jhCgyvDcxQlpzbu5MDxEikVZ0xUtgILDsIqb4TZ3pgQch8t487ioFeYTn9Z3JrS3Vy1Xjd8UXKFzQ
	cWoZef8ubZiuh7eQFkt9RazXt53/7bg/FsWw+58O2EcXrek9WiNfU9obkieAj+0z/QogqlBpHsgcn
	FFdrdptq/eMrpJgIlUL/atHT9uPGK939cto5PZSFWQNUk5ApLzGcM+Cuq3Y76p617liJCcgWOWvc+
	DWIfEytEFuREcAaA0G5Jiz8F0vrsyzspr9S7r2M7uFzlNIO2yjPku+FxpH2HDbcewgDwzcZZEQN16
	ioBQ7DdYMwVQ0F92wqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pBj-00000000CGU-3tBn;
	Tue, 24 Mar 2026 00:00:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pBh-00000000CFt-0Fhc
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 00:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6914743E64;
	Tue, 24 Mar 2026 00:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1770C4CEF7;
	Mon, 23 Mar 2026 23:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774310400;
	bh=qJyAYAiz0wfqqJjBKxAwZyVPhPLmb0z+stL3H8W7gLA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WktLwMVCRwT//RKfGaOIGie0yC1L+3gfO2J4MiKAqc1VsIbigE8P9yyIgik6Gil4/
	 vkxEmDTQvVABhmOuqnVEEBaWE+8fjg0CDeP2TMP97kNnJQTe1peOZUakyEKB6KdfoV
	 3mWyIjfkhNfYczAKpzAix2J/Dcb3+mthcRIPVE2qB62TILoLSB0rJneC8d3NXPTHTH
	 Nh2SZboIQNDovGcDkpflLA2gv0PS366BFGi34P2vo4ubM8JDtRkB5Spz1L3j63bffU
	 byBhr7SB9hO9jum6QgyLJQiQBlQusp+sLW8iWzfg+9R/1L+LhdceZove1cSf7Py2hj
	 qEQhk8f0q8kwA==
Date: Mon, 23 Mar 2026 17:59:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: make runtime const not usable by modules
In-Reply-To: <20260221023731.3476-1-jszhang@kernel.org>
Message-ID: <94f9aad7-b31b-da59-46bc-0aed11941c3f@kernel.org>
References: <20260221023731.3476-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_170001_145882_85FB620E 
X-CRM114-Status: UNSURE (   8.48  )
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

On Sat, 21 Feb 2026, Jisheng Zhang wrote:

> Similar as commit 284922f4c563 ("x86: uaccess: don't use runtime-const
> rewriting in modules") does, make riscv's runtime const not usable by
> modules too, to "make sure this doesn't get forgotten the next time
> somebody wants to do runtime constant optimizations". The reason is
> well explained in the above commit: "The runtime-const infrastructure
> was never designed to handle the modular case, because the constant
> fixup is only done at boot time for core kernel code."
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
