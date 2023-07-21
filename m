Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E4C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AylDhcPgnLmzjSuREoNsxxV5LctQnW6sGdwqtuzIulg=; b=Wy9NvzsJZz3U41
	rBCG5XLmFTOJtfWYHhGMp55y6RR5MqshA5eHCHL227jkDb92Ai7Mg/rNbzTG1n5xRYoTzI3NeWFIa
	z6HBh5bOhPjhSkHhAmsBJEbe0PsLK2/LRnINR/MlO2tEqxxArgQxICL2eLOzAfYJe2Ol38L9gI44A
	OafmCcWrqznzThD8u5VcWDPSRoDKiWKWuNWVToIfLg2M5WGe5U28bxpnTBVNteoL2EsBAjIfqzBYZ
	6Zur6NOpigFdm3OEULnw2h0hjZ2KNbvaFhWqbzq6OCCIaAv8R+tlEXNjo3U0QB2awiImxirZK5t+0
	nYx/TjXVzvwApc+02LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwJD-00F0Cz-23;
	Fri, 21 Jul 2023 20:01:03 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMwJA-00F0Bg-0N
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 20:01:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21221C0002;
	Fri, 21 Jul 2023 20:00:53 +0000 (UTC)
Message-ID: <87bfcd33-9741-4d6c-8b7a-1d1ee2dce61b@ghiti.fr>
Date: Fri, 21 Jul 2023 22:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: mm: Fixup spurious fault of kernel vaddr
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org,
 bjorn@kernel.org, conor.dooley@microchip.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230721145121.1854104-1-guoren@kernel.org>
 <5e5be2d4-c563-6beb-b5f5-df47edeebc83@ghiti.fr>
 <CAJF2gTQMAVUtC6_ftEwp=EeYR_O7yzfGYmxwrqcO6+hn2J32bA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAJF2gTQMAVUtC6_ftEwp=EeYR_O7yzfGYmxwrqcO6+hn2J32bA@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_130100_448946_3E0273C3 
X-CRM114-Status: GOOD (  22.15  )
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

Ck9uIDIxLzA3LzIwMjMgMTg6MDgsIEd1byBSZW4gd3JvdGU6Cj4gT24gRnJpLCBKdWwgMjEsIDIw
MjMgYXQgMTE6MTnigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+
Pgo+PiBPbiAyMS8wNy8yMDIzIDE2OjUxLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPj4+IEZy
b206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4+Cj4+PiBSSVNDLVYgc3Bl
Y2lmaWNhdGlvbiBwZXJtaXRzIHRoZSBjYWNoaW5nIG9mIFBURXMgd2hvc2UgViAoVmFsaWQpCj4+
PiBiaXQgaXMgY2xlYXIuIE9wZXJhdGluZyBzeXN0ZW1zIG11c3QgYmUgd3JpdHRlbiB0byBjb3Bl
IHdpdGggdGhpcwo+Pj4gcG9zc2liaWxpdHksIGJ1dCBpbXBsZW1lbnRlcnMgYXJlIHJlbWluZGVk
IHRoYXQgZWFnZXJseSBjYWNoaW5nCj4+PiBpbnZhbGlkIFBURXMgd2lsbCByZWR1Y2UgcGVyZm9y
bWFuY2UgYnkgY2F1c2luZyBhZGRpdGlvbmFsIHBhZ2UKPj4+IGZhdWx0cy4KPj4+Cj4+PiBTbyB3
ZSBtdXN0IGtlZXAgdm1hbGxvY19mYXVsdCBmb3IgdGhlIHNwdXJpb3VzIHBhZ2UgZmF1bHRzIG9m
IGtlcm5lbAo+Pj4gdmlydHVhbCBhZGRyZXNzIGZyb20gYW4gT29PIG1hY2hpbmUuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+ICAgIGFy
Y2gvcmlzY3YvbW0vZmF1bHQuYyB8IDMgKy0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4gaW5kZXggODUxNjVmZTQzOGQ4
Li5mNjYyYzllYWU3ZDQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPj4+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4gQEAgLTI1OCw4ICsyNTgsNyBAQCB2b2lk
IGhhbmRsZV9wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4gICAgICAgICAqIG9u
bHkgY29weSB0aGUgaW5mb3JtYXRpb24gZnJvbSB0aGUgbWFzdGVyIHBhZ2UgdGFibGUsCj4+PiAg
ICAgICAgICogbm90aGluZyBtb3JlLgo+Pj4gICAgICAgICAqLwo+Pj4gLSAgICAgaWYgKCghSVNf
RU5BQkxFRChDT05GSUdfTU1VKSB8fCAhSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKSAmJgo+Pj4g
LSAgICAgICAgIHVubGlrZWx5KGFkZHIgPj0gVk1BTExPQ19TVEFSVCAmJiBhZGRyIDwgVk1BTExP
Q19FTkQpKSB7Cj4+PiArICAgICBpZiAodW5saWtlbHkoYWRkciA+PSBUQVNLX1NJWkUpKSB7Cj4+
PiAgICAgICAgICAgICAgICB2bWFsbG9jX2ZhdWx0KHJlZ3MsIGNvZGUsIGFkZHIpOwo+Pj4gICAg
ICAgICAgICAgICAgcmV0dXJuOwo+Pj4gICAgICAgIH0KPj4KPj4gQ2FuIHlvdSBzaGFyZSB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGZpeCBoZXJlPwo+IFdlIG1ldCBhIHNwdXJpb3VzIHBhZ2UgZmF1
bHQgcGFuaWMgb24gYW4gT29PIG1hY2hpbmUuCj4KPiAxLiBUaGUgcHJvY2Vzc29yIHNwZWN1bGF0
aXZlIGV4ZWN1dGlvbiBicmluZ3MgdGhlIFY9MCBlbnRyaWVzIGludG8gdGhlCj4gVExCIGluIHRo
ZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzLgo+IDIuIExpbnV4IGtlcm5lbCBpbnN0YWxscyB0aGUg
a2VybmVsIHZpcnR1YWwgYWRkcmVzcyB3aXRoIHRoZSBwYWdlLCBhbmQgVj0xCj4gMy4gV2hlbiBr
ZXJuZWwgY29kZSBhY2Nlc3MgdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MsIGl0IHdvdWxkIHJh
aXNlCj4gYSBwYWdlIGZhdWx0IGFzIHRoZSBWPTAgZW50cnkgaW4gdGhlIHRsYi4KPiA0LiBObyB2
bWFsbG9jX2ZhdWx0LCB0aGVuIHBhbmljLgo+Cj4+IEkgaGF2ZSBhIGZpeCAodGhhdCdzIGN1cnJl
bnRseSBydW5uaW5nIG91ciBDSSkgZm9yIGNvbW1pdCA3ZDMzMzJiZTAxMWUKPj4gKCJyaXNjdjog
bW06IFByZS1hbGxvY2F0ZSBQR0QgZW50cmllcyBmb3Igdm1hbGxvYy9tb2R1bGVzIGFyZWEiKSB0
aGF0Cj4+IGltcGxlbWVudHMgZmx1c2hfY2FjaGVfdm1hcCgpIHNpbmNlIHdlIGxvc3QgdGhlIHZt
YWxsb2NfZmF1bHQuCj4gQ291bGQgeW91IHNoYXJlIHRoYXQgcGF0Y2g/CgoKSGVyZSB3ZSBnbzoK
CgpBdXRob3I6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KRGF0ZTrC
oMKgIEZyaSBKdWwgMjEgMDg6NDM6NDQgMjAyMyArMDAwMAoKIMKgwqDCoCByaXNjdjogSW1wbGVt
ZW50IGZsdXNoX2NhY2hlX3ZtYXAoKQoKIMKgwqDCoCBUaGUgUklTQy1WIGtlcm5lbCBuZWVkcyBh
IHNmZW5jZS52bWEgYWZ0ZXIgYSBwYWdlIHRhYmxlIAptb2RpZmljYXRpb246IHdlCiDCoMKgwqAg
dXNlZCB0byByZWx5IG9uIHRoZSB2bWFsbG9jIGZhdWx0IGhhbmRsaW5nIHRvIGVtaXQgYW4gc2Zl
bmNlLnZtYSwgYnV0CiDCoMKgwqAgY29tbWl0IDdkMzMzMmJlMDExZSAoInJpc2N2OiBtbTogUHJl
LWFsbG9jYXRlIFBHRCBlbnRyaWVzIGZvcgogwqDCoMKgIHZtYWxsb2MvbW9kdWxlcyBhcmVhIikg
Z290IHJpZCBvZiB0aGlzIHBhdGggZm9yIDY0LWJpdCBrZXJuZWxzLCBzbyAKbm93IHdlCiDCoMKg
wqAgbmVlZCB0byBleHBsaWNpdGx5IGVtaXQgYSBzZmVuY2Uudm1hIGluIGZsdXNoX2NhY2hlX3Zt
YXAoKS4KCiDCoMKgwqAgTm90ZSB0aGF0IHdlIGRvbid0IG5lZWQgdG8gaW1wbGVtZW50IGZsdXNo
X2NhY2hlX3Z1bm1hcCgpIGFzIHRoZSAKZ2VuZXJpYwogwqDCoMKgIGNvZGUgc2hvdWxkIGVtaXQg
YSBmbHVzaCB0bGIgYWZ0ZXIgdW5tYXBwaW5nIGEgdm1hbGxvYyByZWdpb24uCgogwqDCoMKgIEZp
eGVzOiA3ZDMzMzJiZTAxMWUgKCJyaXNjdjogbW06IFByZS1hbGxvY2F0ZSBQR0QgZW50cmllcyBm
b3IgCnZtYWxsb2MvbW9kdWxlcyBhcmVhIikKIMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggCmIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmgKaW5kZXggODA5MWI4YmY0ODgzLi5iOTNmZmRkZjhhNjEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY2FjaGVmbHVzaC5oCkBAIC0zNyw2ICszNywxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
Zmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiDCoCNkZWZpbmUgZmx1c2hfaWNh
Y2hlX3VzZXJfcGFnZSh2bWEsIHBnLCBhZGRyLCBsZW4pIFwKIMKgwqDCoMKgwqDCoMKgIGZsdXNo
X2ljYWNoZV9tbSh2bWEtPnZtX21tLCAwKQoKKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNkZWZpbmUg
Zmx1c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKSBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0
LCBlbmQpCisjZW5kaWYKKwogwqAjaWZuZGVmIENPTkZJR19TTVAKCiDCoCNkZWZpbmUgZmx1c2hf
aWNhY2hlX2FsbCgpIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKQoKCkxldCBtZSBrbm93IGlmIHRo
YXQgd29ya3MgZm9yIHlvdSEKCgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
