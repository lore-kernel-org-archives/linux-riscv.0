Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F682CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4/xzZD7Wo4mUrTu96YyrjDGXbL3fQJgjlk3hkGM+5I=; b=3gJRuY/b4/Pnq3
	T5QLdF83bBe/CkrnDDIr5S5L331nhI1z5uvj/mtAFY88HTEj5atAC93vo2Bc/Zym3AZ29HXqMILQ6
	8BIAAaVSZAdTr1Mcx7TITSF9HVuQOxqWBGibtY5SWcIZdLT1NdhVaEsQjMl+cD7EM1AmhyMD82YuL
	o4J8vbkTkH50TK+EDdjuueUDEjTLe9drS15H1Swas42gFfDNlMlfiWElb2jiNJ1wu84BNk0HqP87k
	MR9ku21TaMmX5gkTdCcveIUWtN60Hf2PlbOsQprJCUadWqzwuAX7T+wo14ZhtGCnNvEKdm182bpvB
	1YBj0XoImL+nBmGQ6D0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAD0-0000000BOYr-1Asy;
	Fri, 12 Sep 2025 20:17:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxACz-0000000BOYP-0U1f
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 20:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28FAA601D3;
	Fri, 12 Sep 2025 20:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBE0C4CEF1;
	Fri, 12 Sep 2025 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757708243;
	bh=xzYM6gGITlLdf30EXs4Ltyuk3aaTOSZ0Cc0L+EpH8hU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bmPfeuVjIhl84bamQEp4dco3dnTtzMRRex4ZranpAvU2GbR61Rq0qKN61JF2rk+iF
	 is4dJBqAAns/liU28pVKtOT8t168cvkMOPoCot2HF2Lk2Ou49TQP9G2AdZcXM5LlCF
	 qPGLN1vJAYQiWk6tNDG+Z4R0Wh8ep7Du2erMyWW2sdC010MMK9vSg4D+NaHOlgG/yr
	 XiOM3OmtRm1QJoWPKcwYUSK52EF7YSBqZn/UXwtYw1oazRlrq0YYScRYM44dU0T6z3
	 AeLpXxSFYEQ5CjILM4U763KcCBSi8l4+IxTctvGlmSWaUB+XmSt1UW8PW/QNRIewzW
	 6WcmQy4uBLAcg==
Date: Fri, 12 Sep 2025 13:17:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yana Bashlykova <yana2bsh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux
 v6.1
Message-ID: <20250912131722.74658ec0@kernel.org>
In-Reply-To: <20250912195339.20635-1-yana2bsh@gmail.com>
References: <20250912195339.20635-1-yana2bsh@gmail.com>
MIME-Version: 1.0
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

On Fri, 12 Sep 2025 22:53:23 +0300 Yana Bashlykova wrote:
> This series adds comprehensive testing infrastructure for Netlink
> and Generic Netlink
> 
> The implementation includes both kernel module and userspace tests to
> verify correct Generic Netlink and Netlink behaviors under
> various conditions.

What is the motivation for this work?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
