Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052FECCFA1A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MroZPIxDO3L8kmTkltFJVMaipslBudamoENgxIBIwSg=; b=kgbCzIFMPwDSCV
	8mvWEPbfwGVVkke+kImMvgxI6aiLFlZeyJqt/Z1uI8N5L81mstVYOtKrcTJMD1Y0gXh/inQvm/1cB
	nOrH7z9f8c/I7wvXJJGFIhFRRHYkb/q1GNpjXO24ZAgtIviui08J8QfGrMg+JYePy9cqSceLspvaR
	J0zr3oBORueU6bvlJG+JYktCtvrFP0+GnuXz9pd/MwmDNTFuBH5mAIUtmegWAVHCw3xQsbNZFzTUl
	k6g1hOhV+rv+rATCaDZtFxl9n2ExlTnXyNdGUImk3cPh6mWK+KXCWbhCckwppTm76AzhAHOZdoOge
	7M4JYUVdXf4yc1n5Oz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMsG-00000004wHW-04KB;
	Mon, 10 Nov 2025 08:03:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMsE-00000004wH4-0BsF
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 08:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B41C42B97;
	Mon, 10 Nov 2025 08:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC01FC4CEF5;
	Mon, 10 Nov 2025 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761817;
	bh=8E7+MmUZ3rjUJG1CQj7HaQRHXl/nFB6eUlYK+d/MAFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LE+5lcayBYJbuSD1KYAjanQzgSNYWNobSSl9rDu0F9MVuKuIqwdUjgr1bIeEbYsap
	 DSinbjhKnXI8K9SsXpPBvlXfCFhc/91qS/o3aL7Skn4XPfFjcspNp5Yox6DsN8g8Ze
	 EuQeZwCqsJFpJ+DMBDBGqO3RaFuvLsOX8kvtatEj1r9pl39Z73yu97xdjFu+GRtJYR
	 Cufi7/Xpu7GYQLTRkGA889IQoiOZPmE/CDPET5Z5+c+lGNZV1GaK261/aN7unNTGhM
	 3trY8M2l32iFN4RLAVQoaYlldzuDgUsx5+UDgctTuqfZzBjLXLovn3IhkYm6DStpnK
	 5cDWZW1pcKawg==
Date: Mon, 10 Nov 2025 09:03:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: add eMMC to OrangePi R2S
Message-ID: <20251110-gay-rat-from-hyperborea-45d3cf@kuoka>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
 <20251109222858.3085488-5-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251109222858.3085488-5-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_000338_290027_9D0B7916 
X-CRM114-Status: UNSURE (   9.44  )
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

On Sun, Nov 09, 2025 at 10:30:12PM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> The OrangePi R2S board includes a 8 GB eMMC chip for storage.
> 
> It works fine with the same description as on the BananaPi F3 board DTS.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Squash the patch. You just added this board. Adding board is one commit.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
