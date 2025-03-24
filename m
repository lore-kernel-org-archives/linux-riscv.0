Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DEFC36001
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 06:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL3z/XDKj5iNXdHk1zP45RydIZnkPvSelQXjkglWMNs=; b=pAVNlKtv2v0Ohj
	HD6Euo5OLKKvF/41G+FtR53Uyc/TEUGRJKtM28uMj2ZSuC6WEMvSZ+h3Y64MQfJ5WMn+cTLZIrc2a
	X70R27QZKD/odxEa19QryOSbsb11QRN0F5D4ftkVGOeRPSQ+RrZk3zYbQuBHD7saFS0ro44GpbV/1
	VI64KP7j1Ujrhufokqg+9BCQJ+H7nqlx3VGgrYsqrGSWXfLaZ1/ZjkBYwE+Z9l0ngc9C5lJWafip3
	zNaRatFKAFWwNobfSKGXAlbmw22592smsIqWjVGObWmWZo+/HneSIeiiL6l9njaS4mtn2RpeTQXOU
	2XzTTZgYVOR4jiUNFt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twaxk-00000002I3X-03Qs;
	Mon, 24 Mar 2025 06:07:04 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twaxg-00000002I33-3YUT
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 06:07:02 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 247763432FE;
	Mon, 24 Mar 2025 06:06:57 +0000 (UTC)
Date: Mon, 24 Mar 2025 06:06:53 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for
 the K1 SoC
Message-ID: <20250324060653-GYA18687@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-8-elder@riscstar.com>
 <20250322164830-GYE11633@gentoo>
 <b5af3a7a-c5da-497a-ad67-c99edfdf665e@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5af3a7a-c5da-497a-ad67-c99edfdf665e@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_230700_929815_2EB43D76 
X-CRM114-Status: GOOD (  26.34  )
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

Hi Alex:

On 08:23 Sun 23 Mar     , Alex Elder wrote:
> On 3/22/25 11:48 AM, Yixun Lan wrote:
> > On 10:18 Fri 21 Mar     , Alex Elder wrote:
> >> Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
> >> currently support resets but not clocks in the SpacemiT K1.
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> index 09a9100986b19..f86d1b58c6d35 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> @@ -350,6 +350,18 @@ soc {
> >>   		dma-noncoherent;
> >>   		ranges;
> >>   
> >> +		syscon_rcpu: system-controller@c0880000 {
> > I'm not sure if syscon_rcpu is good name to go, it's AUDIO Peripherals
> > in docs, see
> > 
> > 7.2 Main CPU Domain Address Mapping
> > https://developer.spacemit.com/documentation?token=LzJyw97BCipK1dkUygrcbT0NnMg
> 
> They call it "AUD_MCUSYSCTRL section <RCPU(0xC0880000)>",
> where the registers layouts are defined, and the register
> names use the "RCPU" prefix by convention.
> 
> I guess I could use "AUDIO" instead, but I think it's
> "RCPU" is a little better because of the way things in
> the region are named.  It's a little like how "pll" is
> used for the DT node name for things in the "APBS" region.
> I don't really like that, because the connection between
> the two isn't very clear.
> 
ok, by whatever you choose, I'd be fine
in case you go with RCPU, can you put a comment above? explain
there is slightly a devergence with docs from SpacemiT's web

also I noticed the io size you written here is smaller than described in
docs which I think usually it's fine (docs may give larger number - 0x80000)
just make sure you checked? so all real io region will be covered, same
for rcpu2

> >> +			compatible = "spacemit,k1-syscon-rcpu";
> >> +			reg = <0x0 0xc0880000 0x0 0x2048>;
> >> +			#reset-cells = <1>;
> >> +		};
> >> +
> >> +		syscon_rcpu2: system-controller@c0888000 {
> > not found this address mapping in above docs link
> 
> You're right.  I was following what the downstream code did.
> I'll gladly just include this in the main "RCPU" node.
> 
> Thank you very much for the review Yixun.
> 
> 					-Alex
> 
> >> +			compatible = "spacemit,k1-syscon-rcpu2";
> >> +			reg = <0x0 0xc0888000 0x0 0x28>;
> >> +			#reset-cells = <1>;
> >> +		};
> >> +
> >>   		syscon_apbc: system-control@d4015000 {
> >>   			compatible = "spacemit,k1-syscon-apbc";
> >>   			reg = <0x0 0xd4015000 0x0 0x1000>;
> >> @@ -518,6 +530,12 @@ clint: timer@e4000000 {
> >>   					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> >>   		};
> >>   
> >> +		syscon_apbc2: system-controller@f0610000 {
> >> +			compatible = "spacemit,k1-syscon-apbc2";
> >> +			reg = <0x0 0xf0610000 0x0 0x20>;
> >> +			#reset-cells = <1>;
> >> +		};
> >> +
> >>   		sec_uart1: serial@f0612000 {
> >>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> >>   			reg = <0x0 0xf0612000 0x0 0x100>;
> >> -- 
> >> 2.43.0
> >>
> > 
> 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
