Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFADAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faxvQhlSm8P8L56nC7qL1vGPczIzBxrnTLJZQOwRrX0=; b=4qFSUcLNU2/1aG
	dh7XkfEnRQknbVYU9rT5TTJpClrNLTyoDrJsQuG9vOlnkbioEZV/PFcqaMnYMBKptIJFS4tlYXML8
	gtIxFcNQy7CItLSuYU/YxJNnQYMmnn7XLwsvdz+AxP1CkMYi70O7L3dij6BhZ9C5E6ayEMWagPb8o
	Ojjcii8PlsSNFyO2LXVQydl6Dmem7zxEtYLdXuqltL23phVALw6Cvbrq0RVmWsQUCOwJRWfdgAsBr
	5yMDWSX+FaibtMWBGyadLOtykMwTHFzGihOPgTkK9TiUl4BWyzMzI+6vl6JJL8oV/sQ/48BHWIrKM
	k68nYU4SH4yWifHL3WEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9B9-009EP7-AB; Wed, 04 May 2022 07:12:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9B5-009ENB-TR
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 07:12:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm9Ar-0006s1-Gb; Wed, 04 May 2022 09:11:49 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, Conor.Dooley@microchip.com
Cc: Cyril.Jean@microchip.com, Daire.McNamara@microchip.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, palmer@rivosinc.com,
 arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mail@conchuod.ie
Subject: Re: [PATCH v3 5/8] riscv: dts: microchip: make the fabric dtsi board
 specific
Date: Wed, 04 May 2022 09:11:47 +0200
Message-ID: <1814908.tdWV9SEqCh@diego>
In-Reply-To: <872a2d30-89ad-b66a-7d03-90d3de85c51b@microchip.com>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <1892011.PYKUYFuaPT@phil>
 <872a2d30-89ad-b66a-7d03-90d3de85c51b@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_001204_000274_B1B8CCAC 
X-CRM114-Status: GOOD (  27.78  )
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

Am Mittwoch, 4. Mai 2022, 08:48:24 CEST schrieb Conor.Dooley@microchip.com:
> On 04/05/2022 00:47, Heiko Stuebner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Am Sonntag, 1. Mai 2022, 21:25:56 CEST schrieb Conor Dooley:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Currently mpfs-fabric.dtsi is included by mpfs.dtsi - which is fine
> >> currently since there is only one board with this SoC upstream.
> >>
> >> However if another board was added, it would include the fabric contents
> >> of the Icicle Kit's reference design. To avoid this, rename
> >> mpfs-fabric.dtsi to mpfs-icicle-kit-fabric.dtsi & include it in the dts
> >> rather than mpfs.dtsi.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>   .../microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} | 2 ++
> >>   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts               | 1 +
> >>   arch/riscv/boot/dts/microchip/mpfs.dtsi                         | 1 -
> >>   3 files changed, 3 insertions(+), 1 deletion(-)
> >>   rename arch/riscv/boot/dts/microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
> >>
> >> diff --git a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> >> similarity index 91%
> >> rename from arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> >> rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> >> index ccaac3371cf9..0d28858b83f2 100644
> >> --- a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> >> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> >> @@ -2,6 +2,8 @@
> >>   /* Copyright (c) 2020-2021 Microchip Technology Inc */
> >>
> >>   / {
> >> +     compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
> >> +
> > 
> > I don't really understand the meaning of the added compatible yet.
> 
> 
> I added it for informational purposes more than anything else.
> The contents of this file match the 22.03 reference design for
> the icicle kit's FPGA fabric & an older version of the design
> may not have the i2c or pwm devices.

that makes sense, thanks for the explanation :-)

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> > It will get overridden by the compatible in the dts and also the
> > fabric dtsi for the polarberry does not contain a similar thing.
> 
> I did not add one for the polarberry b/c it has (to my knowledge)
> no versioning scheme nor fabric peripherals in the design given
> to customers.
> 
> Thanks,
> Conor.
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
