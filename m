Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DECC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lP0RBs+rBF08TYDj6ZdxRMJgyLKu7ncvihNIvQgvgOQ=; b=p1b1Gz+x2fd8Dp
	iG1AHZzM1NsCN4mvqgIUvBFc5mZb1GYznkW0DLNSSegLH9dDfTeGO0XRNQJZ/n5AGOpLmQm3ZAAXM
	IaJVqffZ1JShxendck4DAwZCi5WaJDkhTr3r+yYCydzRS/KHn16l/4L+5Mp9+w2DJDwOsGoU7hb1h
	+ZLds1SvqY3LFWJZVM+T0yvkEAuLPlC9yBukuGDkM4NN4S67XgAlj3aIU8ZGyjinL4HWPqq0Bg/t7
	7dmO2eEHwB8X28KrD4wxwuUMZooMZioXGsmIbKtzAgoOJgjxhmCwfclHRT2FDMcyUJcJw8tV2Dseg
	XOOQHLo6HfZ+Xs9trjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllzk-00000006aHD-0IPH;
	Mon, 20 Jul 2026 11:17:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllzh-00000006aGJ-1s77
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 11:17:10 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784546224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBTza7WjXVxJg1JrlQK8fpS0qv/R4XhHpk0blaST9Lg=;
	b=QhExGHzahZGowhNFRxeHy7RlDFXxaSkh3CUk0sxcoI9SG7dHMKmpYXL+2jl7LlfBCu0DoM
	Umsi5iurlKd7MWurETdbM+TbWSfIYnXJnPv5zKnkG7YwWocIGj45d9WYecoxcM5wxMMz4d
	uhJzXC0CFWIlVk799nYYTBC0W2BqaK/eQsjeg+XwNR5HnliwW5x6Om2uTdNXBN/SExseRv
	gYoGq6lQxPNHF5vOCsWI73KodLBhzRd3gyH3tI8Cba00j1BUO0vCLGWX6aoHi0CysHkN7N
	Nl354g7s+A7ngq9o6+pPoqXnGDZnPcOK0UyzZVaHDt7c7xI6HeHvY2XFoShO0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784546224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBTza7WjXVxJg1JrlQK8fpS0qv/R4XhHpk0blaST9Lg=;
	b=UMATnUzHJYwR+YCUIhK9dTDB3SR7VcB9qK1Ifdv2PXxBeKPLg93vG/BtIv324TSQURa4sE
	sjuOJXqu/AI+8SAw==
To: Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 4/5] riscv: compat_vdso: Build with zacas if available
In-Reply-To: <0e65ddab-f066-4d9a-b032-d1e55e76fe47@iscas.ac.cn>
References: <cover.1784274927.git.namcao@linutronix.de>
 <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
 <0e65ddab-f066-4d9a-b032-d1e55e76fe47@iscas.ac.cn>
Date: Mon, 20 Jul 2026 13:17:02 +0200
Message-ID: <87o6g1ewr5.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_041709_620807_CFD33C14 
X-CRM114-Status: UNSURE (   3.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Vml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cml0ZXM6Cj4gSSdtIHdvbmRl
cmluZyBpZiB5b3Ugd291bGQgYmUgaW50ZXJlc3RlZCBpbiB1c2luZyAub3B0aW9uIGFyY2gsICt6
YWNhcwo+IGZvciB0aGlzLCBpbnN0ZWFkIG9mIGVuYWJsaW5nIGl0IGZvciBldmVyeXRoaW5nLsKg
CgpTdXJlLCBJIGRvbid0IHNlZSBhbnkgZG93bnNpZGUgb2YgdGhhdC4KCk5hbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
