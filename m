Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA8AFC592B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ntpf6BWgOwwbFdacXWZzzk1MCXQo7JloYzWhkZAO8Y0=; b=NsOI/Q2aASHBh1
	KgsttsgofRAn2NrJkMFiFsjEi6wbLSxsArzaknJ31BNNnbytpS4piid6sXFg1jKx9EuP4tiJlcW5l
	/iZ4iG33c7IGuG/f9pshhCS0YfXxF6TyCmWjsgqqwxxZ7Ga7Z+Mw9F/BvPKtrG1SmYx0bXGhXaG42
	nKNdMAtRAdlZAVagO/9LIntbEyadGtmZP8hiDqpRrGIsB364KnM19lzDsRGrx/8LM04mmNTQyzvoU
	wMMiJOi+sjkiljn3Eyj6g+xd1F++FhtGQzk3M8dG5KdpYAWugyjsFLFQPJBgTAxhBNKgEQ7XOLQaA
	BD+GTx4LfL1XgRaV0UWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ9j-00000005ymR-2g5U;
	Thu, 26 Feb 2026 11:03:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ9i-00000005ylx-2JFO
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D164760054;
	Thu, 26 Feb 2026 11:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC34C116C6;
	Thu, 26 Feb 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103820;
	bh=7oga6iCNUk9jRhMm4u+2UIsjtpytJlnDqvcuGIHXtRc=;
	h=From:To:Cc:Subject:Date:From;
	b=TvIKm+woEih2Tes1jsGgTSmm26ThO9+CG/I8T5F1peg2+E6BctWWl3tQBcXY70MUi
	 EOZ/ZYGTc1QvKl89ZLkMFUOXxEl2ipsrwNISkgF+vh+S2/B6p+2YCOeQxh3vkYWYNJ
	 CkQfOoIvurgTN1UEbYV2c5hh8VUC+APmvFX7V7YuhJqq+9qvzHtw+rpAkxQW9elBGV
	 /mZYxqn48JXsoHs7KFNcMZ7fbsg7hS2NVPTq6LT46NgRBYCMwQfVSdkjwE2CgWAF1x
	 p3AaiUzPhK0DITD9wStKzK6D/CyYwpuP9FN7dJNQSNKV6o975BLMa3xim0ptrRWctf
	 zwTpz4QrdHk9Q==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 0/8] macb usrio/tsu patches
Date: Thu, 26 Feb 2026 11:03:15 +0000
Message-ID: <20260226-snowshoe-amusable-6716d4ddea11@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3780; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UgZEol6xQ2MytN1F7eCnsymp6056llsTw5xmuhOo5f8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNMpe5k09cf7y+pVVPKlbeJ5rehYprjk02SdHsfv0T oEzE+c+7ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE5JwYGX5tLahvnB1tadM+ 8exuCxWPffpbb5W94GFIrNrbEVj+6x7D/wKVk/bVKfqz3oswxK1jC+Kf1eGw8lbWrOxpYse53y6 K4AIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkhleSBmb2xr
cywKCkFmdGVyIGRvaW5nIHNvbWUgZGVidWdnaW5nIG9mIGJyb2tlbiB0c3UvcHRwIHN1cHBvcnQg
b24gbXBmcywgSSd2ZSBjb21lCnVwIHdpdGggc29tZSB2ZXJ5IHJmYyBwYXRjaGVzIHRoYXQgSSdk
IGxpa2Ugb3BpbmlvbnMgb24gLSBwYXJ0aWN1bGFybHkKYmVjYXVzZSB0aGV5IGltcGFjdCBhIGJ1
bmNoIG9mIHBsYXRmb3JtcyB0aGF0IEkgaGF2ZSBubyBhY2Nlc3MgdG8gYXQgYWxsCmFuZCBoYXZl
IG5vIGlkZWEgaG93IHRoZXkgd29yay4gVGhlIGF0OTEgcGxhdGZvcm1zIEkgY2FuIGp1c3QgYXNr
Ck5pY29sYXMgYWJvdXQgKGFuZCBoZSBhbHJlYWR5IHByb3ZpZGVkIHNvbWUgaW5mbyBkaXJlY3Rs
eSwgc28gSSdtIG5vdApzdXBlciB3b3JyaWVkIGF0IGxlYXN0IGFib3V0IHRoZSB1c3JpbyBwb3J0
aW9uIHRoZXJlKSBidXQgdGhlIG90aGVycwpteSBndXQgc2F5cyBhcmUgbGlrZWx5IGluY29ycmVj
dCBpbiB0aGUgZHJpdmVyIGF0IHRoZSBtb21lbnQuCgpUaGVzZSBwYXRjaGVzIGFyZSBmYWlybHkg
b3BpbmlvbmF0ZWQgYW5kIG5vdCBuZWNlc3NhcmlseSB0ZWNobmljYWxseQpjb3JyZWN0IG9yIHcv
ZS4gVGhlIG9ubHkgdGhpbmcgSSBhbSBjb25maWRlbnQgaW4gc2F5aW5nIHRoYXQgdGhleSBhcmUg
aXMKbW9yZSBkZWxpYmVyYXRlIHRoYW4gd2hhdCdzIGJlaW5nIGRvbmUgYXQgdGhlIG1vbWVudC4K
CkF0IHRoZSB2ZXJ5IGxlYXN0LCBpdCdkIGJlIGdvb2Qgb2YgdGhlIHNvYyB2ZW5kb3IgZm9sa3Mg
Y291bGQgY2hlY2sKdGhlaXIgcGxhdGZvcm1zIGFuZCBzZWUgaWYgdGhlaXIgdXNyaW8gc3R1ZmYg
YWN0dWFsbHkgbGluZXMgdXAgd2l0aCB3aGF0CnRoZSBkcml2ZXIgY3VycmVudGx5IGNhbGxzICJt
YWNiX2RlZmF1bHRfdXNyaW8iLiBPdXJzIGRpZG4ndCBhbmQgaXQgd2FzCmEgbmFzdHkgc3VycHJp
c2UuCgpJIHNlbnQgdGhpcyBvbmNlIGJlZm9yZSwgYnV0IGdvdCBubyByZXNwb25zZXMsIG1heWJl
IEknbGwgZ2V0IHNvbWUgdGhpcwp0aW1lISBUbyB0aGF0IGVuZCwgSSd2ZSBhbHNvIGRyb3BwZWQg
dGhlIHJmYywgc2luY2Ugbm9vbmUgZXhwcmVzc2VkIHRoYXQKbGV2ZWwgb2YgcGFzc2luZyBpbnRl
cmVzdCBhbmQgdGhpcyBkb2VzIGZpeCBhIHByb2JsZW0gb24gbXkgcGxhdGZvcm0uCkkndmUgbm90
IG1hcmtlZCBpdCBuZXQgYmVjYXVzZSBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgdGhhdCBsZXZlbCBv
Zgp1cmdlbmN5LCBhcyB0aGUgdXNyaW8gZGVmYXVsdCBvbiBvdXIgcGxhdGZvcm0gZG9lcyB3aGF0
IHdlIHdhbnQsIGFuZAp3ZSd2ZSBwcm92aWRlZCBhIHRlbXBvcmFyeSBzb2x1dGlvbiBvZiBkaXNh
YmxpbmcgdXNyaW8gaW4gb3VyIG1hdGNoIGRhdGEKdG8gdGhlIHJlcG9ydGVyIGFuZCBpbiBvdXIg
ZG93bnN0cmVhbSB0cmVlLgoKVGhlbywgeW91IGFkZGVkIGV5ZXE1IHJlY2VudGx5LiBEb2VzIGl0
IGdlbnVpbmVseSBoYXZlIHRoZSBzYW1lIHVzcmlvCmJpdHMgYXMgdGhlIGF0OTEgZGV2aWNlcz8g
VGhhdCB5b3Ugc2VuZCBwYXRjaGVzIGRlYWxpbmcgd2l0aCBwaHlzIG1ha2VzCml0IHNlZW0gdG8g
bWUgbGlrZSBpdCBkb2Vzbid0IGhhdmUgdGhlIHVzcmlvIHN0dWZmIGFib3V0IG1paSBtb2Rlcy4u
CgpDaGVlcnMsCkNvbm9yLgoKQ0M6IFZhbGVudGluYS5GZXJuYW5kZXpBbGFuaXNAbWljcm9jaGlw
LmNvbQpDQzogQW5kcmV3IEx1bm4gPGFuZHJldytuZXRkZXZAbHVubi5jaD4KQ0M6IERhdmlkIFMu
IE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ0M6IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRA
Z29vZ2xlLmNvbT4KQ0M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+CkNDOiBQYW9s
byBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+CkNDOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgpDQzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpDQzogQ29u
b3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgpDQzogRGFpcmUgTWNOYW1hcmEgPGRhaXJl
Lm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CkNDOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9y
Zz4KQ0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNDOiBBbGJlcnQgT3Ug
PGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KQ0M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5m
cj4KQ0M6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KQ0M6IENs
YXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+CkNDOiBSaWNoYXJkIENvY2hy
YW4gPHJpY2hhcmRjb2NocmFuQGdtYWlsLmNvbT4KQ0M6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPgpDQzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpDQzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ0M6
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ0M6IE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4KQ0M6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkBy
YXNwYmVycnlwaS5jb20+CkNDOiBTZWFuIEFuZGVyc29uIDxzZWFuLmFuZGVyc29uQGxpbnV4LmRl
dj4KQ0M6IFZpbmVldGggS2FydW1hbmNoaSA8dmluZWV0aC5rYXJ1bWFuY2hpQGFtZC5jb20+CkND
OiBBYmluIEpvc2VwaCA8YWJpbi5qb3NlcGhAYW1kLmNvbT4KQ0M6IFRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+CgpDb25vciBEb29sZXkgKDgpOgogIHJpc2N2OiBkdHM6IG1p
Y3JvY2hpcDogYWRkIHRzdSBjbG9jayB0byBtYWNiIG9uIG1wZnMKICBuZXQ6IG1hY2I6IHJlbmFt
ZSBtYWNiX2RlZmF1bHRfdXNyaW8gdG8gYXQ5MV9kZWZhdWx0X3VzcmlvIGFzIG5vdCBhbGwKICAg
IHBsYXRmb3JtcyBoYXZlIG1paSBtb2RlIGNvbnRyb2wgaW4gdXNyaW8KICBuZXQ6IG1hY2I6IG5w
NCBkb2Vzbid0IG5lZWQgYSB1c3JpbyBwb2ludGVyCiAgZHQtYmluZGluZ3M6IG5ldDogbWFjYjog
YWRkIHByb3BlcnR5IGluZGljYXRpbmcgdGltZXIgYWRqdXN0IG1vZGUKICBuZXQ6IG1hY2I6IHRp
bWVyIGFkanVzdCBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQKICBuZXQ6IG1hY2I6IGFkZCBtcGZzIHNw
ZWNpZmljIHVzcmlvIGNvbmZpZ3VyYXRpb24KICBuZXQ6IG1hY2I6IHdhcm4gb24gcGNsayB1c2Ug
YXMgYSB0c3VfY2xrIGZhbGxiYWNrCiAgbmV0OiBtYWNiOiBjbGVhbiB1cCB0c3UgY2xrIHJhdGUg
YWNxdWlzaXRpb24KCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwg
ICAgfCAgMTUgKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL01ha2VmaWxlLm9yaWcg
ICB8ICAyNiArKysrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kgICAg
ICAgfCAgIDggKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oICAgICAgICAg
ICB8ICAgMyArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jICAgICAg
fCAxMzcgKysrKysrKysrKystLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDEzMSBpbnNlcnRpb25z
KCspLCA1OCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL21pY3JvY2hpcC9NYWtlZmlsZS5vcmlnCgotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
