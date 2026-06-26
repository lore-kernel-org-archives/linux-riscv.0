Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D684CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 04:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpmpG2G8y9ie4FGgo8pjUhrefKR8l3r2GF5dvVtMaMs=; b=GV+UA+mUmzf24A
	xYet0HLOtbPBaQJHlsZy1WB6uw8UfMzLx2F3Yeiz+eep05509ySeIlnZYbmvdSNinHWBDQ7QYyb17
	iKywV6SvJsdCTsq7ElCGJ6gVHcwjzfPEbrd+2ssa7xb7Xt74w3d3PBtOPAHEkjRR+SOhCxGIZIYHW
	3O4/TQDz1zEaT5nrvRtI/DKR8ofI5W7DP9VONAbuWrr9Zm0g2y32zy4hneumWpYsWOFZqnNScdZ8w
	45HF5DTEtZDxfXnLD4A/C9ueAjt6E/kFhGckaUAC4C2oiV7/bOr/F3kgUVvYnWWrBtxiGfApFzxVd
	Y7C3AQuxSkLW6AjEn0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxuW-0000000ASfu-2Qlb;
	Fri, 26 Jun 2026 04:11:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxuT-0000000ASfW-1xn7
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 04:11:22 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782447076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Em9JTvibovHcsPxMft2msWemAJ7bEozK0uiZFUmDUO8=;
	b=z6k7leudZGugP1QZHCR67prcjbq9QhGyFNpxyBuG86yGQ5JXtvt+NO4Mnex0BAMZxKCaUv
	KKAx5lUH3SLUizOIxjjBvggymQM4Cl8FPH46cgTItAK6xL+InTP8VpQz6le18u60MvxWdy
	wVO5OGIVGYgZw7zvH8HMYaIqO9ykbfk7ikgQAXtBSTj+ZY8l8EteQFwRx2w/nJxXIYoG7L
	9ZfGgUeLTQ1l1Qlzzd2Sg+vrNNGHxxxUHTYVRPneHpiiITmDCmWldW8h0jQfgxFOs2Ui3f
	whnMbf0BgymZkPBuSt5FSa4wU7+k06oZFUba3apGlQV78m5Vig0fCEWysBFh6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782447076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Em9JTvibovHcsPxMft2msWemAJ7bEozK0uiZFUmDUO8=;
	b=vAmJIdJ2EyKoeBnn300FRMiebGzlDwCTt9jwFS4R3zdYCTw4/aqjMkxY4/8Kcrz7x/AIQV
	RGBXm4v7bnWeQABg==
To: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xiaofeng
 Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH] riscv: probes: simulate c.jal instruction
In-Reply-To: <20260626003735.9066-1-xiaofengmian@163.com>
References: <20260626003735.9066-1-xiaofengmian@163.com>
Date: Fri, 26 Jun 2026 06:11:14 +0200
Message-ID: <87wlvm3pr1.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_211121_649435_3AAE0C2C 
X-CRM114-Status: UNSURE (   3.34  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> Add simulate_c_jal() which saves the return address to x1 (ra)
> and sets the program counter to the target offset, matching
> the behavior of c.j (which is already simulated) plus the
> link register write that distinguishes c.jal from c.j.

Please reuse the existing c.j simulation to reduce code duplication.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
