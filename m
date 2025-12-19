Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F7FD78761
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfSTqzon8k3liwXiVbz2LwLspOGyrCDfymm0rzDyQ4Y=; b=vW+nJu50J5rPMc
	6YiekzNfjrFutcryX/BvpDs2GNliQDpWXn0lvOm2fmcbpXdq4WhCFp949CzSWjF/TBNdawyggGjEL
	c0MHzE9gl4efANkknM20YDV1xhHDO5JEE0EVqczJndqkABTgyzR4ZIg3DqImHaENFHhUN/XcN4xrC
	89vvkTOlM7NrhFHneI+zd6v5eK3DYLi1hOk80jbcJbQgK+lnfH69lwECxtIXLz0A1QEqXe386iNvR
	ElgDmSjf/exmHJT7nCUPDocc/J0r/jlJ6m7KuWfCGIRBc1u1ZB1gaq7Kzi/zx+inztGFzb5NlGnWD
	SlLQwjosgrGJS/NAlyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZTw-0000000AHcs-1Zb3;
	Fri, 19 Dec 2025 12:21:16 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZTu-0000000AHcW-47ej
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 12:21:16 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7F579341006;
	Fri, 19 Dec 2025 12:21:13 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:21:03 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/5] riscv: dts: spacemit: PCIe and PHY-related updates
Message-ID: <20251219122103-GYD1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
 <20251218151235.454997-6-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-6-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_042115_045341_5B7B1E10 
X-CRM114-Status: UNSURE (   8.63  )
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


On 09:12 Thu 18 Dec     , Alex Elder wrote:
> Define PCIe and PHY-related Device Tree nodes for the SpacemiT K1 SoC.
> 
> Enable the combo PHY and the two PCIe-only PHYs on the Banana Pi BPI-F3
> board.  The combo PHY is used for USB on this board, and that will be
> enabled when USB 3 support is accepted.
> 
> The combo PHY must perform a calibration step to determine configuration
> values used by the PCIe-only PHYs.  As a result, it must be enabled if
> either of the other two PHYs is enabled.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
for this patch

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
