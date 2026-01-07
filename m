Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBF8D0D16A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDbqABvolhr5XQ9LmJBdXqTGZWIIw+WxkrzeHumQcac=; b=yPSNqMbCbmxfqy
	39G8KxSWLiF89OzW03r2PHWshKrAIRQnEjk5QkGkUl11zc2R3NTeZNuyxXdneBYtVCYAchAxOpVG6
	SrmSfAdqQ3iq3yWhZlQi7SVD8p5ehiU9CcIZajx6HZFpyGcwYv3hptcwDed3a0c6ykZh4rnEXZY3o
	R1gu8ZKn/C5l9WUuTk8XkeTLLtSOsbc6PZ26/XFW8AnOGnA1EGgLww0oSb0f0ZXCHpesTklLwIFxf
	BKRd1+WOfq30mTEEloSnJP6AFIlvjiYMwid4DeJvuKPapCc5Rxl7WcC7yC5Kv/YWLGXCWweVqo0SK
	uMEyqTDsk/wrJuxxxE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYYr-0000000FUmE-0ZzI;
	Wed, 07 Jan 2026 18:47:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYYn-0000000FUlr-35Ie
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 18:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11A1840DA1;
	Wed,  7 Jan 2026 18:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F672C4CEF1;
	Wed,  7 Jan 2026 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811627;
	bh=4yPG+l5w/j0jWKQpiaGiOl5XoPWy4TQ2jbFaBEAm37g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=byNly+xC4C6f7zXeBIXrz3hqx8lHaCN87ADcjy8AiWMYjewyNxjnpjm3C+suZIbFr
	 ueRaCZHpEgYmZQLk6pzLf/pROq8hXnIdeun2zrvus/JMkexgJGGYJPl4ArKg3NgJRo
	 ftOyrMB3tus/EvxTsYxpCRF6kNtJx7sFdPS4MhiXvX1knFHXWwHGznAIco0MXB1FJg
	 VwASizKEQcE3S3g1QgmUGB7xv9tvFXsjDzyXeBRGYbUT2CAQq+qO35OwNjuhbWecBB
	 zxUU92vuAOS1ziNK22FPDg9+eLGavknPzkbV69ZZh/cyRvN6w7x9O/R8sBBBMCDn2E
	 W0wTSp9oflxLA==
Date: Wed, 7 Jan 2026 11:47:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
    devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: update ratified version of h,
 svinval, svnapot, svpbmt
In-Reply-To: <20260101-prong-carnage-bbb6272e23c1@spud>
Message-ID: <fc4a3b44-3776-68fd-6e1d-876cf319c3eb@kernel.org>
References: <20251225-h-description-v2-1-b0c66080c704@riscstar.com> <20260101-prong-carnage-bbb6272e23c1@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_104709_800610_CA4449EB 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, 1 Jan 2026, Conor Dooley wrote:

> On Thu, Dec 25, 2025 at 02:24:20PM +0800, Guodong Xu wrote:
> > The descriptions for h, svinval, svnapot, and svpbmt extensions currently
> > reference the "20191213 version of the privileged ISA specification".
> > While an Unprivileged ISA document exists with that date, there is no
> > corresponding ratified Privileged ISA specification.
> > 
> > These extensions were ratified in the RISC-V Instruction Set Manual,
> > Volume II: Privileged Architecture, Version 20211203. Update the
> > descriptions to reference the correct specification version.
> > 
> > RISC-V International hosts a website [1] for ratified specifications.
> > Following the "Ratified ISA Specifications", historical versions of
> > Volume II Privileged ISA can be found.
> > 
> > Link: https://riscv.org/specifications/ratified/ [1]
> > Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> 
> I've put this on my dt-fixes branch, but shout Paul if you'd rather this
> went via you.

Am happy to have you taking these!


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
