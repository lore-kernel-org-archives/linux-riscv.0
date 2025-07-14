Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56DFC83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZcsJRt2u6keGZzgT/oT5IYUlRfpKr75MyzZ1ATbTcQ=; b=JhXxTji7GeN2Ye
	a7uO4GuR/Q6b9GbBn8ugEhW7+B+VsfH6IMQwbVLWdg/TpJNPsvV2SyTAyS7x9fG17gecDyjYd9rB9
	P6qFsTbhHpKQGAQJSsW2uL/46REiHLj5nUCRGZn52b4uUmvb2osUx8yDvwkLQU4DfNbq0y/Qean0K
	UG169LjZhyVvOKPMemmpBWJxB67Tv6xqaNBqVI+yJ2tVBAwETcL3rbBBdGJ6qxJG4KA3gtZrCKqyO
	c9OVy9uk7++zCfhq2fG0a8yBSeFsYyyYP0XzGyKRxMiJRPMtZTz6cP5Elu3bmr185Q63Rm/svKuqB
	T9ms1/1YjSYStVlqZy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDvU-00000001W22-1pnx;
	Mon, 14 Jul 2025 07:48:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDYc-00000001Su9-15iu
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 07:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C05215C4D1D;
	Mon, 14 Jul 2025 07:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13425C4CEED;
	Mon, 14 Jul 2025 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752477901;
	bh=31raCFaPiyp00m3OmWgEiPWHrGfyp5cb3Vqu6ClBwy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLQ0jOfMS16iIpKY3iy/6tIxYMplbIH1puaye44hDB8n37iovnzkVEn/MTuohsSyy
	 vXI7urple0C8RgdJFmA3+VG3ZHZJILNoxO4WMxmMNo2Gt8CP5VWISCxG7ePj58U/WX
	 brlPq2X52GlXcMGzKcmNcLr05wG56OKb9z1T82a8SZtrcGL7T86zlst+l6oIhXChp9
	 ebCCjZDtT5BU41T4SCrnUvxZHGA0xq8qE8U2LQwM/8QZnLZ+n14dayDn35wjwDjYHr
	 Ly+qwO7mQKLHP67tYRO+ttq+0CfWsQop0brLNXXwKZR8zaUR9xT5Cjx1M3324oEdRm
	 +dHh/dMZAauYA==
Date: Mon, 14 Jul 2025 09:24:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: mti,gcru
Message-ID: <20250714-wooden-ebony-turaco-a0accf@krzk-bin>
References: <20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com>
 <20250711-riscv-time-mmio-v5-1-9ed1f825ad5e@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-riscv-time-mmio-v5-1-9ed1f825ad5e@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_002502_339968_4DBCD67A 
X-CRM114-Status: UNSURE (   7.95  )
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

On Fri, Jul 11, 2025 at 11:56:45PM +0200, Aleksa Paunovic wrote:
> +$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GCR.U timer device for RISC-V platforms
> +
> +maintainers:
> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +
> +description:
> +  The GCR.U memory region contains memory mapped shadow copies of
> +  mtime and hrtime Global Configuration Registers,
> +  which software can choose to make accessible from user mode.
> +
> +properties:
> +  compatible:
> +    const: mti,gcru

Is this architecture? vendor prefix suggests not. So is this for SoC?
Then why there are no SoC compatibles here instead?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
