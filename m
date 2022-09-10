Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4186EECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Sep 2022 02:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/B7sufKIlr6TPgjBR74uM2Al6zFwSXpQiL0jz+KY50=; b=GqTS8b9FanhFzh
	K0cSuZ6GGZBlXZXov6uMtSub9Ns9zPRQoHm7HcqgfGkH4cjekhyJHCX8MtIJ0cBcxqKoF2e4DqpNk
	rtk2q22X+meXikSTqxQCVObKB/8R65AnNG+SLQMHWEXzzh98PTZWh0ynX113YugDrhx12ECbxpYrf
	xYguVZedDvgSGmBa+abhkuzeU8kBZWzrf9IevHkChKwTWBAosriqYKZ3p0dnm03fPCJchP/j7epvI
	0XwNSi4ks+ak4jwZlz90GB+JedwT4epJGPgWH2ZtxJLciZ2gKo46Mw2puN/tTkT9GGm+MgGq1jWmt
	jfr59rSgeUenJsUobdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWqAp-0058hf-NK; Sat, 10 Sep 2022 02:24:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWqAm-0058eT-Mh
	for linux-riscv@lists.infradead.org; Sat, 10 Sep 2022 02:24:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2863FB826BB;
	Sat, 10 Sep 2022 02:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36DEC433D6;
	Sat, 10 Sep 2022 02:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662776680;
	bh=io4rGpmTLzIQymApR1FQ0JROcbXXYwJLqgIkb1TY2S8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tLD7rq2saOfG/rFAIfRZpvIHMOn1+gVhCmWZrtJ4ki2GqYpEacMGF5FCD5Ou/YcEq
	 zJVUjxYa/74Fkkni/kUYRRhSclC3pHAvTW28gA0aCep9pv0ayLipgnwApUroTnmWsB
	 9+68GHJQkIIEBIwESEC7x5XczfkTIezQR3pAAQSs79PDWQaD+PB/euT9xohkugI26M
	 VfOq6qIsx468UU10ruL6tAwHbquav439G+XDYkRw/UBBU/E56oJR4TF1+PxTKZ1Exh
	 wLG5+nuqEnT65nzzHAFDvTSjuiEFL648riBG6d/nHrXvVXNOk/eFdpUL3hASgcF2/m
	 VqTVeu1hbxaUA==
Date: Sat, 10 Sep 2022 11:24:35 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
Message-Id: <20220910112435.3c3f72afee5182f7ec1c1ce6@kernel.org>
In-Reply-To: <50a65f24-08b7-ab36-5e25-b6a90f90a9d8@huawei.com>
References: <20220907023327.85630-1-liaochang1@huawei.com>
	<YxjTF2FlIJbbKq0p@xhacker>
	<a00328a1-47ee-3700-8cd8-1a9f4e0d7a2b@huawei.com>
	<20220908214958.c8139533dccad1ee8f927214@kernel.org>
	<50a65f24-08b7-ab36-5e25-b6a90f90a9d8@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_192445_058917_EDAA3DEA 
X-CRM114-Status: GOOD (  27.89  )
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

T24gRnJpLCA5IFNlcCAyMDIyIDA5OjU1OjA4ICswODAwCiJsaWFvY2hhbmcgKEEpIiA8bGlhb2No
YW5nMUBodWF3ZWkuY29tPiB3cm90ZToKPiAKPiAKPiDlnKggMjAyMi85LzggMjA6NDksIE1hc2Ft
aSBIaXJhbWF0c3UgKEdvb2dsZSkg5YaZ6YGTOgo+ID4gT24gVGh1LCA4IFNlcCAyMDIyIDA5OjQz
OjQ1ICswODAwCj4gPiAibGlhb2NoYW5nIChBKSIgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4gPiAKPiA+PiBUaGFua3MgZm9yIGNvbW1lbnQuCj4gPj4KPiA+PiDlnKggMjAyMi85Lzgg
MToyMSwgSmlzaGVuZyBaaGFuZyDlhpnpgZM6Cj4gPj4+IE9uIFdlZCwgU2VwIDA3LCAyMDIyIGF0
IDEwOjMzOjI3QU0gKzA4MDAsIExpYW8gQ2hhbmcgd3JvdGU6Cj4gPj4+PiBTaW5jZSBubyByYWNl
IGNvbmRpdGlvbiBvY2N1cnMgb24gZWFjaCBpbnN0cnVjdGlvbiBzbG90LCBoZW5jZSBpdCBpcwo+
ID4+Pj4gc2FmZSB0byBwYXRjaCBpbnN0cnVjdGlvbiBzbG90IHdpdGhvdXQgc3RvcHBpbmcgbWFj
aGluZS4KPiA+Pj4KPiA+Pj4gaG1tLCBJTUhPIHRoZXJlJ3MgcmFjZSB3aGVuIGFybWluZyBrcHJv
YmUgdW5kZXIgU01QLCBzbyBzdG9wcGluZwo+ID4+PiBtYWNoaW5lIGlzIG5lY2Vzc2FyeSBoZXJl
LiBNYXliZSBJIG1pc3VuZGVydGFuZCBzb21ldGhpbmcuCj4gPj4+Cj4gPj4KPiA+PiBJdCBpcyBp
bmRlZWQgbmVjZXNzYXJ5IHRvIHN0b3AgbWFjaGluZSB3aGVuIGFybSBrcHJvYmUgdW5kZXIgU01Q
LAo+ID4+IGJ1dCBpIGRvbid0IHRoaW5rIGl0IG5lZWQgdG8gc3RvcCBtYWNoaW5lIHdoZW4gcHJl
cGFyZSBpbnN0cnVjdGlvbiBzbG90LAo+ID4+IHR3byByZWFzb25zOgo+ID4+Cj4gPj4gMS4gSW5z
dHJ1Y3Rpb24gc2xvdCBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQgZGF0YS4KPiA+PiAyLiBLZXJu
ZWwgd291bGQgbm90IGV4ZWN1dGUgaW5zdHJ1Y3Rpb24gc2xvdCB1bnRpbCBvcmlnaW5hbCBpbnN0
cnVjdGlvbgo+ID4+ICAgIGlzIHJlcGxhY2VkIGJ5IGJyZWFrcG9pbnQuCj4gPiAKPiA+IEFoLCB0
aGlzIGlzIGZvciBzcyAoc2luZ2xlIHN0ZXAgb3V0IG9mIGxpbmUpIHNsb3QuIFNvIHVudGlsCj4g
PiBrcHJvYmUgaXMgZW5hYmxlZCwgdGhpcyBzaG91bGQgbm90IGJlIHVzZWQgZnJvbSBvdGhlciBj
b3Jlcy4KPiA+IE9LLCB0aGVuIGl0IHNob3VsZCBiZSBzYWZlLgo+IAo+IEV4YWN0bHksIE1hc2Ft
aSwgYW5kIGkgZmluZCBvdXQgdGhpcyBvcHRpbWl6YXRpb24gY291bGQgYmUgYXBwbGllZCB0byBz
b21lIG90aGVyCj4gYXJjaGl0ZWN0dXJlcywgc3VjaCBhcyBhcm02NCBhbmQgY3NreSwgZG8geW91
IHRoaW5rIGl0IGlzIGdvb2QgdGltZSB0byBkbyB0aGVtIGFsbC4KClllcywgd2Ugc2hvdWxkIHJl
ZHVjZSB0aGUgc3RvcF9tYWNoaW5lKCkgdXNhZ2UuIFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQhCgo+
IAo+IFRoYW5rcy4KPiAKPiA+IAo+ID4gCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTGlh
byBDaGFuZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDggKysrKystLS0KPiA+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4+Pj4gaW5kZXggZTZlOTUwYjdjZjMyLi5lZmY3
ZDdmYWI1MzUgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jCj4gPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4g
Pj4+PiBAQCAtMjQsMTIgKzI0LDE0IEBAIHBvc3Rfa3Byb2JlX2hhbmRsZXIoc3RydWN0IGtwcm9i
ZSAqLCBzdHJ1Y3Qga3Byb2JlX2N0bGJsayAqLCBzdHJ1Y3QgcHRfcmVncyAqKTsKPiA+Pj4+ICBz
dGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX3NzX3Nsb3Qoc3RydWN0IGtwcm9iZSAq
cCkKPiA+Pj4+ICB7Cj4gPj4+PiAgCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gR0VUX0lOU05fTEVO
R1RIKHAtPm9wY29kZSk7Cj4gPj4+PiArCWNvbnN0IGtwcm9iZV9vcGNvZGVfdCBicmtfaW5zbiA9
IF9fQlVHX0lOU05fMzI7Cj4gPj4+PiArCWtwcm9iZV9vcGNvZGVfdCBzbG90W01BWF9JTlNOX1NJ
WkVdOwo+ID4+Pj4gIAo+ID4+Pj4gIAlwLT5haW5zbi5hcGkucmVzdG9yZSA9ICh1bnNpZ25lZCBs
b25nKXAtPmFkZHIgKyBvZmZzZXQ7Cj4gPj4+PiAgCj4gPj4+PiAtCXBhdGNoX3RleHQocC0+YWlu
c24uYXBpLmluc24sIHAtPm9wY29kZSk7Cj4gPj4+PiAtCXBhdGNoX3RleHQoKHZvaWQgKikoKHVu
c2lnbmVkIGxvbmcpKHAtPmFpbnNuLmFwaS5pbnNuKSArIG9mZnNldCksCj4gPj4+PiAtCQkgICBf
X0JVR19JTlNOXzMyKTsKPiA+Pj4+ICsJbWVtY3B5KHNsb3QsICZwLT5vcGNvZGUsIG9mZnNldCk7
Cj4gPj4+PiArCW1lbWNweSgodm9pZCAqKSgodW5zaWduZWQgbG9uZylzbG90ICsgb2Zmc2V0KSwg
JmJya19pbnNuLCA0KTsKPiA+Pj4+ICsJcGF0Y2hfdGV4dF9ub3N5bmMocC0+YWluc24uYXBpLmlu
c24sIHNsb3QsIG9mZnNldCArIDQpOwo+ID4gCj4gPiBCVFcsIGRpZG4ndCB5b3UgaGF2ZSBhIG1h
Y3JvIGZvciB0aGUgc2l6ZSBvZiBfX0JVR19JTlNOXzMyPwo+ID4gCj4gPiBUaGFuayB5b3UsCj4g
Cj4gSSB0aGluayB5b3UgYXJlIHNheWluZyBHRVRfSU5TTl9MRU5HVEgsIGkgd2lsbCB1c2UgaXQg
dG8gY2FjdWxhdGUKPiB0aGUgc2l6ZSBvZiBfX0JVR19JTlNOXzMyIGluIHYyLCBpbnN0ZWFkIG9m
IG1hZ2ljIG51bWJlciAnNCcuCgoKWWVhaCwgdGhhdCdzIGJldHRlci4KClRoYW5rIHlvdSEKCj4g
Cj4gVGhhbmtzLgo+IAo+ID4gCj4gPiAKPiA+Pj4+ICB9Cj4gPj4+PiAgCj4gPj4+PiAgc3RhdGlj
IHZvaWQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+
ID4+Pj4gLS0gCj4gPj4+PiAyLjE3LjEKPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+ID4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+Pj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+
ID4+PiAuCj4gPj4KPiA+PiAtLSAKPiA+PiBCUiwKPiA+PiBMaWFvLCBDaGFuZwo+ID4gCj4gPiAK
PiAKPiAtLSAKPiBCUiwKPiBMaWFvLCBDaGFuZwoKCi0tIApNYXNhbWkgSGlyYW1hdHN1IChHb29n
bGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
