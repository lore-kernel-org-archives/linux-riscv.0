Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3D9CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlCIz9RtFACxybyZZbOco3hcqtykMKF0a3ESboXrn88=; b=I8tljCBd2qpyq7
	1CP8z4xACrgN4jNKLK74R/OU+eXvh3KSXxxqO80hjZQttMWGxIXYx2WT8zKwPh1ai0E8tRi/ZTgFA
	c9UwUr0CwtUuMBXFMcYR6R7ymeTSSYzOcY39AelGzzMLfpcNeax5tTfY9gRIJnpN4gOyiq0eb3TOR
	ECXhVuF1yov78sEP7J/TcAHwRFDLZ2vh4ExeVY/O0q6wc39LnBiMw5zlM++j4cdxN/BG4kcUC9lBD
	fLIEczIuLg8V2c91UxMvLoUzs3IA/ntYO5KuYz2WiOf8/nPc2dKRgnlGIsgUtuvfLXQh63wijoZU/
	Y3wLGCQnbPH4Ezt6EYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwh4-001BYB-0p;
	Thu, 12 Oct 2023 14:29:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwh0-001BWu-12
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE4FD61E25;
	Thu, 12 Oct 2023 14:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A60C433CB;
	Thu, 12 Oct 2023 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697120977;
	bh=CbyeFLuAiEasZtHALx1Y0pmtF2I8Cj6/dbf/zW55VS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtoLPg323lnx4rDDFh52ErfvO6Lh6rYnZE3c7kBFuX0QcAufzqbECI6EXYEvDPuRG
	 WvkWIFXpTxWqvoxMG63t7BzjvOtYlqtOHNI5YHwuToujQYCxIyNADCg6wZp5xjuJKN
	 N7kS2ZKIFYyvxR8p25TQ2Uf787JjweoVSiGIBw1O0RXQM9rpTjrtcXjGXlAcmLSrln
	 88KKvNGbOegfJckm3rWWwPvDvawdktOEV6HRtP8Iv0IH9Cof2slgxClgYG61LyEIvw
	 P00CWUTUgBp/M1A1r7eYkCn1EWvBokQIJVGiLx6Sm7jSZ86A59ED9tLyv6QNY5t7MS
	 KvOu7cB2jlXqw==
Date: Thu, 12 Oct 2023 22:17:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 1/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <ZSf/9oxUHIG0XiXQ@xhacker>
References: <20231001103433.3187-1-jszhang@kernel.org>
 <20231001103433.3187-2-jszhang@kernel.org>
 <41b3c8c8-260d-4de1-92a4-245973274a60@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41b3c8c8-260d-4de1-92a4-245973274a60@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_072938_443836_BA7305B4 
X-CRM114-Status: GOOD (  23.40  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDI6NDM6MThQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDAxLzEwLzIwMjMgMTI6MzQsIEppc2hlbmcgWmhhbmcgd3JvdGU6
Cj4gPiBQcmV2aW91c2x5LCB3ZSB1c2UgYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHRvIGR5bmFtaWNh
bGx5IHBhdGNoCj4gPiB0aGUgQ01PIG9wZXJhdGlvbnMgZm9yIFRIRUFEIEM5MDYvQzkxMCBkdXJp
bmcgYm9vdCBmb3IgcGVyZm9ybWFuY2UKPiA+IHJlYXNvbi4gQnV0IGFzIHBvaW50ZWQgb3V0IGJ5
IEFybmQsICJ0aGVyZSBpcyBhbHJlYWR5IGEgc2lnbmlmaWNhbnQKPiA+IGNvc3QgaW4gYWNjZXNz
aW5nIHRoZSBpbnZhbGlkYXRlZCBjYWNoZSBsaW5lcyBhZnRlcndhcmRzLCB3aGljaCBpcwo+ID4g
bGlrZWx5IGdvaW5nIHRvIGJlIG11Y2ggaGlnaGVyIHRoYW4gdGhlIGNvc3Qgb2YgYW4gaW5kaXJl
Y3QgYnJhbmNoIi4KPiA+IEFuZCBpbmRlZWQsIHRoZXJlJ3Mgbm8gcGVyZm9ybWFuY2UgZGlmZmVy
ZW5jZSB3aXRoIEdNQUMgYW5kIEVNTUMgcGVyCj4gPiBteSB0ZXN0IG9uIFNpcGVlZCBMaWNoZWUg
UGkgNEEgYm9hcmQuCj4gPiAKPiA+IFVzZSByaXNjdl9ub25zdGRfY2FjaGVfb3BzIGZvciBUSEVB
RCBDOTA2L0M5MTAgQ01PIHRvIHNpbXBsaWZ5Cj4gPiB0aGUgYWx0ZXJuYXRpdmUgY29kZSwgYW5k
IHRvIGFjY2hpZXZlIEFybmQncyBnb2FsIC0tICJJIHRoaW5rCj4gPiBtb3ZpbmcgdGhlIFRIRUFE
IG9wcyBhdCB0aGUgc2FtZSBsZXZlbCBhcyBhbGwgbm9uc3RhbmRhcmQgb3BlcmF0aW9ucwo+ID4g
bWFrZXMgc2Vuc2UsIGJ1dCBJJ2Qgc3RpbGwgbGVhdmUgQ01PIGFzIGFuIGV4cGxpY2l0IGZhc3Qg
cGF0aCB0aGF0Cj4gPiBhdm9pZHMgdGhlIGluZGlyZWN0IGJyYW5jaC4gVGhpcyBzZWVtcyBsaWtl
IHRoZSByaWdodCB0aGluZyB0byBkbyBib3RoCj4gPiBmb3IgcmVhZGFiaWxpdHkgYW5kIGZvciBw
bGF0Zm9ybXMgb24gd2hpY2ggdGhlIGluZGlyZWN0IGJyYW5jaCBoYXMgYQo+ID4gbm90aWNlYWJs
ZSBvdmVyaGVhZC4iCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhh
bmdAa2VybmVsLm9yZz4KPiA+IFRlc3RlZC1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwu
cmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tj
b25maWcuZXJyYXRhICAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9lcnJhdGEvdGhl
YWQvZXJyYXRhLmMgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDUwICsrKy0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YSBiL2FyY2gv
cmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+IGluZGV4IDU2NmJjZWZlYWI1MC4uZDc5NzI5MTRmOWRl
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+ID4gKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnLmVycmF0YQo+ID4gQEAgLTc4LDYgKzc4LDcgQEAgY29uZmlnIEVSUkFU
QV9USEVBRF9DTU8KPiA+ICAJYm9vbCAiQXBwbHkgVC1IZWFkIGNhY2hlIG1hbmFnZW1lbnQgZXJy
YXRhIgo+ID4gIAlkZXBlbmRzIG9uIEVSUkFUQV9USEVBRCAmJiBNTVUKPiA+ICAJc2VsZWN0IFJJ
U0NWX0RNQV9OT05DT0hFUkVOVAo+ID4gKwlzZWxlY3QgUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVf
T1BTCj4gPiAgCWRlZmF1bHQgeQo+ID4gIAloZWxwCj4gPiAgCSAgVGhpcyB3aWxsIGFwcGx5IHRo
ZSBjYWNoZSBtYW5hZ2VtZW50IGVycmF0YSB0byBoYW5kbGUgdGhlCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVh
ZC9lcnJhdGEuYwo+ID4gaW5kZXggMDU1NGVkNGJmMDg3Li4zZmVmZWIxYjQ1NmUgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+ID4gKysrIGIvYXJjaC9y
aXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+IEBAIC0xMiw4ICsxMiwxMCBAQAo+ID4gICNp
bmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2gu
aD4KPiA+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2Rt
YS1ub25jb2hlcmVudC5oPgo+ID4gICNpbmNsdWRlIDxhc20vZXJyYXRhX2xpc3QuaD4KPiA+ICAj
aW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2lvLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGFzbS9wYXRjaC5oPgo+ID4gICNpbmNsdWRlIDxhc20vdmVuZG9yaWRfbGlzdC5oPgo+
ID4gIAo+ID4gQEAgLTMzLDYgKzM1LDc1IEBAIHN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9wYm10
KHVuc2lnbmVkIGludCBzdGFnZSwKPiA+ICAJcmV0dXJuIGZhbHNlOwo+ID4gIH0KPiA+ICAKPiA+
ICsvKgo+ID4gKyAqIGRjYWNoZS5pcGEgcnMxIChpbnZhbGlkYXRlLCBwaHlzaWNhbCBhZGRyZXNz
KQo+ID4gKyAqIHwgMzEgLSAyNSB8IDI0IC0gMjAgfCAxOSAtIDE1IHwgMTQgLSAxMiB8IDExIC0g
NyB8IDYgLSAwIHwKPiA+ICsgKiAgIDAwMDAwMDEgICAgMDEwMTAgICAgICByczEgICAgICAgMDAw
ICAgICAgMDAwMDAgIDAwMDEwMTEKPiA+ICsgKiBkYWNoZS5pdmEgcnMxIChpbnZhbGlkYSwgdmly
dHVhbCBhZGRyZXNzKQo+IAo+IFNtYWxsIHR5cG8gaGVyZTogaW52YWxpZGF0ZSBpbnN0ZWFkIG9m
IGludmFsaWRhCgphbm90aGVyIHR5cG86IHMvZGFjaGUvZGNhY2hlCnRoZXNlIHR5cG8gaGF2ZSBl
eGlzdGVkIHRoZXJlIGZvciBhIGxvbmcgdGltZSA7KSBJIGp1c3QgZml4ZWQgdGhlbSBpbgp2My4K
ClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
