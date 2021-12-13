Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/H9nAEcZy0CcWm8hgFYKh9kBJidPQ7YTn4sueXp6pE=; b=pWwRZCJ95aLZJV
	qbcTGuMMocZQG8MtY1UbzKYR5KQc31+j9CLRQoUnsXcftRgnwHcyEgtJ0P0TALY8mdjOUvb1LQjfU
	5nwxqYpF1gTJ2QE0qM1S2QKzYH4rgFz6S4fmNNAzFXQTvaeAQUNwGFoNd+Q51oE2Y7PyPmK0G8b4V
	+/kctDkGdAmMVH7i8GTfKmY/UQjsVDBdKsQKjmtplWiUNKrG/IJNpuP9FWKdhdohMiTzJ1f0ZPklF
	6ZSph92yI1hhstd1VUZBK53AR0k4rKzob74PB6Rb9rAqzEbgvrGnY4uYemJMVx9FQTu+gTvr8ene1
	y+Q7jv45n6awoX7Ymagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwpye-00AvYp-1M; Mon, 13 Dec 2021 18:23:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwpyS-00AvWB-Ue; Mon, 13 Dec 2021 18:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=yV2tBkVvXoyk7K32YhJtwlQ3vwJSsntomGOtaF0A3uM=; b=qtmFTFrv0cI4IfYHPSFKyChR0z
 617nfvjNXIKfqzoRvTLw77CqqoZLAxDVmNLrBqC0ifMRD5Rv81rDQQNL2FfCxrdzl1eeVHeAs2d6j
 M4b0NtuYjT32iUWLjTUQJAloGUucxXjvTA7Oi7ldynWp5RU1WMxX/mGfRSNP4U45C/H2y1t3A/vJq
 JJBC/bWXBNNsd+UioeWnkhG0PrBhj/QshGqHSPyCqQS+SG/LWKDyHJp6lsbvufxNqU8G43mfsHz9P
 x794YioB48wkxYGLKOQGtkmR7FVn/lw2qXMlXnpP5K6JFgx4PQb4hqpSq1Ah5nt0IStV4hcPnhPTt
 lwBq5rLQ==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwpyQ-00D36E-Mc; Mon, 13 Dec 2021 18:22:55 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 3C36B405D8; Mon, 13 Dec 2021 15:22:52 -0300 (-03)
Date: Mon, 13 Dec 2021 15:22:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: German Gomez <german.gomez@arm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/4] perf script: Add "struct machine" parameter to
 process_event callback
Message-ID: <YbePfOMaiJjoDb3b@kernel.org>
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-3-german.gomez@arm.com>
 <D6A3A8F3-9946-44FE-A70F-42977C6F38A1@linux.vnet.ibm.com>
 <38fd4992-63ae-4871-ddfd-27d40b5c48d2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38fd4992-63ae-4871-ddfd-27d40b5c48d2@arm.com>
X-Url: http://acmel.wordpress.com
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

RW0gRnJpLCBEZWMgMDMsIDIwMjEgYXQgMTI6MDA6MjZQTSArMDAwMCwgR2VybWFuIEdvbWV6IGVz
Y3JldmV1Ogo+IEhpIEF0aGlyYSwKPiAKPiBPbiAwMi8xMi8yMDIxIDE2OjAzLCBBdGhpcmEgUmFq
ZWV2IHdyb3RlOgo+ID4KPiA+PiBPbiAwMS1EZWMtMjAyMSwgYXQgNjowMyBQTSwgR2VybWFuIEdv
bWV6IDxnZXJtYW4uZ29tZXpAYXJtLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBJbmNsdWRlIGEgInN0
cnVjdCBtYWNoaW5lKiIgcGFyYW1ldGVyIHRvIHRoZSBwcm9jZXNzX2V2ZW50IGNhbGxiYWNrIGlu
Cj4gPj4gdGhlIHNjcmlwdGluZyBsYXllci4gVGhpcyB3aWxsIGFsbG93IGFjY2VzcyB0byB0aGUg
cGVyZl9lbnYgZnJvbSB3aXRoaW4KPiA+PiB0aGlzIGNhbGxiYWNrLgo+ID4+Cj4gPj4gRm9sbG93
dXAgcGF0Y2hlcyB3aWxsIGJ1aWxkIG9uIHRvcCBvZiB0aGlzIHRvIHJlcG9ydCB0aGUgY29ycmVj
dCBuYW1lIG9mCj4gPj4gdGhlIHJlZ2lzdGVycyBpbiBhIHBlcmYuZGF0YSBmaWxlLCBjb25zaXN0
ZW50bHkgd2l0aCB0aGUgYXJjaGl0ZWN0dXJlCj4gPj4gdGhlIGZpbGUgd2FzIHJlY29yZGVkIGlu
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogR2VybWFuIEdvbWV6IDxnZXJtYW4uZ29tZXpAYXJt
LmNvbT4KPiA+PiAtLS0KPiA+PiB0b29scy9wZXJmL2J1aWx0aW4tc2NyaXB0LmMgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQo+ID4+IC4uLi91dGlsL3NjcmlwdGluZy1lbmdpbmVzL3RyYWNlLWV2
ZW50LXBlcmwuYyB8ICAzICsrLQo+ID4+IC4uLi9zY3JpcHRpbmctZW5naW5lcy90cmFjZS1ldmVu
dC1weXRob24uYyAgICB8IDIzICsrKysrKysrKysrLS0tLS0tLS0KPiA+PiB0b29scy9wZXJmL3V0
aWwvdHJhY2UtZXZlbnQtc2NyaXB0aW5nLmMgICAgICAgfCAgMyArKy0KPiA+PiB0b29scy9wZXJm
L3V0aWwvdHJhY2UtZXZlbnQuaCAgICAgICAgICAgICAgICAgfCAgMyArKy0KPiA+PiA1IGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYnVpbHRpbi1zY3JpcHQuYyBiL3Rvb2xzL3BlcmYvYnVpbHRp
bi1zY3JpcHQuYwo+ID4+IGluZGV4IDk0MzQzNjdhZi4uNzExMTMyZjBiIDEwMDY0NAo+ID4+IC0t
LSBhL3Rvb2xzL3BlcmYvYnVpbHRpbi1zY3JpcHQuYwo+ID4+ICsrKyBiL3Rvb2xzL3BlcmYvYnVp
bHRpbi1zY3JpcHQuYwo+ID4+IEBAIC0yMjU2LDcgKzIyNTYsNyBAQCBzdGF0aWMgaW50IHByb2Nl
c3Nfc2FtcGxlX2V2ZW50KHN0cnVjdCBwZXJmX3Rvb2wgKnRvb2wsCj4gPj4gCQkJCXRocmVhZF9f
cmVzb2x2ZShhbC50aHJlYWQsICZhZGRyX2FsLCBzYW1wbGUpOwo+ID4+IAkJCWFkZHJfYWxfcHRy
ID0gJmFkZHJfYWw7Cj4gPj4gCQl9Cj4gPj4gLQkJc2NyaXB0aW5nX29wcy0+cHJvY2Vzc19ldmVu
dChldmVudCwgc2FtcGxlLCBldnNlbCwgJmFsLCBhZGRyX2FsX3B0cik7Cj4gPj4gKwkJc2NyaXB0
aW5nX29wcy0+cHJvY2Vzc19ldmVudChldmVudCwgc2FtcGxlLCBldnNlbCwgJmFsLCBhZGRyX2Fs
X3B0ciwgbWFjaGluZSk7Cj4gPiBIaSwKPiA+Cj4gPiBMb29rcyBsaWtlIHRoZSBwYXRjaCBpcyB1
c2luZyDigJxtYWNoaW5l4oCdIHRvIGFsbG93IGFjY2VzcyB0byBwZXJmX2Vudl9fYXJjaCBhbmQg
dGhlcmUgYnkgdG8gZ2V0IHRoZSDigJxhcmNo4oCdIHZhbHVlLgo+ID4gQnV0IGNhbiB3ZSB1c2Ug
ZnJvbSBldnNlbCwgbGlrZSAgInBlcmZfZW52X19hcmNoKGV2c2VsX19lbnYoZXZzZWwpKeKAnSB0
byBnZXQgYXJjaCB2YWx1ZSBpbnN0ZWFkIG9mIGluY2x1ZGluZyBuZXcgcGFyYW1ldGVyIGZvciDi
gJxzdHJ1Y3QgbWFjaGluZeKAnSA/Cj4gPgo+ID4gVGhhbmtzCj4gPiBBdGhpcmEKPiAKPiBUaGFu
a3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBJdCBsb29rcyBsaWtlIHdlIGNhbiBza2lwIHRoaXMgcGF0
Y2ggaWYgd2UKPiBjYW4gZ2V0IHRoZSBhcmNoIHZhbHVlIHRoYXQgd2F5LgoKU28gdGhlIGZpcnN0
IG9uZSBpcyBhbHJlYWR5IHVwc3RyZWFtLCB3aWxsIHlvdSBwb3N0IGEgdjI/CgotIEFybmFsZG8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
