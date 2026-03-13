Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74338106FD91
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpIWQgcAF0sHUFCrzoHlQRz3KOORgRUTEHyt2Qw9IHo=; b=hALrHmWwvp09V+
	moGiXpyZ0UU3lbO7WnDhO0CKm4OHYlqmBAkcgk1yoIsjaOHBw9mynFysLjir7fP0SZXlLf2WDseBv
	Juv1e3cSXiOMwUtNeqRQYAKQpXZfDT+0pf6tM1IiNo3IRJW9hvziLzcJVf2MwL81JJGczQ4OEMTly
	P87GOnl+K4vElDVJvIeJ/KnTPhWq4rMB5ydBNNKV6FMDKb86OPDHxagLPKuht2TfGKGluLE5FlcPC
	Ou+zBj4N47kOwt4PqB9drKAq4BA90KsT8Tl0VJPn8JoSGkt8Ya5ptYEoRECvEcSWIuQiMs5knoz9X
	QzWPxmKoYPY5AF2d1VbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wb5-0000000Gxwo-41Sk;
	Fri, 13 Mar 2026 07:06:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wb2-0000000Gxw5-1LQm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 07:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7DF56012B;
	Fri, 13 Mar 2026 07:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A197C19421;
	Fri, 13 Mar 2026 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773385566;
	bh=cFxTeORzoBh5yrTQu5gbFRopOPKKtVbksSq1U5jNLFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtrhaIr1MRpUh8c6OylnW1rHwx8y+dXU12D78Veri7x8Y94WUujRcJixgZGDj5Llt
	 3mKATdISePftWdwKyniGUmendfmLZv+gTgADzFKn1vYpDihXNsCrzrhWL9qnMVLoYG
	 l1i71ZKmBpIpURBqmPIEuMwxNAy5e993yYApmkyo=
Date: Fri, 13 Mar 2026 08:06:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, Guodong Xu <guodong@riscstar.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property
 for K3 SoC
Message-ID: <2026031357-storeroom-repurpose-f680@gregkh>
References: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
 <20260310093446-GYC318052@gentoo.org>
 <2026031226-utter-spellbind-53bf@gregkh>
 <20260313011910-GKL302167@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313011910-GKL302167@kernel.org>
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

On Fri, Mar 13, 2026 at 09:19:10AM +0800, Yixun Lan wrote:
> Hi Greg,
> 
> On 15:13 Thu 12 Mar     , Greg Kroah-Hartman wrote:
> > On Tue, Mar 10, 2026 at 05:34:46PM +0800, Yixun Lan wrote:
> > > Hi Greg, Jiri,
> > > 
> > >   Do you mind if I taking this patch via SpacemiT's SoC tree? and if
> > > possible, it would be nice to have your Acks..
> > > (or either way works for me, if you grab it and merged via tty tree)
> > > 
> > > On 07:19 Wed 04 Mar     , Yixun Lan wrote:
> > > > The UART of SpacemiT K3 SoC has same clock property as K1 generation which
> > > > request two clock sources, fix the binding otherwise will get DT check
> > > > warnings.
> > > > 
> > > > Fixes: b5024e804ee0 ("dt-bindings: serial: 8250: add SpacemiT K3 UART compatible")
> > > I would just drop the Fixes tag, as I think at the time of Gudong
> > > submitting the patch, the clock driver isn't ready, so he deliberatly
> > > removed this clock contraint and provided with a fixed clock frequency
> > > (the bindings match with DTS)
> > > 
> > > https://github.com/torvalds/linux/blob/v7.0-rc3/arch/riscv/boot/dts/spacemit/k3.dtsi#L414
> > 
> > You need to get a DT maintainer to review it before you can apply it.
> Ok, so Rob gave an Ack
> 
> > If you want to take it through your tree once that happens, that's fine
> > with me.
> Thanks, so this imply an Ack, but could give an explict Acked-by?
> then I will proceed..

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
