Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE923D58E5D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9cZaiqNDrviFMtGQHk+oVFi8pd+dUh2a00GAyO546Q=; b=TfU1wogFh2ltCD
	3cl8AIDoA6xsHrCwKrpZca4YefhUEniLZp7ByDXmJisMUuzcttiNCug3vA7Mp6NI1dRUpw+2uXgZL
	+SgQJKl+seSf1ZGrYvKTkbAoy9U4NoCia2KgN7a0TrFlzQeg8g58ft8+QeFeC8w+ULMpisAknzJoY
	kkEccrvHllDEovY/gKpmyfDlfq5truKaX0wyhKokVSB2tZV7SYxqjSBfCNZkNAJ6qcoztMmu2dBYh
	UzfvYwQITH/9Oq3cMA/hq/U6jWZizv1OFI9RvOFSV/ZfA7yqdvB6jJlZ4p/upRGJ8xd1cKg+MvUug
	pe2fqqC8fENUhQ7AYwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vww5k-0000000CJHQ-2I7D;
	Mon, 02 Mar 2026 05:45:16 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vww5i-0000000CJGl-332Q
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 05:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772430301; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iJV09sVvTU//EsXmapK0FDyYtRslQQIkfptJurLd5UyrNRSiXErFphZmJPeqxJATUYd3n7W4kDcaSpOEkALn2OiF3Vm3mtLED+Iq7qSfxjozAAPI+LJ+nXwrE0VVD5C6QxKdtpPMSiC+vF+afTSYY17fYOlKDuV4Gjn+hVbWElI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772430301; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dkLu1MbirnpvkwlAero9ma0VtHlErVyBHAblSr7Sw+g=; 
	b=OBLmHivIrIFN0srXzXQa8uyd/uQDdzuMEF1pThZD8qjl+mIsSxDjFA8uTpZ/NY8q4ZuMmO2SHiN/B0dhufOR1YqdAFGQgZHHwzqGEhBUgqiuLKcALi9KOmEzbfVfTD1OIO5eGw1ThTlzWFeA41q5/ItKfyy1S4ekjC/wz6fNMvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772430301;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=dkLu1MbirnpvkwlAero9ma0VtHlErVyBHAblSr7Sw+g=;
	b=oZ2AGbeZpr5Nac0Ng9jKcrRusUGop2fz4LNNkaPaUBRlu7XZ3iUgUNfpqya+zACB
	tzTmgpEQ46WThJTtU6pu9+ncl04HUt5OigOAjGtu/VNv0kKM5sDKROlB1HWE5iXI8ny
	ZOw+RPTpa19AJfAd90mjBDKwk4NcYE6/BfhNce0U=
Received: by mx.zohomail.com with SMTPS id 1772430298458120.59011214029829;
	Sun, 1 Mar 2026 21:44:58 -0800 (PST)
Date: Mon, 2 Mar 2026 05:44:50 +0000
From: Yao Zi <me@ziyao.cc>
To: Chukun Pan <amadeus@jmu.edu.cn>, dlan@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	conor@kernel.org, devicetree@vger.kernel.org, elder@riscstar.com,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Message-ID: <aaUj0tmD74VmQoG5@pie>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
 <20260302030511.30566-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302030511.30566-1-amadeus@jmu.edu.cn>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_214514_812369_7E60F7E9 
X-CRM114-Status: GOOD (  20.54  )
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

On Mon, Mar 02, 2026 at 11:05:11AM +0800, Chukun Pan wrote:
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
> But do we really need this pcie_port (PCIe bridge)?

This schema is required to be taken during review of the PCIe driver[1],
and it should be the future way to handle Root Port specific properties
through pwctrl-slot driver instead of the host driver.

> The PCIe bridge node (pcie@0) was treated as a platform device, but it
> did not define the interrupts property, which resulted in the following
> warning: `[    2.897980] irq: no irq domain found for pcie@0 !`
> 
> Would it be better to submit a patch to remove this pcie_port?

Thus I don't think it's a good idea. We should go back and investigate
a proper fix for the irq domain problem.

> ```
> -       ret = k1_pcie_parse_port(k1);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to parse root port\n");
> +       k1->phy = devm_phy_get(dev, "pcie-phy");
> +       if (IS_ERR(k1->phy))
> +               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
> ```
> 
> I have tested this change and it works.
> 
> Thanks,
> Chukun

Best regards,
Yao Zi

[1]: https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
