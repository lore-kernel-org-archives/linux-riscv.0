Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05713C88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVT4IMN6FCH6cgFwT3nrRznZ1h0GnxKIxNbTU1t83B8=; b=L3JBWO+BbrAmRW
	H+8Sa8V07y2BxEO7yQL+2krGEes4AGg4O12GlKOSqoZznHYKFccdwJBZtmOrzThQH9Vj4SJw1b561
	0OImLcWFeN8N7VT1rf0q5/KQfct2NuzLrZygJ3xZJHPTuAlRxMfloY3/RANWAK4IzZYs/t36J0pMM
	8C/wq/haIgMaRfhvB0cfWnQCejH/+n6FhDprhml08mGqPIZlsr0RRmR0oZjcj52GAHTRAdMuUB3rw
	x4tVqYB8U/pB+/Jg0JKWAFwW99o1l6OW1C9QNuFUX3DlwXPI3bLrYkf1lyJ4MykOisEMtqpGfc+HX
	77+PJ0Tdbso9oRKi9f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFro-0000000BysZ-1rJS;
	Mon, 26 Jan 2026 06:14:28 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFri-0000000Bys9-43W8
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 06:14:27 +0000
X-UUID: 3f1cce4cfa7e11f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:967e08eb-15e0-4632-bf90-ea894c8c5d44,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8e5d8eb21336d9844e695e1d29f0d6ca,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3f1cce4cfa7e11f0b0f03b4cfa9209d1-20260126
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 744551173; Mon, 26 Jan 2026 14:14:18 +0800
Message-ID: <b637ecfb-e852-4864-a80e-fdcd34d93cbd@kylinos.cn>
Date: Mon, 26 Jan 2026 14:14:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] lib/string_kunit: add performance benchmark for
 strlen()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, mingo@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260123085841.212468-1-jiangfeng@kylinos.cn>
 <20260123085841.212468-5-jiangfeng@kylinos.cn>
 <aXNVL318XTTQ3tsU@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aXNVL318XTTQ3tsU@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_221423_855752_9BA84C42 
X-CRM114-Status: GOOD (  19.34  )
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

T24gMjAyNi8xLzIzIDE5OjAyLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MjMsIDIwMjYgYXQgMDQ6NTg6MzdQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90ZToKPj4gSW50cm9k
dWNlIGEgYmVuY2htYXJraW5nIGZyYW1ld29yayB0byB0aGUgc3RyaW5nX2t1bml0IHRlc3Qgc3Vp
dGUgdG8KPj4gbWVhc3VyZSB0aGUgZXhlY3V0aW9uIGVmZmljaWVuY3kgb2Ygc3RyaW5nIGZ1bmN0
aW9ucy4KPj4KPj4gVGhlIGltcGxlbWVudGF0aW9uIGlzIGluc3BpcmVkIGJ5IGNyY19iZW5jaG1h
cmsoKSwgbWVhc3VyaW5nIHRocm91Z2hwdXQKPj4gKE1CL3MpIGFuZCBsYXRlbmN5IChucy9jYWxs
KSBhY3Jvc3MgYSByYW5nZSBvZiBzdHJpbmcgbGVuZ3Rocy4gSXQKPj4gaW5jbHVkZXMgYSB3YXJt
LXVwIHBoYXNlLCBkaXNhYmxlcyBwcmVlbXB0aW9uIGR1cmluZyBtZWFzdXJlbWVudCwgYW5kCj4+
IHVzZXMgYSBmaXhlZCBzZWVkIGZvciByZXByb2R1Y2libGUgcmVzdWx0cy4KPj4KPj4gVGhpcyBm
cmFtZXdvcmsgYWxsb3dzIGZvciBjb21wYXJpbmcgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyAo
ZS5nLiwKPj4gZ2VuZXJpYyBDIHZzLiBhcmNoaXRlY3R1cmUtb3B0aW1pemVkIGFzc2VtYmx5KSB3
aXRoaW4gdGhlIEtVbml0Cj4+IGVudmlyb25tZW50Lgo+Pgo+PiBJbml0aWFsbHksIHByb3ZpZGUg
YSBiZW5jaG1hcmsgZm9yIHN0cmxlbigpLgo+IAo+IC4uLgo+IAo+PiArc3RhdGljIHZvaWQgKmFs
bG9jX21heF9iZW5jaF9idWZmZXIoc3RydWN0IGt1bml0ICp0ZXN0LAo+PiArCQljb25zdCBzaXpl
X3QgKmxlbnMsIHNpemVfdCBjb3VudCwgc2l6ZV90ICpidWZfbGVuKQo+PiArewo+PiArCXNpemVf
dCBpLCBtYXhfbGVuID0gMDsKPj4gKwl2b2lkICpidWY7Cj4gCj4+ICsJZm9yIChpID0gMDsgaSA8
IGNvdW50OyBpKyspIHsKPj4gKwkJaWYgKG1heF9sZW4gPCBsZW5zW2ldKQo+PiArCQkJbWF4X2xl
biA9IGxlbnNbaV07Cj4+ICsJfQo+IAo+IAlzaXplX3QgbWF4X2xlbiA9IDA7Cj4gCXZvaWQgKmJ1
ZjsKPiAKPiAJZm9yIChzaXplX3QgaSA9IDA7IGkgPCBjb3VudDsgaSsrKQo+IAkJbWF4X2xlbiA9
IG1heChsZW5zW2ldLCBtYXhfbGVuKTsKPiAKCkFncmVlZC4gSSB3aWxsIHNpbXBsaWZ5IHRoZSBs
b29wIGFuZCB1c2UgbWF4KCkgYXMgc3VnZ2VzdGVkLgoKPj4gKwkvKiBBZGQgc3BhY2UgZm9yIE5V
TCBjaGFyYWN0ZXIgKi8KPj4gKwltYXhfbGVuICs9IDE7Cj4+ICsKPj4gKwlidWYgPSBrdW5pdF9r
emFsbG9jKHRlc3QsIG1heF9sZW4sIEdGUF9LRVJORUwpOwo+PiArCWlmICghYnVmKQo+PiArCQly
ZXR1cm4gTlVMTDsKPj4gKwo+PiArCWlmIChidWZfbGVuKQo+PiArCQkqYnVmX2xlbiA9IG1heF9s
ZW47Cj4+ICsKPj4gKwlyZXR1cm4gYnVmOwo+PiArfQo+IAo+IC4uLgo+IAo+PiArI2RlZmluZSBT
VFJJTkdfQkVOQ0goaXRlcnMsIGZ1bmMsIC4uLikJCQkJCVwKPj4gKyh7CQkJCQkJCQkJXAo+PiAr
CS8qIFZvbGF0aWxlIGZ1bmN0aW9uIHBvaW50ZXIgcHJldmVudHMgZGVhZCBjb2RlIGVsaW1pbmF0
aW9uICovCVwKPj4gKwl0eXBlb2YoZnVuYykgKCogdm9sYXRpbGUgX19mdW5jKSA9IChmdW5jKTsJ
CQlcCj4+ICsJc2l6ZV90IF9fYm5faXRlcnMgPSAoaXRlcnMpOwkJCQkJXAo+PiArCXNpemVfdCBf
X2JuX3dhcm1faXRlcnM7CQkJCQkJXAo+IAo+PiArCXNpemVfdCBfX2JuX2k7CQkJCQkJCVwKPiAK
PiBEZWZpbmUgaXQgaW5zaWRlIGZvci1sb29wOnMuCj4gCgpXaWxsIGRvLgoKPj4gKwl1NjQgX19i
bl90OwkJCQkJCQlcCj4+ICsJCQkJCQkJCQlcCj4+ICsJX19ibl93YXJtX2l0ZXJzID0gbWF4KF9f
Ym5faXRlcnMgLyAxMCwgNTBVKTsJCQlcCj4+ICsJCQkJCQkJCQlcCj4+ICsJZm9yIChfX2JuX2kg
PSAwOyBfX2JuX2kgPCBfX2JuX3dhcm1faXRlcnM7IF9fYm5faSsrKQkJXAo+PiArCQkodm9pZClf
X2Z1bmMoX19WQV9BUkdTX18pOwkJCQlcCj4+ICsJCQkJCQkJCQlcCj4+ICsJcHJlZW1wdF9kaXNh
YmxlKCk7CQkJCQkJXAo+PiArCV9fYm5fdCA9IGt0aW1lX2dldF9ucygpOwkJCQkJXAo+PiArCWZv
ciAoX19ibl9pID0gMDsgX19ibl9pIDwgX19ibl9pdGVyczsgX19ibl9pKyspCQkJXAo+PiArCQko
dm9pZClfX2Z1bmMoX19WQV9BUkdTX18pOwkJCQlcCj4+ICsJX19ibl90ID0ga3RpbWVfZ2V0X25z
KCkgLSBfX2JuX3Q7CQkJCVwKPj4gKwlwcmVlbXB0X2VuYWJsZSgpOwkJCQkJCVwKPj4gKwlfX2Ju
X3Q7CQkJCQkJCQlcCj4+ICt9KQo+IAo+IC4uLgo+IAo+PiArI2RlZmluZSBTVFJJTkdfQkVOQ0hf
QlVGKHRlc3QsIGJ1Zl9uYW1lLCBidWZfc2l6ZSwgZnVuYywgLi4uKQkJXAo+PiArZG8gewkJCQkJ
CQkJCVwKPj4gKwlzaXplX3QgYnVmX3NpemUsIF9ibl9pLCBfYm5faXRlcnMsIF9ibl9zaXplID0g
MDsJCVwKPj4gKwl1NjQgX2JuX3QsIF9ibl9tYnBzID0gMCwgX2JuX2xhdCA9IDA7CQkJCVwKPj4g
KwljaGFyICpidWZfbmFtZSwgKl9ibl9idWY7CQkJCQlcCj4gCj4+ICsJaWYgKCFJU19FTkFCTEVE
KENPTkZJR19TVFJJTkdfS1VOSVRfQkVOQ0gpKQkJCVwKPj4gKwkJa3VuaXRfc2tpcCh0ZXN0LCAi
bm90IGVuYWJsZWQiKTsJCQlcCj4gCj4gSG1tLi4uIFNpbmNlIGl0J3MgYSBtYWNybyBhbnl3YXks
IEkgdGhpbmsgdGhlIG9sZCBzdHlsZSBpcyBva2F5Ogo+ID4gCj4gI2lmIElTX0VOQUJMRUQoQ09O
RklHX1NUUklOR19LVU5JVF9CRU5DSCkKPiAjZGVmaW5lIFNUUklOR19CRU5DSF9CVUYodGVzdCwg
YnVmX25hbWUsIGJ1Zl9zaXplLCBmdW5jLCAuLi4pCQlcCj4gCS4uLgo+ICNlbHNlCj4gI2RlZmlu
ZSBTVFJJTkdfQkVOQ0hfQlVGKHRlc3QsIGJ1Zl9uYW1lLCBidWZfc2l6ZSwgZnVuYywgLi4uKQkJ
XAo+IAlrdW5pdF9za2lwKHRlc3QsICJub3QgZW5hYmxlZCIpOwkJCQlcCj4gI2VuZGlmCj4gCj4g
QnV0IGNoZWNrIGl0IHRoYXQgaXQgZG9lc24ndCBwcm9kdWNlIHdhcm5pbmdzIGluIGBtYWtlIFc9
MWAgY2FzZS4KPiAKClRoYW5rcy4gVXNpbmcgI2lmIElTX0VOQUJMRUQoLi4uKSB0byBkZWZpbmUg
dGhlIG1hY3JvIGRpZmZlcmVudGx5IGlzIGNsZWFuZXIuCkkgd2lsbCBpbXBsZW1lbnQgaXQgdGhp
cyB3YXkgYW5kIGVuc3VyZSBpdCBwYXNzZXMgbWFrZSBXPTEgd2l0aG91dCB3YXJuaW5ncwoKPj4g
KwlfYm5fYnVmID0gYWxsb2NfbWF4X2JlbmNoX2J1ZmZlcih0ZXN0LCBiZW5jaF9sZW5zLAkJXAo+
PiArCQkJQVJSQVlfU0laRShiZW5jaF9sZW5zKSwgJl9ibl9zaXplKTsJCVwKPj4gKwlLVU5JVF9B
U1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIF9ibl9idWYpOwkJCVwKPj4gKwkJCQkJCQkJCVwK
Pj4gKwlmaWxsX3JhbmRvbV9zdHJpbmcoX2JuX2J1ZiwgX2JuX3NpemUpOwkJCQlcCj4+ICsJCQkJ
CQkJCQlcCj4+ICsJZm9yIChfYm5faSA9IDA7IF9ibl9pIDwgQVJSQVlfU0laRShiZW5jaF9sZW5z
KTsgX2JuX2krKykgewlcCj4+ICsJCWJ1Zl9zaXplID0gYmVuY2hfbGVuc1tfYm5faV07CQkJCVwK
Pj4gKwkJYnVmX25hbWUgPSBfYm5fYnVmICsgX2JuX3NpemUgLSBidWZfc2l6ZSAtIDE7CQlcCj4+
ICsJCV9ibl9pdGVycyA9IFNUUklOR19CRU5DSF9XT1JLTE9BRCAvIG1heChidWZfc2l6ZSwgMVUp
OwlcCj4+ICsJCQkJCQkJCQlcCj4+ICsJCV9ibl90ID0gU1RSSU5HX0JFTkNIKF9ibl9pdGVycywg
ZnVuYywgIyNfX1ZBX0FSR1NfXyk7CVwKPj4gKwkJCQkJCQkJCVwKPj4gKwkJaWYgKF9ibl90ID4g
MCkgewkJCQkJXAo+PiArCQkJX2JuX21icHMgPSAodTY0KShidWZfc2l6ZSkgKiBfYm5faXRlcnMg
KiAxMDAwOwlcCj4gCj4gIktJTE8iPyBPciAiKE1FR0EvS0lMTykiPyBJJ20gcHV6emxlZCB3aXRo
IHRoaXMgMTAwMCBtdWx0aXBsaWVyLgo+IAoKVGhlIDEwMDAgZmFjdG9yIGNvbnZlcnRzIGJ5dGVz
L25zIHRvIE1CL3PvvJoKICAoYnl0ZXMvbnMpICogKDEwXjkgbnMvcykgLyAoMTBeNiBieXRlcy9N
QikKSW4gdjUsIEkgd2lsbCByZXBsYWNlIGl0IHdpdGggKE5TRUNfUEVSX1NFQyAvIE1FR0EpIHRv
IG1ha2UgdGhlIHVuaXQKY29udmVyc2lvbiBleHBsaWNpdCBhbmQgYXZvaWQgY29uZnVzaW9uLgoK
Pj4gKwkJCV9ibl9tYnBzID0gZGl2NjRfdTY0KF9ibl9tYnBzLCBfYm5fdCk7CQlcCj4+ICsJCQlf
Ym5fbGF0ID0gZGl2NjRfdTY0KF9ibl90LCBfYm5faXRlcnMpOwkJXAo+PiArCQl9CQkJCQkJCVwK
Pj4gKwkJa3VuaXRfaW5mbyh0ZXN0LCAibGVuPSV6dTogJWxsdSBNQi9zICglbGx1IG5zL2NhbGwp
XG4iLAlcCj4+ICsJCQkJYnVmX3NpemUsIF9ibl9tYnBzLCBfYm5fbGF0KTsJCVwKPj4gKwl9CQkJ
CQkJCQlcCj4+ICt9IHdoaWxlICgwKQo+IAoKVGhhbmtzIGFnYWluIGZvciB5b3VyIHRpbWUgYW5k
IGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3IQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApGZW5nIEpp
YW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
