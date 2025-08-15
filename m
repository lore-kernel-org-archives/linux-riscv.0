Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BACA0EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bV/RAec1NegDAlAqb6E6LP53cqDdRgLif/mhGZ0O7dQ=; b=Xj1yOidQa41lp6
	Q6iBrrY98VQ79wPUj0VcmONAxVxwaqOW2nkFFLp/z4yKTUYiG/HLM/ynBMvBTqag3lfPEsR596T1z
	dOHH1NI3S87zF7BnW8RaI+I7f+zca4pZPzOjXstcsRgfoLnBzC5lztDAm/T4lpUkHmCzQ8UmXDmHO
	2P/xY+IRwAxvcXK3UND8O/pWM6NtGtKB/5kqy6IaMiPwJGzAEWxyerUqq/KrzieKJvgBpAedvYdg6
	LwIVFiTTiDdta0RAHExZ9OcpNN7RBfbAokxoVemqaslVmy27UhgDtYN3ZUAUizfv5icOOv6yftq+g
	PDkylhpu2COfar5UkpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umius-000000010Jo-0yuZ;
	Fri, 15 Aug 2025 01:07:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiR6-00000000vOO-0gZm
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC2775C585C;
	Fri, 15 Aug 2025 00:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B81C4CEED;
	Fri, 15 Aug 2025 00:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755218206;
	bh=tStMn6cXffkABhKDGFsldNpRJKwVGbfiZhtguFPxof8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFcLuPKYFk93wVJI5GEXM8c8m2Ugh5j3GZ1C9JAfKbdLRjVlDYAZpTFlSRNU4LiGO
	 er6ll6LEi37Xx/PRqbbZbe28rf/YNZM+/6+s9NIf5at3NktUreq4KwXa/0n2yWOCAD
	 Ai4BAf9kDu/HlLmZRZZVpzSJSVqVi3lLKEUsUf9pGS+4NcLTGIuR/wqtKOGJseXTA/
	 qGFTfBxKbZQmDhek4MgeGn20eLb4UPoN8ebpjjjf/ixBYiU1MqTUHd25Ys08DJe6lT
	 nfCt4JrVSME16FsY7d/v0O9i4WS7iAagsVSNg+GZyZ6XP+DnR4q60ef3tp6Q8lDU07
	 OukDmSN1nJ3sg==
Date: Thu, 14 Aug 2025 17:36:44 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: thead: th1520-ap: set all AXI clocks to
 CLK_IS_CRITICAL
Message-ID: <aJ6BHNcf2e9x8QmF@x1>
References: <20250813072702.2176993-1-uwu@icenowy.me>
 <20250813072702.2176993-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813072702.2176993-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_173648_242140_34218B6E 
X-CRM114-Status: GOOD (  11.14  )
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

On Wed, Aug 13, 2025 at 03:27:02PM +0800, Icenowy Zheng wrote:
> The AXI crossbar of TH1520 has no proper timeout handling, which means
> gating AXI clocks can easily lead to bus timeout and thus system hang.
> 
> Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
> ungated by default on system reset.
> 
> In addition, convert all current CLK_IGNORE_UNUSED usage to
> CLK_IS_CRITICAL to prevent unwanted clock gating.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes in v2 except for rebasing error fixes (which I sent as FIXED
> patches in v1).
> 
>  drivers/clk/thead/clk-th1520-ap.c | 44 +++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
