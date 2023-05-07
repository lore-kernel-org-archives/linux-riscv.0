Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD8AC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 04:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTXbGNTxanU3LYzChlGcyq16YHTmt6dbP/xfB4wKNWg=; b=xOvsI1Ykzo1vW8
	qVQ9Zv/m3hbqRkPl1uoIALqTJpQLTOLAakITX5wc0W5yuzgoxTVD7MlQVQlLWaGxczEDPYq+qHEPv
	Sy4htBvFIyjPNdAyN8mIRd6PkAmpOKe/AzoYpSeOcU+caQqtutJwI5iJlheB3BzBcwqRaBANEkEOH
	F5Xwh3528PbDPd33P5ZibuxudgX7yhwcYovE2FyXOjpzlRldR+5MCJLiIhbEDyKPooGtqdq9IELxA
	lxjgWOZIp0xqeVvCtDupJiWCIFW83ANRE9/ltnC90XR7NGnOSf6QpN9xFOpwyckn8urEbu5+eTwni
	yzaGDxFS36cMOVzeYGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvVgJ-00F7OU-1u;
	Sun, 07 May 2023 04:07:31 +0000
Received: from relay1.mymailcheap.com ([149.56.97.132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvVgD-00F7Mi-1x;
	Sun, 07 May 2023 04:07:28 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 078F03E893;
	Sun,  7 May 2023 04:07:15 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id B373E400B2;
	Sun,  7 May 2023 04:07:14 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.98.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 42790404FD;
	Sun,  7 May 2023 04:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1683432433; bh=VKhyQVHv7gLapC8uuccb7Z7+xww5vCN2987TJ7u6i2M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bDEMDKQWkklC2mLfOlH6wt5yA/OwFxxAPr6suM+OhmkaRKcJXXjY0JFFdRNYCw5+g
	 3+185DLOhLfF1TE2xLNtbFCiIGFyy8pgpyTGQwMqZV48I3k1oPYnEP/bfSz0S/tyyR
	 sRAb0aI//lfxoZmTIDzvwcgTiin8RN3WAWzyjiiY=
Message-ID: <835082fe07b77db8598aebabe98a74c2c5ac47d1.camel@aosc.io>
Subject: Re: [PATCH v3 1/5] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329/D1/R528/T113s SPI
From: Icenowy Zheng <icenowy@aosc.io>
To: Maksim Kiselev <bigunclemax@gmail.com>, Andre Przywara
	 <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sun, 07 May 2023 12:06:58 +0800
In-Reply-To: <20230506232616.1792109-2-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
	 <20230506232616.1792109-2-bigunclemax@gmail.com>
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Queue-Id: B373E400B2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.50 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,csie.org,gmail.com,sholland.org,sifive.com,dabbelt.com,eecs.berkeley.edu,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_210725_743644_DCF6D5B0 
X-CRM114-Status: GOOD (  14.59  )
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

5ZyoIDIwMjMtMDUtMDfmmJ/mnJ/ml6XnmoQgMDI6MjYgKzAzMDDvvIxNYWtzaW0gS2lzZWxlduWG
memBk++8mgo+IExpc3RlZCBhYm92ZSBBbGx3aW5uZXIgU29DcyBoYXMgdHdvIFNQSSBjb250cm9s
bGVycy4gRmlyc3QgaXMgdGhlCj4gcmVndWxhcgo+IFNQSSBjb250cm9sbGVyIGFuZCB0aGUgc2Vj
b25kIG9uZSBoYXMgYWRkaXRpb25hbCBmdW5jdGlvbmFsaXR5IGZvcgo+IE1JUEktREJJIFR5cGUg
Qy4KPiAKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmdzIGZvciB0aGVzZSBjb250cm9sbGVycwo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1ha3NpbSBLaXNlbGV2IDxiaWd1bmNsZW1heEBnbWFpbC5jb20+Cj4g
LS0tCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYWxsd2lubmVyLHN1bjZpLWEzMS1z
cGkueWFtbMKgwqAgfCA3Cj4gKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2FsbHdpbm5lcixzdW42aS0KPiBhMzEtc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5lcixzdW42aS0KPiBhMzEtc3BpLnlhbWwKPiBpbmRl
eCBkZTM2YzZhMzRhMGYuLjgwN2RkZTQ1N2UzYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5lcixzdW42aS1hMzEtCj4gc3BpLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5lcixz
dW42aS1hMzEtCj4gc3BpLnlhbWwKPiBAQCAtMjEsNiArMjEsNyBAQCBwcm9wZXJ0aWVzOgo+IMKg
wqDCoMKgIG9uZU9mOgo+IMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMx
LXNwaQo+IMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuOGktaDMtc3BpCj4gK8Kg
wqDCoMKgwqAgLSBjb25zdDogYWxsd2lubmVyLHN1bjUwaS1yMzI5LXNwaQo+IMKgwqDCoMKgwqDC
oCAtIGl0ZW1zOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bjhpLXI0MC1zcGkKPiBAQCAtMjgsNiArMjks
MTIgQEAgcHJvcGVydGllczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lu
bmVyLHN1bjUwaS1oNjE2LXNwaQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3
aW5uZXIsc3VuaXYtZjFjMTAwcy1zcGkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBh
bGx3aW5uZXIsc3VuOGktaDMtc3BpCj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDC
oMKgwqDCoMKgIC0gZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5u
ZXIsc3VuMjBpLWQxLXNwaQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFsbHdpbm5l
cixzdW4yMGktZDEtc3BpLWRiaQoKSW4gdGhpcyBjYXNlIEkgd2lsbCBwcmVmZXIgdG8gbGlzdCBh
bGwgNCBjb21wYXRpYmxlcyBpZiBiYWNrd2FyZApjb21wYXRpYmlsaXR5IGlzIHVzZWQ6CiJhbGx3
aW5uZXIsc3VuMjBpLWQxLXNwaS1kYmkiLCAiYWxsd2lubmVyLXN1bjIwaS1kMS1zcGkiLAoiYWxs
d2lubmVyLHN1bjUwaS1yMzI5LXNwaS1kYmkiLCAiYWxsd2lubmVyLCBzdW41MGktcjMyOS1zcGki
LCBpbiBjYXNlCmlmIHdlIHdlcmUgZ2FpbmluZyBzdXBwb3J0IGZvciBlaXRoZXIgcXVpcmtzIG9m
IEQxIGNvbnRyb2xsZXIgb3IKU1BJX0RCSSBjb250cm9sbGVycy4KCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bjUwaS1yMzI5LXNwaS1kYmkKPiArwqDCoMKgwqDC
oMKgwqDCoMKgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW41MGktcjMyOS1zcGkKPiDCoAo+IMKgwqAg
cmVnOgo+IMKgwqDCoMKgIG1heEl0ZW1zOiAxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
