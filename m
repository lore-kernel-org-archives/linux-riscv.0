Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91F7C2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRpK6fPm4eFRqQhHesGcDIa3mxT+oKaXvMCI+cgtyLQ=; b=INu5byakwBmLK2
	1as8OSOu1Jz9FN2X29CNmeqxNpEAIUjbZoucT3nNUG1WxImtXEEXgcwc0B4Ytl8ARSUcmWGMcZRTP
	B3GTXh6p0SLmYJOznvvJczQFGxj84xYofgYBXBGVpbNOqP/9GmFGC6h3iSI//teUAH8mliMvD2Axv
	a/30C1NGdrBbnUvaOMQCAzhBjti85sQgpGVl4qqt1U9jB9Ui19MhZcRRlxZQIplZEt3+xluZosCbo
	vnttTT31rgIqnDw3i1BlqsCFHUEYHrpnfeu+3BqrmqcUO4qS/FcB3wnu0pvAoS8p5UX0JOVntr83M
	cGCeqahAN6PUEozgddtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqDO-00000000YiJ-06XP;
	Mon, 24 Jun 2024 20:23:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqDL-00000000Yhm-1cLa
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 20:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D97C1CE059C;
	Mon, 24 Jun 2024 20:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2038C2BBFC;
	Mon, 24 Jun 2024 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719260575;
	bh=A/zQRlEpO+0XlJNbjsusRjw/4ZyJOMZILl5/J9OwYc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddr2JY4WUSLLjAikiqIr/HMXtEVJZMG3qGxeC3ee7PxQULHLxNtsQio6ov3/BrZqP
	 zlo+W8k0eMJlrUyADp/oypITQhZS5+JGMRdkFvbXeP8/PFa9C1XIP602UHcJcy637r
	 BJ82w+ofKD/S7XJZfSdR5V2C3SRu5lzboedq0dtNTrTQYu4E3wwKq8B8mhOntnZgOt
	 GKDS2Yq2hXlQGVkTG59sK7LrskGO07aqCWZmV71hZZlch6nWir6vpWouILWCsEON6x
	 oeAupQ6230Wivh+K4xqcXvKe7C+14OCd7ExcPrkG/cK80XxllEay2camk+CiMao6vo
	 8BPrBumu5dnRQ==
Date: Mon, 24 Jun 2024 14:22:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kanakshilledar111@protonmail.com,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RESEND v4 1/2] dt-bindings: interrupt-controller:
 riscv,cpu-intc: convert to dtschema
Message-ID: <171926057171.343236.712031903649658549.robh@kernel.org>
References: <20240615021507.122035-1-kanakshilledar@gmail.com>
 <20240615021507.122035-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615021507.122035-2-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_132259_624609_3C8323F1 
X-CRM114-Status: GOOD (  12.14  )
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


On Sat, 15 Jun 2024 07:45:03 +0530, Kanak Shilledar wrote:
> Convert the RISC-V Hart-Level Interrupt Controller (HLIC) to newer
> DT schema, Created DT schema based on the .txt file which had
> `compatible`, `#interrupt-cells` and `interrupt-controller` as
> required properties.
> Changes made with respect to original file:
> - Changed the example to just use interrupt-controller instead of
> using the whole cpu block
> - Changed the example compatible string.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
> Changes in v4:
> - Change DCO email to @gmail.com
> Changes in v3:
> - Remove reference to `interrupt-controller` in `riscv/cpus.yaml`.
> Changes in v2:
> - Update the maintainers list.
> - Add reference to `interrupt-controller` in `riscv/cpus.yaml`.
> - Update compatible property with the reference in `cpus.yaml`.
> - Include description for '#interrupt-cells' property.
> - Change '#interrupt-cells' property to have `const: 1` as per the
> text binding.
> - Fixed the warning thrown by `/renesas/r9a07g043f01-smarc.dtb`.
> ---
>  .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
>  .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
