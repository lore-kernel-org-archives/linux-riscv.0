Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8CAC7618D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zYxlVD9KalEOD56bkpQ1rJ25ARhTHOfeK49UcxKMXE=; b=fULEuJR0H5HGxE
	QE5fdLe3AD5SAYu5msAmOM+GrmWFv1KHQ2SwnBZ0DC9+uGuf1MnptAGO7QUIvy+FuVkKJcFv7OiWU
	V8Y1tne+oTRigyvhW5iV7cvrGTMoOgsTNbd6lK0inmobcCAVmmKjGK1+/0hKJ3EO909g+JZ6512LP
	twyeqHQnzXegEvJ7fmNI6GKAIt4tK/d1vCkLhpdRUsPqEvBsb1Z+k9viQQScylAtLEywxB94sn5TQ
	DN8ewHKqfDJP49BYPr3pgmySYzRfgEF2e7BCbBkZKvHdHgy1BYQyvqvBKjrLcDOzMN8MxY0iWQrKQ
	fQFE9oaAFm6XZZ+zzSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaGc-000Dgj-1j;
	Tue, 04 Apr 2023 06:35:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaGZ-000Dft-2Z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 06:35:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC7A362E30
	for <linux-riscv@lists.infradead.org>; Tue,  4 Apr 2023 06:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8430BC433A7
	for <linux-riscv@lists.infradead.org>; Tue,  4 Apr 2023 06:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680590134;
	bh=hQhK5X+FMKBgkJ1ZUpllN4QGFJfhK9B1pyMS9yscrY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rznEyMsz7HQcxNydcsNElmyjXY1YR+EX1OSCvdyQ2u/hwVUUoQI80Usj5EYmUpM0T
	 KNhknkAfwderWUOD3szSLC5mkfN8AmWGsfqfHr4c5RkH2qFA3K6tVLXpG2o2+EVvhp
	 Z+a1cTbOJePt4CDJduXkN0UNiVX1zrQ4ieh0A0TQXqGkHH1+ZFloMaqz0lBo9py1bd
	 MlgvuPApj1DKLkJq4U/hdgdc8N59czLGvy/xCwCJCs0WDQzztpWCjwMMdwLkKOl0RH
	 x97q25j/Y2z7ppWZ+dsuAX0A5OfEhhO4uAkFjFLtby03kQk7u+IXzayuQpdaQVXxBs
	 TycYOncjg/RbQ==
Received: by mail-ed1-f49.google.com with SMTP id t10so126119580edd.12
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 23:35:34 -0700 (PDT)
X-Gm-Message-State: AAQBX9eeVIYFqZybfpQb0SRvt7aHaGWYWXIK2fmNYVYugY1/aFEJenVS
	IXm1GvF7GzOHkgyPm7Q3en79PcPBM/rbBrIQrNQ=
X-Google-Smtp-Source: AKy350am7H/VQB4ZztsVmAqwJ6AuMYVKqkRGpW+k9TnAd7Y30s0+1JnJzKxMdbYUMePr1qS//qqrlzDzDdM171oTRug=
X-Received: by 2002:a50:aad2:0:b0:501:d3a2:b4ae with SMTP id
 r18-20020a50aad2000000b00501d3a2b4aemr788287edc.7.1680590132765; Mon, 03 Apr
 2023 23:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org> <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
 <ZAfeaO52pnYhiyLN@sunil-laptop>
In-Reply-To: <ZAfeaO52pnYhiyLN@sunil-laptop>
From: Ley Foon Tan <lftan@kernel.org>
Date: Tue, 4 Apr 2023 14:35:19 +0800
X-Gmail-Original-Message-ID: <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
Message-ID: <CAFiDJ58bRo6R1qOFaSSNgAdbQJZ3xDY6Wth-t8M8XKRFbig2hA@mail.gmail.com>
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-acpi@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_233539_929273_3AC4E89A 
X-CRM114-Status: GOOD (  33.97  )
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

T24gV2VkLCBNYXIgOCwgMjAyMyBhdCA5OjA44oCvQU0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMDcsIDIwMjMgYXQgMDY6NDQ6MzVQ
TSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMDcsIDIwMjMgYXQg
MDY6MTM6MjJBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPgo+ID4gPgo+ID4gPiBP
biA3IE1hcmNoIDIwMjMgMDU6MDY6MTYgR01ULCBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1p
Y3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID5PbiBNb24sIE1hciAwNiwgMjAyMyBhdCAwOTo1MTowOVBN
ICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4+IEhleSBTdW5pbCwKPiA+ID4gPj4K
PiA+ID4gPj4gT24gRnJpLCBNYXIgMDMsIDIwMjMgYXQgMDc6MDY6MjdQTSArMDUzMCwgU3VuaWwg
ViBMIHdyb3RlOgo+ID4gPiA+PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgdGhlIGJhc2lj
IEFDUEkgaW5mcmFzdHJ1Y3R1cmUgZm9yIFJJU0MtVi4KPiA+ID4gPj4gPiBTdXBwb3J0aW5nIGV4
dGVybmFsIGludGVycnVwdCBjb250cm9sbGVycyBpcyBpbiBwcm9ncmVzcyBhbmQgaGVuY2UgaXQg
aXMKPiA+ID4gPj4gPiB0ZXN0ZWQgdXNpbmcgcG9sbCBiYXNlZCBIVkMgU0JJIGNvbnNvbGUgYW5k
IFJBTSBkaXNrLgo+ID4gPiA+PiA+Cj4gPiA+ID4+ID4gVGhlIGZpcnN0IHBhdGNoIGluIHRoaXMg
c2VyaWVzIGlzIG9uZSBvZiB0aGUgcGF0Y2ggZnJvbSBKaXNoZW5nJ3MKPiA+ID4gPj4gPiBzZXJp
ZXMgWzFdIHdoaWNoIGlzIG5vdCBtZXJnZWQgeWV0LiBUaGlzIHBhdGNoIGlzIHJlcXVpcmVkIHRv
IHN1cHBvcnQKPiA+ID4gPj4gPiBBQ1BJIHNpbmNlIGVmaV9pbml0KCkgd2hpY2ggZ2V0cyBjYWxs
ZWQgYmVmb3JlIHNiaV9pbml0KCkgY2FuIGVuYWJsZQo+ID4gPiA+PiA+IHN0YXRpYyBicmFuY2hl
cyBhbmQgaGl0cyBhIHBhbmljLgo+ID4gPiA+PiA+Cj4gPiA+ID4+ID4gUGF0Y2ggMiBhbmQgMyBh
cmUgQUNQSUNBIHBhdGNoZXMgd2hpY2ggYXJlIG5vdCBtZXJnZWQgaW50byBhY3BpY2EgeWV0Cj4g
PiA+ID4+ID4gYnV0IGEgUFIgaXMgcmFpc2VkIGFscmVhZHkuCj4gPiA+ID4+ID4KPiA+ID4gPj4g
PiBCZWxvdyBhcmUgdHdvIEVDUnMgYXBwcm92ZWQgYnkgQVNXRy4KPiA+ID4gPj4gPiBSSU5UQyAt
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVI2azRNc2hoTjNXVFQtaHdxQXF1dTVu
WDZ4U0VxSzJsL3ZpZXcKPiA+ID4gPj4gPiBSSENUIC0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29t
L2ZpbGUvZC8xblAzbkZpSDRqa1BNcDZDT094UDYxMjNEQ1pLUi10aWEvdmlldwo+ID4gPiA+PiA+
Cj4gPiA+ID4+ID4gVGhlIHNlcmllcyBkZXBlbmRzIG9uIEFudXAncyBJUEkgaW1wcm92ZW1lbnQg
c2VyaWVzIFsyXS4KPiA+ID4gPj4gPgo+ID4gPiA+PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMjA4MjExNDA5MTguMzYxMy0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+ID4g
Pj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDEwMzE0MTIyMS43NzIy
NjEtNy1hcGF0ZWxAdmVudGFuYW1pY3JvLmNvbS9ULwo+ID4gPiA+Pgo+ID4gPiA+PiBCdWlsZGlu
ZyBhIGNsYW5nLTE1IGFsbG1vZGNvbmZpZyAoSSBkaWRuJ3QgdHJ5IGdjYykgd2l0aCB0aGlzIHNl
cmllcywgYW5kCj4gPiA+ID4+IEFudXAncyBJUEkgYml0cywgcmVzdWx0cyBpbiBhIGJyb2tlbiBi
dWlsZCwgZHVlIHRvIGZhaWxpbmdzIGluIGNtcHhjaGc6Cj4gPiA+ID4+Cj4gPiA+ID4+IC9zdHVm
Zi9saW51eC9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9jb250cm9sbGVyLmM6
NjE6MjU6IGVycm9yOiBjYWxsIHRvIF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMzNSBkZWNsYXJlZCB3
aXRoICdlcnJvcicgYXR0cmlidXRlOiBCVUlMRF9CVUcgZmFpbGVkCj4gPiA+ID4+ICAgICAgICAg
d2hpbGUgKHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZjLT52YWx1ZSwgb2xkLCBuZXcpKSAhPSBv
bGQpKSB7Cj4gPiA+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPgo+ID4g
PiA+IEkgYW0gYWJsZSB0byBidWlsZCB3aXRob3V0IGFueSBvZiB0aGVzZSBpc3N1ZXMgdXNpbmcg
Y2xhbmctMTUuIEkgYW0KPiA+ID4gPiB3b25kZXJpbmcgd2hldGhlciB0aGUgYmFzZSBpcyBwcm9w
ZXIuIEkgaGFkIHJlYmFzZWQgb24gdG9wIG9mIHRoZSBtYXN0ZXIKPiA+ID4gPiBhbmQgY291cGxl
IG9mIHBhdGNoZXMgZnJvbSBJUEkgc2VyaWVzIHdlcmUgYWxyZWFkeSBtZXJnZWQgaW4gdGhlIG1h
c3Rlci4KPiA+ID4gPgo+ID4gPiA+IERvIHlvdSBtaW5kIHZlcmlmeWluZyB3aXRoIG15IGJyYW5j
aAo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL2xpbnV4L2NvbW1pdHMvYWNwaV9i
MV91c19yZXZpZXdfaXBpMTdfVjM/Cj4gPiA+Cj4gPiA+IEkgY2FuIGNoZWNrIHRoYXQgbGF0ZXIg
SSBzdXBwb3NlLgo+ID4KPiA+IFRoYXQncyBicm9rZW4gdG9vLgo+ID4KPiA+ID4gPiBPciBpZiB5
b3UgY291bGQgcHJvdmlkZSBtZSB5b3VyIGJyYW5jaCBkZXRhaWxzLCBJIGNhbiBsb29rIGZ1cnRo
ZXIuCj4gPiA+Cj4gPiA+IDYuMy1yYzEsIHdpdGggYm90aCBzZXJpZXMgYXBwbGllZCwgc2FucyBB
bnVwcyBhcHBsaWVkIHBhdGNoZXMuCj4gPgo+ID4gSSd2ZSBwdXNoZWQgbXkgc3R1ZmYgaGVyZSwg
YnV0IHVubGlrZWx5IHRoYXQgaXQgbWFrZXMgYW55IG9kZHMgc2luY2UKPiA+IHlvdXIgYnJhbmNo
IGV4cGVyaWVuY2VzIHRoZSBzYW1lIGJ1aWxkIGlzc3VlLgo+ID4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY29ub3IvbGludXguZ2l0LyBib3JrZWQtYWNw
aS1zdXJmYWNlCj4gPgo+ID4gTXkgYnVpbGQgY29tbWFuZHMgYXJlIHdyYXBwZWQgaW4gYSBzY3Jp
cHQsIGJ1dCBpdCdzIGFuIExMVk09MQo+ID4gYWxsbW9kY29uZmlnIHJ1biB3LyBjbGFuZy0xNSgu
MC43KSBldGMuCj4gPgo+IEFoaCBhbGxtb2Rjb25maWcuIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghLiBJ
IGNhbiByZXByb2R1Y2UgdGhlIGZhaWx1cmUuIExldAo+IG1lIGxvb2sgZnVydGhlciBhbmQgZml4
IGluIG5leHQgcmV2aXNpb24uCj4KPiBUaGFua3MhCj4gU3VuaWwKCkhpIFN1bmlsCgpPbmUgcXVl
c3Rpb24gcmVnYXJkaW5nIFBNVSBpbiBBQ1BJIGZsb3cuCgpXZSB1c2UgRFQgdG8gZGVjb2RlIHRo
ZSBzdXBwb3J0ZWQgSFBNIGNvdW50ZXJzL2V2ZW50cyBmb3IgdGhlCmRpZmZlcmVudCBwbGF0Zm9y
bXMgbm93LgpIb3cgZG8gd2UgZW5hYmxlIFBNVSAoZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
Yykgd2hlbiB1c2luZyBBQ1BJIG1ldGhvZD8KTm90ZSwgdGhpcyBtaWdodCBiZSBpbiBzZXBhcmF0
ZSBwYXRjaCBzZXJpZXMuCgpSZWdhcmRzCkxleSBGb29uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
