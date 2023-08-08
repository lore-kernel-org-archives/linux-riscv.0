Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893EC001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxnreektqzJShfF6QMy0W+B2Qh7jZToCHTjK0ZRGhPg=; b=wo7xJ+aN0hqFKk
	i7BhHS88SV4uvehCcV2OUbBRLiq4eHrtk9zPnfLXpTxA9Ewu1GYxXAOMEj/7+GYWWhZoBzBrbQAIq
	r2ahPvFwV4PQ+QfB4nT1jC6F4NZ1YRr5xZyiJx/IyLIQ6LwtXm/x8mIKtcB9B7qf9StmpiRxxqvtM
	AaiN7JMqrJ6eV+xEAhdvvdnMbHkX6w5f3NUcXxPsGFkrjzMOVGxROtKPiPkjqTFMYGwrdOw8V2jwx
	WBL1L5Moe8yQw7+aqeizIb6Oa/FYPNwSgqUl0x0BimzttNQXsfw2CqgmTYH8iwa7xsWwR7zeNw2BD
	bf0OafVx+0CgouXWoVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKUF-002QwN-0Z;
	Tue, 08 Aug 2023 11:02:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKUC-002Qw1-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 11:02:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA31B624B9;
	Tue,  8 Aug 2023 11:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4241BC433C7;
	Tue,  8 Aug 2023 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691492563;
	bh=hOrjnmBvHRWa/gPz43eRdywRQ0atmS0NAUDdlupwrb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eA5Fz53PZedXwnRszgxstlozvYRwB9J+jxgXTpdqkaSQXclxq+a8yHT3bnuYO5oyJ
	 39ERNWmUSYkRX/Ln52APmjlzKGB7xc5Ov57aKcgMwj9bcu1pc9RE6fUG+/C/V5NLqo
	 rDdrPUETe88mZFCVZ0MRmZkQ6kLNbJG1Lts1zLhZBW+eMDYzK8x02oj21CAiWZ5BuT
	 SaVz7lqnAqBqgxpf+GJCHtWrQfEwHPfnkpqK/Qw8+CsVQolElhZvzZNmg7gsgXfFi7
	 wNCae1Z1fwB0pXcf2jjmS/f0lDwpMiWVLScASe53yrEOd70o5Y0FvY1YUaa3NucjgO
	 FawkjA74nvpvw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: conor.dooley@microchip.com,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org,
	daire.mcnamara@microchip.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 0/7] PCI: microchip: Fixes and clean-ups
Date: Tue,  8 Aug 2023 13:02:37 +0200
Message-Id: <169149233963.79399.5232296870054239065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
References: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_040248_587614_54D97AF2 
X-CRM114-Status: UNSURE (   9.91  )
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

On Fri, 28 Jul 2023 14:13:54 +0100, daire.mcnamara@microchip.com wrote:
> This patch series contains fixes and clean-ups for the Microchip PolarFire SoC PCIe driver
> 
> These patches are extracted from the link below to separate them from the outbound and inbound
> range handling which is taking considerable time.
> Link: https://lore.kernel.org/linux-riscv/20230111125323.1911373-1-daire.mcnamara@microchip.com/
> 
> Resending with correct e-mail address list
> 
> [...]

Applied to controller/microchip, thanks!

[1/7] PCI: microchip: Correct the DED and SEC interrupt bit offsets
      https://git.kernel.org/pci/pci/c/6d473a5a2613
[2/7] PCI: microchip: Enable building driver as a module
      https://git.kernel.org/pci/pci/c/2e245bc8a2ab
[3/7] PCI: microchip: Align register, offset, and mask names with hw docs
      https://git.kernel.org/pci/pci/c/4d6bf4c49578
[4/7] PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
      https://git.kernel.org/pci/pci/c/d1d6a0c9e79c
[5/7] PCI: microchip: Clean up initialisation of interrupts
      https://git.kernel.org/pci/pci/c/4f0b91247f78
[6/7] PCI: microchip: Gather MSI information from hardware config registers
      https://git.kernel.org/pci/pci/c/1abb722888fd
[7/7] PCI: microchip: Re-partition code between probe() and init()
      https://git.kernel.org/pci/pci/c/bac406c34fbc

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
