Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ7dKh9JFcYx9YzwJ/SVklyp/aZACiXceQEdxp0YWGY=; b=y1lRLosi+uQtto
	Q3TG0S0VXctMF+jeLAfNdHSBZSoLm5Bj26gux3PeI5MWvrUaSJGKv+/We0iGoz8Vxg/xxJzRkLozi
	QCJtA1VK63r0ZnGgzIN9dxDqCLQxdR9V6HbqIUogY6wEsrNjFRwOKh6lac1Kiam26MPaV0uBgB4Rl
	Q6rLQPjMh/FSe7MO8Jz9mH9Gx5GkH81sVT6ctdojBth3WRlAgjRf/QccB36Uj/a+zM5rz/41fteIV
	YPLi0tu4e9h0FfSWW2d3tZi2MaO7rm6pB2RVlFbzB9mGGweNT5V5vggK7XcyiYdqob0gWXezDeiQ8
	Mba2ka/li3JKOQ9NLOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odx8O-004V8l-NF; Thu, 29 Sep 2022 17:15:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwkN-004KX5-VL; Thu, 29 Sep 2022 16:50:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11EEBB82366;
	Thu, 29 Sep 2022 16:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3110AC433C1;
	Thu, 29 Sep 2022 16:50:46 +0000 (UTC)
Date: Thu, 29 Sep 2022 17:50:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Liao Chang <liaochang1@huawei.com>
Cc: will@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
	rostedt@goodmis.org, maz@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
Message-ID: <YzXM4qMZlNWh/JJy@arm.com>
References: <20220927022435.129965-1-liaochang1@huawei.com>
 <20220927022435.129965-4-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927022435.129965-4-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_095052_178964_9BC6D293 
X-CRM114-Status: GOOD (  13.53  )
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

On Tue, Sep 27, 2022 at 10:24:35AM +0800, Liao Chang wrote:
> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.
> 
> Since I and D caches are coherent within single-step slot from
> aarch64_insn_patch_text_nosync(), hence no need to do it again via
> flush_icache_range().
> 
> Acked-by: Will Deacon <will@kernel.org>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)

What's your expectation with this series, should the arch maintainers
just pick the individual patches?

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
