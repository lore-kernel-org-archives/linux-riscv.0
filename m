Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E4AC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mcZBs6IETje2ZUGS4L5cYr51nXKRhbNvZRuUgEP/U0=; b=HMMx46hHDTscVl
	DyGkupmjFMPQAviJQR/YYNI6z9wCsqo2LvFQ1lN1Mid15fNdnSrXuyiZTPKf9Ex/Fni/+F9vlG6p9
	lN3MdKERTtfqnVgYhsijuSxbI37MPuuuNVg2JFbHRHiYJ+RrpjNM65dA73TIbHcYUj5rGpLyKkl/J
	7dq88w31F0Eqf/vJLbYuVwjhXq8Gc8ZVgnpVtdg/LA0kXRbXsz+iaJpMQMvGhJjebi9Nf7/Hyc3jK
	iGL4qwybVLq5dmu3r8fjGUjJ9LKen4ZxIT+XxgElFniR50Rc6EHid8CZoicmBcuyfU1z8pOG/rYZy
	s2up+ubKzo/pXbeo4+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SRK-00000005ywd-1gin;
	Mon, 07 Sep 2026 06:02:46 +0000
Received: from email2.ecloud.global ([2a01:4f9:4b:5387::2] helo=mail2.ecloud.global)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SRG-00000005yv6-30DE;
	Mon, 07 Sep 2026 06:02:44 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id B5691721160;
	Mon,  7 Sep 2026 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1788760956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAVC7+HWaVQEnnbRSHCcKz7r6ECmUII3NjKcSqgDdqE=;
	b=PmA/HmG6YkWmDztp42L5zdma4jFThIPnKvAqNfbKAdesgHuHViEz/9/BsbLyLPrFlMVsMR
	90PURNCV5f0ejRhPmxHXdYpHnShCWVdp5iL/i21PpFNl/H2uZYZ9c3+WkelnaTWFUrGk5B
	iBSfUKxKxkV64Fa5Y7MRVyL/qoQhpp4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1788760956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAVC7+HWaVQEnnbRSHCcKz7r6ECmUII3NjKcSqgDdqE=;
	b=B7cL82PImBfFxeoSczoECpP9wW/1E0dBlifMotXVGSAoewtJC7WP6rAasDziB5y+nt8d9t
	ka/7gR0eTSE8njdmzxtOje2HHaTjLKe6OFXRMXhKUbs66npTNSBI20Odzcy8a+XGIHu3B9
	u6sSUVyaFcRVrbYVNphd1SZ9uMItg/o=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1788760956; a=rsa-sha256; cv=none;
	b=rwRBNY+YtZMISw0XZ4wJRHpzo5Yp5mjZm9wz7veARrU2FXHtXfGXC60RqIcwXWYC5dud+W
	L7dEyuwGnjdl0A8avafm5S5qS1okQ4f9cuM7HuL2m1jEy3RMF9b7rhW97RRaFAfovoOiBa
	OvyG566rnyc+P4JwysSkJgarI/RAlcQ=
Message-ID: <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
Date: Mon, 7 Sep 2026 08:02:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Icenowy Zheng <uwu@icenowy.me>, Dominique Belhachemi <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org,
 sboyd@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
 <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
 <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
 <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_230242_971217_181C4BD1 
X-CRM114-Status: GOOD (  21.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRG9taW5pcXVlIGFuZCBJY2Vub3d5LAoKT24gOS83LzI2IDA2OjAxLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+IOWcqCAyMDI2LTA5LTA25pel55qEIDE3OjE2IC0wNDAw77yMRG9taW5pcXVlIEJl
bGhhY2hlbWnlhpnpgZPvvJoKPj4gT24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxMToxOeKAr0FNIElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPj4+Cj4+PiDlnKggMjAyNi0wOS0w
NuaXpeeahCAxNjo1OSArMDIwMO+8jE1hdWQgU3BpZXJpbmdz5YaZ6YGT77yaCj4+Pj4gT24gOS82
LzI2IDA3OjM5LCBEb21pbmlxdWUgQmVsaGFjaGVtaSB3cm90ZToKPj4+Pj4gT24gU3VuLCBBdWcg
MzAsIDIwMjYgYXQgMTA6MTfigK9BTSBNYXVkIFNwaWVyaW5ncwo+Pj4+PiA8bWF1ZF9zcGllcmlu
Z3NAbXVyZW5hLmlvwqA8bWFpbHRvOm1hdWRfc3BpZXJpbmdzQG11cmVuYS5pbz4+Cj4+Pj4+IHdy
b3RlOgo+Pj4+Pgo+Pj4+PiAgwqDCoMKgIEkgd2FzIHN0aWxsIGhhdmluZyBzb21lIGdsaXRjaGlu
ZyBoYXBwZW5pbmcgb24gdGhlIGRpc3BsYXksCj4+Pj4+IGJ1dAo+Pj4+PiBJJ3ZlCj4+Pj4+ICDC
oMKgwqAgZm91bmQgdGhlIHdheSB0byBmaXggdGhhdCwgdGhlIHF1ZXN0aW9uIGlzIHdoYXQgaXMg
YWN0dWFsbHkKPj4+Pj4gIMKgwqDCoCBoYXBwZW5pbmcgaGVyZS4KPj4+Pj4KPj4+Pj4gIMKgwqDC
oMKgwqDCoMKgIDB4Mjk1OTAwMjAgPC0gMHgwMDAwMDAwNQo+Pj4+PiAgwqDCoMKgIFRoaXMgb25l
IEkgaGF2ZSBubyBpZGVhLCBpdCBpcyAweDAwMDAwMDA5IHdpdGggdGhpcyBwYXRjaAo+Pj4+PiBz
ZXJpZXMgYnV0Cj4+Pj4+ICDCoMKgwqAgd2l0aCB0aGUgdmVuZG9yIGtlcm5lbCBJIGdldCB0aGUg
dmFsdWUgYWJvdmUuIFdoZW4gSSBob29rCj4+Pj4+IHVwIG15Cj4+Pj4+ICDCoMKgwqAgZXh0ZXJu
YWwKPj4+Pj4gIMKgwqDCoCBkaXNwbGF5IChyZWd1bGFyIDE0NDBwKSB0aGlzIGJlY29tZXMgMHgw
MDAwMDAwRCBvbiB0aGUKPj4+Pj4gdmVuZG9yCj4+Pj4+IGtlcm5lbC4KPj4+Pj4KPj4+Pj4gIMKg
wqDCoCBCdXQgSSBjYW4ndCBmaW5kIHRoaXMgcmVnaXN0ZXIgYmVpbmcgd3JpdHRlbiB0byBhbnl3
aGVyZQo+Pj4+PiB0aGVyZT8KPj4+Pj4KPj4+Pj4KPj4+Pj4gTWF5YmUgdGhpcyBuZWVkcyB0byBi
ZSBzd2FwcGVkPwo+Pj4+Pgo+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5j
Cj4+Pj4+ICDCoMKgIC0jZGVmaW5lIHZfSFNZTkNfUE9MQVJJVFkobinCoMKgwqDCoMKgwqDCoMKg
wqAgKChuKSA8PCAzKQo+Pj4+PiAgwqDCoCAtI2RlZmluZSB2X1ZTWU5DX1BPTEFSSVRZKG4pwqDC
oMKgwqDCoMKgwqDCoMKgICgobikgPDwgMikKPj4+Pj4gIMKgwqAgKyNkZWZpbmUgdl9IU1lOQ19Q
T0xBUklUWShuKcKgwqDCoMKgwqDCoMKgwqDCoCAoKG4pIDw8IDIpCj4+Pj4+ICDCoMKgICsjZGVm
aW5lIHZfVlNZTkNfUE9MQVJJVFkobinCoMKgwqDCoMKgwqDCoMKgwqAgKChuKSA8PCAzKQo+Pj4K
Pj4+IFZlcnkgd2VpcmRseSwgdGhlIG9yaWdpbmFsIGRlZmluaXRpb24gaGVyZSBtYXRjaGVzIGN1
cnJlbnQgbWFpbmxpbmUKPj4+IGlubm8taGRtaS5jLCBidXQgdGhlIGNoYW5nZWQgZGVmaW5pdGlv
biBtYXRjaGVzIEpINzExMCB2ZW5kb3IKPj4+IGlubm9faGRtaS5oIFsxXS4KPj4+Cj4+Cj4+IFRo
ZSB2ZW5kb3IgY29kZSBpcyBjb3JyZWN0IGFuZCBtYXRjaGVzIHRoZSBSSzMxMjggVFJNLgo+IAo+
IFRoYW5rcyBmb3IgdGhlIHRpcHMgb24gZG9jdW1lbnRhdGlvbiwgYW5kIEkgdmVyaWZpZWQgdGhp
cy4KPiAKPiBJdCBzZWVtcyB0aGF0IFJvY2tjaGlwIHBlb3BsZSBtYWRlIHRoaXMgYWx3YXlzIHdy
b25nLCBldmVuIHdpdGggdGhlaXIKPiBwcmUtRFJNIGRpc3BsYXkgZHJpdmVyLi4uIFsxXQo+IAo+
IEJUVyBJIGNoZWNrZWQgdGhlIElubm9zaWxpY29uIGRHUFUgZHJpdmVyIGNvZGUsIGFuZCBpdHMg
ZzNfbmVfaGRtaS5oCj4gc291cmNlIGZpbGUgYWxzbyBjb250YWlucyB0aGUgZGVmaW5pdGlvbiBv
ZiBCSVQoMykgYXMgVlNZTkMuIChJdCdzCj4gcXVpdGUgd2VpcmQgdGhhdCBtb3N0IGxvZ2ljIG9m
IHRoYXQgZHJpdmVyIGlzIGluIHNvbWUgLm9fc2hpcHBlZCBibG9iLAo+IGJ1dCBmb3J0dW5hdGVs
eSB0aGUgZzMgbG9naWMgbWlnaHQgYmUgdG9vIG5ldyB0byBiZSBjbG9zZWQgZG93bikKPiAKPiBU
aGFua3MsCj4gSWNlbm93eQo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1s
aW51eC9rZXJuZWwvYmxvYi9yZWxlYXNlLTQuNC9kcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL2hkbWkv
cm9ja2NoaXAtaGRtaXYxL3JvY2tjaGlwX2hkbWl2MV9ody5oI0wxNjEKPiAKPj4KPj4gSERNSV9y
ZWcwOAo+PiAgwqDCoMKgIEJpdMKgIEF0dHLCoCBSZXNldMKgIERlc2NyaXB0aW9uCj4+ICDCoMKg
wqAgM8KgwqDCoCBSV8KgwqDCoCAweDDCoMKgwqAgdnNfcG9sYXJpdHnCoMKgIFZTWU5DIHBvbGFy
aXR5wqDCoCAxJ2IwOiBOZWdhdGl2ZQo+PiAxJ2IxOiBQb3NpdGl2ZQo+PiAgwqDCoMKgIDLCoMKg
wqAgUlfCoMKgwqAgMHgwwqDCoMKgIGhzX3BvbGFyaXR5wqDCoCBIU1lOQyBwb2xhcml0ecKgwqAg
MSdiMDogTmVnYXRpdmUKPj4gMSdiMTogUG9zaXRpdmUKPj4KPj4gTm9ib2R5IG5vdGljZWQgdGhp
cyBzbyBmYXIgYmVjYXVzZSBpbiA3MjBwLzEwODBwIGJvdGggcG9sYXJpdGllcyBhcmUKPj4gcG9z
aXRpdmUsIGJ1dCBNYXVkJ3MgMzoyIHBhbmVsIGhhcyBkaWZmZXJpbmcgSC9WIHBvbGFyaXR5Lgo+
Pgo+PiBCZXN0Cj4+IC1Eb21pbmlxdWUKClRoaXMgYWxzbyBzb2x2ZXMgdGhlIGRldm1lbSBiZWhh
dmlvdXIgSSBzYXcsIG9yIHdlbGwsIGRvZXNuJ3QgcmVhbHkgCmV4cGxhaW4gaXQgYnV0IGRvZXMg
c2hvdyB3aGF0IGlzIGFjdHVhbGx5IGhhcHBlbmluZy4gQXMgSWNlbm93eSBub3RlZCAKKG1heWJl
IHRoYXQgd2FzIG9uIHRlbGVncmFtIG9ubHk/KSB0aGUgaW5uby1oZG1pIHJlZ3MgYXJlIDhiaXQg
aW5zdGVhZCAKb2YgMzIgYml0LgoKV2hhdCBpcyBhY3R1YWxseSBoYXBwZW5pbmcgaXM6CgpkZXZt
ZW0gMHgyOTU5MDAwMCBiIHJlYWRzIDB4Mjk1OTAwMDAgYXMgZXhwZWN0ZWQKYnV0CmRldm1lbSAw
eDI5NTkwMDA0IGIgcmVhZHMgMHgyOTU5MDAwMQpkZXZtZW0gMHgyOTU5MDAwOCBiIHJlYWRzIDB4
Mjk1OTAwMDIKLi4uLgpkZXZtZW0gMHgyOTU5MDAyMCBiIHJlYWRzIDB4Mjk1OTAwMDgKCkZvciBz
b21lIHJlYXNvbiB0aGUgYWRkcmVzc2luZyBpcyB3ZWlyZD8KCldpdGggdGhpcyBjaGFuZ2UsIHRo
ZSBhc3NpZ25lZCBjbG9jayBjaGFuZ2UgYW5kIHJlbW92aW5nIHRoZSAKdl9SRUdfQ0xLX0lOViB8
IHZfUkVHX0NMS19TT1VSQ0VfU1lTIHdyaXRlIHRvIEhETUlfU1lTX0NUUkwsIHRoZSBkaXNwbGF5
IApjb21lcyB1cCBmcm9tIHRoZSBzdGFydCBhcyBpdCBzaG91bGQhCgpLaW5kIHJlZ2FyZHMsCk1h
dWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
