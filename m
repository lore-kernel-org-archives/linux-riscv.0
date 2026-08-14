Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4BDC5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQXIH92Aulv4cj5Dkri60AUbRIslL8RIPJFtdjBbrBE=; b=p1UN5LBMSXpAUT
	L0FNlHXvYDQQZsZLAowSFynoQX3pz4qSYV6BkyQDqWrALwWymKzMRozlTvUxFnWnvyP2mNZoI94F6
	qkHCnMUvEm1WZqdXFtM2gm3GK51i0fUu0fsdrWegoIAy6McOhB3uea1S2Tv1eFToJwOqGNpUG728W
	nkiNDZ+iER4LsCrffRsONThMsHmVq+DUKy5h0J7fIDTXRYEJEY45YPS9K96MICyYdsX6f0lNR1gjk
	Hwf64kbUQN8BB1Bvq9yFUp35yidhwAOIlcfTGknL3oDHHLu32yfqIv+5dCzS9ECjke90tObCRgojY
	UQuTiGehqAt+TQP2S2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumgC-00000002DKx-320E;
	Fri, 14 Aug 2026 07:50:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumg8-00000002DK5-3Hwu
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:50:14 +0000
X-UUID: c0ce679297b411f1aa26b74ffac11d73-20260814
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e1cb0c58-a236-4659-8646-9df8cee9de01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:8c533ba8a267d53a3861e43604bf2119,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c0ce679297b411f1aa26b74ffac11d73-20260814
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 598644516; Fri, 14 Aug 2026 15:50:00 +0800
Message-ID: <ff8e2f00-0d44-408a-8724-36bfa78911d4@kylinos.cn>
Date: Fri, 14 Aug 2026 15:49:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/2] bpf, riscv: Add BPF stack arguments
 support for RV64 JIT
To: Pu Lehui <pulehui@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260814-bpf-riscv-stack-args-v3-0-2160de56fea3@kylinos.cn>
 <20260814-bpf-riscv-stack-args-v3-1-2160de56fea3@kylinos.cn>
 <25b9821d-113c-405f-93e9-585fb745a2d6@huawei.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <25b9821d-113c-405f-93e9-585fb745a2d6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005013_529838_B75FAB48 
X-CRM114-Status: GOOD (  16.87  )
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

T24gMjAyNi84LzE0IDE0OjQ5LCBQdSBMZWh1aSB3cm90ZToKPiAKPiBPbiAyMDI2LzgvMTQgOToy
OSwgRmVuZyBKaWFuZyB3cm90ZToKPj4gQWRkIGJwZl9qaXRfc3VwcG9ydHNfc3RhY2tfYXJncygp
IGZvciB0aGUgUlY2NCBKSVQgc28gQlBGIHN1YnByb2dyYW1zCj4+IGFuZCBrZnVuY3MgY2FuIHJl
Y2VpdmUgbW9yZSB0aGFuIDUgYXJndW1lbnRzIHZpYSB0aGUgc3RhY2sKPj4gKEJQRl9SRUdfUEFS
QU1TIC8gcjExKS4KPj4KPj4gRm9yIEJQRi10by1CUEYgY2FsbHMgdGhlIGNhbGxlciB3cml0ZXMg
b3V0Z29pbmcgYXJndW1lbnRzIGF0IHRoZQo+PiBib3R0b20gb2YgaXRzIGZyYW1lIChTUC1yZWxh
dGl2ZSkuIFRoZSBjYWxsZWUgcmVhZHMgdGhlbSB3aXRoCj4+IEZQLXJlbGF0aXZlIGxvYWRzLiBJ
dHMgRlAgaXMgc2V0IHRvIHRoZSBjYWxsZXIgU1AgaW4gdGhlIHByb2xvZ3VlLAo+PiBzbyB0aGUg
b2Zmc2V0cyBtYXRjaC4KPj4KPj4gVGhlIFJJU0MtViBBQkkgcHV0cyBhcmd1bWVudHMgNi04IGlu
IEE1LUE3IGFuZCBhcmd1bWVudHMgOSsgYXQKPj4gU1ArMC4gQmVmb3JlIGVhY2gga2Z1bmMgY2Fs
bCwgbG9hZCBhcmd1bWVudHMgNi04IGZyb20gdGhlIG91dGdvaW5nCj4+IGFyZWEgaW50byBBNS1B
NyBhbmQgY29weSBhbnkgcmVtYWluaW5nIGFyZ3VtZW50cyBkb3duIHNvIGFyZ3VtZW50IDkKPj4g
bGFuZHMgYXQgU1ArMC4KPj4KPj4gQTUgKEJQRl9SRUdfMCksIEE2IChUQ0MpIGFuZCBBNyBhcmUg
c2FmZSB0byBjbG9iYmVyIGhlcmU6IFIwIGlzIG5vdAo+PiBsaXZlIGJlZm9yZSBhIGNhbGwsIFRD
QyBpcyBiYWNrZWQgdXAgb24gdGhlIHN0YWNrLCBhbmQgQTcgaXMgdW51c2VkCj4+IGJ5IHRoZSBK
SVQuCj4+Cj4+IExpbWl0IHRoZSBleGlzdGluZyBrZnVuYyBzaWduLWV4dGVuc2lvbiBsb29wIHRv
IE1BWF9CUEZfRlVOQ19SRUdfQVJHUwo+PiBpdGVyYXRpb25zOyBvdGhlcndpc2UgaWR4ID49IDUg
cmVzb2x2ZXMgdG8gUzEtUzUgKEJQRl9SNi1GUCkgYW5kCj4+IGNvcnJ1cHRzIGNhbGxlZS1zYXZl
ZCByZWdpc3RlcnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbmcgSmlhbmcgPGppYW5nZmVuZ0Br
eWxpbm9zLmNuPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5owqDCoMKgwqDC
oMKgwqAgfMKgIDEgKwo+PiDCoCBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgNzkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gwqAgYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb3JlLmPCoMKgIHzCoCA0ICsrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQs
IDgxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKPj4gaW5kZXgg
NDE5YjlkNzk1ZjJhLi45ZWI0ZTE0OTUwNWQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXQuaAo+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKPj4gQEAgLTgyLDYg
KzgyLDcgQEAgc3RydWN0IHJ2X2ppdF9jb250ZXh0IHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nIGZsYWdzOwo+PiDCoMKgwqDCoMKgIGludCBzdGFja19zaXplOwo+PiDCoMKgwqDCoMKgIGlu
dCB0Y2Nfb2Zmc2V0Owo+PiArwqDCoMKgIHUxNiBzdGFja19hcmdfc2l6ZTsKPj4gwqDCoMKgwqDC
oCB1NjQgYXJlbmFfdm1fc3RhcnQ7Cj4+IMKgwqDCoMKgwqAgdTY0IHVzZXJfdm1fc3RhcnQ7Cj4+
IMKgIH07Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBpbmRleCA2Yjk5NzJiMDdjMWIuLjU4
Y2IzZTVmZjZiNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
Ywo+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+IEBAIC0xODE1LDE4
ICsxODE1LDQzIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24g
Kmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+PiDCoCDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGluc24tPnNyY19yZWcgPT0gQlBGX1BTRVVET19LRlVOQ19DQUxMKSB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBidGZfZnVuY19tb2RlbCAqZm07Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpZHg7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludCBpZHgsIG5hcmdzOwo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbSA9
IGJwZl9qaXRfZmluZF9rZnVuY19tb2RlbChjdHgtPnByb2csIGluc24pOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoIWZtKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDCoCAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3Ig
KGlkeCA9IDA7IGlkeCA8IGZtLT5ucl9hcmdzOyBpZHgrKykgewo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBuYXJncyA9IG1pbl90KGludCwgZm0tPm5yX2FyZ3MsIE1BWF9CUEZfRlVOQ19SRUdf
QVJHUyk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaWR4ID0gMDsgaWR4IDwgbmFy
Z3M7IGlkeCsrKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggcmVn
ID0gYnBmX3RvX3J2X3JlZyhCUEZfUkVHXzEgKyBpZHgsIGN0eCk7Cj4+IMKgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZtLT5hcmdfc2l6ZVtpZHhdID09IHNpemVvZihp
bnQpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW1pdF9z
ZXh0dyhyZWcsIHJlZywgY3R4KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAr
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEJQRiBzdGFjayBhcmdzIC0+IFJJU0MtViBB
Qkk6IGFyZ3MgNi04IGluIEE1LUE3LCA5KyBhdCBTUCswICovCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChmbS0+bnJfYXJncyA+IE1BWF9CUEZfRlVOQ19SRUdfQVJHUykgewo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBuX3N0YWNrID0gZm0tPm5yX2FyZ3MgLSBN
QVhfQlBGX0ZVTkNfUkVHX0FSR1M7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW50IG5fcmVnID0gbWluX3QoaW50LCBuX3N0YWNrLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUlZfTUFYX1JFR19BUkdTIC0gTUFYX0JQRl9G
VU5DX1JFR19BUkdTKTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZv
ciAoaWR4ID0gMDsgaWR4IDwgbl9yZWc7IGlkeCsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgc3ogPSBmbS0+YXJnX3NpemVbTUFYX0JQRl9GVU5DX1JF
R19BUkdTICsgaWR4XTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZW1pdF9sZChSVl9SRUdfQTUgKyBpZHgsIGlkeCAqIDgsIFJWX1JFR19TUCwgY3R4KTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzeiA9PSBzaXpl
b2YoaW50KSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZW1pdF9zZXh0dyhSVl9SRUdfQTUgKyBpZHgsIFJWX1JFR19BNSArIGlkeCwgY3R4KTsKPiAK
PiBIaSBGZW5nIEppYW5nLAo+IAo+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcy4gSSdsbCBzcXVlZXpl
IHRoZSB0aW1lIHRvIHJldmlldyB0aGlzIHBhdGNoc2V0LCBidXQgdGhlcmUgaXMgY3VycmVudGx5
IGFuIGlzc3VlIHdpdGggUlY2NCBrZnVuYyBbMF0uIExldCdzIGhvbGQgb2ZmIGZvciBhIG1vbWVu
dC46KQo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNjA4MTQwNjQ3MjYu
MzYwNzYxNS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tCj4gCgpUaGFua3MgZm9yIHRoZSBoZWFk
cy11cC4gSSdsbCB3YWl0IGZvciBpdCB0byBsYW5kIGFuZCByZWJhc2Ugb24gdG9wLgoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
