Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C4C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzhsu9olvnGnIVIB1CD32uCiY2Rh8RbBeGCgXiCR9Wo=; b=WTj7oAGGUuBIAz
	9hc2YnqL182B121wkziQH8yY190Id+Na22HUwsah9Xe2pqhA3tR1EKkiG1hml7COuOMB2lIQcUsN6
	uhYdsGcwNEB2ueuQ+h54IwRSQvzeVrhL3dbKb09c6DsXSyKTWWacbi5jPdnpZYbU68iU89FKMrljX
	NTPukwB1IfFxaURG7xIs+MdQ8BsGdTeEFmKd4FzAp6OR8J3Qd8kZ63leY+wWmfOBFumMHQKQX/IlK
	PfrwR3Y49y7oUK0RXGcqkuGTi+eAHZpkKwINeZGzu2aZP4/MTMa9E3qH+gLI6654skhP1xSd3inIg
	DvteQqQAeHtY0SGuKkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoM-00000001rAr-2Qgt;
	Thu, 15 May 2025 21:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoL-00000001rAM-2gPz
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 21:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DA01614BC;
	Thu, 15 May 2025 21:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BA1C4CEED;
	Thu, 15 May 2025 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343292;
	bh=IqTyQ8OFnHGPivZLHwcSRdaS0hb6ABGECTq+fFAd/zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaEKHhlwrKyCFlQtp+o14h4ZsNzcnjzI2Nv/n9UCTCasvdkjn/FNmMEKKcO+CBDWm
	 s4tKgXj82rkKlE4gNDCs/Wnp75RONlR7MJvy0ECQ7Uo6e8JCArF7/s+ncHdiOEGZ2j
	 EALGGV5EI7TpU40IIpBMmcIgnzPa8DNYFlty8AC/nkB6OHpGxlB/OZDWvIvWlVlEOQ
	 mXhMfhIhroKvI3doFheZ9lXZ1pg2t8raB342brzPFD4g5nue5B5KJXsFO3YJj8NLvt
	 CqoCpbdxm0eaVtotG4zbFCuHrvuhBRVHO/LkABVd7AVqPqAv7HWlNuaXMLlmnu/PPA
	 dazwtzdUdYB3A==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0 port
Date: Thu, 15 May 2025 22:08:01 +0100
Message-ID: <20250515-refusing-deranged-2c601f50992e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=340; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MPiun3zRpy2NvzGhrx8iv30vxT26QO3dE3Sh06BSVjI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4RtbV2z5cYHjK4OPwRZtldMPTfZXtzyNklz20Cm96 Vy0dOLsjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkyVqGfxY7+a+YP52XLv38 7va5soe+pXDGhVkLxp2Y9fn+1tPRbI0MfyWfP59QMjc6Pcr40enNbQs+vQ0wWNMga/vnfrtNB1/ OW34A
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

On Mon, 24 Mar 2025 10:09:58 +0800, Sandie Cao wrote:
> Add usb_cdns3 and usb0_pins configuration to support super speed USB
> device on the FML13V01 board.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: fml13v01: enable USB 3.0 port
      https://git.kernel.org/conor/c/a2e7f6c48740

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
