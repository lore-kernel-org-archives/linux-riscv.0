Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1407CC4453A
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 02:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWRsm5tz53I+y8Yn/xuiyT3y8MgX07aVzwkEjzymYuE=; b=WWaySR7adtRogg
	ak8hFmPnceKntB4HsxKVQ3pL5gz50HCF/5lxldjKi0j1h0oK4dXO485JhwtrCnl+HK3gv/lClhRmQ
	/CXJewVH/Bd/aA6C1ufVP2oXTe5c5GJ3k9zJmvTGwXcQCDHrlBjwcDnm+9ZZ0q3oXNRHG8oyWXPWs
	wMPe+mamyotdPlMedUYv+fWOaLctXT07BbLBoO9VGxbs8J2vyOEHknn0sq+r9H7Cff7hNGuwtkccG
	4Hdxw2KSNyJniRuT4PYIiWG7jMo1H5MEeVkRbZphc6rRAkPUdnweMf+3ZEK8qXhKy/ZqgvKaSZ1HA
	ejpksDKllZNQ4OWLQ1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjIx-0000000DEyi-1JR8;
	Thu, 23 Jul 2026 02:36:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjIu-0000000DExb-3MYc
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 02:36:58 +0000
X-UUID: 5c3682fa863f11f1aa26b74ffac11d73-20260723
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e839a83c-428e-4535-b3d4-f85157ba64fe,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:e7bac3a,CLOUDID:d2742e206fa6391dd61c9f0c70fa0008,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:4
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c3682fa863f11f1aa26b74ffac11d73-20260723
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 200611879; Thu, 23 Jul 2026 10:36:51 +0800
Message-ID: <de2da58a-ae94-4e38-b9cc-517e48d894c3@kylinos.cn>
Date: Thu, 23 Jul 2026 10:36:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 2/3] selftests/bpf: test timed may_goto
 preserves R0-R5
To: Pu Lehui <pulehui@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
 <20260722-riscv-bpf-timed-may-goto-v4-2-e117e6337bc7@kylinos.cn>
 <2cd8255d-2b0a-45d8-bbc2-ac19e196c41a@huawei.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <2cd8255d-2b0a-45d8-bbc2-ac19e196c41a@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_193657_145800_2730B72A 
X-CRM114-Status: GOOD (  11.61  )
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

T24gMjAyNi83LzIyIDE5OjEwLCBQdSBMZWh1aSB3cm90ZToKPiAKPiAKPiBPbiAyMDI2LzcvMjIg
MTI6MjEsIEZlbmcgSmlhbmcgd3JvdGU6Cj4+IEFkZCBhIHRlc3QgdGhhdCBjaGVja3MgUjAtUjUg
YXJlIHByZXNlcnZlZCBhY3Jvc3MKPj4gYXJjaF9icGZfdGltZWRfbWF5X2dvdG8oKSBjYWxscy4K
Pj4KPj4gVXNlIGJwZl9nZXRfcHJhbmRvbV91MzIoKSB0byBhdm9pZCB0aGUgdmVyaWZpZXIgcmVt
b3ZpbmcgdGhlIGNoZWNrcwo+PiB2aWEgRENFLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbmcgSmlhbmcgPGpp
YW5nZmVuZ0BreWxpbm9zLmNuPgo+PiAtLS0KPj4gwqAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3Mv
dmVyaWZpZXJfbWF5X2dvdG9fMS5jwqDCoMKgwqDCoCB8IDU3ICsrKysrKysrKysrKysrKysrKysr
KysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18x
LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9f
MS5jCj4+IGluZGV4IDRiZGY0MjU2YTQxZS4uOThkNTkxMDhkMDk3IDEwMDY0NAo+PiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5jCj4+
ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290
b18xLmMKPj4gQEAgLTEwNiw0ICsxMDYsNjEgQEAgX19uYWtlZCB2b2lkIG1heV9nb3RvX2JhdGNo
XzIodm9pZCkKPj4gwqDCoMKgwqDCoCA6IF9fY2xvYmJlcl9hbGwpOwo+PiDCoCB9Cj4+IMKgICsv
Kgo+PiArICogVXNlIGJwZl9nZXRfcHJhbmRvbV91MzIoKSB0byBwcmV2ZW50IERDRSBmcm9tIHJl
bW92aW5nIHRoZSBjaGVja3MuCj4+ICsgKiByZXR2YWw6IDA9YWxsIG9rLCAxLTY9UjAtUjUgY2xv
YmJlcmVkLgo+PiArICovCj4+ICtTRUMoInJhd190cCIpCj4+ICtfX2Rlc2NyaXB0aW9uKCJ0aW1l
ZCBtYXlfZ290byBwcmVzZXJ2ZXMgUjAtUjUiKQo+PiArX19hcmNoX3g4Nl82NAo+PiArX19hcmNo
X2FybTY0Cj4+ICtfX2FyY2hfcmlzY3Y2NAo+PiArX19zdWNjZXNzCj4+ICtfX3JldHZhbCgwKQo+
IAo+IF9fYXJjaF9zMzkweCBpcyBhbHNvIHN1cHBvcnRlZCB0aW1lZF9tYXlfZ290bwoKV2lsbCBh
ZGQgaXQgaW4gdjUuCgo+IAo+PiArX19uYWtlZCB2b2lkIHRpbWVkX21heV9nb3RvX3ByZXNlcnZl
c19yZWdzKHZvaWQpCj4+ICt7Cj4+ICvCoMKgwqAgYXNtIHZvbGF0aWxlICgKPj4gK8KgwqDCoCAi
Y2FsbCAlW2JwZl9nZXRfcHJhbmRvbV91MzJdOyIKPj4gK8KgwqDCoCAicjYgPSByMDsiCj4+ICvC
oMKgwqAgInIwID0gMHgxMTExOyIKPj4gK8KgwqDCoCAicjAgKz0gcjY7Igo+PiArwqDCoMKgICJy
MSA9IDB4MjIyMjsiCj4+ICvCoMKgwqAgInIxICs9IHI2OyIKPj4gK8KgwqDCoCAicjIgPSAweDMz
MzM7Igo+PiArwqDCoMKgICJyMiArPSByNjsiCj4+ICvCoMKgwqAgInIzID0gMHg0NDQ0OyIKPj4g
K8KgwqDCoCAicjMgKz0gcjY7Igo+PiArwqDCoMKgICJyNCA9IDB4NTU1NTsiCj4+ICvCoMKgwqAg
InI0ICs9IHI2OyIKPj4gK8KgwqDCoCAicjUgPSAweDY2NjY7Igo+PiArwqDCoMKgICJyNSArPSBy
NjsiCj4+ICvCoMKgwqAgIi44Ynl0ZSAlW21heV9nb3RvXTsiCj4+ICvCoMKgwqAgIi44Ynl0ZSAl
W2xvb3BdOyIKPj4gK8KgwqDCoCAicjAgLT0gcjY7Igo+PiArwqDCoMKgICJyMSAtPSByNjsiCj4+
ICvCoMKgwqAgInIyIC09IHI2OyIKPj4gK8KgwqDCoCAicjMgLT0gcjY7Igo+PiArwqDCoMKgICJy
NCAtPSByNjsiCj4+ICvCoMKgwqAgInI1IC09IHI2OyIKPj4gK8KgwqDCoCAiaWYgcjAgIT0gMHgx
MTExIGdvdG8gMWY7Igo+PiArwqDCoMKgICJpZiByMSAhPSAweDIyMjIgZ290byAyZjsiCj4+ICvC
oMKgwqAgImlmIHIyICE9IDB4MzMzMyBnb3RvIDNmOyIKPj4gK8KgwqDCoCAiaWYgcjMgIT0gMHg0
NDQ0IGdvdG8gNGY7Igo+PiArwqDCoMKgICJpZiByNCAhPSAweDU1NTUgZ290byA1ZjsiCj4+ICvC
oMKgwqAgImlmIHI1ICE9IDB4NjY2NiBnb3RvIDZmOyIKPj4gK8KgwqDCoCAicjAgPSAwOyIKPj4g
K8KgwqDCoCAiZXhpdDsiCj4+ICvCoMKgwqAgIjE6IHIwID0gMTsgZXhpdDsiCj4+ICvCoMKgwqAg
IjI6IHIwID0gMjsgZXhpdDsiCj4+ICvCoMKgwqAgIjM6IHIwID0gMzsgZXhpdDsiCj4+ICvCoMKg
wqAgIjQ6IHIwID0gNDsgZXhpdDsiCj4+ICvCoMKgwqAgIjU6IHIwID0gNTsgZXhpdDsiCj4+ICvC
oMKgwqAgIjY6IHIwID0gNjsgZXhpdDsiCj4+ICvCoMKgwqAgOgo+PiArwqDCoMKgIDogX19pbW0o
YnBmX2dldF9wcmFuZG9tX3UzMiksCj4+ICvCoMKgwqDCoMKgIF9faW1tX2luc24obWF5X2dvdG8s
IEJQRl9SQVdfSU5TTihCUEZfSk1QIHwgQlBGX0pDT05ELCAwLCAwLCAxLCAwKSksCj4+ICvCoMKg
wqDCoMKgIF9faW1tX2luc24obG9vcCwgQlBGX1JBV19JTlNOKEJQRl9KTVAgfCBCUEZfSkEsIDAs
IDAsIC0yLCAwKSkKPj4gK8KgwqDCoCA6IF9fY2xvYmJlcl9hbGwpOwo+PiArfQo+PiArCj4+IMKg
IGNoYXIgX2xpY2Vuc2VbXSBTRUMoImxpY2Vuc2UiKSA9ICJHUEwiOwo+Pgo+IAo+IG5vdCB3b3Jr
LCBwbHMgdGFrZSBhIGxvb2sKClRoZSBfX3JldHZhbCgwKSBhbm5vdGF0aW9uIGVuYWJsZXMgdGhl
IHRlc3RfcnVuIHBhdGggaW4gdGVzdF9sYW9kZXIuCmRvX3Byb2dfdGVzdF9ydW4oKSBzZXRzIGRh
dGFfaW4vZGF0YV9vdXQvcmVwZWF0IGJ5IGRlZmF1bHQsCndoaWNoIGJwZl9wcm9nX3Rlc3RfcnVu
X3Jhd190cCgpIHJlamVjdHMgd2l0aCBFSU5WQUwuIFN3aXRjaGluZyB0bwpTRUMoInN5c2NhbGwi
KSBtYWtlcyB0ZXN0X2xvYWRlciB1c2UgZW1wdHkgb3B0cy4gV2lsbCBmaXggaXQgaW4gdjUuCgo+
IAo+IHJvb3RAKG5vbmUpOi9tbnQvYnBmIyAuL3Rlc3RfcHJvZ3MgLXYgLWEgdmVyaWZpZXJfbWF5
X2dvdG9fMQo+IGJwZl90ZXN0bW9kLmtvIGlzIGFscmVhZHkgdW5sb2FkZWQuCj4gTG9hZGluZyBi
cGZfdGVzdG1vZC5rby4uLgo+IFvCoMKgIDI2LjEyMzU0OV0gYnBmX3Rlc3Rtb2Q6IGxvYWRpbmcg
b3V0LW9mLXRyZWUgbW9kdWxlIHRhaW50cyBrZXJuZWwuCj4gW8KgwqAgMjYuMTI3ODg1XSBicGZf
dGVzdG1vZDogbW9kdWxlIHZlcmlmaWNhdGlvbiBmYWlsZWQ6IHNpZ25hdHVyZSBhbmQvb3IgcmVx
dWlyZWQga2V5IG1pc3NpbmcgLSB0YWludGluZyBrZXJuZWwKPiBTdWNjZXNzZnVsbHkgbG9hZGVk
IGJwZl90ZXN0bW9kLmtvLgo+IHRlc3Rlcl9pbml0OlBBU1M6dGVzdGVyX2xvZ19idWYgMCBuc2Vj
Cj4gcHJvY2Vzc19zdWJ0ZXN0OlBBU1M6b2JqX29wZW5fbWVtIDAgbnNlYwo+IHByb2Nlc3Nfc3Vi
dGVzdDpQQVNTOnNwZWNzX2FsbG9jIDAgbnNlYwo+IHJ1bl9zdWJ0ZXN0OlBBU1M6b2JqX29wZW5f
bWVtIDAgbnNlYwo+IHJ1bl9zdWJ0ZXN0OlBBU1M6dW5leHBlY3RlZF9sb2FkX2ZhaWx1cmUgMCBu
c2VjCj4gVkVSSUZJRVIgTE9HOgo+ID09PT09PT09PT09PT0KPiBwcm9jZXNzZWQgNDMgaW5zbnMg
KGxpbWl0IDEwMDAwMDApIG1heF9zdGF0ZXNfcGVyX2luc24gMCB0b3RhbF9zdGF0ZXMgNCBwZWFr
X3N0YXRlcyA1IG1hcmtfcmVhZCAwCj4gPT09PT09PT09PT09PQo+IGRvX3Byb2dfdGVzdF9ydW46
RkFJTDoxMTE0IEZBSUw6IFVuZXhwZWN0ZWQgYnBmX3Byb2dfdGVzdF9ydW4gZXJyb3I6IDIyIChJ
bnZhbGlkIGFyZ3VtZW50KSAjNjYwLzHCoMKgIHZlcmlmaWVyX21heV9nb3RvXzEvdGltZWQgbWF5
X2dvdG8gcHJlc2VydmVzIFIwLVI1OkZBSUwKPiAjNjYwwqDCoMKgwqAgdmVyaWZpZXJfbWF5X2dv
dG9fMTpGQUlMCj4gU3VtbWFyeTogMC8wIFBBU1NFRCwgMCBTS0lQUEVELCAxIEZBSUxFRAo+IFN1
Y2Nlc3NmdWxseSB1bmxvYWRlZCBicGZfdGVzdG1vZC5rby4KCi0tIApXaXRoIEJlc3QgUmVnYXJk
cywKRmVuZyBKaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
