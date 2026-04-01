Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32866D3517D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvhxwyiCNsX1kH8r4kS2awDoLECPxUpuBYp8uPBVO9E=; b=aOdraCxck68KkF
	kV/ssQDAVgv3MDIPwm1P5GU7v0gu9ttJ2I5kFSoAB2Mf0ufPiURd1s3u6R59eXgHZd2PGiONGNoxD
	8ddHF0HZXor/Vu97HrvUmI0JftVkcr/DdoHdTLKE/y8/AgkuT3xz55chbRwfui0Vca/5s4+wfDqwt
	Yfb6fiLVgIJhm+tzG0x0dVZLW6/HagJ+dw0O2dh670dZxumUpKRsswDs/uJFV2sygg7QPbc0Bt5Fh
	SvhZfO0XatiKm3k8gRQXPeUQMTr9fEtqs8OiXy7ijTnv0wIRaSX4Uo/TbueY6DW3k8TxLSOS+/Nz2
	BYgYtXob+bEk2wvsEsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vI2-0000000FGq6-0RQ6;
	Wed, 01 Apr 2026 13:07:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vHy-0000000FGpV-3icO;
	Wed, 01 Apr 2026 13:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 796FF4020D;
	Wed,  1 Apr 2026 13:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D89C116C6;
	Wed,  1 Apr 2026 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775048836;
	bh=3ZKzNrUwMIHn6dhPALdVNb5G43e3YDmvzJegFVvQeAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INthCzna6u4qZOg0xCpIEj8XgnOT8J6+WweNGRff2a25OzhsScGaDe/NfK8Ui7F3l
	 wcTL+2r9CDDzCj/l07TgY8TB9h4YVwGKQcm0rcM/Zv/9ojn48m8CPSDtGZOw77ANDt
	 sfCilYhtStkjFswMw91yoOQ5xV93i7lH/wJFwnErfso0A9CWWM4R+usOtg1D5Fpgs8
	 ghj2KTWVIhVXoUNnNRQpRkKCO3mGZb6Gl1J4PQVARp7mDZgSf+mNnVcB0V97pn/ubR
	 Pmx0E3NhmWZaBn4eJriAz+LXHrVC4nL/e+hnd4zJ2noc8gT2MwaPO86Jeix0SK1BwC
	 t592VqBC2Hsqg==
Date: Wed, 1 Apr 2026 21:07:13 +0800
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Message-ID: <20260401130713-GKD976850@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260326001443-GKB777612@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326001443-GKB777612@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_060718_968621_F1B3EB2B 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Vinod Koul,

On 08:14 Thu 26 Mar     , Yixun Lan wrote:
> Hi Vinod Koul,
> 
> On 01:00 Thu 05 Mar     , Yixun Lan wrote:
> > The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
> > patch [1/2] implement a disconnect function which is needed during
> > next connection.
> > 
> > No DTS part has been inclueded in this series, instead I plan to
> > submit them later while adding USB host support.
> > 
> > I've collected all patches and pushed a complete review branch here[1],
> > for people who interested to test easily, which include DTS and necessary
> > changes, other patches may still need to improve, but sufficient for
> > verifying the functionality.
> > 
> > Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]
> > 
> 
> Just want to ping this, Can you queue it for v7.1? Thanks
> 
Ping again, I'd like to see USB2.0 support in v7.1 for SpacemiT K3
SoC.. and I think this phy patch is the only dependency that waiting
for, the USB DWC[1], and hub[2] patch already merged

Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c05cf9d274daf72dc7e433480cf2e0e888f6bd89 [1] 
Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=00b4fe5be06aecd6426930de86b7cffc2330f4b8 [2]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
