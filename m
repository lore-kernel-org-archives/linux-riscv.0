Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C7FEE3690
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzw4fIGG2cn97VJTg82ZgMhipkKiXDsh24E9dEKtW9s=; b=KHMt9KnGMzTTE8
	N8+GC/dlTg3kisJfVbaEO+cQEToyG1PAc2b4EwE5nkmHP0NQgO/ILIrvGhFcCocKgzm0pFhrO36Kp
	lSKergewmaUMoOZ+Qh/UAv+PYmoBuByU4kk2PTmQ5O9hYjuWjKOuq94klLqcgFxOll789zNnaxQcU
	9Zz8hMOSyEA+7qs53OOpOra6mJrJaqj0QVGGaROeHn9u96T09F0ntmjjQypCUElTq6VEG+PSx3Fww
	c4d0P4FcvIaZ2M8hUNS5fY6kQwxNCJG/DR+0xnVNRJTV/0gfbFT7xddEWtGO0di29Bst+TkTHr/6y
	yx+dVOs9J4ajIxuN8eRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXnF-00000002Clo-46PZ;
	Thu, 12 Feb 2026 14:35:45 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXnC-00000002ClG-3v4L;
	Thu, 12 Feb 2026 14:35:44 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D36B634243E;
	Thu, 12 Feb 2026 14:35:36 +0000 (UTC)
Date: Thu, 12 Feb 2026 22:35:30 +0800
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
Subject: Re: [PATCH 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <20260212143530-GYB114046@gentoo.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-3-43578592405d@kernel.org>
 <aY253_fOkoQKbi8g@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY253_fOkoQKbi8g@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_063543_031731_D74B3E7E 
X-CRM114-Status: GOOD (  11.33  )
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

On 11:30 Thu 12 Feb     , Yao Zi wrote:
> On Thu, Feb 12, 2026 at 09:38:56AM +0800, Yixun Lan wrote:
> > Add USB2 PHY support for SpacemiT K3 SoC.
> > 
> > Register layout of handling USB disconnect operation has been changed,
> > So introducing a platform data to distinguish the different SoCs.
> 
> Would it be clearer and simpler if you define separate phy_ops for
> k1 and k3, and point of_device_id.data directly to the corresponding
> phy_ops? Then there's no need to introduce either spacemit_usb2phy_data
> structure, or spacemit_usb2phy_disconnect wrapper.
> 
Yes, I agree, thanks for the suggestion

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
