Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364AECD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UT8HGbRz0+D18wVPRO70//z1a7xSGI5LTYi9SEiXFdA=; b=UZN23anDrEPUE9
	1Jw8C2H7MTMZOVyZWt3pM+fwrJNNFBJGNorU3UhA22rC1z6OLeSnE41LHi0N7Qyc7v1MT30eCFyZM
	5NU3S8xefdQQermwY/HToq/GUG/KrkWwbWWBkJw108Pow7B4Pt5GBKa7xq5xWGYntiicmALYskcCS
	drzc++tpaOpulQ0Q0D1xnFRjFdLHrtwnwjMD95dRier+5xkHHF2VPV8lLlKsoZjV7wAWCLNOo3UUw
	f8P0YKu5Zn14QezAU09vUowz1cWr27Mr3eTO5cdJA8WQyYkyNGpHnrMN1kQae7AP2OdAxsk2LI+qx
	xxMiZ4fZ3U/u+IWeM1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5f2-00000006VN6-38Vk;
	Tue, 09 Jun 2026 23:15:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5ez-00000006VMl-34Kb
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 23:15:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso42208475ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 16:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781046905; x=1781651705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae/32RAlZzOkrMKZrBalt4ZXi3T3OToTPv5Duv2/6FA=;
        b=pLcN9Zowhs4EAjN17EX3fH649MN9VJOHurF1XCw6vTWRyQA6SMXVY8NxmPeUj95xVy
         7VMDIK/tXfJ+JuZJEQBPgFEzrHE9kPoDKgPbBCdBbiKO9AO8dYhjrfdeA/zproab6w4Q
         467cKNNLXguQ2WD1JX11k2dbfRZ+cy877Vh+79lQPAmUbp67yCelaCmHAZGJpnxFUvfq
         +Fmv3DFq77YGEjQu1dHXSO8M933HCuL6u039kaktVREMBo6m4MJPTkyExE2/rNHVdhll
         PHWcLpC0BaOH2rKrZ9b9z9SmdkAB6p3X34/XxqGTts3lSFwNCC2npw9uFBSXrA+gSo0Y
         ST0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781046905; x=1781651705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae/32RAlZzOkrMKZrBalt4ZXi3T3OToTPv5Duv2/6FA=;
        b=ImfM0FwCxqIIHBWAO0shJe/cI+yMfqXIN0k7XI/W42Pd2vYwVjaSfOlw6uWppJDz0s
         l/eXm9Fc69PfKlq3490aSrqJ6Mfjittxaz3mFs3ArlzkGf1IVkHX9GuBOWuyvP/gGxTu
         vAy1r3AVxkf+Puiq/DMymE712u23LU8UudTxRfC/Rv11uFUXMbAd3q+r9ggckw6T2VXw
         8+vHjixjPYrJjzw2L9W1nL3IpkB7G9AHbumDu+rDefPXM5WlXtXoGwaTCvcgCJZJgumB
         MSx5Ah4BS9+lLyp50U65MbQAu4llQpApYF0LG4zDj65RWRhkLVRD4NGZc1NWA4qXyBmu
         syLA==
X-Forwarded-Encrypted: i=1; AFNElJ/nyFCqLg5JLyQPIaTzPsWGVoPT5ArjIv1ge0WJQRoSctxfBhmjjkFhC06gHXqnIjvRgZAu5hHT7TmmUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxamVv16RcdJaMPK3vcz9XqEeN9z+xyadS90mDBhuz3pDCObiKb
	LfXUmnDR84NUTaenXAOwu8Y3DiPFimIHVGK4Y6gSpfV3HXY5sJYqrV/n3lIabjLs
X-Gm-Gg: Acq92OH6PsarkpWTZRvplu9XWWuBxIOsvQGxBbBN+KAFX/DN/78JpQxOF7I/TZoogoC
	EtSjRcuALQ2Kf2RfXtK7C/rcWGcCw9MKqUMeyPhH7g+uuK0w/lpxwMQxfLaga/aZF9B/2WXi4h7
	c297xu7y+YKgAnl8ZwNu/zvxj96XupYUXGUZAjZpYeCeSDyaU9gcNMPKEWa9RbXlvatJ9I+NOrQ
	Ax9IQ8w6oaQI2RnDsXDVjVierj+tcbRjHPm16Zp2ZIt/Bhh/ItKlmNZbw27sQmeCv1qUMmCHdwh
	hxY5K+6hN2w0DC9aPLUwp8RiNeAqOT0buiKQzuRsvg6R3NF/zW1milqonvsHT/6EHsq1T/VjEDT
	FEJzKbHjVuGI3BDVVgwB7fecWO9fZNSH1l0BZ/Frj6qjLzJXp33KJYcEN6TShqLEWyR9vvWjCLd
	/Z9aZBwx+Byg==
X-Received: by 2002:a17:903:19ef:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c1e810bd1fmr284368035ad.21.1781046904581;
        Tue, 09 Jun 2026 16:15:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm211741165ad.12.2026.06.09.16.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:15:04 -0700 (PDT)
Date: Wed, 10 Jun 2026 07:14:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Rembrandt <kernel@rembrandt.dev>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aiid4Y6x6Dbbwszf@inochi.infowork>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aihYftGNcpUd4UUR@mcmanus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_161505_775375_1BD9E6BC 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Jun 09, 2026 at 08:24:46PM +0200, Andrew Rembrandt wrote:
> On Tue, Jun 09, 2026 at 01:37:56 pm Inochi Amaoto wrote:
> > You should set tx-internal-delay-ps of the phy instead of
> > the controller. This is a phy in "rgmii-id" mode.
> Thanks for the review. I don't think that works on this board, but
> please let me know if I'm missing something.
> 
> The PHY is a Realtek RTL8211F. Its driver only toggles the chip's fixed
> ~2ns delay on/off from phy-mode, and per the datasheet that's a hardware
> limit, not a driver one -- the RTL8211F has no tunable delay, so a ps
> value on the PHY node has nothing to act on.
> 
> The only configurable delay element on K3 is the SoC RGMII delay line,
> and dwmac-spacemit programs it from tx-/rx-internal-delay-ps read off
> the controller node (spacemit_dwmac_probe()), so that is where the
> property has to live to take effect. This is the MAC "fine tuning ...
> values expected here are small" case described in
> Documentation/devicetree/bindings/net/ethernet-controller.yaml: the
> RTL8211F supplies the fixed ~2ns via rgmii-id and the MAC adds a 400ps
> trim on top. Ideally the PHY would own the delay, but as Andrew Lunn
> noted reviewing dwmac-meson8b, that requires the PHY to implement a
> configurable delay, which not all do.
> 
> The already-merged k1-bananapi-f3 does the same thing: eth1 combines
> phy-mode = "rgmii-id" with tx-internal-delay-ps = <250> on the
> controller node (via the K1 EMAC rather than dwmac, but the same DT
> pattern).
> 
> Would you be OK keeping it on the controller given the above? 

Yes, it is good for me.


> For v2 I can add an explicit rx-internal-delay-ps = <0> to match 
> the other SpacemiT boards (k1-bananapi-f3 included) and spell this
> reasoning out in the commit message.
> 

Do not do this, just leave the rx-internal-delay-ps untouched.

For this patch

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
