Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE793109C059
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 18:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaUtlmE5BYu/VxKl7LJle7Dd+cN/bMpnmEEUMFyBJ84=; b=fnTkNUDqIvH6LJ
	+FCHlHBxLaF46r5lJNnN32Mz9zpLjv7m9jt7Y+EOOHujO6XlRehMeaG9Bep0nLLaoxxivv0OuWXp5
	hPKkwdUDevStS6LGohxMP4T52HQPFbMTqWW1P5MqZtSn8QJ+cpwZLAZC1NodnX2o5e55CVj7uK4yX
	+zEwbliZbbVIDij84KSqavtzZl6nspm8vBO+LR+1K10ooquAxjAc3tRxCPceCDSHxRfDk1JbxxgCw
	CgCugfcKuRjEbsmSR9A8yUpsSvF7IzvQXRLOxWSrNJtj9QE7b+U2iCwE2n26KPqZeraOAf5OoQVlz
	maLR2LGT0EFucdYDTNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TRl-000000047Go-2dFQ;
	Wed, 25 Mar 2026 18:59:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TRj-000000047GK-3iE7
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 18:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F18660103;
	Wed, 25 Mar 2026 18:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD03C2BC9E;
	Wed, 25 Mar 2026 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774465154;
	bh=n0eip3GlQ6cnJdGulVbgfNgmyycPCz18n0bX5/Dk2tM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iMzQO9btlrbvV880MBgQStwlOhMcEykLA0K2FnVoIVPS3gq/x+RY0M2iZrw8t1+K2
	 ko2O1+I1RI61Xar9ShDRbsLQuomFq7RrbczDPcLMfyvHEweZ3T7LNkkiYFZEbqm1fu
	 UsaKXfKBfGxIZukj17gIjiKv2LAycTN79KqfcpdTbJ+dVlr4jEVY5jUL8csqpOh0BJ
	 RFaTaEZ/BZBJMwH21nFG9yYbU7zwJCUN62uNU4sMnZAb2NoscLxnq88TCJhHQTeKva
	 z09gJBsPKMN67mjQcatHYGve9PI/CRIJU0vV3z4ktryGvJRi2/rU3qK+cOUmwkxRqy
	 gWx6PpaEr9yAA==
Date: Wed, 25 Mar 2026 12:59:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix typo in purgatory end label
In-Reply-To: <20260325083139.15638-1-vulab@iscas.ac.cn>
Message-ID: <139fa14f-8940-56c1-4e8f-78d8141faee7@kernel.org>
References: <20260325083139.15638-1-vulab@iscas.ac.cn>
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

On Wed, 25 Mar 2026, Zishun Yi wrote:

> Fix the spelling of 'purgatory' in the .Lkexec_purgatroy_end label.
> 
> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
