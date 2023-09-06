Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5423EB8FD2
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrTsztveLzXxfFpTVB9NHLw7PKea4HRDjr9Udw2v73c=; b=Akp40XuHZ2DrA3
	7yoXioGepAhv2/TJrqMKyobFQ/+JbRyF+iWpsQvfgSy1W+cdIiu054WAcWx1sQ1Mv/8NWZimDmUxy
	ZwZfj7Y1jT9ae1Nf0OAA42TmzuZTwhxZxRxpMzniCzrzExn3Ju0Kc/2F5IudYZ9bPx+NZ+vLqOCRY
	IewYzg1JEC2skk22ZHHE5ZqQkhAu0mvAvgYJyThrK3PfaXYlL7ijWonzhQsxk8nYORINu1JklZnJ2
	QkFgeMLQ9GmbLPh5qnOTVzt1LBofnjNqWrrCSm1fjNNxUTzNKvXQx2uGpoOa9LlFIA8dBTrFTGV8I
	UmgR34YKnj5YwkASxEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt5f-00A9fQ-0S;
	Wed, 06 Sep 2023 14:01:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qds8z-009mIF-0E
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 13:00:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A15B4B81897;
	Wed,  6 Sep 2023 13:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5769AC433C9;
	Wed,  6 Sep 2023 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694005226;
	bh=1DP3Bq6tXhJvAfMAEbUn0BCiRTI+8UxsMOSoViMeQfY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o87OEplqy9kFJSqA9FRIvBR2dQfoCZRXkNhvuZD6a+x1g/KKXXDGuJK1slIJcdWgW
	 3zQNUIZTHcbBveMapQu3MPBTtp4vJVqwdhvBjS7GVxNLTi9oHzgiq0Jloc9L+7KtMo
	 0Vl7Bsipcc/5qMXa6NCdlmeas9aTJTs3gJQmy3qa39nNm9lrQlKsag3L/fi+zEoSrH
	 BP6fXWXJ+Cs7sauKa/mklzysY4rgzjSdIaISYsoUJ5VY0bgIV25OI/tOhS/6ghgZjn
	 TFJ3SjhcQGdyp8BGLS1jS7UG5a7erdDVoehA1YDaRq9kpFrXws9d0dtuSpS2eIeZP1
	 9HJxw3ue7BqKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B8ABC0C3FD;
	Wed,  6 Sep 2023 13:00:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] riscv: tlb flush improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169400522623.22081.12040343048151715310.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 13:00:26 +0000
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
In-Reply-To: <20230801085402.1168351-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
 peterz@infradead.org, mchitale@ventanamicro.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_060029_283641_E051AE95 
X-CRM114-Status: GOOD (  11.32  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  1 Aug 2023 10:53:58 +0200 you wrote:
> This series optimizes the tlb flushes on riscv which used to simply
> flush the whole tlb whatever the size of the range to flush or the size
> of the stride.
> 
> Patch 3 introduces a threshold that is microarchitecture specific and
> will very likely be modified by vendors, not sure though which mechanism
> we'll use to do that (dt? alternatives? vendor initialization code?).
> 
> [...]

Here is the summary with links:
  - [v3,1/4] riscv: Improve flush_tlb()
    https://git.kernel.org/riscv/c/1245a70831b9
  - [v3,2/4] riscv: Improve flush_tlb_range() for hugetlb pages
    https://git.kernel.org/riscv/c/9d6fb1015281
  - [v3,3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
    https://git.kernel.org/riscv/c/cfe5187b7e93
  - [v3,4/4] riscv: Improve flush_tlb_kernel_range()
    https://git.kernel.org/riscv/c/bbc9ad35b51b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
