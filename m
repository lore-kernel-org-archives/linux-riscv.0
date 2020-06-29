Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70792C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 14:42:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1066C23E1F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 14:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0C5lfaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1066C23E1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbcfoticA+Jp7AZhMxn/BVLwuIxr9skw/O0TM6gH+NI=; b=W0C5lfaFN7vNlM9xLT7nD569S
	dFkJEkuc3CboLEAbUy6vzC6jxkwKp5l9VHWwzeTIRFTYVOIe4oi+DsJbxU7udZJv2m7GpaWNlvZZj
	DO9+ezcsUxDqR9pXwrE9TmZA48hHCWD3Ic5YRBx76MW6P2CRlc8fSF+JJsmZtXckq4xanaIoLbiDI
	/TSjonRSqdJueJxRECL2yx6+5RXDsYQTmH+xywLN8+XlbctDU/srokQgYq3gRnWIgQwpq5IddyvSw
	7jQFWgvkZbHM1yRdXW7HCxHj28lFrTey2wXUojdwL4rHlUQ3HY5A+teZFzHurURcPcKNtT+hEHPFC
	Cq2Fn2+GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpuzF-0005vz-G7; Mon, 29 Jun 2020 14:42:21 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpuzC-0005vP-Gu
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 14:42:19 +0000
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C2AD310000E;
 Mon, 29 Jun 2020 14:42:12 +0000 (UTC)
Subject: Re: [PATCH 2/2] riscv: Use PUD/PGDIR entries for linear mapping when
 possible
To: Atish Patra <atishp@atishpatra.org>
References: <20200603153608.30056-1-alex@ghiti.fr>
 <20200603153608.30056-3-alex@ghiti.fr>
 <CAOnJCU+JSuOGbOmZW-vqb-A_qR7CJc=qG16FbgOLWSm1vhJH1A@mail.gmail.com>
 <23529a84-44a0-3c45-f16d-5a7ee528610d@ghiti.fr>
 <CAOnJCU+s5JuNdPg_R-Cg2+WnMjR51DD0ekbRr84EFCig6=YyZA@mail.gmail.com>
 <f1a5ec6e-540b-497f-a9ad-f2d1e7adfc65@ghiti.fr>
 <2588a00a-b042-4902-1602-7cb8d587ac2b@ghiti.fr>
 <CAOnJCU+JOdoJfVCAKOHK52m47UwR_NzpJoGXQywD+Mx-6JRw5w@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <567064d8-0f23-1629-c40a-606a89cf4b97@ghiti.fr>
Date: Mon, 29 Jun 2020 10:42:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+JOdoJfVCAKOHK52m47UwR_NzpJoGXQywD+Mx-6JRw5w@mail.gmail.com>
Content-Language: fr
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXRpc2gsCgpMZSA2LzIyLzIwIMOgIDM6MTEgUE0sIEF0aXNoIFBhdHJhIGEgw6ljcml0wqA6
Cj4gT24gU3VuLCBKdW4gMjEsIDIwMjAgYXQgMjozOSBBTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRp
LmZyPiB3cm90ZToKPj4KPj4gSGkgQXRpc2gsCj4+Cj4+IExlIDYvMjAvMjAgw6AgNTowNCBBTSwg
QWxleCBHaGl0aSBhIMOpY3JpdCA6Cj4+PiBIaSBBdGlzaCwKPj4+Cj4+PiBMZSA2LzE5LzIwIMOg
IDI6MTYgUE0sIEF0aXNoIFBhdHJhIGEgw6ljcml0IDoKPj4+PiBPbiBUaHUsIEp1biAxOCwgMjAy
MCBhdCA5OjI4IFBNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Pj4+PiBIaSBB
dGlzaCwKPj4+Pj4KPj4+Pj4gTGUgNi8xOC8yMCDDoCA4OjQ3IFBNLCBBdGlzaCBQYXRyYSBhIMOp
Y3JpdCA6Cj4+Pj4+PiBPbiBXZWQsIEp1biAzLCAyMDIwIGF0IDg6MzggQU0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+Pj4+PiBJbXByb3ZlIGJlc3RfbWFwX3NpemUg
c28gdGhhdCBQVUQgb3IgUEdESVIgZW50cmllcyBhcmUgdXNlZCBmb3IKPj4+Pj4+PiBsaW5lYXIK
Pj4+Pj4+PiBtYXBwaW5nIHdoZW4gcG9zc2libGUgYXMgaXQgYWxsb3dzIGJldHRlciBUTEIgdXRp
bGl6YXRpb24uCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhAZ2hpdGkuZnI+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gICAgIGFyY2gvcmlzY3YvbW0vaW5p
dC5jIHwgNDUKPj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQo+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+Pj4+Pj4+IGluZGV4IDlhNWM5N2UwOTFjMS4uZDI3
NWY5ZjgzNGNmIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+Pj4+
Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+Pj4+PiBAQCAtNDI0LDEzICs0MjQsMjkg
QEAgc3RhdGljIHZvaWQgX19pbml0IGNyZWF0ZV9wZ2RfbWFwcGluZyhwZ2RfdAo+Pj4+Pj4+ICpw
Z2RwLAo+Pj4+Pj4+ICAgICAgICAgICAgY3JlYXRlX3BnZF9uZXh0X21hcHBpbmcobmV4dHAsIHZh
LCBwYSwgc3osIHByb3QpOwo+Pj4+Pj4+ICAgICB9Cj4+Pj4+Pj4KPj4+Pj4+PiAtc3RhdGljIHVp
bnRwdHJfdCBfX2luaXQgYmVzdF9tYXBfc2l6ZShwaHlzX2FkZHJfdCBiYXNlLAo+Pj4+Pj4+IHBo
eXNfYWRkcl90IHNpemUpCj4+Pj4+Pj4gK3N0YXRpYyBib29sIGlzX21hcF9zaXplX29rKHVpbnRw
dHJfdCBtYXBfc2l6ZSwgcGh5c19hZGRyX3QgYmFzZSwKPj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50cHRyX3QgYmFzZV92aXJ0LCBwaHlzX2FkZHJfdCBzaXplKQo+Pj4+Pj4+
ICAgICB7Cj4+Pj4+Pj4gLSAgICAgICAvKiBVcGdyYWRlIHRvIFBNRF9TSVpFIG1hcHBpbmdzIHdo
ZW5ldmVyIHBvc3NpYmxlICovCj4+Pj4+Pj4gLSAgICAgICBpZiAoKGJhc2UgJiAoUE1EX1NJWkUg
LSAxKSkgfHwgKHNpemUgJiAoUE1EX1NJWkUgLSAxKSkpCj4+Pj4+Pj4gLSAgICAgICAgICAgICAg
IHJldHVybiBQQUdFX1NJWkU7Cj4+Pj4+Pj4gKyAgICAgICByZXR1cm4gISgoYmFzZSAmIChtYXBf
c2l6ZSAtIDEpKSB8fCAoYmFzZV92aXJ0ICYgKG1hcF9zaXplCj4+Pj4+Pj4gLSAxKSkgfHwKPj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAoc2l6ZSA8IG1hcF9zaXplKSk7Cj4+Pj4+Pj4g
K30KPj4+Pj4+PiArCj4+Pj4+Pj4gK3N0YXRpYyB1aW50cHRyX3QgX19pbml0IGJlc3RfbWFwX3Np
emUocGh5c19hZGRyX3QgYmFzZSwgdWludHB0cl90Cj4+Pj4+Pj4gYmFzZV92aXJ0LAo+Pj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3Qgc2l6ZSkK
Pj4+Pj4+PiArewo+Pj4+Pj4+ICsjaWZuZGVmIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQKPj4+Pj4+
PiArICAgICAgIGlmIChpc19tYXBfc2l6ZV9vayhQR0RJUl9TSVpFLCBiYXNlLCBiYXNlX3ZpcnQs
IHNpemUpKQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gUEdESVJfU0laRTsKPj4+Pj4+
PiArCj4+Pj4+Pj4gKyAgICAgICBpZiAocGd0YWJsZV9sNF9lbmFibGVkKQo+Pj4+Pj4+ICsgICAg
ICAgICAgICAgICBpZiAoaXNfbWFwX3NpemVfb2soUFVEX1NJWkUsIGJhc2UsIGJhc2VfdmlydCwg
c2l6ZSkpCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBVRF9TSVpFOwo+
Pj4+Pj4+ICsjZW5kaWYKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICAgICBpZiAoaXNfbWFwX3NpemVf
b2soUE1EX1NJWkUsIGJhc2UsIGJhc2VfdmlydCwgc2l6ZSkpCj4+Pj4+Pj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBQTURfU0laRTsKPj4+Pj4+Pgo+Pj4+Pj4+IC0gICAgICAgcmV0dXJuIFBNRF9T
SVpFOwo+Pj4+Pj4+ICsgICAgICAgcmV0dXJuIFBBR0VfU0laRTsKPj4+Pj4+PiAgICAgfQo+Pj4+
Pj4+Cj4+Pj4+Pj4gICAgIC8qCj4+Pj4+Pj4gQEAgLTU3Niw3ICs1OTIsNyBAQCB2b2lkIGNyZWF0
ZV9rZXJuZWxfcGFnZV90YWJsZShwZ2RfdCAqcGdkaXIsCj4+Pj4+Pj4gdWludHB0cl90IG1hcF9z
aXplKQo+Pj4+Pj4+ICAgICBhc21saW5rYWdlIHZvaWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJf
dCBkdGJfcGEpCj4+Pj4+Pj4gICAgIHsKPj4+Pj4+PiAgICAgICAgICAgIHVpbnRwdHJfdCB2YSwg
ZW5kX3ZhOwo+Pj4+Pj4+IC0gICAgICAgdWludHB0cl90IG1hcF9zaXplID0gYmVzdF9tYXBfc2l6
ZShsb2FkX3BhLAo+Pj4+Pj4+IE1BWF9FQVJMWV9NQVBQSU5HX1NJWkUpOwo+Pj4+Pj4+ICsgICAg
ICAgdWludHB0cl90IG1hcF9zaXplOwo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICAgICBsb2FkX3Bh
ID0gKHVpbnRwdHJfdCkoJl9zdGFydCk7Cj4+Pj4+Pj4gICAgICAgICAgICBsb2FkX3N6ID0gKHVp
bnRwdHJfdCkoJl9lbmQpIC0gbG9hZF9wYTsKPj4+Pj4+PiBAQCAtNTg3LDYgKzYwMyw3IEBAIGFz
bWxpbmthZ2Ugdm9pZCBfX2luaXQgc2V0dXBfdm0odWludHB0cl90IGR0Yl9wYSkKPj4+Pj4+Pgo+
Pj4+Pj4+ICAgICAgICAgICAga2VybmVsX3ZpcnRfYWRkciA9IEtFUk5FTF9WSVJUX0FERFI7Cj4+
Pj4+Pj4KPj4+Pj4+PiArICAgICAgIG1hcF9zaXplID0gYmVzdF9tYXBfc2l6ZShsb2FkX3BhLCBQ
QUdFX09GRlNFVCwKPj4+Pj4+PiBNQVhfRUFSTFlfTUFQUElOR19TSVpFKTsKPj4+Pj4+PiAgICAg
ICAgICAgIHZhX3BhX29mZnNldCA9IFBBR0VfT0ZGU0VUIC0gbG9hZF9wYTsKPj4+Pj4+PiAgICAg
ICAgICAgIHZhX2tlcm5lbF9wYV9vZmZzZXQgPSBrZXJuZWxfdmlydF9hZGRyIC0gbG9hZF9wYTsK
Pj4+Pj4+PiAgICAgICAgICAgIHBmbl9iYXNlID0gUEZOX0RPV04obG9hZF9wYSk7Cj4+Pj4+Pj4g
QEAgLTcwMCw2ICs3MTcsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfdm1fZmluYWwodm9p
ZCkKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgLyogTWFwIGFsbCBtZW1vcnkgYmFua3MgKi8K
Pj4+Pj4+PiAgICAgICAgICAgIGZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7Cj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgIHVpbnRwdHJfdCByZW1haW5pbmdfc2l6ZTsKPj4+Pj4+PiArCj4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgIHN0YXJ0ID0gcmVnLT5iYXNlOwo+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICBlbmQgPSBzdGFydCArIHJlZy0+c2l6ZTsKPj4+Pj4+Pgo+Pj4+Pj4+IEBA
IC03MDcsMTUgKzcyNiwxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfdm1fZmluYWwodm9p
ZCkKPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgaWYgKG1lbWJsb2NrX2lzX25vbWFwKHJlZykpCj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIGlm
IChzdGFydCA8PSBfX3BhKFBBR0VfT0ZGU0VUKSAmJgo+Pj4+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgX19wYShQQUdFX09GRlNFVCkgPCBlbmQpCj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgc3RhcnQgPSBfX3BhKFBBR0VfT0ZGU0VUKTsKPj4+Pj4+Pgo+Pj4+Pj4+IC0gICAgICAgICAg
ICAgICBtYXBfc2l6ZSA9IGJlc3RfbWFwX3NpemUoc3RhcnQsIGVuZCAtIHN0YXJ0KTsKPj4+Pj4+
PiAtICAgICAgICAgICAgICAgZm9yIChwYSA9IHN0YXJ0OyBwYSA8IGVuZDsgcGEgKz0gbWFwX3Np
emUpIHsKPj4+Pj4+PiArICAgICAgICAgICAgICAgcGEgPSBzdGFydDsKPj4+Pj4+PiArICAgICAg
ICAgICAgICAgcmVtYWluaW5nX3NpemUgPSByZWctPnNpemU7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICB3aGlsZSAocmVtYWluaW5nX3NpemUpIHsKPj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2YSA9ICh1aW50cHRyX3QpX192YShwYSk7Cj4+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbWFwX3NpemUgPSBiZXN0X21hcF9zaXplKHBhLCB2YSwKPj4+Pj4+
PiByZW1haW5pbmdfc2l6ZSk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+IGNyZWF0ZV9wZ2RfbWFwcGluZyhz
d2FwcGVyX3BnX2RpciwgdmEsIHBhLAo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtYXBfc2l6ZSwgUEFHRV9LRVJORUwpOwo+Pj4+Pj4+ICsKPj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBwYSArPSBtYXBfc2l6ZTsKPj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICByZW1haW5pbmdfc2l6ZSAtPSBtYXBfc2l6ZTsKPj4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+ICAgICAgICAgICAgfQo+Pj4+Pj4+Cj4+Pj4+PiBU
aGlzIG1heSBub3Qgd29yayBpbiB0aGUgUlYzMiB3aXRoIDJHIG1lbW9yeSAgYW5kIGlmIHRoZSBt
YXBfc2l6ZSBpcwo+Pj4+Pj4gZGV0ZXJtaW5lZCB0byBiZSBhIHBhZ2Ugc2l6ZQo+Pj4+Pj4gZm9y
IHRoZSBsYXN0IG1lbWJsb2NrLiBCb3RoIHBhICYgcmVtYWluaW5nX3NpemUgd2lsbCBvdmVyZmxv
dyBhbmQgdGhlCj4+Pj4+PiBsb29wIHdpbGwgdHJ5IHRvIG1hcCBtZW1vcnkgZnJvbSB6ZXJvIGFn
YWluLgo+Pj4+PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kOiBpZiBwYSBzdGFydHMgYXQgMHg4
MDAwXzAwMDAgYW5kIHNpemUgaXMgMkcsCj4+Pj4+IHRoZW4gcGEgd2lsbCBvdmVyZmxvdyBpbiB0
aGUgbGFzdCBpdGVyYXRpb24sIGJ1dCByZW1haW5pbmdfc2l6ZSB3aWxsCj4+Pj4+IHRoZW4gYmUg
ZXF1YWwgdG8gMCByaWdodCA/Cj4+Pj4+Cj4+Pj4gTm90IHVubGVzcyB0aGUgcmVtYWluaW5nX3Np
emUgaXMgYXQgbGVhc3QgcGFnZSBzaXplIGFsaWduZWQuIFRoZSBsYXN0Cj4+Pj4gcmVtYWluaW5n
IHNpemUgd291bGQgImZmZiIuCj4+Pj4gSXQgd2lsbCBvdmVyZmxvdyBhcyB3ZWxsIGFmdGVyIHN1
YnRyYWN0aW5nIHRoZSBtYXBfc2l6ZS4KPj4KPj4KPj4gV2hpbGUgZml4aW5nIHRoaXMgaXNzdWUs
IEkgbm90aWNlZCB0aGF0IGlmIHRoZSBzaXplIGluIHRoZSBkZXZpY2UgdHJlZQo+PiBpcyBub3Qg
YWxpZ25lZCBvbiBQQUdFX1NJWkUsIHRoZSBzaXplIGlzIHRoZW4gYXV0b21hdGljYWxseSByZWFs
aWduZWQgb24KPj4gUEFHRV9TSVpFOiBzZWUgZWFybHlfaW5pdF9kdF9hZGRfbWVtb3J5X2FyY2gg
d2hlcmUgc2l6ZSBpcyBhbmQtZWQgd2l0aAo+PiBQQUdFX01BU0sgdG8gcmVtb3ZlIHRoZSB1bmFs
aWduZWQgcGFydC4KPj4KPiBZZXMuIEJ1dCB0aGUgbWVtYmxvY2sgc2l6ZSBpcyBub3QgZ3VhcmFu
dGVlZCB0byBiZSBQQUdFX1NJWkUgYWxpZ25lZC4KPiBUaGUgbWVtYmxvY2sgc2l6ZSBpcyB1cGRh
dGVkIGluIG1lbWJsb2NrX2NhcF9zaXplCj4gCj4gICAgICAvKiBhZGp1c3QgKkBzaXplIHNvIHRo
YXQgKEBiYXNlICsgKkBzaXplKSBkb2Vzbid0IG92ZXJmbG93LCByZXR1cm4KPiBuZXcgc2l6ZSAq
Lwo+ICAgICBzdGF0aWMgaW5saW5lIHBoeXNfYWRkcl90IG1lbWJsb2NrX2NhcF9zaXplKHBoeXNf
YWRkcl90IGJhc2UsCj4gcGh5c19hZGRyX3QgKnNpemUpCj4gICAgIHsKPiAgICAgICAgICAgICAg
cmV0dXJuICpzaXplID0gbWluKCpzaXplLCBQSFlTX0FERFJfTUFYIC0gYmFzZSk7Cj4gICAgIH0K
PiAKClllcyB5b3UncmUgcmlnaHQsIEkgd2lsbCBmaXggdGhhdCBpbiBhIHYyLgoKVGhhbmtzLAoK
QWxleAoKPiBZb3Ugd2lsbCBub3Qgc2VlIHRoaXMgaXNzdWUgcmlnaHQgYXdheSBldmVuIGlmIHlv
dSBhbGxvY2F0ZSAyR0Igb2YKPiBtZW1vcnkgd2hpbGUgcnVubmluZyAzMiBiaXQgbGludXggaW4g
cWVtdQo+IGJlY2F1c2UgdGhlIGtlcm5lbCByZW1vdmVzIGFueXRoaW5nIGJleW9uZCAweGMwNDAw
MDAwIGZvciAzMiBiaXQgaW4KPiBib290bWVtIHNldHVwLgo+IAo+IOKUglsgICAgMC4wMDAwMDBd
WyAgICBUMF0gbWVtYmxvY2tfcmVtb3ZlOiBbMHhjMDQwMDAwMC0weGZmZmZmZmZlXQo+IHNldHVw
X2Jvb3RtZW0rMHg5MC8weDIxNgo+IAo+IFRoaXMgYWxzbyByZXN0cmljdHMgdGhlIGtlcm5lbCB0
byB1c2Ugb25seSAxR0Igb2YgbWVtb3J5IGV2ZW4gaWYKPiBtYXhpbXVtIHBoeXNpY2FsIG1lbW9y
eSBzdXBwb3J0ZWQgaXMgMkdCLgo+IAo+PiBTbyB0aGUgaXNzdWUgZG9lcyBub3QgbmVlZCB0byBi
ZSBmaXhlZCA6KQo+Pgo+PiBUaGFua3MgYW55d2F5LAo+Pgo+PiBBbGV4Cj4+Cj4+Cj4+Pj4KPj4+
Pj4gQW5kIGJ5IHRoZSB3YXksIEkgcmVhbGl6ZSB0aGF0IHRoaXMgbG9vcCBvbmx5IGhhbmRsZXMg
c2l6ZXMgdGhhdCBhcmUKPj4+Pj4gYWxpZ25lZCBvbiBtYXBfc2l6ZS4KPj4+Pj4KPj4+PiBZZWFo
Lgo+Pj4KPj4+Cj4+PiBUaGFua3MgZm9yIG5vdGljaW5nLCBJIHNlbmQgYSB2Mi4KPj4+Cj4+PiBB
bGV4Cj4+Pgo+Pj4KPj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+IEFsZXgKPj4+Pj4KPj4+
Pj4KPj4+Pj4+PiAtLQo+Pj4+Pj4+IDIuMjAuMQo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pgo+Pj4+Cj4+
Pgo+IAo+IAo+IAo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
