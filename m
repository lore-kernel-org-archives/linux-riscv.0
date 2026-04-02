Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB9D3941D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKATpgAA0XPRGgARR8EWVEL5u/qETF3HxFS7UwQWNjE=; b=SItm6JyL3B5FVr
	oeYdW8mygWv1rIBzOa/qlqg41la3+PcTfrUvOcb7Cf0aS4RHTp0MMXmG65WYdy11GpZL9VcVtAvG4
	gEVuQiwHvQpMkJemvFaDABUQhtK4M/hn/ULAb0BcUy3FdDXaY7c/jFlg+TtUHxQvfX9J/Icbw7IpG
	6SgJxS/U0QHoQDxaODzqD+joXNsc32bSJL8zRgiQ5t6fhKs1nqaIkS+awr/UgOdutPfxmJ17UNzrt
	XYiWEijI4Km5GmYZeJzEvUv4mWRtmEjh37TOg8DkK4QZptoLEBbvcdR/IxkFJGqXrmGbFP8fsI5Ey
	UaCgAWfpJRxaOF2hpi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hpj-000000009Hd-1GDK;
	Thu, 02 Apr 2026 13:11:39 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hpf-000000009Gp-1nCa
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 13:11:37 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3952f1f5d;
	Thu, 2 Apr 2026 21:06:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Date: Thu,  2 Apr 2026 21:06:08 +0800
Message-Id: <20260402130608.133154-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402122045-GKA1016296@kernel.org>
References: <20260402122045-GKA1016296@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9d4e4d59b903a2kunm0261889f563bc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHhgdVk5LSh0aSUpLSEJOTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_061135_673911_0A67D678 
X-CRM114-Status: UNSURE (   7.27  )
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

> Can you work with Han for adding USB support[1]? this will simply
> distribute our effort, and make the review process even harder

Sorry, I didn't consider this. 
Could you drop this patch ([PATCH v2 3/3]...)? 
The first two patches should not cause conflicts.

> > +	vbus-supply = <&vcc5v0_usb30>;
> IMO, the vbus doesn't directly tie to dwc3 host, but to HUB's port
> so I think this is still wrong, although it may work on the board..

We can switch to the onboard_usb_dev driver after it's merged.
Keeping vbus always-on may cause unnecessary waste.
I won't insist if you think this is wrong.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
