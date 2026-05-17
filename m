Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA00CD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIMSNSvIQWJHNaNoi8KnXwpejcz0l0/wdKyByq+asI8=; b=2TJhM4vWGYbbtm6N4Etd6UOr25
	8pXaYKyEhhbI/1+j23Jt+W60dr7WMKJXSmw3ca2ENBwjkD9SoXIEDJfH/YGs7P4QuTvAZV6FWdIyQ
	cVvggc+cNG7fjvuhqiphSRNOlzNVPFEqRfkahOLio2Dx2HL+gpoi1VLNZgiaVmbJGZgbs86mgp2B6
	TT4jDvfo/v4H8/NpxcMhn/iy6fj7k/3OGotRS2izOndkB2T4vI3Cwg1D2ZB/7C5jF+h2BjbG21Ml/
	AO9ndLOhR1tigM8F1Q+25HL4SwliUI/rRo1p5frEOlPJNHNH5ZhbZo2e/KHW4D878otzd2EixFh6r
	qn4w5g/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7fq-00000008i7m-3kD1;
	Thu, 21 May 2026 17:59:10 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOYVj-0000000CVUE-16r9
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 10:14:17 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B6E86013C;
	Sun, 17 May 2026 12:13:54 +0200 (CEST)
Message-ID: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
Date: Sun, 17 May 2026 12:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
From: Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_031415_442807_E59B1C52 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 21 May 2026 10:59:10 -0700
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWl4dW4gTGFuLCBDaHVrdW4gUGFuLAoKSSB0cmllZCBzcGFjZW1pdC1jb20vZm9yLW5leHQg
KGUyNTE4ZThjYjFkZGU2NGFmMmQxYmIyNDY2MzliYjdlZjc1MjNmN2EpIApvbiBvcGktcnYyCndo
aWNoIGluY2x1ZGVzIHRoaXMgcGF0Y2guCgpidXQgY2Fubm90IHNlZSBhbnl0aGluZyByZWxldmFu
dCB0byBTUEkgaW4gZG1lc2csIHdoZXJlYXMgSSBzZWUgW1FdU1BJIAppbiB1LWJvb3Qgb3V0cHV0
LCBidXQgdGhlcmUgaXQgaXMgbGlzdGVkIGFzOgpbwqAgwqAwLjg4N10gU0Y6IERldGVjdGVkIFhN
MjVRSDEyOEEgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIAo2NCBLaUIsIHRv
dGFsIDE2IE1pQgpXaGljaCBpcyBub3QgdGhlIHNhbWUgeW91IHRlc3RlZCAoWE0yNVFVMTI4Qyku
CgpBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8KSG93IGNhbiBJIGtub3cgdGhpcyBwYXRjaCBpcyB3
b3JraW5nIHByb3Blcmx5ID8KV2hhdCBzaG91bGQgSSB0ZXN0ID8KV2hhdCBzaG91bGQgSSByZXBv
cnQgPwpJcyB0aGlzIHRlc3QgdXNlZnVsID8KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
