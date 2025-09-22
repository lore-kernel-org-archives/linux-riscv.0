Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5785CAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 04:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPxwRE2bDLLEw4biYu4p5gH42+9hYybuvPrzj+tHAt0=; b=s54xh8Qo8dR5wm
	wKh7q7Chh/2cn0O0YoS/zLVHB80hMphzLD0Rl6Vj9rJaBsU6IQZBbIdICta8Uwysf2qT4XygKuija
	NTFYlJl0pXtmQUKabDY0pXm3gt/1qsK7XC6jt7ZNCXhr9oYWgT62B7W7erleBEynY3MeFlBHLewHR
	Jor/9RIQWUz1c+J4me2iguBqZ68VjtxRkda+8hIvZFmnQ2DdqEAOcXg2yFQQqXeaxyTnB2C4b3EMf
	U9HTdjP6YLEZmbXM/EiUBOEj7+1owuE77R4bfzGCTJzUkm75RXkdJTb3kmWU31QQZBTJmUAm2Y3pk
	9ODigaT46bcHFdeGScvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0YUm-00000008pUs-1AiD;
	Mon, 22 Sep 2025 04:49:48 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0YUj-00000008pUC-0NtD
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 04:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mrg3qT6OWlcGN/2n16b3vyg3rWGl9IqhWxJnoQsePU0=; b=imP4NH2gV71kFk8IQ+w9/T+u6W
	JDKJXd4ZwNvYuueVUugG2LdVVAXerx0TT1SfKYtwixNUiqBZ0xP7SkFT5WEeydQX24pmMBeaqO8wW
	BeSU6QWTm9aKBQnvotH9eLtSixCHfJkANe2j2b55tFgHe4WPDkWxYf3HNrbNyg3mb1lJod47h/fB1
	eI7uLuE6iKqJXIGtShqaBd93csDLqN/2uvMGjMCZe6i3hw71sx63JyKl5GWMWGoGSh/DD+b4eoB0J
	ScKyIhpGP/nYF1jlvKODSCNO/WbdMxyy549kK8eVV1c/OSIaBy8cur7Xhm3R1Ob/jK2Qt5eVrBJ6I
	5o1s/rsA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0YUa-009nwn-0v;
	Mon, 22 Sep 2025 06:49:36 +0200
Date: Mon, 22 Sep 2025 06:49:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNDVX9IrDbH2w7yJ@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <20250922032158-GYA1291757@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922032158-GYA1291757@gentoo.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_214945_564019_8A2EEE18 
X-CRM114-Status: GOOD (  21.41  )
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

Hi,

On 2025-09-22 11:21, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 23:01 Sun 21 Sep     , Aurelien Jarno wrote:
> > The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> > MAC addresses of the two network interfaces. For this reason, mark it as
> > read-only.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 3b6e4f52e9aad..574d10fdf9b82 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -115,6 +115,15 @@ &i2c2 {
> >  	pinctrl-0 = <&i2c2_0_cfg>;
> >  	pinctrl-names = "default";
> >  	status = "okay";
> > +
> > +	eeprom@50 {
> > +		compatible = "atmel,24c02";
> > +		reg = <0x50>;
> > +		vcc-supply = <&vcc1v8_sys>;
> > +		pagesize = <16>;
> ..
> > +		read-only;
> so you're sure there is no demand to write data to eeprom?
> (update info at linux env)

It seems to only contains board infos (mac addresses), but if there are 
other use cases, that can indeed be dropped.

> > +		size = <256>;
> > +	};
> >  };
> >  
> >  &i2c8 {
> > @@ -143,7 +152,7 @@ buck2 {
> >  				regulator-always-on;
> >  			};
> >  
> > -			buck3 {
> > +			vcc1v8_sys: buck3 {
> I'm not sure if adding an alias here is a good idea, it occurs buck3
> serve the suppy for many devices, besides, to me it's more proper to
> name it as eeprom_vcc1v8 for the eeprom according to schematics in
> this case..

We need to add a label to be able to reference it for the eeprom 
vcc-supply, but we'll have to also reference it for other devices (e.g.  
emmc, wifi, phys, etc... It tried to choose a common name, ie the right 
most one on the schematics. Another option could be to call it buck3, 
but other name suggestions are welcome.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
