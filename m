Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D388EC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gty5H8zjGguzxsa7/rhjJPWbX7hRh9AraIeIeRxjIPY=; b=V0Xj9r9bkwoBf4
	nJa1iT8ZltUBQslMOpxomnEaOjEgXiL2d6alHZ212YC1ZEMSGyKdX7WQP5/fa94DiNPHjpR3Fw+ln
	sAFpO1OseBsIf3FRV3kODPh16CNZru1YE8md4nEDxo0KipJJg8tjaZIg2kcu+Cp4klj6l9sX+209h
	ZcBLNXpdoe5vYha9DbWIClbCU7L4c1GFghJdjug5qtUGqjnQH4Sb9mYeJhpq2At4Vb7Cui+omlruA
	f6jKD+DyjhMOKX7A2C31kt8ByxfL87T6LMNBHujmvrhqd/pSAvvFLgesFZM9fCbxL1Fx4recImbg0
	sLwKTQssIhc4B/17sL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQpW-0000000COxD-3fDO;
	Sat, 27 Jun 2026 11:04:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQpV-0000000COwu-06r3
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 11:04:10 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782558246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HgFZHbENUrtJ/AKy7/fOfRnVUBVnQ4muPZH1Io8WqYU=;
	b=J+GZhcmBMmmSWIog9hI/3WU6KBo4Br0VB7FOzZarubbtYcU1jtcDP9AW/UTGztswjQVwKN
	Hg6oiQRkpn4LcAqyREHkGRStbbttjYjrVFhPdwpctf0PyY7d5/p939IjulDbYosr2UXPhJ
	lrFmyDAXxdLegjONt6GGKskY8c1NDqVzE/gv+amROqqbuHcMjv2v1qJFnMOIDQPB4YBmG8
	GaaAd5RGMrQpzykw0Q4xz357nonhlxMJ2GImN5bGRccnnIHKiOT95XuTCOACVzUJz9lC2p
	cKH7p9NjQfeWIsGj4tH6+D0b3+VyOSOEu0EOnbO8bEg8p9gF3M2W6YbEXosVBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782558246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HgFZHbENUrtJ/AKy7/fOfRnVUBVnQ4muPZH1Io8WqYU=;
	b=YW52gccwjqNBH1nwgpTaQbLaL+9mGNjsJTsoOSSokN0Vdp+ETWr7VNkr/ZN3EEoREXXKA2
	aHvrH6KpNtz678Bw==
To: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xiaofeng
 Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH v4] riscv: probes: simulate c.jal instruction
In-Reply-To: <20260627001939.3847-1-xiaofengmian@163.com>
References: <20260627001939.3847-1-xiaofengmian@163.com>
Date: Sat, 27 Jun 2026 13:04:05 +0200
Message-ID: <875x345joa.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_040409_208191_D3DB96C6 
X-CRM114-Status: UNSURE (   3.97  )
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
> The c.jal instruction is currently marked REJECTED in kprobes
> instruction decoding, but it should be SIMULATED like other
> compressed jump instructions.
>
> Add simulate_c_jal() which saves the return address to RA and
> sets the program counter to the target offset, reusing
> simulate_c_j for the common jump logic.
>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>
Tested-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
