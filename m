Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42AFC7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 05:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiM0K9TSQfgnTtOe3U52Tgf/qjS4aPzJUPsAH5gCtAQ=; b=ZbAPfGz/vw+mgu
	3MSatIV0JzvBA2lHwZ9q4RmgsxdpbUwcpJzaeion3brcvzFornx8dsGd0qk3DK2SErAsibDeb//tL
	kjUKhyhOz/4SGRpKIzrMN2YF7VszQ17dPyow1t9jyxyF6Pap3PxwbXK0piNty5pSnJvQ06WWWTM/w
	X9/Ycwuy2RAfSnGuzUnqtB8dkBcgbV7YFHa9KmptEjdrPmjUCEAHwBxxehO39FTFJ2rv2KAjsbhUK
	xwT6FMNfGpfpPHf0zTihjT1FUk15stySS9FhqGtKnR33qsFcfhl/s9ZP3AnhUbF3Cf70028vd+LpX
	T5RG9MFvPxBpZ1ajhmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl1Qf-00Bn8J-0e;
	Sat, 08 Apr 2023 05:48:01 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pl1Qd-00Bn87-2S;
	Sat, 08 Apr 2023 05:47:59 +0000
Date: Fri, 7 Apr 2023 22:47:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Convert SiFive drivers from SOC_FOO dependencies
 to ARCH_FOO
Message-ID: <ZDEAD5aWhvMxAj8F@infradead.org>
References: <20230406-undertake-stowing-50f45b90413a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406-undertake-stowing-50f45b90413a@spud>
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

On Thu, Apr 06, 2023 at 09:57:46PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISC-V's SOC_FOO symbols for micro-archs are going away, and being
> replaced with the more common ARCH_FOO pattern that is used by other
> archs (and by vendors with a history outside of RISC-V).

And this is still the wrong way around.  This ARCH_ madness must not
spread.  NAK.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
