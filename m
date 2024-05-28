Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A741CC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHdeWSev2QxRVmvigaCRdnQfNWINkM9C+IubULinZnY=; b=1qQNbMdNPXNWyU
	WkR65E7cqSkyQacA0zbX0+YprBINgEbuLOGaDMHexNLiuQMNM3aqDEV6pV8/Fuk+KPjqToL3iYDGf
	cJ/xXwETvT6IZ4GW82HAnPrXJ120plhv58UowZHiuSYsBVbWqIEQWKXtvOPVyinpkix0SvBCnPZC5
	kkkF0nvno2zvUUoKuXwx0U8s6fG0rjJx4nm6oQGZ7qvk2thTaqYfLStYQVy55m9QlnpRs2AAlDEyQ
	W4GdfTOyrp9pVFoPaMPQ3sQPGVTTBqiG8wvbcCuhImzFfMvIrFxHXMIgkSyU7hHQFUkyeMzspbZ5x
	mULD6Ar+BhrnJ75YBpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBv04-00000000MEv-1B65;
	Tue, 28 May 2024 11:28:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBv01-00000000MEM-07U8
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23605CE1174;
	Tue, 28 May 2024 11:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5B8C3277B;
	Tue, 28 May 2024 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716895690;
	bh=vjEv9p4ao6Y5ZHViWdaOc/j4X2E7teuLXNwZ68jp9Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=THEVKOnNiLFdPYcAdsIznrPdRdkC6RZVTocC6/Ve14PBQ3UcQ5qCCH69RD+WE1ZPF
	 yoVUJIgzuOUrWTW3k7ZH1KuszD+QHMtz4x8i+VtjDR7vZPa6imgzwXaG66LsfXTq7c
	 AAOKpO6F1XUbRpXerLUubtwK3gVSMOhdo0ntwvX6OOke5jVsNeLQKQPewoskaxLAiJ
	 VcAjByQGAOMjzNrVLwdtawiEOqp9Rcb0epXENSAqxpsZq6/e8DamWC0HgPnAIRz1Cp
	 fFX+RsYuNt0NbRxxnxb2C88TU7/nGHodWO8wxGCIeWVtFhrYdd4IO/DrPOvQ8meXfD
	 2ETaMkAYcWqgg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Damien Le Moal <dlemoal@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: dts: canaan: Unused devices cleanup
Date: Tue, 28 May 2024 12:26:29 +0100
Message-ID: <20240528-starving-overripe-0352bef3b811@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715163174.git.geert+renesas@glider.be>
References: <cover.1715163174.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=511; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=imlwy2HZD/oXMqJSCfm2ctuuHbtyRNrzgX7i0tfGZCs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmh+5OX5/P7L/zWIzjhj84S508vHT7//T9r1YKX/N9uK Z7StIve3lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJCMUzMsyNmDlz3Z7rTelF vLP4l1kvdU+zLeIX/bC2kTfs+/0rmxsZ/um5T4jQE9bov+pTu+3//DmTGXV2tjcILZv6vP5vqPn xGj4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_042813_275055_E5813BB7 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 08 May 2024 12:20:56 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series clean ups aliases and device enablement for unused
> devices on Kendryte K210-based systems.
> 
> Thanks for your comments!
> 
> [...]

I've put these on fixes. I think #1 is maybe stretching the definition
of a fix, but #2's fair game since it avoids runtime warnings. Thanks
for the patches.

[1/2] riscv: dts: canaan: Clean up serial aliases
      https://git.kernel.org/conor/c/9235784cb63f
[2/2] riscv: dts: canaan: Disable I/O devices unless used
      https://git.kernel.org/conor/c/2c917b55d665

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
