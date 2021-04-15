Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7955FC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:52:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD0F6109F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD0F6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVRKkOpKt8FwF7VVxlnthjPcx7dCrJTfPg03XMPVnEk=; b=qlxuvPvjghNdTLY+huq2C5Mx5
	jhwb5GG5yp8NkTr38r/83mm6pFTwAEr8bfxn3LAuyIIWvagXr2d7x3XTfzZzrXOYA+ZefW/UDoERF
	ZnjoZSArvNtH8GB1J10V7/Iho8iq4W78M6mkeKU4MvVHrhposZfnzfI7Q4y0caUwEqeT+KmLd7I9C
	jXQtnxqrqZtWK6IVlApfwDyfQ6ElOfVsweCsxJ0O95atGWcnapPnRp1A+iYuCWdN45yiwCAfsR4T0
	SSR1vnAxmnqB3IGEoMIZqJ7AfogIU8O/jUJwalsWr2Gc3C5ixLiWM290bZjKuJvQ/mr5wo39mcSpD
	jsltgBw2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxjn-00FPwI-6f; Thu, 15 Apr 2021 08:52:36 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxjk-00FPvr-8a; Thu, 15 Apr 2021 08:52:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6ED28300033;
 Thu, 15 Apr 2021 10:52:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 566E32022422C; Thu, 15 Apr 2021 10:52:31 +0200 (CEST)
Date: Thu, 15 Apr 2021 10:52:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: Anup.Patel@wdc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] riscv: atomic: Using ARCH_ATOMIC in asm/atomic.h
Message-ID: <YHf+z0AotZmjvaJ/@hirez.programming.kicks-ass.net>
References: <1618472362-85193-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618472362-85193-1-git-send-email-guoren@kernel.org>
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

On Thu, Apr 15, 2021 at 07:39:22AM +0000, guoren@kernel.org wrote:
>  - Add atomic_andnot_* operation

> @@ -76,6 +59,12 @@ ATOMIC_OPS(sub, add, -i)
>  ATOMIC_OPS(and, and,  i)
>  ATOMIC_OPS( or,  or,  i)
>  ATOMIC_OPS(xor, xor,  i)
> +ATOMIC_OPS(andnot, and,  -i)

~i, surely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
