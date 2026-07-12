Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF0C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxLJrML+Col1RFETyhOQAxfHjFuTQMqVxx8Q9jXoAR4=; b=GciI5ijZCrIvHu
	Cu8RxzH3j45yZzSp6f2h9iWCVsfT6V/CcLAVISmaV5y6TS4141ahgdNEGA0j+OcKKinegBxFQsoNy
	7i5GXf9GjmU1DjaOfV8Cnbc1LyIQMjSZ1/siljxTvs9hRwCadCFKYVvMXUGcaop/MuXklToJ9+B5r
	Bu99ZccPkKCJLrota7waJezMtNArCdcp8Akt16FH3CXgLWXLbX73StbZ08uqhNDwYGF7HwfVzBIZ+
	+VTPzH9oGa1BLBqgulZhdvdpWvWyioQ1DG9EIh4YrPyAggoNupSZzFlfvekWWyNMlgP6ZWcOKoYo1
	hzo4FOkU6JITqvVKIksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2hX-00000007osB-1QBw;
	Sun, 12 Jul 2026 22:31:07 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2hU-00000007orG-2gmS
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 22:31:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842338c18e0so1948092b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895464; x=1784500264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=oEt4GWRWKmmuzjTpaXg38lTrD0rMeZUvDqM4FABTcUCP/yJdDYFLM5kvSSeOW3SI2k
         tB/MO/Kq2iTe9CiaADK1z365Zstz6cbx55TRoK/kWfHU0ho/uj2STBz+K/eIMw2DMdzM
         P9eB9kb/YCc4L8GK+3w7tmG/MgLwRhpCopjD8uR7iMhyISnKoHD7LjKRwT2+Kct6X8wW
         VNWcI1E81tTma0Cacjp5C9RyiLBSSYfIv5MhpP5YbNGW98xVoAF54OHw8kbZTn7o2Mg6
         F6MRjNtdqZb7w16UZIQLUI6Wt7V7MdKAstEfFe1naJ2KFPacggad/CKod2fwP65v3ykf
         38Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895464; x=1784500264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=VO/Fag7j4NE5j3pVwND9+yryubQ8it7AopkpE5ocymSgnSri72xOp3D3L3UAE2BvKT
         LtoTfPFe0vRku3fmcc/I4nZ6xWscoG2+4JKV6sQQRy4o8O39vA41l9MYRpw98GQ/Op12
         /8siT8lB/oEaVW7xLRgP8wok7dKpH6u+Kykg1Rt2sVEc+bRkDbcUQEi8T6Fzk0k5mMEP
         6NHIeNsiJkNuM8vtMVzfoW8DvY0Yu5nAfYSgSCkhGpoes7bCSPlzYw1FjTaVzC/NfYP4
         KaSA9I7wddjfmSMMV36k+LQkzJdixm1yLCGx+HZUytJ03thz3d5njVbiUU1J732Iiku5
         JkUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx3PchxuEnLdfmxAdfesGm4G90dTtOyi24mDfCs55HcjLAWR5zBMpN5a9eBvdiK5mBSyAzd5neeru5Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Jb6lmhKtJplkYN+hhZwxXUxAHk/yIaWVO0DPz9FDnlpBzzie
	B9Jo19cmhHcgaUUgqmsETdXncTrgjIzUBUWccfjknG+/oxQzFi2DN38Q
X-Gm-Gg: AfdE7clPa6ljZ0DUgG9HaCwN3PXnTCBvHhCsOKwPQTcH+dfEQXXjCohzkxv9fEYblG1
	th9n5goqpRULWmJYZgELmNWYTjjaMDtUj+Ql7AwrUC3zvv6sQ15yucPulc3BkBCn7k00H3XikGa
	vLjI0X/iJB+ss5zQvQpPJj/mNpDbTsLZGmk7BIOyURCQsMKjcsM90ujpbnmo8Po592Upu3zsdCz
	zkGuvVPiK9uT4cPijFe2ntpc8s3gABut0h2gyEe1N1jWXS2vJhrckCaIzjQ6hE31TJLXg0U3H8s
	Jx7xEjQHBYgV5dQytnjkeVUH7gBHxQmSyb6+ZsqBgZKJkWHJAz8BPFGYeBMNkDe6nSoYh7JbAdz
	RPuyykMrdIVFtfzMn7AQUeB9Z3wh/lGmHl6vOiiJ0ENG7U6tufFOL3PimTj5O6R2w
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr6700212b3a.48.1783895463640;
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3b8d3310sm345744b3a.40.2026.07.12.15.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVRx2vCWnqCDEs@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
 <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_153104_677066_CDD3B7C5 
X-CRM114-Status: GOOD (  12.07  )
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

On Sun, Jul 12, 2026 at 03:49:43PM +0200, Andrew Lunn wrote:
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -196,7 +196,8 @@ &eth0 {
> > > 
> > >  	mdio {
> > >  		phy0: phy@1 {
> > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			compatible = "ethernet-phy-id001c.c916",
> > > +				     "ethernet-phy-ieee802.3-c22";
> > 
> > Indeed that's merely a workaround :(
> 
> Despite is being a workaround, there has not been much progress on a
> generic framework for dealing with clocks, resets, regulators etc,
> before probing PHYs. So this is probably what you want to do.
> 
>        Andrew

OK, I think I should accept the fact and let this workaround
solve the problem.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
