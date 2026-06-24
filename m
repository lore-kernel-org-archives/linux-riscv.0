Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03196CDB471
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0Tzd8R50y4K1ChxiSAw8vgrmtFWChCCHv8Cwx7U6Gc=; b=xqwdWxvJL0OeXW
	oJxFOnicNPyTH5yEYRipkTlzfjeUABNbQygpGLHmqhst5W6FxT0gG0sUZuDk5SpsvhasnvnVvP7wl
	+8WGgK7a23CqXOTO97cBRcQq0YqOeobzZ5WE/8hdpX2vB2J7Wb9yQD74XIDBgQPSr+AU3KG83m4Wk
	PvPsjMQrtZCTu9JkUIdoMkwBi/PbEkjY64dA6I9QJwvVvyeAkRV/MBiPz4mXEbUgHkvGjUCjgBr8G
	CjnkzGdSK78oN9sUSHQtl9XgBVtxFL2Q3+71OOhBNAYsRHflAc7XuojFPGQZ/NIK2N6uRCFc2HjX0
	ubeM5HYOQwkv9xKVvbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMs5-00000007lVx-3z3x;
	Wed, 24 Jun 2026 12:38:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMs3-00000007lVa-1Af1
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 12:38:24 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782304698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUGm+MMcmwFGtPy7Lale2NIYDyisNu79U7nBOET1+5Y=;
	b=FUrMx08NM8VmDUxmGZEFptBKWTqfsm7CNKV7viI136LvU4KkmA5kFU7gE4y1vAEjC+cPdv
	02eFnI2KQAVt+eRTi+5LaPYCW1SA8D5P7iOwB1dOBJAZB5e7x8mOsUQlDdIClXStolmF7x
	9DnUFWsayXw3nfeqi3XpmoLTTLwsF8rWxVkNPB9I6GPE7UkefDt+SWhSK+kS4jfR9qo3Nn
	5gZETXbOXDdBjowyifdYQlMCQgubnG4x1In4qxX1zl82FJZvcDBnkjohPNsulMFGTjm+Y7
	g6vg8/5Zpou97EXKt60wKDjRQnHDtorxf8x1HoZNHn6lNEzRHqKBC7o62bcfFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782304698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUGm+MMcmwFGtPy7Lale2NIYDyisNu79U7nBOET1+5Y=;
	b=1V5FcqXB0HrwaHTtBBGbGNODlWgvLMdKb4tlHMdYOnt+IfW0ETwzkzP0X+dbWnA+fckJAv
	fXjrZNaerK6KAsCA==
To: Rui Qi <qirui.001@bytedance.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 samuel.holland@sifive.com, Rui Qi <qirui.001@bytedance.com>
Subject: Re: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
In-Reply-To: <20260624113148.3723541-1-qirui.001@bytedance.com>
References: <20260624113148.3723541-1-qirui.001@bytedance.com>
Date: Wed, 24 Jun 2026 14:38:17 +0200
Message-ID: <87o6h06rly.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_053823_459147_780807F0 
X-CRM114-Status: UNSURE (   5.76  )
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

"Rui Qi" <qirui.001@bytedance.com> writes:
> This is a resubmission of Samuel Holland's patch [1] which was
> posted in May 2024 but never merged. The bug still exists in the
> current tree.
>
> [1] https://lore.kernel.org/all/20240530001733.1407654-2-samuel.holland@sifive.com/

I don't think we should keep this part in the commit message. And
Matthew's Reviewed-by should be included.

But I leave that to the maintainers, the diff looks correct to me.

Reviewed-by: Nam Cao <namcao@linutronix.de>

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
