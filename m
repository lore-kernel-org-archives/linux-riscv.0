Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74695CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvPWvLV/A1iDH9hl5NBuSVIhD2YBkAj7e6aXuIG2kIk=; b=KvsWoCrnXdq1aU
	s/I0Vbqt0dKYojg0YWsp2AtB0yaihnnSkAXjrGRs+ngT3NWkHJEoyud4hKHWBSGPdzKYeomlnqpUN
	S7nJCfKw5FcUExIK+XUTXCKQwTM8mhEH6SAGh1977y/zHXyUSKMz9HzP8/ZemPY102E3UNq82a1Pt
	rB1/O3zDuTB5Td6VLMwYAViRBuHoa1fY8CWc/QBZGF726kGyQAVVCZs4a/Taz2UG709m6zezK7ENf
	rgl9cDz4AP5j2J/VW0Df4lwnsHHXfJczKbvuCZ+v9LXGBYGkKSlgHz7aSjr7eeDZFKOnF26x6QjZf
	WiKSvhWC+YfXtI7ap4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL30u-0000000GXGS-0wKA;
	Mon, 17 Nov 2025 17:27:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL30r-0000000GXG3-2qyq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 17:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53E0F4035B;
	Mon, 17 Nov 2025 17:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9936EC19421;
	Mon, 17 Nov 2025 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763400457;
	bh=iCm9xytzmhMo1N6RgIryyvnjLZcDw4seYMUdhKpnvBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPH3yPqBCFFrJj+DxeIyAcIuKYr7xs6Hhxj/DdNZl2OmCfcOqariBP1zUaBRw3dsA
	 Fj3JccpYehugqYXSMXwbTh0yK14vwWbf3cEJFVyWOmA97VQ+OIHrL8vnoHj+Vh40yh
	 D4wi3bPsL53YblXCOoZ2g6OKctk4BTqtYB629lgu+1z0j6IzSSpei3EedPtFwGJgOZ
	 DoWMHpEeN6Cuq87ouZx1TldUP0yWC8JmEkviCDZdbUYC+7vik8e6PEYRFvu9Ku2cZ8
	 uQw6dSXYwWsyVKCpCQQr+GKQEA3JTygjMTW4DiAcWfhoVS1MqkW6NYaeUIR0N+StrK
	 Z0fUygPce7HtQ==
Date: Mon, 17 Nov 2025 11:27:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>,
	linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <176340045355.193991.3890050582277813670.robh@kernel.org>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092737_736483_D8B94BA6 
X-CRM114-Status: GOOD (  15.30  )
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


On Fri, 14 Nov 2025 11:47:54 +0100, Geert Uytterhoeven wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
>     OF: of_irq_init: children remain, but no parents
>     Kernel panic - not syncing: No interrupt controller found.
> 
> Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> parent") already fixed a first part, by checking for the presence of an
> interrupts-extended property.  Fix the second part by only calling
> of_irq_find_parent() when an interrupts property is present.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
>     controller handling"[1] to relax dependencies,
>   - Drop RFC.
> 
> [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> ---
>  drivers/of/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
