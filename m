Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C5BC5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdAIhJybKf+qI3Llnyr4+XcbTO86ZWhda488NcmgQTk=; b=WCdegBarZjkA9Q
	esCCSzC9OfO7pPCqjOp8fC9pTEFAfq9j7ZY/5QfqW4vsOV0e1Y3+KHNe1Knh5PtorxDindTsnMyyH
	I0k7P1NAAojik4llX4BarN1noALWtL7ScVmQFtvZ7P+mvXJJ8x2LIJpm+wl3kDfPBtLAsgSLCjZok
	f/Dx8yEbmQk+HpMkH3AiA06eOQdBryD6lt5tQyahPXF1tLDVq74rP6InAk/227pJ/Qd0Bruoe1SHH
	4d9A1Zw20CbEXfaVoUPYcy6KXQeDwN7gWywyc6Jaki1PfF5Mj1oBIYxgFVqCJGliAtDeF/SgRmuIE
	026MYjC49Y7xqGt45UZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvcmW-00000004rgf-3RS1;
	Sun, 16 Aug 2026 15:28:16 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvcmU-00000004rgF-0wWE
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 15:28:15 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 37D02CC6BB;
	Sun, 16 Aug 2026 18:28:10 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 37D02CC6BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786894092;
	bh=7OOVJe7QtwNsFabdXE48VCdNc7uTbafySFa80JTrPPg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=uewTgXmhUWaeiVFp9z2bWTcWaeE1XYj66thKuh8LSCqYGALkAdL2nkCHhxyNQsk6u
	 GNmDK7U3jIwW8O/QYp22VvVra7eM/hG3vEdshB4WMnwj6EBg5vEdRszA9zHHnb2lXF
	 9QSKf8bXD48xEMnmpSq+aXBafGYeGZcvZTjXDbTZFZMlJJJVn0cEPPbxtCvE0RaMN1
	 u+dguHrrNNhZJ5QEFShYE9a+OCs5gHzf53HrpKV1kv7wZma8082OlG0PGsZ0SqIH0J
	 G95R3+PRAwz4x/mI8u3MGDZ2Mb3zdu7HkJQsmidB8d2pBQ4TZjAQzhV8JiZ3pXFvHn
	 6je4l/c5QnvZg==
Message-ID: <e70e9fd19e9ebaec823a8abc518bf935e36938b9.camel@rendec.net>
Subject: Re: [PATCH 5/5] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 	tglx@kernel.org, daniel.lezcano@kernel.org,
 anup@brainfault.org, 	hui.wang@canonical.com, samuel.holland@sifive.com
Date: Sun, 16 Aug 2026 11:28:08 -0400
In-Reply-To: <20260816070049.2097442-6-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
	 <20260816070049.2097442-6-guoren@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_082814_439862_98F25155 
X-CRM114-Status: GOOD (  13.68  )
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

T24gU3VuLCAyMDI2LTA4LTE2IGF0IDA3OjAwICswMDAwLCBHdW8gUmVuIHdyb3RlOgo+IEZyb206
ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+IElNU0lDIHdhcyBk
ZWZpbmluZyBpdHMgb3duIElNU0lDX05SX0lQSSAoPSA4KSB3aGljaCBoYXBwZW5lZCB0byBtYXRj
aAo+IHRoZSBhcmNoaXRlY3R1cmUncyBJUElfTUFYLiBOb3cgdGhhdCBJUElfTUFYIGlzIGV4cG9y
dGVkIGZyb20gcmlzY3YKPiBhc20vc21wLmgsIHVzZSB0aGUgYXJjaGl0ZWN0dXJlIGNvbnN0YW50
IGFuZCBkcm9wIHRoZSBwcml2YXRlIGRlZmluZS4KPiAKPiBUaGlzIGtlZXBzIHRoZSBudW1iZXIg
b2YgbXVsdGlwbGV4ZWQgSVBJcyBpbiBzeW5jIHdpdGggdGhlIHJlc3Qgb2YgdGhlCj4gUklTQy1W
IElQSSBpbmZyYXN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVuIChYdWFuVGll
KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLWVhcmx5LmMgfCA0ICsrLS0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuaCB8IDEgLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtZWFybHkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+
IGluZGV4IDEyZWZkMjQxY2U4OC4uODIzZjVmMmVjYjNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+IEBAIC02NywxMiArNjcsMTIgQEAgc3RhdGljIGludCBf
X2luaXQgaW1zaWNfaXBpX2RvbWFpbl9pbml0KHZvaWQpCj4gwqAJCXJldHVybiAwOwo+IMKgCj4g
wqAJLyogQ3JlYXRlIElNU0lDIElQSSBtdWx0aXBsZXhpbmcgKi8KPiAtCXZpcnEgPSBpcGlfbXV4
X2NyZWF0ZShJTVNJQ19OUl9JUEksIGltc2ljX2lwaV9zZW5kKTsKPiArCXZpcnEgPSBpcGlfbXV4
X2NyZWF0ZShJUElfTUFYLCBpbXNpY19pcGlfc2VuZCk7Cj4gwqAJaWYgKHZpcnEgPD0gMCkKPiDC
oAkJcmV0dXJuIHZpcnEgPCAwID8gdmlycSA6IC1FTk9NRU07Cj4gwqAKPiDCoAkvKiBTZXQgdklS
USByYW5nZSAqLwo+IC0JcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKHZpcnEsIElNU0lDX05SX0lQ
SSk7Cj4gKwlyaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UodmlycSwgSVBJX01BWCk7Cj4gwqAKPiDC
oAkvKiBBbm5vdW5jZSB0aGF0IElNU0lDIGlzIHByb3ZpZGluZyBJUElzICovCj4gwqAJcHJfaW5m
bygiJXBmd1A6IHByb3ZpZGluZyBJUElzIHVzaW5nIGludGVycnVwdCAlZFxuIiwgaW1zaWMtPmZ3
bm9kZSwgSU1TSUNfSVBJX0lEKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1zdGF0ZS5oIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0
ZS5oCj4gaW5kZXggYzQyZWUxODBiMzA1Li44NzhjYzE5MmNjZWMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oCj4gKysrIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oCj4gQEAgLTEzLDcgKzEzLDYgQEAKPiDCoCNpbmNs
dWRlIDxsaW51eC90aW1lci5oPgo+IMKgCj4gwqAjZGVmaW5lIElNU0lDX0lQSV9JRAkJCQkxCj4g
LSNkZWZpbmUgSU1TSUNfTlJfSVBJCQkJCTgKPiDCoAo+IMKgc3RydWN0IGltc2ljX3ZlY3RvciB7
Cj4gwqAJLyogRml4ZWQgZGV0YWlscyBvZiB0aGUgdmVjdG9yICovCgpSZXZpZXdlZC1ieTogUmFk
dSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
