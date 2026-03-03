Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F3EDA6B2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6UpLtOELZ3W6WNqjfaY/sw3VO1MCiIIAgyfLtkrZK8=; b=u8IzNNhTs7JPv/
	o3G9b44QojHXEY6rKzGEFylrvnJD1B0e+FZ6I3E0E8E5ksA5JC+OOLUoFveMEw+Y9qcfm9rjFb46g
	G+sma5MfEKcVPyyrlziDLMqIYMkJ9ELvGnzy80LxQKsAxWJuV/quS9gxPdrT5L+Zg8dwSiJsHh8dI
	Ys90Ezyo181NFNwaLVuDtNMmAJ2a2UAs3pOMnVA0frm9AoI72EU/3RRegR8UzvivaXn5sHZQPArqE
	qMBGH8lMGFDH+Nf3v2yl6XFTpBEcO+2SwojTC6UkKm4YUROfQwiKUIi17VOTxKnyx1m4XcCTefsD9
	muoVy1xWtHKnd2H8sQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTMT-0000000FdGo-2vtv;
	Tue, 03 Mar 2026 17:16:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTMR-0000000FdGe-3lRn
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 17:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4818660008;
	Tue,  3 Mar 2026 17:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C70C116C6;
	Tue,  3 Mar 2026 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772558201;
	bh=89uuC9cegDpYKojzKKoYfuDwsIEFdHdSqezxCAPjCPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAZz3Y0FsJJyI9i2KwiFyXuIwX12KvERWrKBtCYz+yvB441Fb0Acv0V+gCFECi7yR
	 Fkinl2YqPK3OdJ5mjJWW5M64za1JrZIDcFIH4TrgbW+PFzYpmrXrl1tDhjisUgJKag
	 18xjs815cuYBNONech2KjWT1kcb0W7ZlR0+bgAPni0XAQ5IhT05u8Simx/0kXYxuSa
	 D9YKZVL9eRa49S8fZJHo5jmL8XxWjY7fN+dEjsAF27ZtlWirXFCuwe5KcJkpJkLknB
	 kZtBsaTOVEjYuhFcpVxeXab7I1iYRRXfiTVxOjBZ8PxENLVKmeiliP9JiMtw+FMCSX
	 EFnXZTKpR6p0A==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add support for Microchip PIC64GX Curiosity Kit
Date: Tue,  3 Mar 2026 17:16:29 +0000
Message-ID: <20260303-judicial-blissful-a6cf6282104f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-paprika-tipping-e7bb3e211d6f@spud>
References: <20251117-paprika-tipping-e7bb3e211d6f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=T5Bex/GspdKVSrr1jgN1DmbEltzEuqjdgTmX6pJxDrk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLxXPLH+x8Omuy7gs1MzfWDxssTncumW++IM+AV+CY4 sSlW3at6ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBENMsZ/ns0sP1rPdU+jzGi ed71LwVHSv5phk88s0HWx/Vt24oVGsmMDEe37Fnz5k3VMZn+RPtFF9jZw57sX72y+692f/0Ls3l H37ICAA==
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

On Mon, 17 Nov 2025 16:53:21 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> v3 of Pierre-Henry's stuff from over a year ago:
> https://lore.kernel.org/all/20240930095449.1813195-1-pierre-henry.moussay@microchip.com/
> In it he said "This will be fix in a V3 coming in due time", and I guess
> that due time was ~14 months.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
      https://git.kernel.org/conor/c/c8cbde5dc18b
[2/3] riscv: dts: microchip: add pic64gx and its curiosity kit
      https://git.kernel.org/conor/c/a3c02b37a631
[3/3] riscv: dts: microchip: remove POLARFIRE mention in Makefile
      https://git.kernel.org/conor/c/4eddc7ed4904

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
