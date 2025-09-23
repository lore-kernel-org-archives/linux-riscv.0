Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812BCAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFxQSly9KlFZnFzVnaSx1A9F47bfcQYAwNX5lreeqjA=; b=u9cGUeMyqKDqHk
	OFOTj0YbIyZGGITPKocDlWG6TlGHirHC5x3Mqln0GClB7VlT57sj+8jK/QnKuIxlmrbAv1Qd5pQB3
	MEHBxBTYvz/Tz4h1w849E+2z0aoM47vc1QAqS8GEXjPyNLf4Up4SqICl1OtJYwBs5yLlctchqeBa1
	9KgpO5FboTSxXJoHIzlxbcDi2Ms3r0rjXuE/YxEaK7IJ9SsEAd7TUQuoguzsmmNn2K7hlKtIdPwY6
	jqUKxz4JHm0axYiaEAK4zr33F1ohNQKHqhFAGEG/7AiTkDEfmN8Kj2zaKuZKZvn6fEikSrHQhjUsj
	e4oJv2mKVrW03e306zJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Vu-0000000EeH1-1oxF;
	Tue, 23 Sep 2025 19:17:22 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Vq-0000000EeGM-3UGP
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=I3aY1gk6xWay8Bb6mAUsHpvmGZGsSP2aFgE4+mhPC70=; b=BvVYgRT4iVakErzwm0W+nRRNZz
	66r393iFEHhdjEvLUOmP540XWEPOOQHFvCbXyRPi/7bh/sBW9XaP+e5HI/+5AUuPSciozGBTzlr1W
	UeAjRIHMKLexwUe/WuJBboqGaUPTy8UQO31536BL6AY71+2lcL+4u3BVUITWX8o8O5Z2mXc1J1iIq
	ZB36Nb8AYBlC1lHsxsbcn9QBtMdZ73xdLBtIixNLSHtKBnNOY4M7POPFg9ZsIs1CLsNPrUfNWfhvM
	Okd5mkjpoq8CitSV79OGoVtcJuEjVUcTiJwKZ4I7f5MORkotd/p339mAkuEPc+gWrUyRQ+dnx0IFZ
	jb3TUtWg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v18VP-00C9on-0M;
	Tue, 23 Sep 2025 21:16:51 +0200
Date: Tue, 23 Sep 2025 21:16:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: enable the i2c2 adapter on
 BPI-F3
Message-ID: <aNLyIvS-UFfplmpu@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-2-aurelien@aurel32.net>
 <DC360EB139FD9DE5+aNH4l-7SP5KNu-Br@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DC360EB139FD9DE5+aNH4l-7SP5KNu-Br@LT-Guozexi>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_121719_313659_D21BD3F8 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Troy,

Thanks for the review.

On 2025-09-23 09:32, Troy Mitchell wrote:
> On Sun, Sep 21, 2025 at 11:01:41PM +0200, Aurelien Jarno wrote:
> > Define properties for the I2C adapter, and enable it on the BPI-F3. It
> > will be used by the 24c02 eeprom.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -92,6 +92,13 @@ gmac1-pins {
> >  		};
> >  	};
> >  
> > +	i2c2_0_cfg: i2c2-0-cfg {
> Should this be i2c2_4_cfg here?
> From what I see, in the initial version the second cell was meant
> to be the function number rather than the serial index.

Ok, I wasn't aware of that convention, I just reused the same numbering 
of the downstream 6.6 kernel. I'll fix that and use i2c2_4_cfg.

> It looks like the pwm part is also incorrect.

Yes, and also the submitted PCIE patches.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
