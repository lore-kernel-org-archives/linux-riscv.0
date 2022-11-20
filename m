Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A89C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2+qR4lW81CaQXQhLhj3vKjhaUIrks1Uruwla7q3Aa8=; b=p6e+CHQ5FINqJz
	pcPucPHcsbgB1yK+k+Ztzb/f97HROnJTElM7FnnUZPLhXgd0z4Y3W8yprK7V3+Wnle9vh0wDxie2y
	YMLgLAIw8ZMg4UWlW2r3noViAX5uKDjA4gNaS2B19JjdvI3C6Gg2Ae/beENng7g/NtSrD7k9THNYQ
	9z56eDT1bjIuHAvYiEBkdNkrMj9/oXxiHW514i6HqZU7nkPv8Bsi0yE0saCBfU7SX/BCI2AQW0weg
	xyMfnRD7Z0UIQSXfpWbm/iQ/+vpzV6+YJz2juokRGB7KlgTvrt0q6YUsuEDccIomaAPDT3R6uBxqy
	33AcHOYABd09QKxef3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owoTa-006AFO-Lp; Sun, 20 Nov 2022 17:51:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owoTX-006AEM-TX
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 17:51:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CA4260C91;
	Sun, 20 Nov 2022 17:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF86C433C1;
	Sun, 20 Nov 2022 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668966684;
	bh=79AEpTRKQTWAHAOHI8JWsnFg+OvIT75uE0KkDyA7TBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYJtJIqCGToiTZSAcm3HB63P+y+LabQen90VlfxF9pvHQbbrS//M3+uKXs5PXp64Q
	 FTILDxaIAThcKYLlmFzTdf2nbS5EPWYo5x+Hg460Mvu5nAFOZLfpXXBab8CcbD3eUp
	 647cTkmnfvK1GHRnHqjLHnVICdeYdvaPGHzxaTJGhCe8ZUqSouR4BouRThVaEeeCjX
	 jX/U8rUY9zPz5veeKvH2rt9H0cr3VB9aixE/MWjoTw70uiBop36wp/eY2/tkS43ak/
	 +2WH6GQfTnaYA9tOZCnF+rWETLQa1yQU3n8NYRHEzMrtX7irEMJ4geKyHZcuybyrs3
	 3u4VAA9imcbhw==
Date: Sun, 20 Nov 2022 17:51:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Message-ID: <Y3ppF88SuYAPOjbU@spud>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-6-jszhang@kernel.org>
 <CAJM55Z_f=zp3Z=wno_yr7csAUMQ472RiZXD19CrDTTxmGAmU4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z_f=zp3Z=wno_yr7csAUMQ472RiZXD19CrDTTxmGAmU4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_095128_009586_99F1C77F 
X-CRM114-Status: GOOD (  14.41  )
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

On Sun, Nov 20, 2022 at 03:57:17PM +0100, Emil Renner Berthing wrote:
> On Sun, 20 Nov 2022 at 09:32, Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Add a baisc dtsi for the bouffalolab bl808 SoC.

> > +       xtal: xtal-clk {
> > +               compatible = "fixed-clock";
> > +               clock-frequency = <40000000>;
> 
> This was discussed many times before, but I think the conclusion was
> that the frequency is a property of the crystal on the board, so this
> should be 0 in the SoC dtsi, and then overwritten in the board device
> tree.

Or set nothing in soc.dtsi so that dtbs_check can be used to see if
someone forgot to set a clock for their board?

> > +               clock-output-names = "xtal";
> > +               #clock-cells = <0>;
> > +       };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
