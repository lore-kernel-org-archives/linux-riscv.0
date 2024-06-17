Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50511C2BA15
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNxFe96CHgDGMdz/xMc0R/djanqArnr+81NwBjEmG5Y=; b=vro0N0CepS4uFZ
	243CW9keVl5yrhGLI2/1xepxiwTgIDz4QNiNEaoH0GQTaKtDue5/Trkt0s70FJDFFq7Nka2j8CY+1
	easBADce4BCWND2NNicI39tEB+XgRfDCOS0EEMwmAUp2xfDDY7JG6xYmtAtnICKCXJiG1RnGMFat5
	LgwzoroDATQmsiImXGKdxXUVvWUXbjw4X07M5D9/5UkFf7w5VWC7OQnTf+kpuhv7Bn/6u7GfVMAPZ
	rEdXJ3bMPojI4LPMIZJkRKPJnWA2Y01/rG5zxzj8cooAKbWzR2fi1mPhPZjamwK70QLIFHE/+9Gmd
	TlKsqZe7prrJiLViNQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCKK-0000000ApAe-2CTq;
	Mon, 17 Jun 2024 13:23:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCKG-0000000Ap7g-3Ks2
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:23:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1BD2000B;
	Mon, 17 Jun 2024 13:23:04 +0000 (UTC)
Message-ID: <a396c024-f1a8-4636-85ee-e36950a2dca0@ghiti.fr>
Date: Mon, 17 Jun 2024 15:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix early ftrace nop patching
To: Conor Dooley <conor.dooley@microchip.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrea Parri <parri.andrea@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20240523115134.70380-1-alexghiti@rivosinc.com>
 <20240613-lubricant-breath-061192a9489a@wendy>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240613-lubricant-breath-061192a9489a@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_062312_990344_758D67D4 
X-CRM114-Status: GOOD (  17.25  )
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

SGkgQ29ub3IsCgpTb3JyeSBmb3IgdGhlIGRlbGF5IGhlcmUuCgpPbiAxMy8wNi8yMDI0IDA5OjQ4
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMDE6NTE6MzRQ
TSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBDb21taXQgYzk3YmY2Mjk5NjNlICgi
cmlzY3Y6IEZpeCB0ZXh0IHBhdGNoaW5nIHdoZW4gSVBJIGFyZSB1c2VkIikKPj4gY29udmVydGVk
IGZ0cmFjZV9tYWtlX25vcCgpIHRvIHVzZSBwYXRjaF9pbnNuX3dyaXRlKCkgd2hpY2ggZG9lcyBu
b3QKPj4gZW1pdCBhbnkgaWNhY2hlIGZsdXNoIHJlbHlpbmcgZW50aXJlbHkgb24gX19mdHJhY2Vf
bW9kaWZ5X2NvZGUoKSB0byBkbwo+PiB0aGF0Lgo+Pgo+PiBCdXQgd2UgbWlzc2VkIHRoYXQgZnRy
YWNlX21ha2Vfbm9wKCkgd2FzIGNhbGxlZCB2ZXJ5IGVhcmx5IGRpcmVjdGx5IHdoZW4KPj4gY29u
dmVydGluZyBtY291bnQgY2FsbHMgaW50byBub3BzIChhY3R1YWxseSBvbiByaXNjdiBpdCBjb252
ZXJ0cyAyQiBub3BzCj4+IGVtaXR0ZWQgYnkgdGhlIGNvbXBpbGVyIGludG8gNEIgbm9wcykuCj4+
Cj4+IFRoaXMgY2F1c2VkIGNyYXNoZXMgb24gbXVsdGlwbGUgSFcgYXMgcmVwb3J0ZWQgYnkgQ29u
b3IgYW5kIEJqw7ZybiBzaW5jZQo+PiB0aGUgYm9vdGluZyBjb3JlIGNvdWxkIGhhdmUgaGFsZi1w
YXRjaGVkIGluc3RydWN0aW9ucyBpbiBpdHMgaWNhY2hlCj4+IHdoaWNoIHdvdWxkIHRyaWdnZXIg
YW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwOiBmaXggdGhpcyBieSBlbWl0dGluZyBhCj4+IGxv
Y2FsIGZsdXNoIGljYWNoZSB3aGVuIGVhcmx5IHBhdGNoaW5nIG5vcHMuCj4+Cj4+IEZpeGVzOiBj
OTdiZjYyOTk2M2UgKCJyaXNjdjogRml4IHRleHQgcGF0Y2hpbmcgd2hlbiBJUEkgYXJlIHVzZWQi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+Cj4+IC0tLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgNiAr
KysrKysKPj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyAgICAgICAgICB8IDMgKysrCj4+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmgKPj4gaW5kZXggZGQ4ZDA3MTQ2MTE2Li5jZTc5YzU1OGE0YzggMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4+IEBAIC0xMyw2ICsxMywxMiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCh2b2lkKQo+PiAgIAlhc20g
dm9sYXRpbGUgKCJmZW5jZS5pIiA6OjogIm1lbW9yeSIpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF9pY2FjaGVfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFy
dCwKPj4gKwkJCQkJICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+PiArewo+PiArCWxvY2FsX2ZsdXNo
X2ljYWNoZV9hbGwoKTsKPj4gK30KPj4gKwo+PiAgICNkZWZpbmUgUEdfZGNhY2hlX2NsZWFuIFBH
X2FyY2hfMQo+PiAgIAo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfZm9saW8o
c3RydWN0IGZvbGlvICpmb2xpbykKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0
cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKPj4gaW5kZXggNGY0OTg3YTZkODNk
Li4zMmU3YzQwMWRmYjQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4+IEBAIC0xMjAsNiArMTIwLDkg
QEAgaW50IGZ0cmFjZV9pbml0X25vcChzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBkeW5fZnRy
YWNlICpyZWMpCj4+ICAgCW91dCA9IGZ0cmFjZV9tYWtlX25vcChtb2QsIHJlYywgTUNPVU5UX0FE
RFIpOwo+PiAgIAltdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+IFNvLCB0dXJucyBvdXQgdGhh
dCB0aGlzIHBhdGNoIGlzIG5vdCBzdWZmaWNpZW50LiBJJ3ZlIHNlZW4gc29tZSBtb3JlCj4gY3Jh
c2hlcywgc2VlbWluZ2x5IGR1ZSB0byBpbml0aWFsaXNpbmcgbm9wcyBvbiB0aGlzIG11dGV4X3Vu
bG9jaygpLgo+IFBhbG1lciBzdWdnZXN0ZWQgbW92aW5nIHRoZSBpZiAoIW1vZCkgLi4uIGludG8g
dGhlIGxvY2ssIHdoaWNoIGZpeGVkCj4gdGhlIHByb2JsZW0gZm9yIG1lLgoKCk9rLCBpdCBtYWtl
cyBzZW5zZSwgSSBjb21wbGV0ZWx5IG1pc3NlZCB0aGF0LiBJJ2xsIHNlbmQgYSBmaXggZm9yIHRo
YXQgCnNob3J0bHkgc28gdGhhdCBpdCBjYW4gYmUgbWVyZ2VkIGluIHJjNS4KClRoYW5rcywKCkFs
ZXgKCgo+Cj4+ICAgCj4+ICsJaWYgKCFtb2QpCj4+ICsJCWxvY2FsX2ZsdXNoX2ljYWNoZV9yYW5n
ZShyZWMtPmlwLCByZWMtPmlwICsgTUNPVU5UX0lOU05fU0laRSk7Cj4+ICsKPj4gICAJcmV0dXJu
IG91dDsKPj4gICB9Cj4+ICAgCj4+IC0tIAo+PiAyLjM5LjIKPj4KPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
