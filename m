Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0373C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 03:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohgpuqEIsANIh01bR7xofyAeYoni2ZgrEsqp40xFru8=; b=c7n9AR6D5E80Xo
	zeverYp9j0HAeIKCWe0pc9kuAlv4NMK+uRwTuJFzl9Vl8SBXN5WIpVo7/bmyPWkASzatlrtR9TRVi
	aBO12/mL13vTT5+cZxs9GUNasfAfqmND4v/Qt6FUFPpRnpdA5oJM1+oJhL/+roQlZ0GvEPKnbCW1U
	t8Lmvc0/mjgZHAUf7Ysi40q26sLkxdrWNhBHCH0sifswSgOtoCZ3XWPuC+Rq5L2LrDAcVCuhitotM
	jiA7FUJmjnz2mPukDRFt5Vr5+e5L7LAL1gJ6wzh1CbDA5+B5v0a6yNJf6kiM06c9Ixiy8bWq9wu4k
	daCZAZOs4Xy4O+NykYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyP6y-00CK0C-DD; Fri, 25 Nov 2022 03:10:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyP6v-00CJyt-FT
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 03:10:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3BB3B8294F
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324FAC4347C
	for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669345838;
	bh=YD1OJKovdpUC2Nge/ZjqMz79WqqUoI25lGdOW5MoehI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PZXX2W6RNRlTqrmztC79E5BBIVyljue38SLdUj/p/ZS307UNqPuV73AIsqKd5jG1I
	 OIWlXPotpmyy+vZVXp6GafzYnNLHw15+BUry962ZktCXx4el2Skjr8ZnktIVwnU3H7
	 9feHhN/BEwGdC8DyxAmo+U1KvIZhVHGOL/6a7/KBXUakwVvuZ4VB8It2Z3d2gRdUk+
	 GEN53BWaaMAE0VZmk9qriEs1aGmHCr4ApdGkU6YqZp8Xkx9t7KnQL+BDd3g0M03vt/
	 vIC5AM57MoUke84jZE5StPkHHf5TX3kF9xCCaiSGDtzLZNV3Zq4mT/Hvi5TOBZiakc
	 Mhy+2SFXEUFiA==
Received: by mail-ej1-f42.google.com with SMTP id n20so7653737ejh.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 19:10:38 -0800 (PST)
X-Gm-Message-State: ANoB5pnBpfTODS7xHVIPmcRRIXwnc+fxhEyFY7haY7lhvNnHht1hiDfV
	K4HK4S2j01WhLalBy8j55KM5MZsDCIQrd1U9Ozo=
X-Google-Smtp-Source: AA0mqf6TIhBpeP0+xVLy/EvmK+MlW24iYChU/EM7k8ZNUPEi0pw7Pw4UlfzMrJlveaufFxxSKUT5vzy8mMGV8awgcNs=
X-Received: by 2002:a17:906:4e8c:b0:7ba:9c18:1204 with SMTP id
 v12-20020a1709064e8c00b007ba9c181204mr7071645eju.262.1669345836283; Thu, 24
 Nov 2022 19:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
 <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com> <CAAYs2=ifvfY3QW07LXL+B6KH6b3EELMcXuz6ja_rYNE=G4+=qQ@mail.gmail.com>
In-Reply-To: <CAAYs2=ifvfY3QW07LXL+B6KH6b3EELMcXuz6ja_rYNE=G4+=qQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 25 Nov 2022 11:10:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ6hEyfpo1wTUp1UwAGP1kMpEYjLqR-fz6UrCMjHN1VuQ@mail.gmail.com>
Message-ID: <CAJF2gTQ6hEyfpo1wTUp1UwAGP1kMpEYjLqR-fz6UrCMjHN1VuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_191041_823425_28C30A1D 
X-CRM114-Status: GOOD (  34.04  )
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

T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgOTo1MyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLl
ubQxMeaciDI05pel5ZGo5ZubIDE1OjMx5YaZ6YGT77yaCj4gPgo+ID4gT24gVGh1LCBOb3YgMjQs
IDIwMjIgYXQgMToyNyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4g5LqOMjAyMuW5tDEx5pyI
MjPml6XlkajkuIkgMjM6MDLlhpnpgZPvvJoKPiA+ID4gPgo+ID4gPiA+IENvb2wgam9iLCB0aHgu
Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAxMDoyMCBQTSBTb25nIFNo
dWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBUaGlz
IHBhdGNoIGFkZHMgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBmb3Ig
UklTQy1WLgo+ID4gPiA+Pgo+ID4gPiA+PiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJVEhf
RElSRUNUX0NBTExTIHRvIHByb3ZpZGUgdGhlCj4gPiA+ID4+IHJlZ2lzdGVyX2Z0cmFjZV9kaXJl
Y3RbX211bHRpXSBpbnRlcmZhY2VzIGFsbG93aW5nIHVzZXJzIHRvIHJlZ2lzdGVyCj4gPiA+ID4+
IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJlY3RfY2FsbGVyKSBhcyB0aGUgbWNvdW50IGZv
ciBvbmUgb3IKPiA+ID4gPj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBBbmQgbW9kaWZ5X2Z0cmFj
ZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+ID4gPiA+PiBwcm92aWRlZCBmb3IgbW9kaWZ5aW5n
IGRpcmVjdF9jYWxsZXIuCj4gPiA+ID4+Cj4gPiA+ID4+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxs
ZXIgYW5kIHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiA+ID4g
Pj4gdHJhY2VyLCBrW3JldF1wcm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3RlciBp
cyBub21pbmF0ZWQgdG8KPiA+ID4gPj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxl
ciBpbiBmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+ID4gPiA+PiBzZXR0aW5nIG9mIHRo
ZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4gPiA+
ID4+IFJFU1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsIGRpcmVjdF9jYWxsZXIgd2ls
bCBiZSBqdW1wZWQgdG8KPiA+ID4gPj4gYnkgdGhlIGBqcmAgaW5zdC4KPiA+ID4gPj4KPiA+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4g
PiA+PiAtLS0KPiA+ID4gPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAxICsK
PiA+ID4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggfCA2ICsrKysrKwo+ID4g
PiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TICB8IDQgKysrKwo+ID4gPiA+PiAg
MyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiA+ID4+Cj4gPiA+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gPj4g
aW5kZXggMzllYzhkNjI4Y2Y2Li5kMDgzZWMwOGQwYjYgMTAwNjQ0Cj4gPiA+ID4+IC0tLSBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4g
Pj4gQEAgLTI3OCw2ICsyNzgsNyBAQCBjb25maWcgQVJDSF9SVjY0SQo+ID4gPiA+PiAgICAgICAg
IHNlbGVjdCBBUkNIX1NVUFBPUlRTX0lOVDEyOCBpZiBDQ19IQVNfSU5UMTI4Cj4gPiA+ID4+ICAg
ICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYm
ICQoY2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPiA+ID4+ICAgICAg
ICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlmIEhBVkVfRFlOQU1JQ19G
VFJBQ0UKPiA+ID4gPj4gKyAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJ
UkVDVF9DQUxMUwo+ID4gPiA+PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVD
T1JEIGlmICFYSVBfS0VSTkVMCj4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05f
R1JBUEhfVFJBQ0VSCj4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fVFJBQ0VS
IGlmICFYSVBfS0VSTkVMICYmICFQUkVFTVBUSU9OCj4gPiA+ID4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJh
Y2UuaAo+ID4gPiA+PiBpbmRleCAwMWJlYmIyOGVhYmUuLmJlNGQ1NzU2NjEzOSAxMDA2NDQKPiA+
ID4gPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiA+PiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiA+ID4+IEBAIC0xMTQsNiArMTE0
LDEyIEBAIHN0cnVjdCBmdHJhY2VfcmVnczsKPiA+ID4gPj4gIHZvaWQgZnRyYWNlX2dyYXBoX2Z1
bmModW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gPiA+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRyYWNl
X3JlZ3MgKmZyZWdzKTsKPiA+ID4gPj4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNl
X2dyYXBoX2Z1bmMKPiA+ID4gPj4gKwo+ID4gPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGFyY2hf
ZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBs
b25nIGFkZHIpCj4gPiA+ID4+ICt7Cj4gPiA+ID4+ICsgICAgICAgICAgICAgICByZWdzLT50MSA9
IGFkZHI7Cj4gPiA+ID4KPiA+ID4gPiBIb3cgYWJvdXQgcmVncy0+dDAgPSBhZGRyOyA/Cj4gPiA+
ID4gQW5kIGRlbGV0ZSBhbGwgbWNvdW50LWR5bi5TIG1vZGlmaWNhdGlvbi4KPiA+ID4gPgo+ID4g
PiBUaGUgZGlyZWN0X2NhbGxlciBoYXMgdGhlIHNhbWUgcHJvZ3JhbSBsYXlvdXQgYXMgdGhlIGZ0
cmFjZV9jYWxsZXIsIHdoaWNoIG1lYW5zCj4gPiA+IHRoZSByZWcgdDAgd2lsbCBuZXZlciBiZSBj
aGFuZ2VkIHdoZW4gZGlyZWN0X2NhbGxlciByZXR1cm5zLgo+ID4gPgo+ID4gPiBJZiByZWdzLT50
MCBjaGFuZ2VzIGhlcmUgYW5kIGZ0cmFjZV9yZWdzX2NhbGxlciBleGVjdXRlcyBganIgdDBgLAo+
ID4gPiBkaXJlY3RfY2FsbGVyIHdpbGwgZW50ZXIgdGhlIGRlYWQgbG9vcC4KPiA+ID4KPiA+ID4g
QWN0dWFsbHkgdGhlIHJlZyB0MCBhbHdheXMgc2F2ZXMgdGhlIGFkZHJlc3Mgb2YgZnVuY3Rpb24g
ZW50cnkgd2l0aCA4Qgo+ID4gPiBvZmZzZXQsIGl0IHNob3VsZCBvbmx5Cj4gPiA+IGNoYW5nZWQg
YnkgdGhlIElQTU9ESUZZIG9wcyBpbnN0ZWFkIG9mIHRoZSBkaXJlY3Rfb3BzLgo+ID4gSG93IGFi
b3V0Ogo+ID4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVy
KHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ID4gdW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gewo+ID4g
ICAgICAgICAgICAgICAgcmVncy0+dDEgPSByZWdzLT50MDsKPiA+ICAgICAgICAgICAgICAgIHJl
Z3MtPnQwID0gYWRkcjsKPiA+Cj4gPiBkaXJlY3RfY2FsbGVyOgo+ID4gYWRkIHNwLHNwLC0/Cj4g
PiBzZCB0MSw/KHNwKQo+IGRpcmVjdF9jYWxsZXIgYWxzbyBzZXJ2ZXMgYXMgdGhlIGZpcnN0IHRy
YW1wb2xpbmUgYXMgZnRyYWNlX2NhbGxlciwgbGlrZSB0aGlzOgo+IGBgYAo+IGZ1bmMgLS0gZGly
ZWN0X2NhbGxlcgo+ICAgICAgICAgLS0gZnRyYWNlX1tyZWdzXV9jYWxsZXIKPiBgYGAKPiBTbyB0
aGUgdDEgaW4gdGhpcyBsaW5lIGhhcyB0byBiZSB0MCB0byBzYXZlIHRoZSBQQy4KCmRpcmVjdF9j
YWxsZXI6CmFkZCBzcCxzcCwtPwpzZCB0MSw/KHNwKQpzZCB0MCwgPyhzbykKc2QgcmEsPyhzcCkK
bW92IHQwLCB0MQpjYWxsIGZvbwpsZCB0MCw/KHNwKQpsZCB0MSw/KHNwKQpsZCByYSw/KHNwKQph
ZGQgc3Asc3AsPwpqciB0MSAvLyA8LSBiYWNrIHRvIGZ1bmN0aW9uIGVudHJ5CgoKCj4gPiBzZCBy
YSw/KHNwKQo+ID4gY2FsbCBmb28KPiA+IGxkIHQxLD8oc3ApCj4gQW5kIHRoaXMgbGluZS4KPiA+
IGxkIHJhLD8oc3ApCj4gPiBhZGQgc3Asc3AsPwo+ID4ganIgdDEgLy8gPC0gYmFjayB0byBmdW5j
dGlvbiBlbnRyeQo+ID4KPiA+IEFuZCBkZWxldGUgYWxsIG1jb3VudC1keW4uUyBtb2RpZmljYXRp
b24uCj4gPgo+ID4gPiA+Pgo+ID4gPiA+PiArfQo+ID4gPiA+PiArCj4gPiA+ID4+ICAjZW5kaWYg
LyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+ID4gPiA+Pgo+ID4gPiA+PiAg
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4g
PiA+ID4+IGluZGV4IDQ2NmM2ZWYyMTdiMS4uYjg5Yzg1YTU4NTY5IDEwMDY0NAo+ID4gPiA+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+ID4gPj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPiA+ID4+IEBAIC0yMzMsNiArMjMzLDcgQEAgRU5E
UFJPQyhmdHJhY2VfY2FsbGVyKQo+ID4gPiA+PiAgI2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRS
QUNFX1dJVEhfUkVHUyAqLwo+ID4gPiA+PiAgRU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+ID4g
PiA+PiAgICAgICAgIFNBVkVfQUJJX1JFR1MgMQo+ID4gPiA+PiArICAgICAgIFJFR19TICAgeDAs
IFBUX1QxKHNwKQo+ID4gPiA+PiAgICAgICAgIFBSRVBBUkVfQVJHUwo+ID4gPiA+Pgo+ID4gPiA+
PiAgZnRyYWNlX3JlZ3NfY2FsbDoKPiA+ID4gPj4gQEAgLTI0MSw3ICsyNDIsMTAgQEAgZnRyYWNl
X3JlZ3NfY2FsbDoKPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4gICAgICAgICBSRVNUT1JFX0FC
SV9SRUdTIDEKPiA+ID4gPj4gKyAgICAgICBibmV6ICAgIHQxLC5MZGlyZWN0Cj4gPiA+ID4+ICAg
ICAgICAganIgdDAKPiA+ID4gPj4gKy5MZGlyZWN0Ogo+ID4gPiA+PiArICAgICAgIGpyIHQxCj4g
PiA+ID4+ICBFTkRQUk9DKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiA+ID4gPj4KPiA+ID4gPj4gIEVO
VFJZKGZ0cmFjZV9jYWxsZXIpCj4gPiA+ID4+IC0tCj4gPiA+ID4+IDIuMjAuMQo+ID4gPiA+Pgo+
ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiA+ICBH
dW8gUmVuCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgo+
IFRoYW5rcywKPiBTb25nCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
