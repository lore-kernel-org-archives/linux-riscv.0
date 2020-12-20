Return-Path: <SRS0=wI7M=FY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042D8C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 00:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D862389F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 00:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D862389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4NBzebELafh+rZPRzJxsxLz7IPX4hAGKv40B5OS9KZk=; b=nM4lkosmJnLpmj26AhoHFLcLC
	MRNY+k5vpX8RH9ZaZgXNcq7UuIOQPgHHslHP9qo/Z88AGxXK3jmADszSeP2YfBcRK7bDn+oxuhOfV
	+u3qR+xXBiMVQaue1qcnBVqRlaZRjfRBKa55+V2sSpQiJknExdlYIND2mKe9/BTz7Gaa4mlugR1dE
	ruL72OgczL25PGFlVxfFmBxjSIxk3OkEPIu3MZuHsoq75/WuOFj23o1emiVIR3pARRHZPRvP6nDEw
	nH7wj//UYdY2RLuV0PvVmRESEabhY9saygHTGdz9mzyO6ikI6M3mDPqO3V0DAaN3VhIBO+KTHE/nM
	wN+IDIaAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqmD4-0007Yh-CE; Sun, 20 Dec 2020 00:04:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqmD2-0007YO-N3
 for linux-riscv@lists.infradead.org; Sun, 20 Dec 2020 00:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608422662;
 bh=gqMTugewts3Hb8LJ33K8G/Tf7vaLtKfa16r7eCRI6gU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XoTOBxrYnoyRperv63KRlKk2+OR/42U13vK+/c9DHz25UKw38Sys+vGyJsWA+jv/F
 z4MrZZnb3nSWmTb+y9Gv8RIXY/Hvrt1lDh9DN8gLsn1CD/ELYUxSgEDMo+y9BoLv8X
 iBjNPxPBrGklNIyYSLAMuWUgUpKs6TvF8zTCum9IqjJ+yFgpZkFYuids2E5hoZZ0hU
 JirI8P1oithOR8emOnXzPj58XACEmMptMZCvqpB+5kBNZngup1mN9OJVXWZUTN/ko9
 7mGg3O+aaaF80cvVSbzRqZ7q+QGrBvkktCB0jabh+M1RUtnOXL2V9/NnA3ZYSmVaoz
 UCSv6rtV5zIRQ==
MIME-Version: 1.0
In-Reply-To: <20201202123446.21902-1-info@metux.net>
References: <20201202123446.21902-1-info@metux.net>
Subject: Re: [PATCH v3] drivers: clk: make gpio-gated clock support optional
From: Stephen Boyd <sboyd@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
Date: Sat, 19 Dec 2020 16:04:21 -0800
Message-ID: <160842266128.1580929.15786525540819499647@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_190424_835223_41FAFB56 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Enrico Weigelt, metux IT consult (2020-12-02 04:34:46)
> The gpio-gate-clock / gpio-mux-clock driver isn't used much,
> just by a few ARM SoCs, so there's no need to always include
> it unconditionally.
> 
> Thus make it optional, but keep it enabled by default.
> 
> changes v3: default to y when gpiolib enabled
>             fix depends on gpiolib to uppercase
> 
> changes v2: added missing dependency on gpiolib
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
