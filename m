Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5FEC88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzdLcy8Z1DvF42QE/X1VuIMAV2YU4kT8VaJNyahV4WA=; b=Gi6ECIu5TIuYp7
	e678Stx2P8q3MDJZu4webRPLgonYYpTrWWYMmk7G1PsPmH/aMVdpBL3g5eUD7A2+QV90mkOzfhCC4
	/nOkbuNuhiKBPAnAL5XGdyOZNzPdJ2Kw6eZDpjBuUliJ33sM7XuX6oKnhGHgTabU8HHzR3Fu/jTwm
	UX+DTUlb1JzJ9Ukwczt7UwvLya1uc2kIvnozpgEVY70Xoum09OHlHY0ppBLdPYixUvxTX1p3HHLPU
	jo+yNC6A77yBCxJEoOKltTBsHyQyvTARG8mNGp2hAIaHXyue7lUTBbNZ5TCohxAFpEqn9nRfw2/l4
	q8yJxEE1H8KZEgl1Z5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE82-0000000Bt4d-2IP3;
	Mon, 26 Jan 2026 04:23:06 +0000
Received: from relay2.mymailcheap.com ([151.80.165.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE7z-0000000Bt3B-3XFY
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:23:05 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id C9B973E878;
	Mon, 26 Jan 2026 04:23:00 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 1697340408;
	Mon, 26 Jan 2026 04:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769401378; bh=RcYHwyI32BEHw/TkJ87L802B+/oqw8tkQehkzjJ6zgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GynOa++vHBLhePi4NPGWXs5Jkdyy2eZ5sAsWFCWtNaInrTHUrhM5HTgCuus85w3or
	 DNo7FBKi5u/CD9o8nUVbaW/ApBh6LjbzmGBsCOrxWmDHNx7ePjoja/42KX4WPeiwfC
	 9fbkcMw1momYUVXh5+ut4b5r/cBrwnTdK/Lq5Cy0=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id C3F5B4097F;
	Mon, 26 Jan 2026 04:22:50 +0000 (UTC)
Message-ID: <2fa2dc72-b24e-4504-8c8e-e4ecacda02c4@aosc.io>
Date: Mon, 26 Jan 2026 12:22:48 +0800
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
From: liushuyu <liushuyu@aosc.io>
In-Reply-To: <29565e27-f153-c2c5-cbc3-e0457d45f094@loongson.cn>
X-Rspamd-Queue-Id: 1697340408
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_CC(0.00)[aosc.io,redhat.com,lwn.net,loongson.cn,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: nf2.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202304_038297_A75E4FC0 
X-CRM114-Status: GOOD (  27.81  )
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

SGkgQmlibywKCj4KPgo+IE9uIDIwMjYvMS8yNiDkuIrljYgxMTozOCwgbGl1c2h1eXUgd3JvdGU6
Cj4+IEhpIEJpYm8sCj4+Pgo+Pj4KPj4+IE9uIDIwMjYvMS8yNSDkuIvljYgxOjQzLCBaaXhpbmcg
TGl1IHdyb3RlOgo+Pj4+IFRoaXMgaW9jdGwgY2FuIGJlIHVzZWQgYnkgdXNlcnNwYWNlIGFwcGxp
Y2F0aW9ucyB0byBkZXRlcm1pbmUgd2hpY2gKPj4+PiAoc3BlY2lhbCkgcmVnaXN0ZXJzIGFyZSBn
ZXQvc2V0LWFibGUuCj4+Pj4KPj4+PiBUaGlzIGNhbiBiZSB2ZXJ5IHVzZWZ1bCBmb3IgY3Jvc3Mt
cGxhdGZvcm0gVk1NcyBzbyB0aGF0IHRoZXkgZG8gbm90Cj4+Pj4gaGF2ZQo+Pj4+IHRvIGhhcmRj
b2RlIHJlZ2lzdGVyIGluZGljZXMgZm9yIGVhY2ggc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaXhpbmcgTGl1IDxsaXVzaHV5dUBhb3NjLmlvPgo+Pj4+
IC0tLQo+Pj4+Cj4+Pj4gRm9yIGV4YW1wbGUsIHRoaXMgaW9jdGwgY291bGQgYmUgdXNlZCBieSBy
dXN0LXZtbS9ydXN0LWt2bSBvciBtYXliZQo+Pj4+IFZpcnR1YWxCb3gta3ZtIGluIHRoZSBmdXR1
cmUuCj4+Pj4KPj4+PiDCoMKgIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCB8wqAgMiAr
LQo+Pj4+IMKgwqAgYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuY8KgwqDCoMKgwqAgfCA2OQo+Pj4+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+PiDCoMKgIDIgZmlsZXMgY2hh
bmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+Pj4+IGIvRG9jdW1lbnRhdGlvbi92
aXJ0L2t2bS9hcGkucnN0Cj4+Pj4gaW5kZXggMDFhM2FiZWY4YWJiLi5mNDZkZDhiZTI4MmYgMTAw
NjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4gKysrIGIv
RG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4gQEAgLTM2MDMsNyArMzYwMyw3IEBA
IFZDUFUgbWF0Y2hpbmcgdW5kZXJseWluZyBob3N0Lgo+Pj4+IMKgwqAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+Pj4gwqDCoCDCoCA6Q2FwYWJpbGl0eTogYmFzaWMKPj4+PiAtOkFyY2hpdGVjdHVy
ZXM6IGFybTY0LCBtaXBzLCByaXNjdiwgeDg2IChpZiBLVk1fQ0FQX09ORV9SRUcpCj4+Pj4gKzpB
cmNoaXRlY3R1cmVzOiBhcm02NCwgbG9vbmdhcmNoLCBtaXBzLCByaXNjdiwgeDg2IChpZgo+Pj4+
IEtWTV9DQVBfT05FX1JFRykKPj4+PiDCoMKgIDpUeXBlOiB2Y3B1IGlvY3RsCj4+Pj4gwqDCoCA6
UGFyYW1ldGVyczogc3RydWN0IGt2bV9yZWdfbGlzdCAoaW4vb3V0KQo+Pj4+IMKgwqAgOlJldHVy
bnM6IDAgb24gc3VjY2VzczsgLTEgb24gZXJyb3IKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29u
Z2FyY2gva3ZtL3ZjcHUuYyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMKPj4+PiBpbmRleCA2
NTZiOTU0YzExMzQuLmI4ODRlYjljNzZhYSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2xvb25nYXJj
aC9rdm0vdmNwdS5jCj4+Pj4gKysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYwo+Pj4+IEBA
IC0xMTg2LDYgKzExODYsNTcgQEAgc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX3ZjcHVfc2V0X2F0
dHIoc3RydWN0Cj4+Pj4ga3ZtX3ZjcHUgKnZjcHUsCj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7Cj4+Pj4gwqDCoCB9Cj4+Pj4gwqDCoCArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25n
YXJjaF9udW1fbGJ0X3JlZ3Modm9pZCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgLyogKzEgZm9yIHRo
ZSBMQlRfRlRPUCBmbGFnIChpbnNpZGUgYXJjaC5mcHUpICovCj4+Pj4gK8KgwqDCoCByZXR1cm4g
c2l6ZW9mKHN0cnVjdCBsb29uZ2FyY2hfbGJ0KSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSArIDE7
Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9sb29uZ2FyY2hf
bnVtX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCAvKiAr
MSBmb3IgdGhlIEtWTV9SRUdfTE9PTkdBUkNIX0NPVU5URVIgcmVnaXN0ZXIgKi8KPj4+PiArwqDC
oMKgIHVuc2lnbmVkIGxvbmcgcmVzID0gQ1NSX01BWF9OVU1TICsgS1ZNX01BWF9DUFVDRkdfUkVH
UyArIDE7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKGt2bV9ndWVzdF9oYXNfbGJ0KCZ2Y3B1LT5h
cmNoKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmVzICs9IGt2bV9sb29uZ2FyY2hfbnVtX2xidF9y
ZWdzKCk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0dXJuIHJlczsKPj4+PiArfQo+Pj4+ICsKPj4+
PiArc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX2NvcHlfcmVnX2luZGljZXMoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdTY0IF9fdXNlciAqdWluZGljZXMpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHU2NCByZWc7Cj4+
Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgQ1NSX01BWF9OVU1TOyBpKyspIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnID0gS1ZN
X0lPQ19DU1JJRChpKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHB1dF91c2VyKHJlZywgdWlu
ZGljZXMrKykpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7Cj4+
Pj4gK8KgwqDCoCB9Cj4+PiBDU1JfTUFYX05VTVMgaXMgbWF4IG51bWJlciBvZiBhY2Nlc3NpYmxl
IENTUiByZWdpc3RlcnMsIGluc3RlYWQgb25seQo+Pj4gcGFydCBvZiB0aGVtIGlzIHVzZWQgYnkg
dkNQVSBtb2RlbC4gQnkgbXkgdW5kZXJzdGFuZGluZywgdGhlcmUgd2lsbCBiZQo+Pj4gbm8gbXVj
aCBtZWFuaW5nIGlmIENTUl9NQVhfTlVNUyBpcyByZXR1cm5lZC4gQW5kIEkgdGhpbmsgaXQgd2ls
bCBiZQo+Pj4gYmV0dGVyIGlmIHJlYWwgQ1NSIHJlZ2lzdGVyIGlkIGFuZCBudW1iZXIgaXMgcmV0
dXJuZWQuCj4+Pgo+PiBEaWQgeW91IG1lYW4gd2Ugc2hvdWxkIG9ubHkgcmV0dXJuIHRoZSBDU1Ig
cmVnaXN0ZXJzIGluaXRpYWxpemVkIGluIHRoaXMKPj4gZnVuY3Rpb24KPj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvYXJjaC9sb29uZ2FyY2gva3ZtL21haW4uYz9pZD02MzgwNGZlZDE0OWE2NzUwZmZkMjg2MTBj
NWMxYzk4Y2NlNmJkMzc3I240OAo+Pgo+PiA/Cj4+Cj4+IFRoYXQgbG9va3MgbGlrZSBhIHZlcnkg
bGFyZ2UgbGlzdCBhbmQgdGhlIHZhbHVlcyBvZiB0aGUgcmVnaXN0ZXIgSURzIGFyZQo+PiBub3Qg
ZnVsbHkgY29udGludW91cy4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgaG93IGRvIHdlIG1haW50YWlu
IHRoZQo+PiBnZXQvc2V0LWFibGUgQ1NSIHJlZ2lzdGVyIGxpc3Q/Cj4gSXQgd2lsbCBiZSBiZXR0
ZXIgaWYgQ1NSIHJlZ2lzdGVyIGxpc3QgY2FuIGJlIGNhdGVnb3JpemVkLCBmb3IgZXhhbXBsZQo+
IHdpdGggTG9vbmdBcmNoIENQVSBtYW51YWwgQ1NSIHJlZ2lzdGVyIGlzIHNwbGl0IGludG8gOCB0
eXBlcyBmcm9tCj4gY2hhcHRlciA3LjQgLS0gNy4xMQo+Cj4gQXQgdGhlIGJlZ2lubmluZywgdGhl
cmUgaXMgYmlnIGFycmF5IHdpdGggc2l6ZSBDU1JfTUFYX05VTVMgd2l0aG91dAo+IGFueSBjYXRl
Z29yeSwgaXQgY2FuIGJlIGZpbmUtZ2FpbmVkIGluIGxhdGUuwqAKCkRvZXMgdGhhdCBtZWFuIGlu
IHRoZSBuZXcgYGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNlc2AgZnVuY3Rpb24sIGl0Cmlz
IGFsc28gb2theSB0byBlbWJlZCB0aGlzIGJpZyBsaXN0IGluIHRoZXJlPwoKT3IgZG8geW91IHdh
bnQgdG8gZXh0cmFjdCB0aGUgbGlzdCBmcm9tIHRoZSBga3ZtX2luaXRfZ2Nzcl9mbGFnYApmdW5j
dGlvbiBhbmQgcmVmYWN0b3IgYm90aCBmdW5jdGlvbnMgdG8gc2hhcmUgb25lIHNpbmdsZSBiaWcg
bGlzdAoocHJvYmFibHkgaW4gdGhlIGt2bV9ob3N0LmggaGVhZGVyKT8KCkJlY2F1c2UgZnJvbSB3
aGF0IEkgY291bGQgdW5kZXJzdGFuZCwgeW91ciBwcmV2aW91cyBtZXNzYWdlcyBwb2ludCB0bwp0
aGF0IHdlIG5lZWQgdG8gdXNlIHRoaXMgbGlzdCB0byBtYWtlIG91dCB3aGF0IENTUiByZWdpc3Rl
cnMgdG8gcmV0dXJuCnRvIHRoZSB1c2VyIHNwYWNlIFZNTXMuCgo+Cj4gUmVnYXJkcwo+IEJpYm8g
TWFvCj4+Cj4+PiBSZWdhcmRzCj4+PiBCaWJvIE1hbwo+Pj4+ICsKPj4+PiArwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBLVk1fTUFYX0NQVUNGR19SRUdTOyBpKyspIHsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgcmVnID0gS1ZNX0lPQ19DUFVDRkcoaSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdXRf
dXNlcihyZWcsIHVpbmRpY2VzKyspKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUZBVUxUOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgIHJlZyA9IEtWTV9S
RUdfTE9PTkdBUkNIX0NPVU5URVI7Cj4+Pj4gK8KgwqDCoCBpZiAocHV0X3VzZXIocmVnLCB1aW5k
aWNlcysrKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgaWYgKCFrdm1fZ3Vlc3RfaGFzX2xidCgmdmNwdS0+YXJjaCkpCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGZvciAoaSA9IDE7IGkgPD0g
a3ZtX2xvb25nYXJjaF9udW1fbGJ0X3JlZ3MoKTsgaSsrKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJlZyA9IChLVk1fUkVHX0xPT05HQVJDSF9MQlQgfCBLVk1fUkVHX1NJWkVfVTY0IHwgaSk7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+
ICsKPj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+IMKgwqAgbG9uZyBr
dm1fYXJjaF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaW9jdGwsIHVuc2lnbmVkIGxvbmcgYXJnKQo+
Pj4+IMKgwqAgewo+Pj4+IEBAIC0xMjUxLDYgKzEzMDIsMjQgQEAgbG9uZyBrdm1fYXJjaF92Y3B1
X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBr
dm1fbG9vbmdhcmNoX3ZjcHVfc2V0X2F0dHIodmNwdSwgJmF0dHIpOwo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoCBjYXNlIEtW
TV9HRVRfUkVHX0xJU1Q6IHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGt2bV9yZWdfbGlz
dCBfX3VzZXIgKnVzZXJfbGlzdCA9IGFyZ3A7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBr
dm1fcmVnX2xpc3QgcmVnX2xpc3Q7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG47Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByID0gLUVGQVVMVDsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKGNvcHlfZnJvbV91c2VyKCZyZWdfbGlzdCwgdXNlcl9saXN0LCBzaXplb2YocmVnX2xp
c3QpKSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgbiA9IHJlZ19saXN0Lm47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJlZ19saXN0Lm4gPSBr
dm1fbG9vbmdhcmNoX251bV9yZWdzKHZjcHUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY29w
eV90b191c2VyKHVzZXJfbGlzdCwgJnJlZ19saXN0LCBzaXplb2YocmVnX2xpc3QpKSkKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+PiArwqDCoMKgwqDCoMKgwqAgciA9IC1F
MkJJRzsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG4gPCByZWdfbGlzdC5uKQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByID0ga3ZtX2xv
b25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHZjcHUsIHVzZXJfbGlzdC0+cmVnKTsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgIGRlZmF1
bHQ6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IC1FTk9JT0NUTENNRDsKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pgo+Pj4KPj4gVGhhbmtzLAo+PiBaaXhpbmcKPj4K
PgpUaGFua3MsClppeGluZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
