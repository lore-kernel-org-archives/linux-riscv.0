Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97282C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 04:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIYTwm4vmcxuJcTF40oXHe1lY4HFS0wp6RDwRJOaQPI=; b=HRYMsf3PKYc+Qx
	Z/r7M5QGV44sGWWfILRNJWGP/fqtq40xb+e6O70aH9x63azD5HXGaPb/P0kMhzPlotIrq8XIclZLS
	gDtwjw13upm6r/8FZZwR7hMATwmeGBseaGcJ5amVJmsvPDeL29syXVQzmj+UE97APyARcsQ3pwRt/
	7Iniav8Ct6+SQkWMUQVKtakmAE3hYaTAIYVS4MLdxTv7VwX5Q1YYPF+JTnx7va2YQHEvEU7eOJTkg
	rl0hHUBeYoKxiLFVFJS70E6ttNCHjMKgX3mEL+Z8Ji9EfD6CBLueB8GMEbNt00mWIYEyX11QufYHf
	5iJ/gN4RX/DdbObOcQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTbh-000SxY-CL; Sat, 31 Dec 2022 04:36:29 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTbd-000St9-HU
	for linux-riscv@lists.infradead.org; Sat, 31 Dec 2022 04:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672461372; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JQdUWp1o75bn5Cm6C7l8IRKkaAqi68sc936SBl6G1IK4mNvCmGGe/lPLTCja8CWImORj2rOE0TowDYRu/AGGfHyYyDlQduBx00MeCWbHJLkAEYoG6sK5hpG7G0ZFD9Pc/HUwd+OftRioA9bKt7NLhm4niKFF5ZV53GeWwWh0Qio=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672461372; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UZUtlTKpQdPfubcQzf2LyoQlsOR8ISvYrlk080SW5kw=; 
	b=VNykuMGWFgnD0l92ENbYSiYzHz3Hn2xd2Wqxp30ctE6hHvcp3KSwbala7ssa7VoNe6o1MXE/hoHkFI+eZ40V/ctlXQ96VahywGYcGfIUtKzC9OtMaUKaM9FD9VaJ9g0eA961RoBSO0rCHXxS7C0D+aaS3YDiOMJAHXl12Q69Osg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672461372;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=UZUtlTKpQdPfubcQzf2LyoQlsOR8ISvYrlk080SW5kw=;
	b=Z3C94yCn3uAtN7rcoUjw4ddTfVUjfEroMCME1T4QtV0QWBmFJaPJlqr3CysNZB7C
	kwXV5U1l6R5QdCnc7y8eHmkBqIgnKffQvTfNAZwBSt0ey4MDnnGvNP1QlHKPCZcCYSl
	Sz7rtFnSzGHFVnf1+Is5f6nAArDfCAKQ/pQE6H/4=
Received: from edelgard.fodlan.icenowy.me (120.85.97.2 [120.85.97.2]) by mx.zohomail.com
	with SMTPS id 1672461369384205.65724335826928; Fri, 30 Dec 2022 20:36:09 -0800 (PST)
Message-ID: <5818a83e644eb9c868d4cf65117983e08ba1c17f.camel@icenowy.me>
Subject: Re: [PATCH 1/2] riscv: errata: fix T-Head dcache.cva encoding
From: Icenowy Zheng <uwu@icenowy.me>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>,  Nathan Chancellor <nathan@kernel.org>,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Sat, 31 Dec 2022 12:36:04 +0800
In-Reply-To: <Y69iNMQ60gXYkKus@curiosity>
References: <20221227020258.303900-1-uwu@icenowy.me>
	 <CAJF2gTSGvEnTqEqR9f+zU8T3VS8FoCtsgSk=9hz6cWxAL630zQ@mail.gmail.com>
	 <Y69iNMQ60gXYkKus@curiosity>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_203625_697670_FDF5DFB2 
X-CRM114-Status: GOOD (  24.25  )
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

5ZyoIDIwMjItMTItMzHmmJ/mnJ/lha3nmoQgMDE6MTIgKzAzMDDvvIxTZXJnZXkgTWF0eXVrZXZp
Y2jlhpnpgZPvvJoKPiA+ID4gVGhlIGRjYWNoZS5jdmEgZW5jb2Rpbmcgc2hvd24gaW4gdGhlIGNv
bW1lbnRzIGFyZSB3cm9uZywgaXQncyBmb3IKPiA+ID4gZGNhY2hlLmN2YWwxICh3aGljaCBpcyBy
ZXN0cmljdGVkIHRvIEwxKSBpbnN0ZWFkLgo+ID4gPiAKPiA+ID4gRml4IHRoaXMgaW4gdGhlIGNv
bW1lbnQgYW5kIGluIHRoZSBoYXJkY29kZWQgaW5zdHJ1Y3Rpb24uCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gLS0tCj4gPiA+
IFRoZSBjb2RlIGlzIHRlc3RlZCBvbiBhIExpdGVYIFNvQyB3aXRoIE9wZW5DOTA2IGNvcmUsIGFu
ZCBpdAo+ID4gPiBzdWNjZXNzZnVsbHkgYm9vdHMgdG8gU3lzdGVtZCBvbiBhIFNEIGNhcmQgY29u
bmVjdGVkIHRvCj4gPiA+IExpdGVTRENhcmQuCj4gPiA+IAo+ID4gPiBUaGlzIGNoYW5nZSBzaG91
bGQgYmUgbm90IG5vdGljYWJsZSBvbiBDOTA2LCBidXQgb24gbXVsdGktY29yZQo+ID4gPiBDOTEw
Cj4gPiA+IGNsdXN0ZXIgaXQgc2hvdWxkIGZpeGVzIHNvbWV0aGluZy4gVW5mb3J0dW5hdGVseSBU
SDE1MjAgc2VlbXMgdG8KPiA+ID4gYmUgbm90Cj4gPiA+IHNvIHJlYWR5IHRvIHRlc3QgbWFpbmxp
bmUgcGF0Y2hlcyBvbi4KPiA+ID4gCj4gPiA+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJh
dGFfbGlzdC5oIHwgNCArKy0tCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKPiA+ID4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vy
cmF0YV9saXN0LmgKPiA+ID4gaW5kZXggNDE4MDMxMmQyYTcwLi42MDU4MDBiZDM5MGUgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKPiA+ID4gQEAgLTEwMiw3
ICsxMDIsNyBAQCBhc20KPiA+ID4gdm9sYXRpbGUoQUxURVJOQVRJVkUowqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiA+ID4gwqAgKiB8IDMxIC0gMjUgfCAyNCAtIDIwIHwgMTkgLSAxNSB8
IDE0IC0gMTIgfCAxMSAtIDcgfCA2IC0gMCB8Cj4gPiA+IMKgICrCoMKgIDAwMDAwMDHCoMKgwqAg
MDEwMDHCoMKgwqDCoMKgIHJzMcKgwqDCoMKgwqDCoCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAgMDAw
MTAxMQo+ID4gPiDCoCAqIGRjYWNoZS5jdmEgcnMxIChjbGVhbiwgdmlydHVhbCBhZGRyZXNzKQo+
ID4gPiAtICrCoMKgIDAwMDAwMDHCoMKgwqAgMDAxMDDCoMKgwqDCoMKgIHJzMcKgwqDCoMKgwqDC
oCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAgMDAwMTAxMQo+ID4gPiArICrCoMKgIDAwMDAwMDHCoMKg
wqAgMDAxMDHCoMKgwqDCoMKgIHJzMcKgwqDCoMKgwqDCoCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAg
MDAwMTAxMQo+ID4gPiDCoCAqCj4gPiA+IMKgICogZGNhY2hlLmNpcGEgcnMxIChjbGVhbiB0aGVu
IGludmFsaWRhdGUsIHBoeXNpY2FsIGFkZHJlc3MpCj4gPiA+IMKgICogfCAzMSAtIDI1IHwgMjQg
LSAyMCB8IDE5IC0gMTUgfCAxNCAtIDEyIHwgMTEgLSA3IHwgNiAtIDAgfAo+ID4gPiBAQCAtMTE1
LDcgKzExNSw3IEBAIGFzbQo+ID4gPiB2b2xhdGlsZShBTFRFUk5BVElWRSjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+ID4gPiDCoCAqwqDCoCAwMDAwMDAwwqDCoMKgIDExMDAxwqDCoMKg
wqAgMDAwMDDCoMKgwqDCoMKgIDAwMMKgwqDCoMKgwqAgMDAwMDDCoCAwMDAxMDExCj4gPiA+IMKg
ICovCj4gPiA+IMKgI2RlZmluZSBUSEVBRF9pbnZhbF9BMCAiLmxvbmcgMHgwMjY1MDAwYiIKPiA+
ID4gLSNkZWZpbmUgVEhFQURfY2xlYW5fQTAgIi5sb25nIDB4MDI0NTAwMGIiCj4gPiA+ICsjZGVm
aW5lIFRIRUFEX2NsZWFuX0EwICIubG9uZyAweDAyNTUwMDBiIgo+ID4gPiDCoCNkZWZpbmUgVEhF
QURfZmx1c2hfQTAgIi5sb25nIDB4MDI3NTAwMGIiCj4gPiA+IMKgI2RlZmluZSBUSEVBRF9TWU5D
X1PCoMKgICIubG9uZyAweDAxOTAwMDBiIgo+IAo+IE5pY2UgY2F0Y2ggISBJIGV4cGVyaW1lbnRl
ZCB3aXRoIFQtSGVhZCBSVkItSUNFIGJvYXJkIG9uIHRoZSB1cC10by0KPiBkYXRlCj4gdXBzdHJl
YW0ga2VybmVsLCB1c2luZyBkZXZpY2UgdHJlZSBhbmQgc29tZSBvdGhlciBiaXRzIGZyb20gdGhl
Cj4gdmVuZG9yCj4ga2VybmVsIFsxXS4gV2l0aG91dCB0aGlzIHBhdGNoLCBlbW1jIG9uIHRoaXMg
Ym9hcmQgZG9lcyBub3Qgd29yawo+IHNpbmNlCj4gbm9uY29oZXJlbnQgZG1hIHN5bmMgb3BlcmF0
aW9ucyB1c2UgaW5jb3JyZWN0ICdjbGVhbicgaW5zdHJ1Y3Rpb24uCj4gQXBwbHlpbmcgdGhpcyBw
YXRjaCBmaXhlcyBlbW1jIG9wZXJhdGlvbnMsIHNvCgpUaGFua3MgZm9yIHRlc3Rpbmcgb24gQzkx
MCEgSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIHdpbGwgbWFrZSBhCnNpZ25pZmljYW50IGRpZmZl
cmVuY2Ugb24gQzkwNiwgc28gaXQncyB2YWx1YWJsZSEKCj4gCj4gVGVzdGVkLWJ5OiBTZXJnZXkg
TWF0eXVrZXZpY2ggPHNlcmdleS5tYXR5dWtldmljaEBzeW50YWNvcmUuY29tPgo+IAo+IFsxXSBo
dHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvbGludXgvdHJlZS9saW51eC01LjEwLjQKPiAK
PiBSZWdhcmRzLAo+IFNlcmdleQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
