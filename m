Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F77FB3CEB
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3ywso1EHeZHpDJncJVf+pjFVU82vg57R2pZE0IMdDM=; b=bYcyXDMK44AXTA
	vjNWbiSN1YlESwiR93n6wGIohcr2+u84+agQaerOL55sZSFq8BdLGo8de32dIRLhyKaEk9UXQRB8e
	2UKfmckhwdaIShzI5jRw3UriEAy4bKCXD8rKEztgAgAJ4Iewh5TWjyrvo+yiMX+8pyziN6AoglJyc
	JpCt8Go3QHn1+vfb3rtCZobaZHuRfw3K9DIzQ8V9PSeYj33JURk41aZzX7TraSLyDges5E2RRS9Ay
	9iwgDbwxFJaP9XqOHFCZ4bykgsZ1ZttvU9AvPEKzUNPFbeGbCcwPw3JgnkwsqMLfUt7WhawQhOj46
	P80cBAS81o2RHNVZmJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79MI-0000000B08F-2vCz;
	Mon, 30 Mar 2026 09:56:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79MF-0000000B07r-2OZZ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 104E5416C5;
	Mon, 30 Mar 2026 09:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A8C4CEF7;
	Mon, 30 Mar 2026 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864590;
	bh=JX+UmNr816pa1/GsAxK5jtXhX3XeILF2RnY6t4IhSpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cySsVGnqgv1/05h0ZoMHNOCipkt80NYd5xFMNuVTYx+WhLovD5ruvXZe2bHHwqgOH
	 lRoEiyb9tWbdLM+26qfy++NPVbPyTZmWMVBLjqFqt5jk9nns+GjHNZKJhVJ+HSUIB/
	 LTf0fIlEcKZh+YrA1sElteqH5UzOcSA1FGwywHNtNdLBQFDVinSMeLv/rLl8X1obxf
	 dMQY9scSij+mM/u+Ws8z7EPIFCIjujwWLamE4IQkyai1bhSqif7d2yypyh6IR6jjNB
	 Mp9kslwlmVJim4Cba7V/invEuheElMC+Qfw+r0Kml8qLogbHsIQEgtQ7UDLk28Sf2/
	 r5p0MRVEnEg4Q==
Date: Mon, 30 Mar 2026 17:56:28 +0800
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <20260330095628-GKA960369@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
 <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_025631_654830_97BE7E8C 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Troy,

On 17:50 Mon 30 Mar     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Fri, Mar 27, 2026 at 19:40:40 CST, Yixun Lan wrote:
> > Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> > i2c3 is reserved for secure domain, and not available from Linux. The
> > controller of i2c7 simply doesn't exist from hardware perspective, as
> > vendor directly name the i2c controller used for PMIC as i2c8.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> It looks like my Reviewed-by tag got dropped.
> The changes look good to me anyway.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
I realized this afer sending this out..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
