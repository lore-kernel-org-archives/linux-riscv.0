Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3000FF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 07:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IdQVDXJARpLqi5ALTY2bKTEY0tQdwTW1giJ+ZAfU9E=; b=uZt8pbXJiSLXzI
	+UWQQak8FAabodO+w/Dl+V8njDskERK4fFhDeJAkSmgJ4QzfXimq7i/kDdmThQk3P1Ot534KdsIig
	p2so38iazsydiDBQBgAHIpft+bCwMZEFCjlvBOxCRC1pvydDqMr89WKnau1hWtWse5gn393XnCMFd
	PTXRjBJX5dsJw3b+ygsRvzSu+TvSNevUhVF3Q0hIjtHuumrRffKfB1ot08I0a6Oz9lf3GASGgGDA0
	Y4ufzu667X2KfaI0rIjr8A39nTl3TNzNXeyP8ET10L3DPDULN26fG5I6Exg19RgcbHdMqJR35KrGR
	7QhxJjsKJWp3Die45APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA8I-0000000FOue-2J57;
	Tue, 05 May 2026 07:23:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA8G-0000000FOu8-1Iql
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 07:23:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1423C40D71;
	Tue,  5 May 2026 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558FC2BCB4;
	Tue,  5 May 2026 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965831;
	bh=lVEGQZADhV3IBGi5bRZNIIRtTV+/BGvbWgLuLVuyE1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU9cyXpwi/EQ/gI46x4DzAEILkOO0ZXMCKA1wGYpZBq/nmNEPhVgMYtF9f7wrLAg3
	 PaZiRljnfn1a1T5gnS9nkEUHuF+9Wu8xLmKPI+8N1R/F21ZAL9bcnBJQ0NvpLJ/Yrg
	 Dd2jEZZKP0UKwJGxcQqwP28PRCcLiz7wJSp/7woOzKrMES6/O1derypCUGPz+phdKx
	 +n2Hkh2/UqOiiV4OfyT+ADhspS7o4m0Ytov/Pl9ur4W/Ac3OX4MAxoiedwFyW+rrh8
	 VwQcw0VtQxcxPo03i+5y/a3ZhGkLBChcKzefdBec3adw2y26EYbSg/h6NzBMMlMxAk
	 QeS9hTt01guow==
Date: Tue, 5 May 2026 07:23:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260505072348-GKB3537744@kernel.org>
References: <20260430-reword-overstep-3be08b7eab25@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430-reword-overstep-3be08b7eab25@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_002352_412317_9F4BC12C 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Hi Conor,

On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Because the default console's baud rate is not set, defconfig kernels do
> not have any serial output on this platform. Set the baud rate to
> 115200, matching what is used by U-Boot etc on this platform.
> 
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
