Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889ECC83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtDTkNKisA8AUe1VMT9tpNwv7UNdkAzuPY82RLWkLHQ=; b=qJ1BF7jiGsCOw0
	GqSbEKmnXWLOIs5tt1Y409uO1ceLnHohkFn1FHYgc3JkMu9xg8jDp3QQwfvd0GgVjV4anr4/e+IJM
	tvIPQ6cBoZ6Ssl8FhmYdY8gFW41U/3GCwn5Xq/gB54kokTHX01IA2KVboGzMr1d7dtovl1DKSCa6M
	87e9GEwFcrBUBefhf+Ch7wnGM4xXEzh613V9Bo5ztxDCXvaU1WMGLjj+TKldsd2M4kWzUPzdXYAH1
	cGVXBfxJMdzWuZCic7x1Z2zJ2i8jYqAitHgPyQgbIfref749B29HPMbKtDyhNQLa4NKivchjlRX+V
	t5+X7WhvIQufJcwYFt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBtq-000000064wt-0G6N;
	Tue, 08 Jul 2025 17:14:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBMZ-00000005zp3-0sF9;
	Tue, 08 Jul 2025 16:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dWz3CQl3Hyfv4Ozhor8+07wg6X7dBTPFYEAyJfxYObQ=; b=W5tDj252G837QmC8BdmftZjzei
	j2OFy2XAgMpSVYiMTPnWSatB5hUYTehmfiGGEpsCcr0WOrKzkSfIw9/+JS4X7ltAaDxvMSnos0+vl
	Mhm1vNbSwFDbffuN/sYNjoUnDFSxjeP0tQuFf+/lh3CaVHB+B0IxkP1g8eGkOdhQaOe4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZBMA-000qSM-HV; Tue, 08 Jul 2025 18:39:46 +0200
Date: Tue, 8 Jul 2025 18:39:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <b3c18067-f06e-4818-bf0b-e33fdf27b174@lunn.ch>
References: <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-4-lukas.schmid@netcube.li>
 <20250708002205.70ec9097@minigeek.lan>
 <3700020.R56niFO833@lukas-hpz440workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3700020.R56niFO833@lukas-hpz440workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_094011_245695_CCCF43F9 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Jul 08, 2025 at 05:19:31PM +0200, Lukas Schmid wrote:
> On Dienstag, 8. Juli 2025 01:22:05 CEST Andre Przywara wrote:
> > On Mon,  7 Jul 2025 20:44:15 +0200
> > Lukas Schmid <lukas.schmid@netcube.li> wrote:
> > 
> Hi Andre,
> 
> > Hi Lukas,
> > 
> > please try to refrain from sending subsequent patches too quickly, that
> > might just put off and confuse reviewers. To acknowledge a change
> > request, it is probably sufficient to just reply to the mail with a
> > confirmation.
> 
> Sorry about that. I'm still trying to get the hang of this whole "submitting 
> patches" thing. What is a good time/reason to send the next revision/version 
> of a patchset?

It varies per subsystem. For netdev there is a clear rule to wait 24
hours. For other subsystems, it might not be documented. GregKH used
to say he would always respond within 2 weeks for USB patches. To some
extent, you just need to see how fast each Maintainer works, and
resubmit based on that.

Also, if there is a discussion going on, you need to wait for that
discussion to come to some sort of conclusion before reposting a new
version.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
