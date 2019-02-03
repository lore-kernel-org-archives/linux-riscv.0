Return-Path: <SRS0=yhZS=QK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21A2C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 17:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A682D2083B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 17:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJIXetCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A682D2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xSB3L7dOldvSqro4FBiAyLrtr0B5g8nZzYHOcVZRxM=; b=CJIXetCcEk/Pp2
	+aZxBffRQrGEZcYYYpOvTg934BNkO7n+Dcq0HzkrLL3dd9LagXHU27QVIH3nz2RDlikN2jV7uxSDc
	mUoHhkziV1KCQofp0/KUwonnJ6NPyDvNXlqUQ8WB+9xGyEfoEP5OG7O9pTPXkA6qDc6r7f5EvvJP6
	t806UONzUW16OHXvx1ZJBgz9wOyPhUI3HsoIWwVeXxY7SRHX6Y3H/GwIpwTY5icPLr6hTFD6bbk5P
	isv07iXcgKzi1Wsr6JGENyuHC41DBlb6b0QvCZ8kp769Jou1P8WYnv+BcowEhrwDSKLQInjt7EHpi
	GYruxVya/flbGHrqHVUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqLFz-0006nn-GD; Sun, 03 Feb 2019 17:08:35 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqLFv-0006nG-TX
 for linux-riscv@lists.infradead.org; Sun, 03 Feb 2019 17:08:33 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8610D356D5;
 Sun,  3 Feb 2019 17:08:28 +0000 (UTC)
Received: from localhost (ovpn-112-14.rdu2.redhat.com [10.10.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 055D060C7F;
 Sun,  3 Feb 2019 17:08:25 +0000 (UTC)
Date: Sun, 03 Feb 2019 09:08:24 -0800 (PST)
Message-Id: <20190203.090824.136686144218791788.davem@redhat.com>
To: bjorn.topel@gmail.com
Subject: Re: [PATCH bpf-next 1/3] bpf, riscv: add BPF JIT for RV64G
From: David Miller <davem@redhat.com>
In-Reply-To: <20190203115132.8766-2-bjorn.topel@gmail.com>
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
 <20190203115132.8766-2-bjorn.topel@gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sun, 03 Feb 2019 17:08:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_090831_975709_99AAB268 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, palmer@sifive.com,
 ast@kernel.org, hch@infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: bjorn.topel@gmail.com
Date: Sun,  3 Feb 2019 12:51:29 +0100

> From: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>
> =

> This commit adds BPF JIT for RV64G.
> =

> The JIT is a two-pass JIT, and has a dynamic prolog/epilogue (similar
> to the MIPS64 BPF JIT) instead of static ones (e.g. x86_64).
> =

> At the moment the RISC-V Linux port does not support HAVE_KPROBES,
> which means that CONFIG_BPF_EVENTS is not supported. Thus, no tests
> involving BPF_PROG_TYPE_TRACEPOINT passes.
> =

> Further, the implementation does not support "far branching" (>4KiB).
> =

> The implementation passes all the test_bpf.ko tests:
>   test_bpf: Summary: 378 PASSED, 0 FAILED, [366/366 JIT'ed]
> =

> All the tail_call tests in the selftest/bpf/test_verifier program
> passes.
> =

> All tests where done on QEMU (QEMU emulator version 3.1.50
> (v3.1.0-688-g8ae951fbc106)).
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>

Acked-by: David S. Miller <davem@davemloft.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
