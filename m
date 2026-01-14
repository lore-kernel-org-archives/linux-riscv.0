Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F95AD31A14
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMRPt9t51q4rgWVrRZgZoI4IWbAqV4cL+MwhExvpOAA=; b=nb2SR02We2FNjA
	ORuS+wXtmsrZc1NdFs9gp9EhAuP2R056svc+B4k/haysYbthFqQv95y637X1UtbJ6sAh4ythS3sDz
	KuGALYhDZU4IGqrEgGb1d+gNvXvUE2JKJb3MIxEmT+wEfQvDEqnLzsmwBEZC7uhYVbQFAHxFg3bvQ
	VeksEiYtGgCMFXLRWJLm8ImVkq+1aI2eJFaIcILsdC2XQrXSGhedm5HmyOPDfYfHHgW9WtahDQT29
	n1lggEgAb+YzWEiqAlMKD+GOr02fUjHpJdn+/768fpe/H+R1ly4xG8jrMQE9nUaVXG8V8sNzWLU8e
	Bb73pvB54Smu2zVQ+SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuwK-00000008AAG-227s;
	Wed, 14 Jan 2026 07:05:12 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuwF-00000008A9p-1y7w
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 07:05:11 +0000
X-UUID: 585f38baf11711f0a38c85956e01ac42-20260114
X-CID-CACHE: Type:Local,Time:202601141414+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a1ebc0c9-de3e-4d6b-8b25-77524b028d51,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:2e6b599c24fb5439d3edbe9de9908b30,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 585f38baf11711f0a38c85956e01ac42-20260114
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1457618925; Wed, 14 Jan 2026 15:05:01 +0800
Message-ID: <a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
Date: Wed, 14 Jan 2026 15:04:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
From: Feng Jiang <jiangfeng@kylinos.cn>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-9-jiangfeng@kylinos.cn>
 <aWYGWLEekWh3jJVf@smile.fi.intel.com>
 <b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
Content-Language: en-US
In-Reply-To: <b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_230507_836001_A5A0E224 
X-CRM114-Status: GOOD (  17.23  )
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

T24gMjAyNi8xLzE0IDE0OjE0LCBGZW5nIEppYW5nIHdyb3RlOgo+IE9uIDIwMjYvMS8xMyAxNjo0
NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+PiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAwNDoy
Nzo0MlBNICswODAwLCBGZW5nIEppYW5nIHdyb3RlOgo+Pj4gSW50cm9kdWNlIGEgYmVuY2htYXJr
IHRvIGNvbXBhcmUgdGhlIGFyY2hpdGVjdHVyZS1vcHRpbWl6ZWQgc3RybGVuKCkKPj4+IGltcGxl
bWVudGF0aW9uIGFnYWluc3QgdGhlIGdlbmVyaWMgQyB2ZXJzaW9uIChfX2dlbmVyaWNfc3RybGVu
KS4KPj4+Cj4+PiBUaGUgYmVuY2htYXJrIHVzZXMgYSB0YWJsZS1kcml2ZW4gYXBwcm9hY2ggdG8g
ZXZhbHVhdGUgcGVyZm9ybWFuY2UKPj4+IGFjcm9zcyBkaWZmZXJlbnQgc3RyaW5nIGxlbmd0aHMg
KHNob3J0LCBtZWRpdW0sIGFuZCBsb25nKS4gSXQgZW1wbG95cwo+Pj4ga3RpbWVfZ2V0KCkgZm9y
IHRpbWluZyBhbmQgZ2V0X3JhbmRvbV9ieXRlcygpIGZvbGxvd2VkIGJ5IG51bGwtYnl0ZQo+Pj4g
ZmlsdGVyaW5nIHRvIGdlbmVyYXRlIHRlc3QgZGF0YSB0aGF0IHByZXZlbnRzIGVhcmx5IHRlcm1p
bmF0aW9uLgo+Pj4KPj4+IFRoaXMgaGVscHMgaW4gcXVhbnRpZnlpbmcgdGhlIHBlcmZvcm1hbmNl
IGdhaW5zIG9mIGFyY2hpdGVjdHVyZS1zcGVjaWZpYwo+Pj4gb3B0aW1pemF0aW9ucyBvbiB2YXJp
b3VzIHBsYXRmb3Jtcy4KPj4KPj4gLi4uCj4+Cj4+PiArc3RhdGljIHZvaWQgc3RyaW5nX3Rlc3Rf
c3RybGVuX2JlbmNoKHN0cnVjdCBrdW5pdCAqdGVzdCkKPj4+ICt7Cj4+PiArCWNoYXIgKmJ1ZjsK
Pj4+ICsJc2l6ZV90IGJ1Zl9sZW4sIGl0ZXJzOwo+Pj4gKwlrdGltZV90IHN0YXJ0LCBlbmQ7Cj4+
PiArCXU2NCB0aW1lX2FyY2gsIHRpbWVfZ2VuZXJpYzsKPj4+ICsKPj4+ICsJYnVmX2xlbiA9IGdl
dF9tYXhfYmVuY2hfbGVuKGJlbmNoX2Nhc2VzLCBBUlJBWV9TSVpFKGJlbmNoX2Nhc2VzKSkgKyAx
Owo+Pj4gKwo+Pj4gKwlidWYgPSBrdW5pdF9remFsbG9jKHRlc3QsIGJ1Zl9sZW4sIEdGUF9LRVJO
RUwpOwo+Pj4gKwlLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIGJ1Zik7Cj4+PiAr
Cj4+PiArCWZvciAoc2l6ZV90IGkgPSAwOyBpIDwgQVJSQVlfU0laRShiZW5jaF9jYXNlcyk7IGkr
Kykgewo+Pj4gKwkJZ2V0X3JhbmRvbV9ub256ZXJvX2J5dGVzKGJ1ZiwgYmVuY2hfY2FzZXNbaV0u
bGVuKTsKPj4+ICsJCWJ1ZltiZW5jaF9jYXNlc1tpXS5sZW5dID0gJ1wwJzsKPj4+ICsKPj4+ICsJ
CWl0ZXJzID0gYmVuY2hfY2FzZXNbaV0uaXRlcmF0aW9uczsKPj4+ICsKPj4+ICsJCS8qIDEuIEJl
bmNobWFyayB0aGUgYXJjaGl0ZWN0dXJlLW9wdGltaXplZCB2ZXJzaW9uICovCj4+PiArCQlzdGFy
dCA9IGt0aW1lX2dldCgpOwo+Pj4gKwkJZm9yICh1bnNpZ25lZCBpbnQgaiA9IDA7IGogPCBpdGVy
czsgaisrKSB7Cj4+PiArCQkJT1BUSU1JWkVSX0hJREVfVkFSKGJ1Zik7Cj4+PiArCQkJKHZvaWQp
c3RybGVuKGJ1Zik7Cj4+Cj4+IEZpcnN0IFE6IEFyZSB5b3Ugc3VyZSB0aGUgY29tcGlsZXIgZG9l
c24ndCByZXBsYWNlIHRoaXMgd2l0aCBfX2J1aWx0aW5fc3RybGVuKCkgPwo+Pgo+Pj4gKwkJfQo+
Pj4gKwkJZW5kID0ga3RpbWVfZ2V0KCk7Cj4+PiArCQl0aW1lX2FyY2ggPSBrdGltZV90b19ucyhr
dGltZV9zdWIoZW5kLCBzdGFydCkpOwo+Pj4gKwo+Pj4gKwkJLyogMi4gQmVuY2htYXJrIHRoZSBn
ZW5lcmljIEMgdmVyc2lvbiAqLwo+Pj4gKwkJc3RhcnQgPSBrdGltZV9nZXQoKTsKPj4+ICsJCWZv
ciAodW5zaWduZWQgaW50IGogPSAwOyBqIDwgaXRlcnM7IGorKykgewo+Pj4gKwkJCU9QVElNSVpF
Ul9ISURFX1ZBUihidWYpOwo+Pj4gKwkJCSh2b2lkKV9fZ2VuZXJpY19zdHJsZW4oYnVmKTsKPj4+
ICsJCX0KPj4KPj4gQXJlIHlvdSBzdXJlIHRoZSB3YXJtZWQgdXAgY2FjaGVzIGRvIG5vdCBhZmZl
Y3QgdGhlIGJlbmNobWFyaz8gSSB0aGluayB5b3UgbmVlZAo+PiB0byBmbHVzaCAvIG1ha2UgY2Fj
aGVzIGRpcnR5IG9yIHNvIG9uIGVhY2ggaXRlcmF0aW9uLgo+Pgo+Pj4gKwkJZW5kID0ga3RpbWVf
Z2V0KCk7Cj4+PiArCQl0aW1lX2dlbmVyaWMgPSBrdGltZV90b19ucyhrdGltZV9zdWIoZW5kLCBz
dGFydCkpOwo+Pj4gKwo+Pj4gKwkJc3RyaW5nX2JlbmNoX3JlcG9ydCh0ZXN0LCAic3RybGVuIiwg
JmJlbmNoX2Nhc2VzW2ldLAo+Pj4gKwkJCQl0aW1lX2FyY2gsIHRpbWVfZ2VuZXJpYyk7Cj4+PiAr
CX0KPj4+ICt9Cj4+Cj4+Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUgY2F0Y2guIFlvdSBhcmUgYWJz
b2x1dGVseSBjb3JyZWN04oCUdGhlIDI1MDB4IGZpZ3VyZSBpcyBoZWF2aWx5Cj4gZGlzdG9ydGVk
IGFuZCBkb2VzIG5vdCByZWZsZWN0IHJlYWwtd29ybGQgcGVyZm9ybWFuY2UuCj4gCj4gSSd2ZSBm
b3VuZCB0aGF0IGJ5IHVzaW5nIGEgdm9sYXRpbGUgZnVuY3Rpb24gcG9pbnRlciB0byBjYWxsIHRo
ZSBpbXBsZW1lbnRhdGlvbnMKPiAoaW5zdGVhZCBvZiBkaXJlY3QgY2FsbHMpLCB0aGUgcmVzdWx0
cyByZXR1cm5lZCB0byBhIHJlYWxpc3RpYyByYW5nZS4gSXQgYXBwZWFycwo+IHRoZSBwcmV2aW91
cyBiZW5jaG1hcmsgbG9naWMgYWxsb3dlZCB0aGUgY29tcGlsZXIgdG8gb3Zlci1vcHRpbWl6ZSB0
aGUgdGVzdCBsb29wCj4gaW4gd2F5cyB0aGF0IHNrZXdlZCB0aGUgZGF0YS4KPiAKPiBJIHdpbGwg
cmVmYWN0b3IgdGhlIGJlbmNobWFyayBsb2dpYyBpbiB2Mywgc3BlY2lmaWNhbGx5IHJlZmVyZW5j
aW5nIHRoZSBjcmMzMgo+IEtVbml0IGltcGxlbWVudGF0aW9uIChlLmcuLCB1c2luZyB3YXJtLXVw
IGxvb3BzIGFuZCBhZGRpbmcgcHJlZW1wdF9kaXNhYmxlKCkKPiB0byBlbGltaW5hdGUgY29udGV4
dC1zd2l0Y2ggaW50ZXJmZXJlbmNlKSB0byBlbnN1cmUgdGhlIGRhdGEgaXMgcm9idXN0IGFuZCBh
Y2N1cmF0ZS4KPiAKCkp1c3QgYSBxdWljayBmb2xsb3ctdXA6IEkndmUgYWxzbyB2ZXJpZmllZCB0
aGF0IHVzaW5nIGEgdm9sYXRpbGUgdmFyaWFibGUgdG8gc3RvcmUKdGhlIHJldHVybiB2YWx1ZSAo
YXMgc2VlbiBpbiBjcmNfYmVuY2htYXJrKCkpIGlzIGVxdWFsbHkgZWZmZWN0aXZlIGF0IHByZXZl
bnRpbmcKdGhlIG9wdGltaXphdGlvbi4KClRoZSBjb3JlIGNoYW5nZSBpcyBhcyBmb2xsb3dzOgoK
ICAgIHZvbGF0aWxlIHNpemVfdCBsZW47CiAgICAuLi4KICAgIGZvciAodW5zaWduZWQgaW50IGog
PSAwOyBqIDwgaXRlcnM7IGorKykgewogICAgICAgIE9QVElNSVpFUl9ISURFX1ZBUihidWYpOwog
ICAgICAgIGxlbiA9IHN0cmxlbihidWYpOwogICAgfQoKUHJlbGltaW5hcnkgcmVzdWx0cyB3aXRo
IHRoaXMgY2hhbmdlIGxvb2sgbXVjaCBtb3JlIHJlYXNvbmFibGU6CgogICAgb2sgNCBzdHJpbmdf
dGVzdF9zdHJsZW4KICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiBzdHJsZW4gcGVyZm9y
bWFuY2UgKHNob3J0LCBsZW46IDgsIGl0ZXJzOiAxMDAwMDApOgogICAgIyBzdHJpbmdfdGVzdF9z
dHJsZW5fYmVuY2g6ICAgYXJjaC1vcHRpbWl6ZWQ6IDQ3Njc1MDAgbnMKICAgICMgc3RyaW5nX3Rl
c3Rfc3RybGVuX2JlbmNoOiAgIGdlbmVyaWMgQzogICAgICA1ODE1ODAwIG5zCiAgICAjIHN0cmlu
Z190ZXN0X3N0cmxlbl9iZW5jaDogICBzcGVlZHVwOiAgICAgICAgMS4yMXgKICAgICMgc3RyaW5n
X3Rlc3Rfc3RybGVuX2JlbmNoOiBzdHJsZW4gcGVyZm9ybWFuY2UgKG1lZGl1bSwgbGVuOiA2NCwg
aXRlcnM6IDEwMDAwMCk6CiAgICAjIHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBhcmNoLW9w
dGltaXplZDogNjU3MzYwMCBucwogICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgZ2Vu
ZXJpYyBDOiAgICAgIDE2MzQyNTAwIG5zCiAgICAjIHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDog
ICBzcGVlZHVwOiAgICAgICAgMi40OHgKICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiBz
dHJsZW4gcGVyZm9ybWFuY2UgKGxvbmcsIGxlbjogMjA0OCwgaXRlcnM6IDEwMDAwKToKICAgICMg
c3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIGFyY2gtb3B0aW1pemVkOiA3OTMxMDAwIG5zCiAg
ICAjIHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBnZW5lcmljIEM6ICAgICAgMzUzNDczMDAg
bnMKICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIHNwZWVkdXA6ICAgICAgICA0LjQ1
eAogICAgb2sgNSBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2gKCkkgd2lsbCBhZG9wdCB0aGlzIHBh
dHRlcm4gaW4gdjMsIGFsb25nIHdpdGggY2FjaGUgd2FybS11cCBhbmQgcHJlZW1wdF9kaXNhYmxl
KCksCnRvIHN0YXkgY29uc2lzdGVudCB3aXRoIGV4aXN0aW5nIGtlcm5lbCBiZW5jaG1hcmtzIGFu
ZCBlbnN1cmUgcm9idXN0IG1lYXN1cmVtZW50cy4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKRmVu
ZyBKaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
