Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47FD606A330
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VntgDNjY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JceQ8P1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rr/9rnGckxgDLaWEW+JRkr3H4xfjyvHtyHIYz+X3y4M=; b=VntgDNjYrB2oDDwfMA5EY7SoFE
	NN1zWcIWg9E6eJuGEmydKanqHE6zaQGr0kudEqyTYJ3v9W5WcQfbpy9/6RenhFbggzLVluWm+/FH3
	Bo3GvNzujiImzxA7kl9Qs3HG5TaN9n6LghltwVPHYZ4khJZmwTuvdGTkNi+vWkvtiruQsKTQVBd3q
	Z5GUdbpIv1CyK1ej4Ii88CqaUfXj7Zv4aVtK+BMyhko/fXjXpoSO1u4HM2/OgDR7Hv25u9GzJ4ayD
	TzH6mHUT8FC3bAZFV2Q0QrDKMTQu4IWqmYSp+Bhb1LrCJdqTycbHFruwiPvYvaAElVARuHutqz+15
	jnRdAvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFrb-00000005CEJ-3Wke;
	Tue, 17 Nov 2026 09:52:31 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFrZ-00000005CD4-0Evz
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:52:30 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 28C8B2010F9;
	Tue, 17 Nov 2026 10:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=JceQ8P1YvvcAgYJe7ihzL79J+o4hSD5fBVrWZec7zdzGh1s8i2AJYtx2p/QzoWU6WjWaGL
	CwMgoajk/LFSC7yH8AzOb0z/1a9httn+J/kidbA0a1kD6ZW6hDpv6poXE2c0dMcPy4tbOe
	jaqfCFUWF8ydzcI+P3vpTb7ykPVuMEaw9OPraptgxdevsX4LE1U2qok29FkfiJB63DJyeD
	fiUAQPST64VUtQIqWMVlMx+93pwz7yPMc/LqXTn2BbzQmRnxCAQcuqShzS604eS+fKd6S4
	+BJuFZ+guxMflFI4PQOro7TUcQvJHm13dsWP2bAitTG+E0EU92y6Smx3ayJqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794909147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYyhq2g9GW6Daj57foPe9lZBcRmom318RZsPjUOH7DM=;
	b=XZQvq75YBL1+uEU3EaDlT52RCB43Byu8CLLP6R90nJivPase/iN90zEHO40pYvO/andz+j
	Jf7SMB2C1GqahaNNM4X7WkMcTCQZX2nJND0IAR1YkiSdJFIInKOvl+sdATPT64reO0s0Vl
	pH1xSG31jRUFcj9npZV3Hz6ZgILKQ3dgZIymtTFgRNSSWw2Dt12QHKQ74YrXA7zPzIq/+4
	0/NGs2rr8+Pto1MaF1qF7BEfTZY4eHu30ww+pCsw6wnhhRqYLMhOGb8I3epoGLtHFMnD/b
	AKVsAAPbpw+5P3FDLavMqxnZL3KjCs2HKe0bg2bNctrlSLFkNyuvKv24XeaRFQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794909147; a=rsa-sha256;
	cv=none;
	b=VV9LGLlnv/oGiiBz0WfRrETpok+uxCmmgd+unQ0oAcBTjK4dailFv0RYDYI6hSYmbec1MR
	B7zP79noqz793nU12SNN+qYk4Tiy6OCdDlYcSG42TDQLGZCDhIuULZJGnKN0qVQBrkYbVv
	4+Ag2GICR7TlFXAcbtMWl1/KC0fJJNaRDM2TOy0hRby5QvRcWwWmcuADQVMw91BjQr1ZAt
	LN62xLqZxRpaFtidn6LVi9+FFBXKpL5t+ht+jFRmbsOmpNCNqzOXvwtKqabt/2MBtZpYpN
	uWgRydYQNROvPA/trSv+oidm5VlCrGeLSUBi8rbbPVbD/9rjEYrNdi9G/c05eA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Daniel Lezcano	
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Tue, 17 Nov 2026 10:52:27 +0100
In-Reply-To: <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
	 <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_015229_247867_DC0B5A99 
X-CRM114-Status: GOOD (  16.23  )
X-Spam-Score: -2.1 (--)
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

T24gRGksIDIwMjYtMTEtMTcgYXQgMDk6NDUgKzAwMDAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4g
U3BhY2VtaVQgSzEgYW5kIEszIGhhdmUgQVBCIHRpbWVycyB0aGF0IGNhbiBwcm92aWRlIGEgc2hh
cmVkIGNsb2NrZXZlbnQKPiBhbG9uZ3NpZGUgdGhlIHBlci1DUFUgUklTQy1WIHRpbWVyLiBVc2Ug
Y291bnRlciAwIGFuZCBpdHMgZmlyc3QgbWF0Y2gKPiBjb21wYXJhdG9yIGFzIGEgb25lc2hvdCBk
ZXZpY2UgYXZhaWxhYmxlIHRvIHRoZSB0aWNrIGJyb2FkY2FzdCBmcmFtZXdvcmsuCj4gCj4gQ291
bnRlciBlbmFibGUgY2hhbmdlcyBjcm9zcyBjbG9jayBkb21haW5zLiBXYWl0IGZvciB0aGUgc3lu
Y2hyb25pemVkCj4gY291bnRlciB2YWx1ZSB0byBzdG9wIGNoYW5naW5nIGJlZm9yZSByZXByb2dy
YW1taW5nIHRoZSBtYXRjaCByZWdpc3RlciwKPiBhbmQgY2hlY2sgaW50ZXJydXB0IGFja25vd2xl
ZGdtZW50IHRocm91Z2ggdGhlIHN0YXR1cyByZWdpc3RlciByYXRoZXIKPiB0aGFuIHJlYWRpbmcg
dGhlIHdyaXRlLW9ubHkgY2xlYXIgcmVnaXN0ZXIuIEJvdW5kIGFsbCBzeW5jaHJvbml6YXRpb24K
PiB3YWl0cyBhbmQgcHJvcGFnYXRlIHByb2dyYW1taW5nIGZhaWx1cmVzIHRvIHRoZSBjbG9ja2V2
ZW50IGNvcmUuCj4gCj4gT2J0YWluIHRoZSBjb3VudGVyIHJhdGUgZnJvbSB0aGUgZnVuY3Rpb25h
bCBjbG9jayBhbmQgcHJvdGVjdCBpdCBhZ2FpbnN0Cj4gcmF0ZSBjaGFuZ2VzLiBLZWVwIHRoZSBj
bG9ja3MgZW5hYmxlZCBmb3IgdGhlIGNsb2NrZXZlbnQgbGlmZXRpbWUgYW5kCj4gcmVzdG9yZSBj
b3VudGVyIGNvbmZpZ3VyYXRpb24gdGhyb3VnaCB0aGUgdGljayByZXN1bWUgY2FsbGJhY2sgd2l0
aG91dAo+IHNsZWVwaW5nIGNsb2NrIG9wZXJhdGlvbnMuIFVzZSBhIHBsYXRmb3JtIGRyaXZlciBz
byBjbG9jayBhbmQgcmVzZXQKPiBwcm92aWRlcnMgY2FuIHByb2JlIGJlZm9yZSB0aGUgdGltZXIg
aXMgcmVnaXN0ZXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9L
Y29uZmlnICAgICAgICAgIHwgIDExICsrCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGUg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3BhY2VtaXQuYyB8
IDMxNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDMyOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvS2NvbmZpZyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZwo+IGluZGV4IGRhODM0ODMy
OTZkNS4uM2U3ZGQ1ZDYyOGNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2Nv
bmZpZwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZwo+IEBAIC0xNjMsNiArMTYz
LDE3IEBAIGNvbmZpZyBSWk4xX1RJTUVSCj4gIAkgICAgLSAyIDMyLWJpdCB0aW1lcnMKPiAgCSAg
VHdvIHRpbWVycyBibG9ja3MgYXJlIGF2YWlsYWJsZSBpbiBSWi9OMSBTb0NzLgo+ICAKPiArY29u
ZmlnIFNQQUNFTUlUX1RJTUVSCj4gKwlib29sICJTcGFjZW1pVCBLMS9LMyB0aW1lciIKPiArCWRl
cGVuZHMgb24gQVJDSF9TUEFDRU1JVCB8fCBDT01QSUxFX1RFU1QKPiArCWRlcGVuZHMgb24gT0Yg
JiYgQ09NTU9OX0NMSyAmJiBSRVNFVF9DT05UUk9MTEVSICYmIEhBU19JT01FTQoKRHJvcCB0aGUg
dW5uZWNlc3NhcnkgUkVTRVRfQ09OVFJPTExFUiBkZXBlbmRlbmN5LMKgdGhlIHJlc2V0IGNvbnRy
b2xsZXIKQVBJIGhhcyBzdHVicyBmb3IgY29uc3VtZXJzLgoKcmVnYXJkcwpQaGlsaXBwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
