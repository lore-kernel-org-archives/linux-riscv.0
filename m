Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04365CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZrsNz5h72dh0rwH3nf9gMLNhzVNlX1Ce9qN15R+C/w=; b=ERXwWDZP1Hmigl
	oFlizA/7suMoBjj2MXAoe1LBw2aIC1qZ33dWUe79Q3twJr0r9b7DmLK6eEqo4aBxwnidvLt6QAoG8
	yUwmV1Mt55WjiyGX/enrFoDtamgmEOBf0Edse8HQToXyKnXTR09zjQZoKxaRrENlDh4wMWHgypOBR
	nPs2SvFEzjCUi1dDxlH3luoI/qBRiL/3Xsu3jL3c1F6mEllio2PRJeMyn+e+EUSOlIcYGHdhLrLHE
	ZOkrfRDTQl5ZAyvl4rzP4SI68LI7w7bfiQJ50tHoNBemDD9jJZV0WqRGKE+r6qlk0mFPGlb051kxP
	8zdpCye4gZB3OoRBq+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKUI-00000009wSJ-2Iyu;
	Fri, 24 Oct 2025 16:17:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKUE-00000009wQs-1gHF
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:17:56 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251024161749euoutp02fad459f88a48e61f782fea95f9d917e7~xeaLCfFbX2719227192euoutp02Z
	for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 16:17:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251024161749euoutp02fad459f88a48e61f782fea95f9d917e7~xeaLCfFbX2719227192euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761322669;
	bh=4PztA7zevOPqcZ45Mj+9kAi61mRD2l7rMSjHCR1zJjo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=k/jSHwloFZU2MSW6MgfbmET5vpqUP7ha0eqP9bHTJN2HQ7qMS1yqo9m16uMb4jdEv
	 BIohBBFP6C/+ovZhd8v6YlUWY5+Ctx9MWcaOESEnFG4zhqb8VorGNly3KoG5Lz9kmF
	 /7hqPxwMdGvhX/+6mQObh4cUxQp4s/xW7zH4zfQo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024161747eucas1p232c73d8cbf4cda89571193714279df1e~xeaJ2q_gt2872228722eucas1p2a;
	Fri, 24 Oct 2025 16:17:47 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024161746eusmtip181c8b0d66d145b6fc0382af657d5c8de~xeaItjh0p0255002550eusmtip1G;
	Fri, 24 Oct 2025 16:17:46 +0000 (GMT)
Message-ID: <9f38bb32-9160-4acd-83d7-902d3e1cad72@samsung.com>
Date: Fri, 24 Oct 2025 18:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Elle Rhumsaa
	<elle@weathered-steel.dev>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <p5addblaeofj6xdbgmvrknoozrxh75lsle6uqh4g2qku745ayw@uls3uoftpmuw>
X-CMS-MailID: 20251024161747eucas1p232c73d8cbf4cda89571193714279df1e
X-Msg-Generator: CA
X-RootMTR: 20251016133814eucas1p199cb62658c016e84e34d525e7c87f16e
X-EPHeader: CA
X-CMS-RootMailID: 20251016133814eucas1p199cb62658c016e84e34d525e7c87f16e
References: <CGME20251016133814eucas1p199cb62658c016e84e34d525e7c87f16e@eucas1p1.samsung.com>
	<20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
	<3f9ab01c-470e-48b5-a309-71325ecc4906@samsung.com>
	<p5addblaeofj6xdbgmvrknoozrxh75lsle6uqh4g2qku745ayw@uls3uoftpmuw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_091755_027515_EAEE8EF7 
X-CRM114-Status: GOOD (  22.23  )
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

CgpPbiAxMC8yNC8yNSAxNjowOSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gTWlj
aGFlbCwKPiAKPiBPbiBXZWQsIE9jdCAyMiwgMjAyNSBhdCAxMDozNDo0MkFNICswMjAwLCBNaWNo
YWwgV2lsY3p5bnNraSB3cm90ZToKPj4gU2luY2UgeW91IG1lbnRpb25lZCBsYXN0IHRpbWUgdGhh
dCB5b3Ugd2VyZSBoYXBweSB3aXRoIHRoZSBjb2RlLCB3b3VsZAo+PiB5b3UgcGxlYXNlIGNvbnNp
ZGVyIHBpY2tpbmcgdXAgdGhpcyBzZXJpZXMgZm9yIGxpbnV4LW5leHQ/IEl0IHdvdWxkIGJlCj4+
IGdyZWF0IHRvIGdldCBpdCBpbiBmb3Igd2lkZXIgdGVzdGluZyB0byBlbnN1cmUgZXZlcnl0aGlu
ZyBpcyBzb2xpZC4KPiAKPiBJIHRvb2sgYW5vdGhlciBsb29rLCBhbmQganVzdCBiZWluZyBhYmxl
IHRvIGNvbXBpbGUgYW5kIHVuZGVyc3RhbmRpbmcKPiB2ZXJ5IGxpdHRsZSBSdXN0LCBJIGNhbWUg
dXAgd2l0aDoKPiAKPiBkaWZmIC0tZ2l0IGEvcnVzdC9rZXJuZWwvcHdtLnJzIGIvcnVzdC9rZXJu
ZWwvcHdtLnJzCj4gaW5kZXggNzlmYmIxM2NkNDdmLi5jOGY5ZjViNjFiZmEgMTAwNjQ0Cj4gLS0t
IGEvcnVzdC9rZXJuZWwvcHdtLnJzCj4gKysrIGIvcnVzdC9rZXJuZWwvcHdtLnJzCj4gQEAgLTE1
LDM4ICsxNSw3IEBACj4gICAgICBwcmVsdWRlOjoqLAo+ICAgICAgdHlwZXM6OntBUmVmLCBBbHdh
eXNSZWZDb3VudGVkLCBPcGFxdWV9LAo+ICB9Owo+IC11c2UgY29yZTo6e2NvbnZlcnQ6OlRyeUZy
b20sIG1hcmtlcjo6UGhhbnRvbURhdGEsIHB0cjo6Tm9uTnVsbH07Cj4gK3VzZSBjb3JlOjp7bWFy
a2VyOjpQaGFudG9tRGF0YSwgcHRyOjpOb25OdWxsfTsKPiAtCj4gLS8vLyBQV00gcG9sYXJpdHku
IE1pcnJvcnMgW2BlbnVtIHB3bV9wb2xhcml0eWBdKHNyY3RyZWUvaW5jbHVkZS9saW51eC9wd20u
aCkuCj4gLSNbZGVyaXZlKENvcHksIENsb25lLCBEZWJ1ZywgUGFydGlhbEVxLCBFcSldCj4gLXB1
YiBlbnVtIFBvbGFyaXR5IHsKPiAtICAgIC8vLyBOb3JtYWwgcG9sYXJpdHkgKGR1dHkgY3ljbGUg
ZGVmaW5lcyB0aGUgaGlnaCBwZXJpb2Qgb2YgdGhlIHNpZ25hbCkuCj4gLSAgICBOb3JtYWwsCj4g
LQo+IC0gICAgLy8vIEludmVyc2VkIHBvbGFyaXR5IChkdXR5IGN5Y2xlIGRlZmluZXMgdGhlIGxv
dyBwZXJpb2Qgb2YgdGhlIHNpZ25hbCkuCj4gLSAgICBJbnZlcnNlZCwKPiAtfQo+IC0KPiAtaW1w
bCBUcnlGcm9tPGJpbmRpbmdzOjpwd21fcG9sYXJpdHk+IGZvciBQb2xhcml0eSB7Cj4gLSAgICB0
eXBlIEVycm9yID0gRXJyb3I7Cj4gLQo+IC0gICAgZm4gdHJ5X2Zyb20ocG9sYXJpdHk6IGJpbmRp
bmdzOjpwd21fcG9sYXJpdHkpIC0+IFJlc3VsdDxTZWxmLCBFcnJvcj4gewo+IC0gICAgICAgIG1h
dGNoIHBvbGFyaXR5IHsKPiAtICAgICAgICAgICAgYmluZGluZ3M6OnB3bV9wb2xhcml0eV9QV01f
UE9MQVJJVFlfTk9STUFMID0+IE9rKFBvbGFyaXR5OjpOb3JtYWwpLAo+IC0gICAgICAgICAgICBi
aW5kaW5nczo6cHdtX3BvbGFyaXR5X1BXTV9QT0xBUklUWV9JTlZFUlNFRCA9PiBPayhQb2xhcml0
eTo6SW52ZXJzZWQpLAo+IC0gICAgICAgICAgICBfID0+IEVycihFSU5WQUwpLAo+IC0gICAgICAg
IH0KPiAtICAgIH0KPiAtfQo+IC0KPiAtaW1wbCBGcm9tPFBvbGFyaXR5PiBmb3IgYmluZGluZ3M6
OnB3bV9wb2xhcml0eSB7Cj4gLSAgICBmbiBmcm9tKHBvbGFyaXR5OiBQb2xhcml0eSkgLT4gU2Vs
ZiB7Cj4gLSAgICAgICAgbWF0Y2ggcG9sYXJpdHkgewo+IC0gICAgICAgICAgICBQb2xhcml0eTo6
Tm9ybWFsID0+IGJpbmRpbmdzOjpwd21fcG9sYXJpdHlfUFdNX1BPTEFSSVRZX05PUk1BTCwKPiAt
ICAgICAgICAgICAgUG9sYXJpdHk6OkludmVyc2VkID0+IGJpbmRpbmdzOjpwd21fcG9sYXJpdHlf
UFdNX1BPTEFSSVRZX0lOVkVSU0VELAo+IC0gICAgICAgIH0KPiAtICAgIH0KPiAtfQo+ICAKPiAg
Ly8vIFJlcHJlc2VudHMgYSBQV00gd2F2ZWZvcm0gY29uZmlndXJhdGlvbi4KPiAgLy8vIE1pcnJv
cnMgc3RydWN0IFtgc3RydWN0IHB3bV93YXZlZm9ybWBdKHNyY3RyZWUvaW5jbHVkZS9saW51eC9w
d20uaCkuCj4gQEAgLTg5LDIyICs1OCw2IEBAIGZuIGZyb20od2Y6IFdhdmVmb3JtKSAtPiBTZWxm
IHsKPiAgICAgIH0KPiAgfQo+ICAKPiAtLy8vIFdyYXBwZXIgZm9yIFBXTSBzdGF0ZSBbYHN0cnVj
dCBwd21fc3RhdGVgXShzcmN0cmVlL2luY2x1ZGUvbGludXgvcHdtLmgpLgo+IC0jW3JlcHIodHJh
bnNwYXJlbnQpXQo+IC1wdWIgc3RydWN0IFN0YXRlKGJpbmRpbmdzOjpwd21fc3RhdGUpOwo+IC0K
PiAtaW1wbCBTdGF0ZSB7Cj4gLSAgICAvLy8gQ3JlYXRlcyBhIGBTdGF0ZWAgd3JhcHBlciBieSB0
YWtpbmcgb3duZXJzaGlwIG9mIGEgQyBgcHdtX3N0YXRlYCB2YWx1ZS4KPiAtICAgIHB1YihjcmF0
ZSkgZm4gZnJvbV9jKGNfc3RhdGU6IGJpbmRpbmdzOjpwd21fc3RhdGUpIC0+IFNlbGYgewo+IC0g
ICAgICAgIFN0YXRlKGNfc3RhdGUpCj4gLSAgICB9Cj4gLQo+IC0gICAgLy8vIFJldHVybnMgYHRy
dWVgIGlmIHRoZSBQV00gc2lnbmFsIGlzIGVuYWJsZWQuCj4gLSAgICBwdWIgZm4gZW5hYmxlZCgm
c2VsZikgLT4gYm9vbCB7Cj4gLSAgICAgICAgc2VsZi4wLmVuYWJsZWQKPiAtICAgIH0KPiAtfQo+
IC0KPiAgLy8vIERlc2NyaWJlcyB0aGUgb3V0Y29tZSBvZiBhIGByb3VuZF93YXZlZm9ybWAgb3Bl
cmF0aW9uLgo+ICAjW2Rlcml2ZShEZWJ1ZywgQ2xvbmUsIENvcHksIFBhcnRpYWxFcSwgRXEpXQo+
ICBwdWIgZW51bSBSb3VuZGluZ091dGNvbWUgewo+IEBAIC0xNjQsMTMgKzExNyw2IEBAIHB1YiBm
biBsYWJlbCgmc2VsZikgLT4gT3B0aW9uPCZDU3RyPiB7Cj4gICAgICAgICAgU29tZSh1bnNhZmUg
eyBDU3RyOjpmcm9tX2NoYXJfcHRyKGxhYmVsX3B0cikgfSkKPiAgICAgIH0KPiAgCj4gLSAgICAv
Ly8gR2V0cyBhIGNvcHkgb2YgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhpcyBQV00gZGV2aWNlLgo+
IC0gICAgcHViIGZuIHN0YXRlKCZzZWxmKSAtPiBTdGF0ZSB7Cj4gLSAgICAgICAgLy8gU0FGRVRZ
OiBgc2VsZi5hc19yYXcoKWAgZ2l2ZXMgYSB2YWxpZCBwb2ludGVyLiBgKCpzZWxmLmFzX3Jhdygp
KS5zdGF0ZWAKPiAtICAgICAgICAvLyBpcyBhIHZhbGlkIGBwd21fc3RhdGVgIHN0cnVjdC4gYFN0
YXRlOjpmcm9tX2NgIGNvcGllcyB0aGlzIGRhdGEuCj4gLSAgICAgICAgU3RhdGU6OmZyb21fYyh1
bnNhZmUgeyAoKnNlbGYuYXNfcmF3KCkpLnN0YXRlIH0pCj4gLSAgICB9Cj4gLQo+ICAgICAgLy8v
IFNldHMgdGhlIFBXTSB3YXZlZm9ybSBjb25maWd1cmF0aW9uIGFuZCBlbmFibGVzIHRoZSBQV00g
c2lnbmFsLgo+ICAgICAgcHViIGZuIHNldF93YXZlZm9ybSgmc2VsZiwgd2Y6ICZXYXZlZm9ybSwg
ZXhhY3Q6IGJvb2wpIC0+IFJlc3VsdCB7Cj4gICAgICAgICAgbGV0IGNfd2YgPSBiaW5kaW5nczo6
cHdtX3dhdmVmb3JtOjpmcm9tKCp3Zik7Cj4gCj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2U/CgpIaSBV
d2UsCgpZZXMsIHRoYXQgbWFrZXMgcGVyZmVjdCBzZW5zZS4KCkkgYWdyZWUgd2l0aCB5b3VyIHBh
dGNoLiBJIGluaXRpYWxseSB0aG91Z2h0IHRoZSBTdGF0ZSB3cmFwcGVyIG1pZ2h0IGJlCm5lY2Vz
c2FyeSBmb3IgdGhlIFRIMTUyMCBkcml2ZXIsIGJ1dCBJIHdhcyBhYmxlIHRvIHJlZmFjdG9yIGl0
IHRvIHdvcmsKd2l0aG91dCBpdC4KCk9uIHJlZmxlY3Rpb24sIGJvdGggUG9sYXJpdHkgYW5kIFN0
YXRlIGFyZSByZWFsbHkgcmVtbmFudHMgb2YgdGhlIG9sZGVyLApsZWdhY3kgQVBJLiBSZW1vdmlu
ZyB0aGVtIGlzIGEgZ29vZCBjbGVhbnVwOyBpdCBlbnN1cmVzIGZ1dHVyZSBSdXN0CmRyaXZlcnMg
d2lsbCB1c2UgdGhlIG1vZGVybiB3YXZlZm9ybSBBUEkgYW5kIGF2b2lkcyBwb3RlbnRpYWwgY29u
ZnVzaW9uLgoKPiAKPiBJIGNvbnNpZGVyIGFwcGx5aW5nIHlvdXIgc2VyaWVzIGFuZCBwdXQgdGhl
IGFib3ZlIHNwYWNlIG9uIHRvcCwgdG8KPiBjcmVhdGUgbXkgZmlyc3QgUnVzdCBwYXRjaCA6LSkK
CkdyZWF0ICEgQ29uZ3JhdHVsYXRpb25zIG9uIHlvdXIgZmlyc3QgUnVzdCBwYXRjaCA6LSkKCk9u
IGEgcmVsYXRlZCBub3RlIHRoZXJlIGlzIHRoaXMgZGlmZiBuZWNlc3NhcnkgdG8gbWFrZSBDTElQ
UFkgaGFwcHk6CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIGIvZHJpdmVy
cy9wd20vcHdtX3RoMTUyMC5ycwppbmRleCAwYWQzOGI3OGJlODUuLmE2YzNiNjAyNTE1MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycworKysgYi9kcml2ZXJzL3B3bS9wd21f
dGgxNTIwLnJzCkBAIC0xODUsNyArMTg1LDcgQEAgZm4gcm91bmRfd2F2ZWZvcm1fdG9odygKICAg
ICAgICAgKTsKIAogICAgICAgICBPayhwd206OlJvdW5kZWRXYXZlZm9ybSB7Ci0gICAgICAgICAg
ICBzdGF0dXM6IHN0YXR1cywKKyAgICAgICAgICAgIHN0YXR1cywKICAgICAgICAgICAgIGhhcmR3
YXJlX3dhdmVmb3JtOiB3Zmh3LAogICAgICAgICB9KQogICAgIH0KCkkgY291bGQgcmUtc2VuZCB0
aGUgcGF0Y2hzZXQsIGJ1dCBzaW5jZSB5b3UncmUgbWFraW5nIGEgcGF0Y2ggYW55d2F5Cm1heWJl
IHlvdSB3b3VsZCBhbHNvIGxpa2UgdG8gcGljayB0aGlzID8KCj4gCj4gQmVzdCByZWdhcmRzCj4g
VXdlCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNh
bXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
