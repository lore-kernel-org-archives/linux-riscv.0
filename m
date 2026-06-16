Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ECBCD98EC
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wyMx/ViSxo2NuTrk0tteG8yvqqf4g4WFP5YmAPzgt4=; b=HlFo4KmomE8My4
	uVpTu7PMv1RWyNZheYQYo8+BIXuTAw/hMOP2yH/OMaiGAMNbPcguDtgFtNa5v2/ear67TCFmcV711
	h1cANZG9vrhQYyGl39qe7XvvoP+WG4h5WzdxFwQIzQE+UOAHykqmqAbrm4uzk7DgFkXXYoz60D9ze
	Ca3qTjVNsjRAhQl/fdc1qyMwfPYghIY9WelpxH+cerD7rq+B32XkjdPYY6c5dhJx/YFMyV0JbF4zI
	J3NYRywc4jmb8ZDvgiFXFqvDISeCo0ER0bkin9Q/7BVOlqgUL2oEc0aRKKtvTYFJeO6MIChwre1dp
	XdFeHb+xvzYXVSva0zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZd30-0000000GOyh-1Od8;
	Tue, 16 Jun 2026 23:18:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZd2y-0000000GOyb-1aug
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 23:18:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 727FD600AA;
	Tue, 16 Jun 2026 23:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B891F000E9;
	Tue, 16 Jun 2026 23:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781651899;
	bh=2uIFQDYqrhlKjWeD5rf3vmj7TAhAKI5XKv0WTBppYP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jg90PenM5pUumMc46VrLSFfmUZuMbDFODJ1X4JRsLtHFI7Hmi+E7Ic9TDdwzUgh1y
	 vH86LdSwTAdwX1wnN6o8aGhMD8OhleGjjS3h7YLurkFSWHTXXQ9+ORhb3YuxLI/Yo+
	 KuV+Gj7s1qDsNZsCXyTkBl/k4G8N2XYChgMaZNDolLehbWJdGsDKS4Z9yzjwLLuvmB
	 6xOTs+vwrwZUebG1UzLLxeSQOJbqp9kkFHLmIRaH15Jf/2YcuDGM7Ukmk9fIAC7/S2
	 Qi5t6VE/5/pgu+dmg9m27l9c6wcAt0llMnrWHmJJ6mPwB0Kp8SHuyw7vjsAOASCqOu
	 ZbyDw5xAYhr8w==
Date: Wed, 17 Jun 2026 01:18:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 0/2] i2c: spacemit: improve clock handling and cleanups
Message-ID: <ajHZlsTAp3bWRF1V@zenone.zhora.eu>
References: <20260508-k1-i2c-ilcr-v7-0-8c2dde5c3ed5@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508-k1-i2c-ilcr-v7-0-8c2dde5c3ed5@linux.spacemit.com>
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

Hi Troy,

> Troy Mitchell (2):
>       i2c: spacemit: configure ILCR/IWCR for accurate SCL frequency
>       i2c: spacemit: drop warning when clock-frequency property is absent

Sorry for the big delay, merged to i2c/i2c-for-7.2.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
