Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59460CA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTb+6+t7ZUjQSBY/IQy/HmH/DgcRr0uvcr8FI+bnPGo=; b=uqkAAF0pz4Ob4v
	eS3lJvkMDbj8n9/f+9wloFE8Wjnq0J096SMOaOUisawbHF5SiQn2ndorC4DbXpF3HrOncA4Z4D8gt
	goeQRz26b/Pi7y2Vh/wTLVqi6lGpYPlH/8jy7IEZ1GOGxQ/UK4T3XBy6ZYAsrrX04mvUGeky8o29h
	EBFCG3lnjAvBzsK/MHPYGYNrblExMJaxrtX4L6cUAAzlxnEu1SZRVaOlNTQ8GRlEtwbOxwWGdJhyK
	syz7wHVFpTZ+t4J+5wERL2xZ0r3KH/Ujjk5HZu21ke1Sxu0kk1MIpjGDiN8XxmbztNugikL0oAVqo
	rmPlX6AJS9MSR3kVepOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF8T-0000000CdZu-0AJO;
	Sat, 13 Sep 2025 01:33:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF8Q-0000000CdZ7-3Hwp
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07D0B436F9;
	Sat, 13 Sep 2025 01:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5035AC4CEF1;
	Sat, 13 Sep 2025 01:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757727181;
	bh=IqZUTYDCDExdCes1X4lQ7ydsqNneBWR5IpoqupMGbNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qpu05onlK2q/MU9rBbJIndls8nGyLETDwt1GRtvkHWPA2IgG/K+06vGIdfcsg+Q9J
	 ubXJusqfM6/7z0Z3qKmDNCLUndy+7cBZzH6Ku7a20A+GXMw4Q3vG2gmyAmH8YYP9bV
	 dDrkwV/fZoRy2nr2PNfMa2gMAVhepO+yfoV/9XH6TK3EuvySQU1d3NPRTTbZBvk0bo
	 hLywNNUNa44nKb5TBfZWxOXgtcARoHc6y4JzHRB6uR3/vYVQN4jMDpdULm5krbsBOS
	 r4L14Cj+8cNLtMEVeA5XyGZx5hBdrq7Qp4fmsBRP0EceBRob//tf2fDwDNSz05bGsT
	 ZJ/Zo/uiIMEEA==
Date: Fri, 12 Sep 2025 19:33:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thomas Huth <thuth@redhat.com>
cc: Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
 in header files
In-Reply-To: <d1fe7fdf-b3da-4c53-8a5a-a87acd38d525@redhat.com>
Message-ID: <d34c4b47-4acd-fd68-4cdf-b9cfaf022a32@kernel.org>
References: <20250606070952.498274-1-thuth@redhat.com> <175450055499.2863135.2738368758577957268.git-patchwork-notify@kernel.org> <d1fe7fdf-b3da-4c53-8a5a-a87acd38d525@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_183302_847154_9F8372BB 
X-CRM114-Status: GOOD (  11.06  )
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

Hi Thomas,

On Mon, 18 Aug 2025, Thomas Huth wrote:

> On 06/08/2025 19.15, patchwork-bot+linux-riscv@kernel.org wrote:
> > Hello:
> > 
> > This series was applied to riscv/linux.git (for-next)
> > by Alexandre Ghiti <alexghiti@rivosinc.com>:
> 
>  Hi Alexandre,
> 
> I can't see the patches in the for-next branch ... have they been dropped
> again? Was there an issue with the patches?

No issues with your patches; we just had some trouble getting the 
arch/riscv PR merged during the last merge window.  I've queued both of 
your patches for v6.18.  They should show up in for-next in a few days.  
Thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
