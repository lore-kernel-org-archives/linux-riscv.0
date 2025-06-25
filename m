Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20EEC7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+A8C1DvYBGK7wrIaO4Fve1W2CsC/SG0SzNJqyr03YlY=; b=vHyun9j9V2V6zM
	w2jzvWq52OqrXvbR8S3HPJyLpOPXARKyAtidaY7VykFBtVCJ8qzIvPuwycTJfNFSckIlo/jeRtSAo
	lcbvv1WWCLWsiNu/6XbyQWFZN4cbiUEuoFeqQyw0/F5aBprFXp5FOLExm0JQq57QP6nzGy9a3Q2W9
	/xsbrjgE4sxNISsB1imjWCBGKXDvPkhFjJ12hAoJKZMTWG6y0JI6VY2Y4JVENg3TMYlcQdTGMLM6/
	LXaIA7dEiHJp50Wr3WGrYtoeXmdew3BP5YsFB5UP2jRZkPUHWGQj4MBBQZzIfvNDrvq43Ndr80dA/
	yNntc4T/a/QtEjvtikCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWq1-00000009rc4-3Aw1;
	Wed, 25 Jun 2025 20:35:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUyb-00000009ciW-1Omz
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Jun 2025 18:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rn+b59/Gm4SJ2kcrqSbPbMkO1yDeshXU9PcJiU+UZ3E=; b=kYFtUMYE/wnUf96S9YREsE+ZhE
	hQtXbkJFYd/c+VwDCgKuDb2zVXl+QoBreSDXpwJ8eS83P/VGKzObDIbAl6l5LCnAmV8GPW9PSk3ib
	mFRsGnCoyz+oCQD7kIj1+WsgRWQauNK8DUP1gOE6pfKh5w+MlhndwIE+5A/q73xRT7NM6eNc/kAs6
	Wl6NjzRA2kI16SMEmi1+o0h3Anw1g0cwui7XGKiQYKVFP++pV4J1knRM0hw5J2bqZ1MfVx6sPn/d+
	8cazVwqwUbz8OeBRRGmzbFTnNp3OaxF7pw4zE9/fcbC6bd5j4DC6+CGKQIuj/hP51aRXUTIA/r1fp
	ipPesGOA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUyY-00000005vNI-1oMf
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 18:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFF05A5213F;
	Wed, 25 Jun 2025 18:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522FBC4CEF0;
	Wed, 25 Jun 2025 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876558;
	bh=rNYUfS+QC6CJz32WWVNOnG+NFAUPmM8wTr2iF+yy6i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ijdc8opzcaW6MuLyFnJUXGU1CZ8ABOCxbuSE1BtuDANMj48/SGChoOa92abfv1XIl
	 qpZ7Eik37hF1LDo+2oq16TgoTRuffYQEJv5dNinJDTv0KjlynhGBlUfSuqBfcYJBxS
	 lPZou+m+ADZbe/4SRat7B5eslYfTPKi+cG9iqYln3hpSJfKN/Xodl1GCNXHw+FVMca
	 1uNRnYq3Jr/SIrOVVkdIr76t8VaP2vpk0oAX71sb/gnH8cLFLaJiUj+V1PIwN3Nrij
	 PY/6j1sDx652jPiz36ANOKSrHBQhpZDbBVQ49L1nhVRLauVFBO5Qs8bW9uoCCVocg4
	 PlOEm7rFGF8ug==
Date: Wed, 25 Jun 2025 13:35:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: serial: 8250: allow clock 'uartclk' and
 'reg' for nxp,lpc1850-uart
Message-ID: <175087655526.1993020.9662520639460479640.robh@kernel.org>
References: <20250602142745.942568-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602142745.942568-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193602_733163_F5B0A006 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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


On Mon, 02 Jun 2025 10:27:45 -0400, Frank Li wrote:
> Allow clock 'uartclk' and 'reg' for nxp,lpc1850-uart to align existed
> driver and dts. It is really old platform. Keep the same restriction for
> others.
> 
> Allow dmas and dma-names property, which allow maxItems 4 because very old
> platform (arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi) use duplicate "tx", "rx",
> "tx", "rx" as dma-names.
> 
> Fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: serial@40081000 (nxp,lpc1850-uart): clock-names: ['uartclk', 'reg'] is too long
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 41 +++++++++++++++++--
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
