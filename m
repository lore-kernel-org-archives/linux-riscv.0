Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EE7C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GK+wwRyxMxtdJ546KmDUrsznXUoE4FIYK3aeR8hf41k=; b=dcQfCmhntDXWCv
	SbDqOsvn25gSLhgRb43hggNssKGZuzdNG/0WIwhCOOTg6C+frFAWlzSE2u9IRnOHVH4E81LCRoVBY
	3I5d5q7J8/tw+n9yTe84FAY+IEc9cxoyqTevxz1hcrJXJ+PckHtFGAKAUBZrfWme6xuNsPzCVkjru
	Es0j1b5ZJ0W9H1SiMoq8A9+CDvXj7mA5B92Un5aO8dfqKcG/D7EsYFErHLqFiMZ63rzWiqCuqgEH6
	AZPZfunGZnRyw42FQoNhsfKlasQ/uHKLn285gz912+fHIyyrcmiBxswbTXz+OtYqPwoDqAO59xhcB
	l/8/aJT7JAeyxeLw6jMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJd5-003TrV-2u;
	Mon, 17 Jul 2023 08:30:52 +0000
Received: from out-13.mta0.migadu.com ([2001:41d0:1004:224b::d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJcx-003TqG-0I
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:30:50 +0000
Date: Mon, 17 Jul 2023 18:26:12 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689582638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NDupejGpqDico8n1rGJuzDxwPUMrIMMY/ohhGN16//E=;
	b=l2+vsVzqezgTgYlaCX2ktVVIRqDY9iUGEYuUPBAi6cJbRrcqHvdVNNWSj0wizxaX1s1uy4
	hPTk2Jhj++16bPVByIzH7wymnQR63xcA2In1wm+lJwlOvgpdp/p8foiWD9ul8s+Lc1H8UD
	f9IrXIFOQk753PnJLdsMntD8WOEyWrp046XzwKvp6eEEni4lkwHabX1MW8EloqqDFIOTsl
	8EpMTrPn0WZ0SGmjPaeXWZOfETbn/MmJYv4G28qE7+DYv7HB6m1LGnLEvLUvhtRn6DQYDq
	cv/UjLHp8XgHhbtNXJJNK2V0bqXm1uc3FhgL6BUnjIGpkQnOXcHvfrnJo6ZiXQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZLT7JP9gxsiNGpO_@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
 <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
 <ZLQf5AYOCT3EQXyC@titan>
 <9cd339c0-5e96-beba-e567-0a18d11d06b4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cd339c0-5e96-beba-e567-0a18d11d06b4@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_013044_060109_AB4311D8 
X-CRM114-Status: GOOD (  10.75  )
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

On Mon, Jul 17, 2023 at 08:39:52AM +0200, Krzysztof Kozlowski wrote:
> So the others you skipped  Like let's pick this maintainer, but skip the
> others? This is not how does it work. You are expected to CC all
> maintainers (and to clarify the obvious: maintainers, not random
> contributors). Some maintainers explicitly agree to be skipped, but
> where do you see such statement from me?

Apologies, I didn't know you were supposed to CC all maintainers in the list.

> 
> Best regards,
> Krzysztof
> 

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
