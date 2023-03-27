Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781EC7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOrBfI33pormtsWVASV9uaIhJ/hAgBdxDWID5oKFdDA=; b=EFeXhSO5F6sXYy
	9tO2k9gd5lN3TvvlJ2FiTExhv36kU4zg4zB3vDXKDj5WHRq6jCWcnsIuIEVCXSYB0/pUiAvSWgJSx
	U8iWD+Mf8qL8QTbBWHSC6uL55v3N/3ZLPdcD/eehwjws1MTNSARy+qjcS4HauV0EIf8ja5gYVg8Pd
	JMhoPmFlSwn1KHMZodgnhmIQqSXcUZ986RfOq5ZUDvmipdxD+6eYMg1/lbND7QEXWohRqm6A7rUZy
	9zwJ3o8i963ajT9AR5f3ASpVUtVzEmtz+GOimv+MlzoX+GA77z1CYgvO7yZaRhBpOU9BZKbJ6IWry
	wGinziCaohgdXMrtZTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pggEc-009wvt-2N;
	Mon, 27 Mar 2023 06:21:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pggEZ-009wuI-1B;
	Mon, 27 Mar 2023 06:21:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 62968B8070D;
	Mon, 27 Mar 2023 06:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B863C433D2;
	Mon, 27 Mar 2023 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679898086;
	bh=FXVSNvSgX3uY/taNLPW6RtwU4c/uJBp2AcWeLUkYJKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d8FuAv65ijDpdS/TwqDPgn9gSP8cC9iI0r+FST1M20K6Vzd7JPNpQhKLCAOfeSx7N
	 lQ0P/cZ5qdi0TUSxEKTk9VZrc1X4zPnGsv8BrYrnC8ZrohiGg6/Hco9h/XXlLn42AV
	 QyHDtpuvykOHw428qDQYICj67MlbaLhs1+Z2eDse7sZ1/+S4O1JHL/u/YZMA9EdZiJ
	 LFCk/hHtAQyF1YZG0L4nCuFYpw3QRHlykj30+BzCwigST9ZW1So/HNQXJrSFmjqd9P
	 HeE6qXHNjYVif966JwrcR3/cpdPq/TN0cY2qh7dp9hyNRDFMM7JL6V3sZly8KGgBf5
	 Uxn0q3pc230fQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v16 00/20] riscv: Add vector ISA support
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
Date: Mon, 27 Mar 2023 08:21:22 +0200
Message-ID: <87tty6ww7x.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_232135_719645_16E706D3 
X-CRM114-Status: GOOD (  21.36  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBUaGlzIHBhdGNoc2V0
IGlzIGltcGxlbWVudGVkIGJhc2VkIG9uIHZlY3RvciAxLjAgc3BlYyB0byBhZGQgdmVjdG9yIHN1
cHBvcnQKPiBpbiByaXNjdiBMaW51eCBrZXJuZWwuIFRoZXJlIGFyZSBzb21lIGFzc3VtcHRpb25z
IGZvciB0aGlzIGltcGxlbWVudGF0aW9ucy4KPgo+IDEuIFdlIGFzc3VtZSBhbGwgaGFydHMgaGFz
IHRoZSBzYW1lIElTQSBpbiB0aGUgc3lzdGVtLgo+IDIuIFdlIGRpc2FibGUgdmVjdG9yIGluIGJv
dGgga2VybmVsIGFuZHkgdXNlciBzcGFjZSBbMV0gYnkgZGVmYXVsdC4gT25seQo+ICAgIGVuYWJs
ZSBhbiB1c2VyJ3MgdmVjdG9yIGFmdGVyIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gdHJhcCB3aGVy
ZSBpdAo+ICAgIGFjdHVhbGx5IHN0YXJ0cyBleGVjdXRpbmcgdmVjdG9yICh0aGUgZmlyc3QtdXNl
IHRyYXAgWzJdKS4KPiAzLiBXZSBkZXRlY3QgInJpc2N2LGlzYSIgdG8gZGV0ZXJtaW5lIHdoZXRo
ZXIgdmVjdG9yIGlzIHN1cHBvcnQgb3Igbm90Lgo+Cj4gV2UgZGVmaW5lZCBhIG5ldyBzdHJ1Y3R1
cmUgX19yaXNjdl92X2V4dF9zdGF0ZSBpbiBzdHJ1Y3QgdGhyZWFkX3N0cnVjdCB0bwo+IHNhdmUv
cmVzdG9yZSB0aGUgdmVjdG9yIHJlbGF0ZWQgcmVnaXN0ZXJzLiBJdCBpcyB1c2VkIGZvciBib3Ro
IGtlcm5lbCBzcGFjZQo+IGFuZCB1c2VyIHNwYWNlLgo+ICAtIEluIGtlcm5lbCBzcGFjZSwgdGhl
IGRhdGFwIHBvaW50ZXIgaW4gX19yaXNjdl92X2V4dF9zdGF0ZSB3aWxsIGJlCj4gICAgYWxsb2Nh
dGVkIHRvIHNhdmUgdmVjdG9yIHJlZ2lzdGVycy4KPiAgLSBJbiB1c2VyIHNwYWNlLAo+IAktIElu
IHNpZ25hbCBoYW5kbGVyIG9mIHVzZXIgc3BhY2UsIHRoZSBzdHJ1Y3R1cmUgaXMgcGxhY2VkCj4g
CSAgcmlnaHQgYWZ0ZXIgX19yaXNjdl9jdHhfaGRyLCB3aGljaCBpcyBlbWJlZGRlZCBpbiBmcCBy
ZXNlcnZlZAo+IAkgIGFlcmEuIFRoaXMgaXMgcmVxdWlyZWQgdG8gYXZvaWQgQUJJIGJyZWFrIFsy
XS4gQW5kIGRhdGFwIHBvaW50cwo+IAkgIHRvIHRoZSBlbmQgb2YgX19yaXNjdl92X2V4dF9zdGF0
ZS4KPiAJLSBJbiBwdHJhY2UsIHRoZSBkYXRhIHdpbGwgYmUgcHV0IGluIHVidWYgaW4gd2hpY2gg
d2UgdXNlCj4gCSAgcmlzY3ZfdnJfZ2V0KCkvcmlzY3ZfdnJfc2V0KCkgdG8gZ2V0IG9yIHNldCB0
aGUKPiAJICBfX3Jpc2N2X3ZfZXh0X3N0YXRlIGRhdGEgc3RydWN0dXJlIGZyb20vdG8gaXQsIGRh
dGFwIHBvaW50ZXIKPiAJICB3b3VsZCBiZSB6ZXJvZWQgYW5kIHZlY3RvciByZWdpc3RlcnMgd2ls
bCBiZSBjb3BpZWQgdG8gdGhlCj4gCSAgYWRkcmVzcyByaWdodCBhZnRlciB0aGUgX19yaXNjdl92
X2V4dF9zdGF0ZSBzdHJ1Y3R1cmUgaW4gdWJ1Zi4KPgo+IFRoaXMgcGF0Y2hzZXQgaXMgcmViYXNl
ZCB0byB2Ni4zLXJjMSBhbmQgaXQgaXMgdGVzdGVkIGJ5IHJ1bm5pbmcgc2V2ZXJhbAo+IHZlY3Rv
ciBwcm9ncmFtcyBzaW11bHRhbmVvdXNseS4gSXQgZGVsaXZlcnMgc2lnbmFscyBjb3JyZWN0bHkg
aW4gYSB0ZXN0Cj4gd2hlcmUgd2UgY2FuIHNlZSBhIHZhbGlkIHVjb250ZXh0X3QgaW4gYSBzaWdu
YWwgaGFuZGxlciwgYW5kIGEgY29ycmVjdCBWCj4gY29udGV4dCByZXR1cmluZyBiYWNrIGZyb20g
aXQuIEFuZCB0aGUgcHRyYWNlIGludGVyZmFjZSBpcyB0ZXN0ZWQgYnkKPiBQVFJBQ0Vfe0dFVCxT
RVR9UkVHU0VULiBMYXN0bHksIEtWTSBpcyB0ZXN0ZWQgYnkgcnVubmluZyBhYm92ZSB0ZXN0cyBp
bgo+IGEgZ3Vlc3QgdXNpbmcgdGhlIHNhbWUga2VybmVsIGltYWdlLiBBbGwgdGVzdHMgYXJlIGRv
bmUgb24gYW4gcnY2NGdjdgo+IHZpcnQgUUVNVS4KPgo+IE5vdGU6IHBsZWFzZSBhcHBseSB0aGUg
cGF0Y2ggYXQgWzRdIGR1ZSB0byBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBieQo+IGNvbW1pdCA1
OTZmZjRhMDliODkgKCJjcHVtYXNrOiByZS1pbnRyb2R1Y2UgY29uc3RhbnQtc2l6ZWQgY3B1bWFz
awo+IG9wdGltaXphdGlvbnMiKSBiZWZvcmUgdGVzdGluZyB0aGUgc2VyaWVzLgo+Cj4gU3BlY2Fp
bCB0aGFua3MgdG8gQ29ub3IgYW5kIFZpbmVldCBmb3Iga2luZGx5IGdpdmluZyBoZWxwIG9uLSBh
bmQgb2ZmLWxpc3QuCj4KPiBTb3VyY2UgdHJlZToKPiBodHRwczovL2dpdGh1Yi5jb20vc2lmaXZl
L3Jpc2N2LWxpbnV4L3RyZWUvcmlzY3YvZm9yLW5leHQvdmVjdG9yLXYxNgo+Cj4gTGlua3M6Cj4g
IC0gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDkyMTIxNDQzOS4xNDkxNTEw
LTE3LXN0aWxsc29uQHJpdm9zaW5jLmNvbS8KPiAgLSBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzczYzAxMjRjLTQ3OTQtNmU0MC00NjBjLWIyNmRmNDA3ZjMyMkByaXZvc2luYy5jb20v
VC8jdQo+ICAtIFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAxMjgwODI4NDcu
MzA1NTMxNi0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLwo+ICAtIFs0XSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvQ0FIay09d2lBeHRLeXhzNkJQRXppcnJYdzFrWEotN1p5R3BnT3Jiemht
Qz11ZC02akJBQG1haWwuZ21haWwuY29tLwo+IC0tLQo+IENoYW5nZWxvZyBWMTYKPiAgLSBSZWJh
c2UgdG8gdGhlIGxhdGVzdCBmb3ItbmV4dDoKPiAgICAtIFNvbHZlIGNvbmZsaWN0cyBhdCA3LCBh
bmQgMTcKPiAgLSBVc2UgYXMtaW5zdHIgdG8gZGV0ZWN0IGlmIGFzc2VtYmxlciBzdXBwb3J0cyAu
b3B0aW9uIGFyY2ggZGlyZWN0aXZlCj4gICAgYW5kIHJlbW92ZSBkZXBlbmRlbmN5IGZyb20gR0FT
LCBmb3IgYm90aCBaQkIgYW5kIFYuCj4gIC0gQ2xlYW51cCBjb2RlIGluIEtWTSB2ZWN0b3IKPiAg
LSBBZGRyZXNzIGlzc3VlIHJlcG9ydGVkIGJ5IHNwYXJzZQo+ICAtIFJlZmluZSBjb2RlOgo+ICAg
IC0gRml4IGEgbWl4ZWQtdXNlIG9mIHNwYWNlL3RhYgo+ICAgIC0gUmVtb3ZlIG5ldyBsaW5lcyBh
dCB0aGUgZW5kIG9mIGZpbGUKCkFuZHksCgpUaGUgZ2VuZXJpYyBlbnRyeSBzZXJpZXMgd2FzIGFw
cGxpZWQgdG8gZm9yLW5leHQsIHdoaWNoIGNvbmZsaWN0cyB3aXRoCnlvdXJzLiBPbmUgbW9yZSBz
cGluLi4uIDotKAoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJp
c2N2L3BhdGNoLzIwMjMwMzIzMTQ1OTI0LjQxOTQtMi1hbmR5LmNoaXVAc2lmaXZlLmNvbS8KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
