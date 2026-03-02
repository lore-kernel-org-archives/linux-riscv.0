Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD22D58E47
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaUvpGx3rkv+vjNCGgERa29EFr8nmncNUYBxnBhqZXM=; b=G2/+L0kZuCHcaf
	VcN3YKneG67Vtscu45tqX2rRV3w4/WwY6vKcecMXEQ+H/uVxafqZIqbzTR9djKUbQsUEUbjpul7kB
	OY2d53sRDPrqYocUH/FsuzQMaMPPYSwLzQS9JJwFCtl1ecDrqbwBQow3k78IK1R65gSfhrkzKHocK
	0jvmRPrK5IvZD++dVsg5gibkGgUW5iLzdmoqPNyhfAcFL7Cxb0xDvmKmU+pb0zzY2b59KhSttlMWR
	FfrrqYIWvgv4mfFAbpIYvYYmTne3mIlpXmCL+w7d+o7h4st3y0XihlM2G0hzG46Uyf0dFKcm5fBGl
	iC/zmQ4FnXQrv3nVPlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu5q-0000000CBV8-2rwh;
	Mon, 02 Mar 2026 03:37:14 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu5o-0000000CBUF-1Ov9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 03:37:13 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84C1D341E6C;
	Mon, 02 Mar 2026 03:37:06 +0000 (UTC)
Date: Mon, 2 Mar 2026 11:36:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: dlan@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, conor@kernel.org, devicetree@vger.kernel.org,
	elder@riscstar.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <20260302033655-GYA288339@gentoo.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
 <20260302030511.30566-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302030511.30566-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_193712_506031_A02EB855 
X-CRM114-Status: GOOD (  20.09  )
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

Sorry, I missed your mail due recent problem of my client..
On 11:05 Mon 02 Mar     , Chukun Pan wrote:
> Hi,
> 
> > &pcie1_port {
> >  	phys = <&pcie1_phy>;
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> >  };
> > 
> >  &pcie1 {
> > @@ -320,6 +321,7 @@ &pcie2_phy {
> > 
> >  &pcie2_port {
> >  	phys = <&pcie2_phy>;
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> >  };
> 
> ```
> &pcie1 {
> 	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 	status = "okay";
> };
> ```
> 
> According to DT binding, the vpcie3v3-supply of the &pciex node should
> be moved to the &pciex_port node. This is simply a duplication of the
> property.
> 
I have confidence that pcie port need to add a regulator to provide 
supply for devices..

But, I'm not sure whether it's ok to remove regulator from &pciex node,
it's possibly a 'yes' answer, but to convince me, I'd like to see a real
test case to prove it: e.g, power supply for pciex is actually off before 
the driver initialization, then run regular procedure as it should, if
all works fine

Btw, different drivers request same regulator is ok, and is quite normal,
can't draw a conclusion that it's a duplication, as they may be used for
different reasons

> But do we really need this pcie_port (PCIe bridge)?
> 
> The PCIe bridge node (pcie@0) was treated as a platform device, but it
> did not define the interrupts property, which resulted in the following
> warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> 
> Would it be better to submit a patch to remove this pcie_port?
> 
> ```
> -       ret = k1_pcie_parse_port(k1);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to parse root port\n");
> +       k1->phy = devm_phy_get(dev, "pcie-phy");
> +       if (IS_ERR(k1->phy))
> +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
> ```

I've not really looked at this, and not an expert on this area, so will
leave this to Alex or PCIe maintainers..

> I have tested this change and it works.
> 
> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
