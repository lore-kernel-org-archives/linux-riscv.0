Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A0C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWkLpxamlV2lz6QjGxSWPwnL7EFTYAZGHLI5EVGIqoc=; b=dDjZ32ALO7uC5j
	gIUaRWQBrt/1E4jhqZDmgHrvIR41BBARd6urfgS1z/26Vb/vDv3cdNkbYM060uu1/7kMresK/g6/Q
	bErJ57BYLK9ermQaDMLtRrdWyOocGsi8fIIHOSsjNXznLoG7USdTXDDnRUfYQYYHHkYkiNbQ+kI/q
	qQlaB3z6n1MPu1d+dL9gxJm10mz+Y5qieQUA0+fIC2ILYMOSh01zpgeD3YCklLRAWC2ZnUzvtMIUR
	ljDqX8bpadi9KB3RQL6hQ70+CvQLkC8jlveVX2CuarnIY9sBcjR+u+EsSAB5gFo/u+uJm19MOVNYG
	XpGcraOuqJJVWkBI2b9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9Ca-005iu2-25;
	Wed, 19 Apr 2023 14:54:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9CX-005itQ-0S;
	Wed, 19 Apr 2023 14:54:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4502763DF1;
	Wed, 19 Apr 2023 14:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31284C4339B;
	Wed, 19 Apr 2023 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681916066;
	bh=K7L77fXIx/AW5YbmsAG7ay6yVgjlxRqJ7wqR/qYv+0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rUPaZs/8QZI8lF1os5IMYRE3kYvuns4ArF/TTmgLqKn+SBFgdJHLDbs0RqVqivXUe
	 M6Rm88B214jyRz1wb3OPcgHqjzL18xucaNApNTz1/XR7N7tiqcvW0uYz3mbwep4w2l
	 Ds728ndZU149nrHH7E9u3JkzzAoJdBFcJ9Crs+JKuXpXCigVbe0HLYMb3fZJaf4p6Q
	 OotGCZy/Uze+TnsUVGnCsrO4vz5nRjuDwNWmkNJRdnnCRA/mQEKehf5fUgY+1aP9cD
	 91m0uEuccEY5AFRgByi83HIyk7OsbPryC8OqLPo8Ulv9BkCAdX1UoYbCqqLd5Uyz7s
	 8Rx6UXBQIqhpw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, GNU C Library <libc-alpha@sourceware.org>,
 Andrew Waterman <andrew@sifive.com>
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <87cz4048rp.fsf@all.your.base.are.belong.to.us>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <87cz4048rp.fsf@all.your.base.are.belong.to.us>
Date: Wed, 19 Apr 2023 16:54:23 +0200
Message-ID: <87leinq5wg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_075429_279768_A5481A55 
X-CRM114-Status: GOOD (  26.76  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cj4KPj4gVGhpcyBwYXRjaHNldCBpcyBpbXBsZW1l
bnRlZCBiYXNlZCBvbiB2ZWN0b3IgMS4wIHNwZWMgdG8gYWRkIHZlY3RvciBzdXBwb3J0Cj4+IGlu
IHJpc2N2IExpbnV4IGtlcm5lbC4gVGhlcmUgYXJlIHNvbWUgYXNzdW1wdGlvbnMgZm9yIHRoaXMg
aW1wbGVtZW50YXRpb25zLgo+Pgo+PiAxLiBXZSBhc3N1bWUgYWxsIGhhcnRzIGhhcyB0aGUgc2Ft
ZSBJU0EgaW4gdGhlIHN5c3RlbS4KPj4gMi4gV2UgZGlzYWJsZSB2ZWN0b3IgaW4gYm90aCBrZXJu
ZWwgYW5kIHVzZXIgc3BhY2UgWzFdIGJ5IGRlZmF1bHQuIE9ubHkKPj4gICAgZW5hYmxlIGFuIHVz
ZXIncyB2ZWN0b3IgYWZ0ZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwIHdoZXJlIGl0Cj4+
ICAgIGFjdHVhbGx5IHN0YXJ0cyBleGVjdXRpbmcgdmVjdG9yICh0aGUgZmlyc3QtdXNlIHRyYXAg
WzJdKS4KPj4gMy4gV2UgZGV0ZWN0ICJyaXNjdixpc2EiIHRvIGRldGVybWluZSB3aGV0aGVyIHZl
Y3RvciBpcyBzdXBwb3J0IG9yIG5vdC4KPj4KPj4gV2UgZGVmaW5lZCBhIG5ldyBzdHJ1Y3R1cmUg
X19yaXNjdl92X2V4dF9zdGF0ZSBpbiBzdHJ1Y3QgdGhyZWFkX3N0cnVjdCB0bwo+PiBzYXZlL3Jl
c3RvcmUgdGhlIHZlY3RvciByZWxhdGVkIHJlZ2lzdGVycy4gSXQgaXMgdXNlZCBmb3IgYm90aCBr
ZXJuZWwgc3BhY2UKPj4gYW5kIHVzZXIgc3BhY2UuCj4+ICAtIEluIGtlcm5lbCBzcGFjZSwgdGhl
IGRhdGFwIHBvaW50ZXIgaW4gX19yaXNjdl92X2V4dF9zdGF0ZSB3aWxsIGJlCj4+ICAgIGFsbG9j
YXRlZCB0byBzYXZlIHZlY3RvciByZWdpc3RlcnMuCj4+ICAtIEluIHVzZXIgc3BhY2UsCj4+IAkt
IEluIHNpZ25hbCBoYW5kbGVyIG9mIHVzZXIgc3BhY2UsIHRoZSBzdHJ1Y3R1cmUgaXMgcGxhY2Vk
Cj4+IAkgIHJpZ2h0IGFmdGVyIF9fcmlzY3ZfY3R4X2hkciwgd2hpY2ggaXMgZW1iZWRkZWQgaW4g
ZnAgcmVzZXJ2ZWQKPj4gCSAgYWVyYS4gVGhpcyBpcyByZXF1aXJlZCB0byBhdm9pZCBBQkkgYnJl
YWsgWzJdLiBBbmQgZGF0YXAgcG9pbnRzCj4+IAkgIHRvIHRoZSBlbmQgb2YgX19yaXNjdl92X2V4
dF9zdGF0ZS4KPj4gCS0gSW4gcHRyYWNlLCB0aGUgZGF0YSB3aWxsIGJlIHB1dCBpbiB1YnVmIGlu
IHdoaWNoIHdlIHVzZQo+PiAJICByaXNjdl92cl9nZXQoKS9yaXNjdl92cl9zZXQoKSB0byBnZXQg
b3Igc2V0IHRoZQo+PiAJICBfX3Jpc2N2X3ZfZXh0X3N0YXRlIGRhdGEgc3RydWN0dXJlIGZyb20v
dG8gaXQsIGRhdGFwIHBvaW50ZXIKPj4gCSAgd291bGQgYmUgemVyb2VkIGFuZCB2ZWN0b3IgcmVn
aXN0ZXJzIHdpbGwgYmUgY29waWVkIHRvIHRoZQo+PiAJICBhZGRyZXNzIHJpZ2h0IGFmdGVyIHRo
ZSBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHN0cnVjdHVyZSBpbiB1YnVmLgo+Pgo+PiBUaGlzIHBhdGNo
c2V0IGlzIHJlYmFzZWQgdG8gdjYuMy1yYzEgYW5kIGl0IGlzIHRlc3RlZCBieSBydW5uaW5nIHNl
dmVyYWwKPj4gdmVjdG9yIHByb2dyYW1zIHNpbXVsdGFuZW91c2x5LiBJdCBkZWxpdmVycyBzaWdu
YWxzIGNvcnJlY3RseSBpbiBhIHRlc3QKPj4gd2hlcmUgd2UgY2FuIHNlZSBhIHZhbGlkIHVjb250
ZXh0X3QgaW4gYSBzaWduYWwgaGFuZGxlciwgYW5kIGEgY29ycmVjdCBWCj4+IGNvbnRleHQgcmV0
dXJpbmcgYmFjayBmcm9tIGl0LiBBbmQgdGhlIHB0cmFjZSBpbnRlcmZhY2UgaXMgdGVzdGVkIGJ5
Cj4+IFBUUkFDRV97R0VULFNFVH1SRUdTRVQuIExhc3RseSwgS1ZNIGlzIHRlc3RlZCBieSBydW5u
aW5nIGFib3ZlIHRlc3RzIGluCj4+IGEgZ3Vlc3QgdXNpbmcgdGhlIHNhbWUga2VybmVsIGltYWdl
LiBBbGwgdGVzdHMgYXJlIGRvbmUgb24gYW4gcnY2NGdjdgo+PiB2aXJ0IFFFTVUuCj4+Cj4+IE5v
dGU6IHBsZWFzZSBhcHBseSB0aGUgcGF0Y2ggYXQgWzRdIGR1ZSB0byBhIHJlZ3Jlc3Npb24gaW50
cm9kdWNlZCBieQo+PiBjb21taXQgNTk2ZmY0YTA5Yjg5ICgiY3B1bWFzazogcmUtaW50cm9kdWNl
IGNvbnN0YW50LXNpemVkIGNwdW1hc2sKPj4gb3B0aW1pemF0aW9ucyIpIGJlZm9yZSB0ZXN0aW5n
IHRoZSBzZXJpZXMuCj4+Cj4+IFNvdXJjZSB0cmVlOgo+PiBodHRwczovL2dpdGh1Yi5jb20vc2lm
aXZlL3Jpc2N2LWxpbnV4L3RyZWUvcmlzY3YvZm9yLW5leHQvdmVjdG9yLXYxOAo+Cj4gQWZ0ZXIg
c29tZSBvZmZsaXN0IGRpc2N1c3Npb25zLCB3ZSBtaWdodCBoYXZlIGEgaWRlbnRpZmllZCBhCj4g
cG90ZW50aWFsIGxpYmMtPmFwcGxpY2F0aW9uIEFCSSBicmVhay4KPgo+IEdpdmVuIGFuIGFwcGxp
Y2F0aW9uIHRoYXQgZG9lcyBjdXN0b20gdGFzayBzY2hlZHVsaW5nIHZpYSBhIHNpZ25hbAo+IGhh
bmRsZXIuIFRoZSBhcHBsaWNhdGlvbiBiaW5hcnkgaXMgbm90IHZlY3RvciBhd2FyZSwgYnV0IGxp
YmMgaXMuIExpYmMKPiBpcyB1c2luZyB2ZWN0b3IgcmVnaXN0ZXJzIGZvciBtZW1jcHkuIEl0J3Mg
YW4gIm9sZCBhcHBsaWNhdGlvbiwgbmV3Cj4gbGlicmFyeSwgbmV3IGtlcm5lbCItc2NlbmFyaW8u
Cj4KPiAgfCAuLi4KPiAgfCBzdHJ1Y3QgY29udGV4dCAqcDFfY3R4Owo+ICB8IHN0cnVjdCBjb250
ZXh0ICpwMl9jdHg7Cj4gIHwgCj4gIHwgdm9pZCBzaWdoYW5kbGVyKGludCBzaWcsIHNpZ2luZm9f
dCAqaW5mbywgdm9pZCAqdWNvbnRleHQpCj4gIHwgewo+ICB8ICAgaWYgKHAxX3J1bm5pbmcpCj4g
IHwgICAgIHN3aXRjaF90byhwMV9jdHgsIHAyX2N0eCk7Cj4gIHwgICBpZiAocDJfcnVubmluZykK
PiAgfCAgICAgc3dpdGNoX3RvKHAyX2N0eCwgcDFfY3R4KTsKPiAgfCB9Cj4gIHwgCj4gIHwgdm9p
ZCBwMSh2b2lkKQo+ICB8IHsKPiAgfCAgIG1lbWNweShmb28sIGJhciwgMTcpOwo+ICB8IH0KPiAg
fCAKPiAgfCB2b2lkIHAyKHZvaWQpCj4gIHwgewo+ICB8ICAgLi4uCj4gIHwgfQo+ICB8IC4uLgo+
Cj4gVGhlIHN3aXRjaF90bygpIGZ1bmN0aW9uIHNjaGVkdWxlcyBwMSgpIGFuZCBwMigpLiBFLmcu
LCB0aGUKPiBhcHBsaWNhdGlvbiAoYXNzdW1lcyB0aGF0IGl0KSBzYXZlcyB0aGUgY29tcGxldGUg
dGFzayBzdGF0ZSBmcm9tCj4gc2lnY29udGV4dCAodWNvbnRleHQpIHRvIHAxX2N0eCwgYW5kIHJl
c3RvcmVzIHNpZ2NvbnRleHQgdG8gcDJfY3R4LCBzbwo+IHdoZW4gc2lncmV0dXJuIGlzIGNhbGxl
ZCwgcDIoKSBpcyBydW5uaW5nLCBhbmQgcDEoKSBoYXMgYmVlbgo+IGludGVycnVwdGVkLgo+Cj4g
VGhlICJvbGQgYXBwbGljYXRpb24iIHdoaWNoIGlzIG5vdCBhd2FyZSBvZiB2ZWN0b3IsIGlzIG5v
dyBydW4gb24gYQo+IHZlY3RvciBlbmFibGVkIGtlcm5lbC9nbGliYy4KPgo+IEFzc3VtZSB0aGF0
IHRoZSBzaWdoYW5kbGVyIGlzIGhpdCwgYW5kIHAxKCkgaXMgaW4gdGhlIG1pZGRsZSBvZiB0aGUK
PiB2ZWN0b3IgbWVtY3B5LiBUaGUgc3dpdGNoX3RvKCkgZnVuY3Rpb24gd2lsbCBub3Qgc2F2ZSB0
aGUgdmVjdG9yCj4gc3RhdGUsIGFuZCBuZXh0IHRpbWUgcDIoKSBpcyBzY2hlZHVsZWQgdG8gcnVu
IGl0IHdpbGwgaGF2ZSBpbmNvcnJlY3QKPiBtYWNoaW5lIHN0YXRlLgo+Cj4gTm93Ogo+Cj4gSXMg
dGhpcyBhbiBhY3R1YWwgb3IgdGhlb3JldGljYWwgcHJvYmxlbSAoaS5lLiBhcmUgdGhlcmUgYW55
Cj4gYXBwbGljYXRpb25zIGluIHRoZSB3aWxkKT8gSSdkIGJlIHN1cnByaXNlZCBpZiBpdCB3b3Vs
ZCBub3QgYmUgdGhlCj4gbGF0dGVyLi4uCj4KPiBSZWdhcmRsZXNzLCBhIGtlcm5lbCBrbm9iIGZv
ciBkaXNhYmxpbmcgdmVjdG9yIChzeXNjdGwvcHJjdGwpIHRvIGF2b2lkCj4gdGhlc2Uga2luZCBv
ZiBicmVha3MgaXMgbmVlZGVkIChyaWdodD8pLiBDb3VsZCB0aGlzIGtub2IgYmUgYQo+IGZvbGxv
dy11cCBwYXRjaCB0byB0aGUgZXhpc3RpbmcgdjE4IHNlcmllcz8KPgo+IE5vdGUgdGhhdCBhcm02
NCBkb2VzIG5vdCBzdWZmZXIgZnJvbSB0aGlzIHdpdGggU1ZFLCBiZWNhdXNlIHRoZSBkZWZhdWx0
Cj4gdmVjdG9yIGxlbmd0aCAodmw9PTAvMTI4YiozMikgZml0cyBpbiB0aGUgImxlZ2FjeSIgc2ln
Y29udGV4dC4KCkFuZHksIHRvIGNsYXJpZnkgZnJvbSB0aGUgcGF0Y2h3b3JrIGNhbGw7IEluCkRv
Y3VtZW50YXRpb24vYXJtNjQvc3ZlLnJzdDoKClRoZXJlJ3MgYSBwZXItcHJvY2VzcyBwcmN0bCAo
c2VjdGlvbiA2KSwgYW5kIGEgc3lzdGVtIHJ1bnRpbWUgY29uZgooc2VjdGlvbiA5KS4KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
