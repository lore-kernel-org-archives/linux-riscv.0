Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B49DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=rLlAvhgJuC1un2
	tcnqKUsS9pz8SbOT5lmNBQFYe/GN/o4+/vQa/V+w/7w4+0gkgbX71AhRD9ivRDWNh/iOsDaEnf0/J
	Io22sRBRFjFwq+VetmAY6LOwzbC8vMf6MfRd3kbsT3CR9m9njjjhI0DFW2St3/az5BU8JP8DaIc0S
	RjaV7E4nEWA2AnIrhwgkuYJuWoGcioEoRMU9/2ZWK1AmfpU+JmsdxyxPfftJ595OF1b+BJ2nVyVJV
	Wdff2yksvDudjzQ1RTEwZQCDJkZyprfLsCX9NyoEFozcVV86rvWhUiMA86DT0TobuHe85I9kw0H/t
	J00fs4VUAe07Ni7lDt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouILh-00DCIS-0C; Sun, 13 Nov 2022 19:08:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouILe-00DCGU-70
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 19:08:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72DAC60C48;
	Sun, 13 Nov 2022 19:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0286DC433C1;
	Sun, 13 Nov 2022 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668366532;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X26f/2usIEKIqkYIuaxkcUGqqlOkmSnkn1p9yvoySrh92RVSM4SYlc4AX4mavxwNV
	 fiEaQMIOJFg+DEcOXqP53VtBGwFnyvt1dFMVVAYMkEcslKtaGVxNhmVEco6m5PdEyw
	 VEBTQNt8O+0OfzISXJIxT+f0o7WnLz06Yvq5mnJyJsKZLdW7/8+/aQcbohp28ZCZ+Y
	 inxoDSEL/W/0nU9NrMURUgutsDq2K7toltr2q+I8drx7gHhNw+UdzC8DMcnFlZwNZw
	 svHdJsJcbnomOpt7YN1pXHGZRpV1NP5wTRY9Uxe+6CEgkn8YTDORhCgOAlO0wqOtaS
	 ihbaoENZVTBzA==
Date: Sun, 13 Nov 2022 19:08:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 4/7] RISC-V: add rd reg parsing to parse_asm header
Message-ID: <Y3FAwMQNqXX4zLLD@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_110854_297519_73A629B7 
X-CRM114-Status: UNSURE (   5.47  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
