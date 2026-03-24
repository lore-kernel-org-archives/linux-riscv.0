Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAEDFEC11A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iC22w7XOk5OFft/oGGaAo4xT17sc3yitq5bokoklrg=; b=WdZGSOO8pmDa7M
	2seQ3qxr9Bjr7XSC5BSMIXzzv+sqyHq3LQO2ZPkUVheWH2XDDFDTzml2zwULT39oqrWcW4KkPuRWh
	bCbTxNy36FIqKdwF6reRdKimXw76gUxRvhVSDJ2bNM+EqhueVrTUKanMe/kokKUYKtltmvAPM3+fK
	6BQfLZUtMBU2kE9xRP34pKEbn96ONTDUi4R2yQPuVP5CJjExnUUfuaPaNkVdXjO95Y/3phe2mq06N
	x2qKM7bD61DpU84k4ySQjFxvoXRFAStTCFJC1dwCgqT8klHtj0DJIwK6sfLYtTkFgf3PQMLxQKMu3
	zTJ8QcnXDjoX6mJyK+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59mp-00000002HHn-0avC;
	Tue, 24 Mar 2026 21:59:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59mm-00000002HHN-3A8F
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 21:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9EF7440EC;
	Tue, 24 Mar 2026 21:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394AAC19424;
	Tue, 24 Mar 2026 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774389579;
	bh=3W9SbqXhQUaQ5JV8iher4Sg8sLttLuS/+h+tUjNkdqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNf7aGe2D7Mr7xsWaDsatMseJJ+U+s2m0Kt3vNiYSrRqcRc65Vc5lx4nJ8J3D/Ebo
	 94dUggiHvTj4XsGkZionAE8lQUFLo0+5BCtlhB/JWHAsBbYQN2GTk71yuAP5H1/0hm
	 SZD2PrdmC3qlYnCDjahmsk5NAKvYCQcqF2A81ft5xjxHuqpZxz/mFBptcHUkD9kgrl
	 MCxk3rfD3hr3nzAybhnSUQUb/Z8E3tKdD17FHhN8PKmjBfjlBnzTC9tKoNgasSeNJ8
	 OWmV5kfec0UlVicoxPMVh0Udi/g9eqy7akhJFS+2gDp+hQJNDGo9gI6JdpBlUCMPvt
	 PTAG/AOOqMKPA==
Date: Wed, 25 Mar 2026 05:59:37 +0800
From: Yixun Lan <dlan@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324215937-GKA767626@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
 <acLE5xnEBoCtW4Vw@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acLE5xnEBoCtW4Vw@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_145940_838478_3737BEB8 
X-CRM114-Status: GOOD (  26.37  )
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

On 17:07 Tue 24 Mar     , Yao Zi wrote:
> On Tue, Mar 24, 2026 at 05:02:20PM +0800, Yixun Lan wrote:
> > Hi Aurelien,
> > 
> > On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> > > Add the QSPI controller node for the Milk-V Jupiter board and describe
> > > the attached SPI NOR flash (GD25Q64E).
> > > 
> > > The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> > > SoC supports a frequency up to 104 MHz. However tests have shown that
> > > the flash is not reliably detected above 26.5 MHz, consistent with
> > > frequency used in the vendor kernel. Therefore, use this frequency.
> > > 
> > ..
> > > The m25p,fast-read properties is taken from the vendor kernel.
> > > 
> > So long as this is verified and works fine on board?
> > 
> > > Add a corresponding flash partition layout, matching the layout and the
> > > names used in the vendor U-Boot.
> > > 
> > ..
> > > Also add the bootph-pre-ram property to make the device tree usable by
> > > early firmware/bootloaders without modification, as U-Boot is stored on
> > > this NOR flash.
> > Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> > if not the case or has not been tested, I'd suggest then not to add
> > this property..
> 
> Currently no, but it would be a bogus if we could do it at introduction
> of the device, if it's really necessary in pre-DRAM stages of
> bootloaders, e.g. U-Boot SPL. This would reduce the duplicated work of
> downstream projects if they decide to switch to Linux upstream
> devicetree.
> 
All above arguments are based on assumption, I object to add things randomly
without real test proved.

Let's wait once U-Boot actually switch to use upstream devicetree.

> As SpacemiT K1 supports booting from flash, the description of flash
> nodes are likely useful for pre-DRAM bootloaders.
> 
This is still a 'likely' ..

> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> 
> Best regards,
> Yao Zi

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
