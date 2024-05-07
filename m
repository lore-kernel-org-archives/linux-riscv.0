Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465B8C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adiwiaVEJ3VQGHHqhgu4a8VRPw1wzAXuHToX5WwujTA=; b=lD2qSC2DhzQ3wM
	c/vPxnoBRyhsoIGWvTJg5rX9iFoIyAxUykgiqRfkS2aaMkAPcsRgwblvCuPA895IfZKgDvMG1jmR6
	bmFJoVo6nOV4hp0rSowVXHt9gvYfZHC1rwwRaGLBIHaSZM45aDHGMWxCh7LN7PZVqPXpTIhTY6BO1
	SvZF/EbQGQWVNTnUjrI3YE5lTEEorrqJeVRFzILZFb+qoQ/dJCHjbGiU8L/+MqalBPe03zWFHQcI7
	fy7t1o0JtueNf80F0EbdR/5rPn/6BbwVj9jeYCdwgWiU/FOkK/qpJoZHgJA6GjdDaHklxhHTPrQjB
	FbyJwBOyu+cUO0s9TaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RF8-0000000Cif6-48sv;
	Tue, 07 May 2024 20:16:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4RF5-0000000Cidk-1rti
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 20:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE013619AB;
	Tue,  7 May 2024 20:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBFAC2BBFC;
	Tue,  7 May 2024 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715113010;
	bh=cGaAkkEOXpEMKaanh5pAkmdxFKN5fg25gZkTzU10KXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzCd5kht5CJIc7xsbUMaE6HsmKbfChDDD1LJUcuBiK3Dl+rVaoYyxpGs8hZzE07Yj
	 dLBXaoXx5Gq1PZ1KzqqDoCBnjNZqGc1D0LxU2t1Ee4zW9Jjo/Nz0eDs1o6kUO97Jmb
	 tOKXF8acwihZSthw04n2tVCjY0niFo7R9e4iGQPMZ7E3t8eO7cvxtWEun7stK1KL+g
	 vTcwg8eo5P1+Q1n9ZqDiAGZBToF3iZcbcnSfteaF8owH+28/SHfw9XMxBeyxP4Axkj
	 Pjfzu9DUdhXHttJ2YMfT2jtHBGhR3FPHvkjWKeZqiKhVtUk5m2CxRQYV0AO/SPVbsU
	 SYq7FfQx6p1wg==
Date: Tue, 7 May 2024 15:16:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Fu Wei <wefu@redhat.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH RFC v3 2/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
Message-ID: <171511300571.994683.10040593951113632886.robh@kernel.org>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
 <20240506-th1520-clk-v3-2-085a18a23a7f@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506-th1520-clk-v3-2-085a18a23a7f@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_131651_549200_3CCE924A 
X-CRM114-Status: UNSURE (   7.51  )
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


On Mon, 06 May 2024 21:55:15 -0700, Drew Fustini wrote:
> Document bindings for the T-Head TH1520 AP sub-system clock controller.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Co-developed-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml        | 64 +++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/clock/thead,th1520-clk-ap.h    | 96 ++++++++++++++++++++++
>  3 files changed, 162 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
