Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14957C87FC5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4BRXQXlG+0+CQZrT8k36pfeRjEFGOg39vf/M+0SjcI=; b=naeEo/iGLAdPy1
	5aZXdA+4/CR9+WZQ10pxHQbyMfVt4JNEA3IxExegDwysBaRXMSJXahXUHZMZD3bTmjahlvG6Q7KQi
	gXoY1UBUhw+9ptEnEfL25yLcBrMhVzp3l+HQDaesYl+1Pv+DHECQ6/XvrVczePUHrFtlGrbPJLm20
	mWDZp/6w1mHheDfHhSS4GZv7byyBSIDkaGjCDQAdt7Zp4TIRlK9HpVLjNMxwa8v3V3QF5MI+g0fzn
	6C2v0onjiUOLc3Ue9hDdt9qZVdfDDfeAYwVOdmr3oFGXuX+VMN20WYWZfJc83Evs1wMpgnkQKEEEA
	P1Pr+Yny3ToG8vr9Hwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7TM-00000001f4l-3CJ4;
	Tue, 22 Jul 2025 07:31:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Qr-00000001eHo-0lxD
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60836600AD;
	Tue, 22 Jul 2025 07:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FBBC4CEF4;
	Tue, 22 Jul 2025 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169340;
	bh=DuHZ7czdryVEz7C9CcRR7EyNqzZMMuJFxmfzQEZzp7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRfa5n5TNwEg+TnfggjHWux6R/kw/kHjtCirmgr/apR87i24zYilcVME9gQ7t9KJu
	 ef64v385Z4Yv3Wbzpu2TjYoXvPvk2ZlAu5xveBbAkplyAnbN0fs0MfLzZ6mr/vI83c
	 eWad2kBy5zfz5VKym+OEom09eKkeFB7EIWxf3wcyHIqOISY1OvoXUbA7+I2o/ySkJy
	 XFdGHaTQULboEiB7Hk+6f0+k4EwHMfZ9pTnSZ5dMeVD0Hw5f+sTacehfFgX/s4tBwE
	 R84oZG49U9XVMxCIHje42tGc6BcFph3sOF4BTOeODwkXgYjieUr/SZ+6ITz6IiMYgH
	 m/HiBFbQGxYOg==
Date: Tue, 22 Jul 2025 09:28:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 03/10] dt-bindings: riscv: Add Anlogic DR1V90
Message-ID: <20250722-hungry-kind-horse-ead44e@kuoka>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-3-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-3-5740c5199c47@pigmoral.tech>
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

On Mon, Jul 21, 2025 at 11:46:09PM +0800, Junhui Liu wrote:
> Add Anlogic DR1V90 FPSoC, which is used by the Milianke MLKPAI-FS01
> board.

Here you describe the hardware with more details.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
