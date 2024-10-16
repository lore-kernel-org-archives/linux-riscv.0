Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D447D1AD48
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZoVok9OG/iFG1PuR2+X464TPdfoJH8eq2gC5cYW23E=; b=3JiV+JVpOMWpFf
	jlLdrqRGNpvJcdsg13+T/qjLHd6zAiWK342et91W4n/XC359CL/fG6hO7SPkFW3HW1thbSjXeJ25t
	7IJ5SBbORSM+cMOtppLxv1mAv31SqJiMzuwCEnpCpLAivLSOrHYRNe3f7aO4jaK46m4kyL4RnwdU0
	eiD1Wvq2d8Z64YeX7nQuBE/YB+waAa1wJaoZNf6zlpjzX5WkSJVZpOEdvFtGUXIWi3650nHaW5DKY
	WjOdaix//sFPewn3qTKPv2ftMGnjoZjHpm+cCab9jKr3fjHY6T0/MZKiTeuve7cnjw35keOXqxWsY
	dT+Ha3QSsaO+oRURmOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12Al-0000000BaPT-0d7u;
	Wed, 16 Oct 2024 11:26:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12Ah-0000000BaOl-3bdW
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 11:26:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B55BF40004;
	Wed, 16 Oct 2024 11:26:24 +0000 (UTC)
Message-ID: <3fe1e610-c863-4fbf-85cb-6e83ba7684af@ghiti.fr>
Date: Wed, 16 Oct 2024 13:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Montleon <jmontleo@redhat.com>,
 stable@vger.kernel.org, Kees Cook <keescook@chromium.org>
References: <20241009072749.45006-1-alexghiti@rivosinc.com>
 <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_042632_068424_F977BD35 
X-CRM114-Status: GOOD (  20.96  )
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

SGkgSmVzc2ljYSwKCk9uIDE2LzEwLzIwMjQgMDA6MDQsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+
IE9uIDkgT2N0IDIwMjQsIGF0IDA4OjI3LCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+IHdyb3RlOgo+PiBFYXJseSBjb2RlIGRlc2lnbmF0ZXMgdGhlIGNvZGUgZXhlY3V0
ZWQgd2hlbiB0aGUgTU1VIGlzIG5vdCB5ZXQgZW5hYmxlZCwKPj4gYW5kIHRoaXMgY29tZXMgd2l0
aCBzb21lIGxpbWl0YXRpb25zIChzZWUKPj4gRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Jvb3Qu
cnN0LCBzZWN0aW9uICJQcmUtTU1VIGV4ZWN1dGlvbiIpLgo+Pgo+PiBGT1JUSUZZX1NPVVJDRSBt
dXN0IGJlIGRpc2FibGVkIHRoZW4gc2luY2UgaXQgY2FuIHRyaWdnZXIga2VybmVsIHBhbmljcwo+
PiBhcyByZXBvcnRlZCBpbiBbMV0uCj4+Cj4+IFJlcG9ydGVkLWJ5OiBKYXNvbiBNb250bGVvbiA8
am1vbnRsZW9AcmVkaGF0LmNvbT4KPj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9DQUpEX2JQSmVzNFFobVhZNWY2M0dIVjlCOUhGa1NDb2FaamstcUNUMk5HUzdR
OUhPRGdAbWFpbC5nbWFpbC5jb20vIFsxXQo+PiBGaXhlczogYTM1NzA3YzNkODUwICgicmlzY3Y6
IGFkZCBtZW1vcnktdHlwZSBlcnJhdGEgZm9yIFQtSGVhZCIpCj4+IEZpeGVzOiAyNmU3YWFjYjgz
ZGYgKCJyaXNjdjogQWxsb3cgdG8gZG93bmdyYWRlIHBhZ2luZyBtb2RlIGZyb20gdGhlIGNvbW1h
bmQgbGluZSIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBJcyB0aGUgcHJvYmxl
bSBpbiBbMV0gbm90IGp1c3QgdGhhdCB0aGUgZWFybHkgYm9vdCBwYXRoIHVzZXMgbWVtY3B5IG9u
Cj4gdGhlIHJlc3VsdCBvZiBBTFRfT0xEX1BUUiwgd2hpY2ggaXMgYSB3aWxkbHkgb3V0LW9mLWJv
dW5kcyBwb2ludGVyIGZyb20KPiB0aGUgY29tcGlsZXLigJlzIHBlcnNwZWN0aXZlPyBJZiBzbywg
aXQgd291bGQgc2VlbSBiZXR0ZXIgdG8gdXNlCj4gdW5zYWZlX21lbWNweSBmb3IgdGhhdCBvbmUg
Y2FsbCBzaXRlIHJhdGhlciB0aGFuIHVzZSB0aGUgYmlnCj4gX19OT19GT1JUSUZZIGhhbW1lciwg
c3VyZWx5PwoKCk5vdCBzdXJlIHdoeSBmb3J0aWZ5IGNvbXBsYWlucyBoZXJlLCBhbmQgSSBoYXZl
IGp1c3Qgc2VlbiB0aGF0IEkgZm9yZ290IAp0byBjYyBLZWVzIChkb25lIG5vdykuCgoKPgo+IFBy
ZXN1bWFibHkgdGhlIG5vbi1lYXJseSBwYXRoIGlzIGp1c3QgYXMgYmFkIHRvIHRoZSBjb21waWxl
ciwgYnV0IHdvcmtzCj4gYmVjYXVzZSBwYXRjaF90ZXh0X25vc3luYyBpc27igJl0IGluc3RydW1l
bnRlZCwgc28gdGhhdCB3b3VsZCBqdXN0IGFsaWduCj4gdGhlIHR3by4KPgo+IEdldHRpbmcgdGhl
IGltcGxlbWVudGF0aW9uIHRvIG5vdCBiZSBzaWxlbnQgb24gZmFpbHVyZSBkdXJpbmcgZWFybHkK
PiBib290IHdvdWxkIGFsc28gYmUgYSBnb29kIGlkZWEsIGJ1dCBpdOKAmXMgc3VyZWx5IGJldHRl
ciB0byBoYXZlCj4gRk9SVElGWV9TT1VSQ0UgZW5hYmxlZCB3aXRoIG5vIG91dHB1dCBmb3IgcG9z
aXRpdmVzIHRoYW4gZGlzYWJsZSB0aGUKPiBjaGVja2luZyBpbiB0aGUgZmlyc3QgcGxhY2UgYW5k
IHJpc2sgdW5jYXVnaHQgY29ycnVwdGlvbi4KCgpJJ20gbm90IHN1cmUgdG8gZm9sbG93OiB5b3Ug
cHJvcG9zZSB0byB1c2UgdW5zYWZlX21lbWNweSgpIGluc3RlYWQgb2YgCmRpc2FibGluZyBmb3J0
aWZ5IGVudGlyZWx5LCBzbyB3ZSB3b3VsZCBub3QgZ2V0IGFueSB3YXJuaW5nIGluIGNhc2Ugb2Yg
CmZhaWx1cmUgYW55d2F5IHJpZ2h0PyBPciBkbyB5b3UgcHJvcG9zZSB0byBtb2RpZnkgdGhlIGZv
cnRpZnkgY29kZSB0byAKc29tZWhvdyBwcmludCBhIHdhcm5pbmc/IElmIHRoZSBsYXR0ZXIsIGl0
J3MgaGFyZCB0aGlzIHNvb24gaW4gdGhlIGJvb3QgCnByb2Nlc3MgKHdoZXJlIHRoZSBtbXUgaXMg
ZGlzYWJsZWQpIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBwcmludGluZyAKd2FybmluZyBwYXRoIGRv
ZXMgbm90IHRyeSB0byBhY2Nlc3MgYW55IHZpcnR1YWwgYWRkcmVzcyAod2hpY2ggaXMgd2h5IAp0
aGUgYm9vdCBmYWlsZWQgaW4gdGhlIGZpcnN0IHBsYWNlKSBidXQgbWF5YmUgS2VlcyBoYXMgYW4g
aWRlYS4KCkFuZCBJIGJlbGlldmUgdGhhdCBlbmFibGluZyBmb3J0aWZ5IGFuZCB1c2luZyB0aGUg
dW5zYWZlXyooKSB2YXJpYW50cyBpcyAKZXJyb3ItcHJvbmUgc2luY2Ugd2UnZCBoYXZlIHRvIG1h
a2Ugc3VyZSB0aGF0IGFsbCB0aGUgImZvcnRpZmllZCIgCmZ1bmN0aW9ucyB1c2VkIGluIHRoYXQg
Y29kZSB1c2UgdGhlIHVuc2FmZV8qKCkgdmFyaWFudHMuCgpTbyB0byBtZSwgaXQncyB3YXkgZWFz
aWVyIGluIHRlcm1zIG9mIG1haW50ZW5hbmNlIHRvIGp1c3QgZGlzYWJsaW5nIGZvcnRpZnkuCgpU
aGFua3MsCgpBbGV4CgoKPiBKZXNzCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
