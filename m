Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90614FCD0C0
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 06:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJDOP4ib7oCzKddFRNAJGDj5sZ1P2mM+Skp2QPguW3o=; b=eLkcU6in0EAnLi
	NXiccCSXCY1cZF1VLIf2USJyIHdg6p4les4Ae+HQ5qVp+PPW29mcz7UR5qr/VQhrGts7Z171rdX+g
	PNAc5ZFUJMo00KHbwazz4r9LBLrOPEBx3o3tNopttgxJ9bW9zpBh/qKGN5y/pDfG07XazPmJABayS
	vJa1lY7YhK2orgwa1X51jps0d3ZHUGzlhXEg9Wi/DhgCr95/nu53XdOqxAt5lfT3DZystItL7fOHf
	y097ZzFvr2M6hLER5O8ZijVxL0AUbi0FpG3Y0hBbLoM3bAXElsvLMcpGvLy24SdUSsWszBNW06s0s
	bDYbTFIHLLmeBfHY7+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kQJ-00000007sRS-2XSB;
	Wed, 18 Mar 2026 06:30:31 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kQF-00000007sNR-38Dk
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 06:30:29 +0000
Received: from localhost.localdomain (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 375de3318;
	Wed, 18 Mar 2026 14:30:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Wed, 18 Mar 2026 14:30:02 +0800
Message-Id: <20260318063002.3743362-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318002953.6gknb2jfveqyisop@synopsys.com>
References: <20260318002953.6gknb2jfveqyisop@synopsys.com>
MIME-Version: 1.0
X-HM-Tid: 0a9cffa3308303a2kunme7efa47016e9df
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ09LVk9PHx0YSkJOHk8aTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_233027_967884_D2134181 
X-CRM114-Status: UNSURE (   8.43  )
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

> If we have a specific user, please include it in the change log. In this
> case, it looks like spacemit k1 as noted under the "---" line?

I will change it to "Some SpacemiT K1 board".

> The name "vbus" here maybe confusing. This regulator powers the
> controller chip and not neccessarily turning on VBUS of the USB bus
> power line. Is there a common/different name for regulator id?
> At least fix the error message.

Sorry, but I don't quite understand what you mean.
Taking the OrangePi RV2 [1] board as an example:

VCC_5V0 (IN) -> VCC5V0_USB3 (OUT) -> Vbus30

The VCC5V0_USB3 regulator is connected to the USB vbus pin.
I think it's okay to call it "vbus" here?

[1] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
