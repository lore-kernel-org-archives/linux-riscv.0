Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A9CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 01:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umsTgaE08zTrTFSFuT25CdVVgEuO/L8wrMOHpmp6xiw=; b=qy6U2f4FnVzCUp
	ApClr8SBhmqia16zo01UvXP7FTmqCJJq/7P6dT/GmXxgu//nM5EvsOFhJiaEtK5ggbmlQ2rycCNW4
	Yx7RbFgQ+Xf/wlJhgufTGyy+kFxijGNOjxqv+B8nyQKfi+8EkTtTXfn5wIgIUSJbBugXw+gLzJjVJ
	OGmMvrgpufCwIZcSnQFGXHZcwjl2r2Vh9KUGpBBUV90W/BR5l9jXFDvOEKZ9F2T5yRFjdF4VQXiC0
	/yt7MhxoYdLocEMLvCPrtdEozDXTaLkLuTcCy2ZElaSkrJuFqeiRzV7kT9l5DXDGtNJ4TpvIN6xLs
	6FrNT2PYnLngvGmzdHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCRqd-0000000ASnP-0638;
	Fri, 02 Oct 2026 01:14:03 +0000
Received: from out-227.mta1.migadu.com ([95.215.58.227] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCRqZ-0000000ASmc-1yyQ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 01:14:02 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NWX2xZSeNthE4d+FVcGdGWkc32k8tGi3zDx/87hg2j4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790903636; v=1; x=1791508436;
 b=p+a8rVr81NcJJcfxxPvcAE5oHHNJXWPDJiJJHG6aDo0cgZ3g/hqhJvST6DeXPDrKKNfK73Nd
 mizzwlztS/s+4+YQw80HMi3LAIX6g88tdJkPAf0aLYTbL2NmTFyZ0WQ/eW5Vkf6EHzbnWjk7w4S
 InxLzehMTgIIP+r16eOg/d3U=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 06414f6154828934;
	Fri, 02 Oct 2026 01:13:56 +0000
X-Mizu-Trace-ID: 06414f6154828934
X-Migadu-Flow: FLOW_OUT
Message-ID: <5382c8744bac2a1d17fd96f76aa6a5245cf8a94e.camel@linux.dev>
Subject: Re: [PATCH bpf 1/1] bpf, riscv: Fix stack arguments of struct_ops
 trampolines
From: KaFai Wan <kafai.wan@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,  Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 09:13:45 +0800
In-Reply-To: <20261001154038.2265210-1-kafai.wan@linux.dev>
References: <20261001154038.2265210-1-kafai.wan@linux.dev>
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_181400_506799_FACBB7B1 
X-CRM114-Status: GOOD (  17.30  )
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

T24gVGh1LCAyMDI2LTEwLTAxIGF0IDIzOjQwICswODAwLCBLYUZhaSBXYW4gd3JvdGU6CgpJIHJh
biB0aGUgdGVzdHMgeWVzdGVyZGF5IGFuZCBkaWRu4oCZdCBub3RpY2UgdGhhdCBQdSBMZWh1aSBo
YWQgYWxyZWFkeSBzZW50IHRoZSBzYW1lIHBhdGNoLiBQbGVhc2UKaWdub3JlIHRoaXMuIFNvcnJ5
IGZvciB0aGUgbm9pc2UuCgo+IFdoZW4gYSBzdHJ1Y3Rfb3BzIHRyYW1wb2xpbmUgdGFrZXMgbW9y
ZSB0aGFuIDggYXJndW1lbnRzICh1cCB0byAxMiksIHRoZQo+IDl0aCBhbmQgYmV5b25kIGFyZSBw
YXNzZWQgb24gdGhlIHN0YWNrLiBzdG9yZV9hcmdzKCkgY29waWVzIHRoZW0gaW50byB0aGUKPiB0
cmFtcG9saW5lIGZyYW1lIHVzaW5nIGEgaGFyZC1jb2RlZCBGUCArIDE2IGJhc2U6Cj4gCj4gCWVt
aXRfbGQoUlZfUkVHX1QxLCAxNiArIChpIC0gUlZfTUFYX1JFR19BUkdTKSAqIDgsIFJWX1JFR19G
UCwgY3R4KTsKPiAKPiBUaGF0IG9mZnNldCBvbmx5IGhvbGRzIGZvciBmZW50cnkgdHJhbXBvbGlu
ZXMsIHdoZXJlIHRoZSB0cmFjZWQgZnVuY3Rpb24ncwo+IFQwL0ZQIGFyZSBzYXZlZCBhdCBGUCAt
IDgvRlAgLSAxNiBhbmQgaXRzIHN0YWNrIGFyZ3VtZW50cyBzdGFydCBhdCBGUCArIDE2Lgo+IEEg
c3RydWN0X29wcyB0cmFtcG9saW5lIGlzIGNhbGxlZCBkaXJlY3RseSwgc28gaXRzIHN0YWNrIGFy
Z3VtZW50cyBzdGFydCBhdAo+IEZQICsgMCBhbmQgc3RvcmVfYXJncygpIHJlYWRzIHRoZSB3cm9u
ZyB3b3Jkcy4gQlBGIHByb2dyYW1zIHRoZW4gc2VlIGdhcmJhZ2UKPiBmb3IgYXJnOSBhbmQgYmV5
b25kLCB3aGljaCBmYWlscyB0aGUgc2VsZnRlc3Q6Cj4gCj4gwqAgc3RydWN0X29wc19tdWx0aV9h
cmdzL3Rlc3RfdHJhbXBvbGluZV9zdGFja19hcmdzOkZBSUwKPiAKPiBQYXNzIHRoZSBzdGFjayBh
cmd1bWVudCBiYXNlIG9mZnNldCB0byBzdG9yZV9hcmdzKCk6IDAgZm9yIHN0cnVjdF9vcHMKPiB0
cmFtcG9saW5lcywgMTYgb3RoZXJ3aXNlLgo+IAo+IEZpeGVzOiA2ODAxYjBhZWY3OWQgKCJyaXNj
diwgYnBmOiBBZGQgMTItYXJndW1lbnQgc3VwcG9ydCBmb3IgUlY2NCBicGYgdHJhbXBvbGluZSIp
Cj4gU2lnbmVkLW9mZi1ieTogS2FGYWkgV2FuIDxrYWZhaS53YW5AbGludXguZGV2Pgo+IC0tLQo+
IMKgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDggKysrKy0tLS0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jCj4gaW5kZXggMDFmZTY2Nzc0ZjAyLi40YWU2Njc0ZjU4ZWQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtODc1LDcgKzg3NSw3IEBAIGludCBicGZfYXJjaF90
ZXh0X3Bva2Uodm9pZCAqaXAsIGVudW0gYnBmX3RleHRfcG9rZV90eXBlIG9sZF90LAo+IMKgCXJl
dHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIHZvaWQgc3RvcmVfYXJncyhpbnQgbnJfYXJn
X3Nsb3RzLCBpbnQgYXJnc19vZmYsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ICtzdGF0
aWMgdm9pZCBzdG9yZV9hcmdzKGludCBucl9hcmdfc2xvdHMsIGludCBhcmdzX29mZiwgaW50IHN0
YWNrX2Jhc2UsIHN0cnVjdCBydl9qaXRfY29udGV4dAo+ICpjdHgpCj4gwqB7Cj4gwqAJaW50IGk7
Cj4gwqAKPiBAQCAtODgzLDggKzg4Myw3IEBAIHN0YXRpYyB2b2lkIHN0b3JlX2FyZ3MoaW50IG5y
X2FyZ19zbG90cywgaW50IGFyZ3Nfb2ZmLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQKPiAqY3QKPiDC
oAkJaWYgKGkgPCBSVl9NQVhfUkVHX0FSR1MpIHsKPiDCoAkJCWVtaXRfc2QoUlZfUkVHX0ZQLCAt
YXJnc19vZmYsIFJWX1JFR19BMCArIGksIGN0eCk7Cj4gwqAJCX0gZWxzZSB7Cj4gLQkJCS8qIHNr
aXAgc2xvdHMgZm9yIFQwIGFuZCBGUCBvZiB0cmFjZWQgZnVuY3Rpb24gKi8KPiAtCQkJZW1pdF9s
ZChSVl9SRUdfVDEsIDE2ICsgKGkgLSBSVl9NQVhfUkVHX0FSR1MpICogOCwgUlZfUkVHX0ZQLCBj
dHgpOwo+ICsJCQllbWl0X2xkKFJWX1JFR19UMSwgc3RhY2tfYmFzZSArIChpIC0gUlZfTUFYX1JF
R19BUkdTKSAqIDgsIFJWX1JFR19GUCwKPiBjdHgpOwo+IMKgCQkJZW1pdF9zZChSVl9SRUdfRlAs
IC1hcmdzX29mZiwgUlZfUkVHX1QxLCBjdHgpOwo+IMKgCQl9Cj4gwqAJCWFyZ3Nfb2ZmIC09IDg7
Cj4gQEAgLTExNzksNyArMTE3OCw4IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3Ry
YW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCj4gwqAJZnVuY19tZXRhID0gbnJf
YXJnX3Nsb3RzOwo+IMKgCWVtaXRfc3RvcmVfc3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAtZnVuY19t
ZXRhX29mZiwgZnVuY19tZXRhLCBjdHgpOwo+IMKgCj4gLQlzdG9yZV9hcmdzKG5yX2FyZ19zbG90
cywgYXJnc19vZmYsIGN0eCk7Cj4gKwkvKiBza2lwIHNsb3RzIGZvciBUMCBhbmQgRlAgb2YgdHJh
Y2VkIGZ1bmN0aW9uICovCj4gKwlzdG9yZV9hcmdzKG5yX2FyZ19zbG90cywgYXJnc19vZmYsIGlz
X3N0cnVjdF9vcHMgPyAwIDogMTYsIGN0eCk7Cj4gwqAKPiDCoAlpZiAoYnBmX2ZzZXNzaW9uX2Nu
dCh0bm9kZXMpKSB7Cj4gwqAJCS8qIGNsZWFyIGFsbCBzZXNzaW9uIGNvb2tpZXMnIHZhbHVlICov
CgotLSAKVGhhbmtzLApLYUZhaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
