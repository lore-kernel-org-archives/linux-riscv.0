Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAFFD11181
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYAVE5PDCoTtwmQaaRiX9wH65EgBykRyRtpp8y1LFTE=; b=RWgU8ddKfckG1A
	laOMLdpPlvCwZ6Ef/8aeamhqEU9G8R3MD4Xe/Mvw5dY05IH3NNJjlx5eo3BUIECTZHaY2FuSzSF9s
	yWqgVUiS39molKRS2O/WMFbnm8vUhv8GAT5a38Sc92p6me7WwMPQ/+psyLYh9J7t7mgSRpsAW96Jg
	PRB44/jrGCw2Sh7nL+yUUPLvyG4uA/HFSjsSpDTLWFAzi3WJO8UTH4fLaGfgY9o5ELqR1EoT00Vcn
	SYwK7yP/NGmM3WOk0zJzoQi9zBqH31qgue5GLcwXJH+9OPwRyJhEptUE7ougl479nLV2ueWQw6Bsf
	3JOARYH68tNosqis1gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHit-0000000FCWt-2CUU;
	Wed, 26 Nov 2025 15:46:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHir-0000000FCWX-2M5p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 15:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5924040E07;
	Wed, 26 Nov 2025 15:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02796C4CEF7;
	Wed, 26 Nov 2025 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171984;
	bh=siTykx/z9aXu4u4cdZYkqgRvcZO1UfKi7lOi9dup+QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IxbEiu58UVYbahyIig+UROqDs4S0uIs2r0Tz+kd/H7oTpTvMP16TB6yNa2aJ94292
	 XH31Fhx7z4xoQ16SlgaQxBR4Sdo59RT3wQdtVXqVchoXmc0iJWdRlL+LLv98WH1G0D
	 3qRf9DCqHn4WNmOP7QzDRpg2r+zFQgLEyXjeDNbwEjvi7arNW6xV5yl4LohRLwT9+o
	 ebKVVT9Ho9LhiC+SXB7jwFMWFgmV87Dp7s/vEmi5x8Dh6U5tP0GweWStcvM2DK3byA
	 rfP5dw5+uioFJgwA3w2TSXaLpzzJbB9jREFdvhO8gFc9j0v1G6tRtIbP2rHVSEBqG0
	 Ync/uTSjkWNvQ==
Date: Wed, 26 Nov 2025 09:46:17 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 3/7] clk: thead: th1520-ap: Add C910 bus clock
Message-ID: <aScgyeV2ojGN9JC3@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-4-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_074625_629157_EDD767DA 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 01:14:12PM +0000, Yao Zi wrote:
> This divider takes c910_clk as parent and is essential for the C910
> cluster to operate, thus is marked as CLK_IS_CRITICAL.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
