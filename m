Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF6CE7D01
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6z0tle2ezbUEtlgQnP24ITA0keKjUqYthLeD1HTNvg=; b=x0c3gnBlsvHHLq
	MjK2uOYeJA4eHzz+dAvAsKvwj3FcbQ5Rfc7Q+K8FUHtHrZ5syMhIGW6F4RGeSGg/RaC5oA86abrAm
	3pWfuqWWKPaQa8lYwykWZ4re3WB0oyGI0fU2hBxfstDkItPSVGNTdKV2PPHRO/mra7MjlGrs2Q/Cw
	OK5OO4SmpI9omz332vr/rprW6Uy0guQVLR23CHqxBo65jMBRsQ3Ndu4X0xL2RBoyGO51wcRGZKC9h
	PocLX11YtQIiGAwhaCzdc9UiZdGlE/TsDbnNxlYU+KjJzOo0dytx62Sv1oD1JpL7FonK7vRLUI676
	sDRQKSWwx785MWXets2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZO9-00000002G8t-3pAW;
	Tue, 01 Oct 2024 09:41:49 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZO5-00000002G88-2oC2
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 09:41:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4CB420002;
	Tue,  1 Oct 2024 09:41:38 +0000 (UTC)
Message-ID: <2ab33735-8218-4cb4-ae8f-ecca27185f66@ghiti.fr>
Date: Tue, 1 Oct 2024 11:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Atish Kumar Patra <atishp@rivosinc.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
 <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
 <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
 <CAHBxVyGAJOXwws92M13vf-=+7Z2Nk0c8VjwsQ_YwMa0y+PgtoQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAHBxVyGAJOXwws92M13vf-=+7Z2Nk0c8VjwsQ_YwMa0y+PgtoQ@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_024146_024471_E4F5DACE 
X-CRM114-Status: GOOD (  23.54  )
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

SGkgQXRpc2gsIEJlbiwKCk9uIDE5LzA5LzIwMjQgMDE6MjMsIEF0aXNoIEt1bWFyIFBhdHJhIHdy
b3RlOgo+IE9uIFdlZCwgU2VwIDE4LCAyMDI0IGF0IDI6NTfigK9BTSBCZW4gRG9va3MgPGJlbi5k
b29rc0Bjb2RldGhpbmsuY28udWs+IHdyb3RlOgo+PiBPbiAxOC8wOS8yMDI0IDEwOjU1LCBBdGlz
aCBQYXRyYSB3cm90ZToKPj4+IE9uIDkvMTcvMjQgNzowMSBBTSwgQmVuIERvb2tzIHdyb3RlOgo+
Pj4+IE9uIDE3LzA5LzIwMjQgMTQ6NDYsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4+PiBPbiBU
dWUsIDE3IFNlcCAyMDI0IDA2OjA4OjUwIFBEVCAoLTA3MDApLCBiZW4uZG9va3NAY29kZXRoaW5r
LmNvLnVrCj4+Pj4+IHdyb3RlOgo+Pj4+Pj4gVGhpcyBpcyBhIFJGQyBzZXJpZXMgdG8gY2hhbmdl
IGhvdyB0aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwCj4+Pj4+PiBpcyBoYW5kbGVkIGFuZCB0
aGVuIGhvdyB0byB0cmFwIFJEQ1lDTEUgYW5kIGVtdWxhdGUgaXQgd2l0aCBSRFRJTUUKPj4+Pj4+
IGluc3RlYWQuCj4+Pj4+IE9ubHkgMS8zIG1hZGUgaXQgdG8gbG9yZSBmb3IgbWUsIG5vdCBzdXJl
IGlmIGl0J3MganVzdCBzdHVjayBzb21ld2hlcmUuCj4+Pj4+Cj4+Pj4+PiBJIGRpZCB0aGlzIHdo
ZW4gd2UgZm91bmQgbXVsdGlwbGUgbGlicmFyaWVzIHVzaW5nIFJEQ1lDTEUgYW5kCj4+Pj4+PiB1
cGdyYWRpbmcgbXVsdGlwbGUgcnVubmVycyB0byBuZXdlciBrZXJuZWxzIGNhdXNlZCBtYW55IHBy
b2JsZW1zCj4+Pj4+IE9LLCBzbyBJIHRoaW5rIHdlJ3JlIGtpbmQgb2YganVzdCBzdHVjayB3aXRo
IFJEQ1lDTEUgdGhlbiAtLSBpdCB3YXMKPj4+Pj4gcGFydCBvZiB0aGUgYmFzZSBJU0Egd2hlbiB3
ZSBtZXJnZWQgdGhlIHBvcnQsIGFuZCBldmVyeSB0aW1lIGl0Cj4+Pj4+IGRpc2FwcGVhcnMgd2Ug
ZW5kIHVwIGJyZWFraW5nIHVzZXJzcGFjZS4KPj4+PiBZZXMsIGl0IHdhcyBhbiBhbm5veWFuY2Us
IHdlIG1hbmFnZWQgdG8gdHJhY2sgZG93biBhbGwgdGhlIHVzZXJzIGFuZAo+Pj4+IHBhdGNoIG91
dC4KPj4+Pgo+Pj4+IEkgdGhvdWdodCB0aGlzIG1pZ2h0IGJlIGEgdXNlZnVsIGlkZWEgZm9yIG1v
cmUgZ2VuZXJpYyB0eXBlLCBzbyBtaWdodAo+Pj4+IGxvb2sgYXQgdXBkYXRpbmcgdG8gaGF2ZSBh
IHRhYmxlIG9mIGluc3RydWN0aW9uIG1hc2tzIHRvIGNhbGwuCj4+Pj4KPj4+Pj4gSSdtIG5vdCBz
dXJlIHdoYXQgZXhhY3RseSB0aGUgcmlnaHQgd2F5IHRvIGRvIHRoaXMgaXM6IElJUkMgdGhlcmUn
cwo+Pj4+PiBzb21lIHBlcmYtcmVsYXRlZCBob29rcyBmb3IgdGhpcywgYnV0IHRoZXJlJ3MgYWxz
byBzeXN0ZW1zIHRoYXQganVzdAo+Pj4+PiBkb24ndCBpbXBsZW1lbnQgdGhlIFJEQ1lDTEUgaW5z
dHJ1Y3Rpb24gYXQgYWxsIGFuZCB0aHVzIHdlJ2xsIG5lZWQKPj4+Pj4gc29tZSBzb3J0IG9mIGVt
dWxhdGlvbiBmb3IgdGhvc2UuCj4+Pj4gSSBjb3VsZG4ndCBnZXQgdGhlIFBNVSBkcml2ZXIgdG8g
YWxsb3cgaXQsIG5vdCBzdXJlIGlmIHRoZXJlIHdhcyBhbgo+Pj4+IGlzc3VlIGhpZ2hlciB1cCBv
ciBzb21lIG90aGVyIGlzc3VlPwo+Pj4+Cj4+PiBIZXJlIGlzIHRoZSB3YXkgdG8gcHJvcGVybHkg
YWxsb3cgaXQgdmlhIHRoZSBkcml2ZXIuCj4+Pgo+Pj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAo+Pj4KPj4+IENo
ZWNrIHRoZSBwZXJmX3VzZXJfYWNjZXNzCj4+IERpZG4ndCB3b3JrIGZvciBtZSwgbm90IHN1cmUg
d2h5Cj4+Cj4gK0FsZXhhbmRyZSBHaGl0aQo+Cj4gSG1tLiBUaGF0J3Mgd2VpcmQuIE1heWJlIHNv
bWUgYnVnIGNyZXB0IGluIHJlY2VudGx5LiBDYW4geW91IHByb3ZpZGUKPiBzb21lIG1vcmUgZGV0
YWlscwo+IG9uIHRoZSBwbGF0Zm9ybSwga2VybmVsIHZlcnNpb24gYW5kIHByb2NlZHVyZSBmb2xs
b3dlZCB0byBjaGFuZ2UgaXQgPwoKClNvIEkgaGF2ZSBqdXN0IHRyaWVkIHBlcmZfdXNlcl9hY2Nl
c3Mgb24gNi4xMSBhbmQgaXQgd29ya3MgZmluZSwgbWVhbmluZyAKc2V0dGluZyB0aGUgImxlZ2Fj
eSIgYmVoYXZpb3VyIChpZSAyKSBhbGxvd3MgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gdG8gCmRp
cmVjdGx5IGFjY2VzcyBSRENZQ0xFLgoKQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscyBCZW4/
CgpUaGFua3MsCgpBbGV4CgoKPgo+Pj4gQXMgeW91IG5vdGVkLCB0aGUgdXNlciBzcGFjZSBhcHBs
aWNhdGlvbiBzaG91bGRuJ3QgdXNlIFJEQ1lDTEUgZm9yCj4+PiB2YXJpb3VzIHJlYXNvbnMgZGlz
Y3Vzc2VkIGluIHRoZSBwYXN0Lgo+Pj4KPj4+IElmIFJEVElNRSBpcyByZWFsbHkgbm90IGFuIG9w
dGlvbiwgeW91IGNhbiBhbHdheXMgc2V0IHRoZSBsZWdhY3kgbW9kZSB0bwo+Pj4gZW5hYmxlIGFj
Y2Vzcy4KPj4+Cj4+Pj4+IFNvIGhvcGVmdWxseSB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgZ2V0IHRo
cm91Z2ggdGhlIGxpc3RzIGF0IHNvbWUKPj4+Pj4gcG9pbnQsIGJ1dCBJIHRoaW5rIGluIGdlbmVy
YWwgdGhpcyBpcyBhIHJlYXNvbmFibGUgdGhpbmcgdG8gZG8gLS0gb3IKPj4+Pj4gSSBndWVzcyBt
YXliZSBhIGNvbXBsZXRlbHkgdW5yZWFzb25hYmxlIHRoaW5nIHRvIGJlIHN0dWNrIG5lZWRpbmcg
dG8KPj4+Pj4gZG8sIGJ1dCBubyB3YXkgYXJvdW5kIGl0IDspCj4+Pj4gSSdsbCBjaGVjayBiYWNr
IGxhdGVyLCBjdXJyZW50bHkgYXMgT1NTLUVVCj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+Pj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+Pj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+Pj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+Pj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Pj4+Cj4+Pj4KPj4+Cj4+Cj4+IC0tCj4+IEJlbiBEb29r
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRwOi8vd3d3LmNvZGV0aGluay5jby51
ay8KPj4gU2VuaW9yIEVuZ2luZWVyICAgICAgICAgICAgICAgICAgICAgICAgIENvZGV0aGluayAt
IFByb3ZpZGluZyBHZW5pdXMKPj4KPj4gaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZh
Y3kuaHRtbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
