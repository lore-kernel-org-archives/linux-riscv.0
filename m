Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B255FF60CE
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:In-Reply-To:
	Message-Id:Date:References:From:Cc:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxX1eKkbvVDp3nHHb/bvFGwnN2TdrEDwEjQqVwdplgY=; b=o7/OBMpDEwqPer
	Hk9qLauAX6Hh/vw9C0744hZNyjaS6r/ACnw6RAOUDJNEg9G4gI40pTSZqhNhQl4NYON6YN9R4e/mx
	zal/+0YhrmYMaPmtg0IjHTi31oEuJcJBLkLIfIKj40v9Y4Er6291QNMwJH7pwHBjibgRVjul6KujL
	0HGdzRK/Tl47TFMvQw5E+spHo5I4vL44NAa5yrJdpARAjM56bQqUCBvhGh8Gn6NLH7kjkPtQtbZN6
	fqXvtL7Q3nOPY2XjKYZN7qynqDeXSk3m+uAdpwckj9r7QAppzDtXffpU7U6nZXrw5KaDKtath0+/S
	jw+eYINtPEGAQXOzuqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Soy-0000000COmj-2FJj;
	Tue, 31 Mar 2026 06:43:28 +0000
Received: from sg-3-45.ptr.tlmpb.com ([101.45.255.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sow-0000000COmP-3DZm
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774939095;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=IxNwq4JUnKlv/IxnLCJYxLfGCvCAtbvIR9Q4w+rLz14=;
 b=1uuAhGbQTfbuUnv8ZSpdox1s8TZwMoKE0Q9gnAupkhEjmyMNThMOFVYS529mnlTLTo/cLv
 XvkvVLEY6HlhiiTZrb0TzLQIQHpmWYrIAzLd+GpangPiajF+qdNZjT6DrrsMTHYFHLqH6i
 Tc+A5wANVVJ6hs2t+ekVi2u5zFtbCoIzZBIfeOeSJ/Oi36cYa12VRmf5xhd8+QuRaqbH5D
 2mQfNxiOhEbB0rAMCDC8Ezp5b34L3ey02n9gRf086dLrgg/G5ZQk6WiKUOprqIbd2S/hBr
 xoiqsrQyT8IJqMZ8GdPKv5m4L3XJD15lA1vqLwP49Fvc4cdfhd2o3sFgJermdQ==
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034539.67167-1-sandie.cao@deepcomputing.io> <20260331060344-GKA976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
	<DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
Date: Tue, 31 Mar 2026 14:38:12 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.e358f129.78e8.4b7c.a3ea.c90229430d99@feishu.cn>
In-Reply-To: <DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cb6bd5+869eea+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_234326_978883_E9905495 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
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

Cj4gT24gVHVlIE1hciAzMSwgMjAyNiBhdCAyOjE1IFBNIENTVCwg5pu554+K54+KIHdyb3RlOgo+
ID4KPiA+PiBGcm9tOiAiWWl4dW4gTGFuIjxkbGFuQGtlcm5lbC5vcmc+Cj4gPj4gRGF0ZTrCoCBU
dWUsIE1hciAzMSwgMjAyNiwgMTQ6MDMKPiA+PiBTdWJqZWN0OsKgIFJlOiBbUEFUQ0ggdjEgMS8y
XSBkdC1iaW5kaW5nczogcmlzY3Y6IHNwYWNlbWl0OiBhZGQgZGVlcGNvbXB1dGluZyxmbWwxM3Yw
NQo+ID4+IFRvOiAiU2FuZGllIENhbyI8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlvPgo+ID4+
IENjOiAiQ29ub3IgRG9vbGV5Ijxjb25vcitkdEBrZXJuZWwub3JnPiwgIkVtaWwgUmVubmVyIEJl
cnRoaW5nIjxrZXJuZWxAZXNtaWwuZGs+LCAiUm9iIEhlcnJpbmciPHJvYmhAa2VybmVsLm9yZz4s
ICJLcnp5c3p0b2YgS296bG93c2tpIjxrcnprK2R0QGtlcm5lbC5vcmc+LCAiUGF1bCBXYWxtc2xl
eSI8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiwgIlBhbG1lciBEYWJiZWx0IjxwYWxtZXJAZGFi
YmVsdC5jb20+LCAiQWxiZXJ0IE91Ijxhb3VAZWVjcy5iZXJrZWxleS5lZHU+LCAiSGVpbnJpY2gg
U2NodWNoYXJkdCI8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiwgIlRyb3kgTWl0
Y2hlbGwiPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiwgIk1pY2hhZWwgT3BkZW5h
Y2tlciI8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPiwgIkd1b2RvbmcgWHUiPGd1
b2RvbmdAcmlzY3N0YXIuY29tPiwgIkhlbmRyaWsgSGFtZXJsaW5jayI8aGVuZHJpay5oYW1lcmxp
bmNrQGhhbW1lcm5ldC5iZT4sICJZYW5neXUgQ2hlbiI8Y3l5QGN5eXNlbGYubmFtZT4sIDxzcGFj
ZW1pdEBsaXN0cy5saW51eC5kZXY+LCA8bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
IDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz4sIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPgo+IEknbSBqdXN0IGNvbmZ1c2VkIGFzIHRvIHdoeSB0aGlzIGFwcGVhcmVkIGluIHRoZSBi
b2R5Lgo+wqAKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtIFRyb3kK
PsKgCgpUaGlzIHdhcyB0aGUgZm9ybWF0IG9mIG15IGVtYWlsIHNlbmRlci7CoApJIGNvcnJlY3Qg
aXQgbm93LsKgClRoYW5rcy4KU2FuZGllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
