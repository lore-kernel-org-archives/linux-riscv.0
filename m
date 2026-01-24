Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4E4D778B1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGofRpxchFDJddUplEXOjjzGkYhN/Ablu+pCbprX8o4=; b=vhLRS3btYmyj22
	O7MacQWME9a7RPSCFksVg4FPGo8wvcslWQCekQPdJAos4cNgPzuh+DboMoXEh0GcZWleVYzbQRZHE
	XoDpoSzY2vdTd+Z+LncO4aS7UN591ug1RtsD0/TDI6CR9VvdQitnKp7oIitkLYFyi/lfDB/a4Ez3H
	9RBqws3bFgtHzkWu3rce24ww0vd/7B+fnoxvnkEOwszxEJgWV7bLvDAeMMLsXiGx2l+ALMubXSrpD
	QHh4SI03ueN+Q+/cUXm2N2SOI/K9PwtwKdn0kCbYb6irFwuwSWQDr5IrN1JOi8OdkorDVuDoUxs6+
	lpc/aPaI6eKsrb8fSG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR8n-00000009bDA-0fzN;
	Sat, 24 Jan 2026 00:04:37 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR8l-00000009bCZ-1FgS
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 00:04:36 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 106D8341051;
	Sat, 24 Jan 2026 00:04:31 +0000 (UTC)
Date: Sat, 24 Jan 2026 08:04:27 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for
 OrangePi
Message-ID: <20260124000427-GYC71302@gentoo.org>
References: <20260119024255-GYC47382@gentoo.org>
 <20260123140625.1918171-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123140625.1918171-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_160435_366962_2543A5ED 
X-CRM114-Status: GOOD (  12.26  )
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

Hi Chukun,

On 22:06 Fri 23 Jan     , Chukun Pan wrote:
> Hi,
> 
> > no, as I checked these two boards having too many differences that
> > I don't think it's worth trying to create a shared dtsi file
> 
> I think some of them can be shared? If you think this is inappropriate,
that's true, but I'd rather we think of this in whole K1 board perspective,
not just two boards of orangepi.

> I will abandon this. By the way, it seems that the OrangePi R2S lacks
> publicly available schematics.
> 
> Some parts are the same:
> - emmc
> - eeprom
> - ethernet
> - p1 pmic
> - combo phy
> - pdma / uart0
> - always-on regulator
> - pcie (excluding supply)
> - usb2/3 (excluding supply)
I'm not surprised of this, as most ODM copy the design from vendor.

> 
> Some parts are different:
> - hdmi
> - qspi
> - sdcard
> - gpio led
> - sdio wifi
> - audio codec
> - pcie supply
> - usb2/3 supply
> - gpio regulator
> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
