Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C349C77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6elV2G3ZEraZ3ZAVXONDI3PrqFS1c2pExxan0gEdSI=; b=Q2xQtjXAuTUXZW
	aJFKh5XCm87QKvys0iDoa6a3qDxWm3pQCkyT2q2/jev/yR6G/e6JymwpZODjde2wM1b7lWUZ7GqF0
	9QPQB4GZShowBkYk1g0Mg+T4nKGeurzj43L9kWWFdNueZ38DyouKfFtTwP7TTvcrtdliUK5m756IB
	aX0BXkPK7QDnR1qRcLAcXlGCjYGDppTLV28XTExnkCXfZsm15Cl8sgtSOjQUIqPNl8PAaeMqYxAlg
	egctv7LZguPLW4hufLFKZJXRou8iM9veNibU+t1f6zVQX918J+7vcGv3P7pxiLCbiFmKF9x9AyGJq
	9IBBLTgHSY7dJBwkBYXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0f8H-003Tqh-15;
	Sun, 21 May 2023 09:13:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0f8E-003Tpe-08
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:13:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F81960CFB;
	Sun, 21 May 2023 09:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AF2C433EF;
	Sun, 21 May 2023 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684660416;
	bh=9KfIOx+itQxU8NyXXIB5Io1Yi152RTWE9ltYXldIDoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OG4Xc+aQ8aqJOU8OR4GfqwPyIMccaLnoo+767S4YjlMeXoPHy8kbmwZ37iAklsDdf
	 u65QOdpTxaJMKy0PuiVwkQdEN062i/k1jUKPbaJaavzAvq2b8HRdZB/Mme3ppwiTsm
	 tkrFODIJsn1zVPem9eaeuqdUmR+tYTB/Y/uRc38TINr5cTC/FDSG0EQeUNgqSth3b9
	 eT/56hnSD7weLsl0GWpyCtGWUzlAtC0RBAg229J2diNuCN7jwY19OazoxLNWTrlT03
	 yLzoZI/TpQtfNNFMizU1agWXUmdmZpxhvyDdd29YEECA8H9nIMv6YGbEWMBACZuMbb
	 8TaLz+5Lvzt4w==
Date: Sun, 21 May 2023 17:02:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: vendor-prefixes: add bouffalolab
Message-ID: <ZGneH+ApaQVvv3SW@xhacker>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-2-jszhang@kernel.org>
 <a45c9193-aa63-650f-dbb3-14b6c3f74eeb@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a45c9193-aa63-650f-dbb3-14b6c3f74eeb@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_021338_189908_0C92A964 
X-CRM114-Status: GOOD (  24.70  )
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

On Thu, May 18, 2023 at 09:53:12PM -0500, Samuel Holland wrote:
> Hi Jisheng,
> 
> Thanks for updating this series!
> 
> On 5/18/23 10:22, Jisheng Zhang wrote:
> > In the following commits, we will support bl808 SoC which is from
> > Bouffalo Lab Technology (Nanjing) Co., Ltd.
> > 
> > Add bouffalolab vendor prefix binding.
> > 
> > Link: https://en.bouffalolab.com/
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 82d39ab0231b..3566346f2f9e 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -200,6 +200,8 @@ patternProperties:
> >      description: BOE Technology Group Co., Ltd.
> >    "^bosch,.*":
> >      description: Bosch Sensortec GmbH
> > +  "^bouffalolab,.*":
> > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> 
> Have you thought about using the "bflb" abbreviation as the vendor

I did think about bflb vs bouffalolab. Here is what I thought: I came
across "marvell" vs "mrvl" sevral years ago, I got an impression
"marvell" vendor prefix is preferred if I read the discussions
correctly.

As for Bouffalolab vendor prefix, I have no preference, maybe DT
maintainers can provide inputs here.
Rob, Conor, Krzysztof, what's your opinion?

Thanks

> prefix, like you use throughout the driver code? This would save quite
> some space in the DTB, and seems to be the most common variant seen in
> the vendor SDK:
> 
> bouffalo_sdk$ git grep -i bflb | wc -l
> 14364
> bouffalo_sdk$ git grep -i bouffalo | wc -l
> 1042
> bouffalo_sdk$ git grep -i bouffalolab | wc -l
> 179
> 
> So that is what we were using for bringing up Linux and U-Boot over at
> https://github.com/openbouffalo.
> 
> On the other hand, "bouffalolab" is certainly accurate as well, so I
> understand if you prefer it. And we will of course adapt to whatever
> gets merged, since our goal is upstreaming.
> 
> The vendor code drop[1] provided only one example, "bflb-uart,uart0",
> which is not very helpful. Maybe you have received further information
> from them?
> 
> What do you think?
> 
> Regards,
> Samuel
> 
> [1]:
> https://github.com/bouffalolab/bl808_linux/blob/main/linux-5.10.4-808/drivers/tty/serial/bflb_uart.c#L700
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
