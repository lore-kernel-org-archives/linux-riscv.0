Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA6109B461
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fbLzDQ/0RfqIAcXt0HsaLZI4h9orBUJhjlehzpGe3o=; b=ppkHIXeripsd8i
	xpKQ8mxXX1U3xdyX7XzSYJ1JWDT94Hi44lbOzEd+aBX1wgYd0vY6Vbrdg2lxeMVqoef10DFVmU/Mx
	Wwd41FfGUipkHt1HiZ2Tc8BhOKyWf8WmHPFwR00kmwG7G1UC0T4KiMnp1+LC57VpmpLQesQ6CvFE/
	c1OLeTHxIXVrWzGj7/dZEplAbCZU0d1nAIch76rDLUbnnIpE6YkaM12gz2KSuP892E0krlkldXrFF
	+XfJ2Gd0/8euGv21wbY1nbvi78JhBmD1UxUf1CJUlkRka0J9l6nBXi6vv5k/ei1Dz9MTN5lY7lnLH
	DgqM1Q1pwP5LfJv5d2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YkB-0000000CyZg-0mmH;
	Tue, 31 Mar 2026 13:02:55 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yk8-0000000CyZE-1mxb
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 13:02:54 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 390013f6b;
	Tue, 31 Mar 2026 21:02:37 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: troy.mitchell@linux.spacemit.com
Cc: Thinh.Nguyen@synopsys.com,
	amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Tue, 31 Mar 2026 21:02:30 +0800
Message-Id: <20260331130230.2913628-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
References: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9d43fd26cc03a2kunm424ea1324c937d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU1MVkIYGUNNQ0lNSk4YGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_060252_660612_A149378E 
X-CRM114-Status: UNSURE (   6.85  )
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

Hi,

> > +	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
> The logic looks good, but the structure can be further improved to better align with
> standard kernel coding style:
>
> if (usb_get_dr_mode(dev) != USB_DR_MODE_HOST)
>   return 0;

I initially thought of writing it this way too.

> > +		int ret = devm_regulator_get_enable_optional(dev, "vbus");
> Could you please move the declaration of ret to the top of the function?

Thank you for your suggestion. This patch has been merged.
Perhaps it can be revised in the future.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
