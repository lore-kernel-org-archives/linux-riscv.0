Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D0BC5B567
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jklp/kqgddzYTyVFJj/4zxapUZpLyBELzpDhjIxNjTs=; b=4bglGW3GjqdCqn
	bmtEUMlV/nvs094Al6WcfozzthE6jkXnKXMu1Bbc0FO1hPZR8RqEbVe6YRjZ/mT0y/iJScwNh1ogy
	tOa/veOoalfOa+jD3h0sLkOY7DMgO060htdGLNUjX7yimwJLV576mJ+p4GU2ZAJPjAXG1x4y9aFgQ
	6NvSDBUoIYLEdiPa/NSJoj0ijoKryBTJMgcIOV17a8L8KFIW/+R0XmghzgeNL8hNAFDzw5BOC8Lam
	9bv9QrdT5qtpFnQ2ykvcOO32/tO+vWOn32pJtN/SphZZ3016ynf7Rx4XzpJmOroN2JjZI3saVYPVY
	S1av0OhYR5F+77ZVOFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2i3-0000000FX3H-3pqu;
	Wed, 12 Aug 2026 06:45:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2i1-0000000FX27-0j8t
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 06:45:06 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786517101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuhyDaWlGvcetYwCH9EDrtcAe5tbIiQASwnE/E1NDFA=;
	b=3VYuFYz/2/CHhn2uULcRv0jtfUQbC4ezJoSglvq4LKM+EUFOZ2k82ZgYWz+9MHQZHY9QEL
	7QcPb5hiymRcCd8Z8lXbQnGyCOEHAtpDfvw9r5G9W93lOQFGZYhnRAg2/VD+ErFqEE7MBH
	oF/l6pewzupa1rZS0IUHRQOP+y5Q5WXiijKVZ96NODHps8MPKT8FGXg2KmFJsDYAmQ3s6Y
	T3/cDQpdllXLRYoUmNKX4A8tNwwJXOloU+k0p5FyGcyLcGOXfeVoyotqQWVUVd+NeVyL9C
	B7/lupUDm5NET3ZiRAPg97IIzRFTFN4uAyEhVrklShFXkUnqG4YV1dHP6F7EnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786517101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuhyDaWlGvcetYwCH9EDrtcAe5tbIiQASwnE/E1NDFA=;
	b=O4SjxrVUGX1VIEynvg69MWy9D84Hi4nKd38aexRWpazfhiNd3c+z1Oepw8LFzhwilmHsDK
	nAFak4tAiF9J89Cg==
To: Klara Modin <klara@kasm.eu>, Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel
 text is already writable
In-Reply-To: <ant_8TaBbov_GS4i@soda.int.kasm.eu>
References: <20260720032258.5188-1-xiaofengmian@163.com>
 <20260720032258.5188-3-xiaofengmian@163.com>
 <ant_8TaBbov_GS4i@soda.int.kasm.eu>
Date: Wed, 12 Aug 2026 08:45:00 +0200
Message-ID: <8733wjzvkj.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_234505_361125_952FD6C0 
X-CRM114-Status: UNSURE (   4.86  )
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

Klara Modin <klara@kasm.eu> writes:
> I have MODULES disabled and thus also STRICT_MODULE_RWX disabled, but
> still STRICT_KERNEL_RWX enabled. I saw that an earlier version of this
> patch[1] instead gated the first branch behind STRICT_KERNEL_RWX. That
> version works fine for me.

Urgh, I got confused between STRICT_MODULE_RWX and STRICT_KERNEL_RWX, I
suggested the final version.

Xiaofeng, can you send a patch?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
