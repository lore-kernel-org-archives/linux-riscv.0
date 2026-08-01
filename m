Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B001C55173
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFtLFJwvUC2fiNstXgKn+q3EqdwSclIRiD3EXLq4lHM=; b=0jT5lbhVrMM0hS
	fXAJ3tF8WA4YekfloQ3ZCEjKGUlfkkAWo/m0jajZRyPWcW4NyEn4oWe5e5a+mizwzhD9ufjP/pKZP
	w47YMjZQk76mpOJjRVL/fjp3MhsL8z/a7iGR2fcj0ags1vemza9XhiFmukbzaZvGROAOYhslvtcPl
	vbq22bsza8zIV7wEBsMpVUyuUtD+47h5pVKZJyCF0DQl/KsBxElyfpj73JI9qsBrfkq0lmNNxfZ6T
	sB+3ZYaXoDYvvBqhd0ddbuQyUMI5wCwva5NikxipyBd5RwlY4/069NhHEQbTSTNhUrMEcDFl4EQYc
	Qtys0I/6NulTKv1p4lbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDlM-0000000EvqF-3ZOM;
	Sat, 01 Aug 2026 17:44:44 +0000
Received: from mail-106113.protonmail.ch ([79.135.106.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqDlI-0000000Evpp-1MMm
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 17:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1785606275; x=1785865475;
	bh=GEnf/aEUeF5h5noLn7GPe6Z4ZE8ClVmcGqH+KCbBXJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=J0Xo2fx5hC6OiriflfmKS/PP8suzBKCpm0cqcbRCFfQhn8RF7TDrqDJhPpLr2liYb
	 /aeDXqSSr/sNF+/UwhjmCfpTm40X4B0fxWLHez1Tow1p1eSEdc1ZNfwznOnzaNc/uH
	 PiVpB+uewXSrDqA9eglw8Jx7TVajRxvCBQMp0OX0s/yCJZcB4iJc5A0uNofWToRFty
	 nWE/xV9JVDfgYrZxaq0fonCTDwmPojO3sIXJGvfjeEoCVzkTd7gAe47owTgZbmtPK3
	 UgZaRIWDoxCmrJWTjCazKL+a6jsku2/Nay2sSmF1YS/G/w5QBGW7Xjc0t8TkCj3YyI
	 VD8oEKEnzMlnw==
X-Pm-Submission-Id: 4hC9L32F1Tz1DDrb
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
	Boqun Feng <boqun@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Maurice <mhi@mailbox.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v5 4/4] rust: clk: use 'kernel vertical style' for imports
Date: Sat,  1 Aug 2026 20:44:24 +0300
Message-ID: <20260801174426.926785-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260706-clk-type-state-v5-4-67c5f326a16c@collabora.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com> <20260706-clk-type-state-v5-4-67c5f326a16c@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_104441_178687_9F16D6EE 
X-CRM114-Status: GOOD (  13.17  )
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

T24gTW9uLCAwNiBKdWwgMjAyNiAxMTozNzoxNSAtMDMwMA0KRGFuaWVsIEFsbWVpZGEgPGRhbmll
bC5hbG1laWRhQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KDQo+IENvbnZlcnQgYWxsIGltcG9ydHMg
dG8gdXNlIHRoZSBuZXcgaW1wb3J0IHN0eWxlLiBUaGlzIHdpbGwgbWFrZSBpdCBlYXNpZXINCj4g
dG8gbGFuZCBuZXcgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLg0KPiANCj4gTm8gY2hhbmdlIG9mIGZ1
bmN0aW9uYWxpdHkgaW1wbGllZC4NCj4gDQo+IExpbms6IGh0dHBzOi8vZG9jcy5rZXJuZWwub3Jn
L3J1c3QvY29kaW5nLWd1aWRlbGluZXMuaHRtbCNpbXBvcnRzDQo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPg0KDQpSZXZpZXdlZC1i
eTogT251ciDDlnprYW4gPHdvcmtAb251cm96a2FuLmRldj4NCg0KPiAtLS0NCj4gIHJ1c3Qva2Vy
bmVsL2Nsay5ycyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2Nsay5ycyBiL3J1c3Qv
a2VybmVsL2Nsay5ycw0KPiBpbmRleCBiOWE0NGY4Mzg0M2EuLmU2NzcxNTZmZmQyMSAxMDA2NDQN
Cj4gLS0tIGEvcnVzdC9rZXJuZWwvY2xrLnJzDQo+ICsrKyBiL3J1c3Qva2VybmVsL2Nsay5ycw0K
PiBAQCAtODAsMTMgKzgwLDIzIEBAIGZuIGZyb20oZnJlcTogSGVydHopIC0+IFNlbGYgew0KPiAg
bW9kIGNvbW1vbl9jbGsgew0KPiAgICAgIHVzZSBzdXBlcjo6SGVydHo7DQo+ICAgICAgdXNlIGNy
YXRlOjp7DQo+IC0gICAgICAgIGRldmljZTo6e0JvdW5kLCBEZXZpY2V9LA0KPiAtICAgICAgICBl
cnJvcjo6e2Zyb21fZXJyX3B0ciwgdG9fcmVzdWx0LCBSZXN1bHR9LA0KPiArICAgICAgICBkZXZp
Y2U6OnsNCj4gKyAgICAgICAgICAgIEJvdW5kLA0KPiArICAgICAgICAgICAgRGV2aWNlLCAvLw0K
PiArICAgICAgICB9LA0KPiArICAgICAgICBlcnJvcjo6ew0KPiArICAgICAgICAgICAgZnJvbV9l
cnJfcHRyLA0KPiArICAgICAgICAgICAgdG9fcmVzdWx0LCAvLw0KPiArICAgICAgICB9LA0KPiAg
ICAgICAgICBwcmVsdWRlOjoqLA0KPiAtICAgICAgICBzeW5jOjpBcmMsDQo+ICsgICAgICAgIHN5
bmM6OkFyYywgLy8NCj4gICAgICB9Ow0KPiAgDQo+IC0gICAgdXNlIGNvcmU6OnttYXJrZXI6OlBo
YW50b21EYXRhLCBtZW06Ok1hbnVhbGx5RHJvcCwgcHRyfTsNCj4gKyAgICB1c2UgY29yZTo6ew0K
PiArICAgICAgICBtYXJrZXI6OlBoYW50b21EYXRhLA0KPiArICAgICAgICBtZW06Ok1hbnVhbGx5
RHJvcCwNCj4gKyAgICAgICAgcHRyLCAvLw0KPiArICAgIH07DQo+ICANCj4gICAgICBtb2QgcHJp
dmF0ZSB7DQo+ICAgICAgICAgIHB1YiB0cmFpdCBTZWFsZWQge30NCj4gQEAgLTE5Myw5ICsyMDMs
MTUgQEAgaW1wbDxTdGF0ZTogQ2xrU3RhdGU+IEZyb208RXJyb3I8U3RhdGU+PiBmb3Iga2VybmVs
OjplcnJvcjo6RXJyb3Igew0KPiAgICAgICAgICAvLy8gb3JpZ2luYWwgW2BDbGtgXSwgZS5nLjoN
Cj4gICAgICAgICAgLy8vDQo+ICAgICAgICAgIC8vLyBgYGANCj4gLSAgICAgICAgLy8vIHVzZSBr
ZXJuZWw6OmNsazo6e0NsaywgRW5hYmxlZCwgVW5wcmVwYXJlZH07DQo+IC0gICAgICAgIC8vLyB1
c2Uga2VybmVsOjpkZXZpY2U6OntCb3VuZCwgRGV2aWNlfTsNCj4gLSAgICAgICAgLy8vIHVzZSBr
ZXJuZWw6OmVycm9yOjpSZXN1bHQ7DQo+ICsgICAgICAgIC8vLyB1c2Uga2VybmVsOjpjbGs6OnsN
Cj4gKyAgICAgICAgLy8vICAgICBDbGssDQo+ICsgICAgICAgIC8vLyAgICAgRW5hYmxlZCwNCj4g
KyAgICAgICAgLy8vICAgICBVbnByZXBhcmVkLCAvLw0KPiArICAgICAgICAvLy8gfTsNCj4gKyAg
ICAgICAgLy8vIHVzZSBrZXJuZWw6OmRldmljZTo6ew0KPiArICAgICAgICAvLy8gICAgIEJvdW5k
LA0KPiArICAgICAgICAvLy8gICAgIERldmljZSwgLy8NCj4gKyAgICAgICAgLy8vIH07DQo+ICAg
ICAgICAgIC8vLw0KPiAgICAgICAgICAvLy8gZm4gZ2V0X2VuYWJsZWQoZGV2OiAmRGV2aWNlPEJv
dW5kPikgLT4gUmVzdWx0PENsazxFbmFibGVkPj4gew0KPiAgICAgICAgICAvLy8gICAgIGxldCBj
bGsgPSBDbGs6OjxVbnByZXBhcmVkPjo6Z2V0KGRldiwgU29tZShjImFwYl9jbGsiKSk/DQo+IEBA
IC0yNDUsOSArMjYxLDE3IEBAIGZuIGZyb20oZXJyOiBFcnJvcjxTdGF0ZT4pIC0+IFNlbGYgew0K
PiAgICAgIC8vLyBUaGUgZm9sbG93aW5nIGV4YW1wbGUgZGVtb25zdHJhdGVzIGhvdyB0byBvYnRh
aW4gYW5kIGNvbmZpZ3VyZSBhIGNsb2NrIGZvciBhIGRldmljZS4NCj4gICAgICAvLy8NCj4gICAg
ICAvLy8gYGBgDQo+IC0gICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6e0NsaywgRW5hYmxlZCwgSGVy
dHosIFVucHJlcGFyZWQsIFByZXBhcmVkfTsNCj4gLSAgICAvLy8gdXNlIGtlcm5lbDo6ZGV2aWNl
Ojp7Qm91bmQsIERldmljZX07DQo+IC0gICAgLy8vIHVzZSBrZXJuZWw6OmVycm9yOjpSZXN1bHQ7
DQo+ICsgICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6ew0KPiArICAgIC8vLyAgICAgQ2xrLA0KPiAr
ICAgIC8vLyAgICAgRW5hYmxlZCwNCj4gKyAgICAvLy8gICAgIEhlcnR6LA0KPiArICAgIC8vLyAg
ICAgUHJlcGFyZWQsDQo+ICsgICAgLy8vICAgICBVbnByZXBhcmVkLCAvLw0KPiArICAgIC8vLyB9
Ow0KPiArICAgIC8vLyB1c2Uga2VybmVsOjpkZXZpY2U6OnsNCj4gKyAgICAvLy8gICAgIEJvdW5k
LA0KPiArICAgIC8vLyAgICAgRGV2aWNlLCAvLw0KPiArICAgIC8vLyB9Ow0KPiAgICAgIC8vLw0K
PiAgICAgIC8vLyBmbiBjb25maWd1cmVfY2xrKGRldjogJkRldmljZTxCb3VuZD4pIC0+IFJlc3Vs
dCB7DQo+ICAgICAgLy8vICAgICAvLyBUaGUgZmFzdGVzdCB3YXkgaXMgdG8gdXNlIGEgdmVyc2lv
biBvZiBgQ2xrOjpnZXRgIGZvciB0aGUgZGVzaXJlZA0KPiBAQCAtMjkyLDggKzMxNiwxMSBAQCBm
biBmcm9tKGVycjogRXJyb3I8U3RhdGU+KSAtPiBTZWxmIHsNCj4gICAgICAvLy8gYW5kIG1vdmUg
YmV0d2VlbiB0aGUgdmFyaWFudHM6DQo+ICAgICAgLy8vDQo+ICAgICAgLy8vIGBgYA0KPiAtICAg
IC8vLyB1c2Uga2VybmVsOjpjbGs6OntDbGssIEVuYWJsZWQsIFByZXBhcmVkfTsNCj4gLSAgICAv
Ly8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsNCj4gKyAgICAvLy8gdXNlIGtlcm5lbDo6Y2xr
Ojp7DQo+ICsgICAgLy8vICAgICBDbGssDQo+ICsgICAgLy8vICAgICBFbmFibGVkLA0KPiArICAg
IC8vLyAgICAgUHJlcGFyZWQsIC8vDQo+ICsgICAgLy8vIH07DQo+ICAgICAgLy8vDQo+ICAgICAg
Ly8vIGVudW0gRGV2aWNlQ2xrIHsNCj4gICAgICAvLy8gICAgIFN1c3BlbmRlZChDbGs8UHJlcGFy
ZWQ+KSwNCj4gQEAgLTMyMyw4ICszNTAsMTEgQEAgZm4gZnJvbShlcnI6IEVycm9yPFN0YXRlPikg
LT4gU2VsZiB7DQo+ICAgICAgLy8vIGVuYWJsZSBhIGNsb25lIG9mIGl0Og0KPiAgICAgIC8vLw0K
PiAgICAgIC8vLyBgYGANCj4gLSAgICAvLy8gdXNlIGtlcm5lbDo6Y2xrOjp7Q2xrLCBFbmFibGVk
LCBQcmVwYXJlZH07DQo+IC0gICAgLy8vIHVzZSBrZXJuZWw6OmVycm9yOjpSZXN1bHQ7DQo+ICsg
ICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6ew0KPiArICAgIC8vLyAgICAgQ2xrLA0KPiArICAgIC8v
LyAgICAgRW5hYmxlZCwNCj4gKyAgICAvLy8gICAgIFByZXBhcmVkLCAvLw0KPiArICAgIC8vLyB9
Ow0KPiAgICAgIC8vLw0KPiAgICAgIC8vLyBmbiB1c2VfY2xrKHByZXBhcmVkX2NsazogJkNsazxQ
cmVwYXJlZD4pIC0+IFJlc3VsdCB7DQo+ICAgICAgLy8vICAgICBsZXQgZW5hYmxlZF9jbGs6IENs
azxFbmFibGVkPiA9IHByZXBhcmVkX2Nsay5jbG9uZSgpLmVuYWJsZSgpPzsNCj4gQEAgLTU1Niw4
ICs1ODYsMTIgQEAgcHViIGZuIGVuYWJsZShzZWxmKSAtPiBSZXN1bHQ8Q2xrPEVuYWJsZWQ+LCBF
cnJvcjxQcmVwYXJlZD4+IHsNCj4gICAgICAgICAgLy8vIGNsb2NrIG9yIHRocmVhZGluZyBpdCB0
aHJvdWdoIGFuIGludGVybWVkaWF0ZSBzdGF0ZSwgZS5nLjoNCj4gICAgICAgICAgLy8vDQo+ICAg
ICAgICAgIC8vLyBgYGANCj4gLSAgICAgICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6e0NsaywgRW5h
YmxlZCwgSGVydHosIFByZXBhcmVkfTsNCj4gLSAgICAgICAgLy8vIHVzZSBrZXJuZWw6OmVycm9y
OjpSZXN1bHQ7DQo+ICsgICAgICAgIC8vLyB1c2Uga2VybmVsOjpjbGs6OnsNCj4gKyAgICAgICAg
Ly8vICAgICBDbGssDQo+ICsgICAgICAgIC8vLyAgICAgRW5hYmxlZCwNCj4gKyAgICAgICAgLy8v
ICAgICBIZXJ0eiwNCj4gKyAgICAgICAgLy8vICAgICBQcmVwYXJlZCwgLy8NCj4gKyAgICAgICAg
Ly8vIH07DQo+ICAgICAgICAgIC8vLw0KPiAgICAgICAgICAvLy8gZm4gcmVhZF9yYXRlKGNsazog
JkNsazxQcmVwYXJlZD4pIC0+IFJlc3VsdDxIZXJ0ej4gew0KPiAgICAgICAgICAvLy8gICAgIGNs
ay53aXRoX2VuYWJsZWQofGNsazogJkNsazxFbmFibGVkPnwgY2xrLnJhdGUoKSkNCj4gDQo+IC0t
IA0KPiAyLjU0LjANCj4gDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
