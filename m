Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F41C982C1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 02:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVfOxSWNPtciiFtTj4UJ7FIMaYOhfl1aJvASo4AabL4=; b=xb6Fo+nLcwgkxd
	dQZ7TUvm8EbIeOKOpeag06MCchPaYrBCCJ++ufHW7rClGXtIc5ITh2D7KHSm4nnerUcZoPS5z4zfu
	sS34+eo5+oTKI9qU445KfeGd5cFe4RdsE2Nza8XTqpP4mlYFTsPR0cPotP+G6YmnPRNZ8z/1klBum
	xpuFPzqzng4jt8Wz1kPLbERmIltbHVYndC4vutZFpmTXS5PfIwff79RISKr9/Ut3gf2gBj50rqfdK
	LZbOrm9MUUeDQI9k+vgcdEJR1T8CCkI9LrUlj+QNTPQycUOorc3yDl+9RroIsH68vG/PEKwQ+yLl/
	1DqoiJ5ny6r8oEURNVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71Sl-0000000ARiN-3aSV;
	Thu, 17 Sep 2026 02:02:59 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71Si-0000000ARhb-2uje
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 02:02:58 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f05ffdso2568255ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610575; x=1790215375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=cfJeit4iSqvfYHtQOoUTjy98Go40o24L5Zb9ieeAeKgTc0gkBhxR+uWl1EMN2KZfSZ
         jHePCER6B6RSI5tFtnDAyBA36GFCr31iZInJuDSsiybIeawN6ZqfwwEoRtNH3NfQVqYO
         Qcf71XSvT8V/3IlPkFSYUUBU7KAgmvecCM2BtDYiFxIUm5e5/hjk947s7eJqbKi2ci/2
         4lFj1B82ykNk0/R4ZA0XiQCfy+jcYoQ1gLoqK2Mk/qDiBCOSpktv7JjHYCkL9+5I2txF
         hWa3rzeq40Q5b61MxWEey91WFUy6FG/tCozCYxjqr482scrw46wFHGHj54DOS+2PlF+G
         zygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610575; x=1790215375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=md06WcGTyHUeAP2KmFf4LfHAD2863kL9FBC+H3jXcZVsADs06wxVmUts/l2xqcmJZb
         39ANoQ1HbKd6xGVzFpSeM50MJWSUyvVkV/Ca27LS1GLuG1avOciRdLPXVp5CHfm2A6Gf
         Jo0qpOqKwxd22Z1XIIJwCzUK/prb5LCW7yYtWdGAGf6MoOc7/45gIN+H6uqXHgZyr1Bx
         P06nY0zb6zkfP091mOkmvQysfPRvtfd2XhbNqHrepkF3FFzGU/RkFlMWJQuJ+hHvsymk
         djj+atLE/xgTBSyC9zEaOfDS9rytIzQehWa0Y1scUI3TrAPcnvpgvyksNHZ5DwAdtNgB
         QUww==
X-Forwarded-Encrypted: i=1; AKwUvByBQT/z6LXRSqAReaJW7cklU6O8bfGun2vltekqqz39UKu8wpLTLRRNN4M9oUl20YuQK3Sa45+y5vnKdA==@lists.infradead.org
X-Gm-Message-State: AFuF++knil3dgAbJmpREsckh9RzrAX7cWRVT0hQpAVTCbUESmsbmdvBO
	5wrWNH21qSrHqr1B7yyJk3Ur/wSoncsalbRreLmzYOUuYxHBDjcSVSJc
X-Gm-Gg: AYBFou2XJK9+p/3kSrgJiEnhiLDKCoX1cLZO0fvVxXtNSHvS9/4n6sNMyOrctJaJ02G
	ZwfD0CTYZ++ry3nUOkZ4SxB4/uWienOfhZ+sf5F/VGpVjQhDT8DEFxJO/PlD/bDsaP3ekeSIweS
	uhUw9HWoykJdw88tlBaPMdcSy0qaBmnVGvbIqUsuCya01yn85Sw5tEuYWnIuV3jHgml6rVBnVkB
	QkCOTZg15LJvUMd8NCk11p6hc+ZbBV86KTHtCk2q7zX6ksU/rlNIPR2zCdKOzEjth7pdzJDomuY
	P7WNYq70Cjga3pcTAL8truRwfIuP6ruUsoqxm04LRMX1G2LL2hSROMwS8w8e+VB843RpWAlISNu
	vhktJ+LnD85klstBVZOCZ9fUddy7MgrrIsYRVzDKcihMPYlS6EeWc8LIPFfScD+IBJGQ8BNlsYs
	wW0fR5mBTSxik148kKsS+ghY+k+vLc3IeHpbm4PubBWv8LXL5IFjNwhw/dOEKG2A1Ue9OWy5Yg3
	wAW/FKI
X-Received: by 2002:a17:90b:1641:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e1e4d99d4mr10807662a91.18.1789610574914;
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35dab2e9sm2345861a91.1.2026.09.16.19.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:02:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqtKAuoVSCxcts52@inochi.infowork>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_190256_734245_A7588EDB 
X-CRM114-Status: GOOD (  24.28  )
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

On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
> Hi Andrei,
> 
> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> > The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> > Reserve this region to prevent Linux from using it.
> 
> If the FSBL wants to reserve some RAM, it should modify the devicetree at
> runtime to add that reservation. Adding the reservation here creates an
> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
> 
> Regards,
> Samuel
> 

This is fair, and the fact is that the current fsbl can disable
coprocessor in its configuration. So I will not take this patch
and maybe do a cleanup for existed devicetree if I have enough
time for it.

Regards,
Inohci

> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > index 78a257839f6f..693c9fd7b771 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -22,6 +22,17 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@9fe00000 {
> > +			reg = <0x9fe00000 0x200000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> >  	wifi_pwrseq: wifi-pwrseq {
> >  		compatible = "mmc-pwrseq-simple";
> >  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> > 
> > ---
> > base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> > change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> > 
> > Best regards,
> > --  
> > Andrei Lalaev <andrey.lalaev@gmail.com>
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
