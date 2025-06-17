Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88579C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbWZCSOyijzHksu39xOUhGACad+zhjldxFPd+IAc2PI=; b=uMlKgU3caasKNp
	+h14UZPIyzaGfBMBau5M8LedpvIzfpqghTjtC82MqAzeboEjB7pjxllkhEnovVVlPO8c7iBZTl/aI
	WgqCECz2pKEKQsCO8xJSU7dgrftBa7exprmqWoSKlKde52Tl+IguICYMlEEkh61yAd9aNGkMQqAYY
	zLnQxFHkEdyc0+/FipZb3tWfUmsIcOZozQTzwIGRx7bYHCfYEJAcztfl1kISPbsI6fQbUwCw3xQM1
	4twBkecqBQCszKHPALZwE34HfOvDgS4Q5b5ERJgIQ/jcCIAJTx/RwQhHei74e2mtg5gMcN/tsX/z1
	enfYQM+f+P6zySjcWxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRDs-00000006WJ5-1LfS;
	Tue, 17 Jun 2025 07:59:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRDq-00000006WIU-0GZy
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:59:11 +0000
Date: Tue, 17 Jun 2025 09:59:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750147148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj2LJB5Pz+vjWi8da/Iv2JkklxNhs1V6axP5pIrqxJM=;
	b=riuj8blwvDOsP6wUDdP3Ci9HXHbVoAlg32Weak2qNVuiCsD1ol6m/pAdmc6Wz+nOKmmqKg
	3IeYSlbgY2321vJgf0z88CN2TJeN2qF5hfUcRL4jBlVM2dUs3HE7qD16NAvAmHP/2Q0Tiu
	Bv4zf2GgxWNfyv3tMCpI3wG2QM2gYLo0w2MiidaFYgj1M6iVe1g6wxrJ1VTkOJvr9Jf1rH
	cXvYeuXURM43LbebVBKLsOIftA5ESr5OIcgKGY3NSdHi38sICPCCjfkEXkqUUNYg//cVI+
	+91Qelw5eKrsAUCwxPXvtbH9iLIk+rBeQm+lUtOKp6N02yrLbZppHMyNUJ3vEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750147148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj2LJB5Pz+vjWi8da/Iv2JkklxNhs1V6axP5pIrqxJM=;
	b=3dlU8pncy0paXbKmJi5ztkGhzw3FggNzV5ZHCn4tYoW6SfRQ/nfHyS2G+ZITRQ05Cj+PIu
	F15f2+z9rzshWKDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
Message-ID: <20250617095102-d3df1c46-3d51-4f77-af0a-8299f5e71ad9@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
 <CAK7LNAQUN3hWYh_1=LMzVp1Ddbq3W=yGHZ5__LbcfBajfuhscg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAQUN3hWYh_1=LMzVp1Ddbq3W=yGHZ5__LbcfBajfuhscg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_005910_247827_47189A02 
X-CRM114-Status: GOOD (  25.68  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMTI6MzU6MDdBTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDQ6MzjigK9QTSBUaG9tYXMgV2Vpw59z
Y2h1aAo+IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBV
c2VycHJvZ3MgYXJlIGJ1aWx0IHdpdGggdGhlIHJlZ3VsYXIga2VybmVsIGNvbXBpbGVyICRDQy4K
PiA+IEEga2VybmVsIGNvbXBpbGVyIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGNvbnRhaW4gYSBsaWJj
IHdoaWNoIGlzIHJlcXVpcmVkCj4gPiBmb3IgYSBub3JtYWwgdXNlcnNwYWNlIGFwcGxpY2F0aW9u
Lgo+ID4gSG93ZXZlciB0aGUga2VybmVsIHRyZWUgZG9lcyBjb250YWluIGEgbWluaW1hbCBsaWJj
IGltcGxlbWVudGF0aW9uCj4gPiAibm9saWJjIiB3aGljaCBjYW4gYmUgdXNlZCB0byBidWlsZCB1
c2Vyc3BhY2UgYXBwbGljYXRpb25zLgo+ID4KPiA+IEludHJvZHVjZSBzdXBwb3J0IHRvIGJ1aWxk
IHVzZXJwcm9ncyBhZ2FpbnN0IG5vbGliYyBpbnN0ZWFkIG9mIHRoZQo+ID4gZGVmYXVsdCBsaWJj
IG9mIHRoZSBjb21waWxlciwgd2hpY2ggbWF5IG5vdCBleGlzdC4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4K
PiA+Cj4gPiAtLS0KPiA+IFRoaXMgY291bGQgcHJvYmFibHkgYmUgbW92ZWQgb3V0IG9mIHRoZSBn
ZW5lcmljIGtidWlsZCBtYWtlZmlsZXMuCj4gPiBJIHRoaW5rIHRoZSBlcmdvbmltaWNzIHdvdWxk
IHN1ZmZlciBhbmQgdGhpcyBmdW5jdGlvbmFsaXR5IGNvdWxkIGJlCj4gPiB1c2VkIGJ5IG90aGVy
IHVzZXJzIG9mIHVzZXJwcm9ncy4KPiA+Cj4gPiBBbHNvIHRoaXMgZG9lcyBjdXJyZW50bHkgbm90
IHN1cHBvcnQgb3V0LW9mLXRyZWUgYnVpbGRzLgo+ID4gRm9yIHRoYXQgdG9vbHMvaW5jbHVkZS9u
b2xpYmMvKi5oIGFuZCB1c3IvaW5jbHVkZS8qLmggd291bGQgbmVlZCB0byBiZQo+ID4gaW5zdGFs
bGVkIGludG8gdGhlIGJ1aWxkIGRpcmVjdG9yeS4KCjxzbmlwPgoKPiA+IC0tLSBhL3NjcmlwdHMv
TWFrZWZpbGUudXNlcnByb2dzCj4gPiArKysgYi9zY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncwo+
ID4gQEAgLTE2LDEwICsxNiwxNyBAQCB1c2VyLWNzaW5nbGUgICAgICAgIDo9ICQoYWRkcHJlZml4
ICQob2JqKS8sICQodXNlci1jc2luZ2xlKSkKPiA+ICB1c2VyLWNtdWx0aSAgICA6PSAkKGFkZHBy
ZWZpeCAkKG9iaikvLCAkKHVzZXItY211bHRpKSkKPiA+ICB1c2VyLWNvYmpzICAgICA6PSAkKGFk
ZHByZWZpeCAkKG9iaikvLCAkKHVzZXItY29ianMpKQo+ID4KPiA+ICt1c2VyX25vbGliY19jY2Zs
YWdzIDo9IC1ub3N0ZGxpYiAtbm9zdGRpbmMgLXN0YXRpYyAtZm5vLWlkZW50IC1mbm8tYXN5bmNo
cm9ub3VzLXVud2luZC10YWJsZXMgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIC1mZnJlZXN0
YW5kaW5nIC1mbm8tc3RhY2stcHJvdGVjdG9yIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAt
aXN5c3RlbSAkKG9ianRyZWUpL3Vzci9pbmNsdWRlIC1pbmNsdWRlICQoc3JjdHJlZSkvdG9vbHMv
aW5jbHVkZS9ub2xpYmMvbm9saWJjLmggLWlzeXN0ZW0gJChzcmN0cmVlKS90b29scy9pbmNsdWRl
L25vbGliYy8KPiAKPiBUaGUgdG9vbHMvIGRpcmVjdG9yeSBpcyBhIGRpZmZlcmVudCB3b3JsZCwg
YW5kIEtidWlsZCBzY3JpcHRzIGRvIG5vdCBrbm93Cj4gYW55dGhpbmcgYWJvdXQgaXQuCgpBY2su
CgpIb3cgZG9lcyB0aGlzIHN0YXRlbWVudCBhZmZlY3QgdGhlIG5leHQgcGF0Y2ggd2hpY2ggY3Jl
YXRlcwp0b29scy9pbmNsdWRlL25vbGliYy9LY29uZmlnLm5vbGliYyA/CklzIGl0IGZpbmUgdG8g
Y3JlYXRlIHRoZSBLY29uZmlnIGZpbGUgaW4gdG9vbHMvIG9yIHNob3VsZCBJIG1vdmUgaXQ/Ckkg
ZG8gd2FudCB0byBtYWludGFpbiB0aGlzIGZpbGUgYXMgcGFydCBvZiBub2xpYmMgYW5kIG5vdCBL
VW5pdC4KVGhlIHBvc3NpYmlsaXRpZXMgSSBzZWUgYXJlIGluaXQvS2NvbmZpZy5ub2xpYmMgb3Ig
bGliL0tjb25maWcubm9saWJjLgoKPiBBbmQsIHlvdSBkbyBub3QgbmVlZCB0byBpbXBsZW1lbnQg
dGhpcyBpbiBzY3JpcHRzL01ha2VmaWxlLnVzZXJwcm9ncwo+IGJlY2F1c2UgeW91IGNhbiBtb3Zl
IHRoaXMgdG8gbGliL2t1bml0L01ha2VmaWxlLmt1bml0LXVhcGkgb3Igc29tZXdoZXJlLgoKVW5k
ZXJzdG9vZC4gVGhpcyBpcyBub3QgdW5leHBlY3RlZCwgYXMgaGludGVkIGluIHRoZSBjb21taXQg
bWVzc2FnZS4KCj4gPiArdXNlcl9ub2xpYmNfbGRmbGFncyA6PSAtbm9zdGRsaWIgLW5vc3RkaW5j
IC1zdGF0aWMKPiA+ICsKPiA+ICB1c2VyX2NjZmxhZ3MgICA9IC1XcCwtTU1ELCQoZGVwZmlsZSkg
JChLQlVJTERfVVNFUkNGTEFHUykgJCh1c2VyY2NmbGFncykgXAo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgJCgkKHRhcmdldC1zdGVtKS11c2VyY2NmbGFncykKPiA+IC11c2VyX2xkZmxhZ3Mg
ICA9ICQoS0JVSUxEX1VTRVJMREZMQUdTKSAkKHVzZXJsZGZsYWdzKSAkKCQodGFyZ2V0LXN0ZW0p
LXVzZXJsZGZsYWdzKQo+ID4gLXVzZXJfbGRsaWJzICAgID0gJCh1c2VybGRsaWJzKSAkKCQodGFy
Z2V0LXN0ZW0pLXVzZXJsZGxpYnMpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAkKCQodGFy
Z2V0LXN0ZW0pLXVzZXJjY2ZsYWdzKSAkKGlmICQoJCh0YXJnZXQtc3RlbSktbm9saWJjKSwkKHVz
ZXJfbm9saWJjX2NjZmxhZ3MpKQo+ID4gK3VzZXJfbGRmbGFncyAgID0gJChLQlVJTERfVVNFUkxE
RkxBR1MpICQodXNlcmxkZmxhZ3MpICQoJCh0YXJnZXQtc3RlbSktdXNlcmxkZmxhZ3MpIFwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICQoaWYgJCgkKHRhcmdldC1zdGVtKS1ub2xpYmMpLCQo
dXNlcl9ub2xpYmNfbGRmbGFncykpCj4gPiArdXNlcl9sZGxpYnMgICAgPSAkKHVzZXJsZGxpYnMp
ICQoJCh0YXJnZXQtc3RlbSktdXNlcmxkbGlicykgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgJChpZiAkKCQodGFyZ2V0LXN0ZW0pLW5vbGliYyksJCh1c2VyX25vbGliY19sZGxpYnMpKQo+
ID4KPiA+ICAjIENyZWF0ZSBhbiBleGVjdXRhYmxlIGZyb20gYSBzaW5nbGUgLmMgZmlsZQo+ID4g
IHF1aWV0X2NtZF91c2VyX2NjX2MgPSBDQyBbVV0gICRACgoKVGhvbWFzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
