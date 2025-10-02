Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D372CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 12:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjZPbWd7Tf/7Iu27OZcgnmllY9u6FgO4CHrVv/PtKp4=; b=okQLw84kpVh7yh
	/PTM9WjFlR+oa8MdWxKmuJ8yz3WgHNhc1kPdh8imeygxNM68HwrhUDBO+8yjzdk3OFkSOyno1sgkq
	A3kKxbWW33RVlwdPdHmf2Ql/Q2dX7uoHTFE6DWqyJj/qxDozP4w6l//uSc4eZnMqso7w2zpbMkYz8
	Y1D6D8lAnUrbvgcJLesFKD3n7EMrhhUdY40u7fGdikhxYFxzDoxsEoO4Lq1/30AuKsaaukCYb+bAP
	MADvUDqRfYkMm5736biTArqezELPCXlVvcm7VQr6eyhRt9hcVCtt3JUZlWM5ElZOrHCBNUHX6Tvl3
	am/X6Ftkws8JtdXOApbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ik8-0000000ATYv-2sPv;
	Thu, 02 Oct 2025 12:49:08 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ik5-0000000ATYS-3PJA
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 12:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QEH3pN+BQ/qdHz36ORaSzBuUuVBfDvWQjuII3QxZO2s=; b=jD3VPsxAhoILjRxyk1I37RqhtR
	R/s4pTQdrO7vo+CUwjbnI7PGg0CnT3w2cyK2u5ob6nKPtc2xlFQpJJ7j907/tTJywfXMw9FUdBNy1
	1Vbpwnzqmc9k5Z4qZhmHTeyT1LD3Ph2YuNp/BfkSmNyBT3N4/F/w8od20iypIOGeMnEABe4uSGgfX
	NAWxXJHji4svOIO5dmtxguFhLShA0mn706+QFYh0WRAIJEpoDykTC+ruT8c/MzMDR/D1hmubB5OlA
	yu5gVVsU6R86hJNkjakosszA823ps/vw+3HNR2nS4sflHxSnAc3CS7cUqEafYCy3thuxRc3pTRZI6
	UhZXdrmg==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1v4Ijn-00AxWJ-IX; Thu, 02 Oct 2025 13:48:47 +0100
Message-ID: <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
Date: Thu, 2 Oct 2025 13:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_054905_937566_3983C6FE 
X-CRM114-Status: GOOD (  18.45  )
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

T24gMzAvMDkvMjAyNSAxNzowNCwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24gVHVlLCAzMCBT
ZXB0IDIwMjUgYXQgMDA6MjUsIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4g
d3JvdGU6Cj4+Cj4+IElzIHRoZXJlIGFueSBjaGFuY2Ugc29tZSBvZiB0aGUgYmlnLWVuZGlhbiB3
b3JrIHdlIGRpZCBpcyBnZXR0aW5nIGluCj4+IGZvciB0aGlzIHJvdW5kPwo+IAo+IE9oIENocmlz
dC4gSXMgc29tZWJvZHkgc2VyaW91c2x5IHdvcmtpbmcgb24gQkUgc3VwcG9ydCBpbiAyMDI1Pwo+
IAo+IFdIWT8KPiAKPiBTZXJpb3VzbHksIHRoYXQgc291bmRzIGxpa2UganVzdCAqc3R1cGlkKi4g
SXMgdGhlcmUgc29tZSBhY3R1YWwgcmVhbAo+IHJlYXNvbiBmb3IgdGhpcywgb3IgaXMgaXQgbW9y
ZSBvZiB0aGUgIlJJU0MtViBpcyB1c2VkIGluIGFjYWRlbWljCj4gZGVzaWduIGNsYXNzZXMgYW5k
IHNvIHBlb3BsZSBqdXN0IHdhbnQgdG8gZG8gZW5kaWFubmVzcyBmb3IgYWNhZGVtaWMKPiByZWFz
b25zIj8KPiAKPiBCZWNhdXNlIEknZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8ganVzdCBkcmF3IGEg
bGluZSBpbiB0aGUgc2FuZCBhbmQgc2F5Cj4gIk5ldyBlbmRpYW5uZXNzIHByb2JsZW1zIGFyZSBz
b21lYm9keSBFTFNFUyBwcm9ibGVtIiwgYW5kIHRlbGwgcGVvcGxlCj4gdG8gc3RvcCBiZWluZyBz
aWxseS4KPiAKPiBMZXQncyBub3QgY29tcGxpY2F0ZSB0aGluZ3MgZm9yIG5vIGdvb2QgcmVhc29u
LiBBbmQgdGhlcmUgaXMgKk5PKgo+IHJlYXNvbiB0byBhZGQgbmV3IGVuZGlhbm5lc3MuCgpXZSBm
aXJzdCB0YWNrbGVkIGJpZy1lbmRpYW4gc3VwcG9ydCBvbiBBUk0zMiBuZWFybHkgMTUgeWVhcnMg
YWdvLCBhbmQgCmRyYXdpbmcgb24gdGhhdCBleHBlcmllbmNlLCB3ZSBzYXcgdmFsdWUgaW4gZG9p
bmcgdGhlIHNhbWUgd29yayBvbiAKUklTQy1WIGFzIGEgd2F5IGZvciBuZXdlciBlbmdpbmVlcnMg
dG8gZ2FpbiBoYW5kcy1vbiBleHBlcmllbmNlIApjb250cmlidXRpbmcgaW4gdGhlIG9wZW4uCgpO
b3cgd2XigJlyZSBzdGFydGluZyB0byBzZWUgY29tbWVyY2lhbCBjb3JlcyBvbiB0aGUgaG9yaXpv
biB0aGF0IHdpbGwgaGF2ZSAKdGhlIGFiaWxpdHkgdG8gYmUgZW5kaWFuIGNvbmZpZ3VyZWQgYXQg
cnVuLXRpbWUuIEZvciBleGFtcGxlLCBNSVBTICh0aGUgCmNvbXBhbnkgbm90IHRoZSBJU0EpIGhh
cyBhbm5vdW5jZWQgdGhleSB3aWxsIGJlIHByb2R1Y2luZyBjb3JlcyB3aXRoIApjb25maWd1cmFi
bGUgZW5kaWFuIChodHRwczovL21pcHMuY29tL3Byb2R1Y3RzL2hhcmR3YXJlL2k4NTAwLykuCgpO
b3RlIHNvbWUgb2YgdGhlIHBhdGNoZXMgd2UgYXJlIHByb3Bvc2luZyBhbHNvIG1ha2UgdGhlIGNv
ZGUgYmV0dGVyLCAKc3VjaCBhcyBzd2FwcGluZyAud29yZCBmb3IgLmluc24uCgo+IFJJU0MtViBp
cyBlbm91Z2ggb2YgYSBtZXNzIHdpdGggdGhlIG1pbGxpb25zIG9mIHNpbGx5IGNvbmZpZ3VyYXRp
b24KPiBpc3N1ZXMgYWxyZWFkeS4gRG9uJ3QgbWFrZSBpdCBldmVuIHdvcnNlLgoKVGhpcyBmZWVs
cyBsaWtlIHRoZSBwcmljZSB5b3UgcGF5IGZvciBtYWtpbmcgYSBmbGV4aWJsZSBhbmQgZnJlZSAK
ZWNvc3lzdGVtIHRvIGJ1aWxkIGNvcmVzLiBUaGVyZSBpcyBubyBzaW5nbGUgYXV0aG9yaXR5IG1h
a2luZyB5b3UgdXNlIApldmVyeSBmZWF0dXJlIHRoYXQgbWlnaHQgYmUgc3BlY2lmaWVkIChhbHRo
b3VnaCBVYnVudHUncyBjaG9pY2UgdG8gbW92ZSAKZm9yd2FyZCB3aXRoIFJWQTMyIGZvciBmdXR1
cmUgaXMgYSBjdXJyZW50IHBhaW4gZm9yIGFueW9uZSB3aG8gYWxyZWFkeSAKaGFzIHB1cmNoYXNl
ZCBoYXJkd2FyZSkuCgpTZWUgaW5pdGlhbCByZXBseSBmb3IgY29tbWVudCBvbiBNSVBTLiBXZSBh
bHNvIGRvbid0IHRoaW5rIHRoaXMgYSBodWdlIApjaGFuZ2UgYW5kIGdpdmVuIG1vc3QgcHJvamVj
dHMgd2Ugd29ya2VkIHRocm91Z2ggaGFkIGZldyAoaWYgYW55KSBpc3N1ZXMgCndpdGggYnVpbGRp
bmcgYmlnIGVuZGlhbiwgd2UgdGhvdWdodCBpdCB3YXMgd29ydGggaGF2aW5nIGFuIGF0dGVtcHQg
YXQgdGhpcy4KCj4gVGVsbCBwZW9wbGUgdG8ganVzdCB0YWxrIHRvIHRoZWlyIHRoZXJhcGlzdHMg
aW5zdGVhZC4gIFRoYXQncyAqbXVjaCoKPiBtb3JlIHByb2R1Y3RpdmUuCgoKVGhhbmtzLCBidXQg
dGhhdCBpc24ndCBoZWxwZnVsIGFuZCBpcyBqdXN0IG1ha2luZyB0aGUga2VybmVsIGxvb2sgbW9y
ZSAKdG94aWMuIEkgYW0gaG93ZXZlciBnb2luZyB0byB3ZWFyIHRoZSAiSSBnb3QgcmFudGVkIGF0
IGJ5IExpbnVzIGFuZCAKc3Vydml2ZWQiIHRhZyB3aXRoIHByaWRlLgoKCj4gUmVhbGx5Lgo+IAo+
ICAgICAgICAgICAgICAgTGludXMKPiAKCgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29k
ZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdl
bml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
