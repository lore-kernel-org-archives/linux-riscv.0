Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0696AC5519F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:10:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881FC24199
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPw8VX1x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8TAwo3s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881FC24199
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qcmvz/z+97WdgPy0iOmTWOZewLfQWg+E0AWJt7Te1Io=; b=mPw8VX1xy17LIvCNzDpvNf3kr
	DvCWuIQONt/3TVWGH47PDwQ5N9Q+K14r9sEJuxC/rQC2E1J7Bp8x1Qz/Z93TX9jEJZPkj7x6srmjk
	nJhPq0tqKnLwdCGb59hFWTGHetKFPUOyt47nXcKoGWHiyxxrS3uJqTnq16BwslCw4XcuSjsEIx6Xp
	B4WQJbZ0axFB9UyjItpcQ1aKl3+EOCflqN+zZH0bwJve49x2hPgPpYxgNS+EGk3ReyXWw+BrAPXZ4
	M1g2F2tNZPOfVet6/9sWzu1NAaqV6S6Kn8EAfxw1bH5IVmpFw9G3AscT1xomAMwvwy/MbUeXXBVqG
	3tBE8p0/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf2cN-0001E4-Ho; Tue, 17 Nov 2020 15:10:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf2cJ-0001C7-Bh
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 15:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605625798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avqgkPhMAEZAPZkBU6g1zM+EphNhv69bq0mDQ2MSyGE=;
 b=S8TAwo3s+rzbgiROW+UXpjWuAMeWLY0T/ao/dlLpi6P3/fzg/Cy+miIIhYAZUuSqIcENSN
 JWwM/sonGHJvetmLJA/OD2cFD8YmR/3UEHYlN3hUx2LzUobkeP+BViO5M+M3/JccFmehoQ
 ZJqn+FlptXuQGX05cWf+j/YCY8V4G1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-K75Q0U6RPOe3OPIwoMgYvA-1; Tue, 17 Nov 2020 10:09:53 -0500
X-MC-Unique: K75Q0U6RPOe3OPIwoMgYvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87EF157090;
 Tue, 17 Nov 2020 15:09:49 +0000 (UTC)
Received: from [10.36.114.99] (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF2366BF6B;
 Tue, 17 Nov 2020 15:09:40 +0000 (UTC)
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
To: Mike Rapoport <rppt@kernel.org>
References: <20201112190827.GP4758@kernel.org>
 <7A16CA44-782D-4ABA-8D93-76BDD0A90F94@redhat.com>
 <20201115082625.GT4758@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <d47fdd2e-a8fa-6792-ca8f-e529be76340c@redhat.com>
Date: Tue, 17 Nov 2020 16:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201115082625.GT4758@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_100959_474642_DBEFEC7F 
X-CRM114-Status: GOOD (  30.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTUuMTEuMjAgMDk6MjYsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMTIs
IDIwMjAgYXQgMDk6MTU6MThQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Cj4+
PiBBbSAxMi4xMS4yMDIwIHVtIDIwOjA4IHNjaHJpZWIgTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPjoKPj4+Cj4+PiDvu79PbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwNToyMjowMFBNICsw
MTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4gT24gMTAuMTEuMjAgMTk6MDYsIE1p
a2UgUmFwb3BvcnQgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgTm92IDEwLCAyMDIwIGF0IDA2OjE3OjI2
UE0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMTEuMjAgMTY6
MTQsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBw
dEBsaW51eC5pYm0uY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSB1
cGNvbWluZyBzZWNyZXQgbWVtb3J5IGltcGxlbWVudGF0aW9uLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4+Pj4+IC0t
LQo+Pj4+Pj4+ICAgIG1tL2ludGVybmFsLmggfCAzICsrKwo+Pj4+Pj4+ICAgIG1tL21tYXAuYyAg
ICAgfCA1ICsrLS0tCj4+Pj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vaW50ZXJuYWwu
aCBiL21tL2ludGVybmFsLmgKPj4+Pj4+PiBpbmRleCBjNDNjY2RkZGIwZjYuLmFlMTQ2YTI2MGIx
NCAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9tbS9pbnRlcm5hbC5oCj4+Pj4+Pj4gKysrIGIvbW0vaW50
ZXJuYWwuaAo+Pj4+Pj4+IEBAIC0zNDgsNiArMzQ4LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIG11
bmxvY2tfdm1hX3BhZ2VzX2FsbChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4+Pj4+PiAg
ICBleHRlcm4gdm9pZCBtbG9ja192bWFfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4+Pj4+Pj4g
ICAgZXh0ZXJuIHVuc2lnbmVkIGludCBtdW5sb2NrX3ZtYV9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KTsKPj4+Pj4+PiArZXh0ZXJuIGludCBtbG9ja19mdXR1cmVfY2hlY2soc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgbGVuKTsKPj4+Pj4+PiArCj4+Pj4+Pj4gICAgLyoKPj4+Pj4+PiAgICAgKiBD
bGVhciB0aGUgcGFnZSdzIFBhZ2VNbG9ja2VkKCkuICBUaGlzIGNhbiBiZSB1c2VmdWwgaW4gYSBz
aXR1YXRpb24gd2hlcmUKPj4+Pj4+PiAgICAgKiB3ZSB3YW50IHRvIHVuY29uZGl0aW9uYWxseSBy
ZW1vdmUgYSBwYWdlIGZyb20gdGhlIHBhZ2VjYWNoZSAtLSBlLmcuLAo+Pj4+Pj4+IGRpZmYgLS1n
aXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPj4+Pj4+PiBpbmRleCA2MWY3MmIwOWQ5OTAuLmM0
ODFmMDg4YmQ1MCAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9tbS9tbWFwLmMKPj4+Pj4+PiArKysgYi9t
bS9tbWFwLmMKPj4+Pj4+PiBAQCAtMTM0OCw5ICsxMzQ4LDggQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIHJvdW5kX2hpbnRfdG9fbWluKHVuc2lnbmVkIGxvbmcgaGludCkKPj4+Pj4+PiAg
ICAgICAgcmV0dXJuIGhpbnQ7Cj4+Pj4+Pj4gICAgfQo+Pj4+Pj4+IC1zdGF0aWMgaW5saW5lIGlu
dCBtbG9ja19mdXR1cmVfY2hlY2soc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+Pj4+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4+Pj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKQo+Pj4+Pj4+ICtpbnQgbWxvY2tfZnV0dXJlX2No
ZWNrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGZsYWdzLAo+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGxlbikKPj4+Pj4+PiAgICB7Cj4+Pj4+Pj4gICAg
ICAgIHVuc2lnbmVkIGxvbmcgbG9ja2VkLCBsb2NrX2xpbWl0Owo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gU28sIGFuIGludGVyZXN0aW5nIHF1ZXN0aW9uIGlzIGlmIHlvdSBhY3R1YWxseSB3YW50IHRv
IGNoYXJnZSBzZWNyZXRtZW0KPj4+Pj4+IHBhZ2VzIGFnYWluc3QgbWxvY2sgbm93LCBvciBpZiB5
b3Ugd2FudCBhIGRlZGljYXRlZCBzZWNyZXRtZW0gY2dyb3VwCj4+Pj4+PiBjb250cm9sbGVyIGlu
c3RlYWQ/Cj4+Pj4+Cj4+Pj4+IFdlbGwsIHdpdGggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
dGhlcmUgYXJlIHRocmVlIGxpbWl0cyBhbgo+Pj4+PiBhZG1pbmlzdHJhdG9yIGNhbiB1c2UgdG8g
Y29udHJvbCBzZWNyZXRtZW0gbGltaXRzOiBtbG9jaywgbWVtY2cgYW5kCj4+Pj4+IGtlcm5lbCBw
YXJhbWV0ZXIuCj4+Pj4+Cj4+Pj4+IFRoZSBrZXJuZWwgcGFyYW1ldGVyIHB1dHMgYSBnbG9iYWwg
dXBwZXIgbGltaXQgZm9yIHNlY3JldG1lbSB1c2FnZSwKPj4+Pj4gbWVtY2cgYWNjb3VudHMgYWxs
IHNlY3JldG1lbSBhbGxvY2F0aW9ucywgaW5jbHVkaW5nIHRoZSB1bnVzZWQgbWVtb3J5IGluCj4+
Pj4+IGxhcmdlIHBhZ2VzIGNhY2hpbmcgYW5kIG1sb2NrIGFsbG93cyBwZXIgdGFzayBsaW1pdCBm
b3Igc2VjcmV0bWVtCj4+Pj4+IG1hcHBpbmdzLCB3ZWxsLCBsaWtlIG1sb2NrIGRvZXMuCj4+Pj4+
Cj4+Pj4+IEkgZGlkbid0IGNvbnNpZGVyIGEgZGVkaWNhdGVkIGNncm91cCwgYXMgaXQgc2VlbXMg
d2UgYWxyZWFkeSBoYXZlIGVub3VnaAo+Pj4+PiBleGlzdGluZyBrbm9icyBhbmQgYSBuZXcgb25l
IHdvdWxkIGJlIHVubmVjZXNzYXJ5Lgo+Pj4+Cj4+Pj4gVG8gbWUgaXQgZmVlbHMgbGlrZSB0aGUg
bWxvY2soKSBsaW1pdCBpcyBhIHdyb25nIGZpdCBmb3Igc2VjcmV0bWVtLiBCdXQKPj4+PiBtYXli
ZSB0aGVyZSBhcmUgb3RoZXIgY2FzZXMgb2YgdXNpbmcgdGhlIG1sb2NrKCkgbGltaXQgd2l0aG91
dCBhY3R1YWxseQo+Pj4+IGRvaW5nIG1sb2NrKCkgdGhhdCBJIGFtIG5vdCBhd2FyZSBvZiAobW9z
dCBwcm9iYWJseSA6KSApPwo+Pj4KPj4+IFNlY3JldG1lbSBkb2VzIG5vdCBleHBsaWNpdGx5IGNh
bGxzIHRvIG1sb2NrKCkgYnV0IGl0IGRvZXMgd2hhdCBtbG9jaygpCj4+PiBkb2VzIGFuZCBhIGJp
dCBtb3JlLiBDaXRpbmcgbWxvY2soMik6Cj4+Pgo+Pj4gICBtbG9jaygpLCAgbWxvY2syKCksICBh
bmQgIG1sb2NrYWxsKCkgIGxvY2sgIHBhcnQgIG9yIGFsbCBvZiB0aGUgY2FsbGluZwo+Pj4gICBw
cm9jZXNzJ3MgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGludG8gUkFNLCBwcmV2ZW50aW5nIHRoYXQg
IG1lbW9yeSAgZnJvbQo+Pj4gICBiZWluZyBwYWdlZCB0byB0aGUgc3dhcCBhcmVhLgo+Pj4KPj4+
IFNvLCBiYXNlZCBvbiB0aGF0IHNlY3JldG1lbSBwYWdlcyBhcmUgbm90IHN3YXBwYWJsZSwgSSB0
aGluayB0aGF0Cj4+PiBSTElNSVRfTUVNTE9DSyBpcyBhcHByb3ByaWF0ZSBoZXJlLgo+Pj4KPj4K
Pj4gVGhlIHBhZ2UgZXhwbGljaXRseSBsaXN0cyBtbG9jaygpIHN5c3RlbSBjYWxscy4KPiAKPiBX
ZWxsLCBpdCdzIG1sb2NrKCkgbWFuIHBhZ2UsIGlzbid0IGl0PyA7LSkKCjspCgo+IAo+IE15IHRo
aW5raW5nIHdhcyB0aGF0IHNpbmNlIHNlY3JldG1lbSBkb2VzIHdoYXQgbWxvY2soKSBkb2VzIHdy
dAo+IHN3YXBhYmlsaXR5LCBpdCBzaG91bGQgYXQgbGVhc3Qgb2JleSB0aGUgc2FtZSBsaW1pdCwg
aS5lLgo+IFJMSU1JVF9NRU1MT0NLLgoKUmlnaHQsIGJ1dCBhdCBsZWFzdCBjdXJyZW50bHksIGl0
IGJlaGF2ZXMgbGlrZSBhbnkgb3RoZXIgQ01BIGFsbG9jYXRpb24gCihJSVJDIHRoZXkgYXJlIGFs
bCB1bm1vdmFibGUgYW5kLCB0aGVyZWZvcmUsIG5vdCBzd2FwcGFibGUpLiBJbiB0aGUgCmZ1dHVy
ZSwgaWYgcGFnZXMgd291bGQgYmUgbW92YWJsZSAoYnV0IG5vdCBzd2FwcGFibGUpLCBJIGd1ZXNz
IGl0IG1pZ2h0IAptYWtlcyBtb3JlIHNlbnNlLiBJIGFzc3VtZSB3ZSBuZXZlciBldmVyIHdhbnQg
dG8gc3dhcCBzZWNyZXRtZW0uCgoibWFuIGdldHJsaW1pdCIgc3RhdGVzIGZvciBSTElNSVRfTUVN
TE9DSzoKCiJUaGlzIGlzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBieXRlcyBvZiBtZW1vcnkgdGhh
dCBtYXkgYmUKICBsb2NrZWQgaW50byBSQU0uICBbLi4uXSBUaGlzIGxpbWl0IGFmZmVjdHMKICBt
bG9jaygyKSwgbWxvY2thbGwoMiksIGFuZCB0aGUgbW1hcCgyKSBNQVBfTE9DS0VEIG9wZXJhdGlv
bi4KICBTaW5jZSBMaW51eCAyLjYuOSwgaXQgYWxzbyBhZmZlY3RzIHRoZSBzaG1jdGwoMikgU0hN
X0xPQ0sgb3DigJAKICBlcmF0aW9uIFsuLi5dIgoKU28gdGhhdCBwbGFjZSBoYXMgdG8gYmUgdXBk
YXRlZCBhcyB3ZWxsIEkgZ3Vlc3M/IE90aGVyd2lzZSB0aGlzIG1pZ2h0IApjb21lIGFzIGEgc3Vy
cHJpc2UgZm9yIHVzZXJzLgoKPiAKPj4gRS5nLiwgd2UgYWxzbyBkb27igJh0Cj4+IGFjY291bnQg
Zm9yIGdpZ2FudGljIHBhZ2VzIC0gd2hpY2ggbWlnaHQgYmUgYWxsb2NhdGVkIGZyb20gQ01BIGFu
ZCBhcmUKPj4gbm90IHN3YXBwYWJsZS4KPiAgIAo+IERvIHlvdSBtZWFuIGdpZ2FudGljIHBhZ2Vz
IGluIGh1Z2V0bGJmcz8KClllcwoKPiBJdCBzZWVtcyB0byBtZSB0aGF0IGh1Z2V0bGJmcyBhY2Nv
dW50aW5nIGlzIGEgY29tcGxldGVseSBkaWZmZXJlbnQKPiBzdG9yeS4KCkknZCBzYXkgaXQgaXMg
cmlnaHQgbm93IGNvbXBhcmFibGUgdG8gc2VjcmV0bWVtIC0gd2hpY2ggaXMgd2h5IEkgdGhvdWdo
IApzaW1pbGFyIGFjY291bnRpbmcgd291bGQgbWFrZSBzZW5zZS4KCgotLSAKVGhhbmtzLAoKRGF2
aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
