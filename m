Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018DC105F79E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blzUNatzVKszTYcPN34ibs7/Y5+LL7H2CNw8NysWza0=; b=WYt2L/ABjZ6Xam
	yu9x6+csOum0CflrbJNazm5mEDZOw96BKCYsYiZi8BI1WUzgIFe3gTVNDNyaAjjPHjwQdxgSgQJLF
	nZWqws7RpN6cufEDPJ+VWM/oRVijYE6UNYb/aETftE0OU6RCzsAz7/fMrz7USVS2o6LaWdbiUL84J
	8nhKqTiIooYBmjmsmGR3JKrxzHRNI7sweGpM384x3xMJzmqNUw8bEuATakJL0zujhP9ttMhfrIXYR
	LyccBuNfFh4ednNPTjSPTqsMyK7jq+OpE/KJZniBB966F+PN7RZGCqTEPz3n3fBViPYB0Zd5m55PL
	YUUitMo8jGKExn9zTBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0H-00000001bt8-1om8;
	Sat, 14 Mar 2026 08:05:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0E-00000001bsl-3VGx
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 08:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F281E44307;
	Sat, 14 Mar 2026 08:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8448DC116C6;
	Sat, 14 Mar 2026 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773475539;
	bh=xtjslWx4fw62YVGcblCJxi7bzvL0cBKciLoO0Dsr5G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrpHf9+ahFoxkfnWX78OuatZ7zSuGqkeyHnCyBptqF95hK74YLTwChV9AFrEXGk8L
	 +XKIE+ZWrJcB9ONro2i2/MO0vj3MTBc3vnflg3MLgcE/BFaOau6Zd0QXSxglLUwJNm
	 VntAUA3HulkKoxluSIBTTfwl15TvQb1/hjsKSfmkGx8bTrS3wxxt+e4Ky/eraiIx0Q
	 E9soRgfD/OnNhWVhwi2vgoQJDXTcPmK0DMfiK6Zw8TtiYYPlH0TQrsvAFKFB6HV+Cr
	 pIIs9N5AVNvHRJlp2e4gTNEITuyjEsvd0TtIYOknI+6yIZLRwtAWIjjfb5CwALSgyb
	 bW1yin72omPsg==
Date: Sat, 14 Mar 2026 16:05:37 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260314080537-GKA415778@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <20260313-certain-idealistic-urchin-001e96@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313-certain-idealistic-urchin-001e96@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_010542_895179_D51D1114 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Krzysztof, 

On 14:42 Fri 13 Mar     , Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 10:34:19AM +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware.
> > 
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> 
> Either this is ABI break, which would need explanation, or it is not,
> which also needs explanation and then fixing current bindings before
> they are released.
> 
Literally, Changing IDs would result an ABI breakage, but since we have
no consumers - no driver/DT use those IDs so far, so we could safely
renumber it and push as a fix for it. This issue was already raised by
Philipp in this thread [1], and I agreeed, will put some explanations.

Link: https://lore.kernel.org/r/20260312112858-GKH302167@kernel.org [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
