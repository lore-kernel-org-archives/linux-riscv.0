Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020B1061B2D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 03:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSxIaNIPrB7lyaJ0pZ43SByBJwz32k9+A5eiHGFp25Y=; b=ligQfykUC/0UZj
	0veDwey+kxpb6p/9JeXPeve212fBOkNCstRVog2n86V3v50KWhv4qxTQaDAIDhUjsMyZYRFt5j7/u
	4bFs52G7D9KA6hjhA0LuLpc15gwZLikRVgQz6eqV2pER3ljZtR02qRS37BD5VHBCkTlTejGcTC40h
	wlXZQq5KHH6HG3ettU20NihhzotY5LzPtGTs3Ae3O4CCdssAHSJBKHcCWd1lmNtXRGv55U9epbxtL
	o542kD6M1MEfwhxnhoGZTzoaPl+ayKDAt9G0E6QfS6QTuYPyAvjmgjq9LFMQ4SGkGQb6ZZnYxUeHV
	fRBsO4TInmG0wn3IGtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Pe0-0000000CDxM-1m1z;
	Tue, 31 Mar 2026 03:19:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Pdw-0000000CDwI-3DdH
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 03:19:55 +0000
Received: from [192.168.0.104] (unknown [123.118.218.47])
	by APP-03 (Coremail) with SMTP id rQCowACXstlPPctph81iDA--.55901S2;
	Tue, 31 Mar 2026 11:19:44 +0800 (CST)
Message-ID: <b9fd95f4-91d2-4af5-9239-6fca2ce77892@iscas.ac.cn>
Date: Tue, 31 Mar 2026 11:19:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: misaligned: Make enabling delegation depend on
 BROKEN
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Songsong Zhang <U2FsdGVkX1@gmail.com>
References: <20260330-riscv-misaligned-dont-delegate-v1-1-68b089b306c3@iscas.ac.cn>
 <20260330-sensation-pronounce-98f8b14836ed@spud>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260330-sensation-pronounce-98f8b14836ed@spud>
X-CM-TRANSID: rQCowACXstlPPctph81iDA--.55901S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1UAry7WF43trW3CryrCrg_yoW5Wr1Upa
	yUGF4DKry5trnrZr4Sg3yIgF45X395GryrGrsxt34Fvr98Zry7uF92qrWUua4DCr1vv340
	vryrW3Wj9a45Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [123.118.218.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_201953_172710_D05A7706 
X-CRM114-Status: GOOD (  17.26  )
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

T24gMy8zMC8yNiAyMDo1OSwgQ29ub3IgRG9vbGV5IHdyb3RlOgoKPiBPbiBNb24sIE1hciAzMCwg
MjAyNiBhdCAwMjo0NzoxNVBNICswODAwLCBWaXZpYW4gV2FuZyB3cm90ZToKPj4gVGhlIHVuYWxp
Z25lZCBhY2Nlc3MgZW11bGF0aW9uIGNvZGUgaW4gTGludXggaGFzIHZhcmlvdXMgZGVmaWNpZW5j
aWVzLgo+PiBGb3IgZXhhbXBsZSwgaXQgZG9lc24ndCBlbXVsYXRlIHZlY3RvciBpbnN0cnVjdGlv
bnMgWzFdLCBhbmQgZG9lc24ndAo+PiBlbXVsYXRlIEtWTSBndWVzdCBhY2Nlc3Nlcy4gVGhlcmVm
b3JlLCByZXF1ZXN0aW5nIG1pc2FsaWduZWQgZXhjZXB0aW9uCj4+IGRlbGVnYXRpb24gd2l0aCBT
QkkgRldGVCBhY3R1YWxseSByZWdyZXNzZXMgdXNlcnNwYWNlIGFuZCBLVk0gZ3Vlc3QKPj4gYmVo
YXZpb3IuIFVudGlsIExpbnV4IGNhbiBoYW5kbGUgaXQgcHJvcGVybHksIGd1YXJkIHRoZXNlIHNi
aV9md2Z0X3NldCgpCj4+IGNhbGxzIGJlaGluZCBSSVNDVl9TQklfRldGVF9ERUxFR0FURV9NSVNB
TElHTkVELCB3aGljaCBpbiB0dXJuIGRlcGVuZHMKPj4gb24gQlJPS0VOLgo+Pgo+PiBUaGUgcmVz
dCBvZiB0aGUgZXhpc3RpbmcgY29kZSBwcm9jZWVkcyBhcyBiZWZvcmUsIGV4Y2VwdCBhcyBpZgo+
PiBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRyBpcyBub3QgYXZhaWxhYmxlLCB0byBoYW5k
bGUgYW55IHJlbWFpbmluZwo+PiBhZGRyZXNzIG1pc2FsaWduZWQgZXhjZXB0aW9ucyBvbiBhIGJl
c3QtZWZmb3J0IGJhc2lzLiBUaGUgS1ZNIFNCSSBGV0ZUCj4+IGltcGxlbWVudGF0aW9uIGlzIGFs
c28gbm90IHRvdWNoZWQsIGJ1dCBpdCBpcyBkaXNhYmxlZCBpZiB0aGUgZmlybXdhcmUKPj4gZW11
bGF0ZXMgdW5hbGlnbmVkIGFjY2Vzc2VzLgo+Pgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+PiBGaXhlczogY2Y1YThhYmM2NTYwICgicmlzY3Y6IG1pc2FsaWduZWQ6IHJlcXVlc3QgbWlz
YWxpZ25lZCBleGNlcHRpb24gZnJvbSBTQkkiKQo+PiBSZXBvcnRlZC1ieTogU29uZ3NvbmcgWmhh
bmcgPFUyRnNkR1ZrWDFAZ21haWwuY29tPiAjIEtWTQo+PiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8zOGNlNDRjMS0wOGNmLTRlM2YtOGFkZS0yMGRhMjI0ZjUyOWNA
aXNjYXMuYWMuY24vIFsxXQo+PiBTaWduZWQtb2ZmLWJ5OiBWaXZpYW4gV2FuZyA8d2FuZ3J1aWth
bmdAaXNjYXMuYWMuY24+Cj4+IC0tLQo+PiBDbMOpbWVudDogU29ycnkgdG8gY2FsbCB3aGF0IHlv
dSBkaWQgYnJva2VuLCBidXQgaXQgcmVhbGx5IGlzIGJyZWFraW5nCj4+IG9uIHJlYWwgaGFyZHdh
cmUgb3V0IHRoZXJlLiBJIHRoaW5rIHRoaXMgaXMgdGhlIHJpZ2h0IHdheSBmb3Igbm93Lgo+PiAt
LS0KPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysr
KysrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAgMiArLQo+
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4g
aW5kZXggOTBjNTMxZTZhYmY1Li44YWQxZjEzYzE3MGUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTk0MSw2ICs5NDEs
MjAgQEAgY29uZmlnIFJJU0NWX1ZFQ1RPUl9NSVNBTElHTkVECj4+ICAJaGVscAo+PiAgCSAgRW5h
YmxlIGRldGVjdGluZyBzdXBwb3J0IGZvciB2ZWN0b3IgbWlzYWxpZ25lZCBsb2FkcyBhbmQgc3Rv
cmVzLgo+PiAgCj4+ICtjb25maWcgUklTQ1ZfU0JJX0ZXRlRfREVMRUdBVEVfTUlTQUxJR05FRAo+
PiArCWJvb2wgIlJlcXVlc3QgZmlybXdhcmUgZGVsZWdhdGlvbiBvZiB1bmFsaWduZWQgYWNjZXNz
IGV4Y2VwdGlvbnMiCj4+ICsJZGVwZW5kcyBvbiBSSVNDVl9TQkkKPj4gKwlkZXBlbmRzIG9uIEJS
T0tFTgo+IE1ha2luZyBpdCBoYXJkIHRvIGVuYWJsZSBJIHRoaW5rIG1ha2VzIGEgbG90IG9mIHNl
bnNlLCBnaXZlbiB0aGUgaXNzdWVzCj4geW91J3JlIHJlcG9ydGluZyBidXQgSSB0YWNraW5nIG9u
IEJST0tFTiB3aWxsIHJlbW92ZSBlZmZlY3RpdmVseSBhbGwKPiBidWlsZCBjb3ZlcmFnZSBvZiBp
dCogYW5kIHdpbGwgZGVmaW5pdGVseSBzdG9wIGFsbW9zdCBhbnlvbmUgdXNpbmcgaXQuCj4gU2hv
dWxkIGl0IGJlIGp1c3QgbWFkZSBOT05QT1JUQUJMRSB3aXRoIHRoZSB0ZXh0IGFib3V0IGJlaW5n
IGluY29tcGxldGUKPiBleHBhbmRlZCBhIHdlZSBiaXQgdG8gc2F5IHdoYXQgaXMgYnJva2VuIHNv
IHRoYXQgcGVvcGxlIGNhbiBtYWtlIGEKPiBkZWNpc2lvbj8KCkhhdmluZyB0aG91Z2h0IGFib3V0
IGl0IG1vcmUsIEkgdGhpbmsgTk9OUE9SVEFCTEUgZG9lcyBtYWtlIHNlbnNlLiBUaGVyZQppcyBz
dGlsbCBhIG5vdGljaWJsZSBhbW91bnQgb2Ygb2xkZXIgbm9uLUggYW5kIG5vbi1SVlYgaGFyZHdh
cmUgb3V0CnRoZXJlIHRoYXQgcmVtYWluIHF1aXRlIHBvcHVsYXIsIGFuZCBvbiB0aGVzZSBtYWNo
aW5lcyB0aGlzIHdpbGwgd29yawpmaW5lLCBhbnkgZnVydGhlciBidWdzIG5vdHdpdGhzdGFuZGlu
Zy4KCkknbGwgY2hhbmdlIGl0IHRvIE5PTlBPUlRBQkxFIGluIHYyLCBhbmQsIGFzIHlvdSBzYWlk
LCBleHBhbmQgb24ga25vd24KaXNzdWVzLgoKVGhhbmtzLApWaXZpYW4gImRyYW1mb3JldmVyIiBX
YW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
