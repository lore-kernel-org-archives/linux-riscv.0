Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C77CDE009
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tn8cmKVU3uG2vDg2lth7l5UKAfxzyPP8/dFWRf7gtA0=; b=vUUa0L318Mi7ei
	MXnzV5RVS+ahRvYUfQPReXeGvBFthqTMNH5B6aLzYtFe0tD6+uu0KZxZt8yAOQMsxdIsWVZ7SpjRi
	HhcNOepZtU36IjC6YDvu+zvEeNCbelIR36MhzuGkCOdxm1bVxwkEIc+kZilMklJhQiyPM6fVfNlPe
	DyiiFqoMuIGaw/lUksciDDKfK/R2CrL4Ofv8tCQfhLxX6dIPS6jqLIXHiB4KRgGy+rZpDA4kFXRrs
	uVPkKbN2jMuD4qJsI2bHBVLftPcBliIWTcoMXItGpweceE+cMmooDsI+QAoxfsuiA/CeA1yB8a4mE
	//7ReWwGMukinuKd/7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolU-00000009g3U-1gq2;
	Thu, 25 Jun 2026 18:25:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolS-00000009g25-39Dg
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 18:25:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CD5E4035E;
	Thu, 25 Jun 2026 18:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAFD1F000E9;
	Thu, 25 Jun 2026 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411925;
	bh=kJr+JtBeGbiDwHuiluaC01xNoBz1bSums0WQHD6vIm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=N8wTS1wSHsEWznGGhxqEk7Os9+R7+MFAnFCV+GQaCGQDLhEw1qXghnVbOu56W/yFg
	 yY0K0L/9/pjhhT6lx5kYac/jFFCjNu+GhcZJfwXWcdNFBJ0osG0P6diceyhfOsmdIB
	 J0ARiMVGdGpS/H4hhiOhBBBkvVc8Kkid6lDBvLI+RyTwtKT/zExxg0/D8dAriJv6SL
	 TiobshDxbmeugDQsXJGhBECELojRDp7w3BHv9eKkRof0Z4ZQMp5wcnOGjJClyOhkuG
	 83yEvHfgl4flVbRY4Bzhk+bbEUJ7c3jDQrM7tMsTuHJEUBWRfoEfXBQGN+F2jfwJIp
	 TfVeEbz/eiTpQ==
Date: Thu, 25 Jun 2026 12:25:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Vivian Wang <wangruikang@iscas.ac.cn>, Atish Patra <atishp@rivosinc.com>, 
    Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: use secs_to_jiffies in __cpu_up
In-Reply-To: <20260611232537.467398-3-thorsten.blum@linux.dev>
Message-ID: <58936e85-1924-bbc8-6ee0-04d89be5bae0@kernel.org>
References: <20260611232537.467398-3-thorsten.blum@linux.dev>
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

On Fri, 12 Jun 2026, Thorsten Blum wrote:

> Use secs_to_jiffies() to simplify the code. Drop the redundant zero
> initialization while at it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
