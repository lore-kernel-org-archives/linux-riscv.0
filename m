Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E07C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 19:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pj8nKyEbAO1eS4yr78KrlGX+B4RBwykoG7ZZ2nNZA1Q=; b=w8U3DaJ7tXoEI7
	d8m8gUNMlAtM6vXQy++ng+graF30c7dBkiz8Ta6Bpvt00iIKN94s6VKrPGhxoMEd28tLQDu6TIdDN
	5eJX/vW5zeNPqIzZFsOUh5oXKkLecUzLcU7Y0D9ASTwAd2Xc4DG8kMxZXtSeY/3YkP10x0+80DI/w
	UEftbWKYP/3R2wF8gZ2W+wzy1XjlMXdFGDZXNm+Xk92Jxzu/V10hRZMX+LQtVHmWkejo0Jsvpv96J
	Sel7WQqFbmOpwHYO4Cpu0S0cCyr4K4ronXatMmWhRI9fAs+t5j+v1z7HTrxTrmuFdBr1RkV8Opurw
	OqnqpsJpCjAxLlujMjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeQN-0000000Ezs7-0YXG;
	Mon, 24 Feb 2025 19:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeQK-0000000EzrG-0NJv
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 19:47:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E71415C630D;
	Mon, 24 Feb 2025 19:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70351C4CED6;
	Mon, 24 Feb 2025 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740426446;
	bh=8PPfPNIlrgycO/JJOciWBKiZKIJa1huNNTeyXSWPEkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rm7y3ZVXJmB2km9yUEhekLivuQWTkR4g+oJXvvtvZc7PfVLuPVtHC8kJemN55U0GY
	 M48YVPM7boR8Ho2suE++BS9qMY9A0giAcepAvErEaMtIBD7dOnmz7AfRzQMqM8iIcx
	 Mn1D7a/MC17q7i0q6h5Gwfex9j4YI0Wd1sNwgnpd9H+9aAKhN3OuMbPhf86bbQS9/j
	 /G2rX6j2PbUDyqzDqMf/R9zeRAaECbYf+dKa5lO8Prjm+tmx4BxJAgGd0Qzu8Sg7T1
	 i+RaJBFcSHaZxsygIsq7rvgyWnI/owpd0XqwXWQKVEVLh8BpMlpxK+JQmVO9HlGKrs
	 C/o/PvlwdmYDA==
Date: Mon, 24 Feb 2025 13:47:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <20250224194725.GA473475@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fanm6m6fx6cqwalhdvrxmjzsluiyptbvrwbi5ufwbqmxsf62xl@lntprhkjv6tm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_114728_173387_0C134551 
X-CRM114-Status: GOOD (  15.90  )
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

On Sat, Feb 22, 2025 at 08:43:46AM +0800, Inochi Amaoto wrote:
> On Fri, Feb 21, 2025 at 05:49:58PM -0600, Bjorn Helgaas wrote:
> > On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> > > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > 
> > > @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
> > >  	  Enables support for the DesignWare PCIe controller in the
> > >  	  Rockchip SoC (except RK3399) to work in endpoint mode.
> > >  
> > > +config PCIE_SOPHGO_DW
> > > +	bool "SOPHGO DesignWare PCIe controller"
> > 
> > What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
> > subject line and in Chen Wang's SG2042 series.  Pick the official
> > styling and use it consistently.
> 
> This is my mistake. It should be "Sophgo", I will change it.
> 
> > Reorder this so the menuconfig menu items remain alphabetically
> > sorted.
> 
> I think this order is applied to the entry title in menuconfig,
> and is not the config key? If so, I will change it.

It's the title shown by menuconfig, i.e., "SOPHGO DesignWare PCIe
controller" here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
