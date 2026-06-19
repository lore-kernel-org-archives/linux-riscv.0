Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF79CCD98F2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HjfNnJTlYhuilQ87RZAZatIIfjjl39M3sTWTnx3H/4=; b=heeBVSt2K8d/Uk
	RS0NuSyqAKBmgZj1eae3hiwGGpaVCuwM+9QFfgyg01FoyfYhPhAToFsF1WfeDBffuQ1oxL3rTRZvj
	sZGuq9/akuTyrCXHjh8YXX0GOKb37pPQaylmApfS3FUHWvEq2mJZQoXSr3o6wLasyrvMxEwil0Mlv
	0yHOAKkf3rZjWXZ+zypUUbKWNx8jgexnSIo76z9YMBWYfkSsIw0vaEDOSRGq7Gd33HVQy6uzkyuKW
	FyD6YokuoewC+FeEUqS2uEvT0L8/yHrB3A3ADMPwpAhJ3GPsVGEENawwkUj/QkRbPP/L+315Jtnji
	iu1oLTl8vinkdoqu06+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWNg-00000002HIm-1cR4;
	Fri, 19 Jun 2026 10:23:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWNe-00000002HGT-069Y
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 10:23:23 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781864598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrsf8owtapUkfLXJzhbCAFYvgvi+dIm3xVjkUFTm8Ok=;
	b=keA+AnuF+GlAEYrjJpAD9nUSRs+l1tYA1zx4c0Cd+ACVTFmc6QdGxqgjpWVys2m0a0J1dt
	oL3xSXwXD05xv7TgcZFlSFkebllXnYUAG+jwIYqajbwy6JbhkQDyHugNKW51xsde92ZB/2
	XMqO6PamfPz9ZfoGJ5G7BsSfGdOGVETMGbSiaa5ywhrfpmlk+6FP2cwSoREH6bDnio6FJ2
	t+mBXKxGlJD+FhNJUw0l4jDG1bFjqEbGfsyZgPpRVup0JOYf+7jNRpIEp0s+YM0eKHUvjY
	Lo9fMBWOi1Ac6Kgbs7D3+U+jxHOS8YK7jkQbtH/XKnazvokSyQZH7R/fKPUKzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781864598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrsf8owtapUkfLXJzhbCAFYvgvi+dIm3xVjkUFTm8Ok=;
	b=EYS6e85xnaKkdLjnvhdo7aNIEMpTpJBkuNH6WwON9A4TEIyJ6HJsk77fEp7HkBgZfAMgYd
	ILS+gi2H6KjLn0BQ==
To: Bastian Blank <waldi@debian.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add build salt to the vDSO
In-Reply-To: <ajQY7n0an0YwQ--j@steamhammer.waldi.eu.org>
References: <ajQY7n0an0YwQ--j@steamhammer.waldi.eu.org>
Date: Fri, 19 Jun 2026 12:23:17 +0200
Message-ID: <87v7be4yne.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_032322_209118_96D9EF3F 
X-CRM114-Status: UNSURE (   4.53  )
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

Bastian Blank <waldi@debian.org> writes:
> The vDSO needs to have a unique build id in a similar manner
> to the kernel and modules. Use the build salt macro.
>
> Signed-off-by: Bastian Blank <waldi@debian.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
