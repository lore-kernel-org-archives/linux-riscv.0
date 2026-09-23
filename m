Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B4BC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:Subject:To:
	Message-Id:Date:References:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FciMSPztcXBzbzSHSmtvu3B0qqH1bU0yTRcxz8gXKo=; b=4/oWIvZqQmx9M7
	27noyDRi7E+Js1Q5vllZYQ/zq96D1bU/Tip7nWZndGB4fAeVo9kRpVr72coYbBT8pzW/RmzD4alTu
	ppvNodW7366LHe5hUzY9TeXifeu6d8ZE57KR3Y/MV+Vvp+RKr+JLqEG/B4Cnhne/O2KTCIMb/GLjG
	/IafuDa9p3DyVpB6+pB7jfS+0g6SrUWOOTgnJV1OBqtJ4TB8DPxZ66M0JI6JyrsCA7tLjx2WwLir9
	1aZ4gbExKf9KIS80HD/ZG2Uu+Nr/32QK2pOFHzqF5WqlsWYzwBD79w9Hxk1uQGjUfkoPTPAiYQYQe
	R8ohLh3AeAaPa15WNGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jdb-00000007oBe-3V8I;
	Wed, 23 Sep 2026 09:51:39 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JdN-00000007o9d-2Nji
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 09:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790157072;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UuWqsWA9strdMyWMxsoB9b/nhWJSlI8PVXRAHFyk1to=;
 b=La1OzKRWAVGb46YbIVnZkXn4RbClf2Vk8YdxeNBC0gOQyNasPEs90RCyHoPy9O34Gvp9Iv
 X8lpNT76GTnTEs3YhqN/BzBqG32KTcQLKjfx1I7DgHnXVZiym8iEnulokd4JOLYBQeMaX0
 47RrD745Ri1kgnc6IhmLGHCUdG3LvrAg1p8ZRzceyPYq0cr04WF/8+kpyWJfB5lqp9M29i
 5DVEmm+QC+FJZv+vKtSFd3tIj4MipV0Ay5mBisXTJDDPiEU5zGT/x2qQRzfkVGOFOEUtrV
 PkDzntpFmxvI2ps9XmkKUIXEAJduaAH90JVKxEc1Ejs/AOwJvLWhRpIQHb9G5Q==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io> <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn> <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
	<DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab3a10e+6c606d+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Wed, 23 Sep 2026 17:51:09 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.a37d568d.f88e.4fdb.8c5f.8da4b148415f@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Mime-Version: 1.0
In-Reply-To: <DLMKXCP8EDNL.JW6NFGCTMJVN@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025125_719237_8A4B8061 
X-CRM114-Status: GOOD (  25.67  )
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

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxNzoxNAo+IE9uIFdlZCBT
ZXAgMjMsIDIwMjYgYXQgNDowMSBQTSArMDgsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBIaSwgVHJv
eToKPiA+Cj4gPj4gRnJvbTogIlRyb3kgTWl0Y2hlbGwiPHRyb3kubWl0Y2hlbGxAbGludXguc3Bh
Y2VtaXQuY29tPgo+ID4+IERhdGU6wqAgV2VkLCBTZXAgMjMsIDIwMjYsIDE1OjAyCj4gPj4gT24g
V2VkLCBTZXAgMjMsIDIwMjYgYXQgMDI6MzU6MjBQTSArMDgwMCwgU2FuZGllIENhbyB3cm90ZToK
PiA+PiA+IEZNTDEzVjA1IFNEIGNhcmQgc2xvdCBpcyBpbnNpZGUgdGhlIGJvYXJkLCBpdCBkb2Vz
bid0IG5lZWQgY2QtZ3BpbywKPiA+PiA+IEZNTDEzVjA1IEtlZXBzIEdQSU84OCB0byBsb3csIFRo
ZW4gU0QgY2FyZCBpcyBhbHdheXMgb24gZm9yIFNEIENhcmQKPiA+PiA+IGRyaXZlci4KPiA+PsKg
Cj4gPj4gQW4gaW50ZXJuYWwgc2xvdCBkb2VzIG5vdCBuZWNlc3NhcmlseSBtZWFuIHRoZSBjYXJk
IGlzIG5vbi1yZW1vdmFibGUuCj4gPj4gSSBkb24ndCB0aGluayBpdHMgbG9jYXRpb24gYWxvbmUg
anVzdGlmaWVzIGtlZXBpbmcgY2FyZCBkZXRlY3QgYXNzZXJ0ZWQ6Cj4gPj4gR1BJTzg4IHdvdWxk
IHJlcG9ydCBhIGNhcmQgcHJlc2VudCBldmVuIHdoZW4gdGhlIHNsb3QgaXMgZW1wdHkuCj4gPgo+
ID4gWWVzLiBUaGUgRk1MMTNWMDUgaGFyZHdhcmUgaXMgZGVzaWduZWQgZm9yIHRoaXMuIFdlIGNh
bid0IGNoYW5nZSBpdC7CoAo+wqAKPiBJIG1heSBub3QgaGF2ZSBiZWVuIGNsZWFyOiBhbiBpbnRl
cm5hbCBjYXJkIHNsb3QgZG9lcyBub3QgbmVjZXNzYXJpbHkKPiBtZWFuIHRoZSBjYXJkIGlzIG5v
bi1yZW1vdmFibGUuIElmIEdQSU84OCBpcyBjb25uZWN0ZWQgdG8gdGhlCj4gY2FyZC1kZXRlY3Qg
c3dpdGNoLCBpdCBzdGlsbCBuZWVkcyBhIHB1bGwtdXAuIElzIEdQSU84OCB0aWVkIGxvdyBvbgo+
IHRoZSBib2FyZCwgb3IgZG9lcyBpdCByZWZsZWN0IHRoZSBzdGF0ZSBvZiB0aGF0IHN3aXRjaD8K
ClRoZSBGTUwxM1YwNSBTRCBjYXJkIHNsb3QgZG9lc24ndCBoYXZlIGNkLWdwaW8uIEJ1dCB0aGUg
SzMgU0QgY2FyZCBkcml2ZXIgbmVlZCBpdCwgc28gdGhlIEdQSU84OCBpcyB0aWVkIGxvdyBvbiBi
b2FyZC7CoArCoAo+wqAKPiA+Cj4gPj7CoAo+ID4+ID4gV2UgY2hlY2sgdGhlIHZtbWMtc3VwcGx5
IGlzIHAzdjMuIFdlIGhhdmUgdGhlIHNhbWUgU0RLIERUUyBjb25maWcgd2l0aAo+ID4+ID4gazNf
Y29tMjYwWzFdICwgc28sIHRoaXMgcGF0Y2ggZm9sbG93cyB0aGUgU0QgY2FyZCBwYXRjaCBvZiBr
M19jb20yNjAKPiA+PiA+IGR0c1syXS4KPiA+PiA+Cj4gPj4gPiBJZiB0aGlzIGlzIG5vdCBjb3Jy
ZWN0LCB3ZSB3aWxsIGNoYW5nZSBpdC4KPiA+PsKgCj4gPj4gQ291bGQgeW91IGNvbmZpcm0gZnJv
bSB0aGUgc2NoZW1hdGljcyB0aGF0IHRoZSBTRCBwb3dlciB3aXJpbmcgbWF0Y2hlcwo+ID4+IENv
TTI2MCBhbmQgdGhhdCB0aGUgY2FyZCdzIFZERCBpcyBhY3R1YWxseSBjb25uZWN0ZWQgdG8gQUxE
TzQ/IElmIHNvLAo+ID4+IHRoaXMgc3VwcGx5IHJlZmVyZW5jZSBpcyBmaW5lLiBUaGUgc2FtZSBT
REsgY29uZmlndXJhdGlvbiBhbG9uZSBkb2VzCj4gPj4gbm90IGVzdGFibGlzaCB0aGUgd2lyaW5n
Lgo+ID4+wqAKPiA+PiBJZiB0aGUgY2FyZCBpbnN0ZWFkIHVzZXMgYSBmaXhlZCwgYWx3YXlzLW9u
IHN1cHBseSB3aXRoIG5vIHNvZnR3YXJlIHBvd2VyCj4gPj4gY29udHJvbCwgdm1tYy1zdXBwbHkg
aXMgb3B0aW9uYWwgZm9yIHRoZSBNTUMgY29yZTsgaXQgc2hvdWxkIG5vdCBwb2ludCB0bwo+ID4+
IGFuIHVucmVsYXRlZCBBTERPNCByYWlsLgo+ID4KPiA+IFdlIGNoZWNrIHRoZSBzY2hlbWF0aWNz
IGJvdGggb2YgQ09NMjYwIGFuZCBGTUwxM1YwNSwgYm90aCB1c2UgcDN2MyAoYSBmaXhlZCwgYWx3
YXlzLW9uIHN1cHBseSB3aXRoIG5vIHNvZnR3YXJlIHBvd2VyIGNvbnRyb2wpLCBub3QgQUxETzQu
IEFMRDA0IGlzIG9ubHkgZm9yIFVTQi4KPiA+IFdlIHdpbGwgY29ycmVjdCBpdCBpbiBuZXh0IHBh
dGNoLgo+IEknbGwgc2VuZCBhIHNlcGFyYXRlIHBhdGNoIHRvIGZpeCB0aGUgQ29NMjYwIHZtbWMt
c3VwcGx5IHJlZmVyZW5jZS4KPiBZb3UgY2FuIGZvY3VzIG9uIEZNTDEzVjA1IGluIHRoaXMgc2Vy
aWVzLgoKR290IGl0LiBUaGFua3MKCkJlc3QgcmVnYXJkcwpTYW5kaWUKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
