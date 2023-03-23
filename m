Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1209EC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1GdWSoW2o3W9QZxx+PiqLjEYO1vdU2Qqo33Wy0q2hA=; b=ZhlVJ2noCsgmPN
	UhWwTOEE78irdheC8SBcRp5VysEHKVjDhe5WuYCqhLPEkzF55iePrD2vIwSXwDCr1TDd1QXws0rzZ
	qfE94sY32M1kv4qJgeeqs4tbuMkdLn3DeD4yB+NVwxvCRhK7FoS6MRcCFjhyXPBmPF2zMg5Sctszf
	4mqaMzjYoYWMJSzhpX+tX91LCPad7EY1wgTR1SiMqzdFrkxqk6gGhOhJyZRwOq4+uKR9hamTl2d5n
	Cr+eAfg3Vl31hnHOP8+QWZtiE/uNC+ky15S2l+hM0ygxuUOTFmwEMXazJR368NuF9A/pUXx/61WSS
	wDH7yjdGQ6nGGoyPQZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIRN-001cER-1I;
	Thu, 23 Mar 2023 10:45:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIRK-001cDG-17;
	Thu, 23 Mar 2023 10:45:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E72DE625CF;
	Thu, 23 Mar 2023 10:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4336C433EF;
	Thu, 23 Mar 2023 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679568297;
	bh=FC284fe1reOFExtyK7FiUWEHEjvzt4Zx9HsDnW61qPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fKuzo6CpZnPgIL5G4ThNKt9biwu09hhGZp2K8qRTYo5cUktc74MPnFoIRBIG0WPq6
	 SJ9swzV0Xhz7ltvvtqcZxKP+XssAUUwSpASyWyqn7J0/vsoW9jLNv4GY0/RTsICUYJ
	 a5Va/67NYD9t6RiaxopNusxwus9WOXcRNHECher7PICjw3F5vOCZW2l6ThCbkUZGyE
	 XYL6VgRqPkUbPX/xfOcZJ3WCuo3I0SC7hVHReqHS5dz+T0/+s1r5UtiQ7FZn+fQM/Q
	 h5lkhQgN7ULebrzVUoyo1fwWMuVZx43j0fF4+eME60RUR3xQV4KQ3nT7zym8B0X3l8
	 PMPgHIex2tLKA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v15 00/19] riscv: Add vector ISA support
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 11:44:54 +0100
Message-ID: <874jqb4uhl.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_034502_465698_DF7EF80F 
X-CRM114-Status: GOOD (  21.57  )
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
L3Jpc2N2LWxpbnV4L3RyZWUvcmlzY3YvZm9yLW5leHQvdmVjdG9yLXYxNQo+Cj4gTGlua3M6Cj4g
IC0gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDkyMTIxNDQzOS4xNDkxNTEw
LTE3LXN0aWxsc29uQHJpdm9zaW5jLmNvbS8KPiAgLSBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzczYzAxMjRjLTQ3OTQtNmU0MC00NjBjLWIyNmRmNDA3ZjMyMkByaXZvc2luYy5jb20v
VC8jdQo+ICAtIFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAxMjgwODI4NDcu
MzA1NTMxNi0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLwo+ICAtIFs0XSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvQ0FIay09d2lBeHRLeXhzNkJQRXppcnJYdzFrWEotN1p5R3BnT3Jiemht
Qz11ZC02akJBQG1haWwuZ21haWwuY29tLwo+IC0tLQo+IENoYW5nZWxvZyBWMTUKPiAgLSBSZWJh
c2UgdG8gcmlzYy12IC1uZXh0ICh2Ni4zLXJjMSkKPiAgLSBNYWtlIFYgZGVwZW5kIG9uIEZEIGlu
IEtjb25maWcgYWNjb3JkaW5nIHRvIHRoZSBzcGVjIGFuZCBzaHV0IG9mZiB2Cj4gICAgcHJvcGVy
bHkuCj4gIC0gRml4IGEgc3ludGF4IGVycm9yIGZvciBjbGFuZyBidWlsZC4gQnV0IG1hcmsgUklT
Q1ZfSVNBX1YgR0FTIG9ubHkgZHVlCj4gICAgdG8gaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Qx
MjM1MTUKPiAgLSBVc2Ugc2NyYXRjaCByZWcgaW4gaW5saW5lIGFzbSBpbnN0ZWFkIG9mIHQ0Lgo+
ICAtIFJlZmluZSBjb2RlLgo+ICAtIENsZWFudXAgcGVyLXBhdGNoIGNoYW5nZWxvZ3MuCgpBbmR5
LCBJIHRoaW5rIHRoZSBzZXJpZXMgaXMgaW4gYSBnb29kIHNoYXBlISBUaGFua3MgZm9yIHRoZSBo
YXJkIHdvcmshCgpUbyBzdW1tYXJpemU7IEFGQUlVIHRoZSBvdXRzdGFuZGluZyBpc3N1ZXMgYXJl
OgoKICogc3BhcnNlLCBwYXRjaCAxMwogKiBBbnVwJ3MgS1ZNIGNvbW1lbnRzLCBwYXRjaCAxOAog
KiBOYXRoYW4ncyBzdWdnZXN0aW9uLCBwYXRjaCAxOQoKQW55dGhpbmcgZWxzZT8gSWYgbm90LCBp
dCB3b3VsZCBiZSBhbWF6aW5nIGZvciBhIHF1aWNrIHYxNiB0dXJuYXJvdW5kLAphZGRyZXNzaW5n
IHRoZSBwb2ludHMgYWJvdmUuIEhvcGVmdWxseSB0aGUgbmV4dCB2ZXJzaW9uIGNhbiBsYW5kIGlu
IHRoZQp1cGNvbWluZyByZWxlYXNlLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
