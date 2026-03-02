Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E914ED58E4B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ilg2DVuR7NSROvCOmebnjLZ6ZyzFyyIISwaXCrcXBM=; b=FIOU5tFYheXsnJ
	akYst/CR1xxD4V4Y8ZnI5hM1Cvg6QKXypDemvJyI+kY91p344irITJZK7Z2eaOkgANeNR3PmHhqEF
	YScv1s4jLtuH1pBXH3aFoQT4aiartsbQEKBH0EvUgq9pJvnd4dwxY04KJV4zEHeB+0pwiR/InIxI1
	a13XjQ7qzqbFodwq7wUUpn9YtmC7QH+UHGB/yX8gMwJ6EzD9+ir9Uh5DnEo1zPD36qWeEbepdNZFt
	QI+6EQ8sKWn2Smce/MDxOS4b7HQof986yqiysJZ9+UpB/yteTTkVhINdLV1P2j/xOE4dQyDnBYXDz
	3aFFq069ykXXZYtYiN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtbE-0000000C9ne-1K3n;
	Mon, 02 Mar 2026 03:05:37 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtbA-0000000C9mw-24n9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 03:05:34 +0000
Received: from Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:9c10::aae])
	by smtp.qiye.163.com (Hmail) with ESMTP id 355ebdd56;
	Mon, 2 Mar 2026 11:05:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	elder@riscstar.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Date: Mon,  2 Mar 2026 11:05:11 +0800
Message-Id: <20260302030511.30566-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9cac81e3c503a2kunm810cb4777326d4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkxJVh4aQx4eS0wYTx5KSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUIYSktBQRoaHllXWRYaDxIVHRRZQVlPS0hVSktJQk
	1LSlVKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_190532_736916_0D224D46 
X-CRM114-Status: UNSURE (   9.03  )
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

> &pcie1_port {
>  	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
>  };
> 
>  &pcie1 {
> @@ -320,6 +321,7 @@ &pcie2_phy {
> 
>  &pcie2_port {
>  	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
>  };

```
&pcie1 {
	vpcie3v3-supply = <&pcie_vcc_3v3>;
	status = "okay";
};
```

According to DT binding, the vpcie3v3-supply of the &pciex node should
be moved to the &pciex_port node. This is simply a duplication of the
property.

But do we really need this pcie_port (PCIe bridge)?

The PCIe bridge node (pcie@0) was treated as a platform device, but it
did not define the interrupts property, which resulted in the following
warning: `[    2.897980] irq: no irq domain found for pcie@0 !`

Would it be better to submit a patch to remove this pcie_port?

```
-       ret = k1_pcie_parse_port(k1);
-       if (ret)
-               return dev_err_probe(dev, ret, "failed to parse root port\n");
+       k1->phy = devm_phy_get(dev, "pcie-phy");
+       if (IS_ERR(k1->phy))
+               return dev_err_probe(dev, PTR_ERR(k1->phy), "missing PHY\n");
```

I have tested this change and it works.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
