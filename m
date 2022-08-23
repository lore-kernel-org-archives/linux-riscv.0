Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4638C32772
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcTTMFNAlRXXey4TbkC1ei+0T62PAZ73qqO0d7g6nR4=; b=40S/78ye3bbU+3
	jBUhrWtHeYALJOOgYb/ZB5sqO9PeDemzBL1bk/xJGBaqccfYgGiMJ7H5iM/+aF56tAfnj3AQkQSTw
	U3pNNj4beqyz/Ju4QajcKUzcuGaZZ5F8sNIOdE8goY87DGRGKjr+8VhraEcI8Oh6VZ3zEU/CIKO8d
	Nctx0vKoy73sM19Zt/7TA8s1ngKfRyA5jG8ahSyJ0D8D7pDLbYSpnGSkSZaBzN2mMFK9ulIeyOgsY
	7ERq+209nyH2E6NKF0zEWoSNSYIAud0nS0mOOaMpxQT6oJQNh3QwaTwsndSt4DYaaSiNj8gJxSUmm
	y/j9WS+YYxfbjmcolnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaLw-008ftN-Hu; Tue, 23 Aug 2022 20:18:24 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaLs-008frc-Si
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 20:18:23 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0FD7C1C0004;
	Tue, 23 Aug 2022 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661285894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9B6+j9Wpz4wITokgTDAciVB/+GFTYbq7sWjUZXhdEg8=;
	b=Bh00Bo+4ByR1y/WESK50MpFfoZtFJnsud2qe/taHGiSqf0taEj3K0LIgtmlWIF8oSeXYkh
	p89MA5Ueie09sDmz+2MOEkkvqrfvZqJylc6gM/YkaypB5hoNaI8C5lB2A61pZBin2oMu/D
	bgn/OYzfS8IShO8JZ9Vi+8xEr0wPaLGF0RXT6o8mY2TLifiDFKbVh81IIWFg6E2xox0b+X
	I4eNhXXV00pM04KewBZLX6q5dMFpWlyh1R+5y+TgZcpwAIh8Hceh6TLlSoXTLq4+S+O4Dv
	12RbDAD7O60cl6R4QH73bu7Sq47qHsJWxq9mJVmGmXhmCYeIvfIoTzwSiE2fsw==
Date: Tue, 23 Aug 2022 22:18:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	a.zummo@towertech.it, geert+renesas@glider.be
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] rtc: mpfs: Remove printing of stray CR
Message-ID: <166128585619.2840885.5274671308579243646.b4-ty@bootlin.com>
References: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_131821_337681_55144A85 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, 16 Aug 2022 16:18:25 +0200, Geert Uytterhoeven wrote:
> During boot, the driver prints out a stray carriage return character.
> Remove it, together with the preceding space character.
> 
> While at it, change prescaler to "unsigned long", as returned by
> clk_get_rate(), to avoid truncating very large clock rates, and update
> the format specifiers.
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: Remove printing of stray CR
      commit: 07ae9278b423500f93e10869b1a50276d82050ec

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
