Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045BEE6F061
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofCmIRZ+TA/nopOb3DjV9yg+eRsLZLEjTgsvaEqVBLM=; b=jt+hQYD9+i/4Cm
	dhjSH0WSkej26jPo0yDKFVkUi/JraZlfh+PgXxhHSUTHu5/cOQDJS2OU3yKxDh5x+Yrnf/1wtm7G2
	ize4sFts9EBA3HvPP617taxg64k4Yy35KqkFDI6fMRlFzEYV8N+mvhBl7YpILHnWu3dcqySZ3drhU
	zz+AUwWET4NTFpJt3E0s38nTZAn3P/3sMeg7wx6dO11xsG1D7Eh4mKu9r7S7a92GfMaC1MWi60Di4
	cP3x3z+Wbak3Pb2+fZr4QNsuMcq/zoXlwWLaMaCHXFsCYAUibs587ibn3N4H5/cQZUShY+5ge5fBU
	xTLMoPqPj5F/KPv0TiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sYP-00000007Jzx-2bHD;
	Fri, 01 Nov 2024 14:23:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s9a-00000007Fqv-3VMp
	for linux-riscv@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E1he7ba2Vhgyp6JPor8Bes6TfY75khbCKJer6j+Jpa0=; b=pNa9llNKQBah48Kmt74ueppj4c
	KS8YZ22lsvAyNV+STNRhUuLWGSUNP/HxbcN/cXIMwNQl0KNK0kXCkCXpTGqsBlwwLxrrpLJQTEMjU
	6j4DA35jxAIROe3b6BGdJicbHy6v3b2DqAYDdZkrXveXVsPf6wzoTfQ81wiaVTfpaLFXEgKpwOq1b
	7xmJ3fbkHHVBPaCQtVL4IELStAfW4aYa9cqYLqQpsQLnj6xsXj5ZtBw0tiCob4Va8CR+T6h3gNSmV
	X3pgQ8nClaLQmexPal/OUH3mgVQvjwrXPScuknf1Pm22q3xbPYTxdNXXMWL2HOggWtGxizFrli2NC
	L8dEkA8A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s9X-0000000Aj9S-3YjO
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 13:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7A8F5C8A13;
	Thu, 31 Oct 2024 07:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF5EC4CED0;
	Thu, 31 Oct 2024 08:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730361639;
	bh=/lcem0/na5hpUEq0FSk7UNYC0n854xl8K8X1eIkKK0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABuOf0UU2rrlUl5SunupXLXdIHGcTmiKNXrcQOSjBgQJpYBZW9gpdUOF8AQvG3mXT
	 V7f86biGefFlMZu7uCyH8h/+6AYIsU5Vx7ZF7VBeHikrTiWFtn3AZWQ69xAHaEPdRV
	 KC6qTWjqTB3S8jvoUnZVyqN83FFF5fQk2dE2HI1EBk5tibzVOsWNUbAqP4bJNqV2q+
	 eqB9JXQkpDMcp8bAGDYecefYD5oAY/p3FLm7WMAcy4XaRjIDURXM2m0WMnv1f3wRJc
	 ZpeNn/9wq0kGVl94H3AR6wBPq1fvagWLlScEnjeDzSVemzUUDGXIIObc+P/LZO/GUq
	 jjmKxuUwnC6WA==
Date: Thu, 31 Oct 2024 09:00:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135728_102412_B890EAF1 
X-CRM114-Status: GOOD (  14.47  )
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

On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
> > On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> >> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> >> and supports FIFO transmission.
> >>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> ---
> > 
> > Where is the changelog? Nothing here, nothing in cover letter.
> > 
> > I asked for several changes, so now I don't know if you implemented
> > them.
> 
> I deleted the FIFO property because I believe your suggestion is correct.
> this should be decided by the driver, even though the FIFO is provided
> by the hardware.
> 
> Apologies for missing the changelog. To correct this, should I send a v3 
> version with the changelog or resend v2?

Reply now with changelog. Your binding has some other unrelated and
incorrect changes, which I do not understand.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
