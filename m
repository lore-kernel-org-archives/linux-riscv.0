Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A940BC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaQ+XY6g4tVgD75XMAbnVCayupbXVDtpAkF6Yl98kUM=; b=BC/Sc+fLq3fo3G
	8ba+IaYnKDC89f2DFlwN+CIbTsxNb7m5S4seK3GQ3eDl/APcqWoFpYeN6UHKs/luyaREcTXdEf0vw
	ns0Gs+kECclJTS8Mo+x6biQx5Nq+mC6WGsTlMHefkEuibApk80R5c/LbC7GZ8fvuQICZcHGhWQFhj
	/LoWnZnM0N4pBMoXz4InWHOrTi+Gg7M8vU+PcbDFTUzTD56txTn1PApRxbFO5r/bDqAL2zWuFgd/9
	1h9olRy7KhjoyoiBdw2qE6EHi3u/QYdN3osfrXsuoWa5llgEcr6h1LlvcxX0ebOSQrlIQCLwkCAcV
	90lOIZxg3cdQ0lbMHyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Mtt-00092U-2v;
	Wed, 31 May 2023 14:34:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Mtr-00091y-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 14:34:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D20DC61176;
	Wed, 31 May 2023 14:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCABC433D2;
	Wed, 31 May 2023 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685543645;
	bh=mUMjO1OdsoJvyDsLxetTPv8J33WqgzLK/1GWLYInHFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAXNydOE+GkDVpKqoWOZlRVZ/KfPMl00INzrkYzHu74AMD8gYPhkASWHup44uXJnU
	 0OcJMyVwR9GqJwAZz0GdW5jfwSAvwih/PE61iH6KAY62sb4GOHRgOy7yPBNYILWvlQ
	 cgkusdjrxXZQXDnJfMMK7OMiKyCrtMiG1rvt3tHA=
Date: Wed, 31 May 2023 15:34:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
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
Message-ID: <2023053119-drab-cartwheel-29af@gregkh>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-5-jszhang@kernel.org>
 <2023053010-gondola-luminous-f5e7@gregkh>
 <ZHdVNIQpgfCzimRg@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHdVNIQpgfCzimRg@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_073407_241171_83E9AB00 
X-CRM114-Status: GOOD (  17.61  )
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

On Wed, May 31, 2023 at 10:09:56PM +0800, Jisheng Zhang wrote:
> On Tue, May 30, 2023 at 11:36:00AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, May 18, 2023 at 11:22:38PM +0800, Jisheng Zhang wrote:
> > > Add the driver for Bouffalolab UART IP which is found in Bouffalolab
> > > SoCs such as bl808.
> > 
> > New uarts are being created that are NOT 8250-like?  Why????
> 
> Hi,
> 
> I'm not sure I understand your meaning. I guess you mean writing the new
> uart driver following 8250 style. And the latest example is
> sunplus-uart.c, it can be used as an example how to write a 8250 style
> driver for new non-8250 uart IP. 

No, I mean, "why are hardware designers creating new UARTs in 2023 that
are NOT 8250-based"?  Why do they want to constantly reinvent the wheel?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
