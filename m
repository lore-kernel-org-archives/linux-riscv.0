Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF69F10A62FF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 02:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk13zMmeDWvXnct1dmPbOpM9xojpX9uhqd87H5RKRTc=; b=cTAuWnEuME7gtY
	7YcVKVZ1d77qUz412yzqTXUcx5xG9GIneB9VE2Rhn0NfZhYCMQgtRFjy/93Ix+Miqg40vusZsOM+n
	HyAHIVS3SAL9Mor9qLowhE1VVkRE1WNl4XGw6THR89YSH5EHzU548sbIAtR5IQ3judMMtHyqDJjy5
	9IJgtw6a5tq7eiECQopiZhPBTHRWIq6mo8nIjggDM9OCJ5W/75UjXk2vjiG0Plfv3j/CKLJ+bpTjT
	g0uXoyzcpZbFENuUARFB+L2SpmZ7uA5TIJX5z3hpbasKzRzqiBFTB9kMqEEPlOK/wkulwmRdYvgsN
	Yok5Ei6Azh0/9gubOHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x6n-00000006YxA-0eVn;
	Fri, 27 Mar 2026 02:39:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x6m-00000006Yws-0EiM
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 02:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA5660054;
	Fri, 27 Mar 2026 02:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52472C116C6;
	Fri, 27 Mar 2026 02:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774579174;
	bh=nPT7x6y5OId4DsW14tOEiyeCCaLNclGNjCQE6YiTrPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev26ueLCManETECjx1/dcSq1/69edXtwNfKl/zr0ktQbMoiAivqI624JX9x5Wokiy
	 YW/nt/DrkJqKxJBwvV+1aIHjqLbnli/kNOB4ZM/haGyWfUZH5gVnlgf6DOLwxPJ9p8
	 U3J/HQvmH1cjbTsAn7xAM8zdTGPXuJvi0bV+Egds1cniXdE2zw0wm8NhvSvSPeGrWU
	 wmzS8vLDiP+/K9BN0iAQe80ydDQzAdEq4WPDSrN5OwU20D2ss3laTJbSNAGUIDGB79
	 s3UkD3COFqQ69QDx1fkfPWBOfu8XL/tX0DpIFs2GrHim7Yj4I5W2X5rwqcF+ZlhG/5
	 0UtCqmOsZ2ZHw==
Date: Fri, 27 Mar 2026 10:39:32 +0800
From: Yixun Lan <dlan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <20260327023932-GKB847041@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
 <DHBSTI0A3SOW.PCIP544HUYP4@linux.spacemit.com>
 <acWxqkR8Z0rwe4hI@zenone.zhora.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acWxqkR8Z0rwe4hI@zenone.zhora.eu>
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

Hi Andi,

On 23:23 Thu 26 Mar     , Andi Shyti wrote:
> Hi Yixun,
> 
> > > +		i2c2: i2c@d4012000 {
> > > +			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
> > > +			reg = <0x0 0xd4012000 0x0 0x38>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&syscon_apbc CLK_APBC_TWSI2>,
> > > +				 <&syscon_apbc CLK_APBC_TWSI2_BUS>;
> > > +			clock-names = "func", "bus";
> > > +			clock-frequency = <400000>;
> > > +			resets = <&syscon_apbc RESET_APBC_TWSI2>;
> > > +			status = "disabled";
> > > +		};
> > I think we should add a comment here to explain why there isn't i2c3.
> > Otherwise, LGTM.
> 
> are you going to add a comment here?
> 
I will explain and re-spin a v2, and add a short comment for this:
- i2c3 is reserved for secure domain which not available from linux
- i2c7 simply does not exist from hardware perspective, K3 SoC want to
keep align with K1 to use same index of I2C controller for the pmic

> > Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
