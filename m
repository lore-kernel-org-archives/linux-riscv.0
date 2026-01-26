Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E612FC88E77
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K86PdyKXn/Nk58J+LeKk4Oa94g5qMpTdG/hml3+6+SA=; b=rYV2eeSRhqHx2Q
	aV0vkAELCMuH+0RwzyAzaDK1+PxH8rxZPRyJcTpK3UQJcnjPUiX6OkJZemU4eYdfKY1DrIJethgqM
	HOr7HS+9j1GT7Ko/Cquwc/KFIio9pEykDJ2Lh3iVmfOtPc1H5a0ViwclwZXV51oM292Jh5VlbQuYP
	diuJNZecVJB1rXX/2kWeKSuNRPQ7Wv1WV5qZbs5gzIf5JrxgugkMstDledtazxqgfvDwR3xZGxYaU
	FUyoX1knj0hgvj2dvpO9gRqBVeVFlYQ43dhheU4Kq8bNgV6dCmKq9K+qNb/lcwVJHfGZ0ZRxm9HXA
	o+0EVoaVjBaERyeU6w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIMu-0000000C8c7-1JRp;
	Mon, 26 Jan 2026 08:54:44 +0000
Received: from relay2.mymailcheap.com ([217.182.113.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIMq-0000000C8bd-3cAU
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 08:54:42 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 0C8663E8B0;
	Mon, 26 Jan 2026 08:54:36 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id A2F0D400D5;
	Mon, 26 Jan 2026 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769417671; bh=TwIToU064K5dMWaz+SRpXB7pa10vjszZ1Jy8t7dLIrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ORqjPLk++EGfsnq5gappSmmd+co4PSfSsPlDjskR5vg14gPN7pChfp5XREpSKs0jx
	 Cbke3yY4poVFGqSSE4Yf72g9OJzkXuhAWPFDGWb495qP0jSi2ecAMoheaHzVbUQEO7
	 +kckd9qRE/pa8VR/InKeQPrA5GsVWV1ezawKn5pw=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id DF98543622;
	Mon, 26 Jan 2026 08:54:20 +0000 (UTC)
Message-ID: <f3256219-bb97-45d4-9364-cf28d3c9dc8a@aosc.io>
Date: Mon, 26 Jan 2026 16:54:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Content-Language: en-US-large, en-US
To: Bibo Mao <maobibo@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org
References: <20260125054322.1237687-1-liushuyu@aosc.io>
 <4b504274-4241-0e3e-3ed3-7804b72b7ee8@loongson.cn>
 <972430be-d2f3-49b6-851b-a057ddfcafec@aosc.io>
 <29565e27-f153-c2c5-cbc3-e0457d45f094@loongson.cn>
 <2fa2dc72-b24e-4504-8c8e-e4ecacda02c4@aosc.io>
 <13746394-1a33-894a-d325-8125743f7906@loongson.cn>
From: liushuyu <liushuyu@aosc.io>
In-Reply-To: <13746394-1a33-894a-d325-8125743f7906@loongson.cn>
X-Rspamd-Queue-Id: A2F0D400D5
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[14.52%];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED(0.00)[mail20.mymailcheap.com:rdns,mail20.mymailcheap.com:helo,aosc.io:mid,aosc.io:from_smtp,aosc.io:from_mime,aosc.io:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[liushuyu.aosc.io:server fail];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[aosc.io,redhat.com,lwn.net,loongson.cn,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mail20.mymailcheap.com:rdns,mail20.mymailcheap.com:helo,aosc.io:mid,aosc.io:from_smtp,aosc.io:from_mime,aosc.io:email];
	SURBL_MULTI_FAIL(0.00)[git.kernel.org:server fail]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005441_108638_143B2FA9 
X-CRM114-Status: GOOD (  34.10  )
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

SGkgQmlibywKCj4KPgo+IE9uIDIwMjYvMS8yNiDkuIvljYgxMjoyMiwgbGl1c2h1eXUgd3JvdGU6
Cj4+IEhpIEJpYm8sCj4+Cj4+Pgo+Pj4KPj4+IE9uIDIwMjYvMS8yNiDkuIrljYgxMTozOCwgbGl1
c2h1eXUgd3JvdGU6Cj4+Pj4gSGkgQmlibywKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjAyNi8xLzI1
IOS4i+WNiDE6NDMsIFppeGluZyBMaXUgd3JvdGU6Cj4+Pj4+PiBUaGlzIGlvY3RsIGNhbiBiZSB1
c2VkIGJ5IHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8gZGV0ZXJtaW5lIHdoaWNoCj4+Pj4+PiAo
c3BlY2lhbCkgcmVnaXN0ZXJzIGFyZSBnZXQvc2V0LWFibGUuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBj
YW4gYmUgdmVyeSB1c2VmdWwgZm9yIGNyb3NzLXBsYXRmb3JtIFZNTXMgc28gdGhhdCB0aGV5IGRv
IG5vdAo+Pj4+Pj4gaGF2ZQo+Pj4+Pj4gdG8gaGFyZGNvZGUgcmVnaXN0ZXIgaW5kaWNlcyBmb3Ig
ZWFjaCBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBaaXhpbmcgTGl1IDxsaXVzaHV5dUBhb3NjLmlvPgo+Pj4+Pj4gLS0tCj4+Pj4+Pgo+Pj4+Pj4g
Rm9yIGV4YW1wbGUsIHRoaXMgaW9jdGwgY291bGQgYmUgdXNlZCBieSBydXN0LXZtbS9ydXN0LWt2
bSBvciBtYXliZQo+Pj4+Pj4gVmlydHVhbEJveC1rdm0gaW4gdGhlIGZ1dHVyZS4KPj4+Pj4+Cj4+
Pj4+PiDCoMKgwqAgRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IHzCoCAyICstCj4+Pj4+
PiDCoMKgwqAgYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuY8KgwqDCoMKgwqAgfCA2OQo+Pj4+Pj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gwqDCoMKgIDIgZmlsZXMg
Y2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4+Pj4+IGIvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4+PiBpbmRleCAwMWEzYWJlZjhhYmIuLmY0NmRk
OGJlMjgyZiAxMDA2NDQKPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJz
dAo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4+PiBAQCAt
MzYwMyw3ICszNjAzLDcgQEAgVkNQVSBtYXRjaGluZyB1bmRlcmx5aW5nIGhvc3QuCj4+Pj4+PiDC
oMKgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+PiDCoMKgwqAgwqAgOkNhcGFiaWxpdHk6
IGJhc2ljCj4+Pj4+PiAtOkFyY2hpdGVjdHVyZXM6IGFybTY0LCBtaXBzLCByaXNjdiwgeDg2IChp
ZiBLVk1fQ0FQX09ORV9SRUcpCj4+Pj4+PiArOkFyY2hpdGVjdHVyZXM6IGFybTY0LCBsb29uZ2Fy
Y2gsIG1pcHMsIHJpc2N2LCB4ODYgKGlmCj4+Pj4+PiBLVk1fQ0FQX09ORV9SRUcpCj4+Pj4+PiDC
oMKgwqAgOlR5cGU6IHZjcHUgaW9jdGwKPj4+Pj4+IMKgwqDCoCA6UGFyYW1ldGVyczogc3RydWN0
IGt2bV9yZWdfbGlzdCAoaW4vb3V0KQo+Pj4+Pj4gwqDCoMKgIDpSZXR1cm5zOiAwIG9uIHN1Y2Nl
c3M7IC0xIG9uIGVycm9yCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva3ZtL3Zj
cHUuYyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMKPj4+Pj4+IGluZGV4IDY1NmI5NTRjMTEz
NC4uYjg4NGViOWM3NmFhIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL3Zj
cHUuYwo+Pj4+Pj4gKysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYwo+Pj4+Pj4gQEAgLTEx
ODYsNiArMTE4Niw1NyBAQCBzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfdmNwdV9zZXRfYXR0cihz
dHJ1Y3QKPj4+Pj4+IGt2bV92Y3B1ICp2Y3B1LAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4+Pj4+IMKgwqDCoCB9Cj4+Pj4+PiDCoMKgwqAgK3N0YXRpYyB1bnNpZ25lZCBsb25n
IGt2bV9sb29uZ2FyY2hfbnVtX2xidF9yZWdzKHZvaWQpCj4+Pj4+PiArewo+Pj4+Pj4gK8KgwqDC
oCAvKiArMSBmb3IgdGhlIExCVF9GVE9QIGZsYWcgKGluc2lkZSBhcmNoLmZwdSkgKi8KPj4+Pj4+
ICvCoMKgwqAgcmV0dXJuIHNpemVvZihzdHJ1Y3QgbG9vbmdhcmNoX2xidCkgLyBzaXplb2YodW5z
aWduZWQgbG9uZykKPj4+Pj4+ICsgMTsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGlj
IHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9udW1fcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCj4+Pj4+PiArewo+Pj4+Pj4gK8KgwqDCoCAvKiArMSBmb3IgdGhlIEtWTV9SRUdfTE9PTkdB
UkNIX0NPVU5URVIgcmVnaXN0ZXIgKi8KPj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyByZXMg
PSBDU1JfTUFYX05VTVMgKyBLVk1fTUFYX0NQVUNGR19SRUdTICsgMTsKPj4+Pj4+ICsKPj4+Pj4+
ICvCoMKgwqAgaWYgKGt2bV9ndWVzdF9oYXNfbGJ0KCZ2Y3B1LT5hcmNoKSkKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCByZXMgKz0ga3ZtX2xvb25nYXJjaF9udW1fbGJ0X3JlZ3MoKTsKPj4+Pj4+ICsK
Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHJlczsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArc3Rh
dGljIGludCBrdm1fbG9vbmdhcmNoX2NvcHlfcmVnX2luZGljZXMoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
NjQgX191c2VyICp1aW5kaWNlcykKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHU2NCByZWc7Cj4+
Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBpOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgQ1NSX01BWF9OVU1TOyBpKyspIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZWcgPSBLVk1fSU9DX0NTUklEKGkpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdXRfdXNl
cihyZWcsIHVpbmRpY2VzKyspKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FRkFVTFQ7Cj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gQ1NSX01BWF9OVU1TIGlzIG1heCBudW1i
ZXIgb2YgYWNjZXNzaWJsZSBDU1IgcmVnaXN0ZXJzLCBpbnN0ZWFkIG9ubHkKPj4+Pj4gcGFydCBv
ZiB0aGVtIGlzIHVzZWQgYnkgdkNQVSBtb2RlbC4gQnkgbXkgdW5kZXJzdGFuZGluZywgdGhlcmUK
Pj4+Pj4gd2lsbCBiZQo+Pj4+PiBubyBtdWNoIG1lYW5pbmcgaWYgQ1NSX01BWF9OVU1TIGlzIHJl
dHVybmVkLiBBbmQgSSB0aGluayBpdCB3aWxsIGJlCj4+Pj4+IGJldHRlciBpZiByZWFsIENTUiBy
ZWdpc3RlciBpZCBhbmQgbnVtYmVyIGlzIHJldHVybmVkLgo+Pj4+Pgo+Pj4+IERpZCB5b3UgbWVh
biB3ZSBzaG91bGQgb25seSByZXR1cm4gdGhlIENTUiByZWdpc3RlcnMgaW5pdGlhbGl6ZWQgaW4K
Pj4+PiB0aGlzCj4+Pj4gZnVuY3Rpb24KPj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9hcmNoL2xvb25nYXJj
aC9rdm0vbWFpbi5jP2lkPTYzODA0ZmVkMTQ5YTY3NTBmZmQyODYxMGM1YzFjOThjY2U2YmQzNzcj
bjQ4Cj4+Pj4KPj4+Pgo+Pj4+ID8KPj4+Pgo+Pj4+IFRoYXQgbG9va3MgbGlrZSBhIHZlcnkgbGFy
Z2UgbGlzdCBhbmQgdGhlIHZhbHVlcyBvZiB0aGUgcmVnaXN0ZXIKPj4+PiBJRHMgYXJlCj4+Pj4g
bm90IGZ1bGx5IGNvbnRpbnVvdXMuIElmIHRoYXQgaXMgdGhlIGNhc2UsIGhvdyBkbyB3ZSBtYWlu
dGFpbiB0aGUKPj4+PiBnZXQvc2V0LWFibGUgQ1NSIHJlZ2lzdGVyIGxpc3Q/Cj4+PiBJdCB3aWxs
IGJlIGJldHRlciBpZiBDU1IgcmVnaXN0ZXIgbGlzdCBjYW4gYmUgY2F0ZWdvcml6ZWQsIGZvciBl
eGFtcGxlCj4+PiB3aXRoIExvb25nQXJjaCBDUFUgbWFudWFsIENTUiByZWdpc3RlciBpcyBzcGxp
dCBpbnRvIDggdHlwZXMgZnJvbQo+Pj4gY2hhcHRlciA3LjQgLS0gNy4xMQo+Pj4KPj4+IEF0IHRo
ZSBiZWdpbm5pbmcsIHRoZXJlIGlzIGJpZyBhcnJheSB3aXRoIHNpemUgQ1NSX01BWF9OVU1TIHdp
dGhvdXQKPj4+IGFueSBjYXRlZ29yeSwgaXQgY2FuIGJlIGZpbmUtZ2FpbmVkIGluIGxhdGUuCj4+
Cj4+IERvZXMgdGhhdCBtZWFuIGluIHRoZSBuZXcgYGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5k
aWNlc2AgZnVuY3Rpb24sIGl0Cj4+IGlzIGFsc28gb2theSB0byBlbWJlZCB0aGlzIGJpZyBsaXN0
IGluIHRoZXJlPwo+IEZpcnN0bHkgSSBkbyBub3Qga25vdyBob3cgdG8gdXNlIGlvY3RsIGNvbW1h
bmQgS1ZNX0dFVF9SRUdfTElTVCBpbiBWTU0KPiBhY3R1YWxseS4KPgo+IEF0IHRoZSBzZWNvbmQg
ZnJvbSB0aGUgd29yZCAiZGV0ZXJtaW5lIHdoaWNoIChzcGVjaWFsKSByZWdpc3RlcnMgYXJlCj4g
Z2V0L3NldC1hYmxlIiwgSSB0aGluayB0aGF0IGl0IGlzIGJldHRlciB0byBzZXQgYWNjZXNzaWJs
ZSBDU1IKPiByZWdpc3RlciBudW1iZXIgYW5kIElEIHJhdGhlciB0aGFuIHRoZSB0b3RhbCBudW1i
ZXIgQ1NSX01BWF9OVU1TLsKgCj4KVW5kZXJzdG9vZC4gSSB3aWxsIHBvc3QgYSB2MiBwYXRjaCwg
YW5kIHdlIGNhbiBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbgpmcm9tIHRoZXJlIHRvIHNlZSBpZiBJ
IHVuZGVyc3Rvb2QgeW91ciBwb2ludHMgY29ycmVjdGx5LgoKPiArc3RhdGljIGludCBrdm1fbG9v
bmdhcmNoX251bV9jc3JfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArwqDCoMKg
IHVuc2lnbmVkIGludCBpLCBjb3VudDsKPiArCj4gK8KgwqDCoCBjb3VudCA9IDAKPiArwqDCoMKg
IGZvciAoaSA9IDA7IGkgPCBDU1JfTUFYX05VTVM7IGkrKykgewo+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIShnZXRfZ2Nzcl9mbGFnKGkpICYgKFNXX0dDU1IgfCBIV19HQ1NSKSkpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4gK8KgwqDCoMKgwqDCoMKgIGNvdW50Kys7Cj4gK8Kg
wqDCoCB9Cj4gK8KgwqDCoCByZXR1cm4gY291bnQ7Cj4gK30KPgo+IHN0YXRpYyB1bnNpZ25lZCBs
b25nIGt2bV9sb29uZ2FyY2hfbnVtX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IHsKPiDC
oMKgwqDCoC8qICsxIGZvciB0aGUgS1ZNX1JFR19MT09OR0FSQ0hfQ09VTlRFUiByZWdpc3RlciAq
Lwo+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyByZXMgPSBrdm1fbG9vbmdhcmNoX251bV9jc3JfcmVn
cyArCj4gS1ZNX01BWF9DUFVDRkdfUkVHUyArIDE7Cj4KPiDCoMKgwqDCoGlmIChrdm1fZ3Vlc3Rf
aGFzX2xidCgmdmNwdS0+YXJjaCkpCj4gwqDCoMKgwqDCoMKgwqAgcmVzICs9IGt2bV9sb29uZ2Fy
Y2hfbnVtX2xidF9yZWdzKCk7Cj4KPiDCoMKgwqDCoHJldHVybiByZXM7Cj4gfQo+Cj4gc3RhdGlj
IGludCBrdm1fbG9vbmdhcmNoX2NvcHlfcmVnX2luZGljZXMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgX191c2Vy
ICp1aW5kaWNlcykKPiB7Cj4gwqDCoMKgwqB1NjQgcmVnOwo+IMKgwqDCoMKgdW5zaWduZWQgaW50
IGk7Cj4KPiDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBDU1JfTUFYX05VTVM7IGkrKykgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoZ2V0X2djc3JfZmxhZyhpKSAmIChT
V19HQ1NSIHwgSFdfR0NTUikpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb250aW51ZTsKPiDCoMKgwqDCoMKgwqDCoCByZWcgPSBLVk1fSU9DX0NTUklEKGkpOwo+
IMKgwqDCoMKgwqDCoMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7Cj4gwqDCoMKgwqB9Cj4KPiBSZWdhcmRzCj4g
QmlibyBNYW8KPj4KPj4gT3IgZG8geW91IHdhbnQgdG8gZXh0cmFjdCB0aGUgbGlzdCBmcm9tIHRo
ZSBga3ZtX2luaXRfZ2Nzcl9mbGFnYAo+PiBmdW5jdGlvbiBhbmQgcmVmYWN0b3IgYm90aCBmdW5j
dGlvbnMgdG8gc2hhcmUgb25lIHNpbmdsZSBiaWcgbGlzdAo+PiAocHJvYmFibHkgaW4gdGhlIGt2
bV9ob3N0LmggaGVhZGVyKT8KPj4KPj4gQmVjYXVzZSBmcm9tIHdoYXQgSSBjb3VsZCB1bmRlcnN0
YW5kLCB5b3VyIHByZXZpb3VzIG1lc3NhZ2VzIHBvaW50IHRvCj4+IHRoYXQgd2UgbmVlZCB0byB1
c2UgdGhpcyBsaXN0IHRvIG1ha2Ugb3V0IHdoYXQgQ1NSIHJlZ2lzdGVycyB0byByZXR1cm4KPj4g
dG8gdGhlIHVzZXIgc3BhY2UgVk1Ncy4KPgo+Pgo+Pj4KPj4+IFJlZ2FyZHMKPj4+IEJpYm8gTWFv
Cj4+Pj4KPj4+Pj4gUmVnYXJkcwo+Pj4+PiBCaWJvIE1hbwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgS1ZNX01BWF9DUFVDRkdfUkVHUzsgaSsrKSB7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmVnID0gS1ZNX0lPQ19DUFVDRkcoaSk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKHB1dF91c2VyKHJlZywgdWluZGljZXMrKykpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4g
K8KgwqDCoCByZWcgPSBLVk1fUkVHX0xPT05HQVJDSF9DT1VOVEVSOwo+Pj4+Pj4gK8KgwqDCoCBp
ZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVGQVVMVDsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgaWYgKCFrdm1fZ3Vlc3RfaGFzX2xi
dCgmdmNwdS0+YXJjaCkpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+PiAr
Cj4+Pj4+PiArwqDCoMKgIGZvciAoaSA9IDE7IGkgPD0ga3ZtX2xvb25nYXJjaF9udW1fbGJ0X3Jl
Z3MoKTsgaSsrKSB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnID0gKEtWTV9SRUdfTE9PTkdB
UkNIX0xCVCB8IEtWTV9SRUdfU0laRV9VNjQgfCBpKTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+PiArCj4+Pj4+PiArwqDC
oMKgIHJldHVybiAwOwo+Pj4+Pj4gK30KPj4+Pj4+ICsKPj4+Pj4+IMKgwqDCoCBsb25nIGt2bV9h
cmNoX3ZjcHVfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaW9jdGwsIHVuc2lnbmVkIGxvbmcgYXJnKQo+
Pj4+Pj4gwqDCoMKgIHsKPj4+Pj4+IEBAIC0xMjUxLDYgKzEzMDIsMjQgQEAgbG9uZyBrdm1fYXJj
aF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByID0ga3ZtX2xvb25nYXJjaF92Y3B1X3NldF9hdHRyKHZjcHUsICZhdHRyKTsKPj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4+PiArwqDCoMKgIGNhc2UgS1ZNX0dFVF9SRUdfTElTVDogewo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCBrdm1fcmVnX2xpc3QgX191c2VyICp1c2VyX2xpc3QgPSBhcmdwOwo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBrdm1fcmVnX2xpc3QgcmVnX2xpc3Q7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgbjsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBy
ID0gLUVGQVVMVDsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY29weV9mcm9tX3VzZXIoJnJl
Z19saXN0LCB1c2VyX2xpc3QsIHNpemVvZihyZWdfbGlzdCkpKQo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgbiA9IHJlZ19saXN0Lm47
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnX2xpc3QubiA9IGt2bV9sb29uZ2FyY2hfbnVtX3Jl
Z3ModmNwdSk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcih1c2VyX2xp
c3QsICZyZWdfbGlzdCwgc2l6ZW9mKHJlZ19saXN0KSkpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByID0gLUUyQklHOwo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChuIDwgcmVnX2xpc3QubikKPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHIgPSBrdm1fbG9vbmdhcmNo
X2NvcHlfcmVnX2luZGljZXModmNwdSwgdXNlcl9saXN0LT5yZWcpOwo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBkZWZh
dWx0Ogo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByID0gLUVOT0lPQ1RMQ01EOwo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+Cj4+Pj4+Cj4+Pj4gVGhhbmtz
LAo+Pj4+IFppeGluZwo+Pj4+Cj4+Pgo+PiBUaGFua3MsCj4+IFppeGluZwo+Pgo+ClRoYW5rcywK
ClppeGluZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
