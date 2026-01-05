Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A4CD0400
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGlwzezUdCWGi6owvZg3od+MHpsVWgVpHyL+cLIqepc=; b=GrzYtEP2Dr1wa3
	unVFiCE/DfL8uhgXs8JiPuzsuxu/xMhRqc87oniI6BX0Qc5p0FZ7mkhXWrpVrJK9uOKgQaOhHmFEN
	LJRHzaf7NYjOPadvqBCcBnV+65ZYUNmFcFwpBX+HT+c1B438D41eWr0s9WaXHra+GO+sPUeIRq5yI
	MWScpQ2OJ/aDhm24dRMLkXU2dnw4tBEW8BlI4Nequrtk9ABsXBO4Xgq6oVDEDJskMMcvYZyn2UyNC
	ltIRM4EfrOZQMCco6hPBHwanen+5uWSEoaRXvpduIMBM5lp2lFStuxicTX7UVyLRLw17JUrvxVmmF
	U24wAATGRsxdKGYt0g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrWe-0000000C4vA-3avQ;
	Mon, 05 Jan 2026 20:50:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrWb-0000000C4uM-0LFc
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 20:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=xd6KbORI5C80YA+1rjUt8VpP88PP6HIea14IxMA48y8=; b=iMF6KrQb7WMVBPZK/fQsdq66U9
	F9guszU3ckpXtau7b48YHL1+HRcnXMC6rqjd5eWsJl0SNoZL7awZOKTmjXvNb5Cb+lZTi5iJD0yx9
	1JusZiFHKw3ZzSV8m13LMdU2zFIRbT39ZL2ejVorKsHCmLLSHWgVs37UzI2arqDu7Q5avI3wQRJWa
	ZcoZOVVZleDKPurxVNPTl0omEid0JIuAE9bRLOD0XBxu7plR4NAWhdGNZskOHBJtbY3tP+BlWewu1
	C+GWCJjEStGQuwHCHuZXZMbfhUHbQettgceYt0wPjhoETuoZ7PtZAOMBMEO1cXJo3X1GwCFU7nJaV
	atSe+Heg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vcrWO-0000000CcNc-1Gfx;
	Mon, 05 Jan 2026 21:49:48 +0100
Date: Mon, 5 Jan 2026 21:49:47 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aVwj6xm28wG7IYtG@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
 <aVLhQQrYQ0T2rBeq@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVLhQQrYQ0T2rBeq@aurel32.net>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_125001_556520_B6DC2F9D 
X-CRM114-Status: GOOD (  11.17  )
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

Hi,

On 2025-12-29 21:14, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-01 17:03, Ze Huang wrote:
> > This patch series enables the DWC3 USB 3.0 host controller on the
> > Spacemit K1 SoC, and enables it for the Banana Pi F3 board.
> > 
> > To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
> > ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following
> 
> Note that the ComboPHY part got merged in the meantime.

The USB2 PHY part also got merged, so you might want to send a rebased 
version against https://github.com/spacemit-com/linux k1/for-next

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
