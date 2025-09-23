Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C805CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ext74KJgCqP68uVQpi8ENfikAabBXBBRtHtTpy6ihI=; b=dmGhE0v20rHCKJ
	y65ZNO/1iJKUWzmusahvPSj3YcLyo74Mu8ZkoYqTzc/uTM3MemWqDwLVVETZSRZO3mF5iIgp+CV02
	ptYgGSyreYytu+S4CJsl7/ajL6CfnFYXLFAVT5YiEf+yg+pNN5I/Z2EMvBpPREc6oT5toYMrg9jfK
	tpFK/yjL8HJI/cn16PLV1wXVSBVdd/dgpS9IDtQ4FW4jrXx5lRmjtTYazjKOC+FJmfs7E5kY2adyh
	Fk44QCvTqiAobg7YY16h4aWJPfRPI14tNme4I9vCb46DWqOozCNIJzwVwXNyroenanJ88T+t7K5sY
	/XdBio8rKd7I9qcbHrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18aE-0000000Eekn-2g9e;
	Tue, 23 Sep 2025 19:21:50 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18aC-0000000EejP-1kLQ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=a0W6UucVZcsa4tEXRuLEbZNgWX1QiAjb2QntoHbMXRc=; b=zHdsdxEx2uI1cGM05OkrzBseCO
	HNDD0VDiCRNkI1wUbGSRJL5+FgH1tEeR2tp/jwBH1qflQ2bBipj5MOM+OInRHAfT6EmFwg0qeSktT
	tb06SQQQmKOBXpWpqatQYHZqkamzrx2wu4P3zMjG8z6CYSwJckgT2HRFgXD4+dHYFwGcahoKXWMUV
	vFKPtCFEBsuFslYXnpxsW2RcMY8w6OA1jovT5yFOjtS+zb3CWEa5eSTQmfq1M8wZ2bvVrCLynBPGn
	gEy3cOMsmvq6egCE4wNDldIuib8Y79IzUUbBulXz5SmxlQ5Kv2g5oF/6R2owlr8CTQguXuDDhGBUA
	JREGooIw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v18a5-00CA8A-0F;
	Tue, 23 Sep 2025 21:21:41 +0200
Date: Tue, 23 Sep 2025 21:21:40 +0200
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
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNLzRJcKCYOngc7z@aurel32.net>
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
 <20250921210237.943370-3-aurelien@aurel32.net>
 <6CF6078CFA2EB2F4+aNH_RmNkM_hnsAYu@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6CF6078CFA2EB2F4+aNH_RmNkM_hnsAYu@LT-Guozexi>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_122148_457294_FBCC3642 
X-CRM114-Status: GOOD (  16.80  )
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

On 2025-09-23 10:00, Troy Mitchell wrote:
> On Sun, Sep 21, 2025 at 11:01:42PM +0200, Aurelien Jarno wrote:
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
> I'm not sure this is 16..
> Could you double check it?

Yes, this matches the datasheet:
https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf

It says "Page Size: 16 bytes"

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
