Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E0F3D5FE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5A2lTGgrmh/dUYFmNYpQuBdrdRLEW+fkNgZXq29KP0=; b=Aqda+kCHZnsGS7
	99x96H04uukp9tgwelB5mvf2MGRZI+EkceXmr5a+NHR/npnDkA+r5hqXkURC6aZDEpdZ+uLIS0JHo
	tIP5I8Wp+cD8D5fyAKQpMvJ6PN0SplhTH2mADh/diK0n8id3fuehSnsTgk9XMd7vNjQZfOakco5++
	bVoQHrtxU2sHpMDbOEt1z+wSMgOicRWvf+DzDCUfaJWuMTlmoUQLvrRzIx8gxfldqkZd7vbzevnxE
	uaVaYYsDN6AbGACQlJDn+piqUicyqFr8VIXAMjVe2nB7JEljhZYxRun4nQlsgaixuq5ue2jGdlx08
	SWxpf4QOleXt62whagDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oiK-00000009tBE-1xRT;
	Sun, 29 Mar 2026 11:53:56 +0000
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oiH-00000009tA4-3nsF
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 11:53:55 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0486F19F57E;
	Sun, 29 Mar 2026 13:53:28 +0200 (CEST)
Message-ID: <66856fb8-3316-4231-8800-90e52de6d906@online.fr>
Date: Sun, 29 Mar 2026 13:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock,
 infrastructure for SD operation
From: Vincent Legoll <legoll@online.fr>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>
References: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
Content-Language: en-US
In-Reply-To: <55c580a0-61cd-435e-bff0-f5f54cbe6948@online.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_045354_089379_DB00D3FF 
X-CRM114-Status: UNSURE (   8.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMy8yOS8yNiAxMToyMCwgVmluY2VudCBMZWdvbGwgd3JvdGU6Cj4gSSBhcHBsaWVkIHRoaXMg
c2VyaWVzIG9uIHRvcCBvZiAKPiBjYmZmZmNjYTJiZjA2MjJiNjAxYjdlYWY0NzdhYTI5MDM1MTY5
MTg0IChsaW51eCBtYWlubGluZSBmcm9tIAo+IHllc3RlcmRheSkgYW5kwqBzdWNjZXNzZnVsbHnC
oGJvb3RlZCB0aGUgcmVzdWx0aW5nIGtlcm5lbCBmcm9tIGFuIFNEIAo+IGNhcmQgb24gYW4gT3Jh
bmdlUGktUlYyICh3aXRoIHRoZSB2ZW5kb3IgdS1ib290IGZyb20gdGhlIFNQSSBmbGFzaCkuCj4K
PiBTbyBpZiB5b3Ugd2FudCwgeW91IGNhbiBhZGQgbXk6IFRlc3RlZC1ieTogVmluY2VudCBMZWdv
bGwgCj4gPGxlZ29sbEBvbmxpbmUuZnI+ICMgT3JhbmdlUGktUlYyIHRvIHRoZSByZWxldmFudCBw
YXRjaGVzIGZyb20gdGhpcyAKPiBzZXJpZXMgVGhhbmtzIFJlZ2FyZHMKCgpTYW1lIGZvciBzZXJp
ZXMgYXBwbGllZCBvbiBuZXh0LTIwMjYwMzI3OgoKClRlc3RlZC1ieTogVmluY2VudCBMZWdvbGwg
PGxlZ29sbEBvbmxpbmUuZnI+ICMgT3JhbmdlUGktUlYyCgoKUC5TLjogU29ycnkgZm9yIHRoZSBm
b3JtYXR0aW5nLCBzdHJ1Z2dsaW5nIHdpdGggdGh1bmRlcmJpcmQuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
