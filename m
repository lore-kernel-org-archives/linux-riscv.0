Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F159D7976C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bw4M3TyUn3tglpcokVSby7DNMDMDDUt+4slVr+ox1E=; b=y0lquOnwqKgtOm
	8vO9av9UzMiIak0Fmzo1lU6X/Yrx6w00RR+0bwXBryt0+ID5gcpflL0TzyDczd4eCZikuzAp13AAG
	+yCKU+HOEG15QdSOItMLDkLm1BqEyqr9nE/D/Bk9GSHvWTQlFzntxRiUZOus5HrER5qxA+sMStn54
	jlvmwS7A1MtFaFGINSIrsV7EeXXXu1myi2nSY1bvkZqX8p4ZHHUwyNrtBK1lWD5SuuUp12ndOOnHl
	1tpRzhcs/jeKH+H/U50ADOeWL2w1y7noS7aQRFlVbzrZ5PYuiqQ5rBXMau02auFKD5tpA1ZeJlThq
	/gdTdl7z+RrCc3hRuRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBf1-00000002fzn-2hmc;
	Sat, 31 Jan 2026 14:09:15 +0000
Received: from relay4.mymailcheap.com ([137.74.80.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBey-00000002fzP-2IVr
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 14:09:14 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 78742202EF;
	Sat, 31 Jan 2026 14:09:09 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 25FD8400D5;
	Sat, 31 Jan 2026 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769868544; bh=wKjWwAJDesOvn1+Zai9dJuWomkGTs+IRFJbxkSgLNQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QvjPHoHwEgO8gx+Zhcn2hOoHbSeVsG7b6cx6tkxsFow0OTUhuRBe2Qqk0uxNof75i
	 k9FX9PaXUMxSwqOQn53lizfLeNcjGoIl3/iRdmdAa3XNFWO8KwWD+nSXk4RcyMwOZg
	 XxAy1jldNZixA8pMXBLcyoMBnsHghh+J3B32ottQ=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 24E3740F79;
	Sat, 31 Jan 2026 14:08:51 +0000 (UTC)
Message-ID: <b89a22a3-be55-4c86-99e3-84759e362309@aosc.io>
Date: Sat, 31 Jan 2026 22:08:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Content-Language: en-US-large, en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260131060600.169748-1-liushuyu@aosc.io>
 <CAAhV-H7g4StjP5fnHVVEyR_xFx9=fg6S9UuHWnPpMV_k=ZVGGw@mail.gmail.com>
From: liushuyu <liushuyu@aosc.io>
In-Reply-To: <CAAhV-H7g4StjP5fnHVVEyR_xFx9=fg6S9UuHWnPpMV_k=ZVGGw@mail.gmail.com>
X-Rspamd-Queue-Id: 25FD8400D5
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[44.79%];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[liushuyu.aosc.io:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	SURBL_MULTI_FAIL(0.00)[aosc.io:query refused]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_060912_743606_196C4F47 
X-CRM114-Status: GOOD (  25.82  )
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

SGkgSHVhY2FpLAoKPiBIaSwgWml4aW5nLAo+Cj4gT24gU2F0LCBKYW4gMzEsIDIwMjYgYXQgMjow
N+KAr1BNIFppeGluZyBMaXUgPGxpdXNodXl1QGFvc2MuaW8+IHdyb3RlOgo+PiBUaGlzIGlvY3Rs
IGNhbiBiZSB1c2VkIGJ5IHRoZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIHRvIGRldGVybWluZSB3
aGljaAo+PiAoc3BlY2lhbCkgcmVnaXN0ZXJzIGFyZSBnZXQvc2V0LWFibGUgaW4gYSBtZWFuaW5n
ZnVsIHdheS4KPj4KPj4gVGhpcyBjYW4gYmUgdmVyeSB1c2VmdWwgZm9yIGNyb3NzLXBsYXRmb3Jt
IFZNTXMgc28gdGhhdCB0aGV5IGRvIG5vdCBoYXZlCj4+IHRvIGhhcmRjb2RlIHJlZ2lzdGVyIGlu
ZGljZXMgZm9yIGVhY2ggc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFppeGluZyBMaXUgPGxpdXNodXl1QGFvc2MuaW8+Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0IHwgIDIgKy0KPj4gIGFyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMg
ICAgICB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMg
Y2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2
bS9hcGkucnN0Cj4+IGluZGV4IDAxYTNhYmVmOGFiYi4uZjQ2ZGQ4YmUyODJmIDEwMDY0NAo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4gKysrIGIvRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0Cj4+IEBAIC0zNjAzLDcgKzM2MDMsNyBAQCBWQ1BVIG1hdGNoaW5n
IHVuZGVybHlpbmcgaG9zdC4KPj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiAgOkNhcGFi
aWxpdHk6IGJhc2ljCj4+IC06QXJjaGl0ZWN0dXJlczogYXJtNjQsIG1pcHMsIHJpc2N2LCB4ODYg
KGlmIEtWTV9DQVBfT05FX1JFRykKPj4gKzpBcmNoaXRlY3R1cmVzOiBhcm02NCwgbG9vbmdhcmNo
LCBtaXBzLCByaXNjdiwgeDg2IChpZiBLVk1fQ0FQX09ORV9SRUcpCj4+ICA6VHlwZTogdmNwdSBp
b2N0bAo+PiAgOlBhcmFtZXRlcnM6IHN0cnVjdCBrdm1fcmVnX2xpc3QgKGluL291dCkKPj4gIDpS
ZXR1cm5zOiAwIG9uIHN1Y2Nlc3M7IC0xIG9uIGVycm9yCj4+IGRpZmYgLS1naXQgYS9hcmNoL2xv
b25nYXJjaC9rdm0vdmNwdS5jIGIvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYwo+PiBpbmRleCA2
NTZiOTU0YzExMzQuLmVkMTE0MzhmNDU0NCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gv
a3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNoL2xvb25nYXJjaC9rdm0vdmNwdS5jCj4+IEBAIC0xMTg2
LDYgKzExODYsNzMgQEAgc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX3ZjcHVfc2V0X2F0dHIoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+PiAgICAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+Cj4+ICtz
dGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfd2Fsa19jc3JzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dTY0IF9fdXNlciAqdWluZGljZXMpCj4+ICt7Cj4+ICsgICAgICAgdW5zaWduZWQgaW50IGksIGNv
dW50Owo+PiArCj4+ICsgICAgICAgZm9yIChpID0gMCwgY291bnQgPSAwOyBpIDwgQ1NSX01BWF9O
VU1TOyBpKyspIHsKPj4gKyAgICAgICAgICAgICAgIGlmICghKGdldF9nY3NyX2ZsYWcoaSkgJiAo
U1dfR0NTUiB8IEhXX0dDU1IpKSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4+ICsgICAgICAgICAgICAgICBjb25zdCB1NjQgcmVnID0gS1ZNX0lPQ19DU1JJRChpKTsKPj4g
KyAgICAgICAgICAgICAgIGlmICh1aW5kaWNlcyAmJiBwdXRfdXNlcihyZWcsIHVpbmRpY2VzKysp
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPj4gKyAgICAgICAg
ICAgICAgIGNvdW50Kys7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcmV0dXJuIGNvdW50
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBrdm1fbG9vbmdhcmNoX251bV9s
YnRfcmVncyh2b2lkKQo+PiArewo+PiArICAgICAgIC8qICsxIGZvciB0aGUgTEJUX0ZUT1AgZmxh
ZyAoaW5zaWRlIGFyY2guZnB1KSAqLwo+PiArICAgICAgIHJldHVybiBzaXplb2Yoc3RydWN0IGxv
b25nYXJjaF9sYnQpIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICsgMTsKPj4gK30KPiBUaGlzIGZ1
bmN0aW9uIGhhcyBvbmx5IG9uZSBsaW5lLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBlbWJlZCBp
dCBpbnRvCj4gdGhlIGNhbGxlci4KClRoaXMgZnVuY3Rpb24gd2FzIHVzZWQgdHdpY2UgaW4gdGhp
cyBwYXRjaC4gSWYgdGhlIGhhcmR3YXJlIGdhaW5lZCBtb3JlCkxCVCByZWdpc3RlcnMgdGhhdCBh
cmUgbm90IHJlY29yZGVkIGluIGBzdHJ1Y3QgbG9vbmdhcmNoX2xidGAgaW4gdGhlCmZ1dHVyZSwg
SSBhbSBhZnJhaWQgY2hhbmdpbmcgbWFudWFsbHkgaW5saW5lZCBsb2dpYyB3aWxsIGJlIGEgYml0
CmVycm9yLXByb25lLgoKTWF5YmUgb25lIGNvbXByb21pc2Ugd291bGQgYmUgbWFraW5nIHRoaXMg
YSBgY29uc3RgIHZhcmlhYmxlIHNvbWV3aGVyZQppbiB0aGlzIGZpbGUgaW5zdGVhZCBvZiBhIGZ1
bmN0aW9uPyBXaGF0IGRvIHlvdSB0aGluaz8KCj4gSHVhY2FpCgpUaGFua3MsCgpaaXhpbmcKCj4+
ICsKPj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9sb29uZ2FyY2hfbnVtX3JlZ3Moc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+PiArewo+PiArICAgICAgIC8qICsxIGZvciB0aGUgS1ZNX1JFR19M
T09OR0FSQ0hfQ09VTlRFUiByZWdpc3RlciAqLwo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgcmVz
ID0KPj4gKyAgICAgICAgICAgICAgIGt2bV9sb29uZ2FyY2hfd2Fsa19jc3JzKHZjcHUsIE5VTEwp
ICsgS1ZNX01BWF9DUFVDRkdfUkVHUyArIDE7Cj4+ICsKPj4gKyAgICAgICBpZiAoa3ZtX2d1ZXN0
X2hhc19sYnQoJnZjcHUtPmFyY2gpKQo+PiArICAgICAgICAgICAgICAgcmVzICs9IGt2bV9sb29u
Z2FyY2hfbnVtX2xidF9yZWdzKCk7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gcmVzOwo+PiArfQo+
PiArCj4+ICtzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNlcyhzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHU2NCBfX3VzZXIgKnVpbmRpY2VzKQo+PiArewo+PiArICAgICAgIHU2NCByZWc7Cj4+ICsg
ICAgICAgdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gKyAgICAgICBpID0ga3ZtX2xvb25nYXJjaF93
YWxrX2NzcnModmNwdSwgdWluZGljZXMpOwo+PiArICAgICAgIGlmIChpIDwgMCkKPj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBpOwo+PiArICAgICAgIHVpbmRpY2VzICs9IGk7Cj4+ICsKPj4gKyAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgS1ZNX01BWF9DUFVDRkdfUkVHUzsgaSsrKSB7Cj4+ICsgICAg
ICAgICAgICAgICByZWcgPSBLVk1fSU9DX0NQVUNGRyhpKTsKPj4gKyAgICAgICAgICAgICAgIGlm
IChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVGQVVMVDsKPj4gKyAgICAgICB9Cj4+ICsKPj4gKyAgICAgICByZWcgPSBLVk1fUkVH
X0xPT05HQVJDSF9DT1VOVEVSOwo+PiArICAgICAgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2Vz
KyspKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4+ICsKPj4gKyAgICAgICBp
ZiAoIWt2bV9ndWVzdF9oYXNfbGJ0KCZ2Y3B1LT5hcmNoKSkKPj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+PiArCj4+ICsgICAgICAgZm9yIChpID0gMTsgaSA8PSBrdm1fbG9vbmdhcmNoX251
bV9sYnRfcmVncygpOyBpKyspIHsKPj4gKyAgICAgICAgICAgICAgIHJlZyA9IChLVk1fUkVHX0xP
T05HQVJDSF9MQlQgfCBLVk1fUkVHX1NJWkVfVTY0IHwgaSk7Cj4+ICsgICAgICAgICAgICAgICBp
ZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FRkFVTFQ7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+
ICt9Cj4+ICsKPj4gIGxvbmcga3ZtX2FyY2hfdmNwdV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpb2N0bCwgdW5zaWduZWQg
bG9uZyBhcmcpCj4+ICB7Cj4+IEBAIC0xMjUxLDYgKzEzMTgsMjQgQEAgbG9uZyBrdm1fYXJjaF92
Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+PiAgICAgICAgICAgICAgICAgciA9IGt2bV9s
b29uZ2FyY2hfdmNwdV9zZXRfYXR0cih2Y3B1LCAmYXR0cik7Cj4+ICAgICAgICAgICAgICAgICBi
cmVhazsKPj4gICAgICAgICB9Cj4+ICsgICAgICAgY2FzZSBLVk1fR0VUX1JFR19MSVNUOiB7Cj4+
ICsgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3JlZ19saXN0IF9fdXNlciAqdXNlcl9saXN0ID0g
YXJncDsKPj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fcmVnX2xpc3QgcmVnX2xpc3Q7Cj4+
ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBuOwo+PiArCj4+ICsgICAgICAgICAgICAgICByID0g
LUVGQVVMVDsKPj4gKyAgICAgICAgICAgICAgIGlmIChjb3B5X2Zyb21fdXNlcigmcmVnX2xpc3Qs
IHVzZXJfbGlzdCwgc2l6ZW9mKHJlZ19saXN0KSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+PiArICAgICAgICAgICAgICAgbiA9IHJlZ19saXN0Lm47Cj4+ICsgICAgICAgICAg
ICAgICByZWdfbGlzdC5uID0ga3ZtX2xvb25nYXJjaF9udW1fcmVncyh2Y3B1KTsKPj4gKyAgICAg
ICAgICAgICAgIGlmIChjb3B5X3RvX3VzZXIodXNlcl9saXN0LCAmcmVnX2xpc3QsIHNpemVvZihy
ZWdfbGlzdCkpKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gKyAgICAgICAg
ICAgICAgIHIgPSAtRTJCSUc7Cj4+ICsgICAgICAgICAgICAgICBpZiAobiA8IHJlZ19saXN0Lm4p
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICAgICAgICAgciA9
IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNlcyh2Y3B1LCB1c2VyX2xpc3QtPnJlZyk7Cj4+
ICsgICAgICAgICAgICAgICBicmVhazsKPj4gKyAgICAgICB9Cj4+ICAgICAgICAgZGVmYXVsdDoK
Pj4gICAgICAgICAgICAgICAgIHIgPSAtRU5PSU9DVExDTUQ7Cj4+ICAgICAgICAgICAgICAgICBi
cmVhazsKPj4gLS0KPj4gMi41Mi4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
