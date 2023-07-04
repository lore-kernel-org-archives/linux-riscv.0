Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68840EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBqRqDRdS+PUxdD/WIAh5ZilzIQ158V4JCbWqbBlkxY=; b=KW3Mj0tcXD4dmvW8xwLHRT058S
	/0in7SfpfLCa349MVxLLNvWDoSvMWDzsbXzUjfkTRoIb41GlA5U/vGVsRpDTWU17NFBdnLC4AgsX+
	V/sYc9OXL8//XModiTXX5/R9hARf7dP8JqI7K52qR1QaXND8R8q4zo85gqeao9CHTbEP23pEB6gAa
	DmgDpKFCnFRjgdH8QVfcvhoFNaNqaJLjwhS0osKy7XYP6LIc139RUz8zJcUbUBzh4J0xTtHa5vI/m
	0ay+0Ma1ATIiDjvMunrG3njGYCU3g2rGKNW6GLwUVT5jVGCTMD1DZfSQl0fK8GjvNaXpBdTakXJjj
	SrJ9aa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaG4-00CPRH-0U;
	Tue, 04 Jul 2023 07:15:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGaG0-00CPQ8-1Q;
	Tue, 04 Jul 2023 07:15:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9AE1761168;
	Tue,  4 Jul 2023 07:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1D3C433C7;
	Tue,  4 Jul 2023 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688454927;
	bh=Qx6SPa/FXBtKHsuhqwtcpwkMWYF76dpQTGSInwUFiQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fimT/YP/AwhUtgGvGKQgdcx3SzNIvCNt5RUuS9ji1RvM5vdWAfDmfhixbrbnTaj9p
	 Tk8ZV65fRATwJUd6IdHdAoqcns/a5N6xzLUlm4O/Tkj1HvnjwH4jaVpPJB1cwJ6lD3
	 lOX5CVIewQ7zemoDIRdUeyU5nmoLMFgq2q71zWD8hj56TNCZ/hqkLoObBMQ2lUrPSF
	 fNBR1YcW0VIUCrZmojkUIU99BpEZtJgGzx7Mop3MyaM9AiAUyDnuCZNBA2l4stl5D2
	 utvmVnQ3jYCiZiMu6XYBkbwnYdqOn5nwk3N5OH96xX1Uqx/6RnXygRzEXNCe7yeOi+
	 Ija1G9VDGSOjw==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1qGaFw-00ALG1-JE;
	Tue, 04 Jul 2023 08:15:24 +0100
MIME-Version: 1.0
Date: Tue, 04 Jul 2023 08:15:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, kunit-dev@googlegroups.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 296d53d8f84ce50ffaee7d575487058c8d437335
In-Reply-To: <202307032309.v4K1IBoR-lkp@intel.com>
References: <202307032309.v4K1IBoR-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7d3d61c694c0e57b096ff7af6277ed6b@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: lkp@intel.com, akpm@linux-foundation.org, linux-mm@kvack.org, kunit-dev@googlegroups.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_001528_520791_EB11A676 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-07-03 16:11, kernel test robot wrote:
> tree/branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> branch HEAD: 296d53d8f84ce50ffaee7d575487058c8d437335  Add linux-next
> specific files for 20230703
> 

[...]

> Unverified Error/Warning (likely false positive, please contact us if
> interested):
> 
> arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140

This *is* a false positive. The function is entered with a lock
held, it will exit with the lock held as well. Inside the body
of the function, we release and reacquire the lock.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
