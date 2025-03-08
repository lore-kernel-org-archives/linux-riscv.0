Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A988C282EC
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Mar 2025 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqmWg9IeX2O1rwX5e//KZS3MVV8zQJR5AyOzy5rvmrI=; b=m82braAu7E9EDP
	0GGTtdS/PFhnI/wjbwMF6GlQnBskX/hHIRhED67YDZgM/dIXzInUNJho1muwbYTvgMwkuIMu39IHY
	SKmf0ndvjesCy7+L7UfBK75SzaMgqr/j8W7AxTE5BBw/ft60slaH4S4bSR9e8rAWexWlVsUCX+PqX
	9MUqDm1JNu+nVtQXDQOlSCzFT4mJlNh+GiEimCNZWZiSdob7/svZymcMKR2lIcdT4MeGGbBXEYq2j
	MoMS+OAO7VWY/ekv3pdmJnLGKItc7P7c7qdpNSAlDJNaamGvazYfKXIzCgrwTpTqgMkbI7LBC3EAj
	l9irE0cKvpcarSP/aM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtY1-0000000Gcnz-1Kjm;
	Sat, 08 Mar 2025 12:44:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtQr-0000000Gbxv-0ZBa
	for linux-riscv@lists.infradead.org;
	Sat, 08 Mar 2025 12:37:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741437451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o8abf0OObLh7cZ3WWFsVYwo4EpsS2nDZ7Ej/A+vuDoM=;
	b=YhsDrL/295LV4DMGJmyeG5m59Er0pBPxblaWRcnwCDK/y5yjozDd7DoDlxC4bSiVpPZsnB
	GZoA4+vyRWmZmNZaXWQFwnhovlRyTLOo574r4Z+foLcPKukYepMMYXLQpBFTr1m809WX1i
	d3XL3e4Jr1WtoJnuzrLWExFXZExHJ4wwoZigcjXm0pu8Jyb+TYq4EGyp7Rx6YkW27BjQ3w
	OSPvivQ5uLtI6Be5KZxDwAny2jbZVJn6SLPPCdccoyVef3ReL92MkoEyvPJNYU9R3RpSZb
	5CykgaB95PHj+uYCIDlz5HvjXkqH1lnXSZ5RdL5ZLjSH2zzPDaRPicgAz8OyIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741437451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o8abf0OObLh7cZ3WWFsVYwo4EpsS2nDZ7Ej/A+vuDoM=;
	b=NmGNVQkPtxoG8GIZFsUt/CCutMvDnEhlPGrPQZUlA1eDT4l0qZQMhgwHpBWHBvXMWmgDRT
	2OQzka/4GKlsjLBw==
To: Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Peter
 Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
In-Reply-To: <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
Date: Sat, 08 Mar 2025 13:37:30 +0100
Message-ID: <87senn3dh1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_043733_317321_48C337D7 
X-CRM114-Status: UNSURE (   4.83  )
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

On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
> Architectures using the generic entry code can be optimized by having
> syscall_exit_to_user_mode inlined.

That's a pretty handwavy claim. What's the actual benefit in numbers?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
