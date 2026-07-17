Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BDBC44512
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 02:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U7/GOPYuOwhFlqOoOZUzfsyKRU+op07xNrgNlwTcrk=; b=AoTX7HJwa6fN/C
	trq+rho5SMVJduGUXqWef129l6lzOraAA3gm/ZfInRdEdMWGLeMsB/c+OIK10TKK3VPAA/UFrO9QH
	qiLtErYrP4R1no3j9QFW4YMMBjFT4hzvCZRCqbPL7sTBXTJHYLP/P8HsY1NXGNs9a7O+Pvsgu7TXr
	G65F73b3mi4L9/C1h+3GuIO7DG0RAAxVC0xDcVXnwT7a+aMM89TNd1A3/mXbJcFrPH2u4ikbFwXb8
	SP2TmO521K+FR8jZEOtlIwKZUmSZ2ttIbXAvTKDtjnPK/kl4NttaOG3psGYOzqanO0hPSRd8q6GkW
	J7dfxgO4djdejCcHd5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYP2-00000000ySB-3Vqp;
	Fri, 17 Jul 2026 02:34:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYOz-00000000yRH-3RYZ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 02:34:15 +0000
X-UUID: fc8feb72818711f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:010ad878-b273-422c-9786-f0f4305f756d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c699595e90fe9c06c531f61dfbb4aa92,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fc8feb72818711f1aa26b74ffac11d73-20260717
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1977151119; Fri, 17 Jul 2026 10:34:08 +0800
Message-ID: <793cc487-3607-4b4d-bdfd-5c4599366e28@kylinos.cn>
Date: Fri, 17 Jul 2026 10:34:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bpf, riscv: fix missing extable entry for arena
 load_acquire
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260716-bpf-riscv-fix-extable-v2-1-421f75812533@kylinos.cn>
 <87wluvuy3b.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <87wluvuy3b.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_193414_163382_D770C706 
X-CRM114-Status: GOOD (  15.18  )
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

T24gMjAyNi83LzE2IDE2OjQwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZlbmcgSmlhbmcgPGpp
YW5nZmVuZ0BreWxpbm9zLmNuPiB3cml0ZXM6Cj4gCj4+IGVtaXRfYXRvbWljX2xkX3N0KCkgcmV0
dXJucyAxIHRvIGhhdmUgYnVpbGRfYm9keSgpIHNraXAgdGhlIHpleHQgYWZ0ZXIKPj4gYSBzdWIt
d29yZCBsb2FkX2FjcXVpcmUuIFRoZSBjYWxsZXIgZG9lcyAicmV0ID0gcmV0ID86Cj4+IGFkZF9l
eGNlcHRpb25faGFuZGxlciguLi4pIiwgd2hpY2ggc2tpcHMgYWRkX2V4Y2VwdGlvbl9oYW5kbGVy
KCkgb24gYW55Cj4+IG5vbi16ZXJvIHJldCwgc28gdGhlIGV4dGFibGUgZW50cnkgaXMgbWlzc2lu
ZyBhbmQgYSBmYXVsdGluZwo+PiBQUk9CRV9BVE9NSUMgbG9hZF9hY3F1aXJlIG9vcHNlcy4KPj4K
Pj4gQ2hlY2sgcmV0ID49IDAgYmVmb3JlIGNhbGxpbmcgYWRkX2V4Y2VwdGlvbl9oYW5kbGVyKCks
IGFuZCByZXR1cm4gcmV0Cj4+IHVuY2hhbmdlZCBzbyBidWlsZF9ib2R5KCkgc3RpbGwgc2tpcHMg
dGhlIHpleHQuCj4+Cj4+IEZpeGVzOiBmYjdjZWZhYmFlODEgKCJyaXNjdiwgYnBmOiBBZGQgc3Vw
cG9ydCBhcmVuYSBhdG9taWNzIGZvciBSVjY0IikKPj4gU3VnZ2VzdGVkLWJ5OiBQdSBMZWh1aSA8
cHVsZWh1aUBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nIEppYW5nIDxqaWFuZ2Zl
bmdAa3lsaW5vcy5jbj4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gRHJvcCBleHRyYSB2
YXJpYWJsZSBhcyBzdWdnZXN0ZWQgYnkgUHUgTGVodWkuCj4+IC0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDcxNi1icGYtcmlzY3YtZml4LWV4dGFibGUtdjEtMS1h
ZjAyM2NjMTdhZjRAa3lsaW5vcy5jbgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMgfCA1ICsrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBpbmRleCBmOWQ1MzQ3
YmE5NjYuLjBkYjg5MDkzZmY4OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+IEBA
IC0xOTg2LDcgKzE5ODYsMTAgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBi
cGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCj4+ICAJCWVsc2UKPj4g
IAkJCXJldCA9IGVtaXRfYXRvbWljX3JtdyhyZCwgcnMsIGluc24sIGN0eCk7Cj4+ICAKPj4gLQkJ
cmV0ID0gcmV0ID86IGFkZF9leGNlcHRpb25faGFuZGxlcihpbnNuLCBSRUdfRE9OVF9DTEVBUl9N
QVJLRVIsIGN0eCk7Cj4+ICsJCS8qIHJldCBjYW4gYmUgMSAoc2tpcC16ZXh0KTsgZXh0YWJsZSBl
bnRyeSBzdGlsbCBuZWVkcyB0byBiZSBhZGRlZCAqLwo+PiArCQlpZiAocmV0ID49IDApCj4+ICsJ
CQlyZXQgPSBhZGRfZXhjZXB0aW9uX2hhbmRsZXIoaW5zbiwgUkVHX0RPTlRfQ0xFQVJfTUFSS0VS
LCBjdHgpID86IHJldDsKPiAKPiBJIGRvbid0IGFncmVlIHdpdGggU2FzaGlrbyB0aGF0IHRoaXMg
d2FzIGZ1bGx5IHByZS1leGlzdGluZy4gVGhpcyBmaXgKPiBjaGFuZ2VzIHRoZSBleGlzdGluZyBi
ZWhhdmlvdXIgb2YgQlBGX0RXIHwgQlBGX0xPQURfQUNRLiBXZSBjYW4gbm93IGVuZAo+IHVwIHdp
dGggc3RhbGUgcmVnaXN0ZXIgZGF0YS4KPiAKPiBJJ2QgbGlrZSB0byBzZWUgYSB2MyB0aGF0IGFk
ZHJlc3NlcyBSRUdfRE9OVF9DTEVBUl9NQVJLRVIgZm9yIGF0b21pYwo+IGxvYWRzICh6ZXh0IGlu
Y2x1ZGVkKS4KPiAKPiAKPiBCasO2cm4KClRoYW5rcyBCasO2cm4sIG1ha2VzIHNlbnNlLiBMT0FE
X0FDUSBpcyBqdXN0IGEgbG9hZCBpbnRvIHJkLCBzbyBvbiBhCmZhdWx0IGl0IHNob3VsZCB6ZXJv
IHJkIGxpa2UgUFJPQkVfTUVNIGRvZXMuIEknbGwgZG8gYSB2MyB0aGF0IHBhc3NlcwpyZCBmb3Ig
TE9BRF9BQ1EsIHRoZSBvdGhlciBhdG9taWMgb3BzIGtlZXAgUkVHX0RPTlRfQ0xFQVJfTUFSS0VS
LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
