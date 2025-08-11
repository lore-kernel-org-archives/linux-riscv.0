Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62266C87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2PCM3YfaQGFShfQxu4sWaxnFN7EOYMjbOka9VGVS40=; b=GYTS/MvCsn7rVN
	3/nn8KdAJQWBOo7il1oTWPvzJZBofbAbuLivZ5p91cunO0vm8b8g1iy2vwpXm4mcRnyY3VLuxc/pk
	zNLnXti5+laKOKhxsRCFG/q1oNWLIZgyxOpLoh7vTQMdbIcIuBGVwyfWEhVk47aXiQ3TdZ9zNnVo7
	nRASRZmzwWVdJMaVI1KZPikHcnry7Ldizz6VgXybHI4wmxCH522RZjnc2cuCuYrSfOCu3tVsckugB
	o9BRTNYozWdUp+OTp/rHucXq66+hgrvzeLZMmfwO5Vz56rjQxnMqyS9UyiYe8BgRPuDhX1RO35qac
	1HtS3ZZEj0X+ogaUNgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLTE-00000006XMv-3Ftv;
	Mon, 11 Aug 2025 05:53:20 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLQb-00000006X7t-0EYj;
	Mon, 11 Aug 2025 05:50:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c0k2w2kRcz9sSL;
	Mon, 11 Aug 2025 07:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Mxf0H61E1tl; Mon, 11 Aug 2025 07:39:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c0k2w1bMnz9sSK;
	Mon, 11 Aug 2025 07:39:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 199008B764;
	Mon, 11 Aug 2025 07:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bIxmuQ19phXS; Mon, 11 Aug 2025 07:39:03 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAC418B763;
	Mon, 11 Aug 2025 07:39:03 +0200 (CEST)
Message-ID: <b8345cfe-0bde-44cd-b9b7-9a946ff8fc36@csgroup.eu>
Date: Mon, 11 Aug 2025 07:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] kasan: call kasan_init_generic in kasan_init
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 bhe@redhat.com, hca@linux.ibm.com, andreyknvl@gmail.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 davidgow@google.com, glider@google.com, dvyukov@google.com,
 alexghiti@rivosinc.com
Cc: alex@ghiti.fr, agordeev@linux.ibm.com, vincenzo.frascino@arm.com,
 elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250810125746.1105476-1-snovitoll@gmail.com>
 <20250810125746.1105476-3-snovitoll@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250810125746.1105476-3-snovitoll@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_225037_263387_25EDC1F1 
X-CRM114-Status: GOOD (  15.18  )
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

CgpMZSAxMC8wOC8yMDI1IMOgIDE0OjU3LCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiBhIMOpY3JpdMKg
Ogo+IENhbGwga2FzYW5faW5pdF9nZW5lcmljKCkgd2hpY2ggaGFuZGxlcyBHZW5lcmljIEtBU0FO
IGluaXRpYWxpemF0aW9uLgo+IEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90IHNlbGVjdCBB
UkNIX0RFRkVSX0tBU0FOLAo+IHRoaXMgd2lsbCBiZSBhIG5vLW9wIGZvciB0aGUgcnVudGltZSBm
bGFnIGJ1dCB3aWxsCj4gcHJpbnQgdGhlIGluaXRpYWxpemF0aW9uIGJhbm5lci4KPiAKPiBGb3Ig
U1dfVEFHUyBhbmQgSFdfVEFHUyBtb2RlcywgdGhlaXIgcmVzcGVjdGl2ZSBpbml0IGZ1bmN0aW9u
cyB3aWxsCj4gaGFuZGxlIHRoZSBmbGFnIGVuYWJsaW5nLCBpZiB0aGV5IGFyZSBlbmFibGVkL2lt
cGxlbWVudGVkLgo+IAo+IENsb3NlczogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3df
YnVnLmNnaT9pZD0yMTcwNDkKPiBTaWduZWQtb2ZmLWJ5OiBTYWJ5cnpoYW4gVGFzYm9sYXRvdiA8
c25vdml0b2xsQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gIyByaXNjdgo+IEFja2VkLWJ5OiBBbGV4YW5kZXIgR29yZGVldiA8
YWdvcmRlZXZAbGludXguaWJtLmNvbT4gIyBzMzkwCgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgoKPiAtLS0KPiBDaGFuZ2VzIGluIHY2
Ogo+IC0gQ2FsbCBrYXNhbl9pbml0X2dlbmVyaWMoKSBpbiBhcmNoL3Jpc2N2IF9hZnRlcl8gbG9j
YWxfZmx1c2hfdGxiX2FsbCgpCj4gLS0tCj4gICBhcmNoL2FybS9tbS9rYXNhbl9pbml0LmMgICAg
fCAyICstCj4gICBhcmNoL2FybTY0L21tL2thc2FuX2luaXQuYyAgfCA0ICstLS0KPiAgIGFyY2gv
cmlzY3YvbW0va2FzYW5faW5pdC5jICB8IDEgKwo+ICAgYXJjaC9zMzkwL2tlcm5lbC9lYXJseS5j
ICAgIHwgMyArKy0KPiAgIGFyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYyB8IDIgKy0KPiAgIGFy
Y2gveHRlbnNhL21tL2thc2FuX2luaXQuYyB8IDIgKy0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9t
bS9rYXNhbl9pbml0LmMgYi9hcmNoL2FybS9tbS9rYXNhbl9pbml0LmMKPiBpbmRleCAxMTFkNGY3
MDMxMzYuLmM2NjI1ZTgwOGJmOCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tbS9rYXNhbl9pbml0
LmMKPiArKysgYi9hcmNoL2FybS9tbS9rYXNhbl9pbml0LmMKPiBAQCAtMzAwLDYgKzMwMCw2IEBA
IHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPiAgIAlsb2NhbF9mbHVzaF90bGJfYWxsKCk7
Cj4gICAKPiAgIAltZW1zZXQoa2FzYW5fZWFybHlfc2hhZG93X3BhZ2UsIDAsIFBBR0VfU0laRSk7
Cj4gLQlwcl9pbmZvKCJLZXJuZWwgYWRkcmVzcyBzYW5pdGl6ZXIgaW5pdGlhbGl6ZWRcbiIpOwo+
ICAgCWluaXRfdGFzay5rYXNhbl9kZXB0aCA9IDA7Cj4gKwlrYXNhbl9pbml0X2dlbmVyaWMoKTsK
PiAgIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMgYi9hcmNoL2Fy
bTY0L21tL2thc2FuX2luaXQuYwo+IGluZGV4IGQ1NDFjZTQ1ZGFlYi4uYWJlYjgxYmY2ZWJkIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jCj4gKysrIGIvYXJjaC9hcm02
NC9tbS9rYXNhbl9pbml0LmMKPiBAQCAtMzk5LDE0ICszOTksMTIgQEAgdm9pZCBfX2luaXQga2Fz
YW5faW5pdCh2b2lkKQo+ICAgewo+ICAgCWthc2FuX2luaXRfc2hhZG93KCk7Cj4gICAJa2FzYW5f
aW5pdF9kZXB0aCgpOwo+IC0jaWYgZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJQykKPiArCWth
c2FuX2luaXRfZ2VuZXJpYygpOwo+ICAgCS8qCj4gICAJICogR2VuZXJpYyBLQVNBTiBpcyBub3cg
ZnVsbHkgaW5pdGlhbGl6ZWQuCj4gICAJICogU29mdHdhcmUgYW5kIEhhcmR3YXJlIFRhZy1CYXNl
ZCBtb2RlcyBzdGlsbCByZXF1aXJlCj4gICAJICoga2FzYW5faW5pdF9zd190YWdzKCkgYW5kIGth
c2FuX2luaXRfaHdfdGFncygpIGNvcnJlc3BvbmRpbmdseS4KPiAgIAkgKi8KPiAtCXByX2luZm8o
Iktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5pdGlhbGl6ZWQgKGdlbmVyaWMpXG4iKTsKPiAtI2Vu
ZGlmCj4gICB9Cj4gICAKPiAgICNlbmRpZiAvKiBDT05GSUdfS0FTQU5fR0VORVJJQyB8fCBDT05G
SUdfS0FTQU5fU1dfVEFHUyAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2thc2FuX2lu
aXQuYyBiL2FyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jCj4gaW5kZXggNDFjNjM1ZDZhY2E0Li5j
NGEyYTllNTU4NmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmMKPiAr
KysgYi9hcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYwo+IEBAIC01MzMsNCArNTMzLDUgQEAgdm9p
ZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgCj4gICAJY3NyX3dyaXRlKENTUl9TQVRQLCBQ
Rk5fRE9XTihfX3BhKHN3YXBwZXJfcGdfZGlyKSkgfCBzYXRwX21vZGUpOwo+ICAgCWxvY2FsX2Zs
dXNoX3RsYl9hbGwoKTsKPiArCWthc2FuX2luaXRfZ2VuZXJpYygpOwo+ICAgfQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3MzOTAva2VybmVsL2Vhcmx5LmMgYi9hcmNoL3MzOTAva2VybmVsL2Vhcmx5LmMK
PiBpbmRleCA5YWRmYmRkMzc3ZGMuLjU0NGU1NDAzZGQ5MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Mz
OTAva2VybmVsL2Vhcmx5LmMKPiArKysgYi9hcmNoL3MzOTAva2VybmVsL2Vhcmx5LmMKPiBAQCAt
MjEsNiArMjEsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAgI2luY2x1ZGUg
PGFzbS9hc20tZXh0YWJsZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9rYXNhbi5oPgo+ICAgI2luY2x1ZGUgPGFzbS9hY2Nlc3MtcmVncy5oPgo+
ICAgI2luY2x1ZGUgPGFzbS9hc20tb2Zmc2V0cy5oPgo+ICAgI2luY2x1ZGUgPGFzbS9tYWNoaW5l
Lmg+Cj4gQEAgLTY1LDcgKzY2LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGthc2FuX2Vhcmx5X2lu
aXQodm9pZCkKPiAgIHsKPiAgICNpZmRlZiBDT05GSUdfS0FTQU4KPiAgIAlpbml0X3Rhc2sua2Fz
YW5fZGVwdGggPSAwOwo+IC0JcHJfaW5mbygiS2VybmVsQWRkcmVzc1Nhbml0aXplciBpbml0aWFs
aXplZFxuIik7Cj4gKwlrYXNhbl9pbml0X2dlbmVyaWMoKTsKPiAgICNlbmRpZgo+ICAgfQo+ICAg
Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYyBiL2FyY2gveDg2L21t
L2thc2FuX2luaXRfNjQuYwo+IGluZGV4IDA1MzllZmQwZDIxNi4uOTk4YjYwMTBkNmQzIDEwMDY0
NAo+IC0tLSBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+ICsrKyBiL2FyY2gveDg2L21t
L2thc2FuX2luaXRfNjQuYwo+IEBAIC00NTEsNSArNDUxLDUgQEAgdm9pZCBfX2luaXQga2FzYW5f
aW5pdCh2b2lkKQo+ICAgCV9fZmx1c2hfdGxiX2FsbCgpOwo+ICAgCj4gICAJaW5pdF90YXNrLmth
c2FuX2RlcHRoID0gMDsKPiAtCXByX2luZm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5pdGlh
bGl6ZWRcbiIpOwo+ICsJa2FzYW5faW5pdF9nZW5lcmljKCk7Cj4gICB9Cj4gZGlmZiAtLWdpdCBh
L2FyY2gveHRlbnNhL21tL2thc2FuX2luaXQuYyBiL2FyY2gveHRlbnNhL21tL2thc2FuX2luaXQu
Ywo+IGluZGV4IGYzOWM0ZDgzMTczYS4uMDUyNGI5ZWQ1ZTYzIDEwMDY0NAo+IC0tLSBhL2FyY2gv
eHRlbnNhL21tL2thc2FuX2luaXQuYwo+ICsrKyBiL2FyY2gveHRlbnNhL21tL2thc2FuX2luaXQu
Ywo+IEBAIC05NCw1ICs5NCw1IEBAIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPiAgIAo+
ICAgCS8qIEF0IHRoaXMgcG9pbnQga2FzYW4gaXMgZnVsbHkgaW5pdGlhbGl6ZWQuIEVuYWJsZSBl
cnJvciBtZXNzYWdlcy4gKi8KPiAgIAljdXJyZW50LT5rYXNhbl9kZXB0aCA9IDA7Cj4gLQlwcl9p
bmZvKCJLZXJuZWxBZGRyZXNzU2FuaXRpemVyIGluaXRpYWxpemVkXG4iKTsKPiArCWthc2FuX2lu
aXRfZ2VuZXJpYygpOwo+ICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
