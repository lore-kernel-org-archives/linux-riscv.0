Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5CDC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 00:20:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E589664FFD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 00:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E589664FFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GwtrPJ1yrNYw6jFCYqQfH9GoZKmrjLJHd23Cx4kN/F4=; b=m5j/a1ENZGVvlqF2c+8J/d+Xs
	lRUu/8JhSBhCjddJznBcKBJbt8KRFh7eiawWskNcqyC4/z3ALZbIQ+OcN1O7r7SbZBlSResYAyyFd
	7pZdoJw74QKt1N8c4ZmEEycg3IzsDmmcC8gPjnnRCJtaTOaADO/Jws5t1tS8pT6y+wZgPXfs+D6Bw
	1WNSTrbsA+yySps/+x0OAOpylkjVzge6o4IDtoKYUa60iF/zwu9mSUmCyA5ufSh0GHm+jTNOzyHSv
	MT8vQ1vuP9bTvs66bUzbz1Ql0Fcoam1y2ptnksOh4U5G/bmqEiFOulMUyzFPq+qygbr8I4n0Tv5sF
	TS9GUDiiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJQ6N-003TvT-Sn; Tue, 09 Mar 2021 00:19:55 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJQ6J-003Tur-LY
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 00:19:53 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E8E6231A;
 Tue,  9 Mar 2021 00:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8E6231A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1615249190; bh=T4xWyxHpUqwiXaFkeoxDy/DZL6aBJz4AVIJoA7yp9OY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=q2ad1gQVW08cNOw6C/8T1MyNt9GrekRvDqbVWDoRXmxOUWEXvQT75EJX8vkBESpzM
 XeSU/zZ+wmpbPCicbX0mHoIg8JpJiw6bFFPth4sPzLBlg10EcJwTvbjgKzO7684+k4
 5wKcucjGNP0/qW02BzQqGZDxUeVhvQktgZ3P7Gsf88gvWS6ZHTwDRF7acLWJ6qiVM9
 uOtQM7EOnMMAMUGKef8D8X4gtUC338FLP6/XS4TU+817YGgh5vPayf3tHVCuUf07Or
 7lIwUeIb6+PjIkStlrxPfJWQca2nIL71N6eHoovM4acgKQAeo+KaFl3RjbnmiJgOcG
 1pwVYlRMJ7+QA==
From: Jonathan Corbet <corbet@lwn.net>
To: Barry Song <song.bao.hua@hisilicon.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Barry
 Song <song.bao.hua@hisilicon.com>, Mel Gorman <mgorman@suse.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney"
 <paulmck@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Mike Kravetz <mike.kravetz@oracle.com>, Peter
 Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] Documentation/admin-guide: kernel-parameters: correct
 the architectures for numa_balancing
In-Reply-To: <20210302084159.33688-1-song.bao.hua@hisilicon.com>
References: <20210302084159.33688-1-song.bao.hua@hisilicon.com>
Date: Mon, 08 Mar 2021 17:19:49 -0700
Message-ID: <87sg5541qy.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_001951_957715_4E9B7937 
X-CRM114-Status: UNSURE (   7.78  )
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

> X86 isn't the only architecture supporting NUMA_BALANCING. ARM64, PPC,
> S390 and RISCV also support it:

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
