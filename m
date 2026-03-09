Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9466FCA17D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TT1TD9ncGJ8QfeSG2STxZYR9NQ4zo2UGL0Z7+5hzgmU=; b=lQHGoMw7WVZlpL
	oys6t4+qdLaluIy9ZjfT6HlnmuWOcxxDwwuBH/9PeuvVtRrysIkIg2V2AG7f5/KoQ8UTT3X0JUTd+
	y1kVEpyK8pnXOHGFq1+LyLj0kOittrrBBoA2srFwQZtHfjSS6b8uf9ZDqIYq9XKa71scIb/2unC0c
	vm3gjLtyEcl2wYVTpfHwvf0Z4jVjMZ99PZ3rnbe8QrmQgzdj8vua/YgyPblYQVP2K7PR3nDwxp0IE
	rjKylQzBOXUEN1484CoPEz0jm4DS+oGYxXZblmqHOXhtC7KrGGW6jxeqT6oWK8Tf5Kv9ONscyV/ha
	bufd/VzgP/5v0EF40g7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgd5-00000008540-3mgB;
	Mon, 09 Mar 2026 19:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgd3-0000000853F-3nvv
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 19:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3E1B40273;
	Mon,  9 Mar 2026 19:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B9DC4CEF7;
	Mon,  9 Mar 2026 19:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085860;
	bh=r8c14+2vyTmPlq9oGfRHCFHsPV2c0IguH1Ff9ELKtwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujTEAw4SdMi7hxAru83WXXoqFLliRwMETzDnew/NQOGNi47FaI8sUSUDF22F3tLq6
	 BuWjAGsKG6IrMmpMbTDYUPuZQyR5FFNgJBA5UGJk4NLllWMjmgoVPW/XaKo6Hn7B0R
	 19f7sb6sl9wLOjoX0+FOwLR3GhbeUSf2vM4Vgggwla/Vc2LOquo/GQbMfO7yQLPn3s
	 v/SWN7KiHdCR0uVQ6SUNSBtmh70FYeCVfRdAiaIN7SPTqEzae9atx3taonc49K9SyU
	 SrSohYuTxV76EuJ3/Ps2PbbknRReD6MoSjak2GYuilG75sgD7pkzCxPIIfSmsUHY07
	 sXzdShm0tH0jg==
Date: Mon, 9 Mar 2026 12:50:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com, bmasney@redhat.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Message-ID: <aa8korcqvmH15nDW@x1>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_125101_966586_D7E2CF58 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2026 at 11:12:17AM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
