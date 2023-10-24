Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D32C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTUrSCXwSZWaATcBDeRw6nTgTAlINgoXgLVxw5NecWc=; b=tWRHug9gx7JhfL
	RTylFyKfE44zsAn09JwKBUfyR4G3wwOQascIq03TwAcTbW7vyHzMfdb2hoylv4MczRNJAVBGgz/xl
	GoxfqSYjITWPJy7xh6pkeDKd0Qi6ztReIe3O8TaMMhS7ySkAWYY9pi8Wgh8fMXJmIg56WVokROkqH
	LqBwCu7bV16IVcC1S/JftwPOrMeVLJej7uXZ36gKHYK5eitBABePOR7f0lI/WL3LI9coi8vqPgZDk
	ovGpwVLZidDrMgSrWOxXP0ze++asYddYqS8wlGLkDNajvJTXBsPPxQvve9ZR1Cke3bmBeZaiPmlrn
	53IcUa6SyxnqeEGZXumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv87j-008iae-1y;
	Tue, 24 Oct 2023 03:30:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv87g-008ia0-2s
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 03:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D011ACE2367;
	Tue, 24 Oct 2023 03:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045A7C433C7;
	Tue, 24 Oct 2023 03:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698118226;
	bh=sNdRqHfvYq7veOCjqXHETnlhkGTBUDiKkQb4mBoQZXQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sYo+fWiELMkZXCMC1scpeZnUjKqB6MwNsz5XoFUZPyOMpTSltnjjT/XULT7braUAo
	 FGU11hdTvtF5v3cfZI+FlC8R5DV9vLry9HI2I0FYGDioCP+MYyq1sXFmt9ASEKKPDQ
	 nGSI4VgA5Xsd8YU8/KsZrV//FTk8EtDaRcQbWAVXxQWQbJxzuYE8EXuKKJfadcbwJ3
	 MGFWbwi1i8Fx09NNdn1MBsVkvTU+cobAG7Cauvyl+tSJmj19Hc1vCgr3k7R7ZL8dMm
	 WKeZcUFs9Xu5cZV5fpZBm6SksckMkUPwevEDKoz6zlQDaHsYGRuIa7QX2DBjgkOwt5
	 FI3GwpD6ZSQvQ==
Message-ID: <e1513c65969415749c7806d4ccbb7f8a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230725004248.381868-2-samuel.holland@sifive.com>
References: <20230725004248.381868-1-samuel.holland@sifive.com> <20230725004248.381868-2-samuel.holland@sifive.com>
Subject: Re: [PATCH v2 2/2] clk: sifive: Allow building the driver as a module
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 23 Oct 2023 20:30:22 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_203029_135659_928B23CE 
X-CRM114-Status: UNSURE (   6.14  )
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
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Yang Li <yang.lee@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Samuel Holland (2023-07-24 17:42:48)
> This can reduce the kernel image size in multiplatform configurations.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
