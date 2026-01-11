Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C8BD2502E
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDgJ0AH6NFP743Vk5rPyC0q2WJA8gMNSRDehgjOU9Ak=; b=1m7ixGe9YVbPq3
	UnBDH+iWYXUXptOmx86GdjIZ9lXN3wC2k4jJDIAZveR8gL0WEO6nyWLYH92Jv7srlWhRYkIm4y7sD
	TeSIfGVHlgt9E5gR/LVNk46hH4PUHuvrVYMJwgyQDZ2PWSxvWek7z/tFACoF0TQuGugGtSopl06qW
	rZjMm2JU1+PprEK6E7J8glkHhoQuhvwhx5/ZuiMS4VxwqZ/PeycxpagEteKX7yulTB6WHLhjsRoBY
	LnCPEAypv8cuTZe3ziMfCQ2gvIqmUtGoHZBVvgLq6/f0NGb3DGwxZ7UXuhPTDkz+ULOVUB7upXZxk
	isR8NE4nQCu/l//7i8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3ei-00000004X9t-40iB;
	Sun, 11 Jan 2026 22:11:28 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3ef-00000004X9Q-10Cj
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 22:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=gPstPsInb9Spla61rJxQEHUOiBzQa2NcgplZETRWFrM=; b=iWtWuLcOj/HdKu593I7VEfL4Kc
	qXuY3yroBM1deApaPnDH9YLD41koVgSi6aVUG19kRu9zcN6d9ri5fKwOXvbQ+JDby4FOy9tiqbcp2
	a00oDAsf6GceFmU2BoPOA4ClrYAnRwQXiznIt+drJ1kCyDnSc05cIQSz4DDnKT99Y6XkLR3/ND8u2
	eWYqeKPqudtWrpK6l0zJTHE4K6HB6fvaHbS3Q+PjkrbRDZty7H3tN5DAFQ52sAFuxuhHayySHpAC6
	VZ7mA6xRjBpeiFf7HMoM9UY6Ws8KuJd9mylKani0fQPsqpqp6DNk4nWcHXYstAg9o0EXIEYlcGqTh
	d+uHTAdw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vf3eR-00000000WRQ-3uhj;
	Sun, 11 Jan 2026 23:11:11 +0100
Date: Sun, 11 Jan 2026 23:11:10 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aWQf_jojl-dzw6LK@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_141125_712991_B45F73B4 
X-CRM114-Status: GOOD (  14.26  )
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

On 2026-01-11 14:41, Ze Huang wrote:
> This patch series enables the DWC3 USB 3.0 host controller on the
> Spacemit K1 SoC and enables it for the Banana Pi F3 board.
> 
> For testing, the following kernel configurations should be enabled:
> 
> CONFIG_PHY_SPACEMIT_K1_USB2=y
> CONFIG_PHY_SPACEMIT_K1_PCIE=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_ONBOARD_DEV=y
> 
> This series is based on the spacemit k1/for-next branch.
> 
> Link: https://github.com/spacemit-com/linux
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
> Changes in v3:
> - rename vbus and hub regulator to match schematics
> - reorder node reference to keep alphabet order
> - drop regulator-always-on in usb hub regulator node
> - drop unmanaged vbus-supply in usb host node
> - Link to v2: https://lore.kernel.org/r/20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev
> 
> Changes in v2:
> - rebased on spacemit k1/for-next
> - Link to v1: https://lore.kernel.org/all/20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev/
> 
> ---
> Ze Huang (3):
>       riscv: dts: spacemit: Add USB2 PHY node for K1
>       riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
>       riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
>  2 files changed, 78 insertions(+)

Thanks for this new version. The whole series is:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
