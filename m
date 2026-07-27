Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21433C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btniXtePx/GiT3EkHUr4lYvIHsPmbofyE4u+ZsNG3bk=; b=MSYUhCYPg4wo5q
	yQHSe39tb0EL025Pf5zuXVfL7v7lzF3OHgEpR/kAiZKmpHqO6kgfFBYTlE1IhgBvhNe1v0BzBSoUK
	uwTIgi3Z7K//uhKygIpKuvr8KDM55DRO2PIrxqW9Ozk3kArZZamUW+/YztLjhrY608dvdmH6KIE6Q
	foUlzBIJ2C+t5GY+EVw4dHafoizA3w+f0BdtetoDuMFwskP/0TMbAQxaUT8eRq3HtBD8u02QNFezx
	LxVd8/QMlR/xlgewgrRTaWXiKUBlkT9iRRXNROPac+8hKH4MlsX2PmJkScq3eb3vxhwbiHbXZqZPK
	8qWSZcEla9vbF3kpRmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFj7-000000027Fa-0DG2;
	Mon, 27 Jul 2026 07:26:17 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFj4-000000027Ew-1Onh
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 07:26:15 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmJ8uGmDc0hqwz3dbUX6RW8a5ofURnJwzsVN39eibdM=;
	b=vK2cbbSs1DT5vRr9+SQd/GLIMXVCOOZW/EgtwXudjf1h519XwUU78l8B2/r/V10rbEFFjr
	0gBHz8Ht0x0AKJmO+lozdEzYmuV6iKDuVEUBLMAax/SUMTnpqCai2zt34S2/2J28HLDH01
	HhTpZW/I1hP3acxWKuHAZ+vOxi0d8l4=
Date: Mon, 27 Jul 2026 00:26:00 -0700
Message-Id: <DK96B6DQ9JJS.K5GR6MBAX8KP@linux.dev>
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
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
In-Reply-To: <20260721-handbook-dancing-0c6805fbc94e@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
	<20260721-handbook-dancing-0c6805fbc94e@spud>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_002614_512429_4D8F6FA7 
X-CRM114-Status: UNSURE (   8.55  )
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
