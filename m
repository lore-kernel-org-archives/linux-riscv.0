Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5871610775F9
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICKDNiL/njSlOUNr1P7GnGFlmcbeh3LDs7mMhJThMls=; b=A8a3kWoXG1KXewnlaDG8DJAALl
	XD+f4qiBHXSpdLtk/87vfehBq2fZ2hjj5q+N8BZophfZrVLiCf9YtnSHo2/sTaDG0TzhYDzv+M15y
	5ZVuLUlIUOQastZxDtZoDY4CJm/M6lD3EK8HxpCVhn5TogFvGYt/RBnGurnn4bkg3bTPQ/2BlDXV9
	84O98vA4C/bzc3/S0vWjtc7yb7Qks04L8mQ3/meyvdpRq72NYJCl9SqUshqaSCsUaOP3e0UNZGRSt
	zzkQOnt2q/4l127T6tQ1jikNEl7fEHrk8xLWsskjvBlJ5/wGAbFjSdpKI8cmmlvhcmbv3Jow2z1xp
	QYgNL7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uuW-000000096TY-3ulJ;
	Wed, 18 Mar 2026 17:42:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uuV-000000096T2-0Pce
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 17:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3202443886;
	Wed, 18 Mar 2026 17:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AF2C19421;
	Wed, 18 Mar 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855742;
	bh=8zKKN1pmyDuNOP9IFZ6JMQazxPmRneYZb7GkM0EWs1M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iYAEIkXCrx+/VEh7DepBCdOTKPwbvrbMFvjTsIWj/rqiBguk6+RQ75QjfHlMkIQ4v
	 PTG5SQq6AsjL7xtYZilcn6AgYRU82pofqSAoZrhhL59FYUak4m5cJqdcegrcHJPjWJ
	 8jIxEt3wImCIbcQU/kbaO3d/VyGmD2NFBb6CuGGUHczyc/EaJK3olq01mnk1kY+6A6
	 UjOXtjxsm/+addRwRZLayKye+WHXrPmZxtmquu7qkbJO6g4Uz1aBH755I8TJopmD1T
	 vKwEFlhWyH+RqDMVMC0hHb000gZ3YxGHwykfhaiWQjmMBmPCcMxfg4q4vKLCoKrDi9
	 gD83h3od9KNSg==
Date: Wed, 18 Mar 2026 11:42:18 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] riscv: patch: Avoid early page_to_phys()
In-Reply-To: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
Message-ID: <6ec5d4d4-f171-d41b-2705-a051bcb794e9@kernel.org>
References: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-310414524-1773855742=:215483"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_104223_158349_718751BB 
X-CRM114-Status: GOOD (  10.10  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-310414524-1773855742=:215483
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 10 Mar 2026, Vivian Wang wrote:

> Similarly to commit 8d09e2d569f6 ("arm64: patching: avoid early
> page_to_phys()"), avoid using phys_to_page() for the kernel address case
> in patch_map().
> 
> Since this is called from apply_boot_alternatives() in setup_arch(), and
> commit 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE
> memory model") has moved sparse_init() to after setup_arch(),
> phys_to_page() is not available there yet, and it panics on boot with
> SPARSEMEM on RV32, which does not use SPARSEMEM_VMEMMAP.
> 
> Reported-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Closes: https://lore.kernel.org/r/20260223144108-dcace0b9-02e8-4b67-a7ce-f263bed36f26@linutronix.de/
> Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE memory model")
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.0-rc.


- Paul
--8323329-310414524-1773855742=:215483
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-310414524-1773855742=:215483--

