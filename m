Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2220ECD8C88
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssPyswOzvsNII+li7K+XpNmql4E9aOyPBwtBHJF4aVs=; b=Xu1pBo+wJISW3F
	0DaQqdzOj5d9pcOCXbH8qvS4xZhNdVMck1y89BJE5qU3STT/Ski6//qQTBYAKtyNvvn/wn0eGF1Po
	uPTG59ZiLODE/cMQ9sE02z84jHTR5jyR4cBH7dnHujSSZ0piYp+V76D1Qwkr0SgtBEDPujV1BNQM0
	aLoCip+x46pi75d/q/8dtewt62DNllTVrQLpGlcABKqEMLjOdVu7iQfWu+PUOL4N5ysba8Z3MrlEj
	T1y2vvmsMQoh4uezTcTn2H0CHbGSc9yqv/x1XorSBDepRllfjN2h4BBG1DEO8MHa1WtUEhVC9h9SK
	hTk5S458cnUzP/DMW4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7cT-000000025VG-1T8K;
	Sun, 07 Jun 2026 07:08:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7cS-000000025VA-1A2d
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 07:08:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55D9B60008;
	Sun,  7 Jun 2026 07:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D4C1F00893;
	Sun,  7 Jun 2026 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780816107;
	bh=7Lk/BJ+FNHkTV0i1JhIvCK15HQJofq8L46ZVpVscuzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=G71QmPBVtxjory1rgGBFynSY3lXDXHNwLYPr6drfxp2qwYkdmreGaEE3sQ4Ow8bZA
	 kIb3FN2OlTZ8R5dtOBhWRuLfAp/oPky7xTlsg2iR6CfcGa5a1ybDCGR7AmoAuYCBPT
	 lPOs/eoBanRXLep8H61ooMHpZRJtRpXxcuYcuv6PUgRfszBYAIZQ3tOaJAu91Z1YWd
	 xChW5y/Kioveq6bFSzpcvq095++AwzsaRpVplc2fT30cc2ey4yFJlHsL1S/vjmORYC
	 BkxEDRxSU+JvpbdszvTTE9MZlAALrqfPaj+1lFPYCSIc9ftPF4b+Jpsnx1KNfvVwfl
	 owI1nypezJhyw==
Date: Sun, 7 Jun 2026 01:08:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>, Breno Leitao <leitao@debian.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Pasha Tatashin <pasha.tatashin@soleen.com>, 
    Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, 
    Song Shuai <songshuaishuai@tinylab.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: kexec: use min to simplify
 riscv_kexec_elf_load
In-Reply-To: <ah_0fOD8mNWTKz9f@gmail.com>
Message-ID: <b5de86e2-68a4-33b5-d1a3-62ca52f9a5cd@kernel.org>
References: <20260602224725.1088385-3-thorsten.blum@linux.dev> <ah_0fOD8mNWTKz9f@gmail.com>
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

On Wed, 3 Jun 2026, Breno Leitao wrote:

> On Wed, Jun 03, 2026 at 12:47:22AM +0200, Thorsten Blum wrote:
> > Use min() to replace the open-coded version and assign the result
> > directly to kbuf.bufsz. Drop the now-unused local size variable.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks, queued for v7.2.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
