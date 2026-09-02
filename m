Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0811C61DD3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 03:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxR1xub6CXwWBH0Ap7RZJtyP1ADkvcWM7NeZSM+pEzw=; b=0ex50ePXBs5Os0
	YCF1c/kaElsAS/2sFueNBDJl65QsdJNVOokQ6ShHVwykC0vC1nrzMKqC+BjFomZQQRhoAkXeRBLJG
	6G1tXgcsBnPKEJec7jNm9cJTrbnT2r+mZL991mtaW8nLNFpbTP3TyiPCwSfNSLWZBXdxeyDT9iiEg
	q8D6d3j6mXZWXQaV8dhQNfdLVzHsMwA3gwpIAcCeLS1vabeN6qKT0Ol/TvyVNGd5+PH00CVwi5Hzo
	7CYcdbfdGfTYUfIHSHRn1NBa19djGQECexH8kl7gmsdSxIlxHGKL1UMPjjDSWWVLJ8v5dXOYXYQgN
	z2ud47pn/1eseXPjmINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bfj-0000000DimB-0v6k;
	Wed, 02 Sep 2026 03:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bfh-0000000Dil2-3LHK
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 03:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V/dlReRWmcpaJacPAy+g1eVWzWtHIWi93ITfcA0HWxA=; b=BBAOWm/07fek7pTLkxrUYXFiP5
	m3oABrPOLMsovMnif6kzl+iolyYlFTH9f0gEinjplfo9QO5eUYzJdwOt7IUWg8QVRkeu1bLYjK31l
	Vy392W2FLmTYOCsEXQ9KBw1KSMA+V0XgBdLpR6stWiKwrY4i288BIdZ/NoukSqMuhqYZ/h1xzy68V
	lRLHEsP7L6v7P5i3sMfRsgwQ6uKt52yuRWlEmI7sWrFxJej+/0B+m3kuc19/FpU/lSHp0Q7xTrCpT
	N1wBeL4Rr5kA/zXtBurCWp9Hf9UNULy5vQeLtZNJWiUHynU1T+kT/wvXvFG63e7o4uIGjMnqLn0K8
	3Gje2QHg==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1agK-0000000BXS9-1Ebv
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 02:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788315978; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=V/dlReRWmcpaJacPAy+g1eVWzWtHIWi93ITfcA0HWxA=;
	b=FTbq36ZyM4YgeBSM22yyCmq+H321pERKQZZic62Tm2PQ/CXcf1tA+XxgzSvBR3POEH/mO0FhvqZklI53Xo0FU9K8H9mErVY5iU5+o+LIKAwkG9BiWyaEtFNBQfHGDMkjqXzKowLX/CAu88s8eOanRvOU3r1zw6C8uvVKB0O5WCQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAArZhl_1788315971;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAArZhl_1788315971 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 10:26:16 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: bot+bpf-ci@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf, riscv: Register extable entries at probe insn call sites
Date: Wed,  2 Sep 2026 10:26:08 +0800
Message-ID: <20260902015152.16104-1-reply-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <46b7038550e5d5ed680c36ee4e9bd96429b9bd85b600c257a254fe73b17d6e19@mail.kernel.org>
References: <20260901120013.16104-1-cp0613@linux.alibaba.com> <46b7038550e5d5ed680c36ee4e9bd96429b9bd85b600c257a254fe73b17d6e19@mail.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_032633_463083_C3DEC909 
X-CRM114-Status: UNSURE (   8.29  )
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

> This looks like a bug fix for the fragile mode-based filtering in
> add_exception_handler(). Should this include:
>
>   Fixes: b4757714cc63 ("bpf, riscv: Add support for signed arena loads")

No Fixes tag, because the mode/class collision has never been a live
bug in any released tree. b4757714cc63 introduced both the
BPF_PROBE_MEM32SX support and the LDX class guard in the mode gate, in
the same commit, precisely to keep plain atomics (which share the 0xc0
mode value) out of the exception table. Its commit message says so
explicitly:

  "Since BPF_PROBE_MEM32SX shares its mode value (0xc0) with
   BPF_ATOMIC, the gate accepts it only for LDX class instructions so
   that plain atomic instructions do not register exception table
   entries."

For context: I noticed this fragile shared-state gate while working on
v1 of "bpf, riscv: Add support for signed arena loads", where the class
guard was added as a preventive measure. This patch now follows up with
the actual cleanup, making the registration decision explicit at each
call site so future probe modes cannot silently collide with legitimate
encodings.

Also, regarding sashiko-bot's separate concern about BPF_PROBE_ATOMIC
cmpxchg without ZACAS: that path is unreachable, as arena BPF_CMPXCHG
is already gated on ZACAS by bpf_jit_supports_insn(), and
add_exception_handler() resets its offsets after every registration,
so stale offsets cannot be consumed. A separate fix I have prepared,
"bpf, riscv: Make arena support depend on ZACAS", further rejects
arena map creation on non-ZACAS systems altogether.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
