Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111ECA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Mmokq/uSxkb1zB62qdeJrt31oPGYmpCRfvu8NkcBi0=; b=Yo2wzUY+Lermg3
	SUvaQ6hkXKE9bGW0zqNyPOFSrtJj1ibglhSefAalsDR0UmDdJJJ2l7onXl+wQqd4njBzC4aqUub+b
	Rlc5UrwI/fC1pbeyDd7yYRt2A6gxfZH+cVhr2/l0HiCJeIXLwjlXxjREUYVq3E8EgkscI3TlZtrWB
	RepZqTyPwbouCiwt8krMdnwWm5iHTtR5faZh77VgMzawPYtQ8wuEsoiHpN6BRI4A9RFlkI819Agit
	9pPVZ4Wzrd9wXlbfLKmOag+zxiTWu9tz6g4MYQJBNITtbJH+WJZsnsfad5hvcjkkaDfKJDyUjBQt1
	GCSDfSmdyRb4WplvWYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8E-0000000FehP-3nhW;
	Thu, 21 Aug 2025 03:38:30 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouEC-0000000FSsu-38ys
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 01:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755740118;
	bh=4i2PKH/pkBlK7p/kcJ9sT3KN6EegL/vQ+jD+W2is93E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QCk4DnS4L+36/DjvrR9GWwG6uNn120zCdWf5/ObBJjVnn97ycNG8UsMG+CUBrBVVv
	 MICSe6Wb3EGc254LXTgCnnBDxOrAfh34TXEwgUScKLsZr7XPxa4C1ZS6mOmVru9apE
	 4DxK0MwfgMmtlXX5R8LV96l1fyYiBWIW9Qc/IeP8=
X-QQ-mid: zesmtpgz8t1755740110ta5c2e935
X-QQ-Originating-IP: +FxJ7H9nhcYGojFKOawCdDolbd6zWoQ6jpGoCAUSbgU=
Received: from = ( [14.123.252.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 09:35:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12836128371367281167
EX-QQ-RecipientCnt: 16
Date: Thu, 21 Aug 2025 09:35:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Message-ID: <9E4A44D8F7E9454E+aKZ3zCxTMq10AYqM@LT-Guozexi>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
 <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
 <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <aJ7Q5tQ3oa8DBpfO@calculate>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJ7Q5tQ3oa8DBpfO@calculate>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NSx3808bYn4Q4Ng6WVmQspnHEQ6wID6gpTcyvou4I9Hh/Ietp9eLYJ/1
	O6RUTwohUzijZnKmkT3POld/O9uWN7qje5reQheCNvmjlhcyQYXll0PStamj2VgWS0RI1VA
	baY7swE/DEie6ss0xOt3KQGDcpU2slfsvHCt7apMyq1Czh7aestwiSyA4VXp9U7Xz4/Vrso
	y8mjsKi/Go0q+K3BF5Iq7HgoDlqJW31H8LuRJwiyo+7h4fW651Q8Rbt3dQ/cPVNPyCNDCsX
	Xl3YwtlKk5R8bZNxbunoQZyZyH+ZecVLgUHpOCdAGc1HmozhXMEpHNsW25sIAWRIWCBWjet
	L8uF2wKWf+1+yLHC4FZT+yhykzv6I9MryWnBzGENndv6kImNAJAnyTqTcXyZp7YNraf9qmE
	ILve7VGMipB2kS/+S8V6Y9PCE47C9R8OLkJlR8iulgBqUM/Z+sm0xQ2eGZlEcNBCZMknR/L
	S0pKPu1LjxYOZojwXcTFIixPCTqo6eoUW9OXM1i7iX2P9J8cMib28PJa3KP7AkHM0BpYTqp
	GJWDf0xdUplo023GZRvOvDoxYD33zOTitUF9IUMtF2G6yi1xKzvwzGVfqR/jm6BYUZQBa9y
	nZGM6xquFbQHOiVFzcBrLU0/yih8iMbUg5nYHySR2C3Gj1lbrmRoQFj2CDe7kMiuQuwXd4H
	LK+1s8rR7hGhDPHgS8xtnMxCQT+JQpdTUtsukHXg9tas7kPzjVFOl3iJ6SJ/MpERJMBZHBz
	6jughQnCiBqx4+2efhDK7AHK9ywxQ79+vLF6pH6/+ShdAzEX7Sftz/uy2jNGT99Cc6eClYZ
	/930xwZsJvo9Jg0hIiTRnD83ApsVh96eG3RltZb9ReFwAYBHYWb/v2LM3cQl0fZ8pqaVHK3
	YlWBFjB4wyYhskcUS0SxogE80u4zUyrz4wRVigavZtjixip/U34TuZT0X3DmbpGb722KYsh
	cnDUXCuSpKzrqpbH9JjFJfu1p+TraO6Eg8THEMZwYpT6bbUm2srow0Lr7hmX0PSUdolVEb1
	JuA9xHVrLEWMibJSs2MdrismDl85Em4LeK2X+luvUFTYYK2NMv80m4U3CaO7g=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_183633_077467_3E3A80EB 
X-CRM114-Status: GOOD (  19.31  )
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

On Fri, Aug 15, 2025 at 02:17:10PM +0800, Zixian Zeng wrote:
> On Fri, Aug 15, 2025 at 11:56:22AM +0800, Chen Wang wrote:
> > 
> > On 8/13/2025 4:33 PM, Zixian Zeng wrote:
> > > Enable SPI NOR node for SG2042_EVB_V2 device tree
> > >
> > > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > > ---
> > >   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
> > > --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > @@ -226,6 +226,18 @@ &sd {
> > >   	status = "okay";
> > >   };
> > >   
> > > +&spifmc1 {
> > > +	status = "okay";
> > > +
> > > +	flash@0 {
> > > +		compatible = "jedec,spi-nor";
> > > +		reg = <0>;
> > > +		spi-max-frequency = <100000000>;
> > > +		spi-tx-bus-width = <4>;
> > > +		spi-rx-bus-width = <4>;
> > > +	};
> > > +};
> > > +
> > 
> > Only spifmc1 on EVB_V2? What about spifmc0?
> > 
> Yes, EVB_V2 has only one spifmc1.
> I have checked schematics which can be opened by OrCAD:
> https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x4-EVB/sch/SG2042_EVB_V2_20230302A_BOM.DSN
> https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x8-EVB/SG2042_EVB_V11_20220902_BOM.DSN
> 
> For your convenience, I have exported them to PDF:
> https://github.com/sycamoremoon/linux-riscv/tree/schematic
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best Regards,
Troy
> > Otherwise:
> > 
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Thanks for your reviewing.
> 
> Best Regards,
> Zixian
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
