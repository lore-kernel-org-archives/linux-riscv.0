Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FF1C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 21:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4E82081F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 21:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUFirRD0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QtbV06ew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4E82081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWFqiI7OzO60XwgjpfLasF5N+a+ZIuYqH3YjXjGs9Js=; b=QUFirRD0zioj9J7RCiBIg/psf
	PFE9r0hK7L8ocu/BCscI6Hv/zHot6lO/wrN+K7hXtUDEm5BX1EOhIYv9rhbJ3WirDPJVYrAKK5YfY
	godAyQgRepe5C6rU4ZX0RFRUTTmsU3mEeB5fFCJE3jWqtV5ugQmsuPBVHmM2PAuq4X+IuRYRtxe17
	2UA20TfUKNTkCEb+bDBaYlW4HXMvSv5KUCvLf9xSUdtdKJ88DEAUE4dL3nCTQS+MIL0kRrkZKLmTx
	vUZCXPyNoLyXToNjhI+IfBVvpc+Yv5osqP0L+bNrAApuk0qZgZNQdwVBe9jjmEqt/FAbxLEkZfDAx
	FAIHjNgPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIgmF-0008VP-GB; Fri, 02 Nov 2018 21:14:47 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIgmB-00081c-Lc
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 21:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541193284; x=1572729284;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4+i51fRxigkTF2mXa0noRy1cmn2afNEARp6SCWUQGdI=;
 b=QtbV06ewDeb0CoxBhVxfgXsjdnDAfJ4GT8g/G3IUCAKa7dTAKr0TogFx
 FH2ngg5jKQ/Bk80Qx/YAEJ9ZnIuTWVDZss4Rsn+3i2p4BYbpYiArlv/8/
 OmRiP8LSF2AkH/N/OYUtJ7no6VifO1XCYTAaQ1baSHS0RHcKI+WUZN5Am
 A1AobzCXIZU7ZFKn8ZaQLs96I9l4Cl5c265OsQyr4euuSXf8sNajXgz0n
 gYrdhRH2uSlsud2PcVyeAUNoGONoSlUxGr1hiLu/UaONOFkODEi5t5G93
 b0TzLEUP82HuLE3ahCwi1mDA9IOgbkbys1dj2gwpj928MXCk+q/LYJqDe w==;
X-IronPort-AV: E=Sophos;i="5.54,457,1534780800"; d="scan'208";a="95120965"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Nov 2018 05:14:32 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Nov 2018 13:58:15 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Nov 2018 14:14:31 -0700
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
To: Nick Kossifidis <mick@ics.forth.gr>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <9385b2eb-4729-8247-b0ae-1540793d078b@wdc.com>
Date: Fri, 2 Nov 2018 14:14:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_141443_759304_10E412F8 
X-CRM114-Status: GOOD (  26.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "zong@andestech.com" <zong@andestech.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102211430.L4K3zH1Xhkv-UrO5PgjLotK4VSIKJUMYzgBdTdIttgc@z>

T24gMTEvMi8xOCAxMTo1OSBBTSwgTmljayBLb3NzaWZpZGlzIHdyb3RlOgo+IEhlbGxvIEFsbCwK
PiAKPiDOo8+EzrnPgiAyMDE4LTExLTAyIDAxOjA0LCBBdGlzaCBQYXRyYSDOrc6zz4HOsc+IzrU6
Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGNwdSB0b3BvbG9neSBmb3IgUklTQy1WLiBJ
dCBjb250YWlucwo+PiBib3RoIHRoZSBEVCBiaW5kaW5nIGFuZCBhY3R1YWwgc291cmNlIGNvZGUu
IEl0IGhhcyBiZWVuIHRlc3RlZCBvbgo+PiBRRU1VICYgVW5sZWFzaGVkIGJvYXJkLgo+Pgo+PiBU
aGUgaWRlYSBpcyBiYXNlZCBvbiBjcHUtbWFwIGluIEFSTSB3aXRoIGNoYW5nZXMgcmVsYXRlZCB0
byBob3cKPj4gd2UgZGVmaW5lIFNNVCBzeXN0ZW1zLiBUaGUgcmVhc29uIGZvciBhZG9wdGluZyBh
IHNpbWlsYXIgYXBwcm9hY2gKPj4gdG8gQVJNIGFzIEkgZmVlbCBpdCBwcm92aWRlcyBhIHZlcnkg
Y2xlYXIgd2F5IG9mIGRlZmluaW5nIHRoZQo+PiB0b3BvbG9neSBjb21wYXJlZCB0byBwYXJzaW5n
IGNhY2hlIG5vZGVzIHRvIGZpZ3VyZSBvdXQgd2hpY2ggY3B1cwo+PiBzaGFyZSB0aGUgc2FtZSBw
YWNrYWdlIG9yIGNvcmUuICBJIGFtIG9wZW4gdG8gYW55IG90aGVyIGlkZWEgdG8KPj4gaW1wbGVt
ZW50IGNwdS10b3BvbG9neSBhcyB3ZWxsLgo+Pgo+IAo+IEkgd2FzIGFsc28gYWJvdXQgdG8gc3Rh
cnQgYSBkaXNjdXNzaW9uIGFib3V0IENQVSB0b3BvbG9neSBvbiBSSVNDLVYKPiBhZnRlciB0aGUg
bGFzdCBzd3Rvb2xzIGdyb3VwIG1lZXRpbmcuIFRoZSBnb2FsIGlzIHRvIHByb3ZpZGUgdGhlCj4g
c2NoZWR1bGVyIHdpdGggaGludHMgb24gaG93IHRvIGRpc3RyaWJ1dGUgdGFza3MgbW9yZSBlZmZp
Y2llbnRseQo+IGJldHdlZW4gaGFydHMsIGJ5IHBvcHVsYXRpbmcgdGhlIHNjaGVkdWxpbmcgZG9t
YWluIHRvcG9sb2d5IGxldmVscwo+IChodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NC4xOS9pZGVudC9zY2hlZF9kb21haW5fdG9wb2xvZ3lfbGV2ZWwpLgo+IFdoYXQgd2Ugd2FudCB0
byBkbyBpcyBkZWZpbmUgY3B1IGdyb3VwcyBhbmQgYXNzaWduIHRoZW0gdG8KPiBzY2hlZHVsaW5n
IGRvbWFpbnMgd2l0aCB0aGUgYXBwcm9wcmlhdGUgU0RfIGZsYWdzCj4gKGh0dHBzOi8vZ2l0aHVi
LmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9pbmNsdWRlL2xpbnV4L3NjaGVkL3RvcG9s
b2d5LmgjTDE2KS4KPiAKClNjaGVkdWxlciBkb21haW4gdG9wb2xvZ3kgaXMgYWxyZWFkeSBnZXR0
aW5nIGFsbCB0aGUgaGludHMgaW4gdGhlIApmb2xsb3dpbmcgd2F5LgoKc3RhdGljIHN0cnVjdCBz
Y2hlZF9kb21haW5fdG9wb2xvZ3lfbGV2ZWwgZGVmYXVsdF90b3BvbG9neVtdID0gewojaWZkZWYg
Q09ORklHX1NDSEVEX1NNVAogICAgICAgICB7IGNwdV9zbXRfbWFzaywgY3B1X3NtdF9mbGFncywg
U0RfSU5JVF9OQU1FKFNNVCkgfSwKI2VuZGlmCiNpZmRlZiBDT05GSUdfU0NIRURfTUMKICAgICAg
ICAgeyBjcHVfY29yZWdyb3VwX21hc2ssIGNwdV9jb3JlX2ZsYWdzLCBTRF9JTklUX05BTUUoTUMp
IH0sCiNlbmRpZgogICAgICAgICB7IGNwdV9jcHVfbWFzaywgU0RfSU5JVF9OQU1FKERJRSkgfSwK
ICAgICAgICAgeyBOVUxMLCB9LAp9OwoKI2lmZGVmIENPTkZJR19TQ0hFRF9TTVQKc3RhdGljIGlu
bGluZSBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X3NtdF9tYXNrKGludCBjcHUpCnsKICAgICAg
ICAgcmV0dXJuIHRvcG9sb2d5X3NpYmxpbmdfY3B1bWFzayhjcHUpOwp9CiNlbmRpZgoKY29uc3Qg
c3RydWN0IGNwdW1hc2sgKmNwdV9jb3JlZ3JvdXBfbWFzayhpbnQgY3B1KQp7CiAgICAgICAgIHJl
dHVybiAmY3B1X3RvcG9sb2d5W2NwdV0uY29yZV9zaWJsaW5nOwp9CgoKPiBTbyB0aGUgY29yZXMg
dGhhdCBiZWxvbmcgdG8gYSBzY2hlZHVsaW5nIGRvbWFpbiBtYXkgc2hhcmU6Cj4gQ1BVIGNhcGFj
aXR5IChTRF9TSEFSRV9DUFVDQVBBQ0lUWSAvIFNEX0FTWU1fQ1BVQ0FQQUNJVFkpCj4gUGFja2Fn
ZSByZXNvdXJjZXMgLWUuZy4gY2FjaGVzLCB1bml0cyBldGMtIChTRF9TSEFSRV9QS0dfUkVTT1VS
Q0VTKQo+IFBvd2VyIGRvbWFpbiAoU0RfU0hBUkVfUE9XRVJET01BSU4pCj4gCj4gSW4gdGhpcyBj
b250ZXh0IEkgYmVsaWV2ZSB1c2luZyB3b3JkcyBsaWtlICJjb3JlIiwgInBhY2thZ2UiLAo+ICJz
b2NrZXQiIGV0YyBjYW4gYmUgbWlzbGVhZGluZy4gRm9yIGV4YW1wbGUgdGhlIHNhbXBsZSB0b3Bv
bG9neSB5b3UKPiB1c2Ugb24gdGhlIGRvY3VtZW50YXRpb24gc2F5cyB0aGF0IHRoZXJlIGFyZSA0
IGNvcmVzIHRoYXQgYXJlIHBhcnQKPiBvZiBhIHBhY2thZ2UsIGhvd2V2ZXIgInBhY2thZ2UiIGhh
cyBhIGRpZmZlcmVudCBtZWFuaW5nIHRvIHRoZQo+IHNjaGVkdWxlci4gQWxzbyB3ZSBkb24ndCBz
YXkgYW55dGhpbmcgaW4gY2FzZSB0aGV5IHNoYXJlIGEgcG93ZXIKPiBkb21haW4gb3IgaWYgdGhl
eSBoYXZlIHRoZSBzYW1lIGNhcGFjaXR5IG9yIG5vdC4gVGhpcyBtYXBwaW5nIGRlYWxzCj4gb25s
eSB3aXRoIGNhY2hlIGhpZXJhcmNoeSBvciBvdGhlciBzaGFyZWQgcmVzb3VyY2VzLgo+IAo+IEhv
dyBhYm91dCBkZWZpbmluZyBhIGR0IHNjaGVtZSB0byBkZXNjcmliZSB0aGUgc2NoZWR1bGVyIGRv
bWFpbgo+IHRvcG9sb2d5IGxldmVscyBpbnN0ZWFkID8gZS5nOgo+IAo+IDIgc2V0cyAob3IgY2x1
c3RlcnMgaWYgeW91IHByZWZlcikgb2YgMiBTTVQgY29yZXMsIGVhY2ggc2V0IHdpdGgKPiBhIGRp
ZmZlcmVudCBjYXBhY2l0eSBhbmQgcG93ZXIgZG9tYWluOgo+IAo+IHNjaGVkX3RvcG9sb2d5IHsK
PiAgICBsZXZlbDAgeyAvLyBTTVQKPiAgICAgc2hhcmVkID0gInBvd2VyIiwgImNhcGFjaXR5Iiwg
InJlc291cmNlcyI7Cj4gICAgIGdyb3VwMCB7Cj4gICAgICBtZW1iZXJzID0gPCZoYXJ0MD4sIDwm
aGFydDE+Owo+ICAgICB9Cj4gICAgIGdyb3VwMSB7Cj4gICAgICBtZW1iZXJzID0gPCZoYXJ0Mj4s
IDwmaGFydDM+Owo+ICAgICB9Cj4gICAgIGdyb3VwMiB7Cj4gICAgICBtZW1iZXJzID0gPCZoYXJ0
ND4sIDwmaGFydDU+Owo+ICAgICB9Cj4gICAgIGdyb3VwMyB7Cj4gICAgICBtZW1iZXJzID0gPCZo
YXJ0Nj4sIDwmaGFydDc+Owo+ICAgICB9Cj4gICAgfQo+ICAgIGxldmVsMSB7IC8vIE1DCj4gICAg
IHNoYXJlZCA9ICJwb3dlciIsICJjYXBhY2l0eSIKPiAgICAgZ3JvdXAwIHsKPiAgICAgIG1lbWJl
cnMgPSA8JmhhcnQwPiwgPCZoYXJ0MT4sIDwmaGFydDI+LCA8JmhhcnQzPjsKPiAgICAgfQo+ICAg
ICBncm91cDEgewo+ICAgICAgbWVtYmVycyA9IDwmaGFydDQ+LCA8JmhhcnQ1PiwgPCZoYXJ0Nj4s
IDwmaGFydDc+Owo+ICAgICB9Cj4gICAgfQo+ICAgIHRvcF9sZXZlbCB7IC8vIEEgZ3JvdXAgd2l0
aCBhbGwgaGFydHMgaW4gaXQKPiAgICAgc2hhcmVkID0gIiIgLy8gVGhlcmUgaXMgbm90aGluZyBj
b21tb24gZm9yIEFMTCBoYXJ0cywgd2UgY291bGQgaGF2ZQo+IGNhcGFjaXR5IGhlcmUKPiAgICB9
Cj4gfQo+IAoKSSBhZ3JlZSB0aGF0IG5hbWluZyBjb3VsZCBoYXZlIGJlZW4gYmV0dGVyIGluIHRo
ZSBwYXN0LiBCdXQgaXQgaXMgd2hhdCAKaXQgaXMgbm93LiBJIGRvbid0IHNlZSBhbnkgYmlnIGFk
dmFudGFnZXMgaW4gdGhpcyBhcHByb2FjaCBjb21wYXJlZCB0byAKdGhlIGV4aXN0aW5nIGFwcHJv
YWNoIHdoZXJlIERUIHNwZWNpZmllcyB3aGF0IGhhcmR3YXJlIGxvb2tzIGxpa2UgYW5kIApzY2hl
ZHVsZXIgc2V0cyB1cCBpdCdzIGRvbWFpbiBiYXNlZCBvbiBkaWZmZXJlbnQgY3B1bWFza3MuCgoK
UmVnYXJkcywKQXRpc2gKPiBSZWdhcmRzLAo+IE5pY2sKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
