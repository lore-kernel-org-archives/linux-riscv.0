Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2068D1067034
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ktu/z6Iu+4MwSSv8J0JnpsQBNhu0PisdVhVnYlBcSqk=; b=rl91OHz0QurmKc
	0t0DQinZRmUadBrSgQMIMk0w4rH5Bcb0K1QQwhwfYAZrco9kklhYOx0/nV+tiWFezgNGsq18xiLeb
	LLAVOjpmu8yLurJImoxWYhb7wTNa3p2ZKLfe4DQrbVXztDhJrZ4TlV38IiWtQBQrAzSlUpZ15V6E9
	nor7ymgOwmY2E7GEvUZuT/voaZEJ/IytE1XhAIu7l8xvSGTwfjnknlwT3vzNECY4kCiXQFZ9rwZBA
	lfyK3ZnL+Mrwc54uG8Loeyp0JlSsm9OqAhjkz7QZoBqPyPisCjWdPwSxhiRaDYA+JBpxHh8q/Zr9G
	RfPAv7OtE0wXzhGCnKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gml-0000000EBQc-3kGR;
	Thu, 12 Mar 2026 14:13:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gmj-0000000EBPo-1E29
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 14:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFFDE40DCB;
	Thu, 12 Mar 2026 14:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEECC4CEF7;
	Thu, 12 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773324787;
	bh=D0pydH4ruiio63yrExrgIc+D3WCJCkmob25LogACIsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wYocTeVuMWammMzFo4hBCdOn0IP80HCf47aLXflFHBHPtHxrQSHmae3n7HSEq06Lq
	 ty31jW0XtKt0WjVtLmX1krkW40FXv+zBTbV7xbHJNe2tVHTyB6hg5jFmDj6XYj7Y7Z
	 +nSL1kCQt9itvX0E/hA8JHzpN59QPMeP2UkAFSNk=
Date: Thu, 12 Mar 2026 15:13:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, Guodong Xu <guodong@riscstar.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: fix clock property
 for K3 SoC
Message-ID: <2026031226-utter-spellbind-53bf@gregkh>
References: <20260304-01-uart-clock-names-v1-1-338483f04a8b@kernel.org>
 <20260310093446-GYC318052@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310093446-GYC318052@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_071309_381420_3572A2EE 
X-CRM114-Status: GOOD (  14.96  )
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

On Tue, Mar 10, 2026 at 05:34:46PM +0800, Yixun Lan wrote:
> Hi Greg, Jiri,
> 
>   Do you mind if I taking this patch via SpacemiT's SoC tree? and if
> possible, it would be nice to have your Acks..
> (or either way works for me, if you grab it and merged via tty tree)
> 
> On 07:19 Wed 04 Mar     , Yixun Lan wrote:
> > The UART of SpacemiT K3 SoC has same clock property as K1 generation which
> > request two clock sources, fix the binding otherwise will get DT check
> > warnings.
> > 
> > Fixes: b5024e804ee0 ("dt-bindings: serial: 8250: add SpacemiT K3 UART compatible")
> I would just drop the Fixes tag, as I think at the time of Gudong
> submitting the patch, the clock driver isn't ready, so he deliberatly
> removed this clock contraint and provided with a fixed clock frequency
> (the bindings match with DTS)
> 
> https://github.com/torvalds/linux/blob/v7.0-rc3/arch/riscv/boot/dts/spacemit/k3.dtsi#L414

You need to get a DT maintainer to review it before you can apply it.
If you want to take it through your tree once that happens, that's fine
with me.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
