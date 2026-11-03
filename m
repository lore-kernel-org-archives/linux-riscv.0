Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1F4606A32E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DqPm8yMZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JbCHADdc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TZQcwYgH;
	dkim=neutral header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BkGYvZPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ncV7sZZqncbLvswc8eg6DCuzqYS8mnxNvbNYsIkwUH0=; b=DqPm8yMZXJv5fHr/eiv2j1qu2y
	uXRQ6AQ/jixntj+f+jcNmYU7tTqb+1+IRgUS3ULbv/xQn2PRVKuVGJjAagS33GxdqZavDsRq8bc/0
	WfiKk/xu0ldaQ9107iwM+vXVH0dvLHjquqgMhexbSe1EgUToXOoKWa6dp5Fi3MOGUdCP7aqIVg1qy
	zkZHxEkMFDbxJnerBenqf2FbgGigu+a6mluLi7XLiFm+XJHtWBAhwOjPcBj7oCt35dQUdpxNYtAZs
	P/wMfq4QD9I4N1yKBsGMRmcWS3+oMxL28JrTS5VeFQi4JhvKyZnXiF2sm169/IhI3hwbWD4ibMokf
	z6HldSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAN6-00000001fRC-3ons;
	Tue, 03 Nov 2026 09:00:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAN2-00000001fQ8-1SNW
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Nov 2026 09:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QD+CkWG5oyxTZO6V2pW1MZiGJv6VerTZJtv13Pu63rQ=; b=JbCHADdcBzYTlp6TAZM7tdeCQF
	2KWZJLhCoj+CmuilAmYTkrrPoxeY4A2kRBrub0RLF8KbeTVs3InlpSBpKL4Y2DyeKLx3zf9vVKGj7
	yElml/lrqVyKdzkVaiQZutHiE2b41Cjbujwjc1QdP/pEjNK0FadvPECv7Xdpt922M1/rvZ7W/dDuf
	WDkZwgeEqUVrb5BZyImxzZWRHoE+jeulhYsAdbnNbws3CQ/U1Rlc4xHSpSIwW1HyIo4+aO5RQGNFY
	kM5YnhZxNbkOTtwtjs4AwmrhEwNHv8fcInTO8nIXcNjzR0rKgeSCSntwIVmDP6IamikL4618akSp/
	tydmFK/w==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMz-00000000DcW-276Q
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:55 +0000
Date: Tue, 3 Nov 2026 09:59:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793696391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QD+CkWG5oyxTZO6V2pW1MZiGJv6VerTZJtv13Pu63rQ=;
	b=TZQcwYgHEkQKzBdxCYgoF4NlP5tocqsMMzriVFP/C1WqBZa09mv2OB2oqDSLHTxPBMi56Z
	xx9RC2sOxOvZZSB4ZGllg+wsv4OXMdYS/+VlZKuPXwAaLh3FZ3j8s0rKXV9sp9qYypwgjd
	vjhVej7+5lui3ST4QgKreOQJE8m53gvuNdZR/+OogXkO4p1wJShVaMIqzRlCCXOYe+pENX
	A41rGs9i7z2HuLPiMK8mvMrTjZLIIZsWw1XDlCq3MJduJg23yNiKC8twgnpIePHoKQe12N
	yZpcBoh3XX/1DZmq/iyUy4UxgODCgMvbhy3dVFVwJVMmYRKpW+PLCnbcDGN+/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793696391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QD+CkWG5oyxTZO6V2pW1MZiGJv6VerTZJtv13Pu63rQ=;
	b=BkGYvZPsVd4OcDfywug6gYGoeGQK32t2wF3ew8Ol7bpFcJo40b4EnCyNA4YhhGdid6FuuP
	iS5opXFdm3oDP4CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ
 work
Message-ID: <20261103085949.HPHNwwhb@linutronix.de>
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_085953_670899_D753043A 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 08:04:33 [+0000], Troy Mitchell wrote:
> Without a real broadcast device, the tick code falls back to the hrtimer
> based broadcast, which keeps one CPU's local timer running. Once the SoC
> timer is registered it replaces the hrtimer broadcast, and every CPU may
> stop its local timer in idle.
> 
> On K3 the SoC timer interrupt goes through APLIC in MSI mode to IMSIC.
> When the CPU owning it goes offline, the interrupt is moved to a CPU
> that may already be idle with its local timer stopped. IMSIC leaves the
> enable on the new target to a timer on that CPU, and that timer can only
> fire through the broadcast interrupt, which is not enabled yet. The
> system stalls.

So the broadcast timer is moved on CPU which is idle and waking the CPU
is done by a timer, which does not work if the CPU is idle.
This makes sense.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
