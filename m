Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE1ECD5BB4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmUa/6BGWRXCOuygzAp6zMc8ZRUYPhIq2xMQPVA6UjY=; b=kNXnM51lkyGSvv
	96RxdHqZ33/VNfnHaVQiN36AwVfNgjWD2O4qIhqx6gG5TfrG6LS/l8+dOCAvrC+XuaY7a2F+3oT+8
	VlVMvs1eau4E4wT31C1Oj834ndrfyO/k4gZVRywFY1X2j9h6wiAVV9DbIqOtkH16g3ft2nbNKrN9w
	y5OFgVgzdfTS0SGAxMrNEcJVINZiEx7oI86qOOeo1gL/5dIzFeywcMXlFX8TA4fknbd8Uo9fMAQA6
	u4MTNn7Gy6fuWS03LFKSPHZbcF5hlntj5uwLYajNd4qzEW6PppKkHJPYhmhzj8OLwmN4VDpQt+UYP
	cvYnPFzu60q5owdlVXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjiA-000000011xr-0NEI;
	Tue, 26 May 2026 04:48:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRji8-000000011xX-2gI4
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 04:48:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E3FA6008A;
	Tue, 26 May 2026 04:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1AD1F000E9;
	Tue, 26 May 2026 04:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779770891;
	bh=1NEJLKo37Ve3sSi9fF3jtlIXIxD3NOka5l+Y/9sfLuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJlgBL5h65cDlNcBAsEY/xeIS06gMA9SwlZoxMRSu8gVxrybyP0EzPAqb8KBjPjbd
	 a5Yap1XMmiJMDUVQ/grIFNnJ0sJOssCvxgyBJZfJRUJp9wR/rN23C3gl1Oq4edj5zu
	 63WHEFDGYVLiNqoadrio4pIeou7aM6aTZqlt7vN4jx97gLO2p7wwbk2YHmtgRirOQX
	 LofIrER6ktjiU6lv0sTBxvryEQM2jySpSp9G687yQNrf10/qE3yOvyAdoC7WokT5LT
	 AI5NRYHhE1PCTKQySALfGfBe05IQWmZw0LHdZluXkfuOAokot+wYCWzjYvyTguShm2
	 Th6rpoJjQyxMg==
Date: Tue, 26 May 2026 04:48:08 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Message-ID: <20260526044808-GKA3727415@kernel.org>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
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

Hi Junhui,

On 18:01 Fri 22 May     , Junhui Liu wrote:
> The gmac_clk_ref signal is optional for the GMAC controller and is not
> strictly required for all hardware designs. In several already
> upstreamed K1 boards, this signal remains unconnected or the
> corresponding resistor is marked as NC.
> 
I've not checked all exist boards which already accepted by mainline,
but just ask, to be sure, none of them actually used clk ref pin?
otherwise we will result with a broken GMAC/Ethernet driver..

> Furthermore, the pins for gmac0_clk_ref (GPIO 45) and gmac1_clk_ref
> (GPIO 46) may be used as GPIOs for other functions even when the
> Ethernet controller is active. Splitting these into independent groups
> avoids pinmux conflicts and allows boards to use the reference clock
> signal only when it is actually needed.
> 

> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
