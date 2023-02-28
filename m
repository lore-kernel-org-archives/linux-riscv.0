Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2B2C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOUOXZTiqBHgnubctaWuBIgGw1wkzD4G+7PeS/qDq3c=; b=FSIb55baLw0KZh
	j+/G0ZX2/iIrLN1ox4+VBN4Bt+87KCADyxi2uOJ/CclRll6bpzZjjOALJJRxIhS8HiWTlPo8RB6WK
	27FY4A2bETAvnBt0QKyonargthxDR56euArYj/bf+AQlKsBJMTFd6n0CQ60ChKW21bO4XN63hb2XB
	WFb7Ma1A77MsC1SI1DgU+hX85X8PFuYfoJw0xAoV8VEqzlCCbkoNhY4x1UXrTsJyEm/njXH/k1Khf
	XYe+fDHahr1OzO3gs8pFb8TwiOCxqJB7B8k6KNtVzNKB52lanZt5KDKgoqYCJb57DzBm584/5cY3N
	j93YkPPLj9JGl4Y9s5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5rC-00E7a4-80; Tue, 28 Feb 2023 19:41:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5r9-00E7ZA-PH
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:41:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5484461121;
	Tue, 28 Feb 2023 19:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF49C433EF;
	Tue, 28 Feb 2023 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677613306;
	bh=BMQdfd3eRr3TPshF8G54Soj/A6ce3hCs7scIFRDGRqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VN+aWHVQFrXnXYLlcw/Pp3DlwXoG+MTLyCwtIK1maiv+x0D3khZ1qHjF+nvrhnTpx
	 bH0FU8YYK1659K9X+8Ca9KUFl/QQuxa5D/Z6IOi9UNBo5rjFIS/6JJ4/QmvkvywATU
	 Os3EA2u4paXOZBu4dtdHiaLqkg3tktZ/5zfINiTHB8nAsuItV2p0dBJOylw7yQJhm3
	 Tl15GdyeQhrWdjZ+0AVTE5axigcY/LhGMwePs161MU5ehnEo6w2bcOjlRG2EhZu34p
	 Zpa6iEZxaGSV3HRYYbinQY+ebGp0kpMR02FzbDkzEJf/qszsAKkeRFsKp5xrYIs8wN
	 5bIediAeW30+w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Christoph Muellner
 <christoph.muellner@vrull.eu>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Conor Dooley
 <conor.dooley@microchip.com>, Guenter Roeck <linux@roeck-us.net>, Andrew
 Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
In-Reply-To: <Y/5SJc1AlfnY/l3l@spud>
References: <20230228184211.1585641-1-bjorn@kernel.org> <Y/5SJc1AlfnY/l3l@spud>
Date: Tue, 28 Feb 2023 20:41:44 +0100
Message-ID: <87k001fuh3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_114147_882798_467CB8F9 
X-CRM114-Status: GOOD (  11.11  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIFR1ZSwgRmViIDI4
LCAyMDIzIGF0IDA3OjQyOjEwUE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZyb206
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IFRoZSBaYmIgb3B0aW1p
emVkIHN0cm5jbXAgaGFzIHR3byBwYXJ0czsgYSBmYXN0IHBhdGggdGhhdCBkb2VzIFhMRU4vOEIK
Pj4gcGVyIGl0ZXJhdGlvbiwgYW5kIGEgc2xvdyB0aGF0IGRvZXMgb25lIGJ5dGUgcGVyIGl0ZXJh
dGlvbi4KPj4gCj4+IFRoZSBpZGVhIGlzIHRvIGNvbXBhcmUgYWxpZ25lZCBYTEVOIGNodW5rcyBm
b3IgbW9zdCBvZiBzdHJpbmdzLCBhbmQgZG8KPj4gdGhlIHJlbWFpbmRlciB0YWlsIGluIHRoZSBz
bG93IHBhdGguCj4+IAo+PiBUaGUgWmJiIHN0cm5jbXAgaGFzIHR3byBpc3N1ZXMgaW4gdGhlIGZh
c3QgcGF0aDoKPj4gCj4+IEluY29ycmVjdCByZW1haW5kZXIgaGFuZGxpbmcgKHdyb25nIGNvbXBh
cmUpOiBBc3N1bWUgdGhhdCB0aGUgc3RyaW5nCj4+IGxlbmd0aCBpcyA5LiBPbiA2NGIgc3lzdGVt
cywgdGhlIGZhc3QgcGF0aCBzaG91bGQgZG8gb25lIGl0ZXJhdGlvbiwKPj4gYW5kIG9uZSBpdGVy
YXRpb24gaW4gdGhlIHNsb3cgcGF0aC4gSW5zdGVhZCwgYm90aCB3ZXJlIGRvbmUgaW4gdGhlCj4+
IGZhc3QgcGF0aCwgd2hpY2ggbGVhZCB0byBpbmNvcnJlY3QgcmVzdWx0cy4gQW4gZXhhbXBsZToK
Pj4gCj4+ICAgc3RybmNtcCgiL2Rldi92ZGEiLCAiL2Rldi8iLCA1KTsKPj4gCj4+IENvcnJlY3Qg
YnkgY2hhbmdpbmcgImJndCIgdG8gImJnZSIuCj4+IAo+PiBNaXNzaW5nIE5VTEwgY2hlY2tzIGlu
IHRoZSBzZWNvbmQgc3RyaW5nOiBUaGlzIGNvdWxkIGxlYWQgdG8gaW5jb3JyZWN0Cj4+IHJlc3Vs
dHMgZm9yOgo+PiAKPj4gICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2L3ZkYVwwIiwgOCk7Cj4+
IAo+PiBDb3JyZWN0IGJ5IGFkZGluZyBhbiBhZGRpdGlvbmFsIGNoZWNrLgo+PiAKPj4gRml4ZXM6
IGI2ZmNkYjE5MWUzNiAoIlJJU0MtVjogYWRkIHpiYiBzdXBwb3J0IHRvIHN0cmluZyBmdW5jdGlv
bnMiKQo+PiBTdWdnZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVs
bC5ldT4KPj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Cj4gV2l0aCB5b3VyIG5ldyBzZWxmdGVzdCBzdHVmZiAmIG9uIGEgSkg3MTEwOgo+IFRlc3Rl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBBbHNvLCBn
aXZlbiB0aGUgcmVwb3J0ZXIsIHRoaXMgc2hvdWxkIGJlOgo+IFJlcG9ydGVkLWJ5OiBHdWVudGVy
IFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gbm8/CgpJbmRlZWQuIFNvcnJ5LCBHdWVudGVy
LCBmb3IgbWlzc2luZyB0aGF0IQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
