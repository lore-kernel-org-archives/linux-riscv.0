Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1DC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOb16QMmkdaSt19/ZHjfM5bpa1/I0/8Mzwm1TTjO4NQ=; b=rw0acoPeMFM/XC
	aUGstxriHKL0A0RIYIY6rCzgZ+GeQ22FkeWo2NBVR61IHpW7uQt73ux3dVJVqxJtscPr2+kNB1vFO
	gocJvICwfcLfTEBa8GH16QE/Hjmc2ms3EZZ/5okfuZca4sjvt2R9OPoDb6URjYXe6MdHtlcsz170s
	h8y2LiCtLmBhMnMR1lsMGPSZTY15OM5f+tySpFTLm21CMjjYSvf82hOBipAHMiaTPBbe8+QAZs/Ae
	ErgFa42ApGaXUMbAa9PbJJrhTQNo043cT7qlOy4mzPj2ANE3LYHOaHwOktR35jSf1w3FaOoqO5wqo
	F/pFoSrAYgeqmBgnaiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQlZ-0000000COlR-1r6q;
	Sat, 27 Jun 2026 11:00:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQlX-0000000COkb-0fSk
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 11:00:04 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782557994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Z0jNnrEg32cWn9Xjj3qRD3bx+C2JhgHhs1l2ofbWE8=;
	b=AncN2O0Dkh0QT7cFAI5Y49CbxgjI0J+qAtUmddy5gad33c+lThT4GOYxb8VyTDbb1XX/AJ
	PqIDNp9oFrCHh7BexVAuFa9WqaoUtVenE5fEKqLxZtZ5OwNAh6Ju89kD8WxX3yLuBdZiL7
	YZzYAnQolLRt1ic3/JLeeuwvsCfNxubDPbaiOgTktntzY5qqlcDK2xi3PXEbj4rryRzp/i
	pWMMrTPgwNP4eA/y9RFHkEhtp95LUD+PPmdA4urQlkGyA8jcbtKX5QJ8OZeaSS1LxLGwJb
	OFBGW+i1K3Q1+2DhGxoIKvJ5U6Ha/Ive8YAkUzPfKKtgdXPSnsQfAs54FMRoOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782557994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Z0jNnrEg32cWn9Xjj3qRD3bx+C2JhgHhs1l2ofbWE8=;
	b=yJx47qRoRxfSJL+SEtnd9kL523fh6rQFdldjrlLnzCLYkUQWZ3EaTqT5RdEqs5QWWMyuk5
	tYjpxsJJmx5PR1Cw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Xiaofeng Yuan
 <xiaofengmian@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: probes: simulate c.jal instruction
In-Reply-To: <178253409654.105999.9483335947060007692.b4-review@b4>
References: <20260627001939.3847-1-xiaofengmian@163.com>
 <178253409654.105999.9483335947060007692.b4-review@b4>
Date: Sat, 27 Jun 2026 12:59:50 +0200
Message-ID: <878q805jvd.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_040003_351529_D03D6D80 
X-CRM114-Status: UNSURE (   8.11  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> I was looking at this recently trying to figure out why this hadn't been
> implemented and couldn't determine why this one was special, it might be
> because it is 32-bit only.

Yes. When I looked into this, I had no idea how to test rv32, so I skipped it.

> Since it is 32-bit only, can you put ifdefs
> around it for riscv32 (#if __riscv_xlen == 32) ?

Except for slightly bigger kernel size, it does not hurt to keep. And
#if stuff is quite ugly. But I'm fine with it either way.

> Can you also add a test case to:
> arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S?

I already have a patch adding test case. Let me send it.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
