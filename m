Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC26C982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 05:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZG3hkseWkEkURlpfM3VahJq/Ew2/4QoJPxSznXtyNU=; b=ktBvbPeriHzZIJ
	rPKKZycEbHyCUdh+UlLCWF/2ENwr3E55hYULlFNlOR8RzzoUdARckULH7qLKeHHdcEc8EpnstvoOF
	n9PwylRWonL7GRbNI++zcA/JmQqKQxN29wR7XxZ6wt0vOusG3SzeiCw1fmLcPo5V5t2eEtlyFJFfz
	tTXWjwNtaTOLNFMeBTFLSTBq/DOT5+0qdfe5Xql7HBysUd4M5tVLDqSo60ej0lP2vr/pfHkf8jfCw
	RyhM9uj5jZmGXNqP19C6PeWBZ/WPwRNoYTcEKwzxkyB+tKaMkH4y2XrwnX8GsRVyZTh10xmfsPm+0
	ldJFI46biIdI7csZFcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wM-0000000Gvbg-1gv3;
	Sun, 20 Sep 2026 05:18:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wI-0000000GvYt-1M1u
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 05:18:13 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-03 (Coremail) with SMTP id rQCowADX4D6HbK9qQxUuCA--.44669S2;
	Sun, 20 Sep 2026 13:17:59 +0800 (CST)
Message-ID: <58c888729f24169a9f487bf8c4240a6d45ee6fe5.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Date: Sun, 20 Sep 2026 13:17:58 +0800
In-Reply-To: <20260919231333-GKB322102@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
	 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
	 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
	 <20260918230107-GKC297024@kernel.org>
	 <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
	 <20260919095936-GKA322102@kernel.org>
	 <8301abce221e33d827053c54a64aed05f3227f7f.camel@icenowy.me>
	 <20260919231333-GKB322102@kernel.org>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowADX4D6HbK9qQxUuCA--.44669S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWDKFWfAF13ZF18tw48tFb_yoW5tF4kpF
	WUGa1UKa1kJr1ayr1Ut3WUXa4UK3y8Jr4UWrn8J348XrZ0vr1rKr1xtr98uF97Xr18Gw12
	qr1DtryfW3W8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_221810_901824_409FD62D 
X-CRM114-Status: GOOD (  34.10  )
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

5ZyoIDIwMjYtMDktMTnlha3nmoQgMjM6MTMgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiBI
aSBJY2Vub3d5LAo+IAo+IE9uIDIxOjU2IFNhdCAxOSBTZXDCoMKgwqDCoCAsIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gPiDlnKggMjAyNi0wOS0xOeWFreeahCAwOTo1OSArMDAwMO+8jFlpeHVuIExh
buWGmemBk++8mgo+ID4gPiBIaSBJY2Vub3d5LAo+ID4gPiAKPiA+ID4gT24gMTQ6NTcgU2F0IDE5
IFNlcMKgwqDCoMKgICwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiDlnKggMjAyNi0wOS0x
OOS6lOeahCAyMzowMSArMDAwMO+8jFlpeHVuIExhbuWGmemBk++8mgo+ID4gPiA+ID4gSGkgSWNl
bm93eSwgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIDE3OjAwIEZyaSAxOCBTZXDCoMKgwqDCoCAs
IEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+ID4gPiA+IOWcqCAyMDI2LTA5LTE45LqU55qEIDAy
OjQwICswMDAw77yMWWl4dW4gTGFu5YaZ6YGT77yaCj4gPiA+ID4gPiA+ID4gwqAgU3BhY2VtaVQn
cyBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5pdCkgY29uc2lzdCBvZgo+ID4gPiA+ID4gPiA+IHNl
dmVyYWwKPiA+ID4gPiA+ID4gPiBwb3dlcgo+ID4gPiA+ID4gPiA+IGRvbWFpbnMKPiA+ID4gPiA+
ID4gPiB3aGljaCBjYW4gYmUgbWFuYWdlZCBpbmRlcGVuZGVudGx5LCBkZXBlbmRpbmcgb24KPiA+
ID4gPiA+ID4gPiBkaWZmZXJlbnQKPiA+ID4gPiA+ID4gPiBhcHBsaWNhdGlvbgo+ID4gPiA+ID4g
PiA+IHNjZW5hcmlvLCBlYWNoIGRvbWFpbiBjYW4gYmUgcG93ZXJlZCBvbi9vZmYgZm9yIHNhdmlu
Zwo+ID4gPiA+ID4gPiA+IHBvd2VyLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IMKgIFRo
ZSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgYmFzZWQgb24gTGludXggR2VuZXJpYyBQTQo+ID4gPiA+
ID4gPiA+IERvbWFpbgo+ID4gPiA+ID4gPiA+IGZyYW1ld29yay4KPiA+ID4gPiA+ID4gPiBGcm9t
IGEgaGFyZHdhcmUgcGVyc3BlY3RpdmUsIGVpdGhlciBvZiB0d28gZGlzdGluY3QKPiA+ID4gPiA+
ID4gPiBwb3dlci1vbgo+ID4gPiA+ID4gPiA+IHNlcXVlbmNlcwo+ID4gPiA+ID4gPiA+IGFyZSBz
dXBwb3J0ZWQsIGluIHNvZnR3YXJlIG1vZGUgKFNXIG1vZGUpLCB0aGUgZHJpdmVyIGlzCj4gPiA+
ID4gPiA+ID4gcmVzcG9uc2libGUKPiA+ID4gPiA+ID4gPiBmb3IKPiA+ID4gPiA+ID4gPiBjb250
cm9sbGluZyB0aGUgc3RhdGVzIG9mIGJpdHMgc3VjaCBhcyBzbGVlcDEsIHNsZWVwMiwKPiA+ID4g
PiA+ID4gPiBpc29sYXRpb24KPiA+ID4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+ID4gPiBwd3Jfc3Rh
dGUsIHdoaWxlIGluIGhhcmR3YXJlIG1vZGUgKEhXIG1vZGUpLCB0aGUgUE1VCj4gPiA+ID4gPiA+
ID4gaGFyZHdhcmUKPiA+ID4gPiA+ID4gPiB3aWxsCj4gPiA+ID4gPiA+ID4gY29tcGxldGUKPiA+
ID4gPiA+ID4gPiB0aGUgc2VxdWVuY2UgYXV0b21hdGljYWxseSB3aXRob3V0IHJlcXVpcmluZyBz
b2Z0d2FyZQo+ID4gPiA+ID4gPiA+IGludGVydmVudGlvbi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IEkgdGhpbmsgdGhlcmUgYWxzbyBleGlzdHMgc29sdXRpb25zIGZvciBLMyB0aGF0IHVzZXMg
UlBNSQo+ID4gPiA+ID4gPiBwb3dlcgo+ID4gPiA+ID4gPiBkb21haW5zLCBhbmQgbGV0IHRoZWly
IEVTT1MgZmlybXdhcmUgdG8gYWNjZXNzIHRoZQo+ID4gPiA+ID4gPiBoYXJkd2FyZS4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiBZZXMsIEknbSBhd2FyZSBvZiB0aGF0Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gV2hhdCdzIHRoZSByZWxhdGlvbnNoaXAgb2YgdGhpcyBpbXBsZW1lbnRhdGlvbiB3aXRo
IHRoZQo+ID4gPiA+ID4gPiBFU09TCj4gPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uPyBTaG91bGQg
dGhlIEVTT1MgcGFydCBiZSBkaXNhYmxlZCB0byB1c2UKPiA+ID4gPiA+ID4gdGhpcwo+ID4gPiA+
ID4gPiBpbXBsZW1lbnRhdGlvbj8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIHNob3VsZCBzYXks
IGl0J3MgYSBtdXR1YWxseSBleGNsdXNpdmUgc29sdXRpb24sIHNvIHllcywgdGhlCj4gPiA+ID4g
PiBFU09TCj4gPiA+ID4gPiBwYXJ0Cj4gPiA+ID4gPiBzaG91bGQgYmUgZGlzYWJsZWQgaW4gb3Jk
ZXIgdG8gdXNlIHRoaXMgdmVyc2lvbgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGUgbW90aXZhdGlv
biBvZiB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBzdXBwb3J0IGRybS9kaXNwbGF5Cj4gPiA+ID4g
PiBkcml2ZXIncwo+ID4gPiA+ID4gUE0gcmVxdWlyZW1lbnQsIHdoaWxlIGF2b2lkIGdvaW5nIHdp
dGggdmVuZG9yJ3MgY29tcGxpY2F0ZWQKPiA+ID4gPiA+IFJQTUkKPiA+ID4gPiA+IHNvbHV0aW9u
Cj4gPiA+ID4gPiB3aGljaCBpc24ndCBtYWlubGluZSByZWFkeQo+ID4gPiA+IAo+ID4gPiA+IElz
IHRoaXMgYSBsb25nLXRlcm0gc29sdXRpb24sIG9yIGEgdGVtcG9yYXJ5IG9uZT8KPiA+ID4gPiAK
PiA+ID4gRm9yIHVwc3RyZWFtLCBJJ2Qgc2F5IHdlIHByb2JhYmx5IHdpbGwgc3RpY2sgdG8gdGhp
cyBzb2x1dGlvbiBmb3IKPiA+ID4gbG9uZyB0aW1lLCB3b24ndCBzYXkgaXQgJ2ZvcmV2ZXInLCBz
ZWUgY29tbWVudCBiZWxvdy4uCj4gPiA+IAo+ID4gPiA+IElmIGl0J3MgYSB0ZW1wb3JhcnkgY29u
ZmxpY3Rpbmcgb25lLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGgKPiA+ID4gPiBwaWNraW5nCj4g
PiA+ID4gYXQgYWxsLgo+ID4gPiA+IAo+ID4gPiBXZWxsLCBjaGVja2VkIGN1cnJlbnQgTGludXgg
a2VybmVsIHN0YXR1cywgdGhlcmUgaXMgbm8gUlBNSSBQTQo+ID4gPiBzb2x1dGlvbiAKPiA+ID4g
aW1wbGVtZW50ZWQgYWx0aG91Z2ggdGhlcmUgaXMgZG9jdW1lbnRhdGlvbiBpbiByaXNjdi1ycG1p
IHNwZWNbMV0KPiA+IAo+ID4gSSBoYXZlIHNlZW4gcGVuZGluZyBwYXRjaCBmb3IgaXQgd2l0aCBt
dWx0aXBsZSByZXZpc2lvbnMgWzFdLCB0aGUKPiA+IGR0Cj4gPiBiaW5kaW5nIGlzIGV2ZW4gYWxy
ZWFkeSBBQ0tlZCBieSBDb25vciwgc28gSSB0aGluayBpdCdzIG5vdCBhIGJpZwo+ID4gcHJvYmxl
bSBoZXJlLgo+ID4gCj4gVGhhdCdzIGV4YWN0bHkgd2hhdCBJIHNhaWQgLSBpdCdzIG5vdCBtYXR1
cmUsIG5vdCBzYXlpbmcgaXQncyBwZW5kaW5nCj4gcGF0Y2ggZm9yIHJldmlldywgYnV0IGZvciB3
aG9sZSBzb2x1dGlvbiB0aGF0IGludm9sdmUgTGludXggZHJpdmVyLAo+IG9wZW5zYmkgYW5kIHVu
ZGVybHlpbmcgZmltd2FyZSAoRVNPUykgLSB3aGljaCBub3QgdXBzdHJlYW0tZWQuLgoKRXhjZXB0
IGZvciB0aGUgTVBYWSBwYXJ0ICh3aGljaCBzZWVtcyB0byBiZSBhbHJlYWR5IG1haW5saW5lZCks
IE9wZW5TQkkKaXMgb25seSBhIFJQTUkgY29uc3VtZXIuCgpFU09TIGlzIHZlbmRvci1zcGVjaWZp
YyB0aGluZyBhbmQgaXRzIHZlcnNpb24gZnJvbSB0aGUgdmVuZG9yIGFscmVhZHkKY29udGFpbnMg
dGhlIFJQTUkgaW1wbGVtZW50YXRpb24uCgpUaGUgTGludXggZHJpdmVyIGFsc28gYXBwZWFycyBl
YXJsaWVyIGFuZCByZWNlaXZlZCBtb3JlIHJldmlldyB0aGFuCnRoaXMgZHJpdmVyLgoKRm9yIG5v
dCByZWludmVudGluZyB0aGUgd2hlZWwsIGl0IHdvdWxkIGJlIGJldHRlciB0byB3b3JrIG9uIHRo
ZSBSUE1JClBNIGRyaXZlci4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBUbyBtYWtlIGl0IGNsZWFy
LCBJJ20gbm90IGdvaW5nIHRvIHB1cnN1ZSB0aGUgUlBNSSBzb2x1dGlvbiwgYnV0IGlmCj4gc29t
ZW9uZSBpbnNpc3QgYW5kIHdpbGxpbmcgdG8gc3BlbmQgdGhlIGVmZm9ydCwgcGxlYXNlIGZlZWwg
ZnJlZSB0bwo+IHB1c2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
