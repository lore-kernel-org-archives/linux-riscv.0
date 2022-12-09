Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B953EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cHDvIue7XI2k1cXRJZgQl9Z7aIcyW8FV6J/b/bqexg=; b=Puy6lO/UVtoAc2
	Xhr1mCUJAmIKLWhwkuECfLNGQjAFPVcSMYA+4IxFcG1Ko2ykdHjwjZxowAuLyuUkMafKfoOYXFdF5
	P3OXpHlmkjp94XKWyW11+jyRMpaTJDljXoX938BbjwGdqTtZLMk0M7EvCM2oFst13HxJzbfoCDoJw
	EpP11Ch/QQt3oqMzYXtqUZl80YeJfNoHXuhKtE7HX75Ms8thUKow+8Bw9C30VB6Puzdztk0vhsMeJ
	ZZYvBheDzyO6d/Zm5m/zqc/A6McXWDiesafcg2pXuQyVRO7SA/8o66BGshCOvDgkiZWQqXNtAZwd1
	zssBSM0ecW6EDynmvyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fZV-0097Be-Jo; Fri, 09 Dec 2022 15:45:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fR3-0092iw-3S
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 15:37:15 +0000
Received: from [198.18.0.1] (unknown [59.59.28.169])
	by APP-01 (Coremail) with SMTP id qwCowAB3fnIXVpNjL60FBg--.9945S2;
	Fri, 09 Dec 2022 23:36:57 +0800 (CST)
Message-ID: <d32afb75-88b4-6629-1ef1-2ea2e8d2a98c@iscas.ac.cn>
Date: Fri, 9 Dec 2022 23:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, jeff@riscv.org
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn> <Y5Dfog2HYhejuDX8@spud>
 <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
 <28494e11-8f4d-7466-13d7-12e22f8f67fe@iscas.ac.cn>
 <20221209074229.iexrvp5hkuq3qz2l@kamzik>
 <CD44ACE9-43EC-4865-8604-1C7876D5EEAE@kernel.org>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <CD44ACE9-43EC-4865-8604-1C7876D5EEAE@kernel.org>
X-CM-TRANSID: qwCowAB3fnIXVpNjL60FBg--.9945S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4rAr1xAFy3ZF1rZrWxXrb_yoW5Xr4xpr
	W8KanYkF4vqryFkw4vyw1DKr95tr4DA3s8Wrn5Gr4UCayqvr1Syr1v9as8CFn7Xr48Zr42
	qFW0qry3Zw45A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0S
	jxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8HGQDUUUUU==
X-Originating-IP: [59.59.28.169]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgQPDGOS99jW5wABsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_073713_567782_5589F14E 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKT24gMjAyMi8xMi85IDIyOjMzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gCj4gCj4g
T24gOSBEZWNlbWJlciAyMDIyIDA4OjQyOjI5IEdNVCswMTowMCwgQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgRGVjIDA5LCAyMDIyIGF0IDAx
OjM0OjQyQU0gKzA4MDAsIFFpbmdsaW4gUGFuIHdyb3RlOgo+PiAuLi4KPj4+Pj4+ICsjaWZkZWYg
Q09ORklHX1JJU0NWX0lTQV9TVk5BUE9UCj4+Pj4+PiArI2RlZmluZSBIVUdFX01BWF9IU1RBVEXC
oMKgwqDCoMKgwqDCoCAoMiArIChOQVBPVF9PUkRFUl9NQVggLQo+Pj4+Pj4gTkFQT1RfQ09OVF9P
UkRFUl9CQVNFKSkKPj4+Pj4+ICsjZWxzZQo+Pj4+Pj4gKyNkZWZpbmUgSFVHRV9NQVhfSFNUQVRF
wqDCoMKgwqDCoMKgwqAgMgo+Pj4+Pj4gKyNlbmRpZgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIGNvbWlu
ZyBmcm9tIGEgcGxhY2Ugb2YgKmNvbXBsZXRlKiBpZ25vcmFuY2U6Cj4+Pj4+IElmIENPTkZJR19S
SVNDVl9JU0FfU1ZOQVBPVCBpcyBlbmFibGVkIGluIHRoZSBrZXJuZWwgYnV0IHRoZXJlIGlzIG5v
Cj4+Pj4+IHN1cHBvcnQgZm9yIGl0IG9uIGEgcGxhdGZvcm0gaXMgaXQgb2theSB0byBjaGFuZ2Ug
dGhlIHZhbHVlIG9mCj4+Pj4+IEhVR0VfTUFYX0hTVEFURT8gQXBvbG9naWVzIGlmIEkndmUgbWlz
c2VkIHNvbWV0aGluZyBvYnZpb3VzLgo+Pj4+Cj4+Pj4gOigKPj4+PiBZb3UgYXJlIHJpZ2h0LiBJ
ZiBDT05GSUdfUklTQ1ZfSVNBX1NWTkFQT1QgaXMgZW5hYmxlZCwgSFVHRV9NQVhfSFNUQVRFCj4+
Pj4gd2lsbCBhbHdheXMgYmUgMyB3aGV0aGVyIGhhc19zdm5hcG90KCkgaXMgdHJ1ZSBvciBmYWxz
ZS4gSSB3aWxsIHRyeSB0bwo+Pj4+IGZpeCB0aGlzLgo+Pj4KPj4+IEkgYW0gcmVhbGx5IGV4cGVj
dGluZyB0aGF0IEhVR0VfTUFYX0hTVEFURSBjYW4gY2hhbmdlIGFjY29yZGluZyB0byB0aGUKPj4+
IHBsYXRmb3JtIHNpdHVhdGlvbiB3aGVuIENPTkZJR19SSVNDVl9JU0FfU1ZOQVBPVCBpcyBlbmFi
bGVkLiBCdXQgaXQKPj4+IHNlZW1zIGltcG9zc2libGUgdG8gYWNoaXZlIHRoaXMgd2l0aCBhIG1p
bm9yIHBhdGNoLiBCZWNhdXNlIHRoaXMgdmFsdWUKPj4+IGlzIHVzZWQgYXMgc29tZSBzdGF0aWMg
YWxsb2NhdGVkIGFycmF5cycgbGVuZ3RoIChmb3IgZXhhbXBsZSwgaHN0YXRlcyBpbgo+Pj4gbW0v
aHVnZXRsYi5jOjUyKSBpbiBhcmNoLWluZGVwZW5kZW50IGNvZGUgOigKPj4+Cj4+PiBUaGlzIGlt
bXV0dXJlIEhVR0VfTUFYX0hTVEFURSB2YWx1ZSB3aWxsIGNhdXNlIG5vIGZ1bmN0aW9uYWwgZXJy
b3IgYnV0Cj4+PiBpdCByZWFsbHkgbWFrZXMgc29tZSBvYmplY3RzIHVzZWQgb25seSBwYXJ0aWFs
bHkgd2hlbgo+Pj4gQ09ORklHX1JJU0NWX0lTQV9TVk5BUE9UIGlzIGVuYWJsZWQgYnV0IHRoZSBw
bGF0Zm9ybSBoYXMgbm8gc3ZuYXBvdAo+Pj4gc3VwcG9ydCA6KCBJIGFtIG5vdCBzdXJlIHdoZXRo
ZXIgdGhpcyBwYXRjaCBjYW4gYmUgYWNjZXB0ZWQgd2l0aCB0aGlzCj4+PiBmZWF0dXJlPyBPciBh
bnkgb3RoZXIgaGVscGZ1bCBpZGVhIHRvIGZpeCB0aGlzIHByb2JsZW0/Cj4+Pgo+Pj4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIEkgaWdub3JlIGFueSBpbmZvcm1hdGlvbiBhYm91dCBpdC4KPj4KPj4g
SSBhZ3JlZSB0aGF0IHRoZSBvbmx5IHByb2JsZW0gYXBwZWFycyB0byBhIHdhc3RlIG9mIG1lbW9y
eSwgcGFydGljdWxhcmx5Cj4gCj4gQ2F2ZWF0IGFib3V0IGlnbm9yYW5jZSBzdGlsbCBhcHBsaWVz
LCBob3cgbXVjaCBvZiBhIHdhc3RlIG9mIG1lbW9yeSBhcmUgd2UgdGFsa2luZz8KPiAKPj4gaWYg
Y2dyb3VwcyBhcmUgZW5hYmxlZC4gSSBkb24ndCBzZWUgYW55IGVhc3kgc29sdXRpb24gZWl0aGVy
LiBNYXliZSBhCj4+IHdhcm5pbmcgaW4gdGhlIEtjb25maWcgdGV4dCB3b3VsZCBiZSBzdWZmaWNp
ZW50Pwo+IAo+IEkgdGhpbmsgdGhhdCBlbnRpcmVseSBkZXBlbmRzIG9uIGhvdyB3YXN0ZWZ1bCBp
dCBpcy4KPiBJZiBpdCdzIG1pbm9yLCBzdXJlPwo+IAoKSSBhbSBhbHNvIG5vdCBzdXJlIGhvdyBt
aW5vciB0aGlzIHdhc3RlIHdpbGwgYmUuIEJ1dCBJIGJlbGlldmUgaXQgd2lsbApiZSBhY2NlcHRh
YmxlLiBCZWNhdXNlIGJlZm9yZSB0aGlzIHBhdGNoc2V0LCB3ZSBhbHNvIHVzZSBvbmx5IDEvMiBv
ZgpIVUdFX01BWF9IU1RBVEUgdmFsdWUgKHdoaWNoIGlzIDIpIHdoZW4gQ09ORklHXzY0QklUIGlz
IGVuYWJsZWQgYW5kCkNPTkZJR19DT05USUdfQUxMT0MgaXMgZGlzYWJsZWQuIEFzIEhVR0VfTUFY
X0hTVEFURSBpcyBhICdtYXgnIHZhbHVlLAppdCBpcyBub3JtYWwgdG8gdXNlIGl0IHVwIG9ubHkg
c29tZXRpbWVzIGJ1dCBub3QgYWx3YXlzLgoKSSBwcmVmZXIgdG8gZG8gYXMgQW5kcmV3IHNhaWQu
IFRvIGFkZCBhbiBub3RpZmljYXRpb24gYWJvdXQgdGhpcyB3YXN0ZQppbiBLQ29uZmlnIHRleHQs
IGFuZCBzdGlsbCB1c2UgdGhlIGltbXV0dXJlIEhVR0VfTUFYX0hTVEFURSB2YWx1ZS4KCkBBbmRy
ZXcgQENvbm9yIHdoYXQgZG8geW91IHRoaW5rIG9mIHRoaXMgZXhwbGFuYXRpb24gYW5kIHRoaXMg
c29sdXRpb24/CgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBpZ25vcmUgYW55dGhpbmcuIFRoYW5r
cyBhIGxvdCEKClJlZ2FyZHMsClFpbmdsaW4uCgo+IFRoYW5rcywKPiBDb25vci4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
