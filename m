Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71A6F9937D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDWwUWcFu7h5V3QihsuPl7iTAGPno3b7dMPidJYxQjk=; b=XqnnoO9UXzQYnZ
	AGHQYQtZARrvend9RFzb4VmzRUNy14yT1Vfs50Xw4WG/QiVydE0xVKzPLQt41mSVZtw4nJgLP4Ie6
	1D8Chk4VMge5Zz7RwEPsFIKoXxZNQgZih9yEKczHrWVtd9uyMXAS7CcxnAzU7Gb3JHP9ZWa/SuO2K
	FrHvra0aqm9YeHBGnQDZyY+d3pYBH3aIcL3/3m4y/JZOsMPKS+Nc27p+32BAaXNPnG3VuNkF41bpK
	mGBWubDnlgBvx2g2iJOws0xQ43vwbpcTttri2H0oyEdoiAaX/HjFUZa1xB1Zaf3gCpRm7VuTyqU7I
	NlgYMH8tJnlZMoehn5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsby-0000000BYh0-2F7n;
	Thu, 23 Apr 2026 11:52:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsbt-0000000BYgF-2iWM
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 11:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EB2C40913;
	Thu, 23 Apr 2026 11:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2DCC2BCB3;
	Thu, 23 Apr 2026 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776945162;
	bh=khu9hCGRWwD6P5ATFBgT/SxBupxKRfuGObzWbF9YMd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug/wc//uDsfM07EOJTntKPjUWKDYJb9g4EuqFSuAZDa5NPLOwUWgPIMp9hsbQoZ0Y
	 8mz5b7Up60NgQ2kzIRH8j91jOfvgRKmr1mrWSU4AB98RPwtzYY+LPnrMQzkWj5Y9qY
	 34pB+P6TdorIutGVzBEDP9Rvar3e+gPNFCld6aSZ7aq0ZbOhCpZN49o/u6e+hPwgMR
	 3Jg47Wo5CLf2ubqln3bYzE/4/El+fbP+hckE7gmzpF1dCRFBZRsBTJ1LTaZ1epLUdt
	 IUCAMwLQ7eVqMEkoC5wgjN8UU8d/Kw/qPiUhfcQpDAVvqJGFkl9Jz8jT39OmUSafmB
	 C2XpYVpk/0w3A==
Date: Thu, 23 Apr 2026 11:52:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
Message-ID: <20260423115239-GKA3186731@kernel.org>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_045248_542407_B5CA2F78 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Sandie,

On 14:40 Tue 21 Apr     , Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
> 
> The series is rebased on next-20260420.
> 
Looks good, likely will take it once v7.1-rc1 tagged.. Thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

> v5:
> rebased on next-20260420.
> 
> v4:
> - Patch 1:
>   Add Acked-by Conor Dooley.
> - Patch 2:
>   Copyright begins from 2026.
> Link to v4: https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepcomputing.io/
> 
> v3:
> rebased on k1/dt-for-next.
> - Patch 1:
>    Use formal format user name.
>    Remove Reviewed-by Heinrich Schuchardt from internal system.
> - Patch 2:
>    Use formal format user name.
>    Remove Reviewed-by Heinrich Schuchardt from internal system.
>    Add uart0 pinctrl.
> Link to v3: https://lore.kernel.org/all/20260407055557.1202713-1-sandie.cao@deepcomputing.io/
>  
> v2 (deprecated):
> Link to v2: https://lore.kernel.org/all/20260331071110.68321-1-sandie.cao@deepcomputing.io/
> 
> v1:
> Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/
> 
> Sandie Cao (2):
>   dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
>   riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
> 
>  .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> 
> 
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
