Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D9FD116E1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuXJsdpBcPFTYBMEuge93T+Mjrk8MoanLBZUMWPHrrc=; b=xXO2smvuCYuYxO
	7oYHIsOnC6qVjE2mkYhG2VEO1gy/SOebX0g2Cx+3tid8YVgW6xDtYPmYPM3wdKfJV4mlg/b4cWkvY
	+TRi+8oduzU8k80u9fFwQMjNHq3nPC8VZTZo82up8NX1+eKtbEnasZHtovVSNVE9K1SEuQQBilrqv
	QerTOyOPBVLfZdK+Djghr2wIWkS7p60nFjJOzqboR0UHgdgeC3pVGEtVu9wK1BU7XLnhRXEUpl60y
	MEmieoLeRelWU5hQYA2FlvsoOdInGUb+Ypi/jgF6g5igZKQZ46rjMtRzuueMZgaa7KD3q58k63R8T
	AgmLaAXK/s2yI5DvYdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AHW-00000002IjD-20x8;
	Fri, 25 Oct 2024 02:42:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AHT-00000002Iin-3ctR
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 02:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F59A5C4CF1;
	Fri, 25 Oct 2024 02:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CF7C4CEC7;
	Fri, 25 Oct 2024 02:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729824146;
	bh=/uO3XLumgeX4Ph/V2YT6ZoQW03XGQDlCzb6y7cZGGt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyEkNrzUQxaBDp+HDDi3qDUQb60QZMJBaIlGj0VfuwvKuC2hy0PPYVdFsjeMVnpe4
	 +ro3QKw3FwAhSqfOb9gmwkyaEUTvjlLsxFnncZp/f04WIoCdZD3s5PmFLTs70wr8XG
	 T+mpnMFEc7cEIdNDU+tyS/h2LTabpcfMXVMFyeXoU9hr+6bGeY0DIPy/enwe4WuG/b
	 6Q34o7vEJcNZLlaCE7uMu+9zEADY/8YeW11/Nd5Fb3GX2c6opLs6CrkS7fGkM52ZDG
	 5HXtmBJh3HtGMpjTbILLu5uz+VfKF1XUqMqMbMG+J/IFQme4Htuot+yUtItgwJqDJ3
	 NMb1wNwZAA1rw==
Date: Thu, 24 Oct 2024 19:42:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <20241025024224.GC1781@sol.localdomain>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-pungent-lasso-42dd3512a3c8@spud>
 <20241025022411.GB1781@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025022411.GB1781@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_194227_965715_A4C071E0 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, Oct 24, 2024 at 07:24:11PM -0700, Eric Biggers wrote:
> On Thu, Oct 24, 2024 at 01:34:33PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Section 35.2. Extensions Overview of [1] says:
> > | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
> > | Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
> > | All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
> > | Vector Extension
> > 
> > Apply these rules in the binding, so that invalid combinations can be
> > avoided.
> 
> It looks like that part of the spec is wrong, though.  The Zvknhb and Zvbc are
> correct, but the list of the composite extensions that at least one of them is
> included in is: Zvkn, Zvknc, Zvkng, Zvksc.
> 

I am attempting to fix this in
https://github.com/riscv/riscv-isa-manual/pull/1697

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
