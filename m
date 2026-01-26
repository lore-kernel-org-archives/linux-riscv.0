Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67FBCF65CC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqPWZUCssstN7KPiN2b/r/xIsPRtKrKRNia63ETialU=; b=4VNTEURIaeoiC5
	sx8T5f3nGlxERicHyNj195jCu3o5ALYVePY0nsdOHfadbPI3sofspBNP+RbqtXutjmGNM5hlNkxw7
	0o9+aJdfDxPZfakmZe/C8tCoFZCwk+OGlpA7xvtJB5TK42zOcMVjL7npS48Hz81K87jL43BXUznp+
	OiO4bpRgNhLwtitI7nvBkEFtzxqC3fwAlUKpSLjAlr12DVyqV9ItQ4fOP+AU36bWLS3aQdBqRh3dm
	OacDqO1KPWjIu98h/1N3m68Nl7PIuHj58WVtdAYYpiNkcsn3IAxPVG/w9ea5LSmQofWzuMWYVIra3
	NMEVj3GQx1XBI3+g4CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJRM-0000000CFXV-3oOL;
	Mon, 26 Jan 2026 10:03:24 +0000
Received: from relay3.mymailcheap.com ([217.182.66.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJRJ-0000000CFX8-46X8
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 10:03:23 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 401EE3E91A;
	Mon, 26 Jan 2026 10:03:19 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 6B19B400D5;
	Mon, 26 Jan 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769421798; bh=uL/zrKiJL0NrpRn7S1T5zQm6Z2BAWFrf2uvRyXBML8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WoRuJ7zr7IYbCSWp13iIpw6DqHAIyHS/7fcNWVySs7iNaB9fRXguSGL2oX5ZDLQE7
	 yj7EzJT9Gi0sDx8WRKLASSk2j4R+w9p3tibWmDf2WnkOyEAtsxYzxsmvc2EChx5q2J
	 Wi+jA8ltHfyWTb/1UX5a/b3a0P1+yU703ZQfhWog=
Received: from [127.0.0.1] (unknown [117.151.13.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 754FA40594;
	Mon, 26 Jan 2026 10:03:09 +0000 (UTC)
Message-ID: <a3beb69c-5236-49fb-aebc-c716c10ea7c3@aosc.io>
Date: Mon, 26 Jan 2026 18:03:06 +0800
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
 <f3256219-bb97-45d4-9364-cf28d3c9dc8a@aosc.io>
 <913e8e96-9124-2fbe-bd00-f6122962562a@loongson.cn>
From: liushuyu <liushuyu@aosc.io>
In-Reply-To: <913e8e96-9124-2fbe-bd00-f6122962562a@loongson.cn>
X-Rspamd-Queue-Id: 6B19B400D5
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[36.75%];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED(0.00)[mail20.mymailcheap.com:rdns,mail20.mymailcheap.com:helo,aosc.io:mid,aosc.io:from_smtp,aosc.io:from_mime,aosc.io:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[aosc.io,redhat.com,lwn.net,loongson.cn,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_020322_351680_78CB7344 
X-CRM114-Status: GOOD (  32.39  )
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

SGkgQmlibywKCj4KPgo+IE9uIDIwMjYvMS8yNiDkuIvljYg0OjU0LCBsaXVzaHV5dSB3cm90ZToK
Pj4gSGkgQmlibywKPj4KPj4+Cj4+Pgo+Pj4gT24gMjAyNi8xLzI2IOS4i+WNiDEyOjIyLCBsaXVz
aHV5dSB3cm90ZToKPj4+PiBIaSBCaWJvLAo+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDIwMjYv
MS8yNiDkuIrljYgxMTozOCwgbGl1c2h1eXUgd3JvdGU6Cj4+Pj4+PiBIaSBCaWJvLAo+Pj4+Pj4+
Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyMDI2LzEvMjUg5LiL5Y2IMTo0MywgWml4aW5nIExpdSB3cm90
ZToKPj4+Pj4+Pj4gVGhpcyBpb2N0bCBjYW4gYmUgdXNlZCBieSB1c2Vyc3BhY2UgYXBwbGljYXRp
b25zIHRvIGRldGVybWluZQo+Pj4+Pj4+PiB3aGljaAo+Pj4+Pj4+PiAoc3BlY2lhbCkgcmVnaXN0
ZXJzIGFyZSBnZXQvc2V0LWFibGUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgY2FuIGJlIHZlcnkg
dXNlZnVsIGZvciBjcm9zcy1wbGF0Zm9ybSBWTU1zIHNvIHRoYXQgdGhleSBkbwo+Pj4+Pj4+PiBu
b3QKPj4+Pj4+Pj4gaGF2ZQo+Pj4+Pj4+PiB0byBoYXJkY29kZSByZWdpc3RlciBpbmRpY2VzIGZv
ciBlYWNoIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBaaXhpbmcgTGl1IDxsaXVzaHV5dUBhb3NjLmlvPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gRm9yIGV4YW1wbGUsIHRoaXMgaW9jdGwgY291bGQgYmUgdXNlZCBieSBydXN0
LXZtbS9ydXN0LWt2bSBvcgo+Pj4+Pj4+PiBtYXliZQo+Pj4+Pj4+PiBWaXJ0dWFsQm94LWt2bSBp
biB0aGUgZnV0dXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgwqDCoCBEb2N1bWVudGF0aW9uL3Zp
cnQva3ZtL2FwaS5yc3QgfMKgIDIgKy0KPj4+Pj4+Pj4gwqDCoMKgwqAgYXJjaC9sb29uZ2FyY2gv
a3ZtL3ZjcHUuY8KgwqDCoMKgwqAgfCA2OQo+Pj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+Pj4+Pj4+IMKgwqDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4+Pj4+IGIvRG9jdW1lbnRhdGlvbi92aXJ0
L2t2bS9hcGkucnN0Cj4+Pj4+Pj4+IGluZGV4IDAxYTNhYmVmOGFiYi4uZjQ2ZGQ4YmUyODJmIDEw
MDY0NAo+Pj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPj4+Pj4+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+Pj4+Pj4+IEBAIC0zNjAz
LDcgKzM2MDMsNyBAQCBWQ1BVIG1hdGNoaW5nIHVuZGVybHlpbmcgaG9zdC4KPj4+Pj4+Pj4gwqDC
oMKgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+IMKgwqDCoMKgIMKgIDpDYXBhYmls
aXR5OiBiYXNpYwo+Pj4+Pj4+PiAtOkFyY2hpdGVjdHVyZXM6IGFybTY0LCBtaXBzLCByaXNjdiwg
eDg2IChpZiBLVk1fQ0FQX09ORV9SRUcpCj4+Pj4+Pj4+ICs6QXJjaGl0ZWN0dXJlczogYXJtNjQs
IGxvb25nYXJjaCwgbWlwcywgcmlzY3YsIHg4NiAoaWYKPj4+Pj4+Pj4gS1ZNX0NBUF9PTkVfUkVH
KQo+Pj4+Pj4+PiDCoMKgwqDCoCA6VHlwZTogdmNwdSBpb2N0bAo+Pj4+Pj4+PiDCoMKgwqDCoCA6
UGFyYW1ldGVyczogc3RydWN0IGt2bV9yZWdfbGlzdCAoaW4vb3V0KQo+Pj4+Pj4+PiDCoMKgwqDC
oCA6UmV0dXJuczogMCBvbiBzdWNjZXNzOyAtMSBvbiBlcnJvcgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMK
Pj4+Pj4+Pj4gaW5kZXggNjU2Yjk1NGMxMTM0Li5iODg0ZWI5Yzc2YWEgMTAwNjQ0Cj4+Pj4+Pj4+
IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMKPj4+Pj4+Pj4gKysrIGIvYXJjaC9sb29u
Z2FyY2gva3ZtL3ZjcHUuYwo+Pj4+Pj4+PiBAQCAtMTE4Niw2ICsxMTg2LDU3IEBAIHN0YXRpYyBp
bnQKPj4+Pj4+Pj4ga3ZtX2xvb25nYXJjaF92Y3B1X3NldF9hdHRyKHN0cnVjdAo+Pj4+Pj4+PiBr
dm1fdmNwdSAqdmNwdSwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+
Pj4+PiDCoMKgwqDCoCB9Cj4+Pj4+Pj4+IMKgwqDCoMKgICtzdGF0aWMgdW5zaWduZWQgbG9uZyBr
dm1fbG9vbmdhcmNoX251bV9sYnRfcmVncyh2b2lkKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDC
oMKgIC8qICsxIGZvciB0aGUgTEJUX0ZUT1AgZmxhZyAoaW5zaWRlIGFyY2guZnB1KSAqLwo+Pj4+
Pj4+PiArwqDCoMKgIHJldHVybiBzaXplb2Yoc3RydWN0IGxvb25nYXJjaF9sYnQpIC8gc2l6ZW9m
KHVuc2lnbmVkIGxvbmcpCj4+Pj4+Pj4+ICsgMTsKPj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gKwo+Pj4+
Pj4+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9udW1fcmVncyhzdHJ1Y3Qg
a3ZtX3ZjcHUKPj4+Pj4+Pj4gKnZjcHUpCj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICvCoMKgwqAgLyog
KzEgZm9yIHRoZSBLVk1fUkVHX0xPT05HQVJDSF9DT1VOVEVSIHJlZ2lzdGVyICovCj4+Pj4+Pj4+
ICvCoMKgwqAgdW5zaWduZWQgbG9uZyByZXMgPSBDU1JfTUFYX05VTVMgKyBLVk1fTUFYX0NQVUNG
R19SRUdTICsgMTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIGlmIChrdm1fZ3Vlc3RfaGFz
X2xidCgmdmNwdS0+YXJjaCkpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXMgKz0ga3ZtX2xv
b25nYXJjaF9udW1fbGJ0X3JlZ3MoKTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIHJldHVy
biByZXM7Cj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK3N0YXRpYyBpbnQga3ZtX2xv
b25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgX191c2VyICp1
aW5kaWNlcykKPj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4gK8KgwqDCoCB1NjQgcmVnOwo+Pj4+Pj4+PiAr
wqDCoMKgIHVuc2lnbmVkIGludCBpOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgZm9yIChp
ID0gMDsgaSA8IENTUl9NQVhfTlVNUzsgaSsrKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZWcgPSBLVk1fSU9DX0NTUklEKGkpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHB1dF91
c2VyKHJlZywgdWluZGljZXMrKykpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUZBVUxUOwo+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiBDU1JfTUFYX05VTVMgaXMg
bWF4IG51bWJlciBvZiBhY2Nlc3NpYmxlIENTUiByZWdpc3RlcnMsIGluc3RlYWQKPj4+Pj4+PiBv
bmx5Cj4+Pj4+Pj4gcGFydCBvZiB0aGVtIGlzIHVzZWQgYnkgdkNQVSBtb2RlbC4gQnkgbXkgdW5k
ZXJzdGFuZGluZywgdGhlcmUKPj4+Pj4+PiB3aWxsIGJlCj4+Pj4+Pj4gbm8gbXVjaCBtZWFuaW5n
IGlmIENTUl9NQVhfTlVNUyBpcyByZXR1cm5lZC4gQW5kIEkgdGhpbmsgaXQgd2lsbCBiZQo+Pj4+
Pj4+IGJldHRlciBpZiByZWFsIENTUiByZWdpc3RlciBpZCBhbmQgbnVtYmVyIGlzIHJldHVybmVk
Lgo+Pj4+Pj4+Cj4+Pj4+PiBEaWQgeW91IG1lYW4gd2Ugc2hvdWxkIG9ubHkgcmV0dXJuIHRoZSBD
U1IgcmVnaXN0ZXJzIGluaXRpYWxpemVkIGluCj4+Pj4+PiB0aGlzCj4+Pj4+PiBmdW5jdGlvbgo+
Pj4+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9sb29uZ2FyY2gva3ZtL21haW4uYz9pZD02MzgwNGZl
ZDE0OWE2NzUwZmZkMjg2MTBjNWMxYzk4Y2NlNmJkMzc3I240OAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4gPwo+Pj4+Pj4KPj4+Pj4+IFRoYXQgbG9va3MgbGlrZSBhIHZlcnkgbGFyZ2UgbGlz
dCBhbmQgdGhlIHZhbHVlcyBvZiB0aGUgcmVnaXN0ZXIKPj4+Pj4+IElEcyBhcmUKPj4+Pj4+IG5v
dCBmdWxseSBjb250aW51b3VzLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBob3cgZG8gd2UgbWFpbnRh
aW4gdGhlCj4+Pj4+PiBnZXQvc2V0LWFibGUgQ1NSIHJlZ2lzdGVyIGxpc3Q/Cj4+Pj4+IEl0IHdp
bGwgYmUgYmV0dGVyIGlmIENTUiByZWdpc3RlciBsaXN0IGNhbiBiZSBjYXRlZ29yaXplZCwgZm9y
Cj4+Pj4+IGV4YW1wbGUKPj4+Pj4gd2l0aCBMb29uZ0FyY2ggQ1BVIG1hbnVhbCBDU1IgcmVnaXN0
ZXIgaXMgc3BsaXQgaW50byA4IHR5cGVzIGZyb20KPj4+Pj4gY2hhcHRlciA3LjQgLS0gNy4xMQo+
Pj4+Pgo+Pj4+PiBBdCB0aGUgYmVnaW5uaW5nLCB0aGVyZSBpcyBiaWcgYXJyYXkgd2l0aCBzaXpl
IENTUl9NQVhfTlVNUyB3aXRob3V0Cj4+Pj4+IGFueSBjYXRlZ29yeSwgaXQgY2FuIGJlIGZpbmUt
Z2FpbmVkIGluIGxhdGUuCj4+Pj4KPj4+PiBEb2VzIHRoYXQgbWVhbiBpbiB0aGUgbmV3IGBrdm1f
bG9vbmdhcmNoX2NvcHlfcmVnX2luZGljZXNgCj4+Pj4gZnVuY3Rpb24sIGl0Cj4+Pj4gaXMgYWxz
byBva2F5IHRvIGVtYmVkIHRoaXMgYmlnIGxpc3QgaW4gdGhlcmU/Cj4+PiBGaXJzdGx5IEkgZG8g
bm90IGtub3cgaG93IHRvIHVzZSBpb2N0bCBjb21tYW5kIEtWTV9HRVRfUkVHX0xJU1QgaW4gVk1N
Cj4+PiBhY3R1YWxseS4KPj4+Cj4+PiBBdCB0aGUgc2Vjb25kIGZyb20gdGhlIHdvcmQgImRldGVy
bWluZSB3aGljaCAoc3BlY2lhbCkgcmVnaXN0ZXJzIGFyZQo+Pj4gZ2V0L3NldC1hYmxlIiwgSSB0
aGluayB0aGF0IGl0IGlzIGJldHRlciB0byBzZXQgYWNjZXNzaWJsZSBDU1IKPj4+IHJlZ2lzdGVy
IG51bWJlciBhbmQgSUQgcmF0aGVyIHRoYW4gdGhlIHRvdGFsIG51bWJlciBDU1JfTUFYX05VTVMu
Cj4+Pgo+PiBVbmRlcnN0b29kLiBJIHdpbGwgcG9zdCBhIHYyIHBhdGNoLCBhbmQgd2UgY2FuIGNv
bnRpbnVlIHRoZSBkaXNjdXNzaW9uCj4+IGZyb20gdGhlcmUgdG8gc2VlIGlmIEkgdW5kZXJzdG9v
ZCB5b3VyIHBvaW50cyBjb3JyZWN0bHkuCj4gUmVtZW1iZXIgdG8gYWRkIHN1Y2ggbGluZXMgaW4g
ZnVuY3Rpb24ga3ZtX2luaXRfZ2Nzcl9mbGFnKCkgaW4gdGhlCj4gbmV4dCByb3VuZCwgc2luY2Ug
TVNHSU5UIENTUiByZWdpc3RlcnMgYXJlIG1pc3NpbmcgaGVyZS4KPgo+IHZvaWQga3ZtX2luaXRf
Z2Nzcl9mbGFnKHZvaWQpIHsKPiArwqDCoMKgwqDCoMKgwqAgaWYgKGNwdV9oYXNfbXNnaW50KSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZ2Nzcl9od19mbGFnKExPT05H
QVJDSF9DU1JfSVNSMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZ2Nz
cl9od19mbGFnKExPT05HQVJDSF9DU1JfSVNSMSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzZXRfZ2Nzcl9od19mbGFnKExPT05HQVJDSF9DU1JfSVNSMik7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZ2Nzcl9od19mbGFnKExPT05HQVJDSF9DU1JfSVNS
Myk7Cj4gK8KgwqDCoMKgwqDCoMKgIH0KPiB9wqAKPgpJIHRoaW5rIHRoaXMgbWlnaHQgbmVlZCB0
byBiZSBhIHNlcGFyYXRlIHBhdGNoIG9yIGNvbW1pdC4KCkRvIHlvdSB3YW50IG1lIHRvIGluY2x1
ZGUgdGhpcyBpbiB0aGUgS1ZNX0dFVF9SRUdfTElTVCBwYXRjaCwgb3IgZG8geW91CndhbnQgdG8g
c3VibWl0IHRoaXMgY2hhbmdlIHNlcGFyYXRlbHk/Cgo+IFJlZ2FyZHMKPiBCaWJvIE1hbwo+Pgo+
Pj4gK3N0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF9udW1fY3NyX3JlZ3Moc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+Pj4gK3sKPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGksIGNvdW50Owo+Pj4gKwo+
Pj4gK8KgwqDCoCBjb3VudCA9IDAKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IENTUl9NQVhf
TlVNUzsgaSsrKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCEoZ2V0X2djc3JfZmxhZyhpKSAm
IChTV19HQ1NSIHwgSFdfR0NTUikpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGlu
dWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY291bnQrKzsKPj4+ICvCoMKgwqAgfQo+Pj4gK8KgwqDC
oCByZXR1cm4gY291bnQ7Cj4+PiArfQo+Pj4KPj4+IHN0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9s
b29uZ2FyY2hfbnVtX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Pj4gewo+Pj4gwqDCoMKg
wqDCoC8qICsxIGZvciB0aGUgS1ZNX1JFR19MT09OR0FSQ0hfQ09VTlRFUiByZWdpc3RlciAqLwo+
Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIHJlcyA9IGt2bV9sb29uZ2FyY2hfbnVtX2Nzcl9yZWdz
ICsKPj4+IEtWTV9NQVhfQ1BVQ0ZHX1JFR1MgKyAxOwo+Pj4KPj4+IMKgwqDCoMKgwqBpZiAoa3Zt
X2d1ZXN0X2hhc19sYnQoJnZjcHUtPmFyY2gpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXMgKz0g
a3ZtX2xvb25nYXJjaF9udW1fbGJ0X3JlZ3MoKTsKPj4+Cj4+PiDCoMKgwqDCoMKgcmV0dXJuIHJl
czsKPj4+IH0KPj4+Cj4+PiBzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNl
cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1NjQgX191c2VyICp1aW5kaWNlcykKPj4+IHsKPj4+IMKgwqDCoMKg
wqB1NjQgcmVnOwo+Pj4gwqDCoMKgwqDCoHVuc2lnbmVkIGludCBpOwo+Pj4KPj4+IMKgwqDCoMKg
wqBmb3IgKGkgPSAwOyBpIDwgQ1NSX01BWF9OVU1TOyBpKyspIHsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKCEoZ2V0X2djc3JfZmxhZyhpKSAmIChTV19HQ1NSIHwgSFdf
R0NTUikpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRp
bnVlOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZWcgPSBLVk1fSU9DX0NTUklEKGkpOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBpZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4+IMKgwqDCoMKgwqB9Cj4+Pgo+Pj4g
UmVnYXJkcwo+Pj4gQmlibyBNYW8KPj4+Pgo+Pj4+IE9yIGRvIHlvdSB3YW50IHRvIGV4dHJhY3Qg
dGhlIGxpc3QgZnJvbSB0aGUgYGt2bV9pbml0X2djc3JfZmxhZ2AKPj4+PiBmdW5jdGlvbiBhbmQg
cmVmYWN0b3IgYm90aCBmdW5jdGlvbnMgdG8gc2hhcmUgb25lIHNpbmdsZSBiaWcgbGlzdAo+Pj4+
IChwcm9iYWJseSBpbiB0aGUga3ZtX2hvc3QuaCBoZWFkZXIpPwo+Pj4+Cj4+Pj4gQmVjYXVzZSBm
cm9tIHdoYXQgSSBjb3VsZCB1bmRlcnN0YW5kLCB5b3VyIHByZXZpb3VzIG1lc3NhZ2VzIHBvaW50
IHRvCj4+Pj4gdGhhdCB3ZSBuZWVkIHRvIHVzZSB0aGlzIGxpc3QgdG8gbWFrZSBvdXQgd2hhdCBD
U1IgcmVnaXN0ZXJzIHRvIHJldHVybgo+Pj4+IHRvIHRoZSB1c2VyIHNwYWNlIFZNTXMuCj4+Pgo+
Pj4+Cj4+Pj4+Cj4+Pj4+IFJlZ2FyZHMKPj4+Pj4gQmlibyBNYW8KPj4+Pj4+Cj4+Pj4+Pj4gUmVn
YXJkcwo+Pj4+Pj4+IEJpYm8gTWFvCj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCBmb3IgKGkg
PSAwOyBpIDwgS1ZNX01BWF9DUFVDRkdfUkVHUzsgaSsrKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZWcgPSBLVk1fSU9DX0NQVUNGRyhpKTsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVGQVVMVDsKPj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+ICsKPj4+Pj4+
Pj4gK8KgwqDCoCByZWcgPSBLVk1fUkVHX0xPT05HQVJDSF9DT1VOVEVSOwo+Pj4+Pj4+PiArwqDC
oMKgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKyspKQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FRkFVTFQ7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIWt2bV9n
dWVzdF9oYXNfbGJ0KCZ2Y3B1LT5hcmNoKSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgZm9yIChpID0gMTsgaSA8PSBrdm1fbG9v
bmdhcmNoX251bV9sYnRfcmVncygpOyBpKyspIHsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IChLVk1fUkVHX0xPT05HQVJDSF9MQlQgfCBLVk1fUkVHX1NJWkVfVTY0IHwgaSk7Cj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocHV0X3VzZXIocmVnLCB1aW5kaWNlcysrKSkKPj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7Cj4+Pj4+Pj4+ICvCoMKg
wqAgfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+Pj4+ICt9Cj4+
Pj4+Pj4+ICsKPj4+Pj4+Pj4gwqDCoMKgwqAgbG9uZyBrdm1fYXJjaF92Y3B1X2lvY3RsKHN0cnVj
dCBmaWxlICpmaWxwLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGludCBpb2N0bCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pj4+Pj4+IMKgwqDCoMKg
IHsKPj4+Pj4+Pj4gQEAgLTEyNTEsNiArMTMwMiwyNCBAQCBsb25nIGt2bV9hcmNoX3ZjcHVfaW9j
dGwoc3RydWN0IGZpbGUgKmZpbHAsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ID0ga3ZtX2xvb25nYXJjaF92Y3B1X3NldF9hdHRyKHZjcHUsICZhdHRyKTsKPj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+Pj4gK8KgwqDCoCBjYXNlIEtWTV9HRVRfUkVHX0xJU1Q6IHsKPj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHN0cnVjdCBrdm1fcmVnX2xpc3QgX191c2VyICp1c2VyX2xpc3QgPSBhcmdwOwo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGt2bV9yZWdfbGlzdCByZWdfbGlzdDsKPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG47Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHIgPSAtRUZBVUxUOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNv
cHlfZnJvbV91c2VyKCZyZWdfbGlzdCwgdXNlcl9saXN0LAo+Pj4+Pj4+PiBzaXplb2YocmVnX2xp
c3QpKSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBuID0gcmVnX2xpc3QubjsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
Z19saXN0Lm4gPSBrdm1fbG9vbmdhcmNoX251bV9yZWdzKHZjcHUpOwo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcih1c2VyX2xpc3QsICZyZWdfbGlzdCwgc2l6ZW9mKHJl
Z19saXN0KSkpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgciA9IC1FMkJJRzsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChuIDwgcmVnX2xpc3QubikKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByID0ga3ZtX2xvb25nYXJjaF9jb3B5X3JlZ19pbmRp
Y2VzKHZjcHUsIHVzZXJfbGlzdC0+cmVnKTsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IC1FTk9JT0NUTENNRDsKPj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+
PiBUaGFua3MsCj4+Pj4+PiBaaXhpbmcKPj4+Pj4+Cj4+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IFpp
eGluZwo+Pj4+Cj4+Pgo+PiBUaGFua3MsCj4+Cj4+IFppeGluZwo+Pgo+ClRoYW5rcywKClppeGlu
ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
