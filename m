Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42D2E8385B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKE5Cb1zDh3rjUrSTNh9dhNeTYrkVsM5NyED5qm/gxQ=; b=Dv+azTjz4mQpb4
	+DQC8rHAWlM7zyUYxKgmJpNCfHmmswdmGcLrht1dfcWpsdC2EUoF6/VZ98+xuhWAmIAub21vrhZtn
	EdSJUs4IUuryy0fGnHzW4pxmbmrsEz3t8krlEsDKoXZB367n+z79gKQEnLIUPHJbznqxK36xhG57P
	wepKT4NwYpP535GwPB0E/yjeGpPyG95Gsb+4mGRHT4sOpyNWrjcPVhvdrsC8ekZlokntgFksXsBWP
	61wpuCoCvAtyKiPrdeEQJpmg0aF8ZDak6tnfCAqD1229uwKuZvCCg4a7sEJI7VD/6394De1taC6AD
	ZToexyGkKfV5w1cHqL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFps-00000007n6V-41zf;
	Tue, 17 Feb 2026 07:49:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFpr-00000007n6M-0NcG
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 07:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CB8760133;
	Tue, 17 Feb 2026 07:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4CEC19421;
	Tue, 17 Feb 2026 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314570;
	bh=kYYBancBu+lFZyanAuxjxi4SoPi2qUnGY2AgwrpfAVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/bNmmGhKprNWY1Lt8qHYzZpmiiDGpyjXBPe9Sor9UqW2d9eT3FMd1JokwnteqkGW
	 kBkK72mBNWTdMGVAT1RVdTnWMg3KPPCKtO0QPwknj1OSdk7yQ3+dElaK4JCmlo3LMC
	 z4yprDA9Ugonq/pzqvvHrDGOIiJG75yeaQC/OFbAQh+E8M1c01Jx3JnrH8Zh7P2LuG
	 FsGakJbevg3YTr/hOoCRgqihgSlo1h7V7IaoSfiN2trHqpWpA8MUAnURKdC9mks7py
	 nEfGqmmJVxJEaoz+f29Zaio/MdXbfGjIwg1xzbveBXje/93JYIon7PD+8ewZIZWQSl
	 SqzEwHhqILo+Q==
Date: Tue, 17 Feb 2026 08:49:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v6 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Message-ID: <20260217-nostalgic-manipulative-saluki-eecf43@quoll>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-1-cb46d6a59c73@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216-atlantis-clocks-v6-1-cb46d6a59c73@oss.tenstorrent.com>
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

On Mon, Feb 16, 2026 at 04:16:32PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
