Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F69606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BF14HXxi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Kyz3CbMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Subject:To:References:In-Reply-To:
	Mime-Version:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xBkJzsiLgsH8pmFka7Dzy5kBAjV+T8lFRaTEIRqUkDY=; b=BF14HXxi4IjlNjKLSOeRT65Xnv
	qqNS2aE+wiYGPkJgMvM0F1Gop1xYgyqgy3ncLNQ+iezHqwKWK+V+fjcB1ajmiIhX69j1pGSm1Bkwd
	Du/6ILO6qMR8VogzrsPJy9esumUMqgkQIyH0klsZU4tdzmYNUr649OKIi1fmdOzYqYhO7KarQmfCf
	S410wHqnwe5ru7a7WZDpbTwKF1OBCvD2fm6J59T3UDhCB6VaOrtbmYKkpeN8NzNiJ1pwO+0EG0ZGJ
	Uxc3iLzUGfKTJugq/M0Avy/lempGeE3OeyaNfKJAV8sEZP/sa/udNI0QR7dVWM4CPcCiPrA+SzHx/
	a8v5kaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqXF-00000001LBU-0Dq1;
	Mon, 16 Nov 2026 06:49:49 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqXB-00000001LB2-36YT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 06:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794811778;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+t8ZxELPYTH2d5u1GirmDH7jb3H83Y/CovQh+JvDD1k=;
 b=Kyz3CbMJUWHiXEGQytBuv3c/9QlVwu5zQFSIZicA/mcuuAuWtpgLCQGM6t5mv53ij56X3A
 TA5wvp/uaCwFhGUA5ehLzIEmE7JbwodCkMMLaPLLcIkez3ADDyu1GE78Xfc5mJvDm9buJg
 xyjJBp6HVMziD6rVFFz0mpwzFgMR0w3gnLJNs524/xxIqsQPjIQHkRBAvEmCBmDxUteM3g
 FRJclOA4rs+hsGxB/gWCahDG8loE6sRqsHwMtuzmJ4CX9EA070OsZ6VMh2jSyxYoVEIgov
 q9wXFXgRMWnBRI3Hb1O42x7Q42DpYC7eRSsNdSaceTtm3bs+eGxJCnNoFDU9xg==
Date: Mon, 16 Nov 2026 14:49:33 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16afaa77f+ee8887+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261114075506-GKB100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io>
	<20261114075506-GKB100523@kernel.org>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_224945_873663_6B4EF376 
X-CRM114-Status: GOOD (  19.38  )
X-Spam-Score: -1.9 (-)
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

SGksIFlpeHVuOgoKPiBGcm9tOiAiWWl4dW4gTGFuIjxkbGFuQGtlcm5lbC5vcmc+Cj4gRGF0ZTrC
oCBTYXQsIE5vdiAxNCwgMjAyNiwgMTU6NTUKCj4gSGkgU2FuZGllLAo+wqAKPiBPbiAxMTozMyBN
b24gMDkgTm92IMKgIMKgICwgU2FuZGllIENhbyB3cm90ZToKPiA+IEFkZCB0aGUgZGV2aWNlIHRy
ZWUgbm9kZSBTREhDSS0wIGNvbnRyb2xsZXIgZm9yIG9uYm9hcmQgTWljcm8gU0QgY2FyZCBzbG90
Lgo+ID7CoAo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZGllIENhbyA8c2FuZGllLmNhb0BkZWVwY29t
cHV0aW5nLmlvPgo+ID4gLS0tCj4gPiDCoC4uLi9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZt
bDEzdjA1LmR0cyDCoCDCoHwgMjIgKysrKysrKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID7CoAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazMtZGVlcGNvbXB1dGluZy1mbWwxM3YwNS5kdHMgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzCj4gPiBp
bmRleCBiY2Q1MzM0ODRhNzMuLjA1MTA0NmZlOTBiMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtZGVlcGNvbXB1dGluZy1mbWwxM3YwNS5kdHMKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtZGVlcGNvbXB1dGluZy1mbWwxM3Yw
NS5kdHMKPiA+IEBAIC0xNzcsNiArMTc3LDI4IEBAICZjb21ib3BoeSB7Cj4gPiDCoCDCoCDCoCDC
oCDCoHN0YXR1cyA9ICJva2F5IjsKPiA+IMKgfTsKPiA+IMKgCj4gLi4KPiA+ICsvKgo+ID4gKyAq
IE9uYm9hcmQgU0QgY2FyZCBzbG90Ogo+ID4gKyAqIFBsZWFzZSBpbnNlcnQgb3IgcmVtb3ZlIHRo
ZSBTRCBjYXJkIHdoaWxlIHRoZSBkZXZpY2UgaXMgcG93ZXJlZCBvZmYuCj4gPiArICogSXQgd29y
a3MgYXMgYSBib290IG1lZGlhLiBzbyBzZXQgaXQgdG8gbm9uLXJlbW92YWJsZS4KPiA+ICsgKi8K
PiBJcyB0aGVyZSBhbnkgcHVibGljIHNjaGVtYXRpYyBhdmFpbGFibGUgZm9yIEZNTDEzVjA1PyBJ
IGd1ZXNzIHRoZXJlIGlzCj4gbm8gQ0QgcGluIChDYXJkIERldGVjdCBwaW4pPyBhcyBubyAiY2Qt
Z3Bpb3MiIHByb3BlcnR5IHNlZW4gaGVyZQo+wqAKPiBUaGUgYWJvdmUgY29tbWVudCBpc24ndCBy
ZWFsbHkgdXNlZnVsIG9yIGV2ZW4gY29ycmVjdCwgSSdkIHN1Z2dlc3QKPiBkcm9wIGl0LgoKSW4g
dmVyc2lvbiAxIFsxXSzCoCB0aGUgcGF0Y2ggaXMgY2QtZ3Bpb3MgPSA8JmdwaW8gSzNfR1BJTyg4
OCkgR1BJT19BQ1RJVkVfTE9XPjsKYnV0IEszX0dQSU8oODgpIGlzIGZha2UgY2QtZ3BpbywgaXQn
cyB0aWVkIGxvdyBvbiBib2FyZC4KU28gSW4gdmVyc2lvbjIgWzJdLCB0aGUgcGF0Y2ggY2hhbmdl
cyB0byBub24tcmVtb3ZhYmxlLgpBbmQgSW4gdmVyc2lvbjMgWzNdLCBhZGQgY29tbWVudC7CoAoK
VGhlIG9wdGlvbnM6IGNkLWdwaW8sIG5vbi1yZW1vdmFibGUsIGJyb2tlbi1jZMKgIGFsbCB3b3Jr
IG9uIHRoaXMgYm9hcmQuCgpXZSBqdXN0IG5lZWQgdG8gZGV0ZWN0IHRoZSBTRCBjYXJkIHdoZW4g
Ym9vdHVwLCBkb24ndCBuZWVkIHRoZSBkcml2ZXLCoAp0byBkZXRlY3QgaG90LXBsdWcgZXZlbnQg
LCBub24tcmVtb3ZhYmxlIHNob3VsZCBiZSBzdWl0YWJsZSBhbmQgZmFzdGVyLMKgCndlIHJlY29t
bWVudCB0byB1c2Ugbm9uLXJlbW92YWJsZS4KCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDkyMjExMDIzMS4zNDI2MDExLTEtc2FuZGllLmNhbwpAZGVlcGNvbXB1dGluZy5p
by8KWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjAwODE2MzMuMzY3Mzcw
NC0xLXNhbmRpZS5jYW8KQGRlZXBjb21wdXRpbmcuaW8vClszXTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYxMTAyMDYwMDEyLjEwMDYyMy0xLXNhbmRpZS5jYW8KQGRlZXBjb21wdXRp
bmcuaW8vCgpCZXN0IHJlZ2FyZHMKU2FuZGllCgo+wqAKPiA+ICsmc2RoY2kwIHsKPiA+ICsgwqAg
wqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCJ1aHMiOwo+ID4gKyDCoCDCoCDCoCDC
oHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+Owo+ID4gKyDCoCDCoCDCoCDCoHBpbmN0cmwtMSA9IDwm
bW1jMV91aHNfY2ZnPjsKPiA+ICsgwqAgwqAgwqAgwqBidXMtd2lkdGggPSA8ND47Cj4gLi4KPiA+
ICsgwqAgwqAgwqAgwqBub24tcmVtb3ZhYmxlOwo+ICJuby1yZW1vdmFibGUiIHByb3BlcnR5IHVz
dWFsbHkgdXNlZCBmb3IgZW1tYyBjaGlwIHNvbGRlcmVkIG9uIGJvYXJkLAo+IMKgc28gdGhlcmUg
aXMgbm8gd2F5IGl0IGNhbiBiZSBwaHlzaWNhbGx5IHJlbW92ZWQuLiBjaGVja8KgCj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtY29udHJvbGxlci1jb21tb24ueWFt
bAo+wqAKPiBGb3IgY2FzZXMgdGhhdCBubyBDRCBwaW4gKG9yIG5vIEdQSU8gQ0QgcGluKSBkZXNp
Z25lZCBmb3IgU0QgY2FyZCBmcm9tCj4gaGFyZHdhcmUgc2NoZW1hdGljIHBlcnNwZWN0aXZlLCB1
c2luZyAiYnJva2VuLWNkIiBpcyBhIG1vcmUgcHJvcGVyIHdheSwKPiBpdCB3aWxsIGZhbGxiYWNr
IHRvIHVzZSBwb2xsIG1lY2hhbmlzbSB0byBkZXRlY3QgdGhlIGNhcmQsIHBsZWFzZSBjaGVjawo+
wqAKPiA+ICsgwqAgwqAgwqAgwqBuby1tbWM7Cj4gPiArIMKgIMKgIMKgIMKgbm8tc2RpbzsKPiA+
ICsgwqAgwqAgwqAgwqBkaXNhYmxlLXdwOwo+ID4gKyDCoCDCoCDCoCDCoGNhcC1zZC1oaWdoc3Bl
ZWQ7Cj4gPiArIMKgIMKgIMKgIMKgdnFtbWMtc3VwcGx5ID0gPCZhbGRvMT47Cj4gPiArIMKgIMKg
IMKgIMKgc2QtdWhzLXNkcjI1Owo+ID4gKyDCoCDCoCDCoCDCoHNkLXVocy1zZHI1MDsKPiA+ICsg
wqAgwqAgwqAgwqBzZC11aHMtc2RyMTA0Owo+ID4gKyDCoCDCoCDCoCDCoHN0YXR1cyA9ICJva2F5
IjsKPiA+ICt9Owo+ID4gKwo+ID4gwqAmdWFydDAgewo+ID4gwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOwo+ID4gwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSA8JnVhcnQw
XzBfY2ZnPjsKPiA+IC0twqAKPiA+IDIuNDMuMAo+wqAKPiAtLcKgCj4gWWl4dW4gTGFuIChkbGFu
KQo+wqAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
