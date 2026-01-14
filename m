Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7926AD31A24
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Zfa1kSh6MMWVbQsADFNoc6xFT8JDHVNTGIJitSFKs4=; b=MJW9YoBuWGLTrM
	e/54A68AzYJecMw2Y77SewDBLUYn9zmDDDR2YgHdsf7uJWvfCqHFa7qUaB0XoDLuVdgUTW3oQfZYY
	VVBcY4Wk+xhCtpQw+VPdCy9Jg/8a0/wlJkO7dVd9VowqUnEBwOCab5NABPWSD6/rDayoKVpZw+4MQ
	8z3DG1/6GnC2GEoCDwHZLOFaNExBT0si9wHuW6+ZAgm6hhV680RIvEtBcUyPQRFmWzq1WXQ6G7BVh
	/LpFIKjDvKxp9+BAREXxZ+EcToH2lEk4kztVmTnSVipM/rxBgl6g50Dd7gNn7vUsIP+ELPVbx4ot0
	8Xv/tyae6G/YvX83hnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvtA-00000008Gv2-3BE8;
	Wed, 14 Jan 2026 08:06:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvsz-00000008Gtz-3G2v
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 08:05:57 +0000
X-UUID: d19a52caf11f11f0a38c85956e01ac42-20260114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6d623758-063c-4143-959d-771364ea6b9d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c83a20aa957d350a6689e0b3509b8876,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d19a52caf11f11f0a38c85956e01ac42-20260114
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 613788354; Wed, 14 Jan 2026 16:05:41 +0800
Message-ID: <6db87d0e-bfb2-4d8e-88a8-a727f96aa2d5@kylinos.cn>
Date: Wed, 14 Jan 2026 16:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
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
 <a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
 <aWdD3N_jwnt_ncc1@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aWdD3N_jwnt_ncc1@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000556_529750_937D0D7D 
X-CRM114-Status: GOOD (  19.00  )
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

T24gMjAyNi8xLzE0IDE1OjIxLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MTQsIDIwMjYgYXQgMDM6MDQ6NThQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90ZToKPj4gT24gMjAy
Ni8xLzE0IDE0OjE0LCBGZW5nIEppYW5nIHdyb3RlOgo+Pj4gT24gMjAyNi8xLzEzIDE2OjQ2LCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gCj4gLi4uCj4gCj4+PiBUaGFuayB5b3UgZm9yIHRoZSBj
YXRjaC4gWW91IGFyZSBhYnNvbHV0ZWx5IGNvcnJlY3TigJR0aGUgMjUwMHggZmlndXJlIGlzIGhl
YXZpbHkKPj4+IGRpc3RvcnRlZCBhbmQgZG9lcyBub3QgcmVmbGVjdCByZWFsLXdvcmxkIHBlcmZv
cm1hbmNlLgo+Pj4KPj4+IEkndmUgZm91bmQgdGhhdCBieSB1c2luZyBhIHZvbGF0aWxlIGZ1bmN0
aW9uIHBvaW50ZXIgdG8gY2FsbCB0aGUgaW1wbGVtZW50YXRpb25zCj4+PiAoaW5zdGVhZCBvZiBk
aXJlY3QgY2FsbHMpLCB0aGUgcmVzdWx0cyByZXR1cm5lZCB0byBhIHJlYWxpc3RpYyByYW5nZS4g
SXQgYXBwZWFycwo+Pj4gdGhlIHByZXZpb3VzIGJlbmNobWFyayBsb2dpYyBhbGxvd2VkIHRoZSBj
b21waWxlciB0byBvdmVyLW9wdGltaXplIHRoZSB0ZXN0IGxvb3AKPj4+IGluIHdheXMgdGhhdCBz
a2V3ZWQgdGhlIGRhdGEuCj4+Pgo+Pj4gSSB3aWxsIHJlZmFjdG9yIHRoZSBiZW5jaG1hcmsgbG9n
aWMgaW4gdjMsIHNwZWNpZmljYWxseSByZWZlcmVuY2luZyB0aGUgY3JjMzIKPj4+IEtVbml0IGlt
cGxlbWVudGF0aW9uIChlLmcuLCB1c2luZyB3YXJtLXVwIGxvb3BzIGFuZCBhZGRpbmcgcHJlZW1w
dF9kaXNhYmxlKCkKPj4+IHRvIGVsaW1pbmF0ZSBjb250ZXh0LXN3aXRjaCBpbnRlcmZlcmVuY2Up
IHRvIGVuc3VyZSB0aGUgZGF0YSBpcyByb2J1c3QgYW5kIGFjY3VyYXRlLgo+Pj4KPj4KPj4gSnVz
dCBhIHF1aWNrIGZvbGxvdy11cDogSSd2ZSBhbHNvIHZlcmlmaWVkIHRoYXQgdXNpbmcgYSB2b2xh
dGlsZSB2YXJpYWJsZSB0byBzdG9yZQo+PiB0aGUgcmV0dXJuIHZhbHVlIChhcyBzZWVuIGluIGNy
Y19iZW5jaG1hcmsoKSkgaXMgZXF1YWxseSBlZmZlY3RpdmUgYXQgcHJldmVudGluZwo+PiB0aGUg
b3B0aW1pemF0aW9uLgo+Pgo+PiBUaGUgY29yZSBjaGFuZ2UgaXMgYXMgZm9sbG93czoKPj4KPj4g
ICAgIHZvbGF0aWxlIHNpemVfdCBsZW47Cj4+ICAgICAuLi4KPj4gICAgIGZvciAodW5zaWduZWQg
aW50IGogPSAwOyBqIDwgaXRlcnM7IGorKykgewo+PiAgICAgICAgIE9QVElNSVpFUl9ISURFX1ZB
UihidWYpOwo+PiAgICAgICAgIGxlbiA9IHN0cmxlbihidWYpOwo+IAo+IEJ1dCBwbGVhc2UsIGNo
ZWNrIGZvciBzdXJlIHRoaXMgaXMgTGludXgga2VybmVsIGdlbmVyaWMgaW1wbGVtZW50YXRpb24g
KGJlZm9yZSkKPiBhbmQgbm90IF9fYnVpbHRpbl9zdHJsZW4oKSBmcm9tIEdDQy4gKE9UT0gsIGl0
IHdvdWxkIGJlIG5pY2UgdG8gYmVuY2htYXJrIHRoYXQKPiBvbmUgYXMgd2VsbCwgYWx0aG91Z2gg
SSB0aGluayB0aGF0IF9fYnVpbHRpbl9zdHJsZW4oKSBpbiBnZW5lcmFsIG1heWJlIHNsaWdodGx5
Cj4gYmV0dGVyIGNob2ljZSB0aGFuIExpbnV4IGtlcm5lbCBnZW5lcmljIGltcGxlbWVudGF0aW9u
LikgSS5vLncuIGJlIHN1cmUgKndoYXQqCj4geW91IHRlc3QuCj4gCgpUaGFua3MgZm9yIHRoZSBy
ZW1pbmRlci4gSSBhY3R1YWxseSB2ZXJpZmllZCB0aGlzIHdpdGggb2JqZHVtcCBhbmQgZ2RiIGJl
Zm9yZQpzdWJtaXR0aW5nIHRoZSBwYXRjaOKAlHRoZSBjYWxscyBhcmUgaW5kZWVkIGhpdHRpbmcg
dGhlIGludGVuZGVkIGFyY2gtc3BlY2lmaWMKc3RybGVuIHN5bWJvbHMsIG5vdCB0aGUgY29tcGls
ZXIncyBfX2J1aWx0aW5fc3RybGVuKCkuIEkgbWlzc2VkIG1lbnRpb25pbmcgdGhpcwpkZXRhaWwg
aW4gbXkgcHJldmlvdXMgZW1haWwuCgpJIGFsc28ganVzdCBwZXJmb3JtZWQgYW4gYWRkaXRpb25h
bCB0ZXN0IGJ5IGV4cGxpY2l0bHkgY2FsbGluZyB0aGUgZXhwb3J0ZWQKYXJjaC1zcGVjaWZpYyBf
X3BpX3N0cmxlbigpIHN5bWJvbCwgYW5kIHRoZSByZXN1bHRzIHJlbWFpbmVkIGNvbnNpc3RlbnQu
CgpSZXN1bHRzIHdpdGggcmlzY3YgX19waV9zdHJsZW4oKToKCiAgICBvayA0IHN0cmluZ190ZXN0
X3N0cmxlbgogICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0cmxlbiBwZXJmb3JtYW5j
ZSAoc2hvcnQsIGxlbjogOCwgaXRlcnM6IDEwMDAwMCk6CiAgICAjIHN0cmluZ190ZXN0X3N0cmxl
bl9iZW5jaDogICBhcmNoLW9wdGltaXplZDogNDY1MDUwMCBucwogICAgIyBzdHJpbmdfdGVzdF9z
dHJsZW5fYmVuY2g6ICAgZ2VuZXJpYyBDOiAgICAgIDU3NzYwMDAgbnMKICAgICMgc3RyaW5nX3Rl
c3Rfc3RybGVuX2JlbmNoOiAgIHNwZWVkdXA6ICAgICAgICAxLjI0eAogICAgIyBzdHJpbmdfdGVz
dF9zdHJsZW5fYmVuY2g6IHN0cmxlbiBwZXJmb3JtYW5jZSAobWVkaXVtLCBsZW46IDY0LCBpdGVy
czogMTAwMDAwKToKICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIGFyY2gtb3B0aW1p
emVkOiA2ODk1MDAwIG5zCiAgICAjIHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBnZW5lcmlj
IEM6ICAgICAgMTYzNDM0MDAgbnMKICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIHNw
ZWVkdXA6ICAgICAgICAyLjM3eAogICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0cmxl
biBwZXJmb3JtYW5jZSAobG9uZywgbGVuOiAyMDQ4LCBpdGVyczogMTAwMDApOgogICAgIyBzdHJp
bmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgYXJjaC1vcHRpbWl6ZWQ6IDgwNTI4MDAgbnMKICAgICMg
c3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIGdlbmVyaWMgQzogICAgICAzNTI5MDcwMCBucwog
ICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgc3BlZWR1cDogICAgICAgIDQuMzh4CiAg
ICBvayA1IHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaAoKPj4gICAgIH0KPiAKPiBPciB1c2luZyBX
UklURV9PTkNFKCkgOi0pIEJ1dCB0aGF0IG9uZSB3aWxsIHByb2JhYmx5IGJlIGNvbmZ1c2luZyBh
cyBpdCB1c3VhbGx5Cj4gc2hvdWxkIGJlIHBhaXJlZCB3aXRoIFJFQURfT05DRSgpIHNvbWV3aGVy
ZSBlbHNlIGluIHRoZSBjb2RlLiBTbywgSSBhZ3JlZSBvbgo+IGNyY19iZW5jaG1hcmsoKSBhcHBy
b2FjaCB0YWtlbi4KPiAKClRoYW5rcyBmb3IgdGhlIGd1aWRhbmNlLiBJJ2xsIHN0aWNrIHdpdGgg
dGhlIGNyY19iZW5jaG1hcmsoKSBwYXR0ZXJuIHRvIGF2b2lkIGFueQpwb3RlbnRpYWwgY29uZnVz
aW9uIHJlZ2FyZGluZyBjb25jdXJyZW5jeSB0aGF0IFdSSVRFX09OQ0UoKSBtaWdodCBpbXBseS4K
CkknbSBzdGlsbCBsZWFybmluZyB0aGUgbW9zdCBpZGlvbWF0aWMgcHJhY3RpY2VzIGluIHRoZSBr
ZXJuZWwsIHNvIEkgYXBwcmVjaWF0ZSB0aGUgdGlwLgoKPj4gUHJlbGltaW5hcnkgcmVzdWx0cyB3
aXRoIHRoaXMgY2hhbmdlIGxvb2sgbXVjaCBtb3JlIHJlYXNvbmFibGU6Cj4+Cj4+ICAgICBvayA0
IHN0cmluZ190ZXN0X3N0cmxlbgo+PiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0
cmxlbiBwZXJmb3JtYW5jZSAoc2hvcnQsIGxlbjogOCwgaXRlcnM6IDEwMDAwMCk6Cj4+ICAgICAj
IHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBhcmNoLW9wdGltaXplZDogNDc2NzUwMCBucwo+
PiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgZ2VuZXJpYyBDOiAgICAgIDU4MTU4
MDAgbnMKPj4gICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIHNwZWVkdXA6ICAgICAg
ICAxLjIxeAo+PiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0cmxlbiBwZXJmb3Jt
YW5jZSAobWVkaXVtLCBsZW46IDY0LCBpdGVyczogMTAwMDAwKToKPj4gICAgICMgc3RyaW5nX3Rl
c3Rfc3RybGVuX2JlbmNoOiAgIGFyY2gtb3B0aW1pemVkOiA2NTczNjAwIG5zCj4+ICAgICAjIHN0
cmluZ190ZXN0X3N0cmxlbl9iZW5jaDogICBnZW5lcmljIEM6ICAgICAgMTYzNDI1MDAgbnMKPj4g
ICAgICMgc3RyaW5nX3Rlc3Rfc3RybGVuX2JlbmNoOiAgIHNwZWVkdXA6ICAgICAgICAyLjQ4eAo+
PiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5fYmVuY2g6IHN0cmxlbiBwZXJmb3JtYW5jZSAobG9u
ZywgbGVuOiAyMDQ4LCBpdGVyczogMTAwMDApOgo+PiAgICAgIyBzdHJpbmdfdGVzdF9zdHJsZW5f
YmVuY2g6ICAgYXJjaC1vcHRpbWl6ZWQ6IDc5MzEwMDAgbnMKPj4gICAgICMgc3RyaW5nX3Rlc3Rf
c3RybGVuX2JlbmNoOiAgIGdlbmVyaWMgQzogICAgICAzNTM0NzMwMCBucwo+PiAgICAgIyBzdHJp
bmdfdGVzdF9zdHJsZW5fYmVuY2g6ICAgc3BlZWR1cDogICAgICAgIDQuNDV4Cj4+ICAgICBvayA1
IHN0cmluZ190ZXN0X3N0cmxlbl9iZW5jaAo+Pgo+PiBJIHdpbGwgYWRvcHQgdGhpcyBwYXR0ZXJu
IGluIHYzLCBhbG9uZyB3aXRoIGNhY2hlIHdhcm0tdXAgYW5kIHByZWVtcHRfZGlzYWJsZSgpLAo+
PiB0byBzdGF5IGNvbnNpc3RlbnQgd2l0aCBleGlzdGluZyBrZXJuZWwgYmVuY2htYXJrcyBhbmQg
ZW5zdXJlIHJvYnVzdCBtZWFzdXJlbWVudHMuCj4gCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkZl
bmcgSmlhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
