Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0237F45A12
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fkt4lYEpKy2SGXmV2DjMKlIEssYEyGDrne+LbrLCrqs=; b=usYPiLn7JeY48l
	ZUsNY2NEv1M65bWBkRnJBycAfzw1W62DKrSxqFWpCzjMbPOfBVXxUFGjhI6nM7VJQuppCVLOHTgwY
	jU7Toukc921qin/iCn0N+7a3+eQOtYdfRK6ENsv/li1zEMSBmydL+DyhSN8ZwwYS5wicI3p62WJ8p
	s0nJZ8Tycw93cAEdO/rzuvpHxPSbfkxrkXwYhUTFOi5cXiN6FfFS9+rW/05xsYSMSyfLQux2qzRzo
	AHmzV3SqoMR2XC+899XotOZy0xNss6H5ADTHPN80F/fY/4rNcHAgmZrh3Hdgp1CbxZjohObk0OQZs
	5453hv4NN/J1UDBhMZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNHd-0000000D17u-25mQ;
	Sat, 11 Apr 2026 01:37:13 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBNHb-0000000D17Y-1MZW
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 01:37:12 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fsx9Z37lgz9spW;
	Sat, 11 Apr 2026 03:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775871427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trZBp4xgmrirhAC9tpRHMpVWRzg2rIoavzjXL+J+LzM=;
	b=wzuT0rIL2uFwHD8yWOGa3pC74i7i+kbNV5s14sZ2INtzm+6KEwycNK1rGJcU+b03v899bl
	ssgLjmEbg5PQkUnSQfPFHlzYEZIv8la+9nxriaqZdd3utxAp1MiCH4A7zu9bJX5iG4qwEh
	txKwV9cSlndoqF+4A/KxCdtKpxDXzueGgCD1l7/wKHOS/9O6Lt7zdXhtS1sWbIBy75IoOT
	UkH/YyWnUY/ocbMjOiDvdRwg6q7psNI+NwBNcNIj7vkeddpOFDRrcTCQ18mKR6GGftap0y
	GhEVJkEEhzAhFEc6LMZoDbh86UFrcKq3enpc/5563AGebXc6XwCZumSYhuts+Q==
Mime-Version: 1.0
Date: Sat, 11 Apr 2026 09:36:47 +0800
Message-Id: <DHPXVI2SL3PG.3KBRF3ZWZ2WN0@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Vincent Legoll"
 <legoll@online.fr>, "Gong Shuai" <gsh517025@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal
 sensor
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org>
 <20260410-k1-thermal-v1-1-12c87dd063c3@mailbox.org>
 <20260410-inescapable-glossy-cobra-da4bf4@quoll>
In-Reply-To: <20260410-inescapable-glossy-cobra-da4bf4@quoll>
X-MBO-RS-META: fc4nazxd5bgp5f7c39jn4cxumdou699c
X-MBO-RS-ID: a3eee99e18c1cea89b0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_183711_538186_157AFC85 
X-CRM114-Status: UNSURE (   6.76  )
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

On Fri Apr 10, 2026 at 3:22 PM CST, Krzysztof Kozlowski wrote:
> On Fri, Apr 10, 2026 at 11:31:36AM +0800, Shuwei Wu wrote:
>> Document the SpacemiT K1 Thermal Sensor, which supports
>> monitoring temperatures for five zones: soc, package, gpu, cluster0,
>> and cluster1.
>> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>> Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
>> Tested-by: Gong Shuai <gsh517025@gmail.com>
>
> No, not possible. Otherwise explain me how your device tested a YAML
> file.
>
> Drop all of such tags.
Sorry for the noise. I will drop it.
Thanks for pointing out.
>
> Best regards,
> Krzysztof

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
