Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70865C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pkCXeNBEzBD3vMXDdtg/p0W5TeRTdv/utoeHLZ2pfA=; b=KqH4WPH1JDpav9
	NKZKD2CLYHhWArjjRVca5PqMxmGtdP+HF2cLUs+8m0EqmCYXBJngSDFoNBkRGt/psjuz0Vbed2K9i
	lpqikx/qUC/h0a0chisjIE44lEyFsTqDBURbuSIsAjX08zoKYd35zi5pGB2I1yJ0g4dEk+03u0DQw
	ikWyGUy2Gfmg9gk8rYDtbskIx1pXCvxEzIubxzkgnBGad3AKZ1+M/v5GpqoX2zPTTThencAJ8Dtmg
	/sNFkISff3wAZntn/Vb/jHrxGXecmvPdLoM/eL5X6JIud33/jbR6UDumQrfFDLLdiJ1ih/Ghqz8AS
	i2nDrIQsoG/BCwhINf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGUL-0000000GeW5-29FJ;
	Thu, 16 Jul 2026 07:26:34 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGUH-0000000GeTq-37OH
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 07:26:32 +0000
X-UUID: a447501880e711f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7685f8c4-8899-48d2-b484-b9d5d74bd90e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0d4e1e5c6215962a8491b5039acde1e8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a447501880e711f1aa26b74ffac11d73-20260716
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 620461011; Thu, 16 Jul 2026 15:26:20 +0800
Message-ID: <714418f3-03a8-40e7-81b7-68ca20a26437@kylinos.cn>
Date: Thu, 16 Jul 2026 15:26:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf, riscv: fix missing extable entry for arena
 load_acquire
To: Pu Lehui <pulehui@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260716-bpf-riscv-fix-extable-v1-1-af023cc17af4@kylinos.cn>
 <ed7c71d1-f692-4a8f-954e-2d3ea9177c28@huawei.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <ed7c71d1-f692-4a8f-954e-2d3ea9177c28@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_002630_097484_25A7A1B3 
X-CRM114-Status: GOOD (  15.26  )
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

T24gMjAyNi83LzE2IDE1OjAxLCBQdSBMZWh1aSB3cm90ZToKPiAKPiBPbiAyMDI2LzcvMTYgMTQ6
MTUsIEZlbmcgSmlhbmcgd3JvdGU6Cj4+IGVtaXRfYXRvbWljX2xkX3N0KCkgcmV0dXJucyAxIHRv
IGhhdmUgYnVpbGRfYm9keSgpIHNraXAgdGhlIHpleHQgYWZ0ZXIKPj4gYSBzdWItd29yZCBsb2Fk
X2FjcXVpcmUuIFRoZSBjYWxsZXIgZG9lcyAicmV0ID0gcmV0ID86Cj4+IGFkZF9leGNlcHRpb25f
aGFuZGxlciguLi4pIiwgd2hpY2ggc2tpcHMgYWRkX2V4Y2VwdGlvbl9oYW5kbGVyKCkgb24gYW55
Cj4+IG5vbi16ZXJvIHJldCwgc28gdGhlIGV4dGFibGUgZW50cnkgaXMgbWlzc2luZyBhbmQgYSBm
YXVsdGluZwo+PiBQUk9CRV9BVE9NSUMgbG9hZF9hY3F1aXJlIG9vcHNlcy4KPj4KPj4gQ2hlY2sg
cmV0ID49IDAgYmVmb3JlIGNhbGxpbmcgYWRkX2V4Y2VwdGlvbl9oYW5kbGVyKCksIGFuZCByZXR1
cm4gcmV0Cj4+IHVuY2hhbmdlZCBzbyBidWlsZF9ib2R5KCkgc3RpbGwgc2tpcHMgdGhlIHpleHQu
Cj4+Cj4+IEZpeGVzOiBmYjdjZWZhYmFlODEgKCJyaXNjdiwgYnBmOiBBZGQgc3VwcG9ydCBhcmVu
YSBhdG9taWNzIGZvciBSVjY0IikKPj4gU2lnbmVkLW9mZi1ieTogRmVuZyBKaWFuZyA8amlhbmdm
ZW5nQGt5bGlub3MuY24+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jIHwgMTIgKysrKysrKystLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBpbmRleCBm
OWQ1MzQ3YmE5NjYuLjRmZDQzOTJkZDA4MCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
Cj4+IEBAIC0xOTg2LDEwICsxOTg2LDE0IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBz
dHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBl
bWl0X2F0b21pY19ybXcocmQsIHJzLCBpbnNuLCBjdHgpOwo+PiDCoCAtwqDCoMKgwqDCoMKgwqAg
cmV0ID0gcmV0ID86IGFkZF9leGNlcHRpb25faGFuZGxlcihpbnNuLCBSRUdfRE9OVF9DTEVBUl9N
QVJLRVIsIGN0eCk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiAtwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiByZXQgY2FuIGJlIDEgKHNraXAtemV4dCk7IGV4dGFibGUgZW50cnkgc3Rp
bGwgbmVlZHMgdG8gYmUgYWRkZWQgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgPj0gMCkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgZXJyID0gYWRkX2V4Y2VwdGlvbl9oYW5k
bGVyKGluc24sIFJFR19ET05UX0NMRUFSX01BUktFUiwgY3R4KTsKPiAKPiBUaGFua3MgRmVuZyBK
aWFuZy4gTWF5YmUgd2UgY291bGQgcmVtb3ZlIHRoaXMgYWRkaXRpb25hbCB2YXJpYWJsZS4KPiAK
PiBgYGAKPiAvKiByZXQgY2FuIGJlIDEgKHNraXAtemV4dCk7IGV4dGFibGUgZW50cnkgc3RpbGwg
bmVlZHMgdG8gYmUgYWRkZWQgKi8KPiBpZiAocmV0ID49IDApCj4gwqAgcmV0ID0gYWRkX2V4Y2Vw
dGlvbl9oYW5kbGVyKGluc24sIFJFR19ET05UX0NMRUFSX01BUktFUiwgY3R4KSA/OiByZXQ7Cj4g
Cj4gaWYgKHJldCkKPiDCoCByZXR1cm4gcmV0Owo+IAo+IGJyZWFrOwo+IGBgYAo+IAoKVGhhbmtz
IGZvciB0aGUgcmV2aWV3ISBZb3VyIHN1Z2dlc3Rpb24gaXMgaW5kZWVkIGNsZWFuZXIgYW5kIG1v
cmUgY29uY2lzZS4gSSdsbCBzZW5kIHYyIHNob3J0bHkuCgo+IAo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGVycjsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7Cj4+IMKgIMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBy
X2VycigiYnBmLWppdDogdW5rbm93biBvcGNvZGUgJTAyeFxuIiwgY29kZSk7Cj4+Cj4+IC0tLQo+
PiBiYXNlLWNvbW1pdDogYTEzYzE0MGNjMjg5YzBiN2IzNzcwYmNlNWIzYWQ0MmFiMzUwNzRhYQo+
PiBjaGFuZ2UtaWQ6IDIwMjYwNzE2LWJwZi1yaXNjdi1maXgtZXh0YWJsZS0zOTk5NDdjYTc3OGQK
Pj4KPj4gQmVzdCByZWdhcmRzLAoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApGZW5nIEppYW5nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
