Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78B8C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkLtQO/nt8t8hvg/RNPA7XcqZevL0qOPb85s50qvG3A=; b=c7klPTwRL/OPns
	K21UcTTeMnsKe4g+oQPlHoifjmPN6TrW8P7PAe5/n0ma+5glj8oIvOhzPklmeT2/ehdVfHTaC6Z6G
	Uk/mlFT5GVY180xiwReNfAUNWDxbLUhMANiaRrb6bMaToBiK+sbcKpFcp7hAUsQFlnqJqD9uYEM+u
	8/HH3Op8UCes08eyOzHRimWiSvRqJmHvkzYve0gr5a+XXrgNkXcB6fxp0wHAVjs1zkLC5qzOfP2Vq
	IR1TAa5XBA6nzY+fsm6Qkw7AxE7b0jA6a25BZErz7Wtui+qs7nOpluXsLsiCw8LKbNdbUGHmdsDJ8
	jJoZAbU+0Gb1Rp+UJDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgDg-00DPO1-0I;
	Thu, 18 May 2023 16:11:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgDd-00DPND-0i
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:11:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B49DE650A9;
	Thu, 18 May 2023 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016A4C43443;
	Thu, 18 May 2023 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684426268;
	bh=+yx8G76DZdMcQ+TOxR1LsNaIds3YTBmYDcoIcqhWsms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INaiwJ6j1tWXc5PRvt9VriLPtLdS9H81vHAsM9ZDlTdydZXBPHmt3M6ceJ5xLjqFO
	 Nojk+sFVSHWX8ZjQqLjMCfbXQ9OijzZd3gTposYHqCEjIrW/gK4AGPAiJTVp9BxkGk
	 z4Q6MH732znret5C9S4HqnP5dJU2+2DKFJvJaSE9plYy7zY2s88YW3YRC/2y+xPaRg
	 GGFvmRUMpCGSf4rIRjnqQB5fhCb51nKDxbmA0XNy6XTQ6NO5eGCi773gkLyAOF6eZk
	 LayUvRWAQuub7QklE4Kif3bo5WPekXmqPvbTA0744i22Lho4cTsprYgQEegkuCfOcV
	 ZI4Dv9i95al/g==
Date: Thu, 18 May 2023 23:59:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <ZGZLe6kGaD7HWQJ3@xhacker>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-7-jszhang@kernel.org>
 <20230514-kinetic-backlog-b9573ae06507@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514-kinetic-backlog-b9573ae06507@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_091109_301061_B9D01446 
X-CRM114-Status: GOOD (  14.99  )
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

On Sun, May 14, 2023 at 07:39:28PM +0100, Conor Dooley wrote:
> On Mon, May 15, 2023 at 12:56:47AM +0800, Jisheng Zhang wrote:
> 
> > +title: Bouffalo Lab Technology SoC-based boards
> 
> I know you're only propagating an existing pattern, but the "SoC-based"
> looks rather odd!
> 
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Carrier boards for the Sipeed M1s SoM
> > +        items:
> > +          - enum:
> > +              - sipeed,m1s-dock
> 
> BTW, do you know of any other m1s compatible docks?
> I couldn't find any other ones via Google, so maybe it is just worth

FWICT, there's no other m1s compatible docks, but in theory the SoM
can be used to build different docks, I just keep it as is since you
are fine with it too ;)

> swapping the enum here for another const.
> Either is fine by me though.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
