Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D045ECA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daXlH0Kn8E1TRd85J30Ekk3KWAXxojVFWMcE4tT3tFo=; b=L9tmTDqrbAdOKl
	YIj9GyKPrAKKFzIHYvvOkFzp1BjvOVmQvKo5bxbeFEnmfLHBlvlKrq+wnWuydITS7zICO5kDQLvul
	65SFKfS2/tPJC8X++oxDeBfQyqICIbmIIVRRsV0CFzvvSuTq+H8haHgAvoAXch5vhBwX3F4cAptal
	4YG96u5EZFv6b7lvJGUMy+97ux4b61emskl48FR42ygv54Ic7h8TT8vzQFEkmlNAA6EauXA4dWjiV
	esRqvk1t834MGQSGIfzEVhtjhrsg12G25BZSNxnXcY/IwZfRdLJXOWklN3nSJmoLFNPhjNGq7xSiy
	Nt6lD6vNxt3N0kJE2Xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un47B-00000003jB8-0b9r;
	Fri, 15 Aug 2025 23:45:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un477-00000003jAP-45e1
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 23:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EABEA58444;
	Fri, 15 Aug 2025 23:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB8FC4CEEB;
	Fri, 15 Aug 2025 23:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755301537;
	bh=g68O3WmYOhk4y5L79Ofa0c3kpmvbkMRbUGdK4BAXSrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAocX+1XJ55zDaEfebP8eiItlhPcEHOFkcM8AAnOFUHjfUQZjIHRIu54XvhsRnYLW
	 X248Ua9VPnXnKIUrafSn3+h7l/XhKWoB4eLmAX5wlpzfaH8/0vS0X8czOTA+ASzB0f
	 dm9xpwP9Wdn64dMZkMJQEse9JfdW+abCZXscpSSmwI47YRqgevHpFPs/baByOAIR5M
	 woPb7GKTEm6uWNDgjZJCvIHjGIwfpmBBhrLZGm/7y6YtqpHEDSkU42I1Vx8b+gTZUd
	 bWFtBe7D41YF2EzFcuR1zVWK3CTOoM+L43sG72lVF7tuTGVc+OP56Es5BGtG0Kp9cQ
	 gbHrpTQN6a2Pw==
Date: Fri, 15 Aug 2025 16:45:35 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: thead: th1520-ap: describe gate clocks with
 clk_gate
Message-ID: <aJ/Gn2BeN4w2Yy9y@x1>
References: <20250813171136.2213309-1-uwu@icenowy.me>
 <20250813171136.2213309-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813171136.2213309-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_164538_076493_850A2EE9 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Aug 14, 2025 at 01:11:35AM +0800, Icenowy Zheng wrote:
> Similar to previous situation of mux clocks, the gate clocks of
> clk-th1520-ap drivers are also using a helper that creates a temporary
> struct clk_hw and abandons the struct clk_hw in struct ccu_common, which
> prevents clock gates to be clock parents.
> 
> Do the similar refactor of dropping struct ccu_common and directly use
> struct clk_gate here.
> 
> This patch mimics the refactor done on struct ccu_mux at [1].
> 
> [1] https://lore.kernel.org/all/20250722080535.60027-2-ziyao@disroot.org/
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 382 +++++++++++++++---------------
>  1 file changed, 185 insertions(+), 197 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
