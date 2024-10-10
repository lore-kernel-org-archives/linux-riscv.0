Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22215CF11F8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGkEzwKwkbH1RxDWrK89Zfn7O/JVJ9I9zqcmFfsieiY=; b=GPPJ93ouRgaWWu
	dxmfIG0DnwtE7oPbZX05nCX4iuWfBIq2Y1gbPZX8kQjvhVcpEtrMW/HzDxVzqGYTdc7FMkdTTDcaK
	6cPgVTLqDev9dXSdDiCgP8cBFyf5NBOFNmijLJgKm9eMpy4oBTBjU1qNoPDPkFrvjf8A6L6x6QMEP
	IIciLnLeRnz+NPRRbYDQ3fA1n/uBTywzkyWHZNOxuLKLy3rTLcmEVlZLH3OD7yE895K2MI67iTXvd
	E8R9aonMqoiIenE0qBp9qGAMJgoWRPIuRkQzPMMRF3/mrw/g4ryCKiQyLV1XIDH00czTBEECHn5YV
	6SZvn8YrhpPdzJFiW39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sytUZ-0000000CyHg-34HE;
	Thu, 10 Oct 2024 13:46:11 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysId-0000000Ci6n-1riU
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 12:30:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 684A940002;
	Thu, 10 Oct 2024 12:29:40 +0000 (UTC)
Message-ID: <dfe6a69e-03e6-44ca-a801-9fcdfe4efb70@ghiti.fr>
Date: Thu, 10 Oct 2024 14:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
Content-Language: en-US
To: =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>,
 paul.walmsley@sifive.com
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, palmer@dabbelt.com, cuiyunhui@bytedance.com,
 sudeep.holla@arm.com, linux-riscv@lists.infradead.org
References: <20240913080053.36636-1-mikisabate@gmail.com>
 <66fa9afe.5d0a0220.323a97.bfb6@mx.google.com>
 <670535de.7b0a0220.311e0d.f680@mx.google.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <670535de.7b0a0220.311e0d.f680@mx.google.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_052947_804479_93F3EBAE 
X-CRM114-Status: GOOD (  23.30  )
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

SGkgTWlxdWVsLAoKT24gMDgvMTAvMjAyNCAxNTozOCwgTWlxdWVsIFNhYmF0w6kgU29sw6Agd3Jv
dGU6Cj4gT24gZGwuLCBkZSBzZXQuIDMwIDIwMjQsIE1pcXVlbCBTYWJhdMOpIFNvbMOgIHdyb3Rl
Ogo+Cj4+IE9uIGR2LiwgZGUgc2V0LiAxMyAyMDI0LCBNaXF1ZWwgU2FiYXTDqSBTb2zDoCB3cm90
ZToKPj4KPj4+IFdoZW4gcG9wdWxhdGluZyBjYWNoZSBsZWF2ZXMgd2UgcHJldmlvdXNseSBmZXRj
aGVkIHRoZSBDUFUgZGV2aWNlIG5vZGUKPj4+IGF0IHRoZSB2ZXJ5IGJlZ2lubmluZy4gQnV0IHdo
ZW4gQUNQSSBpcyBlbmFibGVkIHdlIGdvIHRocm91Z2ggYQo+Pj4gc3BlY2lmaWMgYnJhbmNoIHdo
aWNoIHJldHVybnMgZWFybHkgYW5kIGRvZXMgbm90IGNhbGwgJ29mX25vZGVfcHV0JyBmb3IKPj4+
IHRoZSBub2RlIHRoYXQgd2FzIGFjcXVpcmVkLgo+Pj4KPj4+IFNpbmNlIHdlIGFyZSBub3QgdXNp
bmcgYSBDUFUgZGV2aWNlIG5vZGUgZm9yIHRoZSBBQ1BJIGNvZGUgYW55d2F5cywgd2UKPj4+IGNh
biBzaW1wbHkgbW92ZSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgaXQganVzdCBwYXNzZWQgdGhlIEFD
UEkgYmxvY2ssIGFuZAo+Pj4gd2UgYXJlIGd1YXJhbnRlZWQgdG8gaGF2ZSBhbiAnb2Zfbm9kZV9w
dXQnIGNhbGwgZm9yIHRoZSBhY3F1aXJlZCBub2RlLgo+Pj4gVGhpcyBwcmV2ZW50cyBhIGJhZCBy
ZWZlcmVuY2UgY291bnQgb2YgdGhlIENQVSBkZXZpY2Ugbm9kZS4KPj4+Cj4+PiBNb3Jlb3Zlciwg
dGhlIHByZXZpb3VzIGZ1bmN0aW9uIGRpZCBub3QgY2hlY2sgZm9yIGVycm9ycyB3aGVuIGFjcXVp
cmluZwo+Pj4gdGhlIGRldmljZSBub2RlLCBzbyBhIHJldHVybiAtRU5PRU5UIGhhcyBiZWVuIGFk
ZGVkIGZvciB0aGF0IGNhc2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kg
U29sw6AgPG1pa2lzYWJhdGVAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiBJIHdhcyB3b25kZXJpbmcg
aWYgdGhpcyBzaG91bGQgYWxzbyBiZSBzZW50IHRvIHN0YWJsZSwgYnV0ICBJIGhhdmUgbm90IHNl
ZW4KPj4+IGEgcmVwb3J0IG9uIGl0LCBhbmQgdGhpcyBpcyBub3QgcmVzcG9uc2libGUgZm9yIGFu
IG9vcHMgb3IgYW55dGhpbmcgbGlrZSB0aGF0Lgo+Pj4gU28gaW4gdGhlIGVuZCBJIGRlY2lkZWQg
bm90IHRvLCBidXQgbWF5YmUgeW91IGNvbnNpZGVyIG90aGVyd2lzZS4KPj4+Cj4+PiAgIGFyY2gv
cmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgNyArKysrKy0tCj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZv
LmMKPj4+IGluZGV4IGQ2YzEwOGM1MGNiYS4uZDMyZGZkYmEwODNlIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NhY2hlaW5mby5jCj4+PiBAQCAtNzUsOCArNzUsNyBAQCBpbnQgcG9wdWxhdGVfY2FjaGVfbGVh
dmVzKHVuc2lnbmVkIGludCBjcHUpCj4+PiAgIHsKPj4+ICAgCXN0cnVjdCBjcHVfY2FjaGVpbmZv
ICp0aGlzX2NwdV9jaSA9IGdldF9jcHVfY2FjaGVpbmZvKGNwdSk7Cj4+PiAgIAlzdHJ1Y3QgY2Fj
aGVpbmZvICp0aGlzX2xlYWYgPSB0aGlzX2NwdV9jaS0+aW5mb19saXN0Owo+Pj4gLQlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+Pj4gLQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnByZXYgPSBOVUxMOwo+Pj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
LCAqcHJldjsKPj4+ICAgCWludCBsZXZlbHMgPSAxLCBsZXZlbCA9IDE7Cj4+Pgo+Pj4gICAJaWYg
KCFhY3BpX2Rpc2FibGVkKSB7Cj4+PiBAQCAtMTAwLDYgKzk5LDEwIEBAIGludCBwb3B1bGF0ZV9j
YWNoZV9sZWF2ZXModW5zaWduZWQgaW50IGNwdSkKPj4+ICAgCQlyZXR1cm4gMDsKPj4+ICAgCX0K
Pj4+Cj4+PiArCW5wID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+Pj4gKwlpZiAoIW5w
KQo+Pj4gKwkJcmV0dXJuIC1FTk9FTlQ7Cj4+PiArCj4+PiAgIAlpZiAob2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAiY2FjaGUtc2l6ZSIpKQo+Pj4gICAJCWNpX2xlYWZfaW5pdCh0aGlzX2xlYWYr
KywgQ0FDSEVfVFlQRV9VTklGSUVELCBsZXZlbCk7Cj4+PiAgIAlpZiAob2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAiaS1jYWNoZS1zaXplIikpCj4+IEdlbnRseSBwaW5nIDopCj4+Cj4+IENvdWxk
IHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzIGZpeD8KPj4KPj4gVGhhbmtzLAo+PiBNaXF1ZWwKPiBI
ZWxsbywKPgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGlzIGZpeCBmb3IgcmMzPwoK
ClNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZS4gSXQgcHJvYmFibHkgd29uJ3QgbWFrZSBpdCB0
byByYzMgYnV0IEknbGwgCm1ha2Ugc3VyZSBpdCB3aWxsIGluIHJjNCA6KQoKRmlyc3Q6CgpSZXZp
ZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKQW5kIGl0
IG5lZWRzIHRoZSBmb2xsb3dpbmcgRml4ZXMgdGFnIChidXQgbm8gbmVlZCB0byBzZW5kIGEgbmV3
IHZlcnNpb24sIApiNCB3aWxsIHBpY2sgaXQgdXApOgoKRml4ZXM6IDYwNGYzMmVhNjkwOSAoInJp
c2N2OiBjYWNoZWluZm86IGluaXRpYWxpemUgY2FjaGVpbmZvJ3MgbGV2ZWwgYW5kIAp0eXBlIGZy
b20gQUNQSSBQUFRUIikKCkFuZCBhYm91dCBjY2luZyBzdGFibGUsIEknbSBub3Qgc3VyZSB3aGF0
IGNvdWxkIGJlIHRoZSBpbXBhY3Qgb2YgdGhpcyAKYmFkIHJlZmVyZW5jZSBjb3VudCAoc29tZSB3
YXJuaW5ncyBjb3VsZCBhcHBlYXIsIGV0Yy4uLikgc28gYXMgaXQgaXMgYSAKc21hbGwgcGF0Y2gs
IEkgdGhpbmsgaXQncyB3b3J0aCBiYWNrcG9ydGluZyB0byBzdGFibGUuCgpUaGFua3MsCgpBbGV4
CgoKPgo+IFRoYW5rcywKPiBNaXF1ZWwKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
