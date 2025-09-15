Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA08CAC58F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChxK3W59qPUsQYXR3wkWFIW7aT99qVQj9HfliH/Ri1U=; b=3T18xDqSQMEouK
	IYJc86bCpobZC4/G5bQ1L+dOkujCJiQGXoINKg65QFWiEbCb8o66DfKcobFyiOZk7kEola+qhL5Db
	XwovVl9qyKp/7cpWZl5c7d+GXMafwIZO7VKp2N1SrQOcE3oaQtZN7imvdVpLLiRMxaJDBY2UgsG1B
	zQ+/cw3LTlGcHJWju5vZYW12SJb10UTRcqCcr0XHDUyegJA8okCC5kkMzmYSjsxwDcXiBaiwO13tT
	V1Nn++zvsNGrrXmPschGuh34FIN8OC6C6GloELa3DCmmxZZjUzUy5IFU4zukjiyOVLjBBnrsZm5MB
	ZcWJrG+aVVuCzVBLvt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Mp-00000003A7o-224A;
	Mon, 15 Sep 2025 08:15:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Mm-00000003A6d-3m7v;
	Mon, 15 Sep 2025 08:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 994E2406FF;
	Mon, 15 Sep 2025 08:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93D4C4CEF1;
	Mon, 15 Sep 2025 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924114;
	bh=mpw1Kp/ruV8064l6dcTGb8KpE+L8YZqt3SSB47iPlo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peH66S1MaL/o5ItLrB+kDxmnPsq9tk53l1nKj5PFQAY7UlTolv/oeUbJ8dP4CuEwz
	 yVJ2U3mDcclKIL+pJ7MvcHbLaQXVoadr590BASq+j3+XbNQUhTqfRtZ1BEqRiA23i0
	 E6tcSm3VKTTS42rKBMAYqxTQtX1e1UXcsLTfvnwcoy8FtFWnG1TgKD0IfVIhxPHBo3
	 sA7gPahnYjouLq07rtGr/fspDIqe9abSsQ0v6BWtN4J3podytFClcXZQmEyeckPvf8
	 DxslL10q5RDuxRlv8ZcKXSkNbVjDN0ohQXPN6FGEk3JQdjyUJi/fYc/f927/skzN6M
	 9s8wrlhV8nB7A==
Date: Mon, 15 Sep 2025 13:44:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, vkoul@kernel.org, 
	kishon@kernel.org, dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de, 
	johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de, 
	mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com, 
	quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
Message-ID: <tmdq6iut5z2bzemduovvyarya6ho2lwlxvvqqhazw6dnnyjpq3@72xrd2pij42h>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813184701.2444372-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_011516_980975_AFD0C262 
X-CRM114-Status: GOOD (  19.94  )
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

T24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMDE6NDY6NTdQTSBHTVQsIEFsZXggRWxkZXIgd3JvdGU6
CgpTdWJqZWN0IHNob3VsZCBoYXZlICdwY2knIHByZWZpeCwgbm90ICdwaHknLgoKPiBBZGQgdGhl
IERldmljZSBUcmVlIGJpbmRpbmcgZm9yIHRoZSBQQ0llIHJvb3QgY29tcGxleCBmb3VuZCBvbiB0
aGUKPiBTcGFjZW1pVCBLMSBTb0MuICBUaGlzIGRldmljZSBpcyBkZXJpdmVkIGZyb20gdGhlIFN5
bm9wc3lzIERlc2lnbndhcmUKPiBQQ0llIElQLiAgSXQgc3VwcG9ydHMgdXAgdG8gdGhyZWUgUENJ
ZSBwb3J0cyBvcGVyYXRpbmcgYXQgUENJZSBnZW4gMgo+IGxpbmsgc3BlZWRzICg1IEdUL3NlYyku
ICBPbmUgb2YgdGhlIHBvcnRzIHVzZXMgYSBjb21ibyBQSFksIHdoaWNoIGlzCj4gdHlwaWNhbGx5
IHVzZWQgdG8gc3VwcG9ydCBhIFVTQiAzIHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBF
bGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvcGNpL3NwYWNl
bWl0LGsxLXBjaWUtcmMueWFtbCAgICAgfCAxNDEgKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zcGFjZW1pdCxrMS1wY2llLXJjLnlhbWwK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9z
cGFjZW1pdCxrMS1wY2llLXJjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGNpL3NwYWNlbWl0LGsxLXBjaWUtcmMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMDAwMC4uNmJjY2EyZjkxYTZmZAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3NwYWNlbWl0LGsxLXBjaWUt
cmMueWFtbAo+IEBAIC0wLDAgKzEsMTQxIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGNpL3NwYWNlbWl0LGsxLXBjaWUtcmMu
eWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCj4gKwo+ICt0aXRsZTogU3BhY2VtaVQgSzEgUENJIEV4cHJlc3MgUm9vdCBDb21wbGV4
Cj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNv
bT4KPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBTcGFjZW1pVCBLMSBTb0MgUENJZSByb290
IGNvbXBsZXggY29udHJvbGxlciBpcyBiYXNlZCBvbiB0aGUKPiArICBTeW5vcHN5cyBEZXNpZ25X
YXJlIFBDSWUgSVAuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBj
b25zdDogc3BhY2VtaXQsazEtcGNpZS1yYy55YW1sCj4gKwo+ICsgIHJlZzoKPiArICAgIGl0ZW1z
Ogo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEZXNpZ25XYXJlIFBDSWUgcmVnaXN0ZXJzCj4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IEFUVSBhZGRyZXNzIHNwYWNlCj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IFBDSWUgY29uZmlndXJhdGlvbiBzcGFjZQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBMaW5r
IGNvbnRyb2wgcmVnaXN0ZXJzCj4gKwo+ICsgIHJlZy1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsg
ICAgICAtIGNvbnN0OiBkYmkKPiArICAgICAgLSBjb25zdDogYXR1Cj4gKyAgICAgIC0gY29uc3Q6
IGNvbmZpZwo+ICsgICAgICAtIGNvbnN0OiBsaW5rCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIGl0
ZW1zOgo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEV0MgUENJZSBEYXRhIEJ1cyBJbnRlcmZhY2Ug
KERCSSkgY2xvY2sKPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFdDIFBDSWUgYXBwbGljYXRpb24g
QVhJLWJ1cyBNYXN0ZXIgaW50ZXJmYWNlIGNsb2NrCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IERX
QyBQQ0llIGFwcGxpY2F0aW9uIEFYSS1idXMgU2xhdmUgaW50ZXJmYWNlIGNsb2NrLgo+ICsKPiAr
ICBjbG9jay1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBkYmkKPiArICAg
ICAgLSBjb25zdDogbXN0cgo+ICsgICAgICAtIGNvbnN0OiBzbHYKPiArCj4gKyAgcmVzZXRzOgo+
ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IERXQyBQQ0llIERhdGEgQnVzIElu
dGVyZmFjZSAoREJJKSByZXNldAo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEV0MgUENJZSBhcHBs
aWNhdGlvbiBBWEktYnVzIE1hc3RlciBpbnRlcmZhY2UgcmVzZXQKPiArICAgICAgLSBkZXNjcmlw
dGlvbjogRFdDIFBDSWUgYXBwbGljYXRpb24gQVhJLWJ1cyBTbGF2ZSBpbnRlcmZhY2UgcmVzZXQu
Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdsb2JhbCByZXNldDsgbXVzdCBiZSBkZWFzc2VydGVk
IGZvciBQSFkgdG8gZnVuY3Rpb24KPiArCj4gKyAgcmVzZXQtbmFtZXM6Cj4gKyAgICBpdGVtczoK
PiArICAgICAgLSBjb25zdDogZGJpCj4gKyAgICAgIC0gY29uc3Q6IG1zdHIKPiArICAgICAgLSBj
b25zdDogc2x2Cj4gKyAgICAgIC0gY29uc3Q6IGdsb2JhbAo+ICsKPiArICBpbnRlcnJ1cHRzLWV4
dGVuZGVkOgo+ICsgICAgbWF4SXRlbXM6IDEKCldoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgdGhpcyBw
cm9wZXJ0eT8gSXMgaXQgZm9yIE1TSSBvciBJTlR4PwoKPiArCj4gKyAgc3BhY2VtaXQsc3lzY29u
LXBtdToKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBQSGFuZGxlIHRoYXQgcmVmZXJzIHRv
IHRoZSBBUE1VIHN5c3RlbSBjb250cm9sbGVyLCB3aG9zZQo+ICsgICAgICByZWdtYXAgaXMgdXNl
ZCBpbiBtYW5hZ2luZyByZXNldHMgYW5kIGxpbmsgc3RhdGUuCj4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gKwo+ICsgIGRldmljZV90eXBlOgo+
ICsgICAgY29uc3Q6IHBjaQo+ICsKPiArICBtYXgtbGluay1zcGVlZDoKPiArICAgIGNvbnN0OiAy
CgpXaHkgZG8geW91IG5lZWQgdG8gbGltaXQgaXQgdG8gNSBHVC9zIGFsd2F5cz8KCj4gKwo+ICsg
IG51bS12aWV3cG9ydDoKPiArICAgIGNvbnN0OiA4Cj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNv
bXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gY2xvY2tzCj4gKyAgLSBjbG9jay1uYW1lcwo+ICsg
IC0gcmVzZXRzCj4gKyAgLSByZXNldC1uYW1lcwo+ICsgIC0gc3BhY2VtaXQsc3lzY29uLXBtdQo+
ICsgIC0gIiNhZGRyZXNzLWNlbGxzIgo+ICsgIC0gIiNzaXplLWNlbGxzIgo+ICsgIC0gZGV2aWNl
X3R5cGUKPiArICAtIG1heC1saW5rLXNwZWVkCgpTYW1lIGNvbW1lbnQgYXMgYWJvdmUuCgo+ICsg
IC0gYnVzLXJhbmdlCj4gKyAgLSBudW0tdmlld3BvcnQKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svc3BhY2VtaXQsazEtc3lzY29uLmg+Cj4gKyAgICBwY2llMDogcGNpZUBj
YTAwMDAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1wY2llLXJjIjsK
PiArICAgICAgICByZWcgPSA8MHgwIDB4Y2EwMDAwMDAgMHgwIDB4MDAwMDEwMDA+LAo+ICsgICAg
ICAgICAgICAgIDwweDAgMHhjYTMwMDAwMCAweDAgMHgwMDAxZmYyND4sCj4gKyAgICAgICAgICAg
ICAgPDB4MCAweDhmMDAwMDAwIDB4MCAweDAwMDAyMDAwPiwKPiArICAgICAgICAgICAgICA8MHgw
IDB4YzBiMjAwMDAgMHgwIDB4MDAwMDEwMDA+Owo+ICsgICAgICAgIHJlZy1uYW1lcyA9ICJkYmki
LAo+ICsgICAgICAgICAgICAgICAgICAgICJhdHUiLAo+ICsgICAgICAgICAgICAgICAgICAgICJj
b25maWciLAo+ICsgICAgICAgICAgICAgICAgICAgICJsaW5rIjsKPiArCj4gKyAgICAgICAgcmFu
Z2VzID0gPDB4MDEwMDAwMDAgMHg4ZjAwMjAwMCAweDAgMHg4ZjAwMjAwMCAweDAgMHgxMDAwMDA+
LAoKSS9PIHBvcnQgQ1BVIGFkZHJlc3Mgc3RhcnRzIGZyb20gMC4KCi0gTWFuaQoKLS0gCuCuruCu
o+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
