Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41934606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYoNqzDE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQrWB8KI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h5qWe43DWJwDBRdT8chG/HXaF+aE8cB+oRE9ST0LM2U=; b=fYoNqzDE+FcLruxKTZM34GwgqS
	TtaKdXEQwnDQmtMTaSERg5DFVxUFkHCvhSekdQdBSXcnkWIg8saH7IQXbV2qfvEirjjbvz/bKCt7W
	y1GOWsIY/F9LP91VR1rtwmU7uXsfK3JFmVBjKimt2IDTnt/W757bvCwQlSPw4tjfz+sUiafNwzcPu
	a55smsmfUHHGQrFnbFqRQzHmRG8FmXYLDcQ54tgqUdni0w74HHRzT45prarY8sl5KNcoDTbeo43Lz
	TjIcjiV9D+iC0+ObYaG9ryMy6+7xsadBEqZqtadDhutAQLzU/xcEL5DGftIs7x2/JT9Rl3wcElg+Q
	RwTBBg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMix-00000002Jx5-3sJ8;
	Mon, 23 Nov 2026 05:36:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMim-00000002JvV-2G1A
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 05:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9455B611BA;
	Mon, 23 Nov 2026 05:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E8E1F000D1;
	Mon, 23 Nov 2026 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795412167;
	bh=+Riw0vs1nf/qVwCWA8fCZHdXL/m4S1HemudqRL6ityo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQrWB8KIdn74BkH/FuJVbAmfFRlWg+t+SYgScG5xfdkhnQRwAr5MoPDUjreUwaWOh
	 lI4fZMnTh/mbV+vt8Giot/37Wk7IL0XAj9dQFrI7KUotzhGlTuzuCmKdQldrXq/g0y
	 1bO0UGddAE+XrFRzpTAno91RNLL+0g4Y5RvxcdcRZtocL7y29gIUiFWT6eBbmDfIJ6
	 Qnn7HA7exT00nw5PU30R2EO8rQNTgVSb6/IUw7xEUHzKUH+fnFOHcczKlBMrVTtmQX
	 6JF0K41utOvIm9eEsFmjF55HwzoXtr8HZr8OJDnu/OMd9sApIjT5objev6pYrrDw2B
	 Jr7QhJihPMC2w==
Date: Mon, 23 Nov 2026 05:36:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Message-ID: <20261123053604-GKH100890@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-clk@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome (and Stephen, Brian),

 I see you start to collect clock patches for SpacemiT..

On 02:57 Thu 08 Oct     , Yixun Lan wrote:
> The APMU (Application Subsystem Power Management Unit) register region block
> not only provides clock and reset support, but also the pm domain management
> capabilities, so registering pm domain driver via auxilary bus is feasible
> way to go.
> 
> The series try to extend the CCU driver to do some preparation for addition
> of pm domain driver via the auxilary bus.
> 
So, could you also take a look at this series? I'd like to see them
included in v7.5, it's a prerequisite patch for power domain..

The patches should be ok and still able to apply to v7.4-rc1..

> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Yixun Lan (2):
>       clk: spacemit: rename to generic ccu aux register function
>       clk: spacemit: register pm domain auxiliary driver
> 
>  drivers/clk/spacemit/ccu-k1.c     |  1 +
>  drivers/clk/spacemit/ccu-k3.c     |  1 +
>  drivers/clk/spacemit/ccu_common.c | 16 ++++++++++------
>  drivers/clk/spacemit/ccu_common.h |  1 +
>  4 files changed, 13 insertions(+), 6 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261008-04-k3-clk-pm-aux-7376407466ac
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
