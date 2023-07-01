Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312FEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMzKDQYncDhXKICmlqiwI1YTuJ56AE1ovZw7K4G51q8=; b=b083yM3aA9kROz
	LLD0gqq6vCLHX4UHknM9ubAf0OcVlZxKMuF/Q+XswgCWcp4tPzCsJcwtT/bHepJnHo15pQahuV+W/
	ARmmR1xGwlACJX4ifsKh7xskGJ3M4aoySWgBM4/W2/PP9VrnDNxwREJpDM4GlhSbU2nwPWWA5yF4K
	PeWC3hG9CGLprGhodGN7D92YdBihCRNxKW0Cg3SmxVxEAkFOhoobC3b/C85pPpywUo/ZLYNqLmHKb
	d43XI81cX74yuo4vRauo5xOLevu3L0q5Gmq2rKRGiBzPsZSNvEPhucA1Fs7KuP+2itFGsnhwaGHV3
	6Ms/F1NbK7naax2m3AIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFiY3-006gWY-0J;
	Sat, 01 Jul 2023 21:54:31 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFiXz-006gUI-0n
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 21:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=xXXdlOkCWm65vKF5GsUiRqvKCb4A+LCa7xc5vezYfgI=; b=YakJMl/5lgW1CugbfVN4XcJLn/
	e3j0i7gOFSOdq54YHbS6MABE5Ahh94u+cHXUapba3iKESmpSRxB+rro3mxQ0UvDQRY0eqKhlxu2vN
	4DgnOJ/IK9S3+GFlFVuuNrYbEZYtB+X7ajce19jhQ7JDaCQ5rR2t8dlM21MBy4nObsl6eavwkV7Qv
	jU4x/tX+mOh3qQ3mNMoLbMvOuCKSM5Y7fJAbx6kUjvrTCDj6h7n1FKJPmO9Qcv7IudHi8jgS3pj4p
	9mTBEpIxhK9N9C5quB/t7aVTW16Hn2Zjh/yWm9rfxTUMjpy4pGUKH8z8AVj89kxXv54mkPZVF4Z4J
	hFNqhr0w==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFiXA-00F8ep-Bi; Sat, 01 Jul 2023 23:53:36 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFiX8-00FDHi-1D;
	Sat, 01 Jul 2023 23:53:34 +0200
Date: Sat, 1 Jul 2023 23:53:34 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: jiajie.ho@starfivetech.com
Cc: Palmer Dabbelt <palmer@rivosinc.com>, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: Add TRNG node for
 VisionFive 2
Message-ID: <ZKCgXvcbWBGWZnsU@aurel32.net>
Mail-Followup-To: jiajie.ho@starfivetech.com,
	Palmer Dabbelt <palmer@rivosinc.com>, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230117015445.32500-4-jiajie.ho@starfivetech.com>
 <mhng-348475f1-5880-4951-9692-78210a17acd3@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-348475f1-5880-4951-9692-78210a17acd3@palmer-ri-x1c9a>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_145427_774481_C4500ECD 
X-CRM114-Status: GOOD (  12.82  )
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

On 2023-03-14 18:45, Palmer Dabbelt wrote:
> On Mon, 16 Jan 2023 17:54:45 PST (-0800), jiajie.ho@starfivetech.com wrote:
> > Adding StarFive TRNG controller node to VisionFive 2 SoC.
> > 
> > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 4ac159d79d66..3c29e0bc6246 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -455,5 +455,15 @@ uart5: serial@12020000 {
> >  			reg-shift = <2>;
> >  			status = "disabled";
> >  		};
> > +
> > +		rng: rng@1600c000 {
> > +			compatible = "starfive,jh7110-trng";
> > +			reg = <0x0 0x1600C000 0x0 0x4000>;
> > +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> > +			clock-names = "hclk", "ahb";
> > +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> > +			interrupts = <30>;
> > +		};
> >  	};
> >  };
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

It appears that this patch has never been applied, although the rest of
the series has already been merged. Unfortunately it doesn't apply
anymore due to other changes to that file.

Could you please rebase and resend it?

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
