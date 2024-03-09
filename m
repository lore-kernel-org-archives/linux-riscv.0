Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18369C5475B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 02:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLjif8YuhED8u/1xgcfepb3y9VhfU93XWLGCyXi4KXo=; b=Wl8nV/N2c8nDD+
	YG3Xk3vOiXJNXflTvbPcYOvXhfFAVIKMyGeOWGyD3/gpfpgW603wDw3NtgG7Cn3N+lYs+UsDJk9xx
	SwLSaLH1kZABPIvLW1ifz3JZRAG/18obKJXP0kOcR0z/VJ5aWkhAN+UopeS4EPB/8UEL7LbW+FntJ
	dZvYsXFNuT/zycSIEzNOutg0FOIAQxCMDy7msOAt1B/sVADptdkSZT7qSCnCEVuB9RxUHmIR3ty8A
	zqHRDDxR9Bxu5LqqLVnkGw7oqzYFU9CIzHY7EnCqIFM39fG/FHLPQPmU9hSh8V8Qlx2xhkf29HO0I
	HdFWPQ4EvVyC9+9CwfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimCC-0000000C6yf-0eG2;
	Sat, 09 Mar 2024 02:12:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimC9-0000000C6qI-3D5R
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 02:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF5D9611B0;
	Sat,  9 Mar 2024 02:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484E1C433C7;
	Sat,  9 Mar 2024 02:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709950331;
	bh=BSB1G8R5O4rAwZZrcEgw7e4XCZZVSBJLhxduFJPG6LM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DggvOQZfoETsx8hzcPslXyXJ88+KLSZ0+AOupGyD/qKlNdYpdoHE8z9ivtnoWcf2R
	 LjZa3/XIfdWty1z/SP4ntgi9MlhjoxVJLX40G2p5qshm/H4f0b6smy6KxXhQT7u1g0
	 mvwaCzoc7jw0S8SfjlveRynfEofyZy98Cwc3wgieDLbZd2BTaL8/H2skR81/kyJIhx
	 oeDmMK+PKZbYd1tGd0tEskJ//Fi/YIWVru96DmVC5dkmzRgSaS4391TkOXRpi1mcgO
	 Wh23eS0faYQgOIqhP+JzX07Y2uvu826w/Y+uUKV6qAUmGKiAaivZr8ZVu1AmSkKeJG
	 Z97FNOTIDIuag==
Message-ID: <d22eb9d0bfbaf12689a2d14d3c50e263.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <92448a1ca9ad8f713dbdbf3453f1a5db0ca47d9b.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com> <92448a1ca9ad8f713dbdbf3453f1a5db0ca47d9b.1708397315.git.unicorn_wang@outlook.com>
Subject: Re: [PATCH v11 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com, inochiama@outlook.com, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com, xiaoguang.xing@sophgo.com
Date: Fri, 08 Mar 2024 18:12:09 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_181217_967707_5DB92C4C 
X-CRM114-Status: UNSURE (   4.50  )
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

Quoting Chen Wang (2024-02-19 19:08:39)
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the pll clocks for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
