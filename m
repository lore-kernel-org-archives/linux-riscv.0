Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513BECCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xArP1lq4rCwf8yjxVWFrYE7IgyaM15bkRiRFsEWUEoQ=; b=241xspFYKt64Ng
	MIFqZWJRAawNze/GL9ciHVtuSH4hfUtJZlkQMcHyJmerW1uVP5iSPj1C6EOdPaIoxyqbIlSpNFhdO
	4J97bavwPu23ZomY50y3vo91QoI3Ph/cNfHze8VrfeVRaCLha1ZJoZiBXORxE5dPEfzAq6Fh9VRy0
	zFF0e5sO0sERRJDOE16ly8MSoxZB38TndSgd1Co2DmzpIupZhe7SzFPz9uYP8hKp6S7rRvo0+KLMe
	mvw0It0Ryyk9UQsiwXI7u1eww6vJgWzl0+cBYCOcKx3nbp+rNLiNlX47642yalXDHJO17effI+msu
	Oizo7kDy6Of7Jw5B8P1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHiYf-000000038FR-0yQk;
	Sat, 08 Nov 2025 13:00:45 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHiYa-000000038Eo-0hoV
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 13:00:44 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id HiYOvhfDuznX9HiYOvZaHP; Sat, 08 Nov 2025 14:00:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1762606833;
	bh=aRGRFm8nQr5WAaRrinpk9KWjIa54yU+4iQS0RwjiVHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dV9AIGO5VvC+elQurmqsLtlcfKPFa9KJWs8T1UvJRBZI65JlxwrheFUYsvpgm+6ts
	 1hHHejsRTLicDpc+yCdmFZ4BG0PM6zrEZT4MCL5zjANBryR2NUeCcGQ/v/zFbq2kTQ
	 nSnB/51xKINEALpZ9sHEvOJatXQlMyqLoKMI/2TH63GNAW83WRTEA8sDY+JgTZGcEu
	 uX14hXVl/IMt+Umpij8cvguLgma1IcTPbhUSU+K2m9/BdkGXzP8fP3lSjDd08ImQTQ
	 Aoa3r8nYM23m/XdHeVqP3R05IsLFaV2dKJYIo0kQ0bxShUNL9CY5nBc03QDNgEJkuw
	 wX6SPDTFC2dyQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Nov 2025 14:00:33 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <120b2f62-25e6-4ea3-9907-230080c61f70@wanadoo.fr>
Date: Sat, 8 Nov 2025 14:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] PCI: spacemit: Add SpacemiT PCIe host driver
To: Alex Elder <elder@riscstar.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com
Cc: dlan@gentoo.org, aurelien@aurel32.net, johannes@erdfelt.com,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251107191557.1827677-1-elder@riscstar.com>
 <20251107191557.1827677-6-elder@riscstar.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251107191557.1827677-6-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_050041_424554_9862C0D0 
X-CRM114-Status: GOOD (  16.51  )
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

TGUgMDcvMTEvMjAyNSDDoCAyMDoxNSwgQWxleCBFbGRlciBhIMOpY3JpdMKgOgo+IEludHJvZHVj
ZSBhIGRyaXZlciBmb3IgdGhlIFBDSWUgaG9zdCBjb250cm9sbGVyIGZvdW5kIGluIHRoZSBTcGFj
ZW1pVAo+IEsxIFNvQy4gIFRoZSBoYXJkd2FyZSBpcyBkZXJpdmVkIGZyb20gdGhlIFN5bm9wc3lz
IERlc2lnbldhcmUgUENJZSBJUC4KPiBUaGUgZHJpdmVyIHN1cHBvcnRzIHRocmVlIFBDSWUgcG9y
dHMgdGhhdCBvcGVyYXRlIGF0IFBDSWUgZ2VuMiB0cmFuc2Zlcgo+IHJhdGVzICg1IEdUL3NlYyku
ICBUaGUgZmlyc3QgcG9ydCB1c2VzIGEgY29tYm8gUEhZLCB3aGljaCBtYXkgYmUKPiBjb25maWd1
cmVkIGZvciB1c2UgZm9yIFVTQiAzIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBF
bGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+IC0tLQoKLi4uCgo+ICtzdGF0aWMgaW50IGsxX3Bj
aWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+ICsJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCXN0cnVjdCBrMV9wY2llICprMTsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJazEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmsxKSwgR0ZQX0tFUk5F
TCk7Cj4gKwlpZiAoIWsxKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCWsxLT5wbXUgPSBz
eXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MoZGV2X29mX25vZGUoZGV2KSwKPiAr
CQkJCQkJICAgICAgIFNZU0NPTl9BUE1VLCAxLAo+ICsJCQkJCQkgICAgICAgJmsxLT5wbXVfb2Zm
KTsKPiArCWlmIChJU19FUlIoazEtPnBtdSkpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGsxLT5wbXUpLAo+ICsJCQkJICAgICAiZmFpbGVkIHRvIGxvb2t1cCBQTVUgcmVn
aXN0ZXJzXG4iKTsKPiArCj4gKwlrMS0+bGluayA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZV9ieW5hbWUocGRldiwgImxpbmsiKTsKPiArCWlmICghazEtPmxpbmspCgppZiAoSVNfRVJS
KGsxLT5saW5rKSkgPwoKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FTk9NRU0sCj4g
KwkJCQkgICAgICJmYWlsZWQgdG8gbWFwIFwibGlua1wiIHJlZ2lzdGVyc1xuIik7CgpNZXNzYWdl
IHdpdGggLUVOT01FTSBhcmUgaWdub3JlZCwgc28gYSBkaXJlY3QgcmV0dXJuIC1FTk9NRU0gaXMg
bGVzcyAKdmVyYm9zZSBhbmQgd2lsbCBiaGF2ZSB0aGUgc2FtZS4gU2VlIFsxXS4KCkJ1dCBpbiB0
aGlzIGNhc2UsIEkgdGhpbmsgaXQgc2hvdWxkIGJlIFBUUl9FUlIoazEtPmxpbmspLgoKWzFdOiAK
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTgtcmMyL3NvdXJjZS9kcml2ZXJz
L2Jhc2UvY29yZS5jI0w1MDE1Cgo+ICsKPiArCWsxLT5wY2kuZGV2ID0gZGV2Owo+ICsJazEtPnBj
aS5vcHMgPSAmazFfcGNpZV9vcHM7Cj4gKwlkd19wY2llX2NhcF9zZXQoJmsxLT5wY2ksIFJFUV9S
RVMpOwo+ICsKPiArCWsxLT5wY2kucHAub3BzID0gJmsxX3BjaWVfaG9zdF9vcHM7Cj4gKwo+ICsJ
LyogSG9sZCB0aGUgUEhZIGluIHJlc2V0IHVudGlsIHdlIHN0YXJ0IHRoZSBsaW5rICovCj4gKwly
ZWdtYXBfc2V0X2JpdHMoazEtPnBtdSwgazEtPnBtdV9vZmYgKyBQQ0lFX0NMS19SRVNFVF9DT05U
Uk9MLAo+ICsJCQlBUFBfSE9MRF9QSFlfUlNUKTsKPiArCj4gKwlyZXQgPSBkZXZtX3JlZ3VsYXRv
cl9nZXRfZW5hYmxlKGRldiwgInZwY2llM3YzIik7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LAo+ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCBcInZwY2ll
M3YzXCIgc3VwcGx5XG4iKTsKPiArCj4gKwlwbV9ydW50aW1lX3NldF9hY3RpdmUoZGV2KTsKPiAr
CXBtX3J1bnRpbWVfbm9fY2FsbGJhY2tzKGRldik7Cj4gKwlkZXZtX3BtX3J1bnRpbWVfZW5hYmxl
KGRldik7Cj4gKwo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgazEpOwo+ICsKPiArCXJl
dCA9IGsxX3BjaWVfcGFyc2VfcG9ydChrMSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHBhcnNlIHJvb3QgcG9ydFxuIik7Cj4gKwo+
ICsJcmV0ID0gZHdfcGNpZV9ob3N0X2luaXQoJmsxLT5wY2kucHApOwo+ICsJaWYgKHJldCkKPiAr
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBpbml0aWFsaXplIGhv
c3RcbiIpOwo+ICsKPiArCXJldHVybiAwOwo+ICt9CgouLi4KCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGsxX3BjaWVfb2ZfbWF0Y2hfdGFibGVbXSA9IHsKPiArCXsgLmNvbXBh
dGlibGUgPSAic3BhY2VtaXQsazEtcGNpZSIsIH0sCj4gKwl7IH0sCgpVbm5lZWRlZCB0cmFpbmxp
bmcgY29tbWEgYWZ0ZXIgYSB0ZXJtaW5hdG9yLgoKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGsxX3BjaWVfZHJpdmVyID0gewo+ICsJLnByb2JlCT0gazFfcGNpZV9w
cm9iZSwKPiArCS5yZW1vdmUJPSBrMV9wY2llX3JlbW92ZSwKPiArCS5kcml2ZXIgPSB7Cj4gKwkJ
Lm5hbWUJCQk9ICJzcGFjZW1pdC1rMS1wY2llIiwKPiArCQkub2ZfbWF0Y2hfdGFibGUJCT0gazFf
cGNpZV9vZl9tYXRjaF90YWJsZSwKPiArCQkucHJvYmVfdHlwZQkJPSBQUk9CRV9QUkVGRVJfQVNZ
TkNIUk9OT1VTLAo+ICsJfSwKPiArfTsKPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihrMV9wY2ll
X2RyaXZlcik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
