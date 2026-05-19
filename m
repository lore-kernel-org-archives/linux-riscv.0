Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F6CCD5BA4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy2qgYoHQVZtOvUS3kndKldjXryC8tby1J+/ejUkY/E=; b=BpA/CFHGDxXDP0
	BOdoNlym2fbm3lAc00TfK4ri5RW1fuvKrZpzeOh7QEgh2Hv+sxBTPpn+eddCQcbyw/anR3q7BQi/y
	indVwYWKxJoHrNR7qpiyI99SotqjNiDpMaBflUzjKxGsjsXZ4PYyhflaYrjHnjHvgQVq/p+Ud5dZd
	FNmMCFVzlxF/d6uuBIj12Jlng0KLufMJf82durWsAMzQJHHSrk0X+EPjXJD4j+nYnmO+/sfWHQhYv
	mY4VmynhbE1RVOE5iieR9p7jwTVVQapLeP05K529ZrqJbAct5CFHJbUFrmPswGxGOnTm5qxzr1JWD
	TvR4z71ThCvQrs5tVP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKxS-00000001k5C-08Av;
	Tue, 19 May 2026 13:58:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKxP-00000001k3y-2Ot2;
	Tue, 19 May 2026 13:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E04B160121;
	Tue, 19 May 2026 13:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AC3C2BCB3;
	Tue, 19 May 2026 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199082;
	bh=nfEX+4aODCvAUv+wyKcqPTid35QTc5cD/VwXCz3ADcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjXyKLC6RnfU2IV5vALZIj8Ip/8qoyK/R3psuwMTG3JXO9BTcuOc3el0D8NNI8chT
	 s0gGRepmdjn02maEMVKdztKHkmL0PIRI1De0REdgunGfSBH+Jxn7oMMz0xGiu00Bnm
	 V2FTqeNiIYu+Dh6VViDLtkb4Ds0j2QzD96R1MrZyXxs7u8yH5s+l1TzD4x35lylgJ3
	 9/G+prDp/+eIrDIqw6OrAJVNIFWXJr5E3BqmCHSGMhvHJnGYTvBoElvWGf0y8kqAcN
	 2Iq5THM2nomRkDRaKihObdG6sjEnVdNnX2RH/YlaWNy/FEJXedmSno2xWIrD0A4HU7
	 zfFdSHFaj+oqg==
Date: Tue, 19 May 2026 19:27:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
Message-ID: <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
References: <20260509135152.2241235-1-18255117159@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260509135152.2241235-1-18255117159@163.com>
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

T24gU2F0LCBNYXkgMDksIDIwMjYgYXQgMDk6NTE6NDlQTSArMDgwMCwgSGFucyBaaGFuZyB3cm90
ZToKPiBUaGUgRFdDIFBDSWUgY29yZSBhbmQgaXRzIG1hbnkgcGxhdGZvcm0gZHJpdmVycyByZXBl
YXRlZGx5IGNhbGwKPiBkd19wY2llX2ZpbmRfY2FwYWJpbGl0eShwY2ksIFBDSV9DQVBfSURfRVhQ
KSB0byBvYnRhaW4gdGhlIG9mZnNldCBvZiB0aGUKPiBQQ0kgRXhwcmVzcyBDYXBhYmlsaXR5IHN0
cnVjdHVyZS4gVGhpcyBpcyB3YXN0ZWZ1bCBhbmQgbWFrZXMgdGhlIGNvZGUKPiB2ZXJib3NlLiBB
bmQgc29tZSBldmVuIHNlYXJjaCBmb3IgdGhlIFBDSV9DQVBfSURfRVhQIG9mZnNldCB2YWx1ZSB3
aXRoaW4KPiB0aGUgc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb25zLgo+IAoKU2FzaGlrbyBoYXMgZmxh
Z2dlZCBzb21lIHJlYWwgaXNzdWVzIHdpdGggdGhpcyBzZXJpZXMgaW4gYWNjZXNzaW5nIERCSSBz
cGFjZQp2ZXJ5IGVhcmx5IGFuZCAncGNpLT5wY2llX2NhcCcgYmVpbmcgMC4KClRob3NlIG5lZWRz
IHRvIGJlIGZpeGVkLgoKLSBNYW5pCgo+IEFkZCBhIGNhY2hlZCBwY2llX2NhcCBmaWVsZCBpbiBz
dHJ1Y3QgZHdfcGNpZSBhbmQgYSBoZWxwZXIKPiBkd19wY2llX2dldF9wY2llX2NhcCgpIHRvIGlu
aXRpYWxpemUgaXQgb25jZSBhdCBwcm9iZSB0aW1lLiBUaGVuIHJlcGxhY2UKPiBhbGwgZXhwbGlj
aXQgY2FwYWJpbGl0eSBzZWFyY2hlcyB3aXRoIHRoZSBjYWNoZWQgdmFsdWUgYWNyb3NzIHRoZQo+
IGVudGlyZSBkd2Mgc3VidHJlZS4KPiAKPiBIYW5zIFpoYW5nICgzKToKPiAgIFBDSTogZHdjOiBB
ZGQgcGNpZV9jYXAgZmllbGQgYW5kIGhlbHBlciBpbiBkZXNpZ253YXJlIGhlYWRlcgo+ICAgUENJ
OiBkd2M6IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNldCBpbiBjb3JlCj4gICBQQ0k6
IGR3YzogU2ltcGxpZnkgcGxhdGZvcm0gZHJpdmVycyB1c2luZyBjYWNoZWQgY2FwYWJpbGl0eSBv
ZmZzZXQKPiAKPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYyAgICAgICAg
IHwgIDYgKy0tCj4gIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyAg
ICB8ICA0ICstCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jICAgICAg
ICB8ICA0ICstCj4gIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMg
ICB8ICA0ICstCj4gIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3Qu
YyB8ICA0ICstCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5j
ICB8IDE2ICsrKy0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndh
cmUuaCAgfCAxNyArKysrKysrCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHct
cm9ja2NoaXAuYyB8IDE1ICsrKy0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWVzd2luLmMgICAgICAgfCAgMyArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWZ1NzQwLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWludGVsLWd3LmMgICAgfCAgMiArLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXFjb20tZXAuYyAgICAgfCAxMSArKy0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtcWNvbS5jICAgICAgICB8IDI0ICsrKystLS0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2llLXNvcGhnby5jICAgICAgfCAgOCArKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIHwgIDUgKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1zcGVhcjEzeHguYyAgIHwgIDYgKy0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtdGVncmExOTQuYyAgICB8IDUxICsrKysrKystLS0tLS0tLS0tLS0KPiAgMTcg
ZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pCj4gCj4gCj4g
YmFzZS1jb21taXQ6IDcwMzkwNTAxZDE5NDRkNGU1YjhmNzM1MmJlMTgwZmNlYjNhNDQxMzIKPiAt
LSAKPiAyLjM0LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+
4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
