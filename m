Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E430CF532E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdkzpQPgGInooHjq2NWWbFMLmPpLnUUSyuYrv1mbkT4=; b=areL6Sy3krIDxc
	YM374BUStnGWXhIRnezVvnmK8xKspVzf+8Sb/kEAI3rLg6AFKvFjJEg+NyFrByhxGkwW7V8lMdaVO
	4oQiJFBFDB2mesCgGNv9x6+l2B+OyeN+oJ3eJF75PEAD15tbZ/2p0hxFqD/KI4YESDIv/PEK8laYD
	ZjaNexR9wFBqskzobQ8JAMXJ+syz4nvarjfpIblKJPrRTwj+GNuThgDRg15xyX8kAa1fiCzwPEEjW
	4bsNbKKy5/8YH8sd0Pu1EdGc4OqxN6O0csdm68kQQ+5sLopAIxmH6UANqdDIf4u9p1Ut6ruytHWNQ
	efDb7y/Gvw5RGPy5abiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vfE-00000000qhT-1b51;
	Tue, 24 Mar 2026 06:54:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vfB-00000000qhA-43AD
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56AE840625;
	Tue, 24 Mar 2026 06:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C19424;
	Tue, 24 Mar 2026 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774335293;
	bh=t8hglXor6Un0PxqAoIiw1Rbzj+sG/DoZrvhFPIkbBjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GP5Jo7XhWVUCocMEBIxlhj4htOs3HLT8XmDiLGmJLbJORkbERgf6s/58C0P1ZeqDZ
	 v4SyzJJLPM9OpLtrJ47Nh9N2Oky93FuooLzLQ/XA+9ytIu7jAPP87bx5HfWWJSbBtt
	 3PXvvuR6Z6+IPiftAQW/bKL661LLyA+X1L4oqjFbsuDMmQfwNcPg+UHiX/ygXRQWr2
	 syUXoKCUqqdL0vWKUNZXd8k+6rIcNDUDyceTjM1zoCx1+ylNRDy81ONR5tcuvX0OfM
	 CD/grU5LEuvrR9ohIkRG2tT2wJmeoDtyGTfdnQQT63XZWCNm7utpSDqDZRdOg7B80w
	 TlV+UDvnER1/Q==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
Date: Tue, 24 Mar 2026 06:54:42 +0000
Message-ID: <177433511340.244330.16976819949660895046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322202502.2205755-1-aurelien@aurel32.net>
References: <20260322202502.2205755-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_235454_058035_687BA73A 
X-CRM114-Status: UNSURE (   6.99  )
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


On Sun, 22 Mar 2026 21:25:01 +0100, Aurelien Jarno wrote:
> The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
> speed differential lanes are always configured as such, and do not
> require a pinctrl entry.
> 
> The existing pinctrl entry only configures PCIe secondary pins, which
> are unused for USB and instead routed to the MIPI CSI1 connector.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
      https://github.com/spacemit-com/linux/commit/c68360c0d636dae71f766b7b296ddfcf2827ccc7

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
