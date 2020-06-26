Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F91C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 16:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77CC207FC
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 16:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZopCS3Pq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77CC207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wvy2eMPnIqX9koPrt4w7BjQ9wyo9riZ3nY8MqMBp12M=; b=ZopCS3PqOiTFhX+IrMgPmO9mg
	KFLqaX5jl3/hq1LnQ7+s1DL/wGoyXeaypxvUo4MA40+MMq5H8SPzYOPF6v67S3FLM9z4OeoYV1zEQ
	F7YqIQB1U6JnW82YAsQGjKSNmzlYoVT6iHhWA2bwD1R6l24ptY3uDyddGNKqfr8jVxmy+E1lF3FIO
	0NsdA2I0ZtAGh6cRzXVIGZ9G91p4bKwdZ25MxV5tqLNvl7wxsvrgSqbmWHb8O9Gd3d6d8K6Wkgzbi
	fg31LwW7XV8nnZLzBT7osox5aIb85vXAQzd7SWvFpWkLJbMBaM6B3G7kDnebCLCPlVfpBnEZ7da60
	xBZiQC9yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jorNQ-00044F-3c; Fri, 26 Jun 2020 16:38:56 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jorNN-00043t-Sf
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 16:38:54 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 648E0374;
 Fri, 26 Jun 2020 16:38:50 +0000 (UTC)
Date: Fri, 26 Jun 2020 10:38:49 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Shuli Zhang <zhshuli@aliyun.com>
Subject: Re: [PATCH] Documentation/features: Add KGDB support on RISC-V
Message-ID: <20200626103849.458a84e2@lwn.net>
In-Reply-To: <20200621123016.9289-1-zhshuli@aliyun.com>
References: <20200621123016.9289-1-zhshuli@aliyun.com>
Organization: LWN.net
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 21 Jun 2020 20:30:16 +0800
Shuli Zhang <zhshuli@aliyun.com> wrote:

> As KGDB has been implemented on RISC-V, update the feature list.
> 
> Signed-off-by: Shuli Zhang <zhshuli@aliyun.com>
> ---
>  Documentation/features/debug/kgdb/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/features/debug/kgdb/arch-support.txt b/Documentation/features/debug/kgdb/arch-support.txt
> index 38c40cf..8e5a6c3 100644
> --- a/Documentation/features/debug/kgdb/arch-support.txt
> +++ b/Documentation/features/debug/kgdb/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
