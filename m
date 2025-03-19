Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E952EC35FFF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQKhyJ4NifhaLgAJn+ZNiAszNyefsUbtT2O/FDwi0Bs=; b=yi22/tMGURWA0w
	/hWPciobYUDNloJbdFpXBobbdNQIPf6+TcVgGUXERFB/NiYFwYOSw5tzh51WX0PjyEEGUWmmlCyYK
	UPRuqouYNSqDQnZx/X4psnhgL0GqSbXvWUY+vOQNC0qbaiiGNZ/V15K9xSGWJ7Auk7zcoLvk51k0g
	PyE2FDnSh1/j+BxG4d6iwHMAR7oQhR+Ri5GVR5Mg/7z0sVu0djFkNGraFt84NUZp5UphzG+joe+Za
	ONl0V9A8O3xW2dwqnWJkFxVKmxHMgs3ebOo6uyqjcuB37lDiawPlZXwHgLYCvgwygi/rv0v608MIf
	dNyQTtdpxCHpqSDb17vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqlW-00000008g5D-2CyX;
	Wed, 19 Mar 2025 10:35:14 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqlT-00000008g3a-2XKD;
	Wed, 19 Mar 2025 10:35:13 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9SO6l032495;
	Wed, 19 Mar 2025 11:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RqFuZz63Z0ImK/Xp33t4bPUN4JwD2jEIzeGx3AgsiHM=; b=5aReOAGqEuu0So7V
	SAQzjUOWvtgN07YbhV4I9rLlny5ac/TtdSBkjJViXoWFM4Xvm2910RucXUqBWhZk
	y0VyK6eV0mf04Z1NXvxLMPKvAxcs7O1yhwPZqZvMq8x92ZH9VVDo+AgEHqcXrFb1
	uVGlqleuj4OETGz5lP4qt76Cr/iVvd+aHseLrDiVmRTfyTL7ZVdiTlpo8p5Xiefr
	VGloWHc74hbhblyU2dvkdyUE9t2sCMj52XHIANWQxWs7x0R1b00yx8M071qlacwU
	EtsLIM7e/npVQvCgpG5vjz7sh7KcAPj/1jPwx8OQKjBu49e7Zxfal8Yhok/6Yt4e
	c3MeLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuaw0ccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:34:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E486440048;
	Wed, 19 Mar 2025 11:31:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 068276C8A18;
	Wed, 19 Mar 2025 11:29:14 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.14) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 11:29:12 +0100
Message-ID: <45d5baa5a93fec388a75e91653439f7678d000ee.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <tglx@linutronix.de>
CC: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        Herve Codina
	<herve.codina@bootlin.com>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>,
        "WANG
 Xuerui" <kernel@xen0n.name>, <linux-riscv@lists.infradead.org>,
        "Alyssa
 Rosenzweig" <alyssa@rosenzweig.io>,
        Jerome Brunet <jbrunet@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>,
        <asahi@lists.linux.dev>, <maz@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Huacai Chen
	<chenhuacai@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        "Janne
 Grunau" <j@jannau.net>, Kevin Hilman <khilman@baylibre.com>,
        "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>,
        "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <loongarch@lists.linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
        <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>,
        "Masami Hiramatsu" <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Anup Patel
	<anup@brainfault.org>, Imre Kaloz <kaloz@openwrt.org>,
        Antoine Tenart
	<atenart@kernel.org>
Date: Wed, 19 Mar 2025 11:29:10 +0100
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
	 <20250319092951.37667-7-jirislaby@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.14]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_033512_111870_C1D967D4 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gV2VkLCAyMDI1LTAzLTE5IGF0IDEwOjI4ICswMTAwLCBKaXJpIFNsYWJ5IChTVVNFKSB3cm90
ZToKPiBvZl9ub2RlX3RvX2Z3bm9kZSgpIGlzIGlycWRvbWFpbidzIHJlaW1wbGVtZW50YXRpb24g
b2YgdGhlICJvZmZpY2lhbGx5Igo+IGRlZmluZWQgb2ZfZndub2RlX2hhbmRsZSgpLiBUaGUgZm9y
bWVyIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nCj4gcmVtb3ZlZCwgc28gdXNlIHRoZSBsYXR0
ZXIgaW5zdGVhZC4KPiAKCi4uLiBzbmlwIC4uLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zdG0zMm1wLWV4dGkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJtcC1leHRp
LmMKPiBpbmRleCBjYjgzZDZjYzYxMTMuLjY0OWI4NGYxMmVmYyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2lycWNoaXAvaXJxLXN0bTMybXAtZXh0aS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1zdG0zMm1wLWV4dGkuYwo+IEBAIC01MzEsNyArNTMxLDcgQEAgc3RhdGljIGludCBzdG0zMm1w
X2V4dGlfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkbSwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC8qIHdlIG9ubHkgc3VwcG9ydCBvbmUgcGFyZW50LCBzbyBmYXIgKi8KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG9mX25vZGVfdG9fZndub2RlKG91dF9pcnEu
bnApICE9IGRtLT5wYXJlbnQtPmZ3bm9kZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKG9mX2Z3bm9kZV9oYW5kbGUob3V0X2lycS5ucCkgIT0gZG0tPnBhcmVudC0+Zndub2Rl
KQo+IAoKRm9yIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJtcC1leHRpLmMKUmV2aWV3ZWQtYnk6
IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
