Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF43D172B9
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9R2Jh5WZTqs/fpXiUNZ5lbH6zw/5o4NKD69ybj3vUA=; b=yzAa00si1hooT6
	gi4ErM9PE1CnMTGtpKwKmCA+1bwkco0kTloVkFFghyC+snhjhzw4/BYnjmhobPBp6tIZ1Jbbg+fsR
	1byaHkSdy25qfx0AzLEo4HI6pDxbbiD/FI1w4tmxdsuUscDCr8fI+8kZOGIT28AxIjRn1DkOVEH9R
	9f8tBj4EMznV8GGRlKpnsdJ4inXrCp2aTNyQi8CVbC8QeteEl7Vh+cE/xOBlJIryiPolc9XyriJAa
	41To3HR9g4nJwxNe8osGvsGuwoSP+7q2jALz4R9zx3JG7F4dXSBKWNxIpJlD7GbK6KzFe0KSiLO5s
	Tfd9p1QGEP3xrFjd/mVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjsO-00000004M58-2Xh8;
	Mon, 02 Feb 2026 02:41:20 +0000
Received: from relay2.mymailcheap.com ([217.182.113.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjsK-00000004M4F-2Ltr
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 02:41:19 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 599A33E878;
	Mon,  2 Feb 2026 02:41:13 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 91C62400D6;
	Mon,  2 Feb 2026 02:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1770000072; bh=Okg8nM8RIwPGp3XMtAzUD+/PFxdQrarB/WAD0TjxvLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z0c9f/INbi3qUe6D8KSM6UFdJ4I9bb1PtE6bfnp24TuvIoxWYNKGBwI9o8yGcxGdm
	 719IqekMDL4n7LogoHyDTJ25LQSq5YKL5OekRn3MKK50W1emnNvgQEOSCS7aEdHTQ4
	 zXb0K5/dmpLRza2HNfN5MJhxi1vbB4FmlR3khX1I=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4F7214017F;
	Mon,  2 Feb 2026 02:41:08 +0000 (UTC)
Message-ID: <c35ba2fd-6fc2-4cbf-ba62-70dcfaac399c@aosc.io>
Date: Mon, 2 Feb 2026 10:41:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Content-Language: en-US-large, en-US
To: Bibo Mao <maobibo@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260201072124.566587-1-liushuyu@aosc.io>
 <fe2dd7e1-4480-78e0-cfbd-4fc3574c589c@loongson.cn>
From: liushuyu <liushuyu@aosc.io>
In-Reply-To: <fe2dd7e1-4480-78e0-cfbd-4fc3574c589c@loongson.cn>
X-Rspamd-Queue-Id: 91C62400D6
X-Spamd-Result: default: False [-0.44 / 10.00];
	BAYES_HAM(-0.34)[76.19%];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[liushuyu.aosc.io:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_184116_760849_602AE6CC 
X-CRM114-Status: GOOD (  27.06  )
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

Cj4KPgo+IE9uIDIwMjYvMi8xIOS4i+WNiDM6MjEsIFppeGluZyBMaXUgd3JvdGU6Cj4+IFRoaXMg
aW9jdGwgY2FuIGJlIHVzZWQgYnkgdGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8gZGV0ZXJt
aW5lIHdoaWNoCj4+IChzcGVjaWFsKSByZWdpc3RlcnMgYXJlIGdldC9zZXQtYWJsZSBpbiBhIG1l
YW5pbmdmdWwgd2F5Lgo+Pgo+PiBUaGlzIGNhbiBiZSB2ZXJ5IHVzZWZ1bCBmb3IgY3Jvc3MtcGxh
dGZvcm0gVk1NcyBzbyB0aGF0IHRoZXkgZG8gbm90IGhhdmUKPj4gdG8gaGFyZGNvZGUgcmVnaXN0
ZXIgaW5kaWNlcyBmb3IgZWFjaCBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogWml4aW5nIExpdSA8bGl1c2h1eXVAYW9zYy5pbz4KPj4gLS0tCj4+IMKgIERvY3Vt
ZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCB8wqAgMiArLQo+PiDCoCBhcmNoL2xvb25nYXJjaC9r
dm0vdmNwdS5jwqDCoMKgwqDCoCB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4gYi9E
b2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4gaW5kZXggMDFhM2FiZWY4YWJiLi5mNDZk
ZDhiZTI4MmYgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+
PiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4gQEAgLTM2MDMsNyArMzYw
Myw3IEBAIFZDUFUgbWF0Y2hpbmcgdW5kZXJseWluZyBob3N0Lgo+PiDCoCAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4gwqAgwqAgOkNhcGFiaWxpdHk6IGJhc2ljCj4+IC06QXJjaGl0ZWN0dXJlczog
YXJtNjQsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykKPj4gKzpBcmNoaXRl
Y3R1cmVzOiBhcm02NCwgbG9vbmdhcmNoLCBtaXBzLCByaXNjdiwgeDg2IChpZiBLVk1fQ0FQX09O
RV9SRUcpCj4+IMKgIDpUeXBlOiB2Y3B1IGlvY3RsCj4+IMKgIDpQYXJhbWV0ZXJzOiBzdHJ1Y3Qg
a3ZtX3JlZ19saXN0IChpbi9vdXQpCj4+IMKgIDpSZXR1cm5zOiAwIG9uIHN1Y2Nlc3M7IC0xIG9u
IGVycm9yCj4+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9rdm0vdmNwdS5jIGIvYXJjaC9s
b29uZ2FyY2gva3ZtL3ZjcHUuYwo+PiBpbmRleCA2NTZiOTU0YzExMzQuLmZiODAwMWRlYWRjOSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNoL2xv
b25nYXJjaC9rdm0vdmNwdS5jCj4+IEBAIC0xNCw2ICsxNCw4IEBACj4+IMKgICNkZWZpbmUgQ1JF
QVRFX1RSQUNFX1BPSU5UUwo+PiDCoCAjaW5jbHVkZSAidHJhY2UuaCIKPj4gwqAgKyNkZWZpbmUg
TlVNX0xCVF9SRUdTIDYKPj4gKwo+PiDCoCBjb25zdCBzdHJ1Y3QgX2t2bV9zdGF0c19kZXNjIGt2
bV92Y3B1X3N0YXRzX2Rlc2NbXSA9IHsKPj4gwqDCoMKgwqDCoCBLVk1fR0VORVJJQ19WQ1BVX1NU
QVRTKCksCj4+IMKgwqDCoMKgwqAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGludF9leGl0cyks
Cj4+IEBAIC0xMTg2LDYgKzExODgsNjcgQEAgc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX3ZjcHVf
c2V0X2F0dHIoc3RydWN0Cj4+IGt2bV92Y3B1ICp2Y3B1LAo+PiDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF93YWxrX2NzcnMoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQKPj4gX191c2VyICp1aW5kaWNlcykKPj4gK3sKPj4gK8Kg
wqDCoCB1bnNpZ25lZCBpbnQgaSwgY291bnQ7Cj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkgPSAwLCBj
b3VudCA9IDA7IGkgPCBDU1JfTUFYX05VTVM7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KCEoZ2V0X2djc3JfZmxhZyhpKSAmIChTV19HQ1NSIHwgSFdfR0NTUikpKQo+IE15IG1haW4gY29u
Y2VybiBpcyBob3cgdG8gdXNlIEtWTV9HRVRfUkVHX0xJU1QgaW9jdGwgY29tbWFuZCwgdGhlcmUK
PiB3aWxsIGJlIGNvbXBhdGlibGUgaXNzdWUgaWYgdGhlIGRldGFpbCB1c2Ugc2NlbmVyeSBhYm91
dAo+IEtWTV9HRVRfUkVHX0xJU1QgY29tbWFuZCBpcyBub3QgY2xlYXIuCj4KPiBDYW4gS1ZNX0dF
VF9SRUdfTElTVCBpb2N0bCBjb21tYW5kIGJlIHVzZWQgYmVmb3JlIHZDUFUgZmVhdHVyZQo+IGZp
bmFsaXplZD8gSWYgbm90LCBpdCBpcyBvbmx5IHVzZWQgYWZ0ZXIgdkNQVSBmZWF0dXJlIGZpbmFs
aXplZCwgZ3Vlc3QKPiBDU1IgcmVnaXN0ZXJzIHNob3VsZCBiYXNlIG9uIHZDUFUgZmVhdHVyZXMg
cmF0aGVyIHRoYW4gaG9zdCBmZWF0dXJlcy4KPiBIZXJlIGdldF9nY3NyX2ZsYWcoKSBpcyBiYXNl
ZCBvbiBob3N0IGZlYXR1cmVzLsKgCj4KV2UgY2FuIGFkZCBhIHdhcm5pbmcgdG8gdGhlIGRvY3Vt
ZW50YXRpb24gc2F5aW5nIHVzaW5nIEtWTV9HRVRfUkVHX0xJU1QKYmVmb3JlIHZDUFUgZmVhdHVy
ZSBmaW5hbGl6YXRpb24gaXMgZm9yYmlkZGVuLiBUaGlzIGlzIGhvdyBBUk0KaW1wbGVtZW50ZWQg
dGhlaXIgdGhpbmcgKHRoZSBkb2N1bWVudGF0aW9uIHNhaWQgIk90aGVyIGNhbGxzIHRoYXQgZGVw
ZW5kCm9uIGEgcGFydGljdWxhciBmZWF0dXJlIGJlaW5nIGZpbmFsaXplZCwgc3VjaCBhcyBLVk1f
UlVOLApLVk1fR0VUX1JFR19MSVNULCBLVk1fR0VUX09ORV9SRUcgYW5kIEtWTV9TRVRfT05FX1JF
Rywgd2lsbCBmYWlsIHdpdGgKLUVQRVJNIHVubGVzcyB0aGUgZmVhdHVyZSBoYXMgYWxyZWFkeSBi
ZWVuIGZpbmFsaXplZCBieSBtZWFucyBvZiBhCktWTV9BUk1fVkNQVV9GSU5BTElaRSBjYWxsLiIp
IFdlIGNhbiBwcm9iYWJseSBkbyB0aGUgc2FtZS4KCldoYXQgZG8geW91IHRoaW5rPyBJZiB5b3Ug
dGhpbmsgdGhpcyBpcyBhY2NlcHRhYmxlLCBJIGNhbiBzZW5kIGEgdjQKcGF0Y2ggdGhhdCBhZGRz
IGEgc2ltaWxhciB3YXJuaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uLgoKPiBSZWdhcmRzCj4gQmli
byBNYW/CoAoKVGhhbmtzLAoKWml4aW5nCgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250
aW51ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbnN0IHU2NCByZWcgPSBLVk1fSU9DX0NTUklEKGkp
Owo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHVpbmRpY2VzICYmIHB1dF91c2VyKHJlZywgdWluZGlj
ZXMrKykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+PiArwqDC
oMKgwqDCoMKgwqAgY291bnQrKzsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4g
Y291bnQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9sb29uZ2FyY2hf
bnVtX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiArewo+PiArwqDCoMKgIC8qICsxIGZv
ciB0aGUgS1ZNX1JFR19MT09OR0FSQ0hfQ09VTlRFUiByZWdpc3RlciAqLwo+PiArwqDCoMKgIHVu
c2lnbmVkIGxvbmcgcmVzID0KPj4gK8KgwqDCoMKgwqDCoMKgIGt2bV9sb29uZ2FyY2hfd2Fsa19j
c3JzKHZjcHUsIE5VTEwpICsgS1ZNX01BWF9DUFVDRkdfUkVHUyArIDE7Cj4+ICsKPj4gK8KgwqDC
oCBpZiAoa3ZtX2d1ZXN0X2hhc19sYnQoJnZjcHUtPmFyY2gpKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmVzICs9IE5VTV9MQlRfUkVHUzsKPj4gKwo+PiArwqDCoMKgIHJldHVybiByZXM7Cj4+ICt9Cj4+
ICsKPj4gK3N0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1NjQgX191c2VyICp1aW5kaWNlcykKPj4gK3sKPj4gK8KgwqDCoCB1NjQgcmVnOwo+PiAr
wqDCoMKgIHVuc2lnbmVkIGludCBpOwo+PiArCj4+ICvCoMKgwqAgaSA9IGt2bV9sb29uZ2FyY2hf
d2Fsa19jc3JzKHZjcHUsIHVpbmRpY2VzKTsKPj4gK8KgwqDCoCBpZiAoaSA8IDApCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gaTsKPj4gK8KgwqDCoCB1aW5kaWNlcyArPSBpOwo+PiArCj4+ICvC
oMKgwqAgZm9yIChpID0gMDsgaSA8IEtWTV9NQVhfQ1BVQ0ZHX1JFR1M7IGkrKykgewo+PiArwqDC
oMKgwqDCoMKgwqAgcmVnID0gS1ZNX0lPQ19DUFVDRkcoaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FRkFVTFQ7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmVnID0gS1ZNX1JF
R19MT09OR0FSQ0hfQ09VTlRFUjsKPj4gK8KgwqDCoCBpZiAocHV0X3VzZXIocmVnLCB1aW5kaWNl
cysrKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+PiArCj4+ICvCoMKgwqAg
aWYgKCFrdm1fZ3Vlc3RfaGFzX2xidCgmdmNwdS0+YXJjaCkpCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4gKwo+PiArwqDCoMKgIGZvciAoaSA9IDE7IGkgPD0gTlVNX0xCVF9SRUdTOyBp
KyspIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IChLVk1fUkVHX0xPT05HQVJDSF9MQlQgfCBL
Vk1fUkVHX1NJWkVfVTY0IHwgaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocHV0X3VzZXIocmVn
LCB1aW5kaWNlcysrKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7
Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gwqAg
bG9uZyBrdm1fYXJjaF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBpb2N0bCwgdW5zaWduZWQgbG9uZyBhcmcp
Cj4+IMKgIHsKPj4gQEAgLTEyNTEsNiArMTMxNCwyNCBAQCBsb25nIGt2bV9hcmNoX3ZjcHVfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbHAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByID0ga3ZtX2xvb25n
YXJjaF92Y3B1X3NldF9hdHRyKHZjcHUsICZhdHRyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+PiDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoCBjYXNlIEtWTV9HRVRfUkVHX0xJU1Q6IHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBrdm1fcmVnX2xpc3QgX191c2VyICp1c2VyX2xpc3Qg
PSBhcmdwOwo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGt2bV9yZWdfbGlzdCByZWdfbGlzdDsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG47Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHIg
PSAtRUZBVUxUOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKCZyZWdfbGlz
dCwgdXNlcl9saXN0LCBzaXplb2YocmVnX2xpc3QpKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoCBuID0gcmVnX2xpc3QubjsKPj4gK8KgwqDCoMKg
wqDCoMKgIHJlZ19saXN0Lm4gPSBrdm1fbG9vbmdhcmNoX251bV9yZWdzKHZjcHUpOwo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcih1c2VyX2xpc3QsICZyZWdfbGlzdCwgc2l6ZW9m
KHJlZ19saXN0KSkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKg
wqDCoMKgwqAgciA9IC1FMkJJRzsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChuIDwgcmVnX2xpc3Qu
bikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ID0ga3ZtX2xvb25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHZjcHUsIHVzZXJfbGlzdC0+cmVnKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBkZWZh
dWx0Ogo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IC1FTk9JT0NUTENNRDsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
