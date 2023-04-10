Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AB0C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUAT8ZaQSYQnoRyC126nIMMOSTeUBTThl/skVYdpckY=; b=CbRrsJ511u+iAT
	JhEE4FR7tuYCpbDTkapKLtjKnN1XG+2C4HSZc649axwAhbKr5Kwa77LCnlcmLm56lRm1pRca+1JOd
	gGnS6d6qdh0MgyUvEotpHQBzs5RgE6wh002OAleqkzUWuYeG7nVIColG1jsCeMYw7HqKPY+ZnzzHs
	C9F0BbK4/QageFFKvpoYMciSADdieXjt4+7CamDYM5ofp+EvAbWdy0tW1TOilDG8DBc0jb3tLqSub
	bil/gemTTRCK1wUTgYTUxJq/OP3Wb+MU6/pNFRRzgQ4hOKS0hFr2TcYksw83GB+C4cBB9p8JLaoBf
	xRwP/p81lvRsCLxSrcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plxhM-00FsRx-30;
	Mon, 10 Apr 2023 20:01:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plxhK-00FsRe-1z
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 20:01:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFDEA61EC4;
	Mon, 10 Apr 2023 20:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5137BC433EF;
	Mon, 10 Apr 2023 20:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681156865;
	bh=PR/yeP5ggYJVyJI7BlJL+FFHBpjj8PG7UidZk22cHyY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=byarW1i32BvM+CLSKo0WLY02E9BKd5Ebg3Sbbd7e/irTguplkWlbjf5F56AYxSy/F
	 FUQXGkVIkuONmbdMMU/zQH4qoes0EL2SiOcp1SvoR1ky3GV/jNb4XEwx94I/BrJUtp
	 wPpbXCL1P4tNAAopGUs6hXdjPEAROIIZHyzRpThXYsk6oAIsXws/KNcW5AUihAUUHb
	 zAWC+F4U0EYBcWlYGJ/7v8OCzhbsk6wohFX7PnPnve/FvQGEYRrEJNZNmKmdzfvaHM
	 QOgltxlqBH2UgffXDUIjmsx8KTxppevV+qo+Z84MtNHSyS/LGPI54NDS+TwFve2PVE
	 X8Lkg2epPMfvg==
Message-ID: <44961379683ad0afd30436752d78cc39.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230406-groovy-trustable-15853ac0a130@spud>
References: <20230406-undertake-stowing-50f45b90413a@spud> <20230406-groovy-trustable-15853ac0a130@spud>
Subject: Re: [PATCH v1 1/4] clk: sifive: make SiFive clk drivers depend on ARCH_ symbols
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-serial@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Date: Mon, 10 Apr 2023 13:01:03 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_130106_720504_6085AEFE 
X-CRM114-Status: UNSURE (   8.19  )
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

Quoting Conor Dooley (2023-04-06 13:57:47)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the SiFive clk
> drivers to use the new symbol.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
