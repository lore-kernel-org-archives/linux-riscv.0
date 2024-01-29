Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46A1C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gN4lCUhVNfZ/jYTU/k3fWHUe5rOnuk7Rrul1AJBWKM=; b=Cwrt1W4796sWZX
	b9Nca5wWI2f7dSPy9bDKFRy8LoDPH6YaRqYSRctoAz2QUuOPvDLxidKvTerYll6LmmVdD88l5MT/y
	vpON5HeSW6fJyn7FjUsdbslBjhUeAA3nbGv/YY0e1euvlphDVJpO9QG5jo1Neh7HDTQXtAHyUiPsI
	YlfM/bPl/PVTsNn/Xlxip2iSrq4wM0SdHjHymUC+RBdsQ7utCqQHDlz5vVPgtUUFUv3nsldKx8px7
	eZ+Ad9U1lY7rLCTQeA7M6x6Gn9CdfDccKK8XkIFm7uiQzn0gF1qa/d9UBK9aV4QWukEFPs1q9B4sL
	ekNbUNS74bvPCYrinrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWlk-0000000E1kZ-121m;
	Mon, 29 Jan 2024 18:54:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWli-0000000E1kA-0cnu
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64F9DCE16C8;
	Mon, 29 Jan 2024 18:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BDCC43390;
	Mon, 29 Jan 2024 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706554443;
	bh=CzEu5qWKd8Cnip7oCVpWovLE+N6XpsAhNro7glh+skw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H/iU590k5J/1ZHCnRtinqXUBquR4onGL3EtLX+Tb78uqKjck0mgwKTjIIDRscSWam
	 GJWcQTOHPrIsckZLxXSMb/rbqMAmLtjnYapYL8NTGqDcCTonIzlDswSuEC/Kvm7LBZ
	 NX3t0ChuqldKrezoY349eH7cuP6MLsvmpj0WTLhcO6HpZTzytxO4YBuXC82XxZYU7f
	 wN0BuMGZlY+Cau0SF/biX9URrcNP/NJ+8T1v1F+zyXlgE6ZMmZIetjkYMtAq/7Af6B
	 j3/x6BlmC6ZtPRm8IdDfY8GWAtNQ7OmoSfGrkGvzIzkK2Tqn1Epv75/pPcB1Pj9FZH
	 jo/bReiHp5uaA==
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com,
	Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/1] firmware: microchip: fix wrong sizeof argument
Date: Mon, 29 Jan 2024 18:53:55 +0000
Message-ID: <20240129-reshoot-rematch-2b43abda8b59@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125211933.409529-1-samasth.norway.ananda@oracle.com>
References: <20240125211933.409529-1-samasth.norway.ananda@oracle.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=463; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0cUwSdyFbRqVBTtaMIFna/eGaugU1edCjmm2daW2ieI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnbvzg1qHdmpR60KjsTPelg276fGy5OFfy2p3DTkhV8n f8L6k5Yd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiTfcZ/pfKbDs2ew9Lo8Pu R0Vak4+WLHvNzGjz+XOr9Ezdt1sqfdQZ/nAv4A9OmPWjyVC8WY636Nwp8/kLFc+E8vxyyrojJLN UkAUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_105406_385467_A5D57CCC 
X-CRM114-Status: UNSURE (   5.80  )
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

On Thu, 25 Jan 2024 13:19:33 -0800, Samasth Norway Ananda wrote:
> response_msg is a pointer to an unsigned int (u32). So passing just
> response_msg to sizeof would not print the size of the variable. To get
> the size of response_msg we need to pass it as a pointer variable.
> 
> 

Applied to riscv-soc-drivers-fixes, thanks!

[1/1] firmware: microchip: fix wrong sizeof argument
      https://git.kernel.org/conor/c/0abcac4fe3ca

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
