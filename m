Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86946CCA482
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbfM0odrF4FF6NWfyKYpH+2sapxrftRHbjQsHEE7uDc=; b=wkRi6ARWUunWPP
	E2+l5DZbzbgYZPcqXg2p2c5gL64PZIiU0iyMBZ4fRmfdNnXEfuzxJcZPANwrtCL073p6p3/SJ7nfT
	wWeFS0lFBGwqqTu3yjkyeHoUdOE7yYkh9P5S7F3nSJVC+oFvpXnqK9NoFY/mpryP4vw0nHkY1HbOj
	dm5AJifC/UHi5xDjXCbjVJFQqaUWbJ7XPVH4JpzhyuU3KQPvZ3gEEHZDxBKZV5UIAPFxzI23kMhmA
	RAEoDTdsKdSt+c9X3M6tqyBsqWP/8cfRuseKAew+fL4zy1+57z6jO2AHDnrja2yrOcku7mM/JyS7m
	LURvTRdMe9uVOPqtzbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDtMk-00CECU-7Y; Tue, 19 Jul 2022 19:58:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDtLM-00CCH8-Bg
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 19:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11011B81D0F;
	Tue, 19 Jul 2022 19:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAEAC36AE7;
	Tue, 19 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658260638;
	bh=dAV8Cn2BHo0VdEU39zpYgZQsltNwkPL5D/c6N3OKgrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugEb9v+XeMygMA12I/m56Q1A3V1BghDiwGl95MogHjs5oIRwjqkSL7odgn+vCnVbY
	 Vebm1NJJHrNGClQRDdt+Wfo0IFhsjaPH2Dr07oxr7nZgmZh5JqsRWhH+3OppmgoKEW
	 4ywWELOZl64DErxtEd3vBBz1s0zRV0NF5KZTALGzBKpKRYzgppkOtY+oCJqGNmp8rI
	 U5f5aqoLSC+oXKfDnDwiwgAPNfa6iUe9DQOH9anrw3/0eWyKga0pWOQ9j2oLceKYo6
	 8PLtAqVVQgceUQCBwlmw9BAH6CxTfTuhqOZFUEza2bxNof1yW+okkzrdyP/bRpOES8
	 UnrQNEs0zynDw==
From: Will Deacon <will@kernel.org>
To: anup@brainfault.org,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	palmer@dabbelt.com,
	Liang He <windhl@126.com>,
	atishp@atishpatra.org
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] perf: RISC-V: Add of_node_put() when breaking out of for_each_of_cpu_node()
Date: Tue, 19 Jul 2022 20:56:56 +0100
Message-Id: <165825243199.2952876.309608295027654721.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220715130330.443363-1-windhl@126.com>
References: <20220715130330.443363-1-windhl@126.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_125720_573858_6B7EEDA8 
X-CRM114-Status: UNSURE (   8.61  )
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

On Fri, 15 Jul 2022 21:03:30 +0800, Liang He wrote:
> In pmu_sbi_setup_irqs(), we should call of_node_put() for the 'cpu'
> when breaking out of for_each_of_cput_node() as its refcount will
> be automatically increased and decreased during the iteration.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: RISC-V: Add of_node_put() when breaking out of for_each_of_cpu_node()
      https://git.kernel.org/will/c/491f10d08fda

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
