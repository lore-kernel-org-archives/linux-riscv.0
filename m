Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC520C4707F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 17:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32CB613C9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 17:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32CB613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuX+KosrqPc5NSenwCpN5LoOrpeWtYzvx1rxflARmN0=; b=ZPcdA0uMNT4Jo2
	o0oeW05A2cX0SLF8hJkH67rRnUasnOyTX6OhlJhWa5oFZEBtBhTMV+V59PBjPwsz6ISXcgoDts4Db
	ClwDunwmVOdFC6vG71ZGPGvFIhJZZDkeHQZfqopGZPv1xbGWGv7ADUo/MLOqulQDyto48XgBQufOe
	Nd7JTLZUIq2eyrn8MikSRMkHGj3wMVM7rgmMcds6da8EkXE2aw3hASdcGGOqZxpSYdJM+i4RcLNnp
	W9QXmcgpOPv0VuDCIuLb6HNJCP95OYNHW5d9JXkou/vo5VbtN6Uy35j+7Kau4WkvQBhtULbOEfhJV
	tbJ0FUtgCopQo1DEJUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmJvS-0088s2-42; Thu, 27 May 2021 17:36:06 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmIcO-007VSB-VH; Thu, 27 May 2021 16:12:22 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0760C2DC;
 Thu, 27 May 2021 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0760C2DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1622131910; bh=/V6X7dFIwH+ijI90SpG+HfotiquNJzXcSWfeZUVQZJU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d4sZZsiXsjR2ff82rfNhnB14MI3OXov3P55fHna4KA21wAeFbZui72REPTg5lySqP
 OSq3SCgJMMe+2aIQp6Dr5ihJVsgUwJcdGzLj8iS7wofTjHx0tTqVRGmpqmHnmlswsq
 TggGdvTgB6gMubKiDQWBeX0d/EzpH+YFcZbeyRAqHjfckcwaWE0w0ufBU+oO1ZhRn/
 5pM6nZlmwCkvbdzZ5APkxdie6RyxAO37WQtDPdbnVae3FJ6GNTQHZM6tSfoGgZfBHQ
 waZWnn7euw3aCgqUhmU1zOdQ8KLu0zbRK4LgD11Qs2WZis5CY3VWHsc3Ddkavgm0Bl
 d2VZX73kNcmiA==
From: Jonathan Corbet <corbet@lwn.net>
To: Barry Song <song.bao.hua@hisilicon.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] docs: kernel-parameters: mark numa=off is supported by
 a bundle of architectures
In-Reply-To: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
References: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
Date: Thu, 27 May 2021 10:11:49 -0600
Message-ID: <87v9742m2i.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_091221_103482_E75F18C7 
X-CRM114-Status: UNSURE (   9.81  )
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

Barry Song <song.bao.hua@hisilicon.com> writes:

> risc-v and arm64 support numa=off by common arch_numa_init()
> in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
> by arch-level early_param.
> numa=off is widely used in linux distributions. it is better
> to document it.
>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
