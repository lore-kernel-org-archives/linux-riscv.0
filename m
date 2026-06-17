Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122ABCD98EE
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhP7B2q0K1YboZgQAJLr27GwuNBJiL9ymx6ljMXMgTc=; b=kFoYY/5fIJ/j8J
	+3o4oCJ4mEFmOssHPJ0xH1XgNkJBKtQ0xZ3ineQEkCX8sndApDEpXOoURgAzfFkkT8+e+KY76ZVy6
	SpWr1Cbp1BTfTchLHzPMVH8NjmnSWunJg8D5Qlh4wfqJjgnSuaNi0R79bxf39kEVY7UAg5v012cyL
	8wLxECvKD1Xiab/Z0Bk6lf2XYGzbUmLHkD90Ja4/w6tK9qi+0RqXD1wFQY6BNhxcvF2c0c2TzGzuv
	CY/BOWs23+RcS0Jfu8t5h7yCIRVJY8o7QVp7vp/a08mPdxysj9F4kygi05bkSWeUWDMli7SfJmYMl
	ExiIqAp9Yj+Ji5bubStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlxQ-0000000GuVl-3mrN;
	Wed, 17 Jun 2026 08:49:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlxO-0000000GuVD-3oCf
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 08:49:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781686147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4l2BKjym3mytO0Q6PBB2W4g8XqgjCbKZyZOeZ1FMgK0=;
	b=tGnL3CezgSQSCYxHm+fgYbSvzfuf2ltLwHErTnksa+NUvalR2pVJXOatyHId9e/9qJQLHI
	yB2rEFsjAZyTHuUf0++Kw5OJRPcuD9coec8pk8va1KL0jPmVvIh2CK/TXoJD3yMywrw+SK
	F+j1Jz6bUiquuFKiKvzZoE4AsnlmzNWAdOsmCLO1Dq4W8MGMKboW8B0YhNfKZ/lHgiQqJq
	8Mm0g4G5NUwc5cyeXM/+txsTAK3DwttyXyrXjec3Q9nxzae0Ac8Xd3i+UsrMWx8P89gHhN
	WYpER0No/Nev27EPg1feRo0b+ScuO27CI/7p20/GtlGH9uMgujG4n8Hr/h0MrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781686147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4l2BKjym3mytO0Q6PBB2W4g8XqgjCbKZyZOeZ1FMgK0=;
	b=Mommjx+gS7sauK5jJ6WSnQenr2JKsc8xxW8s2nMZFeACOx0q/JYO6c8bbpXM8xq+orf1YQ
	y85Vcgy1uKLfCeCA==
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew
 Jones <andrew.jones@oss.qualcomm.com>, Jingwei Wang
 <wangjingwei@iscas.ac.cn>, Anirudh Srinivasan
 <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: unaligned: stop using kthread for
 check_vector_unaligned_access()
In-Reply-To: <1c378963f27c5960e8a57c50b8b444d30954cb54.1781666867.git.namcao@linutronix.de>
References: <cover.1781666867.git.namcao@linutronix.de>
 <1c378963f27c5960e8a57c50b8b444d30954cb54.1781666867.git.namcao@linutronix.de>
Date: Wed, 17 Jun 2026 10:49:06 +0200
Message-ID: <87tsr1zh4t.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_014911_093711_2CC8F8D4 
X-CRM114-Status: GOOD (  14.71  )
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

Nam Cao <namcao@linutronix.de> writes:
> A kthread is used to run check_vector_unaligned_access() to optimize boot
> time, allowing the kernel to continue booting without waiting for the
> unaligned vector speed probe to finish.
>
> However, this asynchronous approach introduces several complications.
> First, the kthread may not complete before a user reads vDSO data,
> resulting in incorrect values. This was previously addressed by
> commit 5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for
> late-initialized keys at boot"), which added complex synchronization
> between the kthread and vDSO reads.
>
> Second, it was discovered that the kthread may not finish before
> vec_check_unaligned_access_speed_all_cpus() (marked with __init) is freed,
> triggering a page fault.
>
> These issues raise the question of whether the kthread is worth the added
> complexity. A past boot time regression report was actually unrelated to
> synchronous probing; it was caused by the probe running serially. Since
> switching to a parallel probe, no further complaints have been made.
> Furthermore, the unaligned scalar access speed probe takes the same amount
> of time, runs synchronously, and has caused no issues.

Another point I forgot to include. We start the kthread to run
asynchronously, but the probe is executed on all CPUs including the boot
CPU. Therefore if the kthread is executed before boot is completed,
asynchronous probe will actually slow down boot time due to the overhead
with kthread. If the kthread is executed after boot is completed, we run
into the two race conditions mentioned above.

> Testing shows no noticeable boot time slowdown when running the vector
> probe synchronously (0.464474s with kthread vs. 0.457991s without).
>
> Remove the kthread usage and run the probe synchronously. This simplifies
> the boot flow and allows for the revert of commit 5d15d2ad36b0 ("riscv:
> hwprobe: Fix stale vDSO data for late-initialized keys at boot")
>
> Reported-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Closes: https://lore.kernel.org/linux-riscv/20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com/
> Fixes: a00e022be531 ("riscv: Annotate unaligned access init functions")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
