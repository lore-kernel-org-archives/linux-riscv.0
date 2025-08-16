Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51E9CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqNIQOIts0Zf8LytwkD2XZF6OyA8MNuCHyVuo+J8AsY=; b=ydPszZXZkLLUj+
	26JIYArJBhoRc6QjpydCpuEWFkOEa01nCYCQPc+fsXCW7jdDO03QnI35aFyHgRh0tQftJB5c3G+DP
	fishZEaTnG5FumR01q4F8XNYQjhozeJEF3IId/vJBB/bpRjeyZF9lw5HSOznT3zcad68jfKCrebfm
	Pmn2qQeYWj4y2lG0elvOyCq3hDF2KjLVSdig3tY7Be62iFD7sg7Jhv2g/zTkR0q5JzodSG8zqw6oY
	By9zc9dKwXGQ7ARM8P/C478LHXROb8SyECB6sL7iWUV302CITw+qG4O9kc7UktJhowga+Tiu4qtoO
	Vk9+TaLqjR3moChY1ang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQ8k-00000005DKq-32bC;
	Sat, 16 Aug 2025 23:16:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQ8h-00000005DKL-37Jz
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 23:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8A8543924;
	Sat, 16 Aug 2025 23:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F6BC4CEEF;
	Sat, 16 Aug 2025 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755386201;
	bh=OHkAbGlDKsYvfqX+OzqqHwvaoFnMvxEZtaai09lKiY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTI2DQ+ZYBGZ3nagYB/0VvE8BZYgTsR+poCS+c20iBCA1LNtz+awi6X/uTLW93f4H
	 CTkmgeiWSyzoFRonRwF4lsgq8AqO1GWTfsRmrAEHJ8Sb/rCuj33jBhlVFIqNuvZ/zP
	 FGrl1zqsKj7JsawWickGyKG5x1qZhpK5RClHKalq9jt4WxY6ro7Qe2Z5BnepSjaj66
	 5NweiLL0qJiSbwQV4W6JhM1HYu97aoaL3MTtKqMhBD2eB5QrwV7G3T24r8+DFgjvYR
	 0Ha1aQKx5sODtppA0Lr4uZQttGLIab42iBgSCxky8bzF9hFajM6ljHVYJQvBywwoQ1
	 t8d3LpALm9LKQ==
Date: Sat, 16 Aug 2025 16:16:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH 1/2] clk: thead: th1520-ap: describe gate clocks with
 clk_gate
Message-ID: <aKERV0c7jat//279@x1>
References: <20250813171136.2213309-1-uwu@icenowy.me>
 <20250813171136.2213309-2-uwu@icenowy.me>
 <aKA9QxKo3fg-bdNa@troy-wujie14pro-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKA9QxKo3fg-bdNa@troy-wujie14pro-arch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_161643_800075_F5861146 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Yao Zi <ziyao@disroot.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 16, 2025 at 04:11:47PM +0800, Troy Mitchell wrote:
> On Thu, Aug 14, 2025 at 01:11:35AM +0800, Icenowy Zheng wrote:
> > Similar to previous situation of mux clocks, the gate clocks of
> > clk-th1520-ap drivers are also using a helper that creates a temporary
> > struct clk_hw and abandons the struct clk_hw in struct ccu_common, which
> > prevents clock gates to be clock parents.
> > 
> > Do the similar refactor of dropping struct ccu_common and directly use
> > struct clk_gate here.
> > 
> > This patch mimics the refactor done on struct ccu_mux at [1].
> > 
> > [1] https://lore.kernel.org/all/20250722080535.60027-2-ziyao@disroot.org/
> Should we remove this link to the cover-letter?
>                 - Troy

Good point. Yes, I think this would be better than a link as it is now
in master:

54edba916e29 ("clk: thead: th1520-ap: Describe mux clocks with clk_mux")

There is already v2 posted so no need for v3 just for this. I can fixup
when applying.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
