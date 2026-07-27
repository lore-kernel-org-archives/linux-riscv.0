Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59233C531FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btniXtePx/GiT3EkHUr4lYvIHsPmbofyE4u+ZsNG3bk=; b=Km7dqbT8CzIrQv
	wlF8PW/TdFJ5r/jRfBTcY0F0Qt2unyhbQaUeOKK3Ae9EQAr0Ih86djYpdEGyucf/LojXYypxHmfFw
	+pmeyFvBcnuaIWnXk4O6/C/mR3FNQF0W5iudTD/ROOqWvAyHy9f2USsXhoPOWZ4PIJwfFCXftH1JM
	DP9Tp8iaOACpGcKOEVre1rgqcSgjCqdPat9cZiMnKgiNF8jezfskiGStkJwOPAauUfBltPx1Q2Hcd
	QUTw89ZErn/uEP9jpOureNyh4cvn4N+61n2NRnnh6dhEsR8XvvRPCrInUYuq2ZNV3+4aOMSYmBN72
	JJbZZ1an2HhW0jb4Vj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFjW-000000027KR-1E2V;
	Mon, 27 Jul 2026 07:26:42 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFjT-000000027JL-1bME
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 07:26:40 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmJ8uGmDc0hqwz3dbUX6RW8a5ofURnJwzsVN39eibdM=;
	b=To1h0LPGWVHT/8VQA8oTLB+BbCw2hm9pD82X8CxV1puWY/GYeNwhPv9NBXOvSyjgPNlvcr
	ou9uK0WGT+tiVM9nOTEfuw69UitfFjB50ncPBaNf2MIwXe/bYRuQ31dRkXP9CKQQPd97HU
	qJHuPjMtDX74mnUjSu4Q4n1ROcbQ0Gk=
Date: Mon, 27 Jul 2026 00:26:29 -0700
Message-Id: <DK96BJJI4EKH.3FO6NPOTYTY0V@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <20260721-handbook-dancing-0c6805fbc94e@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
	<20260721-handbook-dancing-0c6805fbc94e@spud>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_002639_557615_C02AE8EB 
X-CRM114-Status: UNSURE (   8.47  )
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

> On Tue, Jul 21, 2026 at 02:48:29AM -0700, Troy Mitchell wrote:
>> Add the Sensylink CTF2301 temperature sensor and fan controller to the
>> LM63 family binding. The chip follows the LM63 register model and can
>> provide a thermal cooling device when #cooling-cells is present.
>
> Commit message should explain why a fallback compatible is not suitable.

The CTF2301 shares the overall register layout with LM63, but it is
not fully compatible. In particular, it uses different conversion-rate
encodings, extended local-temperature registers, additional fan lookup
table entries, and device-specific PWM and ALERT/TACH configuration. An
older driver matching the "national,lm63" fallback would therefore not
operate the device correctly.

I will explain why a fallback compatible is not suitable in the commit
message in the next version.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
