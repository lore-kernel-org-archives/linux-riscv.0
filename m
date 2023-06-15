Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F32EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DuwjfrKxFVXs4K09+P5v33C9iZ/cGsSDW/1jyp+vlM=; b=fB0SEk/oHBPJOm
	E7Ar1dwWR/LarPcY/cprnp4EN0e5GezEBnCc/SK/n6urGm/0tKwvr++UOH+IuvefQ/9N0OXRz38T7
	wRt3whk0GXpUN9njxgfIH4WvaGSL32nEFkckA/4oo0fCSS7l28IHOWON4dbSSx19EDM65CXA748LY
	sLpPbDwpxcQup91oTtRXITxSA0GnNhiS31NQEhbuFu5id/R+a32LUb1XLHssPzxMtzxKH1qvVUu5M
	WVuhKW7Fq9xzYE8F4yNNRj/cDKDQL5WDXqOis7qsxJEKHT94T+dmGtnAcQuDF/8+9udPuHZ2xOGXu
	Yrfz3DBLDg5GBnp19s5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hE8-00DyEq-16;
	Thu, 15 Jun 2023 07:17:04 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hE4-00DyDL-2S;
	Thu, 15 Jun 2023 07:17:02 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81EB640003;
	Thu, 15 Jun 2023 07:16:51 +0000 (UTC)
Message-ID: <25c378d3-8914-4f24-8ea9-0e2204c90727@ghiti.fr>
Date: Thu, 15 Jun 2023 09:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/10] riscv: Make legacy counter enum match the HW
 numbering
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-4-alexghiti@rivosinc.com>
 <20230531-ddb2d631e152526102f41d5e@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-ddb2d631e152526102f41d5e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_001701_092244_53F4DF24 
X-CRM114-Status: GOOD (  21.08  )
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

T24gMzEvMDUvMjAyMyAxNjowMSwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+IE9uIEZyaSwgTWF5IDEy
LCAyMDIzIGF0IDEwOjUzOjE0QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gUklT
Q1ZfUE1VX0xFR0FDWV9JTlNUUkVUIHVzZWQgdG8gYmUgc2V0IHRvIDEgd2hlcmVhcyB0aGUgb2Zm
c2V0IG9mIHRoaXMKPj4gaGFyZHdhcmUgY291bnRlciBmcm9tIENTUl9DWUNMRSBpcyBhY3R1YWxs
eSAyOiBtYWtlIHRoaXMgb2Zmc2V0IG1hdGNoIHRoZQo+PiByZWFsIGh3IG9mZnNldCBzbyB0aGF0
IHdlIGNhbiBkaXJlY3RseSBleHBvc2UgdGhvc2UgdmFsdWVzIHRvIHVzZXJzcGFjZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+
PiAtLS0KPj4gICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jIHwgNyArKysrKy0tCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4+IGluZGV4IGNhOWUyMGJmYzdhYy4uMGQ4YzlkODg0OWVl
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4+ICsrKyBi
L2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMKPj4gQEAgLTEyLDggKzEyLDExIEBACj4+
ICAgI2luY2x1ZGUgPGxpbnV4L3BlcmYvcmlzY3ZfcG11Lmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+PiAgIAo+PiAtI2RlZmluZSBSSVNDVl9QTVVfTEVHQUNZX0NZ
Q0xFCQkwCj4+IC0jZGVmaW5lIFJJU0NWX1BNVV9MRUdBQ1lfSU5TVFJFVAkxCj4+ICtlbnVtIHsK
Pj4gKwlSSVNDVl9QTVVfTEVHQUNZX0NZQ0xFLAo+PiArCVJJU0NWX1BNVV9MRUdBQ1lfVElNRSwK
Pj4gKwlSSVNDVl9QTVVfTEVHQUNZX0lOU1RSRVQKPj4gK307Cj4gSSBndWVzcyB0aGlzIGRvZXNu
J3QgaHVydCwgc2luY2UgdGhlc2UgYXJlIGp1c3QgaW5kaWNlcyBpbnRlcm5hbCB0byB0aGlzCj4g
ZHJpdmVyLCBidXQgaXQncyBhIGJpdCBvZGQgdG8gYWxzbyBoYXZlIGEgUklTQ1ZfUE1VX0xFR0FD
WV9USU1FLCB3aGVuCj4gdGhlIGRyaXZlciBpcyBvbmx5IGZvciBjeWNsZSBhbmQgaW5zdHJldCwg
YXMgaXRzIEtjb25maWcgaGVscCB0ZXh0IHNheXMuCgoKSSB1bmRlcnN0YW5kIGFuZCB5b3UncmUg
cmlnaHQsIHRoYXQncyB3ZWlyZCwgc28gSSdsbCBjaGFuZ2UgdGhhdCB3aXRoIAp0aGUgZm9sbG93
aW5nOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgCmIvZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYwppbmRleCBjYTllMjBiZmM3YWMuLjZhMDAwYWJj
MjhiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYworKysgYi9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCkBAIC0xMyw3ICsxMyw3IEBACiDCoCNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KCiDCoCNkZWZpbmUgUklTQ1ZfUE1VX0xFR0FD
WV9DWUNMRcKgwqDCoMKgwqDCoMKgwqAgMAotI2RlZmluZSBSSVNDVl9QTVVfTEVHQUNZX0lOU1RS
RVTCoMKgwqDCoMKgwqAgMQorI2RlZmluZSBSSVNDVl9QTVVfTEVHQUNZX0lOU1RSRVTCoMKgwqDC
oMKgwqAgMgoKIMKgc3RhdGljIGJvb2wgcG11X2luaXRfZG9uZTsKClRoYW5rcyEKCgo+IFRoYW5r
cywKPiBkcmV3Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
