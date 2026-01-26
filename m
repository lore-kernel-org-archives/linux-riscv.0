Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E60BC88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXNjvboW8V+0RQnL4F5a/9n7PgdV4KGd2lJBPdtkFX4=; b=v435n61EAg6ucZ
	Tp6Y5VIR8qcMx3vJEhy0KpMabngLNxSbaQ4JZ85fr524hWAEyxgIqEOtZpVGcO/kMM8C2qPgJEgAK
	SxSjOLAYnlxq7sgov1FMot3FOMAc3s5E57UW7L2uLpafy9skvBv7j/6tECjsLjxmBglBQca0kDyTR
	mO9Vp7Yk4bXbbFAz3FQxk9DSUVtJTrUpvG1AFM1xo6XQvhTq9wsRAkzwaA7GamDmmvwMWvxzKZ5ao
	V0RLvbTRHjKx1xRH0d+U3sSuBGdg9jEgGG2jy5IddeZe8yD+t7z53pQ8z3ffIbn3rxb3TmsXWxxaE
	F3M4+2NQyzvi+LDDykxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDRK-0000000BqmG-0PJE;
	Mon, 26 Jan 2026 03:38:58 +0000
Received: from relay3.mymailcheap.com ([217.182.119.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDRH-0000000Bqlg-1eW8
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 03:38:56 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 3D6EC3EC2C;
	Mon, 26 Jan 2026 03:38:52 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 5BDD1400D5;
	Mon, 26 Jan 2026 03:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769398731; bh=QDen/lbFr0OrqZPB+Q+4DSK6r/05MWks/Pa21Xlsmko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pqHPWPwiV6w8D+jP5a1SfHUfFaPayXRCL+6lqyAMLthoyY83zoVlQpSbXwoatvvOZ
	 MR38O49DqVOvkLu5ueU65Ys/AzfihVeNlKr0rd2S5PlY8kaXEVEsh+xC2tvxSJ4W/V
	 HuHPJGbCHFp7l60rCJGduqiA4dxhTXHFZ7IqWK70=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 60F7C4097F;
	Mon, 26 Jan 2026 03:38:44 +0000 (UTC)
Message-ID: <972430be-d2f3-49b6-851b-a057ddfcafec@aosc.io>
Date: Mon, 26 Jan 2026 11:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
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
From: liushuyu <liushuyu@aosc.io>
Content-Language: en-US-large, en-US
In-Reply-To: <4b504274-4241-0e3e-3ed3-7804b72b7ee8@loongson.cn>
X-Rspamd-Queue-Id: 5BDD1400D5
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[33.37%];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED(0.00)[mail20.mymailcheap.com:rdns,mail20.mymailcheap.com:helo,aosc.io:mid,aosc.io:from_smtp,aosc.io:from_mime,aosc.io:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[27];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[aosc.io,redhat.com,lwn.net,loongson.cn,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[mail20.mymailcheap.com:rdns,mail20.mymailcheap.com:helo,aosc.io:mid,aosc.io:from_smtp,aosc.io:from_mime,aosc.io:email];
	SURBL_MULTI_FAIL(0.00)[git.kernel.org:server fail,mail20.mymailcheap.com:server fail]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_193855_585077_B7E059FD 
X-CRM114-Status: GOOD (  25.57  )
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

SGkgQmlibywKPgo+Cj4gT24gMjAyNi8xLzI1IOS4i+WNiDE6NDMsIFppeGluZyBMaXUgd3JvdGU6
Cj4+IFRoaXMgaW9jdGwgY2FuIGJlIHVzZWQgYnkgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0byBk
ZXRlcm1pbmUgd2hpY2gKPj4gKHNwZWNpYWwpIHJlZ2lzdGVycyBhcmUgZ2V0L3NldC1hYmxlLgo+
Pgo+PiBUaGlzIGNhbiBiZSB2ZXJ5IHVzZWZ1bCBmb3IgY3Jvc3MtcGxhdGZvcm0gVk1NcyBzbyB0
aGF0IHRoZXkgZG8gbm90IGhhdmUKPj4gdG8gaGFyZGNvZGUgcmVnaXN0ZXIgaW5kaWNlcyBmb3Ig
ZWFjaCBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWml4aW5n
IExpdSA8bGl1c2h1eXVAYW9zYy5pbz4KPj4gLS0tCj4+Cj4+IEZvciBleGFtcGxlLCB0aGlzIGlv
Y3RsIGNvdWxkIGJlIHVzZWQgYnkgcnVzdC12bW0vcnVzdC1rdm0gb3IgbWF5YmUKPj4gVmlydHVh
bEJveC1rdm0gaW4gdGhlIGZ1dHVyZS4KPj4KPj4gwqAgRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9h
cGkucnN0IHzCoCAyICstCj4+IMKgIGFyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmPCoMKgwqDCoMKg
IHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+PiBiL0RvY3VtZW50YXRpb24vdmlydC9r
dm0vYXBpLnJzdAo+PiBpbmRleCAwMWEzYWJlZjhhYmIuLmY0NmRkOGJlMjgyZiAxMDA2NDQKPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vdmlydC9rdm0vYXBpLnJzdAo+PiBAQCAtMzYwMyw3ICszNjAzLDcgQEAgVkNQVSBtYXRjaGlu
ZyB1bmRlcmx5aW5nIGhvc3QuCj4+IMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCDCoCA6
Q2FwYWJpbGl0eTogYmFzaWMKPj4gLTpBcmNoaXRlY3R1cmVzOiBhcm02NCwgbWlwcywgcmlzY3Ys
IHg4NiAoaWYgS1ZNX0NBUF9PTkVfUkVHKQo+PiArOkFyY2hpdGVjdHVyZXM6IGFybTY0LCBsb29u
Z2FyY2gsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykKPj4gwqAgOlR5cGU6
IHZjcHUgaW9jdGwKPj4gwqAgOlBhcmFtZXRlcnM6IHN0cnVjdCBrdm1fcmVnX2xpc3QgKGluL291
dCkKPj4gwqAgOlJldHVybnM6IDAgb24gc3VjY2VzczsgLTEgb24gZXJyb3IKPj4gZGlmZiAtLWdp
dCBhL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMgYi9hcmNoL2xvb25nYXJjaC9rdm0vdmNwdS5j
Cj4+IGluZGV4IDY1NmI5NTRjMTEzNC4uYjg4NGViOWM3NmFhIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L2xvb25nYXJjaC9rdm0vdmNwdS5jCj4+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMK
Pj4gQEAgLTExODYsNiArMTE4Niw1NyBAQCBzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfdmNwdV9z
ZXRfYXR0cihzdHJ1Y3QKPj4ga3ZtX3ZjcHUgKnZjcHUsCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4gwqAgfQo+PiDCoCArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9udW1f
bGJ0X3JlZ3Modm9pZCkKPj4gK3sKPj4gK8KgwqDCoCAvKiArMSBmb3IgdGhlIExCVF9GVE9QIGZs
YWcgKGluc2lkZSBhcmNoLmZwdSkgKi8KPj4gK8KgwqDCoCByZXR1cm4gc2l6ZW9mKHN0cnVjdCBs
b29uZ2FyY2hfbGJ0KSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSArIDE7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9sb29uZ2FyY2hfbnVtX3JlZ3Moc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQo+PiArewo+PiArwqDCoMKgIC8qICsxIGZvciB0aGUgS1ZNX1JFR19MT09OR0FS
Q0hfQ09VTlRFUiByZWdpc3RlciAqLwo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgcmVzID0gQ1NS
X01BWF9OVU1TICsgS1ZNX01BWF9DUFVDRkdfUkVHUyArIDE7Cj4+ICsKPj4gK8KgwqDCoCBpZiAo
a3ZtX2d1ZXN0X2hhc19sYnQoJnZjcHUtPmFyY2gpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmVzICs9
IGt2bV9sb29uZ2FyY2hfbnVtX2xidF9yZWdzKCk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gcmVz
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNl
cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTY0IF9fdXNlciAqdWluZGljZXMpCj4+ICt7Cj4+ICvCoMKgwqAgdTY0
IHJlZzsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4gKwo+PiArwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBDU1JfTUFYX05VTVM7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqAgcmVnID0gS1ZN
X0lPQ19DU1JJRChpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRp
Y2VzKyspKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4gK8Kg
wqDCoCB9Cj4gQ1NSX01BWF9OVU1TIGlzIG1heCBudW1iZXIgb2YgYWNjZXNzaWJsZSBDU1IgcmVn
aXN0ZXJzLCBpbnN0ZWFkIG9ubHkKPiBwYXJ0IG9mIHRoZW0gaXMgdXNlZCBieSB2Q1BVIG1vZGVs
LiBCeSBteSB1bmRlcnN0YW5kaW5nLCB0aGVyZSB3aWxsIGJlCj4gbm8gbXVjaCBtZWFuaW5nIGlm
IENTUl9NQVhfTlVNUyBpcyByZXR1cm5lZC4gQW5kIEkgdGhpbmsgaXQgd2lsbCBiZQo+IGJldHRl
ciBpZiByZWFsIENTUiByZWdpc3RlciBpZCBhbmQgbnVtYmVyIGlzIHJldHVybmVkLsKgCj4KRGlk
IHlvdSBtZWFuIHdlIHNob3VsZCBvbmx5IHJldHVybiB0aGUgQ1NSIHJlZ2lzdGVycyBpbml0aWFs
aXplZCBpbiB0aGlzCmZ1bmN0aW9uCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvbG9vbmdhcmNoL2t2bS9t
YWluLmM/aWQ9NjM4MDRmZWQxNDlhNjc1MGZmZDI4NjEwYzVjMWM5OGNjZTZiZDM3NyNuNDgKPwoK
VGhhdCBsb29rcyBsaWtlIGEgdmVyeSBsYXJnZSBsaXN0IGFuZCB0aGUgdmFsdWVzIG9mIHRoZSBy
ZWdpc3RlciBJRHMgYXJlCm5vdCBmdWxseSBjb250aW51b3VzLiBJZiB0aGF0IGlzIHRoZSBjYXNl
LCBob3cgZG8gd2UgbWFpbnRhaW4gdGhlCmdldC9zZXQtYWJsZSBDU1IgcmVnaXN0ZXIgbGlzdD8K
Cj4gUmVnYXJkcwo+IEJpYm8gTWFvCj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgS1ZN
X01BWF9DUFVDRkdfUkVHUzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSBLVk1fSU9D
X0NQVUNGRyhpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2Vz
KyspKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4gK8KgwqDC
oCB9Cj4+ICsKPj4gK8KgwqDCoCByZWcgPSBLVk1fUkVHX0xPT05HQVJDSF9DT1VOVEVSOwo+PiAr
wqDCoMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FRkFVTFQ7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIWt2bV9ndWVzdF9oYXNfbGJ0KCZ2
Y3B1LT5hcmNoKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAg
Zm9yIChpID0gMTsgaSA8PSBrdm1fbG9vbmdhcmNoX251bV9sYnRfcmVncygpOyBpKyspIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJlZyA9IChLVk1fUkVHX0xPT05HQVJDSF9MQlQgfCBLVk1fUkVHX1NJ
WkVfVTY0IHwgaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocHV0X3VzZXIocmVnLCB1aW5kaWNl
cysrKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7Cj4+ICvCoMKg
wqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gwqAgbG9uZyBrdm1f
YXJjaF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGludCBpb2N0bCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+IMKgIHsK
Pj4gQEAgLTEyNTEsNiArMTMwMiwyNCBAQCBsb25nIGt2bV9hcmNoX3ZjcHVfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbHAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByID0ga3ZtX2xvb25nYXJjaF92Y3B1
X3NldF9hdHRyKHZjcHUsICZhdHRyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDC
oMKgwqDCoMKgIH0KPj4gK8KgwqDCoCBjYXNlIEtWTV9HRVRfUkVHX0xJU1Q6IHsKPj4gK8KgwqDC
oMKgwqDCoMKgIHN0cnVjdCBrdm1fcmVnX2xpc3QgX191c2VyICp1c2VyX2xpc3QgPSBhcmdwOwo+
PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGt2bV9yZWdfbGlzdCByZWdfbGlzdDsKPj4gK8KgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIG47Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHIgPSAtRUZBVUxU
Owo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKCZyZWdfbGlzdCwgdXNlcl9s
aXN0LCBzaXplb2YocmVnX2xpc3QpKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBuID0gcmVnX2xpc3QubjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJl
Z19saXN0Lm4gPSBrdm1fbG9vbmdhcmNoX251bV9yZWdzKHZjcHUpOwo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKGNvcHlfdG9fdXNlcih1c2VyX2xpc3QsICZyZWdfbGlzdCwgc2l6ZW9mKHJlZ19saXN0
KSkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAg
ciA9IC1FMkJJRzsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChuIDwgcmVnX2xpc3QubikKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoCByID0ga3ZtX2xv
b25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHZjcHUsIHVzZXJfbGlzdC0+cmVnKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBkZWZhdWx0Ogo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgciA9IC1FTk9JT0NUTENNRDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+Pgo+ClRoYW5rcywKWml4aW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
