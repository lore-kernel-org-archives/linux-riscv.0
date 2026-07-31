Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573BBC55173
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZjv+w+fA/DGARlRXQ6pYi3y9JR5Ml2Ig7IJizy4LPM=; b=pG17v7VzbFCV7J
	9/rCTHNddnPSFvL2Z2yUVEgWCKv4EFG28zSr0XTQnMChMJb2XSoiK4DYOxxIAfnQSKV7PNzVv0QyV
	Dl8LCV52sxx+9DAct9NQ9xkyixoEmilWfq2FvRPBRvBHXQfh6VE9p5ZVHuTChmX4w6O/bmiqr8Fi+
	Uf7qJ72BuWYp+7UBEn3fZx5N5FO8vFxHgHLFZWLBnggSsGwTgW3xoeNlHr4y06fvul3nG5SboA9bm
	/XPlHsUnD0Hs0npPBhJ2ehnAw523PCzMZmqTpqLr67658CldcOfuMRnTlpIeK73N+zDERKs+sFh52
	txadZbABz8K8RBYwm3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpurg-0000000DcWp-1A85;
	Fri, 31 Jul 2026 21:34:00 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpurd-0000000DcWF-0kTL
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 21:33:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785533593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gHWANFQFZoJJaYEhuKmaZUxWUFD+rkzqPNoml4H2CAPw9Eir1vP5sTf8FH55AQFSTqXbJsRM4yw6PQGOM3+kOK3r7L8MauTZbozYas9fQW65jLiuw5EycL0OsVg5TO4UsvIAt6uzxShq3/IXxF0gXXTGZxTO6NkOGsqXv11V2UU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785533593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=28SYLaxEswFYrX7pB/BBBjg3ucFfM5uxTXPR0tHPjcc=; 
	b=i9xAT7I6wpEq5+55Y74aQJDsqPQN2QZYJAo6dyuwFyrXGYK6n0G4QS3yvwaIgiUukMsstV9j9UnOUru03iQu3tpTSKc8NBqBw12A1m0IaT/lICrjJ2XXiPUwRW0CKH/UhDz8g4VaX7/e2TkzPCXoFT47bwxxweCbYOXkFnNFTUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785533593;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=28SYLaxEswFYrX7pB/BBBjg3ucFfM5uxTXPR0tHPjcc=;
	b=hv8bf7mlLR3lRI+e3WrpA+6efQ42RwhE8qX5b9m1qEMxfc9CGh7FGc46xbl6ss+l
	VAF4ZyymF+yxhahxdJCFv82nK+92hoPQyWArswJxbPIlUignAZgCeUgrBJk8aUD9AWe
	bpwEq29KEJWbNIYk7JBR1AT6NZeaCco7hOSh9vog=
Received: by mx.zohomail.com with SMTPS id 1785533591479424.44668881936855;
	Fri, 31 Jul 2026 14:33:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 0/4] Clk improvements
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260731183735.15036-1-mhi@mailbox.org>
Date: Fri, 31 Jul 2026 18:32:48 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com>
 <20260731183735.15036-1-mhi@mailbox.org>
To: Maurice Hieronymus <mhi@mailbox.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_143357_269799_5714EA71 
X-CRM114-Status: GOOD (  13.37  )
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

SGkgTWF1cmljZSwKCj4gT24gMzEgSnVsIDIwMjYsIGF0IDE1OjM3LCBNYXVyaWNlIEhpZXJvbnlt
dXMgPG1oaUBtYWlsYm94Lm9yZz4gd3JvdGU6Cj4gCj4gSGkgRGFuaWVsLAo+IAo+IGF0IHlvdXIg
c3VnZ2VzdGlvbiBbMF0gSSByZWJhc2VkIG15IGBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KClgIGJp
bmRpbmcgZm9yCj4gcHdtLXRoMTUyMCBvbiB0b3Agb2YgdGhpcyBzZXJpZXMsIHNvIGl0IGlzIG5v
dyB3YWl0aW5nIG9uIGl0IHRvIGxhbmQuIEFzIHY1Cj4gaGFzIG5vdCBzZWVuIGFueSBjb21tZW50
cyBpbiB0aGUgbGFzdCBmZXcgd2Vla3MsIEkgd2FudGVkIHRvIGFzayB3aGF0IHRoZQo+IGN1cnJl
bnQgc3RhdHVzIGlzLgoKTm9ib2R5IGhhcyByZXBsaWVkIHNvIGZhci4gSSBkb27igJl0IHRoaW5r
IHRoZXJlIGFyZSBhbnkgZnVydGhlciBjb21tZW50cy4KCj4gCj4gSWYgdGhlcmUgYXJlIG5vIGJs
b2NrZXJzIGxlZnQgYW5kIHlvdSBleHBlY3QgaXQgdG8gYmUgbWVyZ2VkIHNvb24sIEkgYW0KPiBo
YXBweSB0byBrZWVwIHdhaXRpbmcuIE90aGVyd2lzZSBJIHdvdWxkIG9mZmVyIHRvIHNlbmQgbXkg
c2VyaWVzIHN0YW5kYWxvbmUKPiBhZ2FpbnN0IHRoZSBjdXJyZW50IGBDbGtgIEFQSSBhbmQgbGV0
IHlvdSByZWJhc2Ugb24gdG9wIG9mIG1pbmUgLSBpdCBpcyB0aGUKPiBtdWNoIHNtYWxsZXIgb2Yg
dGhlIHR3bywgdG91Y2hpbmcgb25seSBgQ2xrOjpyYXRlX2V4Y2x1c2l2ZV9nZXQoKWAgYW5kCj4g
cHdtX3RoMTUyMC5ycy4KPiAKPiBbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9y
LWxpbnV4LzE0MEZFMUIzLTczQ0EtNDVFQS1COTc4LTY0OEExQTQ4QjU3N0Bjb2xsYWJvcmEuY29t
Lwo+IAo+IFRoYW5rcyBhIGxvdCwKPiAKPiBNYXVyaWNlCgpZb3VyIHNlcmllcyBtaWdodCBoaXQg
dGhlIHNhbWUgYmxvY2tlciBhcyB0aGlzIG9uZS4gUGVyaGFwcyB3ZSBjYW4gdHJ5IHRvIGdldApi
b3RoIG1lcmdlZCBhdCB0aGUgc2FtZSB0aW1lPwoKQFN0ZXBoZW4gZ2VudGxlIHBpbmcgaGVyZSA6
KQoK4oCUIERhbmllbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
