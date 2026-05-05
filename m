Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EB3CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3DDYlcWDvjjn4p1Y1nocnGa+l/H/8ix0h5v6JeXPE4k=; b=h9qYhDxRQAF3+z
	UThAsFu9HwBwh1XpZVNZaxGW0QSrgdDTvsCJs4Lkw9+a3aEmtwGnWIiq7GXkxCZIMkdqglBuJIwAO
	Mgii+BrR4D8ZvmWuI4GUAI7NGTjGEtY4MvH/GKPpVM69XzgJ2eNQKW/nmvDJbUmYCVH1R6FxxAhbs
	b/3Hz8bAbfRsmB2+CFQ+30u8Sv/v/pudiHvjTlbUich1rcOyCdGfUKpSgklOwUGFMGj0qCat0V3VA
	J+G2LNiWuLP5o3dcNqp0G7zRhTCuQyGzSnwm7xgCaFAw12phJrsCFsJ+x6rUBKdmUXwUCLk7g/gKj
	jEoNOkmMUMiTXL1xAnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIbT-0000000GsYy-0DPx;
	Tue, 05 May 2026 16:26:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIbQ-0000000GsX8-0sVc;
	Tue, 05 May 2026 16:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EC0740403;
	Tue,  5 May 2026 16:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7D5C2BCB4;
	Tue,  5 May 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998391;
	bh=d9oRhAaRGwydDiDuK7BhCRvRWDp8pOBlU9+d0qcoLXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=P3c57A43Ly9U95oakv1tzSfsBDMAQvbGX3L5fDur0PPxN8g/BkGWOrF0IQ1vnb8kn
	 q5FpFULXXt5CFm8Sy/qdB+pGfZ+595OPQ/+H2h/dpiAmaAvc14vlTx4Z7a774smhAG
	 mRi8mWrUgi+n3TQ7klBwMiCHYz3eCKtTXeoo5Vugwd9W8wFUQWC/qxp4tUJmAVvLgS
	 jHSgvFYD9WkXPVvCXJZvfwe/RjozMVbFHi4OoCu3mLeSQZDLHCSt79QQSlDeG2UmtL
	 GPSyoqLckepvJjFkRnrQa3yfyKh+iIz18B0bEQzeLYkJERNnopW8hE0+mQWVZV5SLC
	 bwYA1sJR8mQqw==
Date: Tue, 5 May 2026 11:26:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manikandan K Pillai <mpillai@cadence.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Tom Joseph <tjoseph@cadence.com>
Subject: Re: [PATCH v8 phy-next 01/31] PCI: cadence: Preserve all error codes
 in cdns_plat_pcie_probe()
Message-ID: <20260505162629.GA734488@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260505100523.1922388-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092632_286618_5A5FAA07 
X-CRM114-Status: GOOD (  21.06  )
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

WytjYyBUb20sIGF1dGhvciBvZiBiZDIyODg1YWExODggaW4gY2FzZSB0aGVyZSdzIHNvbWV0aGlu
ZyBzdWJ0bGUgaGVyZV0KCk9uIFR1ZSwgTWF5IDA1LCAyMDI2IGF0IDAxOjA0OjUzUE0gKzAzMDAs
IFZsYWRpbWlyIE9sdGVhbiB3cm90ZToKPiBUaGUgYmxhbWVkIGNvbW1pdCBmdW5jdGlvbmFsbHkg
Y2hhbmdlZCB0aGUgZXJyb3IgcGF0aCBvZgo+IGNkbnNfcGNpZV9ob3N0X3Byb2JlKCksIG5vdyBj
ZG5zX3BsYXRfcGNpZV9wcm9iZSgpLgo+IAo+IFdoZW4gdGhlIG9sZCBjb2RlIHBhdGggZXhlY3V0
ZWQgImdvdG8gZXJyX2dldF9zeW5jIiwgdGhlIFBDSWUgY29udHJvbGxlcgo+IHByb2JlIGZ1bmN0
aW9uIHByb3BhZ2F0ZWQgdGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBlcnJvciBjb2RlLiBUaGUg
bmV3Cj4gY29kZSBkb2Vzbid0LCBhbmQgcmV0dXJucyAwLgo+IAo+IFNpbWlsYXJseSBmb3IgdGhl
ICJnb3RvIGVycl9pbml0IiBwcmV2aW91c2x5IHRyaWdnZXJlZCBieQo+IGNkbnNfcGNpZV9ob3N0
X2luaXQoKSBlcnJvcnMsIGFuZCBub3cgdHJpZ2dlcmVkIGJ5Cj4gY2Ruc19wY2llX2hvc3Rfc2V0
dXAoKSBhbmQgY2Ruc19wY2llX2VwX3NldHVwKCkgZXJyb3JzLiBUaGVzZSBhcmUgbm90Cj4gcHJv
cGFnYXRlZCBhbmQgd2lsbCByZXN1bHQgaW4gcHJvYmluZyBzdWNjZXNzLCB3aGljaCBpcyBpbmNv
cnJlY3QuCj4gCj4gRml4ZXM6IGJkMjI4ODVhYTE4OCAoIlBDSTogY2FkZW5jZTogUmVmYWN0b3Ig
ZHJpdmVyIHRvIHVzZSBhcyBhIGNvcmUgbGlicmFyeSIpCj4gU2lnbmVkLW9mZi1ieTogVmxhZGlt
aXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KPiAtLS0KPiBDYzogQmpvcm4gSGVs
Z2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogIktyenlzenRvZiBXaWxjennFhHNraSIg
PGt3aWxjenluc2tpQGtlcm5lbC5vcmc+Cj4gQ2M6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFs
aXNpQGtlcm5lbC5vcmc+Cj4gQ2M6IE1hbmlrYW5kYW4gSyBQaWxsYWkgPG1waWxsYWlAY2FkZW5j
ZS5jb20+Cj4gQ2M6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+IENj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKSSBndWVzcyB0aGlzIGRyaXZlciBpcyBv
cnBoYW5lZC4KCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgoK
PiB2Ny0+djg6IHBhdGNoIGlzIG5ldywgaXNzdWUgd2FzIGZsYWdnZWQgYnkgU2FzaGlrbwo+IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDQzMDExMDY1Mi41NTg2MjItMS12bGFk
aW1pci5vbHRlYW5AbnhwLmNvbQo+IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVu
Y2UvcGNpZS1jYWRlbmNlLXBsYXQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtcGxhdC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1wbGF0LmMKPiBpbmRleCBiMDY3YTMyOTZkZDMuLjhiMTJh
NDZiNTYwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNp
ZS1jYWRlbmNlLXBsYXQuYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9w
Y2llLWNhZGVuY2UtcGxhdC5jCj4gQEAgLTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgaW50IGNkbnNf
cGxhdF9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAl3aGlsZSAo
cGh5X2NvdW50LS0pCj4gIAkJZGV2aWNlX2xpbmtfZGVsKGNkbnNfcGxhdF9wY2llLT5wY2llLT5s
aW5rW3BoeV9jb3VudF0pOwo+ICAKPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIHJldDsKClRoaXMg
YWZmZWN0cyBjYXNlcyB3aGVyZSBwbV9ydW50aW1lX2dldF9zeW5jKCksCmNkbnNfcGNpZV9ob3N0
X3NldHVwKCksIG9yIGNkbnNfcGNpZV9lcF9zZXR1cCgpIHJldHVybiBmYWlsdXJlLgoKU2VlbXMg
cmlnaHQgdG8gbWUgdG8gZmFpbCB0aGUgcHJvYmUgd2hlbiB0aGVzZSBmYWlsLgoKTm90IGFsbCB1
c2VycyBvZiBwbV9ydW50aW1lX2dldF9zeW5jKCkgY2hlY2sgZm9yIGZhaWx1cmUsIGJ1dCBJIHRo
aW5rCmFsbCB0aGUgb3RoZXIgY29udHJvbGxlciBkcml2ZXJzIHRoYXQgZG8gY2hlY2sgcmV0dXJu
IGZhaWx1cmVzIGZyb20KdGhlIC5wcm9iZSgpLgoKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgY2Ru
c19wbGF0X3BjaWVfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAtLSAK
PiAyLjM0LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
