Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB855105A583
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/2OQIDzcWo/wTPigyYlJFkmaGuoICGJMYOFirtK8HY=; b=sRujnsZFRp/q05
	t0fJjwsTCQSEtG2PgirShRUoW/AyQSjc7Nv9QmvC/cfz8cDzEV17fyhAbWEx0xSlBTW67w2en0H5R
	oFWyhvUDwB8inTp0as78ntRapdW9eIUMCY7vLBmSY5iKj9LGO4dKoLBgh/wFLcdIng+GtppDHH75D
	qwDy7vAj9d2pI5k+8lfBnTyrBWR9IHEjtwLNXlCzRCB6QOtVbw4PjclT+T00KJHr7zUjCsRPsydPn
	oRda6ddhciTwAQTIOBizxiv+g/FEjYKO0UPTq1Z/bd+c1WS/elVwNSXnuEscXfmIMoubFoG5XcznD
	/9CVARoYwH1qMSuXmVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eDv-0000000DwjZ-31CD;
	Thu, 12 Mar 2026 11:29:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eDu-0000000DwjA-0CdL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 11:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F6BC41A51;
	Thu, 12 Mar 2026 11:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00FEC4CEF7;
	Thu, 12 Mar 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314941;
	bh=I3jwJdCsHstSRrFGSH1oMaY/GRHwpkyvBFzK3V5Esg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRAyWZLCtwhisWSIXGIBgkFyqGlK3d2PUxqdwBm7VoWQdRQC2OeiR+7DdCgy6VYmu
	 TqJ1XEIw7CFONs70RY9lvFnMxNll6VONm0YfESkI2DFSyIKNPz5LZET9EEAk7H6Wzp
	 SoHSYdG5J0OXj9A/YOvAlT5Nyk0D0J6LMDMqfTCyyBuu/RWBLEqd8CFKjZ5XAPgJA3
	 H+L/umWKH9zRxubbgiqTjoQAaMDO1Uct2u69UiVuAqP4zCZenoo2g3Y4RW0njhWUxi
	 NFBhXLvDBIwNn+/SsWmQOVA9l8PPwZiQj/GCfA4qeEMteNyoC/Nyu7IJffJOjvzy0v
	 5LVI8dotSIsgw==
Date: Thu, 12 Mar 2026 19:28:58 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Message-ID: <20260312112858-GKH302167@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_042902_109364_EA33CCF7 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Philipp,

On 12:09 Thu 12 Mar     , Philipp Zabel wrote:
> On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware.
> >
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
> > index 79ac1c22b7b5..c12f8bd32047 100644
> > --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> > +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> > @@ -97,11 +97,7 @@
> >  #define RESET_APMU_SDH0          13
> >  #define RESET_APMU_SDH1          14
> >  #define RESET_APMU_SDH2          15
> > -#define RESET_APMU_USB2          16
> > -#define RESET_APMU_USB3_PORTA    17
> > -#define RESET_APMU_USB3_PORTB    18
> > -#define RESET_APMU_USB3_PORTC    19
> > -#define RESET_APMU_USB3_PORTD    20
> 
> This is backwards incompatible.
> Are there any device trees using the APMU resets yet?
> If not, I wonder if we should just renumber all APMU resets into a
> contiguous range and try to get it into v7.0 as a fix.
> 
No, there is currently no consumers, so I could rework them into a contiguous
version, thanks for the suggestion

> Also, this breaks bisectability.
> reset-spacemit-k3.c will fail to compile between patches 1 and 2.
> 
I've tried a first version to squash the two patches, but got a checkpatch.pl complait
for binding should follow into a separate patch.

I can combine these two patches into one, is this Ok for you?

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
