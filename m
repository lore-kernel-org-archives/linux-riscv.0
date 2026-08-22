Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4ADC5DF97
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKW2PCPceco1VXqGLulL2CRxpXZG/J90Fbj/3B1fvcA=; b=PjT1I+2dJHOdIW
	HssN95LRIyILfghpQiBGMpFJwZAVJCDp0nOmcQsJCHynMqSu7IC8VTMnDn/sdf6tKw6FNqW+O6OFk
	DuDL22z5dlgjUzALh8lvo8CI0mnVXXk5VgEpLLnSXDaaIprRBfgOWwp4wKr6ePlDXPZ8ZW3w5N2YZ
	RZ0nUb7An6b0Z6PzcxTIT3nqqUdwNYy/V86ZFptEadyMAM7UbKkmDfbhyCM73s339b76SCo1gMlWH
	WA99DplOMsUNMMZllVRuR4gtyZJwk+pWZP+O7vl7YTZDCzNtJSe6e4p8nZtXMlczpVm4G/WdCCA+n
	lhjs1aMRqfxu1l/5DO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkuS-0000000EWG4-2xwm;
	Sat, 22 Aug 2026 12:33:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkuP-0000000EWFj-3FtA
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 12:33:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38101f85591so2413238a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Aug 2026 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401993; x=1788006793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=BhQHe51sAA9h7qhQbPipY6nyWhp4iAw/mMKtAAZxEc/HAJKRO68I/a1lqOW2R2h3Bv
         dK7enHq1nb/kfrzUSw1LOYpBFZ93fGclzEZ8Ayf+cdS5C5L9zzl69g6RQqjeRKtFbYC2
         6AanTt//VKqU87cE6UxPbOWgzcT6or2UgiFP/3yLQSq/hSEF73AjhpeIjxhR6k3+nvGm
         S6BmuhvLezr3zN86X+yz39uod7ItOnHS8AxK0hvMxejuIQ6GJMD3E7olMhZqwDxx8Z3J
         TYIRPEnPoZqihcrOVTofYWXBX64UZFXlZ+j8FexM+YhxEFAbmxeqh46VB7/kRlMZSWwD
         kjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401993; x=1788006793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfHQG1lWh9ZlhxyhVuyS3JBvk/o8rp8H++Qugcq4y9w=;
        b=c8F3S07ecWUX9mx5t68oMUueDVwxc40xKM1kAEfes8wbMJnIOrWFBJ9JIKgLqN6+Yl
         z8uQRxKZqj1MZgJ6Fse11NV6/W1fGyN8+AynLRgH57JDHfrRFmVAFZEMSJ0RMflzW3r8
         Tb1Wu9yxAbwqnnXd/hV2WfqTGahbefZM16vIthkVlPapJ8wZpqYa1ANvkPieK/JAL/RY
         Q5OFvld54HsM8mMHN0ScKMDfVBnF4S09m7o/FpDquL2TQ5lwadz8dMBbahUj7/AuN5VN
         ZJhZCsiovCT8CVmWr4Mc2vN+qYpL/is67i10+DCfn+lYhRWkW6SstnsEt+KQHJXgYEov
         5bDg==
X-Forwarded-Encrypted: i=1; AHgh+RqPh9mECUaZjLye1CqbT2gUZQ1ToEy7yrITiMKzKz5GNOWbOeELtz76v6/G8qoyXi6oHIPhpAB5B2aCsA==@lists.infradead.org
X-Gm-Message-State: AFuF++m84qo/t3NGoJNpPUfpTfgbTzhi0kcQwvDhYcPbV8w2qN3SGhfg
	prm030BqQ2Ia0B6kSqv7xd19m8lalE/EdcQsGauSK5AFaBxXUHXc4n+armY6og==
X-Gm-Gg: AR+sD11v+JGoyVTVRjZV8OHZBZlIMPGdBIABJa2QNGlRtKiMJc6EUMIi+irIk2c/E5S
	K2gDgfnn3nxDchcag2rVvUXPF1nhUdS57/LSqqfV2m1Tv1Q+abb0S2V2Dk+uYoPvDttijHS2cZU
	skWNmzXQEnkTjvvN82tdSwIrHHOEa0HGcLH5praFjFI922E38pn9KJjSRXbHHjKGqnIWUvjxaja
	oq7mPIYidxV7e1Mk/fiGg1+SIsijpiCeCVkm7vhzLcih3iqv+NmV2LDK/RlLQ35GTsY/fNh5jbj
	aT2NF6PER8ZtdDKGPkwIcpmRE8iNi/BPpALLzKHpP+fr8pe2EM/by17/rAh+zysMQiIHVzw86r6
	RWJsZS79dViWXZZ/FBcyJGdo1cqNikPYLtGjZih1WT+qnxGdIOE+V0hm8XfcBO1W+0BW1gBCQ6h
	wuQSQOk+IZcNJrNsvRv1a9F1UrP5itNZluTcuECmjx00/i4cMyjynUGYjfQjo=
X-Received: by 2002:a17:90b:268b:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395c4528324mr11764124a91.0.1787401992755;
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af6e88sm2619008a91.9.2026.08.22.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 05:33:12 -0700 (PDT)
Date: Sat, 22 Aug 2026 20:33:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aomWjQGk_p84pPD2@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
 <aokGbT7XTCbxUQzl@inochi.infowork>
 <aolt6CaL9b6p8A8V@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aolt6CaL9b6p8A8V@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_053313_824477_25144C22 
X-CRM114-Status: GOOD (  28.40  )
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

On Sat, Aug 22, 2026 at 11:37:44AM +0200, Aurelien Jarno wrote:
> On 2026-08-22 10:17, Inochi Amaoto wrote:
> > On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > > either be used for PCIe or USB3, depending on its configuration
> > > (spacemit,apmu). This configuration is defined at the board level, and
> > > assigning a phy line to a USB3 controller while it is configured as PCIe
> > > results in an "Invalid PHY mode" error.
> > > 
> > > Move the USB3 phy at the board level, the as it is done for the
> > > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > > there is one phy per USB controller.
> > > 
> > > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > > 
> > > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > > Cc: Inochi Amaoto <inochiama@gmail.com>
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > index b084a35aa00e..171bd2f40aa6 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> > >  };
> > >  
> > >  &usb3d {
> > > +	phys = <&usb3d_u2phy>,
> > > +	       <&combophy 4 PHY_TYPE_USB3>;
> > > +	phy-names = "usb2-phy", "usb3-phy";
> > >  	status = "okay";
> > >  };
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > index c3f2dce0969c..3e24054d2084 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> > >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> > >  			reset-names = "ahb", "vcc", "phy";
> > 
> > > -			phys = <&usb3d_u2phy>,
> > > -			       <&combophy 4 PHY_TYPE_USB3>;
> > > -			phy-names = "usb2-phy", "usb3-phy";
> > > +			phys = <&usb3d_u2phy>;
> > > +			phy-names = "usb2-phy";
> > 
> > I suggest removing this completely as we can not determine the
> > phy we used. I think it is suitable for setting this in board
> > file only
> 
> Yes, moving all the phy definition to the board level is an option. I 
> decided to keep the USB2 phy at the SoC level, because contrary to the 
> USB3 phys, there is a one to one mapping between the controller and the 
> phy. Do you think it is a wrong assumption?
> 

By default, I prefer to make the forgotten thing as an error in
validation for any flexible field. If you leave the default value,
the forgotten field will lead to a downgrade hardware (or maybe
broken hardware). So I prefer to remove this rather than give a
default value.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
