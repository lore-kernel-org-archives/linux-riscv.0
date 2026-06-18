Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B668CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jAu7CZkDXQGnv7XvB0WaES1ne+rlGOpRlOgK4uQ8us=; b=Os3UWNF7CW69UO
	y1W+PnS8tZmcqvMTIXyV6afoFolK0lc9xcaHIW024Wx/dh9QGOgrW3W3xZaE4WbBs9yDsuaOaJwz3
	919Mf9aTmFOodzslHNxhfQcD0zPFiF57tMBkUSIUB1Kdu/uIHJ+7AdnfmXR4ItbxzZs5/skvIUzq/
	Ld9hY8sj9qtilddnWjJ21sFq5FVUCZO8kpo2otsYke0Genth1m3w0usgS7POoGCwEX02lFRKokX0T
	BQOh5HEKz5tRXrv6w04pfty2DAMCn3wmpQUf7versnak2t77XICdeQkfHWY6ERFl0vBqlxG35WuLp
	2yNAyAgFE7H4ir47FTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7eU-00000000oNd-0Ld3;
	Thu, 18 Jun 2026 07:59:06 +0000
Received: from mail-244108.protonmail.ch ([109.224.244.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7eP-00000000oMS-0FEZ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 07:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781769537; x=1782028737;
	bh=FQ9h1CNqtUIN9Ufq0CQyLuGN5g3JqgqYIsoSVJmPyDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bu5voEUHxZ16s5NR8RCnQZSzKOtOARepFItcD+renzYYsuo0H9OMI/sh+bvQb8WYR
	 kcl8QhRR6Lk/89oPQ+kCcVsecOdlEjmbIXH3ScoNfbtC0p5/MYwjUkewI2/VOq7Cq3
	 1de2jMTVMIVu00IhN1HxtAbwLH4D1u/ZTvSssC+QmH59KiF1IFKsQT+gGcIJPQbogT
	 iZpROoSfiW/M0lurXIzcW9AXtETcxUXGelZkEu5t4oG/UE/wdFkAdZbvKOux/+52Ts
	 6z89OgPGkxuAmYKvyT1Akt9meuGh61PJebzFQsGydcKaQioBdDyRD1nmdrUL7HlM20
	 1RNW0/QdxAy4A==
X-Pm-Submission-Id: 4ggtQf3jNcz2ScmS
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Brian Masney <bmasney@redhat.com>,
	Boqun Feng <boqun@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v4 3/3] rust: clk: use 'kernel vertical style' for imports
Date: Thu, 18 Jun 2026 10:58:47 +0300
Message-ID: <20260618075848.28017-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com> <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_005901_748250_3386DE65 
X-CRM114-Status: GOOD (  11.84  )
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

T24gVGh1LCAxOCBKdW4gMjAyNiAwMDo0NjozNyAtMDMwMA0KRGFuaWVsIEFsbWVpZGEgPGRhbmll
bC5hbG1laWRhQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KDQo+IENvbnZlcnQgYWxsIGltcG9ydHMg
dG8gdXNlIHRoZSBuZXcgaW1wb3J0IHN0eWxlLiBUaGlzIHdpbGwgbWFrZSBpdCBlYXNpZXINCj4g
dG8gbGFuZCBuZXcgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLg0KPiANCj4gTm8gY2hhbmdlIG9mIGZ1
bmN0aW9uYWxpdHkgaW1wbGllZC4NCj4gDQo+IExpbms6IGh0dHBzOi8vZG9jcy5rZXJuZWwub3Jn
L3J1c3QvY29kaW5nLWd1aWRlbGluZXMuaHRtbCNpbXBvcnRzDQo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPg0KDQpSZXZpZXdlZC1i
eTogT251ciDDlnprYW4gPHdvcmtAb251cm96a2FuLmRldj4NCg0KPiAtLS0NCj4gIHJ1c3Qva2Vy
bmVsL2Nsay5ycyB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2Nsay5ycyBiL3J1c3Qv
a2VybmVsL2Nsay5ycw0KPiBpbmRleCA2OTJlZTg4Y2E3NzIuLjE0MTJhMmYwYWVkZiAxMDA2NDQN
Cj4gLS0tIGEvcnVzdC9rZXJuZWwvY2xrLnJzDQo+ICsrKyBiL3J1c3Qva2VybmVsL2Nsay5ycw0K
PiBAQCAtODAsMTIgKzgwLDIzIEBAIGZuIGZyb20oZnJlcTogSGVydHopIC0+IFNlbGYgew0KPiAg
bW9kIGNvbW1vbl9jbGsgew0KPiAgICAgIHVzZSBzdXBlcjo6SGVydHo7DQo+ICAgICAgdXNlIGNy
YXRlOjp7DQo+IC0gICAgICAgIGRldmljZTo6e0JvdW5kLCBEZXZpY2V9LA0KPiAtICAgICAgICBl
cnJvcjo6e2Zyb21fZXJyX3B0ciwgdG9fcmVzdWx0LCBSZXN1bHR9LA0KPiAtICAgICAgICBwcmVs
dWRlOjoqLA0KPiArICAgICAgICBkZXZpY2U6OnsNCj4gKyAgICAgICAgICAgIEJvdW5kLA0KPiAr
ICAgICAgICAgICAgRGV2aWNlLCAvLw0KPiArICAgICAgICB9LA0KPiArICAgICAgICBlcnJvcjo6
ew0KPiArICAgICAgICAgICAgZnJvbV9lcnJfcHRyLA0KPiArICAgICAgICAgICAgdG9fcmVzdWx0
LA0KPiArICAgICAgICAgICAgUmVzdWx0LCAvLw0KPiArICAgICAgICB9LA0KPiArICAgICAgICBw
cmVsdWRlOjoqLCAvLw0KPiAgICAgIH07DQo+ICANCj4gLSAgICB1c2UgY29yZTo6e21hcmtlcjo6
UGhhbnRvbURhdGEsIG1lbTo6TWFudWFsbHlEcm9wLCBwdHJ9Ow0KPiArICAgIHVzZSBjb3JlOjp7
DQo+ICsgICAgICAgIG1hcmtlcjo6UGhhbnRvbURhdGEsDQo+ICsgICAgICAgIG1lbTo6TWFudWFs
bHlEcm9wLA0KPiArICAgICAgICBwdHIsIC8vDQo+ICsgICAgfTsNCj4gIA0KPiAgICAgIG1vZCBw
cml2YXRlIHsNCj4gICAgICAgICAgcHViIHRyYWl0IFNlYWxlZCB7fQ0KPiBAQCAtMTg5LDggKzIw
MCwxNSBAQCBpbXBsPFN0YXRlOiBDbGtTdGF0ZT4gRnJvbTxFcnJvcjxTdGF0ZT4+IGZvciBrZXJu
ZWw6OmVycm9yOjpFcnJvciB7DQo+ICAgICAgICAgIC8vLyBvcmlnaW5hbCBbYENsa2BdLCBlLmcu
Og0KPiAgICAgICAgICAvLy8NCj4gICAgICAgICAgLy8vIGBgYA0KPiAtICAgICAgICAvLy8gdXNl
IGtlcm5lbDo6Y2xrOjp7Q2xrLCBFbmFibGVkLCBVbnByZXBhcmVkfTsNCj4gLSAgICAgICAgLy8v
IHVzZSBrZXJuZWw6OmRldmljZTo6e0JvdW5kLCBEZXZpY2V9Ow0KPiArICAgICAgICAvLy8gdXNl
IGtlcm5lbDo6Y2xrOjp7DQo+ICsgICAgICAgIC8vLyAgICAgQ2xrLA0KPiArICAgICAgICAvLy8g
ICAgIEVuYWJsZWQsDQo+ICsgICAgICAgIC8vLyAgICAgVW5wcmVwYXJlZCwgLy8NCj4gKyAgICAg
ICAgLy8vIH07DQo+ICsgICAgICAgIC8vLyB1c2Uga2VybmVsOjpkZXZpY2U6OnsNCj4gKyAgICAg
ICAgLy8vICAgICBCb3VuZCwNCj4gKyAgICAgICAgLy8vICAgICBEZXZpY2UsIC8vDQo+ICsgICAg
ICAgIC8vLyB9Ow0KPiAgICAgICAgICAvLy8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsNCj4g
ICAgICAgICAgLy8vDQo+ICAgICAgICAgIC8vLyBmbiBnZXRfZW5hYmxlZChkZXY6ICZEZXZpY2U8
Qm91bmQ+KSAtPiBSZXN1bHQ8Q2xrPEVuYWJsZWQ+PiB7DQo+IEBAIC0yNDAsOCArMjU4LDE3IEBA
IGZuIGZyb20oZXJyOiBFcnJvcjxTdGF0ZT4pIC0+IFNlbGYgew0KPiAgICAgIC8vLyBUaGUgZm9s
bG93aW5nIGV4YW1wbGUgZGVtb25zdHJhdGVzIGhvdyB0byBvYnRhaW4gYW5kIGNvbmZpZ3VyZSBh
IGNsb2NrIGZvciBhIGRldmljZS4NCj4gICAgICAvLy8NCj4gICAgICAvLy8gYGBgDQo+IC0gICAg
Ly8vIHVzZSBrZXJuZWw6OmNsazo6e0NsaywgRW5hYmxlZCwgSGVydHosIFVucHJlcGFyZWQsIFBy
ZXBhcmVkfTsNCj4gLSAgICAvLy8gdXNlIGtlcm5lbDo6ZGV2aWNlOjp7Qm91bmQsIERldmljZX07
DQo+ICsgICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6ew0KPiArICAgIC8vLyAgICAgQ2xrLA0KPiAr
ICAgIC8vLyAgICAgRW5hYmxlZCwNCj4gKyAgICAvLy8gICAgIEhlcnR6LA0KPiArICAgIC8vLyAg
ICAgUHJlcGFyZWQsDQo+ICsgICAgLy8vICAgICBVbnByZXBhcmVkLCAvLw0KPiArICAgIC8vLyB9
Ow0KPiArICAgIC8vLyB1c2Uga2VybmVsOjpkZXZpY2U6OnsNCj4gKyAgICAvLy8gICAgIEJvdW5k
LA0KPiArICAgIC8vLyAgICAgRGV2aWNlLCAvLw0KPiArICAgIC8vLyB9Ow0KPiAgICAgIC8vLyB1
c2Uga2VybmVsOjplcnJvcjo6UmVzdWx0Ow0KPiAgICAgIC8vLw0KPiAgICAgIC8vLyBmbiBjb25m
aWd1cmVfY2xrKGRldjogJkRldmljZTxCb3VuZD4pIC0+IFJlc3VsdCB7DQo+IEBAIC0yODcsNyAr
MzE0LDExIEBAIGZuIGZyb20oZXJyOiBFcnJvcjxTdGF0ZT4pIC0+IFNlbGYgew0KPiAgICAgIC8v
LyBhbmQgbW92ZSBiZXR3ZWVuIHRoZSB2YXJpYW50czoNCj4gICAgICAvLy8NCj4gICAgICAvLy8g
YGBgDQo+IC0gICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6e0NsaywgRW5hYmxlZCwgUHJlcGFyZWR9
Ow0KPiArICAgIC8vLyB1c2Uga2VybmVsOjpjbGs6OnsNCj4gKyAgICAvLy8gICAgIENsaywNCj4g
KyAgICAvLy8gICAgIEVuYWJsZWQsDQo+ICsgICAgLy8vICAgICBQcmVwYXJlZCwgLy8NCj4gKyAg
ICAvLy8gfTsNCj4gICAgICAvLy8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsNCj4gICAgICAv
Ly8NCj4gICAgICAvLy8gZW51bSBEZXZpY2VDbGsgew0KPiBAQCAtNDgxLDcgKzUxMiwxMiBAQCBw
dWIgZm4gZW5hYmxlKHNlbGYpIC0+IFJlc3VsdDxDbGs8RW5hYmxlZD4sIEVycm9yPFByZXBhcmVk
Pj4gew0KPiAgICAgICAgICAvLy8gY2xvY2sgb3IgdGhyZWFkaW5nIGl0IHRocm91Z2ggYW4gaW50
ZXJtZWRpYXRlIHN0YXRlLCBlLmcuOg0KPiAgICAgICAgICAvLy8NCj4gICAgICAgICAgLy8vIGBg
YA0KPiAtICAgICAgICAvLy8gdXNlIGtlcm5lbDo6Y2xrOjp7Q2xrLCBFbmFibGVkLCBIZXJ0eiwg
UHJlcGFyZWR9Ow0KPiArICAgICAgICAvLy8gdXNlIGtlcm5lbDo6Y2xrOjp7DQo+ICsgICAgICAg
IC8vLyAgICAgQ2xrLA0KPiArICAgICAgICAvLy8gICAgIEVuYWJsZWQsDQo+ICsgICAgICAgIC8v
LyAgICAgSGVydHosDQo+ICsgICAgICAgIC8vLyAgICAgUHJlcGFyZWQsIC8vDQo+ICsgICAgICAg
IC8vLyB9Ow0KPiAgICAgICAgICAvLy8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsNCj4gICAg
ICAgICAgLy8vDQo+ICAgICAgICAgIC8vLyBmbiByZWFkX3JhdGUoY2xrOiAmQ2xrPFByZXBhcmVk
PikgLT4gUmVzdWx0PEhlcnR6PiB7DQo+IA0KPiAtLSANCj4gMi41NC4wDQo+IA0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
