Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F56C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMHehCtKYkOVhP7f35SsUZqQGLL5Ry5bfPushZJZoIA=; b=N7PtAgM0ch83F4
	7E0PfLo/ywV9ipmnmWnXSmBgSxAw3nLKm0VYPAxW9BPQRYbCiKAd/wDT4B+LEiNbtyTQlT2RXdNbg
	RF+o/VqrUO5jImv95xO7THBazK3pWcSX70o64HiT/bfVTCuJ6BuC+rCQMifHTuMtQCqhGGrCLnwjP
	GOOWQ2U9FRNdZX+yRJRTfmsH7SnfHMd+aimj1vHLX/P7lrQSPFd1IrPV9tA1ZkBi+PZMGzisQNER+
	+r8nXMHhtezKcTDOgdgAGeUjyLTgOAPTNdAiBwcLrYdYosh4riQGfSNBXXOUmYUEWBKkyu/2RSTQt
	uslZzUckr0JAdAllC5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlDW-00000000kzb-3tU6;
	Sat, 25 Jul 2026 22:51:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlDU-00000000kzE-0hKZ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 22:51:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e347638adso1390796a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785019895; x=1785624695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=DGkui4vepjehBIpBbV4ZW2JfnCUYTjPL8+O0qjpEcPtnhxYkyVqDs3F6ZFdWyeqc4j
         7l+J8TN7SEc10laWpcuvRjxbWPAsFZUHlmlKj2Q1+VQd08ptSsfPCT1z1uFQ+PCQz7sr
         HVUb++Hut4DSkr94UwD8TPpUe8R2YYctMPCVc9QSoMESfe7eB7N3TbYg9pEuivJH9Axh
         GrII7Di/aqf2Qsf7yVYvUX+QjeHGxf/fPz0zN8VhQfW/b6qYylDfKreSgQpzOrVQrq4e
         TS1nb3ffosSL2j+wh0ccrhnj+OcU9wPxufCYlkmxOt36gyfRJXWCjQQm3OH8x5Co6zND
         lSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785019895; x=1785624695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e597SzF5n/PM9EkMnGuBBQh4XkUddaPspXC7fYxFtHE=;
        b=eF9GavdB27eeX2Dd8gY9yjnDP2mycVp5oFvCQQfeVu3236yGHPYtuvqDuIUoUydsgL
         S9lIERC0f/WE67r9IxgmBsdy8jBYsXKQ60fkcnzRKLO2mr7ChYHFLylodPXmlmmIWck/
         Ea4rlGYY3rL5L/mjFNWKPATIhYRvWV4O/lPyJn0g/gbKTDuRvNa7bfijnzzMGssGwChu
         DYVl9FXdFx5sYZqrDJ8y4T8ytEmfC8cahnx/+qKHJGyfNyhKxmGzRJuTGrQYtskbBnkC
         LlluvmbTBRJPbl2YzHWpQbzUyra/GO3fToxgDp+OgdrZdqy5XhHCQD90jUDRGoFBgNvf
         hBRw==
X-Forwarded-Encrypted: i=1; AHgh+RoKFu6quhboaHeWP8ljeWB+zSUzwStZxcgTfF9eBjwA+E9sbIARAVnmvQkhYAZZC+mUtN0JSV8cJXQrEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnjZqqglo8b/RYPQmwquATJ/isKjP2YBabOy3djUkRAOPydUWC
	NUtVhPtJ8Vp0gHp91/97jbBK4PgctU6ghIM+yklhAHxxnFYTdF0TcYh+
X-Gm-Gg: AR+sD138Upq49+vbHFECSrax6DU9XB7MtX7vETaLKj6UIQKOz9iyQR/zRX+qLC+Ksrq
	4Q9J36kCRJ04gAZ+7mnyKwCaW76GKxrB2bpxUESVzWAW6gg05aXQeF9BxsycP5FP3ChkILeu+WT
	0iIA8KzeCybIPG+WBZM8c0srdckLGM7JygIHyU1HOVxERPXE7mo3zIvUoYeLKUH9+vosLBYc/fY
	re0m52JsL2wD/Zcvf2jbO1u8Kh87RUgeVYegcXCJdm1zXqigt1nL49h5KT+jjoFp7r23e2RmEtV
	OnoW1DyC2B5pM5oFWk0AawKzmVgkOI9yoO7secvVzfSThMIhJlmmonxzlKj2oWYwqfLDcDoc04Y
	X3APTNTwSerG9xSeXW2zSA6Id7z7VH8Qj35HR+QVLDj34zh5p/wUXlrQmA+xSV4ASRxctw7FUY+
	Dp
X-Received: by 2002:a17:90b:268f:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f2978b966mr3637050a91.41.1785019895045;
        Sat, 25 Jul 2026 15:51:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm3263879a91.8.2026.07.25.15.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 15:51:34 -0700 (PDT)
Date: Sun, 26 Jul 2026 06:51:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	E Shattow <e@freeshell.de>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy
 on pico-itx board
Message-ID: <amU94BeIJT39DRRL@inochi.infowork>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
 <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_155136_235438_C075D4C7 
X-CRM114-Status: GOOD (  21.98  )
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

On Sat, Jul 25, 2026 at 05:57:42PM +0200, Andrew Lunn wrote:
> On Sat, Jul 25, 2026 at 08:58:02AM +0800, Inochi Amaoto wrote:
> > Current phy framework can not reinit the phy correctly, as it will
> > assert the phy reset GPIO so the phy id can not be readed. Setting
> > the phy id of board pico-itx manually so the phy id dectection can
> > be skipped.
> > 
> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> > Reported-by: E Shattow <e@freeshell.de>
> > Reported-by: Inochi Amaoto <inochiama@gmail.com>
> > Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: E Shattow <e@freeshell.de>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b2a7d2d0d3a8..b9d2de878f38 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> >  
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> There was a patch recently from one of the DT Maintainers removing the
> -c22 compatible when there was a specific PHY ID. I did not look into
> why. Does this pass all the binding tool checks?
> 

Thanks for this mention, I have found the patch link.
https://lore.kernel.org/netdev/20260323194803.GA1241974-robh@kernel.org/

It seems like this patch is not merge at now, but I am fine to
send a new version for the incoming change.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
