Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4019CCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D06TxcWTgD1+tADy8oKfuBSBNvyVl4775d/hGT+okPE=; b=PJUJ+DyzN/Sl53
	MWC05SlOzxUiLEQzz6+ZQGy/XvbrYTDqwA4VhgkebsHw25m3+9BAGSj+LUzht67rJsOilP94llugb
	kOXkjtFfihxVCzgZeZ1g4rc1xUsx/yTO8E1Z4QzZIM2/f9PF6KjdAJnIubmrRcFMla30IulXle7bE
	lSnmI8rrtGSVSAOeeT9YRfjmayTJfRYbvv1gjShVBlJBrDX1+gs3Zi6XStYrNnNO3P3xv6bILaWTR
	GFLLraI1dmlcJpmeoxDAqN8OKPZOx1anRqmVLaaYCjr1w6bFyzBQ+spHIMYmkHHfegBstXZKpUP9D
	g9Emn56GhiFJLsLzxzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZSi-00000008cTh-2grC;
	Tue, 16 Sep 2025 17:27:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZSh-00000008cTV-0Rp7
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 17:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A0B6601DD;
	Tue, 16 Sep 2025 17:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7AEC4CEEB;
	Tue, 16 Sep 2025 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758043645;
	bh=fWZs1qHqxRc9T0uAavz42c01e6M1hsLN3wfmP16pG5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pO0gLIw+EEmWFX6tZXueH7cSlByMKixpJMBIDvQkWSCEZhMB/8zQvhP4lc9i93XUJ
	 3y5YvqeMzAp/aMJDyS06ibIi3WQHXNveV95k+wyRs0wP4cp6/oEz7uOpat2evlxuze
	 nhSLYhb2uEHWlDQn2+Z0NU2Znp0dczegfKAwkEJJn21vmyDfGyyKNHSeqHW9+7IB7I
	 pMOemdOTeWPys3Rh8+aIy7LbfSTEQKzJbhl4BHHSpVAuFO2UddhkDa0LZFxIEWZy8q
	 xOLTFA0RbhXQdYAt3YfhdGmlLAKEms03tBXXod/iYW+7fIdN4EjhRdaBF7aDhSZZS7
	 GBfN6JCNnBeUw==
Date: Tue, 16 Sep 2025 10:27:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 6/7] riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe
 cards
Message-ID: <aMmd/JQAfPwKuYyB@x1>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
 <20250915-mouth-banner-ddfb2e48bdb3@spud>
 <aMhSSka3gyIcND/L@x1>
 <70241f44-2f8d-4945-9c84-71416776cefd@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70241f44-2f8d-4945-9c84-71416776cefd@codethink.co.uk>
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

On Tue, Sep 16, 2025 at 02:56:05PM +0100, Ben Dooks wrote:
> On 15/09/2025 18:52, Drew Fustini wrote:
> > On Mon, Sep 15, 2025 at 05:47:08PM +0100, Conor Dooley wrote:
> > > On Sat, Sep 13, 2025 at 02:31:05PM -0700, Drew Fustini wrote:
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..b2b08023643a2cebd4f924579024290bb355c9b3
> > > > --- /dev/null
> > > > +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
> > > > @@ -0,0 +1,14 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/dts-v1/;
> > > > +
> > > > +#include "blackhole-a0.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "Tenstorrent Blackhole A0 SoC PCIe card";
> > > > +	compatible = "tenstorrent,blackhole-a0-card", "tenstorrent,blackhole-a0";
> > > > +
> > > > +	memory@0 {
> > > > +		device_type = "memory";
> > > > +		reg = <0x4000 0x30000000 0x1 0x00000000>;
> > > 
> > > This isn't at address zero as the node address claims.
> > 
> > Thanks, I'll fix the unit address.
> 
> Is it time to just assume any dtc can handle a 64bit number?

Is it not valid for me to use the 64 bit hex number in the unit address?

I changed it to memory@400030000000 and 'W=1 dtbs_check' did not
complain. Am I doing something wrong?

-------------------------------------------------
$ git diff
diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
index b2b08023643a..7963712b53ea 100644
--- a/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
@@ -7,7 +7,7 @@ / {
        model = "Tenstorrent Blackhole A0 SoC PCIe card";
        compatible = "tenstorrent,blackhole-a0-card", "tenstorrent,blackhole-a0";

-       memory@0 {
+       memory@400030000000 {
                device_type = "memory";
                reg = <0x4000 0x30000000 0x1 0x00000000>;
        };


$ make W=1 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j32 dtbs_check
  DTC [C] arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb
  DTC [C] arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb
  DTC [C] arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dtb
-------------------------------------------------

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
