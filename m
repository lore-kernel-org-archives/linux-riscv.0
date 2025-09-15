Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A5DCA0EE8
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 02:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdSErWWmole/8t7P48nWM9znVuZIx2P/8Pu+uzUBlhE=; b=aAeIqqTY3eGRVz
	9o3kplIOxC89ysRZE0Mu/lOdcfE9dtpRR/Ht4dpUHWAZ1L7yBw6btwN/DOXxUOSy2mQtxyd/G3vc+
	PpB1oVpThKczRA9rdc6keUdWPMR9PlWEdMUFBfjPJ4jbd6PU+z+xhoquzhOBTYgmwo4bQszblHrpR
	RjkoCHgX2d9F1SNwl0ILNVq7U3Iq84q2yXOJfCoD95Ar3VV0ARcdiCLbQsaOtrEJXwyCIf2bSgn+b
	s2hmX1xA+wbJfy+S3K8C+oAVXi8PGCl6X+YYB+rhlygcyNIZT5vJdSq7s94PSVLK/gdaDBVq1uL2U
	jPFbeCYca8bq53ccIszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxz7q-00000002aLa-2hns;
	Mon, 15 Sep 2025 02:39:30 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxz7n-00000002aLB-3Nz0
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 02:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757903963; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=m4nXMa/ws/fRzMbcI4Y9klkr9xQMmrM9BMlN0jLBR2Y=;
	b=JEqsgmE2LloNRH2oTZUJHlANMa4VxUVsBsPzJvTZkKurpNiZcQeG90yBwdXbBJydFDece00ocC5OSNzceFMaU6EhzqxcfspOhAiYm0kAyhQdc9u7tP7eXhVTbK+VFRk/aUGF7cBNBurk3vf/INYd/Q4GZtoXRiWKjAu2aSx54Yk=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wnx04wW_1757903955 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 10:39:19 +0800
From: cp0613@linux.alibaba.com
To: krzk@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	cp0613@linux.alibaba.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [RFC PATCH 1/4] dt-bindings: riscv: Add trace components description
Date: Mon, 15 Sep 2025 10:39:15 +0800
Message-ID: <20250915023915.630-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a1749113-0b7e-43e7-a603-d1cf00c6a03f@kernel.org>
References: <a1749113-0b7e-43e7-a603-d1cf00c6a03f@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_193928_345052_4024B828 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, 11 Sep 2025 19:24:39 +0200, krzk@kernel.org wrote:

> > This patch has added property definitions related to the riscv> 

> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94> 

> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.> 

> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.> 

> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.> 

> Please kindly resend and include all necessary To/Cc entries.
> </form letter>> 
> 

> > trace component, providing a foundation for subsequent driver
> > implementations.

Thank you very much for your review.
My next resend will include all necessary To/Cc entries.


>> +    items:
>> +      - const: riscv_trace,funnel-controller>

>You need to start following DTS coding style.>
>
>

>> +  reg:
>> +    description: A memory region containing registers for funnel controller

Indeed, the current dt-bindings are very primitive and may contain some
errors. I should improve and check them before sending them out. I will
pay attention to it next time.

Thank you,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
