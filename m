Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E4ECE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXMkjqnx3X/BDj9DzTdC+D+0PC6X294VfPbFmxx4EVE=; b=iEiUQK5H0I6nYu
	yDgwrWSBB8hMyBR0OUa8IjG/v64MTebBQMYERItls8bKamNzRl3W19nFubN44YkmLabyCaj34vGKH
	Z6Bd1zBwwd5q3mTahdMRkMBE9UBhMmdwxap++qJ/e2aXQng6xj77GYM8cruG7ef/qOW10JuiTYkP9
	E52+cJYB9cfsHJX20gGU5dtWRYUfCgQlK4/33ToRQcLMZvq4LXYId4/G3qx2305zhrtm28129cVYg
	YuITOMz747Z3lLEIjMb9bRC1be8y+rXTwFkozdATLX8zJA83kW1YRKiOmnV0IwYEsJk5Y+mWyobKl
	H/0ENe6YHVNlW3jVJ+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74a-0000000GtoG-1GVj;
	Mon, 17 Nov 2025 21:47:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74Z-0000000GtnZ-2cJS
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B220B601B0;
	Mon, 17 Nov 2025 21:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1E4C2BCAF;
	Mon, 17 Nov 2025 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416062;
	bh=5ndR6XtklAQd5zwZuaf8IO799NQGbnQW8NryMjg6xiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+iYu2pJHg4gddFLJ8R5U+xOCIF+vVDqu/gCUsTHJJjEGaIBFsQOZWU04Eh1iFO7f
	 /rxdezrlU2ZwRbiHwH74OxdS87cHecb9478XbjqH8DbUjrsKjOjxcNFBs8AjxakP7w
	 oZhr15NlIL4EtX+wfEpvpjnlZErjCz2F8vKHxI43gkU6fQ6GlNnbZzuiP0gV0AWklk
	 5u642fWeGSMTIAOSYa9Isx9oaz7YReHZw8djwsRk9QjATYTnHFod73VCWE4FhUl5ca
	 OFYn2idBr2H8V6Dd4X4WPfXdMNOtB82qciLlyQjwWhHDnMLg3V05fa/CVcWqiI20uz
	 d4iBUvavDel2w==
Date: Mon, 17 Nov 2025 15:47:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: interrupt-controller: sifive,plic: Add
 pic64gx compatibility
Message-ID: <176341605396.772804.499793532814734535.robh@kernel.org>
References: <20251117-evict-corridor-5efe40101eea@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-evict-corridor-5efe40101eea@spud>
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


On Mon, 17 Nov 2025 15:27:36 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> As mention in sifive,plic-1.0.0.yaml, a specific compatible should be used
> for pic64gx, so here it is.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: linux-kernel@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> 
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
