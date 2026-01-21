Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F939D2629F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 01:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2U4G8JOB5M9qsTn9dceVFv/IXWsObTo5BKJeeYHMI4=; b=X7hzJVsTI/EnsM
	WQw2RU+aJG5NTmSFOdQ0LJYkm6gw/+2U4wp7clDm4uacejbnANQwbbuz/0KQxrcEp+n7IGh025WoP
	rvvSRTpJnKDo1qlusxhSHjHSNGBl2VWtVyPVA5f+Nc9yE19gpZS+fTuHXHk3+ytT5AjHgtTpEVj97
	/nMUoH15q8uTgTz2P/VHsRc+Flw2bZ0ng2qZ9Yra8Zw75qH+92qoNydjtA9HLS2axpyxB7U+eI3u3
	n+tNRfjO0918dIAn0QXfMmU1e50kZ85z7kx/z1VhT6PYuHRGVe0wAVcYkc6Y6oxbiLo5mKThaH6vT
	tvFbCW/at8X0eilWq3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNAe-00000004iZO-06t5;
	Wed, 21 Jan 2026 01:38:08 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNAb-00000004iYY-2u8A
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 01:38:07 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12460a7caa2so3880659c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 17:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959484; x=1769564284; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=Sq28s+9cCrzpZNujgGfoc/E+R09zq7UTDoZJJA7uwCI+FpusPDwxLf116O8t7EgPo9
         4GqRIqvutE/3wEJvI/UpblTEoPPaMK15YtRl3CfL52zanTH/vw2EqdSkctXHrEi/eigN
         l+TWvzqVRTlj+8VGj1vBkJE/VYdAvm84bJ6AORW+0D/Ss8lStU5VkBX7ACe2QC4QZCPJ
         s2fDUiGOw5/QuiHqV3tlvE2SnJBdh04tvI2W8iKP1z7N87VUzB9E2GSC3VA2TLrftEgP
         A6HSqZ42AgOeujPY6sRt5kF3LPZzAZwKmO90/R+/ed6xFvX7vozvmhfti2jyE/X77BNa
         bjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959484; x=1769564284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=IMMM1fjO2O/9rNroDCADZa/P/i3sER7sBhJk45Os3rPQEEzWs3IbOSexKTwRbiHRTj
         /ix0Iym6Dx6HKJHuTQMNW2PsS3L/6IrNGc2GRei7BIT0IE+AFunLRmVBnKDJYSpR8rG0
         IdJH+/GJvXDt6P26quKclQLMn7h5A5wa9yqyKgttvQ+ZM/dEX0HzsgTVIydZbKHpSghh
         rj9pSsAaipY/OSIXYP01r1qDbJUExBK31OFDkn90Ji25AubQMmKpnyOkSM/NfGZnSkYX
         EDmqEuK6XxpA/h2QjY4gMSwGO4WKq8kzexu+jk0WO2Wriu4n59/nydvEfGTSQR7qHJh1
         DWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOAfcnn5IcyFGTbYPDoHBjinptFR1NjXxCLO51fo4Ms4+LXewFDCWTnO14BaFc1igZzJnbxArRR1NH2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaMxNBIBRgsCwiKKJSqg6UVm4XSrP8Mr557oCUo/YhJQE22wbE
	5/LaZ4AD2nDpuvn6z4ev3CZGflZns5ndcMfjoMDo39ps5p75iaRElEtR
X-Gm-Gg: AZuq6aJqkBwTcn5K7AjiKiXQnwYVMDRcNcbXveTZwX+bec3UC49dc/MeXOc84ougFZW
	XqQHXmL+LvcHXeurMDSld0I2EAEKHhkR3DLgIwUSMYoUV8lQjlM+/9H85Wx4uenKIlBdjiTt8SX
	7REjVh1htAPeQ9t5j+ghWf/IT4SeZWz2NACpuStlKnIQrhgT+zVHbXPDwqqtKcJqqrPZ+tUKNLH
	r+dJ54UX9wHVG1Fek47yAAeIZcg4hK9YHydI+oTo7rcfHKOMbfUccpqCodftu6j0UQPzhJriSuc
	k6zs80GyRj4pex7WCrEBHZjLgUPns9EAxQavNwd26OugKmuuYxXF1G7WJkCWSdNWTIwBbfhB5e8
	nN5F/qogRH5A1TXEPH7JpjpQv8wqADwiXW3dDiNLcAoVPMZMR/1gJrrdRkPIiA9d1yjhYN3ZIJH
	Mi0I2WTQ0lcw==
X-Received: by 2002:a05:7301:2b84:b0:2b7:f12:9503 with SMTP id 5a478bee46e88-2b70f1295ccmr1043461eec.30.1768959484158;
        Tue, 20 Jan 2026 17:38:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7047b099bsm3361798eec.31.2026.01.20.17.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:38:03 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXAtMZJorEBiK2R-@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
 <aXACRN7BaumIySp3@inochi.infowork>
 <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_173805_726889_A23DBCF9 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, Jan 21, 2026 at 02:29:23AM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 06:36:01AM +0800, Inochi Amaoto wrote:
> > On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > > > +/* Note: the delay step value is at 0.1ps */
> > > > +static const unsigned int k3_delay_step_10x[4] = {
> > > > +	367, 493, 559, 685
> > > > +};
> > > 
> > > Am i reading it correctly that RGMII delays are limited to these four
> > > values?
> > > 
> > > If so, please add this list to the DT binding.
> > > 
> > 
> > No, these value are just adjustment interval, and it is also
> > controlled by another code register, the final delay is calculated
> > by the following formula:
> > 
> > delay = delay_step * delay_code * 0.9;
> > 
> > So the delay configuration needs to be calculated instead of
> > directly assigned.
> 
> O.K.
> 
> So what is the actual range? Can is do 1000ps? 2000ps? 3000ps? Should
> there be a basic range check to avoid dumb typos?

It can have a pretty big ranges, and I was told the total delay is fine
to work between [1200, 2800]. I guess it is fine for us to check the
upper limit?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
