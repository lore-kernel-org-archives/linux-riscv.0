Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC366C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VijxNZKSyClwCGeIBEcVAtQpcMdnYem9TIEjD1SI0I0=; b=ws8g0BMra/790+
	Eif4s0pRH/z62+fOyosm9a0bcmkNYnZQ0EZiUHt4wsguQeNPe0eZoRbmiuYpcN2fvjxqS1JnlOt5g
	lC1uiEv3fHlRL3N6eOqd2Z2AliQnNvO5sT9UDEIWIEhjDOe368Wrrv3hNBdp9q+pYuKHO35Fu0Zri
	a/USqyuIh3uc7u471HAhDyCj/xlnMybPx+YEbH1xIBDGhOwnNPQX3JYiybO5gDfqD7I8PyuCSGr04
	cH6NujKzo8+FL7iIiGttS38MYym9CuQf91iIyGSOe5hsi2zIQanIL7LbumQfkIOZ0HHS8T6q107I2
	/ycxwLDx5kdHcOpKnE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NZX-000GTo-01;
	Wed, 31 May 2023 15:17:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NZU-000GSW-0p
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:17:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9966E63D2B;
	Wed, 31 May 2023 15:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F24C433D2;
	Wed, 31 May 2023 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685546227;
	bh=F2oc/tidTrFnHhaHZr881PgbMLURyR5U4/nkSfN9YS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcEGyF8FybWmi/JDto/ddTnXqo/tO5zJ7DW2B/NakrvGKANUGraVuszAbwbfDKQ7Q
	 82tu9gTevz0Yu6y6QFHRYgbbPngyHMw3fzUOQ7NQStlTrv4jbx1zaHoYTDrWAkDX8Z
	 +4PE4X3KPwS5aLtKrJEdlT5etaaorkYQCcDOsIGSwRKj43RL8Yxu3kvH6Q1tUxsVKN
	 xcPpGGblXTQdKGUNb881ojltavyXFriN2uKAfM4/YwuEbgTz05W8eisK3jvSVpYVhx
	 unVOhSHeKnniSjj4JdRPKG1qgqnyK2CUmOSmd+NHTKDI18IkZhO8FrszGYeffoxXtP
	 nAHIl41W14dWw==
Date: Wed, 31 May 2023 23:05:46 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 04/10] serial: bflb_uart: add Bouffalolab UART Driver
Message-ID: <ZHdiSjajwbF3cKBK@xhacker>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-5-jszhang@kernel.org>
 <2023053010-gondola-luminous-f5e7@gregkh>
 <ZHdVNIQpgfCzimRg@xhacker>
 <2023053119-drab-cartwheel-29af@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023053119-drab-cartwheel-29af@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081708_336067_89316AA1 
X-CRM114-Status: GOOD (  19.77  )
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

On Wed, May 31, 2023 at 03:34:02PM +0100, Greg Kroah-Hartman wrote:
> On Wed, May 31, 2023 at 10:09:56PM +0800, Jisheng Zhang wrote:
> > On Tue, May 30, 2023 at 11:36:00AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, May 18, 2023 at 11:22:38PM +0800, Jisheng Zhang wrote:
> > > > Add the driver for Bouffalolab UART IP which is found in Bouffalolab
> > > > SoCs such as bl808.
> > > 
> > > New uarts are being created that are NOT 8250-like?  Why????
> > 
> > Hi,
> > 
> > I'm not sure I understand your meaning. I guess you mean writing the new
> > uart driver following 8250 style. And the latest example is
> > sunplus-uart.c, it can be used as an example how to write a 8250 style
> > driver for new non-8250 uart IP. 
> 
> No, I mean, "why are hardware designers creating new UARTs in 2023 that
> are NOT 8250-based"?  Why do they want to constantly reinvent the wheel?

haha, to be honest, I dunno the reason either. For me, the HW has been there
and is linux capable, I want to mainline its support.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
