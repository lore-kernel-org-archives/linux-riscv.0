Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AB4CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJmDYgK4uR/MUm72klgtWhKXbI4xYUHINayUkcj9g/I=; b=fiLZ56cjvGOXem
	NUHFUWhivByFvU/lx8a944wgcGi4sZKR2jtTqJJCI7Aqu6UkRpX2ZCxaggPJBUtD6SJxW2R8UGepc
	6gBK8lm7567rgQVcWZEdcFu0iS1NmbNQrJteOgE296Bx5plfpLcqDVDbyvToE4qVuVJRM4YY4AJII
	f6sJXYo4x7Y5K67v4xaO4G8VDOUG64DHte2nZmxJHEAwigiX7aPqb5yYJ+6+1K9BbBgMHWtJEQvHg
	Wn2a7LGWbful96VZy02r9F/GC6XLJjNgGYCK6mdAXbr50Mi4ZMh1NrcynmDDyED8m0oVPrgkIicB7
	B9GJGKTcxXv7gEvhDvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPq-00000001cZk-3q58;
	Tue, 02 Sep 2025 19:11:38 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRJ8-000000008Jn-40Nf
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 13:44:24 +0000
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6D527335DC0;
	Tue, 02 Sep 2025 13:44:21 +0000 (UTC)
Date: Tue, 2 Sep 2025 21:44:17 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: uart: remove sec_uart1 device
 node
Message-ID: <20250902134417-GYA1155728@gentoo.org>
References: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
 <680534b4-27e7-4506-885a-1c3dc9d12b8b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <680534b4-27e7-4506-885a-1c3dc9d12b8b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_064423_017437_41E9D806 
X-CRM114-Status: GOOD (  21.19  )
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

Hi Vivian,

On 20:55 Tue 02 Sep     , Vivian Wang wrote:
> 
> On 9/2/25 20:26, Yixun Lan wrote:
> > [...]
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..3094f75ed13badfc3db333be2b3195c61f57fddf 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -777,16 +777,7 @@ uart9: serial@d4017800 {
> >  				status = "disabled";
> >  			};
> >  
> > -			sec_uart1: serial@f0612000 {
> > -				compatible = "spacemit,k1-uart",
> > -					     "intel,xscale-uart";
> > -				reg = <0x0 0xf0612000 0x0 0x100>;
> > -				interrupts = <43>;
> > -				clock-frequency = <14857000>;
> > -				reg-shift = <2>;
> > -				reg-io-width = <4>;
> > -				status = "reserved"; /* for TEE usage */
> > -			};
> > +			/* sec_uart1: 0xf0612000, not available from Linux */
> 
> I know this is going back and forth a lot but I don't think that's a
> good description of what's going on.
> 
> My preference is that we just drop this node altogether, just forgetting
> that this thing even exists. But if you do think we want to keep the
yes, removing the comment and completely dropping it is an option..

> information we can drop the clock-frequency property too and change its
> status to something like:
> 
>   status = "disabled"; /* No clock defined */
> 
> Which also silences the warning - disabled nodes are allowed to be
> incomplete.
no, set to 'disabled' is simply wrong, it doesn't reflect the meaning of
"unavaiable", I remembered we've rejected this before introducing the
'sec_uart1' node in the first place

> 
> My personal opinion is that I think sec_uart1 and TEE support feels too
> theoretical to be worth caring about.
> 
> Vivian "dramforever" Wang
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
