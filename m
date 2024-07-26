Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A5EC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEDZoxJvwrC+WC9OrYXT8c77zlf34OgyDMjcGEuOwIU=; b=lz61iD/56KLMqt
	bYTzSOztk+68gqmoYA+VKDnGKMiy0XfEbcNfABe1UKWbirZ8zgGCEA0LFz0O5sfDo3SGN5m1Z9/fc
	K8Cn+Ec5yll6ub3oJGlmFpwZ+tIXskB4TT8mK6Sfe0oYuSn7Fj5wwBDjytlozk1pp93HVKBTSVa//
	WQE1lFo1vbWb/NLVHoTPoSqTJqdicl7rMoqmRKhh/chXMJb6DAc/vYW6A7wLtEiuFXwGthUM1nSVD
	pLptEdnUp4UqYLnMGqp2rgKS13V2ST9UL3A9lnuFw4Fb23emrnHEPQBd9ioXIzLrkOvnquJy8qwXb
	Fi5jGWXMG+D5UVUNdLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXIsk-00000003fh7-2YG1;
	Fri, 26 Jul 2024 11:13:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXIsg-00000003ffd-0ON8
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 11:13:04 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1721992375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nMKUTmWMgsjXlZUYFwK7TKXtNvLkxxn4s85M2l2ojs0=;
	b=3T9mXjyiiEapMkP9EVmjGW6z6WbDN5C17UNW9VfxzWj5C/YMt5aukSTfD8OjYGkHpXda9c
	Za089FAa1weog1mKL1nEX+0f3gjtWPG6xR+EA01yQO/qdbEUEbTALMnTMpAhJG6WRN3gik
	jO7dS4hQVGO7mdLe32LXIWNEXdtzrrCTUJGGc0aPzKlSbcxJGsDwK8OCodTnx5FJphV9Ji
	7cMvV24DIdKczR0Op7FyjfgOTXvu83/vwb75D7bs0M+rRVByyIqn0JYE9IfKneu/OEmtER
	AbnmaXHJiseyywvqCnXf25ukANz3pyRD7dX2vR2/9a819EtRgUPDiRKyPIpxeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1721992375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nMKUTmWMgsjXlZUYFwK7TKXtNvLkxxn4s85M2l2ojs0=;
	b=zBwsZydHm0LtDuwjTPm1IU40yoQ2sJSTCwq+2F74H2R3RtcTYZCjFBonTKObdHohjfidVX
	4RAnxiEva4K95cCw==
To: patchwork-bot+linux-riscv@kernel.org, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-intc: Remove asmlinkage
In-Reply-To: <172191363918.6240.8119408289460257884.git-patchwork-notify@kernel.org>
References: <20240614151955.1949-1-jszhang@kernel.org>
 <172191363918.6240.8119408289460257884.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jul 2024 13:12:54 +0200
Message-ID: <874j8cwgnd.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_041302_293220_CE2963A5 
X-CRM114-Status: UNSURE (   4.27  )
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

On Thu, Jul 25 2024 at 13:20, patchwork-bot wrote:
> This patch was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:

It's already upstream: 722c9389c7fa ("irqchip/riscv-intc: Remove asmlinkage")


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
