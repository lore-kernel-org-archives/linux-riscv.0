Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72560C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW4Jzt7Ors65oYS6HnYb4dYQ/eYTpGsxDN6ErL5qmtc=; b=dhfgqIWYJPcrjF
	sEVWiobmHsuCM6nSNxYnr0hFV/aVSUKE3XRqeribACljMAmWOpXEwsOWfuGESGskqKlhME9bNHjHd
	9M18QK/Z6G5traCILFP7sSo+OMsPTGCBnUHJ0HlmntiPLXvQpq5xHWdtt7UND+lWA26WbLVJV8Ou/
	zNj33JsNf6Uh6H7HZ6bZDh0O9t6MOTeb3eXvGHgUKE7tAgj79zvO8zeWhW4MH//NnSwJDuRZC7vVe
	3dAjywkZkHCk3oJlSjESqAs31QPOFFW9J4b1bNtilzqNNkgXHJ0LzULcUe0SUHHEYWi/7GFvD4Upy
	/kRtsnzr+ETO7ObVjQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGys-003RPF-Rk; Thu, 08 Sep 2022 12:50:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGyp-003RMO-Lj
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:50:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFC7961B51;
	Thu,  8 Sep 2022 12:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1370C433D6;
	Thu,  8 Sep 2022 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662641402;
	bh=J94j2940gssPCzqo3VP0L2UgivzizFgy5WQH1s5iPoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HDyjY3QKy9idICnbkRBMhuwAZ1LxZuFGp9MnTXxDq1g17pH/WlzjxBKHyea7iWnIM
	 05D4y9+DU2mygC804n71CCvo4MvZX4/9mpDkxbEfviRRg+lg9b26NxgqCVqZyW+vVn
	 etvvTdH2HBCvNkmyCT9jqfYmsFxU8EuPn4PeJ+6keUXxkvITPQQ1IX+tnVlHNjcBxT
	 /Fs432/5lv1sc+/fSKZ2V8NOQ94dz7Kaw4w8akghz7Ew+HstIHoesRESs1zvLWyuuM
	 8S/d0ofm0EJRlwS64Uk+F5e2taLV0NKemdda/HhjVV8Kr+jjP3sh5XVT/RjR93eXqV
	 cc/NhyJMR34iA==
Date: Thu, 8 Sep 2022 21:49:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mhiramat@kernel.org>,
 <rostedt@goodmis.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
Message-Id: <20220908214958.c8139533dccad1ee8f927214@kernel.org>
In-Reply-To: <a00328a1-47ee-3700-8cd8-1a9f4e0d7a2b@huawei.com>
References: <20220907023327.85630-1-liaochang1@huawei.com>
	<YxjTF2FlIJbbKq0p@xhacker>
	<a00328a1-47ee-3700-8cd8-1a9f4e0d7a2b@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_055003_811835_CEB1ECD7 
X-CRM114-Status: GOOD (  22.88  )
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

T24gVGh1LCA4IFNlcCAyMDIyIDA5OjQzOjQ1ICswODAwCiJsaWFvY2hhbmcgKEEpIiA8bGlhb2No
YW5nMUBodWF3ZWkuY29tPiB3cm90ZToKCj4gVGhhbmtzIGZvciBjb21tZW50Lgo+IAo+IOWcqCAy
MDIyLzkvOCAxOjIxLCBKaXNoZW5nIFpoYW5nIOWGmemBkzoKPiA+IE9uIFdlZCwgU2VwIDA3LCAy
MDIyIGF0IDEwOjMzOjI3QU0gKzA4MDAsIExpYW8gQ2hhbmcgd3JvdGU6Cj4gPj4gU2luY2Ugbm8g
cmFjZSBjb25kaXRpb24gb2NjdXJzIG9uIGVhY2ggaW5zdHJ1Y3Rpb24gc2xvdCwgaGVuY2UgaXQg
aXMKPiA+PiBzYWZlIHRvIHBhdGNoIGluc3RydWN0aW9uIHNsb3Qgd2l0aG91dCBzdG9wcGluZyBt
YWNoaW5lLgo+ID4gCj4gPiBobW0sIElNSE8gdGhlcmUncyByYWNlIHdoZW4gYXJtaW5nIGtwcm9i
ZSB1bmRlciBTTVAsIHNvIHN0b3BwaW5nCj4gPiBtYWNoaW5lIGlzIG5lY2Vzc2FyeSBoZXJlLiBN
YXliZSBJIG1pc3VuZGVydGFuZCBzb21ldGhpbmcuCj4gPiAKPiAKPiBJdCBpcyBpbmRlZWQgbmVj
ZXNzYXJ5IHRvIHN0b3AgbWFjaGluZSB3aGVuIGFybSBrcHJvYmUgdW5kZXIgU01QLAo+IGJ1dCBp
IGRvbid0IHRoaW5rIGl0IG5lZWQgdG8gc3RvcCBtYWNoaW5lIHdoZW4gcHJlcGFyZSBpbnN0cnVj
dGlvbiBzbG90LAo+IHR3byByZWFzb25zOgo+IAo+IDEuIEluc3RydWN0aW9uIHNsb3QgaXMgZHlu
YW1pY2FsbHkgYWxsb2NhdGVkIGRhdGEuCj4gMi4gS2VybmVsIHdvdWxkIG5vdCBleGVjdXRlIGlu
c3RydWN0aW9uIHNsb3QgdW50aWwgb3JpZ2luYWwgaW5zdHJ1Y3Rpb24KPiAgICBpcyByZXBsYWNl
ZCBieSBicmVha3BvaW50LgoKQWgsIHRoaXMgaXMgZm9yIHNzIChzaW5nbGUgc3RlcCBvdXQgb2Yg
bGluZSkgc2xvdC4gU28gdW50aWwKa3Byb2JlIGlzIGVuYWJsZWQsIHRoaXMgc2hvdWxkIG5vdCBi
ZSB1c2VkIGZyb20gb3RoZXIgY29yZXMuCk9LLCB0aGVuIGl0IHNob3VsZCBiZSBzYWZlLgoKCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+
Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCA4ICsr
KysrLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9i
ZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiA+PiBpbmRleCBlNmU5
NTBiN2NmMzIuLmVmZjdkN2ZhYjUzNSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9iZXMva3Byb2Jlcy5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2tw
cm9iZXMuYwo+ID4+IEBAIC0yNCwxMiArMjQsMTQgQEAgcG9zdF9rcHJvYmVfaGFuZGxlcihzdHJ1
Y3Qga3Byb2JlICosIHN0cnVjdCBrcHJvYmVfY3RsYmxrICosIHN0cnVjdCBwdF9yZWdzICopOwo+
ID4+ICBzdGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX3NzX3Nsb3Qoc3RydWN0IGtw
cm9iZSAqcCkKPiA+PiAgewo+ID4+ICAJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSBHRVRfSU5TTl9M
RU5HVEgocC0+b3Bjb2RlKTsKPiA+PiArCWNvbnN0IGtwcm9iZV9vcGNvZGVfdCBicmtfaW5zbiA9
IF9fQlVHX0lOU05fMzI7Cj4gPj4gKwlrcHJvYmVfb3Bjb2RlX3Qgc2xvdFtNQVhfSU5TTl9TSVpF
XTsKPiA+PiAgCj4gPj4gIAlwLT5haW5zbi5hcGkucmVzdG9yZSA9ICh1bnNpZ25lZCBsb25nKXAt
PmFkZHIgKyBvZmZzZXQ7Cj4gPj4gIAo+ID4+IC0JcGF0Y2hfdGV4dChwLT5haW5zbi5hcGkuaW5z
biwgcC0+b3Bjb2RlKTsKPiA+PiAtCXBhdGNoX3RleHQoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcp
KHAtPmFpbnNuLmFwaS5pbnNuKSArIG9mZnNldCksCj4gPj4gLQkJICAgX19CVUdfSU5TTl8zMik7
Cj4gPj4gKwltZW1jcHkoc2xvdCwgJnAtPm9wY29kZSwgb2Zmc2V0KTsKPiA+PiArCW1lbWNweSgo
dm9pZCAqKSgodW5zaWduZWQgbG9uZylzbG90ICsgb2Zmc2V0KSwgJmJya19pbnNuLCA0KTsKPiA+
PiArCXBhdGNoX3RleHRfbm9zeW5jKHAtPmFpbnNuLmFwaS5pbnNuLCBzbG90LCBvZmZzZXQgKyA0
KTsKCkJUVywgZGlkbid0IHlvdSBoYXZlIGEgbWFjcm8gZm9yIHRoZSBzaXplIG9mIF9fQlVHX0lO
U05fMzI/CgpUaGFuayB5b3UsCgoKPiA+PiAgfQo+ID4+ICAKPiA+PiAgc3RhdGljIHZvaWQgX19r
cHJvYmVzIGFyY2hfcHJlcGFyZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4+IC0tIAo+
ID4+IDIuMTcuMQo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiAuCj4gCj4gLS0gCj4gQlIsCj4gTGlh
bywgQ2hhbmcKCgotLSAKTWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhpcmFtYXRAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
