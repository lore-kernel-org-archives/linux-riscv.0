Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA32CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwOwMGVX4xRORQtgL6jnj2Na4qYUynlQ2XZ/wv00o30=; b=ZJIT2OBE3G0A2u
	UpeK+06EevlFSprMO/IVAsBYp7w4zFPAA8Vk76Fp8cEJzQkar7YPtiHI6pDNLJovTEUEogNqPC049
	8vDM5ck8fU4O+4wjopCsC7VNgLYGOj4KVpZo3NUHvuz2O4spdjgZ8OFh663Nn1SyiXIm3OeABDrnU
	gXFpWNo3HlMerk7bE8zrahRhiMe9kEd6MKh/83OpOOyym4Z3QaIB4dNM/JIHv2tZ518P5TbjViGSt
	C18vKb19GegULtaxHExCiRGsR47plS+wPyCbPW3zZHzKPnaDEpTUC6fviLavu5Jv9ru8IqY0xqxtG
	dkCpkhiJSoVBw2i5bE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdIx-0000000Djw1-04ma;
	Wed, 05 Nov 2025 13:12:03 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdIt-0000000Djv2-15Pm
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 13:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762348227;
	bh=jlIuWhx6mIXtzUHR6K7f1ncyau5kdA/cogsTajBCfP4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tnhfUbmAApK5dTMpWmQkJgPWzkQn5i1o3IQKLNnxGg9JLw3tchrJSmAiw5DxqhS4m
	 Em5n5JDLTHiZSH5TsYFkCQNYvMfMEB6h6V8Yq6vLFpTLnUobPeziJJWbyPQA+aeVFw
	 RdyMvLujC+Js1p5JlqS70tMtB5YjQmaxhjislEuE=
X-QQ-mid: esmtpsz16t1762348225td460a432
X-QQ-Originating-IP: Ry4EBM360mmFG+DdStDU6CVzq5ZY1m2B2cjqx7WGWCY=
Received: from = ( [58.254.68.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 21:10:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1919110398043033819
EX-QQ-RecipientCnt: 14
Date: Wed, 5 Nov 2025 21:10:21 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <FA1DBD9E7CCB8027+aQtMvb5Br7MgMW4K@troy-wujie14pro-arch>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <20251105100856.GG8064@google.com>
 <20251105101149.GH8064@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105101149.GH8064@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MowohnWo6wX7YASBmEQKUOegh4zrKZr9NzPfyM6OBxnV9We8+vO8AVg7
	xZrad7c1cs/RLS//keRXpH8wU0CBl9p7bQfEJUc1NZkqC1duQUK4L3V+6TdpSDZ0UBqu46o
	JzUT2fQxhORvKfjhJQsU8eYF0zsYp+VcXdoxnqsO4WY5AdFMbQKGh4x+oMXo5j2bPnNwiwS
	B6l+dmYPF3tdmpXaaq/z5XcdNrJJZjnA5HI3HpL/UNmBOyZbC1x1Ii+fPX3i4p/h9sF1J+Z
	MIJLxdVKUzRaPa2i8OJT/C7LNmjdYINk8Ev5Dkhho4rGzdFMn4t5ZSzZrKkajJz673Dd/eu
	mY0FlsTmR69G7yNQENDwpN0ka6A+qFVgqF1WLy3BZjd4TCcbinwadBAHLCOt/YxA+tROpNj
	6rsq0XI7dpbp1iaLXclvSqx0NvTG2wlV1rNJgKZZ/cJGtyRw8AOVpledaFJdSgA0w4/gJ+7
	+KwGg+OsMBb3IPLwZiNJezrwfpH+YUHQEMqT97pxXtsUOzVGPfVP4J8/8rDrZ9rwTQb9pRT
	G68gdAEbjUWJ+G/KglpcNyRox5WNdFUSqkKXQtapNimx8XiVl+zD0FqlykI6VJmZ4OzWJJB
	l9+xU7lUaB2gvQpvrr9Tdu6X9C9kWJaKnqbSGJ+Ht3DfYubmG4aSgJDlhGHuNIwDMGasamY
	p42LSPKpfONt9yyzOmMioW0BIPdFHmixL5oa/X23uYHWu2Rggm21NTiJp7K2xE5JM9DJJHI
	W4ElLUyPokfkC2FcEZ7v8AyV/PL7a1qbBA3e80q+FtiqpTnOhvFUpawcO/LDAbqtSu9iD5y
	SX48eIiDi/3bbahPGJge/AhUXYT8gwLLxgVXwV421rczGwasEs7l+XV6B/zw/gA23vH/Fyv
	oLgEJYNbhznhFFfUPQ3Ev30ySPrSbrxgDuc4n4zx+v1urSFCl1XDG66RBi8Ridbu3DL6hzD
	5iOikN4BlS4GET8tQN9krawm2sEq0jEvL/X8OkSlliHFRw9V9toQIFwzkQ1FLhQIU1tDSV8
	ozHgBwlM6Pn/cfcOMhsVIv/LX5yVLsuLOs+gMWsvYcb6Yy49VdiCNrD8cmUMekWsOwiBsPv
	1cx4QtSZHV3
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_051200_077522_8ED06826 
X-CRM114-Status: GOOD (  19.25  )
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

T24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMTA6MTE6NDlBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFdlZCwgMDUgTm92IDIwMjUsIExlZSBKb25lcyB3cm90ZToKPiAKPiA+IE9uIFdlZCwg
MDUgTm92IDIwMjUsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiAKPiA+ID4gT24gV2VkLCBOb3Yg
MDUsIDIwMjUgYXQgMDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IE9u
IFR1ZSwgMDQgTm92IDIwMjUsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4g
PiBPbiBNb24sIE5vdiAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVp
Y2hlbCB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUg
MDA6MDE6NTggKzAxMDAsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+ID4gPiA+IFRoaXMg
YWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hp
cCwgd2hpY2ggaXMKPiA+ID4gPiA+ID4gPiBjb21tb25seSBwYWlyZWQgd2l0aCB0aGUgU3BhY2Vt
aVQgSzEgU29DLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE5vdGU6IEZvciByZWxpYWJs
ZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVuZHMgb24gYSB0aGlzIHBhdGNoIHRoYXQgYWRk
cwo+ID4gPiA+ID4gPiA+IGF0b21pYyB0cmFuc2ZlciBzdXBwb3J0IHRvIHRoZSBTcGFjZW1pVCBJ
MkMgY29udHJvbGxlciBkcml2ZXI6Cj4gPiA+ID4gPiA+ID4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9zcGFjZW1pdC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxp
bnV4LnNwYWNlbWl0LmNvbS8KPiA+ID4gXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiA+ID4gZGVwZW5kZW5jeSBpcyBoZXJlLgo+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBB
cHBsaWVkLCB0aGFua3MhCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBbMS8yXSBkcml2ZXI6IHJl
c2V0OiBzcGFjZW1pdC1wMTogYWRkIGRyaXZlciBmb3IgcG93ZXJvZmYvcmVib290Cj4gPiA+ID4g
PiA+ICAgICAgIGNvbW1pdDogMjgxMjRjYzBmYjhjN2RjMDFhNjgzNGQyMjczNTFlMjVkOWE5MmM1
OAo+ID4gPiA+ID4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2gg
aGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0Li4uCj4gPiA+ID4gCj4gPiA+ID4gV2hhdCBpcyB0aGUg
ZGVwZW5kZW5jeT8KPiA+ID4gSSBwb2ludCBpdCBvdXQgYWJvdmUuCj4gPiA+IFdpdGhvdXQgdGhp
cyBwYXRjaCwgcmVib290IGFuZCBzaHV0ZG93biB3b3VsZCBlbmQgdXAgY2FsbGluZyB0aGUgbm9u
LWF0b21pYyBpMmNfdHJhbnNmZXIuCj4gPiAKPiA+IE9rYXksIHRoYW5rcy4gIEkgd2FzIG1vc3Rs
eSBjaGVja2luZyB0aGF0IHlvdSB3ZXJlbid0IHJlZmVycmluZyB0byB0aGUKPiA+IE1GRCBwYXRj
aCwgd2hpY2ggZG9lc24ndCByZXByZXNlbnQgYSB0cnVlIGRlcGVuZGVuY3kuCj4gCj4gVG8gc2F2
ZSBTZWJhc3RpYW4gc29tZSB0cm91YmxlLCBsZXQncyBrZWVwIHRoZSByZWJvb3QgcGF0Y2ggYXBw
bGllZC4KPiAKPiBJJ2xsIGhvbGQgb2ZmIG9uIHRoZSBNRkQgb25lLCB3aGljaCB3aWxsIGVuc3Vy
ZSB0aGF0IHJlYm9vdCBpc24ndCBwcm9iZWQuCj4gCj4gTGV0IG1lIGtub3cgd2hlbiB0aGUgZGVw
IGlzIG1lcmdlZCBhbmQgSSdsbCBob292ZXIgdXAgdGhlIHJlc3Qgb2YgdGhlIHNldC4KT2theS4g
SSdsbCByZXBseSB0aGlzIHRocmVhZCB3aGVuIHRoZSBkZXBlbmRlbmN5IGlzIG1lcmdlZC4KCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+ad
jueQvOaWr10KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
