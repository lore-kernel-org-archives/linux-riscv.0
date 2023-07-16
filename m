Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66296EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjR5LfLVkc9zSFcDFE1O9woxxR+PczhYUeEbzjfRWi8=; b=ukGyXire5OmA7n
	FaYxxvuW+OSaDMRMtjd9lTsIuAAqS5GjA0zTEl3tHnQ1ekWwcj4ScSvj8GdTz5wyC8f5ZhVzswAHY
	cVPtZI0gH+GxsbAiK74jDeJ4VBzDC4irMOXhIqniGsjyPseKUaC+U7CbYDlERHMB1xV5gDhR62T2/
	OSP2weDOMRD2PBDmSBtJ2zOb2ma2wRhsKN3Zps4aMJ07O5Ut2aTuxfCPxYm7465XaZoUz7LxGvX3x
	sfyHae5Iv9/SF8GdtUmG/jFpkrRehKWJtrMcxqtN21rHHzHme9m8hjdWJPgPdLp2EI5xNw9efzjX0
	v/ykFattNGRlbc2osX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL50C-00D82B-1H;
	Sun, 16 Jul 2023 16:53:44 +0000
Received: from out-36.mta1.migadu.com ([95.215.58.36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL509-00D7z7-1j
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:53:43 +0000
Date: Mon, 17 Jul 2023 02:52:54 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdPWSeimVxVz91xQpsqP4Z46tm2ZX8etDGiqC5eAjnY=;
	b=yiYIdBSpp3Qlc5Nvg8wlFK23YkICxlgjlCAvrd8CIgCqv6CfsXiwb3hjS5aITUSvSCP+t3
	dYOjilmV/3oCefCfMuCmDtkgINtnZ2uzOKaeixeM5GHFDDf8X+j6OqmED1P6L2LTwp5rJo
	Mp8cdvHwhcxzZDZ13AZtKaNLisy/CTeM45sR1j1XlzTN+bdbXllMC1ksVda53ykY/aDZGN
	Www0zvg7+ihmzePP9aGKrqkJkQ/IHRDc6o5JfaihmKDQmNBuVF3SlQIrPF1HjiLGBzm0FE
	gZpGnlDhX7rJRISWrshJSZgx/0R40tdB6bm0UZA1I4kyeZmjHHplBwSaF61xBw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/4] can: sun4i_can: Correctly set acceptance registers
 on the D1
Message-ID: <ZLQgZvipHOFTlnnO@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-5-contact@jookia.org>
 <4844353.31r3eYUQgx@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4844353.31r3eYUQgx@jernej-laptop>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_095341_770870_1F1275BD 
X-CRM114-Status: UNSURE (   6.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDY6NDU6MjVQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2hvdWxkIHByZWNlZGUgcGF0Y2ggMywgc28gaW4gbmV4dCBw
YXRjaCB5b3UgYWRkIGZ1bGwgRDEgc3VwcG9ydC4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVq
CgpUaGF0IG1ha2VzIHNlbnNlLCB0aGFuayB5b3UuIFdpbGwgY2hhbmdlIGluIHYyLgoKSm9obi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
