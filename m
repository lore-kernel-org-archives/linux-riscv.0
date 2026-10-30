Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83887606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RUIoeQhH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NTqKdH5F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5U1LA8tvRr4rLVgoWkcmIzvedoC32Qnmgjd1qLCtVBU=; b=RUIoeQhH9HZYsUg0FNXwF+x+1K
	/PMRfMP6PV1rCH4yQ/LvqmAs87AJhgvlRDnuaQkYTVtgSONrXqVkDAMt/wqblwLG2+Ts1x9idvF+g
	5U1HfdefMWYcHeXRzuAihYqkW89VXtdxnM/mlJKotnkxkwnOdXubUpwt/O7L/6uX2DpofwyIMrpIl
	64Xfex+dk02PTtT1/ZP/3fN/QcN3Ds6UaQLlvtaE/fv03bNEpfDIrspJeVHnAq+hLiipt5S73cmW+
	eBqUB1IF3arq6Xj2c2hMpQOMjibfCw3BT9ebIFCNF+Swk3svcXUF/lk5ORtC6Lvo1GXupAy24Kg7P
	6ZAKmRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbOL-0000000Aber-0xcg;
	Fri, 30 Oct 2026 01:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbOJ-0000000Abel-2BoF
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4401143C8C;
	Fri, 30 Oct 2026 01:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5401F000C1;
	Fri, 30 Oct 2026 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793323606;
	bh=R+7wMeQRfWueUJAeG/KPsvC6BLbhrIuEh3kJTRzJT8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NTqKdH5F/sVmrX83aYf/qMaQtAoYv7RnBq/ETuLKwReNF6mHLjTD4RHExhDGcdlpU
	 NkLlBhUVc4otfWDMO3hSlUhRf0xcxp9ug/R4Tf8gDvHbfBk6FN9wvZFNYve4Z9otpQ
	 gyZPKxp+LIi4u6PCi9oc8aB6gOCiYhy2O0rk5zQg=
Date: Thu, 29 Oct 2026 18:26:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jackie Liu <liu.yun@linux.dev>
Cc: glider@google.com, dvyukov@google.com, elver@google.com, pjw@kernel.org,
 alex@ghiti.fr, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, muchun.song@linux.dev
Subject: Re: [PATCH v2 0/3] kfence: fix pool allocation failure handling
Message-Id: <20261029182645.d6e7b119a562c973d19cda63@linux-foundation.org>
In-Reply-To: <cover.1793242457.git.liuyun01@kylinos.cn>
References: <cover.1793242457.git.liuyun01@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
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
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 10:57:40 +0800 Jackie Liu <liu.yun@linux.dev> wrote:

> Fix the cleanup address and page reuse window in failed late KFENCE
> initialization. Also let RISC-V boot if the early pool reservation fails.
> 
> Patch 2 depends on patch 1. Patch 3 can be applied independently.

Thanks.

We're all horridly busy with bugfixes at present and the first thing
recipients think when presented with yet another is "why should I look
at this".

So it really helps to start out with a succinct and punchy sentence
which explains that thing.

LLM suggested to me

: KFENCE initialization failures can cause kernel crashes or memory
: corruption, while a RISC-V failure can prevent the system from booting.
: These fixes make the failure paths safe and allow systems to continue
: running with KFENCE disabled.

How does that sound?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
