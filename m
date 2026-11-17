Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26461606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iPsBIbw+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a26lEPKG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z6AGF0WWJzL3JlKeUkj9y7E93pmWBxEjT3nDgCeQbaw=; b=iPsBIbw+6fm61/Cyv9UDaKBr86
	b6r9HUDZti+dnqV4qX/7vNez2iUUbaH7MfSy2OkP8YyR1ZGIRpq9PxsoNnzZVd92bL3b7pH55iIiu
	QRFbaK8KQBEGAy8EiPOflpywYBon/nRrBeEHk9zFwzLpRHb8ar0ajXIdLMShr94L04Yw640gFp+3u
	/W8CC0XOxwe56BgpVliXYPnHKdtBrqthAkBlvJ2gvlXgLXnweEhBFDM02fZ7QSFvi5Hdts0QkcRdD
	M13fyxv5hBDKxQYol3I5uTHGanMUZw3SiYrLxO1kotsT3p3oH1zBxGSPt/BVHsEQ7QP+QOFJxCRyW
	kzSHKO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGdl-00000005JZf-0hXL;
	Tue, 17 Nov 2026 10:42:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGdi-00000005JYZ-3hx9
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 10:42:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E867EC4CBCA;
	Tue, 17 Nov 2026 10:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61C145FC81;
	Tue, 17 Nov 2026 10:42:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D08311BC05B4;
	Tue, 17 Nov 2026 11:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794912127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wceIsHyc0JJfV1Tp3tL8VGdKFtx5ifQ7EH/SXRMWvMs=;
	b=a26lEPKGpRLbN20V+Guhv3+Ri3lgmGzYvJ9lhcDbnoztwv8hrDn+FB4Wm5cL8Gq54hX4LI
	Zd/Zx/RRnC4xEEEZkSBZIY3E0VChxBDnl2qBszN/EpA8qomHLNGuZoi4h1mKqMjEeM57RB
	IgfkmPfTFxq1THD6o9kLLC1nehFx22DVjHITXSbV6kJy/1MskOp7pEkNeO8aCZRgve6liv
	iUXR2/+qBbBKrzLeD21mY0v+KPhOZEVl1opMjW1aTG+ZGaaaBInvMdB1XRbGlklCCCrwUB
	dTwnW0TPclaOwwjY9QmOmvSSZKdpJpXlXQ4AiibFZx2eouDgjXeanClktsboyg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ben Zong-You Xie <ben717@andestech.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Randolph Sheng-Kai =?UTF-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/25] riscv: add support for the Metanoia MT2824 SoC and MT5824
 EVB
Date: Tue, 17 Nov 2026 11:41:52 +0100
Message-ID: <_koitdIgQPmk89LDhlUlJQ@bootlin.com>
In-Reply-To: <f6bb6461-c9d0-4685-8c93-7e62691a93b8@sirena.org.uk>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <f6bb6461-c9d0-4685-8c93-7e62691a93b8@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_024215_082537_A640F51B 
X-CRM114-Status: GOOD (  16.85  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpZGF5LCA2IE5vdmVtYmVyIDIwMjYgYXQgMTI6MTU6MDkgQ0VULCBNYXJrIEJyb3duIHdy
b3RlOgo+IE9uIEZyaSwgTm92IDA2LCAyMDI2IGF0IDEwOjI5OjU3QU0gKzAxMDAsIEJlbm/DrnQg
TW9uaW4gd3JvdGU6Cj4gCj4gPiBUaGUgc2VyaWVzIGlzIG9yZ2FuaXNlZCBhczoKPiAKPiA+IC0g
cGF0Y2hlcyAxLTE0IGFkZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MsIHRoZSBNZXRhbm9pYSB2
ZW5kb3IgcHJlZml4LAo+ID4gICB0aGUgUklTQy1WIGJvYXJkIHNjaGVtYSBhbmQgdGhlIFNvQyBi
bG9jayBjb21wYXRpYmxlcwo+ID4gLSBwYXRjaCAxNSBhZGRzIEFSQ0hfTUVUQU5PSUEgYW5kIHNl
bGVjdHMgdGhlIEFYNDVNUCBlcnJhdGEKPiA+IC0gcGF0Y2hlcyAxNi0yMyBhZGQgdGhlIHJlc2V0
LCBTUEksIHdhdGNoZG9nLCBNTUMsIFBIWSBhbmQgVVNCIGNoYW5nZXMKPiA+ICAgbmVlZGVkIHRv
IGJ1aWxkIGFuZCBwcm9iZSBvbiB0aGlzIFNvQwo+ID4gLSBwYXRjaCAyNCBhZGRzIHRoZSBNVDI4
MjQgU29DIGFuZCBNVDU4MjQgRVZCIGRldmljZSB0cmVlcwo+ID4gLSBwYXRjaCAyNSBhZGRzIHRo
ZSBNQUlOVEFJTkVSUyBlbnRyeQo+IAo+IFRoaXMgc29ydCBvZiB0aGluZyB0ZW5kcyB0byB3b3Jr
IGJldHRlciBpZiB5b3Ugc3VibWl0IHRoZSBwYXRjaGVzIGZvcgo+IHN1YnN5c3RlbXMgYXMgc2Vw
YXJhdGUgc2VyaWVzZXMsIGl0IGF2b2lkcyBlbm9ybW91cyBDQyBsaXN0cyBhbmQga2VlcHMKPiB0
aGUgaW5kaXZpZHVhbCBzZXJpZXNlcyBhIG1hbmFnYWJsZSBzaXplLgo+IApJIGFncmVlLCBhbmQg
SSBhbSByZXdvcmtpbmcgdGhlIHNlcmllcyB0aGF0IHdheS4gVmVyc2lvbiAxIHdhcyBpbnRlbmRl
ZAphcyBhbiBvdmVydmlldyBvZiB0aGUgY29tcGxldGUgU29DIHN1cHBvcnQsIGJ1dCBpdCBlbmRl
ZCB1cCBiZWluZyB0b28KYmlnIGZvciBhIHNpbmdsZSBzZXJpZXMuCgpTbyB2ZXJzaW9uIDIgb2Yg
dGhpcyBjdXJyZW50IHNlcmllcyB3aWxsIGJlIG9ubHkgdGhlIHBsYXRmb3JtIGJhc2ljcwooMiBw
YXRjaGVzKToKCiAgLSBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBhZGQgTWV0YW5vaWEg
Q29tbXVuaWNhdGlvbnMKICAtIHJpc2N2OiBhZGQgQVJDSF9NRVRBTk9JQSBLY29uZmlnIGVudHJ5
CgpJdCB3aWxsIGFjdCBhcyBhIHByZXJlcXVpc2l0ZSBmb3IgdGhlIGZvbGxvd2luZyBuZXcgc2Vy
aWVzLCBvbmUgcGVyCnN1YnN5c3RlbToKCiAgLSByZXNldDogYmluZGluZyArIHJlc2V0LXNpbXBs
ZSBzdXBwb3J0ICh0aGUgc2VwYXJhdGUgcmVib290IGJpbmRpbmcKICAgIGlzIGRyb3BwZWQ7IHRo
ZSBSU1QgYmxvY2sgaXMgZGVzY3JpYmVkIGFzIGEgc2luZ2xlIG5vZGUpCiAgLSBTUEk6IG9wdGlv
bmFsIERNQS9JUlEgYmluZGluZywgTVQyODI0IGNvbXBhdGlibGUsIGF0Y3NwaTIwMCBJUlEKICAg
IHN1cHBvcnQgKyBLY29uZmlnCiAgLSB3YXRjaGRvZzogY29tcGF0aWJsZSArIEtjb25maWcKICAt
IE1NQzogY29tcGF0aWJsZSArIE1UMjgyNCBzdXBwb3J0IChzcGxpdCBiZXR3ZWVuIFNELCBlTU1D
IGFuZAogICAgYXV0by1kZXRlY3Rpb24pICsgdHVuaW5nL0hTNDAwCiAgLSBQSFk6IFVTQjIgUEhZ
IGJpbmRpbmcgKyBkcml2ZXIvS2NvbmZpZwogIC0gVVNCIERXQzI6IGJpbmRpbmcgKyBwYXJhbXMK
CkZpbmFsbHksIG9uY2UgdGhlIHN1YnN5c3RlbSBiaW5kaW5ncyBhcmUgYWNjZXB0ZWQgYW5kIHRo
ZSBkcml2ZXJzCmFyZSBxdWV1ZWQsIEknbGwgcG9zdCB0aGUgU29DIERUUyBpbiBpdHMgb3duIHNl
cmllczogYm9hcmQgc2NoZW1hICsKY2FjaGUvUExJQy9QTElDU1cvUExNVCBjb21wYXRpYmxlcyAr
IHRoZSBNVDI4MjQvTVQ1ODI0IERUUyBhbmQgdGhlCk1BSU5UQUlORVJTIGVudHJ5CgpUaGFua3Mg
ZXZlcnlvbmUgZm9yIHRoZSByZXZpZXdzLCBJIHdpbGwgaW50ZWdyYXRlIHRoZSBmZWVkYmFjayBp
biB0aGUKbmV4dCBpdGVyYXRpb25zIG9mIGVhY2ggc2VyaWVzLgoKQmVzdCByZWdhcmRzLApCZW5v
w650CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
