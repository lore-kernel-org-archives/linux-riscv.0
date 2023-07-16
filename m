Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6ACC001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiJghycuVfc/DjuSgxzKkiSBIeNQ1qBFJWlLonqBGd4=; b=YwgWJ1e19Ahcif
	P0V8yJJ6EgmZlmx/L9R5BR+5++FOMItwNFi4KXjgBP106WUcjJgMKWhr9oV/YBt+oBApO6fVRlKrU
	82H4jQ+diheVxq443GmcCcyhGw0cGe2KyoQZA4sBw+t3NkEsEScW6TagAqShlX8jQKshMB/R8ynwm
	TkRhgOUPK22jsN+OcNfbMUhH0OBi4kFrzuxk9ApC9Ehvce3WcPfL7fVhXbRNItkdLOUWE0aSOc+g6
	AXgLSs0XcLq57YJEdaRc9OODMg2QclOCQNxepVoCPTX7MqwKEdi6uZcnMaYeYG+4ppMIhR5ww9HHw
	1jvTJ2rklO8v030ctbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4zx-00D7sS-1I;
	Sun, 16 Jul 2023 16:53:29 +0000
Received: from out-1.mta0.migadu.com ([91.218.175.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4zu-00D7pH-1M
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:53:27 +0000
Date: Mon, 17 Jul 2023 02:52:16 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+YtgaNPWOYdlDhYTcuXDfLI8Vfs9RvLkBhHjx7ZR0I=;
	b=J3czQPr0J+1ggCTd/JkuKmOmpysTMs+wVHzEBurfjx9j7l6KBgQWZhm8D6UwCuVLx3YGas
	Nk/nTvIeG2o8u2wub/+4EyaHF6mK0+yw7LTmCt3zT/YAZ86qoVXRHGsswJqttkB+q27lZe
	h8LU6etbS+MMyT4+qL3Dd/7AHOqw3C3UeywSiOuH/G76gs3hO8AyOIcG0T6lxyEDmpq2Sc
	Ao7E8YbJHFwZA77yFgIi6M6WUa5tijW1poineW4zqi9D/RHrk64TRMznR/JvNyGv/jCEbg
	VW+bIBpLD144h2KBPZCc/oF6JKOQKNj9ITRjmOubuV15xXG1y+wWA2GiATys1Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Message-ID: <ZLQgQAigmhk9uYYd@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_095326_613207_92B93348 
X-CRM114-Status: GOOD (  10.18  )
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

Hello,

On Sun, Jul 16, 2023 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> > +static const struct sun4ican_quirks sun4ican_quirks_d1 = {
> > +	.has_reset = true,
> > +};
> 
> Isn't this the same as previous?

Yes, but I wanted to split up the new quirk in to its own patch. Is
there a better way of doing that?

> 
> Best regards,
> Krzysztof
> 

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
