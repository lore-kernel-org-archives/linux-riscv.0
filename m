Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36115C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYDXhMoNXkUjTUVoATzplJbwamVAGqDq28d0nVK9Vrc=; b=Van2+Hl2txr3h+
	UALLjIt+dYQI/u5+dEATGT+UinRQX3taih59U2bNjMhAxPYY9NsQYbrqYKnTyK3fRr2CAQHhtIJRG
	6ROKuMl5SBTbLw1RVqOa9eZLB0UlLK2Ixc0qT0RdKEHrRzPpwROpivqcJ6x58lJ05G1J0xQL9mjKZ
	loFWbw7nNw/loj6YyfUHsYlLMNW2tr89mGoGuD1IndI+9qEh32X2WMGgCiTssXgXbnqhWJkcomJdc
	FaYP9BCUi/AUgQKNu6Fwbw0ID9bJf5I63SVIKVTNBILyxg61RruccYo9YspMnBu/f6QY93fIPMr7y
	HsPC0/Icxi5CVkZGQ21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ3P-006AVa-JZ; Tue, 08 Nov 2022 14:58:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ3N-006ATZ-4m
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 14:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667919496; x=1699455496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+aR390NbT4EbABjXDFnwmUUvaBA1kaUQC5NZJB7cfRA=;
  b=Wa02CtDIZjKQ484vhlKybJ6lMic8WouSNk1sSUI/8jgkHEIt5hXrLPDq
   HNTkSOpuxG0rGKxHWkJ6AKVpD6om1C+pYuOOoPvTrSksfgh5rRyhZ2JJQ
   9bRtlUAZocaXRZVu/Z2fnwEtMT5c7rBDkPkW7ca/uZtjpGY3iqCt3Ok+L
   kILIppuWfYTfPiu8eIVFjuK6fdTztfJRpQv9MRaKzl4F+ndL6CiJyuoa3
   C4q3wqkbDsUiEC5mGTmcO0coopeGD7l6nCnyGZmzBlJqIGCNOfXc0ELii
   g5bobNbBniUXi59V8AvsTXqSuu5Ar+G2OnAh8aDHIDfh3ySmehpxT4iZT
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="122380596"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 07:58:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 07:58:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 07:58:10 -0700
Date: Tue, 8 Nov 2022 14:57:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <nicolas.ferre@microchip.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
Message-ID: <Y2puchRvbo6+YJSy@wendy>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
 <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
 <Y2paXPeC51GORPRX@wendy>
 <b3e107e1-475f-470f-be86-deb4bb68c9fe@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3e107e1-475f-470f-be86-deb4bb68c9fe@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_065817_270672_01E5F336 
X-CRM114-Status: GOOD (  21.91  )
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

On Tue, Nov 08, 2022 at 02:42:16PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 8, 2022, at 14:32, Conor Dooley wrote:
> > On Tue, Nov 08, 2022 at 01:51:37PM +0100, Arnd Bergmann wrote:
> >> On Mon, Nov 7, 2022, at 19:31, Conor Dooley wrote:
> >> 
> >> I'd probably make separate entries here, at least for the
> >> drivers/soc/microchip directory, I can see that being shared with
> >> architectures other than RISC-V in the future
> >
> > (Added Nicolas to CC so that he's in the loop)
> > Uh sure. It'd crossed my mind, but I filed it away in the "may happen
> > some day" category. The arm stuff is going via the atmel directory at
> > the moment so I was operating on the basis of "do it this way until
> > something changes".
> > Splitting is fine by me. As things stand, anything drivers/soc/microchip
> > already CCs the linux-riscv list so maybe that can change alongside
> > this.
> 
> Right, but I suppose there is a good chance of having more
> crossover between microchip riscv/arm/mips drivers in the
> future, and others like Renesas already have drivers/soc/
> subdirectories that are shared.

Aye, I'll make it separate. Will make the existing entry that references
the directory more specific too (whitespace damaged):
diff --git a/MAINTAINERS b/MAINTAINERS
index 046ff06ff97f..5b48eea5e9bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17749,7 +17749,7 @@ F:      drivers/mailbox/mailbox-mpfs.c
 F:     drivers/pci/controller/pcie-microchip-host.c
 F:     drivers/reset/reset-mpfs.c
 F:     drivers/rtc/rtc-mpfs.c
-F:     drivers/soc/microchip/
+F:     drivers/soc/microchip/mpfs-sys-controller.c
 F:     drivers/spi/spi-microchip-core-qspi.c
 F:     drivers/spi/spi-microchip-core.c
 F:     drivers/usb/musb/mpfs.c


> > The one I was wondering about but forgot to mention was:
> > Documentation/devicetree/bindings/riscv/
> >
> > It's mostly definitions of cpu, soc and board compatibles, so I figure
> > it could go with the dt stuff - and it's covered by the generic RISC-V
> > entry for the changes that reflect extensions etc.
> 
> Right, that works.

Cool.

I assume your ommission of the SiFive bit from this mail means you're
happy enough with it?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
