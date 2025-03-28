Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9EFC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+KNAuGGeotFqLjUTO7ycuTGaw5bG2mUYNrzgAaQr1U=; b=mP/nsR+6DftUHG/33LVLSZyf2O
	UycLR0c2iLoooJeFjQdGzXniCfIgbIbUtwnUQzQhWfXWuuQiRPcM4aZSyvuaREidX43eKS5D8XqqU
	ddCy4aY2xqTV0PYDykwvIid3Rfsp2Q+5CuGTttV+f9IDVzDrBdG1wcGxWdDhaG9T481EeO+DbnPnq
	JGVj9w4NXajhjY2TmlKDO381ULnev02cfSDQcqWjnkid+MyBgXiP1h35c/mUSx5HEQKass/FQY8O4
	pe+guDlPBTXvKG/WMB5VpuBbvWDpwkrqvOXL6YH5YQArBHOMIXfumBp/r0bGVmlSswYsalbGQ01se
	YnvYo9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8lj-0000000DJ9x-09gW;
	Fri, 28 Mar 2025 12:25:03 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8l9-0000000DJ7g-2VQy
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 12:24:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 094E34411B;
	Fri, 28 Mar 2025 12:24:23 +0000 (UTC)
Message-ID: <7ba316f2-b291-4d38-9986-91d2822128bd@ghiti.fr>
Date: Fri, 28 Mar 2025 13:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: errata: Use medany for relocatable builds
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@rivosinc.com>, samuel.holland@sifive.com,
 linux-riscv@lists.infradead.org
References: <20250326224506.27165-2-palmer@rivosinc.com>
 <14b85486-c94d-41a1-aee5-c9ca101bdeaf@ghiti.fr>
In-Reply-To: <14b85486-c94d-41a1-aee5-c9ca101bdeaf@ghiti.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephfeugeejveeiieduvdelkefhueeuueefueeuveehvdeutdefvdevgeekudefffeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpddtuddrohhrghdpkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehprghlmhgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_052427_764026_C3525BF5 
X-CRM114-Status: GOOD (  16.01  )
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

T24gMjgvMDMvMjAyNSAwOToxOCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IE9uIDI2LzAzLzIw
MjUgMjM6NDUsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBXZSdyZSB0cnlpbmcgdG8gbWl4IG5v
bi1QSUMvUElFIG9iamVjdHMgaW50byB0aGUgb3RoZXJ3aXNlLVBJRQo+PiByZWxvY2F0YWJsZSBr
ZXJuZWxzLCB0byBhdm9pZCBHT1QvUExUIHJlZmVyZW5jZXMgZHVyaW5nIGVhcmx5IGJvb3QKPj4g
YWx0ZXJuYXRpdmUgcmVzb2x1dGlvbiAod2hpY2ggaGFwcGVucyBiZWZvcmUgdGhlIEdPVC9QTFQg
YXJlIHNldCB1cCkuCj4+Cj4+IHJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtbGQ6IGFyY2gvcmlz
Y3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEubzogCj4+IHJlbG9jYXRpb24gUl9SSVNDVl9ISTIwIGFn
YWluc3QgYHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkJyBjYW4gbm90IGJlIAo+PiB1c2VkIHdoZW4g
bWFraW5nIGEgc2hhcmVkIG9iamVjdDsgcmVjb21waWxlIHdpdGggLWZQSUMKPj4gcmlzY3Y2NC11
bmtub3duLWxpbnV4LWdudS1sZDogYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLm86IAo+
PiByZWxvY2F0aW9uIFJfUklTQ1ZfSEkyMCBhZ2FpbnN0IGByaXNjdl9jYm9tX2Jsb2NrX3NpemUn
IGNhbiBub3QgYmUgCj4+IHVzZWQgd2hlbiBtYWtpbmcgYSBzaGFyZWQgb2JqZWN0OyByZWNvbXBp
bGUgd2l0aCAtZlBJQwo+Cj4KPiB0aGVhZCBlcnJhdGFzIGFyZSBhbHJlYWR5IGNvbXBpbGVkIHdp
dGggbWVkYW55IGlmIAo+IENPTkZJR19SSVNDVl9BTFRFUk5BVElWRV9FQVJMWSBpcyBzZXQgCj4g
KGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE0LXJjNi9zb3VyY2UvYXJjaC9y
aXNjdi9lcnJhdGEvdGhlYWQvTWFrZWZpbGUjTDIpIAo+IHNvIHdoeSBpc24ndCBpdCBlbm91Z2g/
Cj4KCkZZSSwgdGhpcyBjb25maWcgd2l0aG91dCBlYXJseSBib290IGFsdGVybmF0aXZlcyB0cmln
Z2VyIHRoZSBzYW1lIApyZWxvY2F0aW9uIGlzc3VlIHdpdGggdGhlYWQgZXJyYXRhczogCmh0dHBz
Oi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MDMyOC8yMDI1MDMyODE4MzYu
OHBudEhtNkktbGtwQGludGVsLmNvbS9jb25maWcKCgo+Cj4+Cj4+IEZpeGVzOiA4ZGMyYTdlODAy
N2YgKCJyaXNjdjogRml4IHJlbG9jYXRhYmxlIGtlcm5lbHMgd2l0aCBlYXJseSAKPj4gYWx0ZXJu
YXRpdmVzIHVzaW5nIC1mbm8tcGllIikKPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiBJJ20gbm90IDEwMCUgc3VyZSBpdCdzIHBv
c3NpYmxlIHRvIGV4cG9zZSB0aGlzIHdpdGhvdXQgU2FtdWVsJ3MgTk9NTVUKPj4gcmVsb2NhdGFi
bGUgYnVpbGRzLCBzZWUKPj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9taG5nLTUxN2Mw
MzE4LWM4ZmItNGM0YS1hYTBlLTBkMDhmOGQzNGQ3OEBwYWxtZXItcmkteDFjOS8+IAo+Pgo+PiAt
LS0KPj4gwqAgYXJjaC9yaXNjdi9lcnJhdGEvTWFrZWZpbGUgfCA2ICsrKysrLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2VycmF0YS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvZXJyYXRhL01ha2Vm
aWxlCj4+IGluZGV4IGYwZGE5ZDdiMzljMy4uYmM2Yzc3YmE4MzdkIDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Jpc2N2L2VycmF0YS9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS9NYWtl
ZmlsZQo+PiBAQCAtMSw1ICsxLDkgQEAKPj4gwqAgaWZkZWYgQ09ORklHX1JFTE9DQVRBQkxFCj4+
IC1LQlVJTERfQ0ZMQUdTICs9IC1mbm8tcGllCj4+ICsjIFdlIGNhbid0IHVzZSBQSUMvUElFIHdo
ZW4gaGFuZGxpbmcgZWFybHktYm9vdCBlcnJhdGEgcGFyc2luZywgYXMgCj4+IHRoZSBrZXJuZWwK
Pj4gKyMgZG9lc24ndCBoYXZlIGEgR09UIHNldHVwIGF0IHRoYXQgcG9pbnQuwqAgU28gaW5zdGVh
ZCBqdXN0IHVzZSAKPj4gbWVkYW55OiBpdCdzCj4+ICsjIHVzdWFsbHkgcG9zaXRpb24taW5kZXBl
bmRlbnQsIHNvIGl0IHNob3VsZCBiZSBnb29kIGVub3VnaCBmb3IgdGhlIAo+PiBlcnJhdGEKPj4g
KyMgaGFuZGxpbmcuCj4+ICtLQlVJTERfQ0ZMQUdTICs9IC1mbm8tcGllIC1tY21vZGVsPW1lZGFu
eQo+PiDCoCBlbmRpZgo+PiDCoCDCoCBpZmRlZiBDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkVfRUFS
TFkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
