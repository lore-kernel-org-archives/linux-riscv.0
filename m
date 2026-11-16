Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E5E606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oq2IFt6u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ya7+q6ls
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uaFYlBajXVCy+wSQIGCFYt2vGx6AMcUwgV4dMVCV6ys=; b=Oq2IFt6uioe4/Ul7j/eI9Kqu4N
	Vjk18G7aPfagbTTJ6AkTEVz4OpR2aN+1IOVRT+81zdsmGEYU7LcH7Jer2drzw9pEkBD80WPE4kge4
	1qYI71aSEmu/UJppgE/PQCIa1GALHyrAYMl0ak2AvwYj1f0yylN3vZGIYHMQ47olMzojd6GyRmWH/
	vhk2l3aYAtyi3ugIGIg9Ex1qJWpKi8X3H5EuToK5I8I0SxU4Zty9fj7CFA8mntdVnGCUVrKJojyMe
	/ki2qnYwdXwPwwfJ2YA4AnPjlxkHKmKCL08GZRkGY+sVFoRmtDylaPzZh0Y7qY9+U0lKtZtNGsZel
	O3JP04yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSs0I-00000001a6U-13K5;
	Mon, 16 Nov 2026 08:23:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSs0H-00000001a5f-2eJ5
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:23:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51D8D4083E;
	Mon, 16 Nov 2026 08:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD46D1F000C6;
	Mon, 16 Nov 2026 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817433;
	bh=l7+A+m7qDvZ8iB7GbQqDyIh26UTo2sgEvVBcZb8qmw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ya7+q6ls9GtEN5gVEcZOCqk0bZp9uDURQQ6zmi0PHbf7bURiFXjIfrT1NywXBrjKi
	 Dl36Uuno6krYk46X9g7LKe1IYUFIBveEsGnD1PYvbbjmViYO1M7DE8lzJrVYznI++9
	 AH2k1t+KRFbcd8SpY0REX6wHQ6PE16ELPlGlrz3sBnhESCK/j8GoLTi8W7kNxe2uXa
	 77n9Cdzhn4Tq6o/JGwUYzh1wQ23X1S9p8+PTbqj+A+engoBzmZAbIPKMvAvF7Gv4vM
	 RGr0tU5tKkBFGTCbtX0XfMJIZ9TKKyGE93JCWn0dkTqaO476MzLaGgAVyq/s+p0zM0
	 A1H/aPeRKWhXQ==
Date: Mon, 16 Nov 2026 08:23:50 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree <devicetree@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit <spacemit@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261116082350-GKB100890@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
 <20261114075506-GKB100523@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgU2FuZGllLAoKT24gMTQ6NDkgTW9uIDE2IE5vdiAgICAgLCBTYW5kaWUgQ2FvIHdyb3RlOgo+
IEhpLCBZaXh1bjoKPiAKPiA+IEZyb206ICJZaXh1biBMYW4iPGRsYW5Aa2VybmVsLm9yZz4KPiA+
IERhdGU6wqAgU2F0LCBOb3YgMTQsIDIwMjYsIDE1OjU1Cj4gCj4gPiBIaSBTYW5kaWUsCj4gPsKg
Cj4gPiBPbiAxMTozMyBNb24gMDkgTm92IMKgIMKgICwgU2FuZGllIENhbyB3cm90ZToKPiA+ID4g
QWRkIHRoZSBkZXZpY2UgdHJlZSBub2RlIFNESENJLTAgY29udHJvbGxlciBmb3Igb25ib2FyZCBN
aWNybyBTRCBjYXJkIHNsb3QuCj4gPiA+wqAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FuZGllIENh
byA8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlvPgo+ID4gPiAtLS0KPiA+ID4gwqAuLi4vc3Bh
Y2VtaXQvazMtZGVlcGNvbXB1dGluZy1mbWwxM3YwNS5kdHMgwqAgwqB8IDIyICsrKysrKysrKysr
KysrKysrKysKPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4gPsKg
Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBj
b21wdXRpbmctZm1sMTN2MDUuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1k
ZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cwo+ID4gPiBpbmRleCBiY2Q1MzM0ODRhNzMuLjA1MTA0
NmZlOTBiMiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
My1kZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzCj4gPiA+IEBAIC0xNzcs
NiArMTc3LDI4IEBAICZjb21ib3BoeSB7Cj4gPiA+IMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gIm9r
YXkiOwo+ID4gPiDCoH07Cj4gPiA+IMKgCj4gPiAuLgo+ID4gPiArLyoKPiA+ID4gKyAqIE9uYm9h
cmQgU0QgY2FyZCBzbG90Ogo+ID4gPiArICogUGxlYXNlIGluc2VydCBvciByZW1vdmUgdGhlIFNE
IGNhcmQgd2hpbGUgdGhlIGRldmljZSBpcyBwb3dlcmVkIG9mZi4KPiA+ID4gKyAqIEl0IHdvcmtz
IGFzIGEgYm9vdCBtZWRpYS4gc28gc2V0IGl0IHRvIG5vbi1yZW1vdmFibGUuCj4gPiA+ICsgKi8K
PiA+IElzIHRoZXJlIGFueSBwdWJsaWMgc2NoZW1hdGljIGF2YWlsYWJsZSBmb3IgRk1MMTNWMDU/
IEkgZ3Vlc3MgdGhlcmUgaXMKPiA+IG5vIENEIHBpbiAoQ2FyZCBEZXRlY3QgcGluKT8gYXMgbm8g
ImNkLWdwaW9zIiBwcm9wZXJ0eSBzZWVuIGhlcmUKPiA+wqAKPiA+IFRoZSBhYm92ZSBjb21tZW50
IGlzbid0IHJlYWxseSB1c2VmdWwgb3IgZXZlbiBjb3JyZWN0LCBJJ2Qgc3VnZ2VzdAo+ID4gZHJv
cCBpdC4KPiAKPiBJbiB2ZXJzaW9uIDEgWzFdLMKgIHRoZSBwYXRjaCBpcyBjZC1ncGlvcyA9IDwm
Z3BpbyBLM19HUElPKDg4KSBHUElPX0FDVElWRV9MT1c+Owo+IGJ1dCBLM19HUElPKDg4KSBpcyBm
YWtlIGNkLWdwaW8sIGl0J3MgdGllZCBsb3cgb24gYm9hcmQuClNvLCB0aGVyZSBpcyBncGlvIGNk
IHBpbiwgYnV0IGRpZG4ndCB3b3JrPyBpdCdzIGhhcmQgdG8gc2F5IHdpdGhvdXQKdGhlIHNjaGVt
YXRpYywgYnV0IGNhbiB5b3UgY2hlY2sgd2l0aCBoYXJkd2FyZSBwZW9wbGUsIGlmIGl0CmNhbiBi
ZSBmaXhlZCB3aXRoIFNvQydzIGludGVybmFsIEdQSU8gQklBUyBwdWxsdXAgb3IgcHVsbGRvd24/
ClNvLCBncGlvIHBpbiBpcyBhYmxlIHRvIHJlZmxlY3QgY2FyZCBpbnNlcnQgc3RhdHVzCgoKPiBT
byBJbiB2ZXJzaW9uMiBbMl0sIHRoZSBwYXRjaCBjaGFuZ2VzIHRvIG5vbi1yZW1vdmFibGUuCj4g
QW5kIEluIHZlcnNpb24zIFszXSwgYWRkIGNvbW1lbnQuwqAKPiAKPiBUaGUgb3B0aW9uczogY2Qt
Z3Bpbywgbm9uLXJlbW92YWJsZSwgYnJva2VuLWNkwqAgYWxsIHdvcmsgb24gdGhpcyBib2FyZC4K
PiAKaXQgd29ya3MsIGJ1dCBkb2VzIG5vdCByZWZsZWN0IHRoZSBoYXJkd2FyZSBzdGF0dXMKCj4g
V2UganVzdCBuZWVkIHRvIGRldGVjdCB0aGUgU0QgY2FyZCB3aGVuIGJvb3R1cCwgZG9uJ3QgbmVl
ZCB0aGUgZHJpdmVywqAKPiB0byBkZXRlY3QgaG90LXBsdWcgZXZlbnQgLCBub24tcmVtb3ZhYmxl
IHNob3VsZCBiZSBzdWl0YWJsZSBhbmQgZmFzdGVyLMKgCj4gd2UgcmVjb21tZW50IHRvIHVzZSBu
b24tcmVtb3ZhYmxlLgo+IApObywgdGhpcyBpc24ndCBhIHZhbGlkIHJlYXNvbiwgaXQncyB1c2Ug
Y2FzZSBzaG91bGQgaGF2ZSBub3RoaW5nIHRvIGRvCndpdGggdGhlIHByb3BlcnR5LgoKTXkgcG9p
bnQgaXM6IGlmIHRoZSBncGlvIGNkIHBpbiBzdGlsbCBkb2Vzbid0IHdvcmssIGFuZCB0aGUgU0Qg
Y2FyZCBpcwphY3R1YWxseSBwaHlzaWNhbCBwbHVnYWJsZSwgdGhlbiBzaG91bGQgdXNlICJicm9r
ZW4tY2QiLgogCj4gCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MjIx
MTAyMzEuMzQyNjAxMS0xLXNhbmRpZS5jYW8KPiBAZGVlcGNvbXB1dGluZy5pby8KPiBbMl06IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTAyMDA4MTYzMy4zNjczNzA0LTEtc2FuZGll
LmNhbwo+IEBkZWVwY29tcHV0aW5nLmlvLwo+IFszXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYxMTAyMDYwMDEyLjEwMDYyMy0xLXNhbmRpZS5jYW8KPiBAZGVlcGNvbXB1dGluZy5p
by8KPiAKPiBCZXN0IHJlZ2FyZHMKPiBTYW5kaWUKPiAKPiA+wqAKPiA+ID4gKyZzZGhjaTAgewo+
ID4gPiArIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwidWhzIjsKPiA+ID4g
KyDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+Owo+ID4gPiArIMKgIMKgIMKgIMKg
cGluY3RybC0xID0gPCZtbWMxX3Voc19jZmc+Owo+ID4gPiArIMKgIMKgIMKgIMKgYnVzLXdpZHRo
ID0gPDQ+Owo+ID4gLi4KPiA+ID4gKyDCoCDCoCDCoCDCoG5vbi1yZW1vdmFibGU7Cj4gPiAibm8t
cmVtb3ZhYmxlIiBwcm9wZXJ0eSB1c3VhbGx5IHVzZWQgZm9yIGVtbWMgY2hpcCBzb2xkZXJlZCBv
biBib2FyZCwKPiA+IMKgc28gdGhlcmUgaXMgbm8gd2F5IGl0IGNhbiBiZSBwaHlzaWNhbGx5IHJl
bW92ZWQuLiBjaGVja8KgCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1j
L21tYy1jb250cm9sbGVyLWNvbW1vbi55YW1sCj4gPsKgCj4gPiBGb3IgY2FzZXMgdGhhdCBubyBD
RCBwaW4gKG9yIG5vIEdQSU8gQ0QgcGluKSBkZXNpZ25lZCBmb3IgU0QgY2FyZCBmcm9tCj4gPiBo
YXJkd2FyZSBzY2hlbWF0aWMgcGVyc3BlY3RpdmUsIHVzaW5nICJicm9rZW4tY2QiIGlzIGEgbW9y
ZSBwcm9wZXIgd2F5LAo+ID4gaXQgd2lsbCBmYWxsYmFjayB0byB1c2UgcG9sbCBtZWNoYW5pc20g
dG8gZGV0ZWN0IHRoZSBjYXJkLCBwbGVhc2UgY2hlY2sKPiA+wqAKPiA+ID4gKyDCoCDCoCDCoCDC
oG5vLW1tYzsKPiA+ID4gKyDCoCDCoCDCoCDCoG5vLXNkaW87Cj4gPiA+ICsgwqAgwqAgwqAgwqBk
aXNhYmxlLXdwOwo+ID4gPiArIMKgIMKgIMKgIMKgY2FwLXNkLWhpZ2hzcGVlZDsKPiA+ID4gKyDC
oCDCoCDCoCDCoHZxbW1jLXN1cHBseSA9IDwmYWxkbzE+Owo+ID4gPiArIMKgIMKgIMKgIMKgc2Qt
dWhzLXNkcjI1Owo+ID4gPiArIMKgIMKgIMKgIMKgc2QtdWhzLXNkcjUwOwo+ID4gPiArIMKgIMKg
IMKgIMKgc2QtdWhzLXNkcjEwNDsKPiA+ID4gKyDCoCDCoCDCoCDCoHN0YXR1cyA9ICJva2F5IjsK
PiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gwqAmdWFydDAgewo+ID4gPiDCoCDCoCDCoCDCoCDCoHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiA+IMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0g
PCZ1YXJ0MF8wX2NmZz47Cj4gPiA+IC0twqAKPiA+ID4gMi40My4wCj4gPsKgCj4gPiAtLcKgCj4g
PiBZaXh1biBMYW4gKGRsYW4pCj4gPsKgCgotLSAKWWl4dW4gTGFuIChkbGFuKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
