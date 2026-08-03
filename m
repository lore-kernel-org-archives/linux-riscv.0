Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1896CC55822
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZK79sX/m5IwZ6d0deE/1so/1GBpcTYAi8902HwYNcA=; b=h2KYVkfm7F0c/4
	RyxoYXjhzGG18u6+vptGwI+oKpHbcJffFpka8lI0mus1xymb46r91kbjs/7pHJ1RHkuwGepE3x6rr
	ZKv7SZbezbVyshRUq+6OtClD9unaIIY86hdMrHsu5c3Qxmqa0DbY+iGTCvX1dJuhBr26vbtoEWicv
	AHdXtAX5xLBdFDUAgb9AuXS/nWffHg5ib+jV+Kx3QQ+cCx1ImiN4j99e7/Q9vSW1naUogtQqdbKlS
	BPvGW+lVNb5MU6/bxWBGd5/JoKp3aiJdCH3Dfox2cozSNCCfHKvLuDaUIUpkf6XD+ugGT93VJCvVc
	wFOOrjCPs7LRgbp58IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwXV-00000000F6N-2zXw;
	Mon, 03 Aug 2026 17:33:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwXU-00000000F6H-1VfS
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 17:33:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C00AB416E5;
	Mon,  3 Aug 2026 17:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B6D1F00A3A;
	Mon,  3 Aug 2026 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785778403;
	bh=8Fm/jxpd4lxY2QmPOtJ1LkynhVMHF14h/QM4gxzLIbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QiXLM44F5j8VszqsPAiE9yuSCwd6NvklLNTcZ3wmmqoJ1QT1NIHnUVmKUr4+Wpt7m
	 pF/XmHeH/6aP3HmyLBWB/miKON6dEy0a5q0lOfL0RQ2vUiQ3VdO6CVR6eoq3F/lbeq
	 rBoJQH8a0sMYkSVJABCmE9VQij70tQZ76XCWvbMlJ1IecQj5rUAM3RYootT8/23nIe
	 Haxa6gh2dS6hcGrg5cTNoQHZzDjEvwBTO8lATKhYHdNOu0A85FWc4Ly3MEaGnMlkPK
	 kjr1xik6KzTxhWqiUlWAIo5EuWgEgIXcyC/x6xvMK+ZlL/0Mnml/+QUnq3LhtSSfh5
	 ezGAQNAzBJzlw==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
 adrian.hunter@intel.com, james.clark@linaro.org, pjw@kernel.org, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, cuiyunhui@bytedance.com, 
 yuanzhu@bytedance.com
In-Reply-To: <20260728033559.90302-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260728033559.90302-1-zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH] perf symbols: Skip dynamic symbols with invalid
 section indexes
Message-Id: <178577840310.2174330.11305121301334536964.b4-ty@kernel.org>
Date: Mon, 03 Aug 2026 10:33:23 -0700
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c04d2
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

On Tue, 28 Jul 2026 11:35:53 +0800, Zhanpeng Zhang wrote:
> RISC-V post-link processing can remove relocation sections from the final
> vmlinux while some .dynsym entries retain stale section indexes. perf
> aborts the whole ELF symbol load when elf_getscn() rejects one of them,
> discarding otherwise valid .symtab symbols.
> 
> Skip only dynamic symbols whose normal section index is outside the final
> section table. Keep the existing error path for .symtab, reserved indexes,
> and other libelf failures.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
