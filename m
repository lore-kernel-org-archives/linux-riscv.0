Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB783C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5Az5rTwun0I+zmVmX1CAxJbW+SHCtX6PMD0Rx9BDLA=; b=Y+VEubYEBS1+tM
	w9L0Zv0RK7p3TocW4B1lnnHJ+oK1q6YNy6Z06pG+oTY/Lzgnv8dOf/bCXie+JdSliehFdzbZ+h+wp
	bEIrkmZaNUdARQeMd5+/Wii8exNh6IUCp5bH98c5V0Z/YNB1PvWlQFBJrZaEBs28+t4POQFOdIKaU
	zrtjj0UGF3ZHrJIzlcX9cb4bBLv+a6KsClobJywEthRzsm5SMSAzWTH9R+ihyRrlLo2LBtjYOSTEY
	agOmduQ3OtMY+vXE+KavzqMEPR6lrDhiSB5WKuLzIcwdtmZwLvFOVi6V66i53CRZME2mubsGzzoyI
	bZTNqzjqlLOVRgkQPQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Idc-0015ud-Au; Mon, 20 Jun 2022 14:44:24 +0000
Received: from forward501j.mail.yandex.net ([5.45.198.251])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3IdN-0015tC-N2; Mon, 20 Jun 2022 14:44:14 +0000
Received: from iva5-e241271dfbce.qloud-c.yandex.net (iva5-e241271dfbce.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7a1b:0:640:e241:271d])
	by forward501j.mail.yandex.net (Yandex) with ESMTP id 4CEF862388C;
	Mon, 20 Jun 2022 17:44:06 +0300 (MSK)
Received: from iva4-143b1447cf50.qloud-c.yandex.net (iva4-143b1447cf50.qloud-c.yandex.net [2a02:6b8:c0c:7511:0:640:143b:1447])
	by iva5-e241271dfbce.qloud-c.yandex.net (mxback/Yandex) with ESMTP id sKoReUKYOI-i4feduie;
	Mon, 20 Jun 2022 17:44:06 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1655736246;
	bh=NMjUm0hKKGFiUEHGHxxW3dzV2CiFvZwHVUmaKQNqE6w=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=qQvWfN4pzOGnTSxeAx3T0PKRT51/FhLw4Su8jW5wxqIF9c9Wu4T24yIKhf/C04v3l
	 YSVVU+O+tAB0QU9HTnZQQDdFUnzGjMcH7x3Td19J4FDTplvJOImRZG0eUVDKRkB/1r
	 v7yHpPpFaFU+mctBd3MOq07R7ycBGHF8MTfRX5p0=
Authentication-Results: iva5-e241271dfbce.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva4-143b1447cf50.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id CiT7k0pAyn-i3MCG5TG;
	Mon, 20 Jun 2022 17:44:03 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Mon, 20 Jun 2022 17:44:02 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos
 <joao.mario@tecnico.ulisboa.pt>, linux@yadro.com, Nikita Shubin
 <n.shubin@yadro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel
 <anup@brainfault.org>, Mark Rutland <mark.rutland@arm.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
Message-ID: <20220620174402.1fb82fa4@redslave.neermore.group>
In-Reply-To: <CAMuHMdUoa9H3Nw7ctAbueeVOdJEo_D25niS7E07HWwV2H4Z9Qg@mail.gmail.com>
References: <20220619111115.6354-1-nikita.shubin@maquefel.me>
	<20220619111115.6354-2-nikita.shubin@maquefel.me>
	<CAMuHMdUoa9H3Nw7ctAbueeVOdJEo_D25niS7E07HWwV2H4Z9Qg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_074410_141610_926A6F38 
X-CRM114-Status: GOOD (  27.40  )
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

SGVsbG8gR2VlcnQhCgpPbiBNb24sIDIwIEp1biAyMDIyIDA5OjUwOjE0ICswMjAwCkdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgoKPiBIaSBOaWtpdGEsCj4g
Cj4gT24gU3VuLCBKdW4gMTksIDIwMjIgYXQgMToxMSBQTSBOaWtpdGEgU2h1YmluCj4gPG5pa2l0
YS5zaHViaW5AbWFxdWVmZWwubWU+IHdyb3RlOgo+ID4gRnJvbTogTmlraXRhIFNodWJpbiA8bi5z
aHViaW5AeWFkcm8uY29tPgo+ID4KPiA+IFByb3ZpZGUgUklTQy1WIFNCSSBQTVUgaWQgdG8gZGlz
dGluZ3Vpc2ggZGlmZmVyZW50IGNvcmVzIG9yIFNvQ3MgdmlhCj4gPiAiZGV2aWNlcy9wbGF0Zm9y
bS9yaXNjdi1wbXUvaWQiIHN5c2ZzIGVudHJ5Lgo+ID4KPiA+IFRoZSBpZGVudGlmaWNhdGlvbiBp
cyBnZW5lcmF0ZWQgYXMgc3RyaW5nIG9mIG1hcmNoaWQsIG1pbXBpZCwKPiA+IG12ZW5kb3JpZCBp
biBoZXggZm9ybWF0IHNlcGFyYXRlZCBieSBjb21hIC0gIjB4NzAwMzIsMHg3MDAzMiwweDAiLgo+
ID4KPiA+IFRoZSBDU1JzIGFyZSBkZXRhaWxlZCBpbiB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3Bl
YyBbMV0uCj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwK
PiA+Cj4gPiBJbnNwaXJlZC1ieTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRl
Y25pY28udWxpc2JvYS5wdD4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG4uc2h1
YmluQHlhZHJvLmNvbT4gIAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YyAgCj4gCj4gPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiArKysgYi9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBAQCAtNjkzLDYgKzY5MywyOCBAQCBzdGF0
aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3QgcmlzY3ZfcG11Cj4gPiAqcG11LCBzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMg
c3NpemVfdCBpZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIKPiA+ICpi
dWYpICt7Cj4gPiArICAgICAgIGludCBsZW47Cj4gPiArICAgICAgIHN0cnVjdCByaXNjdl9wbXUg
KnBtdSA9IGNvbnRhaW5lcl9vZihkZXZfZ2V0X2RydmRhdGEoZGV2KSwKPiA+IHN0cnVjdCByaXNj
dl9wbXUsIHBtdSk7ICsKPiA+ICsgICAgICAgbGVuID0gc3ByaW50ZihidWYsICIlc1xuIiwgcG11
LT5wbXVpZCk7Cj4gPiArICAgICAgIGlmIChsZW4gPD0gMCkKPiA+ICsgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgImludmFsaWQgc3ByaW50ZiBsZW46ICVkXG4iLCBsZW4pOyAgCj4gCj4gSG93
IGNhbiB0aGlzIGZhaWw/Cj4gCj4gUGxlYXNlIHVzZSBzeXNmc19lbWl0KCkgaW5zdGVhZCBvZiBz
cHJpbnRmKCksIGFuZCBkcm9wIHRoZSBlcnJvcgo+IG1lc3NhZ2UuCgpJbmRlZWQsIHRoYW5rIHlv
dSBmb3IgeW91ciBjb21tZW50cy4KCkFsc28gaSBtaXNzZWQgc29tZSBleHBsaWNpdCBmcmVlOgoK
PiA+ICtvdXRfZnJlZV9wbXVpZDoKPiA+ICsgICAgICAga2ZyZWUocG11LT5wbXVpZCk7CgpUaGlz
IGlzIG5vdCBuZWVkZWQuCgo+IAo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gbGVuOwo+ID4gK30g
IAo+IAo+IEdye29ldGplLGVldGluZ31zLAo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0Cj4gCj4gLS0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tCj4gZ2VlcnRAbGludXgtbTY4ay5vcmcKPiAKPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhCj4gaGFj
a2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIgo+IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
