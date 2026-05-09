Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37B4CD343F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VlD4BYUvBhxhiA8DetExSf5lKQzSNalmFxHAfwJ9mY=; b=e9XXa/ozOKY40c
	5JGljxsO5hkckC+kyrK8TJyAdzzHCu4G1qi/Jq0kObkO+e5ldOAGORpMjl7D/zPKl/946QawZBvkz
	Hwk+yc1MPHynpMsozo0XyMmnFBFuK/ZtPOFrXzbdCttB4M1IBOGAP80HCy7DXW4Vsxq76a12N6tqY
	RxRoywfffn/lFSEMd2FPqnynNojBgoY3pE21TEo4DkE1bYz/nvcrakNwxIxTpDa/DvHK+aNKOg9Y8
	iRwgk9Rtk4eZLw9JqevAbMkOLnjcuGP7TXZ2GJyPQAfSWqtKpLqVMR4GGs76gqDgV505lGRBelw2B
	6O3+hi2GcWAAbMQx4wSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgIC-00000008siJ-0VOV;
	Sat, 09 May 2026 11:56:24 +0000
Received: from csmtpq4-prd-nl1-vfz.edge.unified.services ([84.116.50.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgI9-00000008sh0-0K6E
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 11:56:22 +0000
Received: from csmtp2-prd-nl1-vfz.nl1.unified.services ([100.107.80.24] helo=csmtp2-prd-nl1-vfz.edge.unified.services)
	by csmtpq4-prd-nl1-vfz.edge.unified.services with esmtp (Exim 4.95)
	(envelope-from <lvd2@ziggo.nl>)
	id 1wLgI2-008wN0-En
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 13:56:14 +0200
Received: from pivobook ([31.151.14.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by csmtp2-prd-nl1-vfz.edge.unified.services with ESMTPSA
	id LgI1wNynmrfEILgI2wlUBZ; Sat, 09 May 2026 13:56:14 +0200
X-Env-Mailfrom: lvd2@ziggo.nl
X-Env-Rcptto: linux-riscv@lists.infradead.org
X-SourceIP: 31.151.14.30
X-CNFS-Analysis: v=2.4 cv=JpPBas4C c=1 sm=1 tr=0 ts=69ff20de cx=a_exe
 a=NV7W8VvOCisUEaGs51tmdQ==:117 a=NV7W8VvOCisUEaGs51tmdQ==:17
 a=IkcTkHD0fZMA:10 a=mZ4yd4CqamDfb6olylMA:9 a=QEXdDO2ut3YA:10
X-Authenticated-Sender: lvd2@ziggo.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ziggo.nl;
	s=202002corplgsmtpnl; t=1778327774;
	bh=kkC00Hm4PasArfja3LA/UXc0OW6JjSzi6RiGJEIqRc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TffVbMC4PBOTtUqdc6fFXUHBP/WEJKpDws7pW1ZzzphfAP05D43Z0yqf0/i3JDsGp
	 raUSMPu/yohAEfFrwcUMMLElU81nynerwaTe2hnJr1dbY1SoxrJzFg2HVtRsNRbX1E
	 WHbgtkM5CGZgWGAJYFbOoedrG3lIeS73lHLRfR55P9Io9jdK2AFieerVKT4W/s2Xtv
	 rdvmCRf0EHtVFiyp9lmwic1QzUskhYUrOaq46L+ryoL7ELvibG8/akWSe+q53rKSqw
	 bI9ozCRLfmIHjRI985Rj57JuJSurGFJGI5VUepLMr9JbG6wm1QkXOHTeVa9iv4RSr7
	 fdGfqMeklXRLQ==
Date: Sat, 9 May 2026 13:56:12 +0200
From: Vadim Akimov <lvd2@ziggo.nl>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
Message-ID: <af8g3DlQhHSME-0_@pivobook>
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820152316.1012757-1-apatel@ventanamicro.com>
X-CMAE-Envelope: MS4xfNDTPr0vul+5v/KwGl5RI2QffcB7SymM16QmsJPTDk+WVAVIDIZFOdV76cwlQ5gPqx1/N6mVa4RFxpehkcP6L+t26aC2pigYtcqHH4ngn+IfNkWRGX0+
 nC5dUN/AHZ+BWYddiFotvlnydDGmcajOzZiTVToRGJbHFmCgW0STW2Pnb0c6/kGQcaqw6FwZe/hYJTd4B2bTVs5KFysWd9Hp5eNvh1JVqr5lB63yFkIpLST8
 77+6AduirQaBdkNLxp640R8Xji7afv+QG7REZvIFTfh0UoXYwUD7L5SY5b30eNOGeXR/UuqSMdj4318dH8400SzIf/lCCYfxqKsGUGNSan+LzqtYNnK1ZhyL
 iqRmPZmaau+dYDIfPSvGKVLY0QSDG73HEyIju1dvA1i/dXumI6jB2Wf3XlW+Q5M82aEk04TgpYoTquJJZ9G+wBNMh3Dpb5fcyx0AnhjcGp+sJcxseLD/n+un
 ADBeT1ptOeKRMWPjP2OC8XWfZY8krZapdqzrzNxtAK/H/HUjPsRHyfbYj4G1woy7olKiIXAtr8RsWRL3qzt6HFYO/3C4G7fIMdsUWQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_045621_238700_6DB5BF7A 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Aug 20, 2025 at 08:53:16PM +0530, Anup Patel wrote:

> The pgprot_dmacoherent() is used when allocating memory for
> non-coherent devices and by default pgprot_dmacoherent() is
> same as pgprot_noncached() unless architecture overrides it.
 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..00d8bdaf1e8d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h

> +#define pgprot_dmacoherent pgprot_writecombine

This single-line patch, as implemented in commit 00b58d2c25d10fecffbebaa0c369fc9d0a6de397 for 6.6.y,
breaks allwinner D1 SDcard handling:

[    0.000000] Linux version 6.6.115 (surfin@nedoserver) (riscv64-unknown-linux-gnu-gcc () 11.3.0, GNU ld (GNU Binutils) 2.38) #1 Tue May  5 10:25:47 MSK 2026

[    4.886823] sunxi-mmc 4020000.mmc: Got CD GPIO
[    4.893625] sunxi-mmc 4021000.mmc: allocated mmc-pwrseq
[    4.941711] sunxi-mmc 4021000.mmc: initialized, max. request size: 2048 KB, uses new timings mode
[    4.958033] sunxi-mmc 4020000.mmc: initialized, max. request size: 2048 KB, uses new timings mode
[    4.990692] sunxi-mmc 4021000.mmc: card claims to support voltages below defined range
[    5.009712] mmc1: new high speed SDIO card at address 0001

then following never happens with that patch, i.e. no SD card is found.

#[    5.109896] mmc0: new high speed SDHC card at address 0001
#[    5.116546] mmcblk0: mmc0:0001 EB1QT 29.8 GiB
#[    5.128887]  mmcblk0: p1 p2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
