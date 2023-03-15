Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E71CC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRJrd9lQnmw/4fCouqTwOvkCKHps/StHTIZO2dzOSvc=; b=nNAGSREWUUtlp0
	2pPqOW6KmC3IbkJHFGNS16dmMURrUkhIxDAaBj8pIVF/O8MmkWkOaJm/flt4MEEGKvYYjEHpNx/OC
	p5KeQvEdo0Um42oMHqkqGCfTdtYV8Yw8vSNTvU6ukTZhKAYVlfN+JzcEe0mzRwWl0y0TrCXPn+CMJ
	SAs4pBTV40odzRxQhu5z6Vt7ntmZu7WxDUljecwqvVbXA0/uigTG9gC3g733lsreQdDP5R5354xDc
	Wa2qFHZGfiUQXY/rdOYATZbgQw1KRTnomnGN6N9U78LGQCJ/eypjr7zjO9OClaZD/4ezgNuqR8oKP
	DvwTc9g8Yk9CfaBbQAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcS8c-00DcV1-0a;
	Wed, 15 Mar 2023 14:29:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcS8Z-00DcUF-2V
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 14:29:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 393C661DA9;
	Wed, 15 Mar 2023 14:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF23C433EF;
	Wed, 15 Mar 2023 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678890594;
	bh=yeoozDGy68VvFH5vyT1Uvv1fHYGrzFSj4yfihcifBiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=utJE/6cMb3JgVNikhj5KXIVkJUVGjnQTuG5xH5dZmoxVyKAdcIy/hSqgcp1/aYN2M
	 kxWJIxUnljOpD9g4okXeDazyiP0QDyQAuXCmt6vC1++rJXFVn2xPRn0HZHk1CzIH4N
	 I1th88B3Y8nlpEo2gQtMDfzDqcn81ylGhBfeB9970RHbhD1lRaPgOcEZ0HYK7i2S1+
	 uQytbzX+AcsZiIjGqgkUaoaYV6jJiC5BMkMSNO1ngbH98gDnNfB35nJ1Ccz9pJWXXA
	 EFjByt3yNEdc0yPnspX2BaOQC5YQdxRI4d1PPZVuXZNPY33tH/y6zNAofnij49a8ri
	 e3av8CUdEUKhg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Jesse Taube <mr.bossman075@gmail.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1] RISCV: CANAAN: Make K210_SYSCTL depend on CLK_K210
Date: Wed, 15 Mar 2023 14:29:31 +0000
Message-Id: <167889030701.90562.14045600493618249277.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
References: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=538; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6lWFOE6LTt1oRZCLjVCboDlTzeAL/GgThgDMSLLR1N8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmC1zy2XghyrlbTZ4+vWbPxrvOPtxrfA/6n9GbVVywRn GgRVvG3o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5c5+R4XgFf83F+cVr2S2i thqfnRP48bnsCbtWNSZ2e9V988oifBkZPnD90TKKuhx97VsHy/3YXdPTAm/8/P30vsPbB+9CrzT fYgcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_072955_923798_B9036290 
X-CRM114-Status: UNSURE (   7.90  )
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

On Tue, 14 Mar 2023 17:10:30 -0400, Jesse Taube wrote:
> CLK_K210 is no longer a dependency of SOC_CANAAN,
> but K210_SYSCTL depends on CLK_K210. This patch makes K210_SYSCTL
> depend on CLK_K210. Also fix whitespace errors.
> 
> 

Applied to riscv-soc-for-next, thanks!

[1/1] soc: canaan: Make K210_SYSCTL depend on CLK_K210
      https://git.kernel.org/conor/c/49f965b6fbca63904d7397ce96066fa992f401a3

I dropped the common clk dependency down onto its own line & tweaked
the $subject a wee bit.

Thanks for the patch!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
