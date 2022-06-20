Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170EEC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seG0xsKyuCv4nlE2tndq9xYs6jDhRm/V92kFAdS4lyo=; b=B1GnHLm+ivWR+2
	J83xUH2/6Cq7pJ2Dpmey5b9YVSQ81bZnFpLoCmOqQ1u/HZOaXQ9uI/ONRnu1YkcChE9mnB6KYppt8
	kPC939rgOqwHNhI7Weyx1VoOlO0qwpFsSSUPbK2+2gsbJJKfXAOfGnhAxfkawAudtSdku4zDpsvcw
	Ec9GoODCkoFdW1IMbbA73cOsEVDNWUzR3QA0VRdGG5t6Hp77jhxlzcZXOP7vwkztGe4n3PEvP1WuF
	GL3cpGHzVWjVw79LitBWpbUE5nxXVBARWvAwBfVC6OkXkYYCkCBXlDMy4OEXuqc6sNbOO6XQL4NGg
	kCzPpwkbgmLP6LRSlWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3IZq-0015JI-R6; Mon, 20 Jun 2022 14:40:30 +0000
Received: from forward501j.mail.yandex.net ([2a02:6b8:0:801:2::111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3IZe-0015Fm-Kh; Mon, 20 Jun 2022 14:40:22 +0000
Received: from sas2-4b68358e232a.qloud-c.yandex.net (sas2-4b68358e232a.qloud-c.yandex.net [IPv6:2a02:6b8:c08:6803:0:640:4b68:358e])
	by forward501j.mail.yandex.net (Yandex) with ESMTP id 67C8E6237C1;
	Mon, 20 Jun 2022 17:40:11 +0300 (MSK)
Received: from sas1-1f4a002bb12a.qloud-c.yandex.net (sas1-1f4a002bb12a.qloud-c.yandex.net [2a02:6b8:c14:3908:0:640:1f4a:2b])
	by sas2-4b68358e232a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ld9oySLxkA-e8fqEW2c;
	Mon, 20 Jun 2022 17:40:11 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1655736011;
	bh=9KhuHwBW1BLeXqIGFoV6GgamoThrMvdQ7vOpwMEvjvs=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=e2BwUtCpX3/VJ6cnQoA9FwxleXqizx9JHvaXeau6BnGZbAOcCmXGvE1psq2m+0yrY
	 fMMlPZbTvqOZs6bG/fFxkRgNyanAstKuOWbzRvXYz1vNxDGKCRhIzX8jBENfct/p26
	 x5qoXM5iORvTTIrb8M1qvoN5fbTBuXGTO/tHjDrM=
Authentication-Results: sas2-4b68358e232a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-1f4a002bb12a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id s10qvb0JwR-e7NaGZRG;
	Mon, 20 Jun 2022 17:40:08 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Mon, 20 Jun 2022 17:40:06 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Will Deacon <will@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos
 <joao.mario@tecnico.ulisboa.pt>, linux <linux@yadro.com>, Nikita Shubin
 <n.shubin@yadro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel
 <anup@brainfault.org>, Mark Rutland <mark.rutland@arm.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
Message-ID: <20220620174006.1c86a456@redslave.neermore.group>
In-Reply-To: <CAK9=C2X4TTCEjZya4wz-W6ndBaxzUpLBtzQAGJ4zphVM8NSgdg@mail.gmail.com>
References: <20220619111115.6354-1-nikita.shubin@maquefel.me>
	<20220619111115.6354-2-nikita.shubin@maquefel.me>
	<CAK9=C2X4TTCEjZya4wz-W6ndBaxzUpLBtzQAGJ4zphVM8NSgdg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_074019_616028_15863E5C 
X-CRM114-Status: GOOD (  31.11  )
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

T24gTW9uLCAyMCBKdW4gMjAyMiAxNzozMDo1OCArMDUzMApBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cgo+IE9uIFN1biwgSnVuIDE5LCAyMDIyIGF0IDQ6NDEgUE0g
TmlraXRhIFNodWJpbgo+IDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPiA+Cj4g
PiBGcm9tOiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4gPgo+ID4gUHJvdmlk
ZSBSSVNDLVYgU0JJIFBNVSBpZCB0byBkaXN0aW5ndWlzaCBkaWZmZXJlbnQgY29yZXMgb3IgU29D
cyB2aWEKPiA+ICJkZXZpY2VzL3BsYXRmb3JtL3Jpc2N2LXBtdS9pZCIgc3lzZnMgZW50cnkuCj4g
Pgo+ID4gVGhlIGlkZW50aWZpY2F0aW9uIGlzIGdlbmVyYXRlZCBhcyBzdHJpbmcgb2YgbWFyY2hp
ZCwgbWltcGlkLAo+ID4gbXZlbmRvcmlkIGluIGhleCBmb3JtYXQgc2VwYXJhdGVkIGJ5IGNvbWEg
LSAiMHg3MDAzMiwweDcwMDMyLDB4MCIuCj4gPgo+ID4gVGhlIENTUnMgYXJlIGRldGFpbGVkIGlu
IHRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIFsxXS4KPiA+IFsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbAo+ID4KPiA+IEluc3BpcmVkLWJ5OiBKb8OjbyBNw6Fy
aW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+ID4gU2lnbmVkLW9m
Zi1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPiAgCj4gCj4gVGhlIG12ZW5k
b3JpZCwgbWFyY2hpZCwgYW5kIG1pbXBpZCBjYW4gYmUgdXNlZnVsIHRvIGFwcHMgb3RoZXIgdGhh
bgo+IHBlcmYgdG9vbC4KPiAKPiBJIGhhdmUgdHJpZWQgdG8gZXh0ZW5kIC9wcm9jL2NwdWluZm8g
d2l0aCB0aGlzIGluZm9ybWF0aW9uIHdoaWNoIGNhbgo+IGJlIHBhcnNlZCBieSBwZXJmIHRvb2w6
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNjIwMTE1NTQ5LjE1Mjk1OTctMS1h
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbS8KCkF0aXNoLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCB0
aGlzID8KClJJU0MtViBwZXJmIGNhbiByZWx5IG9uICIvcHJvYy9jcHVpbmZvIiwgaW4gc29tZSBz
aW1pbGFyIG1hbm5lciBsaWtlCiJ0b29scy9wZXJmL2FyY2gvczM5MC91dGlsL2hlYWRlci5jIiBk
b2VzLgoKQ2FuIGl0IGNyZWF0ZSBwcm9ibGVtcyB3aXRoIHBtdSBpZGVudGlmaWNhdGlvbiBpbiBj
YXNlIG9mIGhldGVyZ2Vub3VzCmhhcnRzID8KCj4gCj4gUmVnYXJkcywKPiBBbnVwCj4gCj4gPiAt
LS0KPiA+IHYzLT52NDoKPiA+IC0gdXNlIHN0cmluZyBmb3IgcG11aWQKPiA+IC0gcmVuYW1lIHBt
dV9zYmlfaWRfc2hvdyB0byBpZF9zaG93Cj4gPiAtIGZpeCBlcnJvciBwcmludCBtZXNzYWdlIGlu
IGlkX3Nob3cKPiA+IC0gZml4IERFVklDRV9BVFRSIHRvIHVzZSBvY3RhbCBwZXJtaXNzaW9ucwo+
ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAgIHwgIDMgKysrCj4gPiAg
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgIHwgNDEKPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysgaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oIHwKPiA+ICAx
ICsgMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiA+IGlu
ZGV4IDc3NWQzMzIyYjQyMi4uNTBkZDliNmVjYzllIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gPiBAQCAt
NjI3LDE2ICs2MjcsMTkgQEAgbG9uZyBzYmlfZ2V0X212ZW5kb3JpZCh2b2lkKQo+ID4gIHsKPiA+
ICAgICAgICAgcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dFVF9NVkVORE9S
SUQpOwo+ID4gIH0KPiA+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbXZlbmRvcmlkKTsKPiA+Cj4g
PiAgbG9uZyBzYmlfZ2V0X21hcmNoaWQodm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIHJldHVybiBf
X3NiaV9iYXNlX2VjYWxsKFNCSV9FWFRfQkFTRV9HRVRfTUFSQ0hJRCk7Cj4gPiAgfQo+ID4gK0VY
UE9SVF9TWU1CT0woc2JpX2dldF9tYXJjaGlkKTsKPiA+Cj4gPiAgbG9uZyBzYmlfZ2V0X21pbXBp
ZCh2b2lkKQo+ID4gIHsKPiA+ICAgICAgICAgcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VY
VF9CQVNFX0dFVF9NSU1QSUQpOwo+ID4gIH0KPiA+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbWlt
cGlkKTsKPiA+Cj4gPiAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3Ry
dWN0IGNwdW1hc2sgKnRhcmdldCkKPiA+ICB7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+ID4gYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGluZGV4
IGRjYTM1MzdhOGRjYy4uYmU4MTJmODU1NjE3Cj4gPiAxMDA2NDQgLS0tIGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
ID4gQEAgLTY5Myw2ICs2OTMsMjggQEAgc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3Ry
dWN0IHJpc2N2X3BtdQo+ID4gKnBtdSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlIHJldHVy
biAwOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHNzaXplX3QgaWRfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlICphdHRyLCBjaGFyCj4gPiAqYnVmKSArewo+ID4gKyAgICAgICBpbnQgbGVuOwo+
ID4gKyAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBjb250YWluZXJfb2YoZGV2X2dldF9k
cnZkYXRhKGRldiksCj4gPiBzdHJ1Y3QgcmlzY3ZfcG11LCBwbXUpOyArCj4gPiArICAgICAgIGxl
biA9IHNwcmludGYoYnVmLCAiJXNcbiIsIHBtdS0+cG11aWQpOwo+ID4gKyAgICAgICBpZiAobGVu
IDw9IDApCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJpbnZhbGlkIHNwcmludGYg
bGVuOiAlZFxuIiwgbGVuKTsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIGxlbjsKPiA+ICt9Cj4g
PiArCj4gPiArc3RhdGljIERFVklDRV9BVFRSKGlkLCAwNjQ0LCBpZF9zaG93LCBOVUxMKTsKPiA+
ICsKPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqcG11X3NiaV9hdHRyc1tdID0gewo+ID4g
KyAgICAgICAmZGV2X2F0dHJfaWQuYXR0ciwKPiA+ICsgICAgICAgTlVMTAo+ID4gK307Cj4gPiAr
Cj4gPiArQVRUUklCVVRFX0dST1VQUyhwbXVfc2JpKTsKPiA+ICsKPiA+ICBzdGF0aWMgaW50IHBt
dV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+
ID4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBOVUxMOwo+ID4gQEAgLTcxNCw2ICs3
MzYsMTQgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShzdHJ1Y3QKPiA+IHBsYXRm
b3JtX2RldmljZSAqcGRldikgaWYgKHBtdV9zYmlfZ2V0X2N0cmluZm8obnVtX2NvdW50ZXJzKSkK
PiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlOwo+ID4KPiA+ICsgICAgICAgLyogZmls
bCBwbXVpZCAqLwo+ID4gKyAgICAgICBwbXUtPnBtdWlkID0ga2FzcHJpbnRmKEdGUF9LRVJORUws
ICIweCVseCwweCVseCwweCVseCIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2JpX2dldF9tYXJjaGlkKCksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Jp
X2dldF9taW1waWQoKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfZ2V0
X212ZW5kb3JpZCgpKTsKPiA+ICsgICAgICAgaWYgKCFwbXUtPnBtdWlkKQo+ID4gKyAgICAgICAg
ICAgICAgIGdvdG8gb3V0X2ZyZWVfcG11aWQ7Cj4gPiArCj4gPiAgICAgICAgIHJldCA9IHBtdV9z
Ymlfc2V0dXBfaXJxcyhwbXUsIHBkZXYpOwo+ID4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ID4g
ICAgICAgICAgICAgICAgIHByX2luZm8oIlBlcmYgc2FtcGxpbmcvZmlsdGVyaW5nIGlzIG5vdCBz
dXBwb3J0ZWQKPiA+IGFzIHNzY29mIGV4dGVuc2lvbiBpcyBub3QgYXZhaWxhYmxlXG4iKTsgQEAg
LTczOSw4ICs3NjksMTkgQEAKPiA+IHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+IHJldHVybiByZXQ7IH0KPiA+Cj4gPiArICAg
ICAgIHJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmcGRldi0+ZGV2LmtvYmosICZwbXVfc2JpX2dy
b3VwKTsKPiA+ICsgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIo
JnBkZXYtPmRldiwgInN5c2ZzIGNyZWF0aW9uIGZhaWxlZFxuIik7Cj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBwZGV2LT5kZXYu
Z3JvdXBzID0gcG11X3NiaV9ncm91cHM7Cj4gPiArICAgICAgIGRldl9zZXRfZHJ2ZGF0YSgmcGRl
di0+ZGV2LCBwbXUpOwo+ID4gKwo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiArb3V0X2Zy
ZWVfcG11aWQ6Cj4gPiArICAgICAgIGtmcmVlKHBtdS0+cG11aWQpOwo+ID4gIG91dF9mcmVlOgo+
ID4gICAgICAgICBrZnJlZShwbXUpOwo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+ID4gYi9pbmNsdWRlL2xpbnV4
L3BlcmYvcmlzY3ZfcG11LmggaW5kZXggNDZmOWI2ZmUzMDZlLi5jZjM1NTdiNzdmYjgKPiA+IDEw
MDY0NCAtLS0gYS9pbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmgKPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+ID4gQEAgLTQyLDYgKzQyLDcgQEAgc3RydWN0IGNw
dV9od19ldmVudHMgewo+ID4gIHN0cnVjdCByaXNjdl9wbXUgewo+ID4gICAgICAgICBzdHJ1Y3Qg
cG11ICAgICAgcG11Owo+ID4gICAgICAgICBjaGFyICAgICAgICAgICAgKm5hbWU7Cj4gPiArICAg
ICAgIGNoYXIgICAgICAgICAgICAqcG11aWQ7Cj4gPgo+ID4gICAgICAgICBpcnFyZXR1cm5fdCAg
ICAgKCpoYW5kbGVfaXJxKShpbnQgaXJxX251bSwgdm9pZCAqZGV2KTsKPiA+Cj4gPiAtLQo+ID4g
Mi4zNS4xCj4gPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
