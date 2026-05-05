Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B556CCD3430
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsDEd9tssrFff9QN7t1Id53XYP9bY72RbzS94xA1AV4=; b=wJNIEE9n491p2m
	UvQoF4IDeZerjpebB6h1A5kTBps8R0Mp+IPYwMGpLGcTkxehiH1ohnrNUimUmvAD9SCAkM53AJhM0
	3FWSGyohlcNSFqEZLs/+KoKhTVlXyAjhUhXlpO7y5JslSp7xselDfHyutDabDz+waeu4hBIl9ijyE
	Kv2bO6cnYseByZsRUOiRawCxoTpKJb2GGPetuI+CyGj1ZXt0nv9YOrI51cNF8UqvuWKL73ybNkwoQ
	7Kmgk5MQKSGdOXzT8K6lmFm3JP7MUrbZ+5a7DtEgLMZVBhztl6MHY585CH8Ccd1Cn73J59fhRQBl/
	axNBvJ4FSMRoOI3eolUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBWm-0000000FaN7-1TUd;
	Tue, 05 May 2026 08:53:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBWl-0000000FaMw-0DL2
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 08:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1D960128;
	Tue,  5 May 2026 08:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4D2C2BCB9;
	Tue,  5 May 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971194;
	bh=+fxw3GWOaW5i1Rt7AYvW9ueNOp4s3QpM81hQC4XSmKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7v3zufeAcj0HCHyboRNBPRPoEypDLgZ2/fsqe4kAY29sPi9yK78XL9yn1B8PnWn9
	 XXmwuDJrzUFP2sYuicTnATn8FnlXBUc03JW06Gdg1PTzjqf8Jza1c696aXvq2ckCfJ
	 0TSTgA0TY3wilxC51M7CnsoeTMMKtaRZ7vFdo+PnJCT0ETVPKAhZOnVT9GcQ8oPfiv
	 Ps/qO69DBOwnyZB0OAzORt/hKBoPQJaJZIS1dYtGc2tMO+WRfToapd60Ndm0qlUmc5
	 NIEai3nXm8hs0WI5oiLUi13dazLB7qFj1HkC+5kD7+C5KeTnyejHlP2H+y+yOwwIxy
	 acp8eDQLHFnfg==
From: Yixun Lan <dlan@kernel.org>
To: spacemit@lists.linux.dev,
	Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Date: Tue,  5 May 2026 08:53:06 +0000
Message-ID: <177797117437.466549.17292861658160797583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>
References: <20260430-reword-overstep-3be08b7eab25@spud>
MIME-Version: 1.0
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


On Thu, 30 Apr 2026 19:52:12 +0100, Conor Dooley wrote:
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> 

Applied, thanks!

[1/1] dts: spacemit: set console baud rate on bpif3
      https://github.com/spacemit-com/linux/commit/24c12ca43b12c104389d9a159207d0b25779d0af

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
