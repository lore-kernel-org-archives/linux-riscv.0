Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5827C44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Udfw/CmrrddP6N2VGdXWXnYAw6peVqRWwTzQ3LaxQLQ=; b=VbyYPPMdvhF26Z
	Ow2BygAvZDZlXDAzaHmtK2TNkR+lZvetq5XuFAHl+Fn3XEs7d2bpnFKU8bu0WQkps/MV6VkQh1MaK
	e+U0bAy32PNJbtHsy6k69QTB9lnaFd7LMccsQf+CH44g6xPNQVnsiX4s/BAHPfaSy2GgItCTcug86
	vLbGd6nZgZxwtScbj5PaYsVu23Mt27ygMGmM/tXlOCJ7TCLJQVbsoiZdoE5NGjnAVwLnBfJTTq1vP
	rvEKb937pCtwXEOcFOPXp5IboDVw4/Ugvc21ZwSqoC4jNmMFbjw/hU5t1s2bnpK4KSuIFsNVDcu0F
	WsI7iWQAAh0riBNiReCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMj0-00000004qOR-1Htx;
	Sun, 19 Jul 2026 08:18:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMix-00000004qO1-2p4e
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 08:18:13 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784449085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CDR7qvXlXk8VHBJHykRPytF8pOsR/Hc+loXN0J/Kgks=;
	b=4gVr2M7ASxdFb5+kYjI/I23JloqI2JA6/hoEj0Zr4ghQ6pnXhxO7dBNC0xE2ZbjgMzsj2m
	wbACrvUvURMEPDERaC2wxuCYhzIu9XspD1Qcp1ln71qtvlhuMgDoL9vv4ehUO9bdmOCoaF
	4YWoA7l2AlQOlOYWa2bMM8NqKxKOXCnHTAKD3EUcWKoTrn6yUQqd6FuQMhzi5Shq5p/ee+
	ZgWmCI6MqXMlZ1pZEISWH+nkVACs6roSHZGnbAbZEAy7hKnEOmEG1IDbPuh+IpKMKf0Xk0
	nth93GuikFYdleNpeHL8M/Cjw3Ev2QJgbwdDnKmXd6h0LeGo5AaBoh1FZd5xww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784449085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CDR7qvXlXk8VHBJHykRPytF8pOsR/Hc+loXN0J/Kgks=;
	b=aipofytodjtRUujqejK0cskuj3YXVHgAeVt9RmYzTLwQUPIZe12u+XEOGlS90KnMWnCdke
	s+f4rtxjrE1LwGAw==
To: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 broonie@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xiaofeng Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH v2 1/2] riscv: mm: make EXECMEM_KPROBES writable without
 CONFIG_STRICT_MODULE_RWX
In-Reply-To: <20260719081037.5749-2-xiaofengmian@163.com>
References: <20260719081037.5749-1-xiaofengmian@163.com>
 <20260719081037.5749-2-xiaofengmian@163.com>
Date: Sun, 19 Jul 2026 10:18:03 +0200
Message-ID: <87jyqr75qc.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_011811_876240_DE99A3A7 
X-CRM114-Status: UNSURE (   2.89  )
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
> ...
>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>

Commit description is missing.

For the diff:
Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
