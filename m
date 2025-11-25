Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F288D0EE18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zQ6zHT6V1ZYhrR3cLNpsC2xn0CihXOw6VFVaALpWtM=; b=cQFl9KvXIlYCuI
	kfm+GAobGFKSBAkyspQpdjxHMu8d/UuQ2/zduyfba/xG/WDKk8cCcDFROo/HoKLk8brAEL4VghwDs
	COh5PJPSO7bzSvvXmu7maGuJ0a5jBMTJ8vgNl0q6UaOtuhLCgFlcY5iGtxa606eb9nE9Yveb3Mm8p
	GqP2naG42voytQF2/GredByeTvorJyLQc1nvmFdZ+gNfkdSDo0IKEaOjiGhq903l6ASBAIFd1BfSA
	0d5TcdKeqH1hHuQ1aGU5bglp0s0IQSRjYXMN4/PSNy/M9bMQ0WEnqSKoduvc+GNf1CGnpXfaNopDQ
	QvQaFwjHgnkDUKpwqrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1TJ-0000000E0FN-3leh;
	Tue, 25 Nov 2025 22:25:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO1TI-0000000E0FH-3NDK
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 22:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B6B60017;
	Tue, 25 Nov 2025 22:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E488C4CEF1;
	Tue, 25 Nov 2025 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764109515;
	bh=kOAGR/KqspPyItnp0rf2agGCYa83gVMuGUl5OcgAgwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/fWmTxp3KMFVsF6pFY+p1eHy9An3NVrW46TjQ//bK8AFcoiLeVPe+mWoJyiQpugf
	 8l8iPyBPWvnzE82D2GweVCUuxTSHPOeWlOkaKRcgIKl0v1aG3MbYDQxqtr7z4WC1oX
	 THafLFPGl8bI9EFpoL14pVufZ91ZYx0VEqsgTz04gfFwB0NRVCQrXTZxQM4/weXKqq
	 0QMndYNUkpQoURHwmXqqNyQTXZJgoPkeZVVFulo3fuGpjxwVzKNfX2uefi0p0kY377
	 GNJcAF3vvY0dkRi9dlBXBVfM3TXnd9XYLU8msxudYF/wEAXPbTvqDcCgBh7eqA5KKb
	 wSM9R7F2kYFAg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v1 1/4] MAINTAINERS: add Conor to StarFive entry
Date: Tue, 25 Nov 2025 22:24:35 +0000
Message-ID: <20251125-seminar-mutate-27c4f0e52938@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=q0TlX6zWovTX+QJUsiQ0AsktiTFHZ40leT5iY163edI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlqOktKS8z2/KnXbL6y6vwJEfHFPhP90hSbLvkFeiana purtF3pKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETOKDEyHPF/cej3h3ViYpUX pFect/+i8P259oP63u3Lcjh2Tz/M/ozhn/7OZXLO554uMGYU6XB+Wtj46djdj8t9jMo/yeU/E/k ixggA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Sun, 23 Nov 2025 18:53:40 +0000, Conor Dooley wrote:
> I apply the patches for StarFive devicetrees, add me to the entry along
> with my tree location etc. This is not a functional change, as this info
> was in the "RISC-V MISC" entry but I'd rather not have the duplication
> of entries covering the StarFive directory.
> 
> 

Putting these on the dt branch makes the most sense I think.

[1/4] MAINTAINERS: add Conor to StarFive entry
      https://git.kernel.org/conor/c/d15cd50d1444
[2/4] MAINTAINERS: remove patchwork from RISC-V MISC SOC SUPPORT
      https://git.kernel.org/conor/c/d794a761c77b
[3/4] MAINTAINERS: add tree to RISC-V Microchip entry
      https://git.kernel.org/conor/c/76cc0ba2af91
[4/4] MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to Odd Fixes
      https://git.kernel.org/conor/c/56dfdf2da1cf

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
