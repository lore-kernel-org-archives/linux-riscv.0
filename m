Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ACDEE3691
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDdjO6MB1nLJl0PQtqZKtQg4R4bpEGGDeRGxdY72uNc=; b=fqZ99TO0Vzrxcv
	o4Ncg5v0dOjdjowpE85koWTpMdClxJ/OWnHrxyIi58oPMOpzT9AYpQQ2xVp/ifT1hsKOx03hHlIMz
	4Vr4yIO3V07tplMBo/6TLb3yL15EW1IDm9tBTLP05DPASW1QOQ6A0bKV4JwA+ZYToWgvYYtrr6Lxv
	fwYn2XKVMYFNWeuI6vjZOHSUdbGgzHUQn3Z4j+OHg0WSi2/qDAbixxn8K4nxk/b67ToNiMHQzRGq9
	sNK0t/kM4OlEDbfN5xSEw42RtY+88bkKnNG7XowV4hBUX2fhoa01LmhZnU1IozPxV3oOKXnAttDuL
	3d+UxXm2Slf//4o6/pfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXut-00000002DFV-2YNk;
	Thu, 12 Feb 2026 14:43:39 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXur-00000002DEv-1GH0;
	Thu, 12 Feb 2026 14:43:38 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4DB58342445;
	Thu, 12 Feb 2026 14:43:34 +0000 (UTC)
Date: Thu, 12 Feb 2026 22:43:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260212144325-GYA164498@gentoo.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
 <aY24UOvYsnh_7ZCO@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY24UOvYsnh_7ZCO@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_064337_395135_E34E83EC 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Yao,

On 11:24 Thu 12 Feb     , Yao Zi wrote:
> On Thu, Feb 12, 2026 at 09:38:55AM +0800, Yixun Lan wrote:
> > A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> > it will fail to work properly during next connection when devices
> > connect to roothub directly.
> 
> This sounds like a bug. Does it affect K1 SoC as well? If so, I think
> it deserves a Fixes tag and backporting.
> 
yes, but I haven't checked if it will affect real case since the problem
exist with devices connected to roothub directly only..

anyway, I think it deserves to add a Fixes tag, so will do in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
