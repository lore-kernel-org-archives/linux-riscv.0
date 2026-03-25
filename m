Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC153109C033
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bBO6EaGwM4T2UsnVB5ywWldHJH0DLJX8XiOfN3mCMHI=; b=BaPBfEACPgHJ12
	x2ZmXeGSccJY9Q9cxrTdW77rYzazzP8PCWABJ9i8puYfKnCpnel6v1Oqth9ijQo9/du5E2ahYDJFP
	2WXSN0dQKbG0JQsMBcz1Cthdz35196TbxZXonXV1s5QS9CMqF3+ZdVxoY0a+/522j6/AXowwB+53E
	rgNxztokgAvPgdyy4u8/NOogSRwbxssg+VRN7RfI8lX8LvtWXN/1AibYRC9K/UUk79g0GBEAb1R4I
	UMuiEmnOrp798VdBBCWXA4AVpUAtAbuVR0HnvhEUkRrp+liIJGkg+bXptGs4GhQq3TK7WhWjW0NLt
	I8mpwA6On4lE/bFt0OzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6D-00000003svi-1NP0;
	Wed, 25 Mar 2026 16:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6B-00000003sui-2cea
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E4F341AB0;
	Wed, 25 Mar 2026 16:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C4EC4CEF7;
	Wed, 25 Mar 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456130;
	bh=WNZw/U2oAU4OJgjB6cQyLDNDoaTNtsOZD/HEuVp7Pbg=;
	h=From:To:Cc:Subject:Date:From;
	b=uMKrcgGaSeQelsRUAZyRupsU/0sDVUnoYKyXghFybejtUT7kmuR8QC5S8FYhYt6Ha
	 UzebkfnfGQy7goGDYwTxTce/sELGBItC5a/x23ug59n7I+gOnizw9bpxoBEOGnsSd3
	 y/xQG1kIaCGJBlIrfOSXIfaD7aOi/mvLC2BPx7C13lEq2kDzvs6cRcXRhA12G+RTIx
	 zzUney5Ia8mH2+tkFayK7g+16QyVAZFXt5uzcVtEzWHXwu0MLn56Yy7hvvoaOOtNgM
	 DPgYbq/3QnOywhxv5IKvKvD6ZMNqWidtKKKjQsmW9MXpFyZO33oH+rlYm1xNk9kUjB
	 DqkSo0to6t89A==
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 00/14] macb usrio/tsu patches
Date: Wed, 25 Mar 2026 16:28:04 +0000
Message-ID: <20260325-unsterile-flail-4c7729750dc4@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3571; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5hpAVVar6EkPWWk4KHTwXKK+B0QHyBaC3geYzz7Ou/8=; b=kA0DAAoWeLQxh6CCYtIByyZiAGnEDRuhaR9JXeci/JTJe64cbKNvK3MidPDXlfqb8tM0zwQJO oh1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmnEDRsACgkQeLQxh6CCYtLP0AD9EHMJ WLBuCuRRdOGegE5UsqxhTzQGypqZxpzLluDWJ+gBAKrF1vYL4b44YQx+jeawhi2N1KBVnLftH3v lv6ZVLvAB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092851_701145_FF89034F 
X-CRM114-Status: GOOD (  13.07  )
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
cywKCkF0IHRoZSB2ZXJ5IGxlYXN0LCBpdCdkIGJlIGdvb2Qgb2YgdGhlIHNvYyB2ZW5kb3IgZm9s
a3MgY291bGQgY2hlY2sKdGhlaXIgcGxhdGZvcm1zIGFuZCBzZWUgaWYgdGhlaXIgdXNyaW8gc3R1
ZmYgYWN0dWFsbHkgbGluZXMgdXAgd2l0aCB3aGF0CnRoZSBkcml2ZXIgY3VycmVudGx5IGNhbGxz
ICJtYWNiX2RlZmF1bHRfdXNyaW8iLiBPdXJzIGRpZG4ndCBhbmQgaXQgd2FzCmEgbmFzdHkgc3Vy
cHJpc2UuCgpSeWFuIGFuZCBJIGZpZ3VyZWQgb3V0IHRoYXQgdGhlIHNhbWE3ZzUgc3R1ZmYgaXMg
bm90IGFjdHVhbGx5IHVzaW5nIHRoZQpzYW1lIHVzcmlvIGJpdHMgYXMgZWFybGllciBkZXZpY2Vz
LCBzbyB0aGVyZSdzIG5vdyBtb3JlIHBhdGNoZXMgaW4gdGhpcwpzZXJpZXMgdG8gc3BsaXQgdGhl
bSBhcGFydC4gSSd2ZSBub3QgdGVzdGVkIHRoZSBzcGxpdCBvciB0aGUgbmV3CnByb3BlcnR5IGR1
ZSB0byBsYWNrIG9mIGhhcmR3YXJlLCBidXQgUnlhbiBoYXMuCgpNYXJraW5nIHRoaXMgc3R1ZmYg
bmV0LW5leHQsIGJlY2F1c2UgYWx0aG91Z2ggdGhleSdyZSBmaXhlcyBJIGRvbid0IHNlZQphbnkg
cGFydGljdWxhciB1cmdlbmN5LCBhbmQgaXQgYXZvaWRzIGNyZWF0aW5nIHNvbWUgZGVwZW5kZW5j
aWVzIGJldHdlZW4KY2xlYW51cCBpdGVtcyBhbmQgdGhlIGZpeGVzLgoKQ2hlZXJzLApDb25vci4K
CnY1OgotIHJlYmFzZSBvbiBuZXQtbmV4dAotIHJldmVydCBvbmUgb2YgdGhlIGNvbW1pdHMgdGhh
dCBsYW5kZWQgaW4gbmV0LW5leHQgaW4gdGhlIG1lYW50aW1lCgp2NDoKLSBkZXByZWNhdGUgaW5z
dGVhZCBvZiByZW1vdmUgZXhpc3RpbmcgZGV2aWNldHJlZSBwcm9wZXJ0eQotIHBpY2sgdXAgVGhl
bydzIHBhdGNoZXMKCnYzOgotIHJlb3JkZXIgcGF0Y2hlcwotIGZpeCBzbWF0Y2ggaXNzdWUgcmVw
b3J0ZWQgYnkgU2ltb24KLSBhZGQgcGF0Y2hlcyByZXdvcmtpbmcgdXNyaW8gaGFuZGxpbmcgb2Yg
Y2xrZW4vcmVmY2xrIChhbmQgcmVtb3ZlIHRoZQogIGlzc3VlIHRoZSBsbG0gcmVwb3J0ZWQgaW4g
dGhlIHByb2Nlc3MpCi0gYWRkIGEgbmV3IGRldmljZXRyZWUgcHJvcGVydHkgZm9yIHJlZmNsayBz
ZWxlY3Rpb24sIHJlcGxhY2luZyB0aGUKICBleGlzdGluZyBvbmUuCi0gZHJvcCB0aGUgZHRzIHBh
dGNoCgpDQzogVmFsZW50aW5hLkZlcm5hbmRlekFsYW5pc0BtaWNyb2NoaXAuY29tCkNDOiBBbmRy
ZXcgTHVubiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPgpDQzogRGF2aWQgUy4gTWlsbGVyIDxkYXZl
bUBkYXZlbWxvZnQubmV0PgpDQzogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPgpD
QzogSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4KQ0M6IFBhb2xvIEFiZW5pIDxwYWJl
bmlAcmVkaGF0LmNvbT4KQ0M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+CkNDOiBDb25vciBEb29sZXkgPGNv
bm9yK2R0QGtlcm5lbC5vcmc+CkNDOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWlj
cm9jaGlwLmNvbT4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgpDQzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVy
a2VsZXkuZWR1PgpDQzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgpDQzogTmljb2xh
cyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgpDQzogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4KQ0M6IFJpY2hhcmQgQ29jaHJhbiA8cmljaGFyZGNv
Y2hyYW5AZ21haWwuY29tPgpDQzogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2
ZS5jb20+CkNDOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCkNDOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJh
c3BiZXJyeXBpLmNvbT4KQ0M6IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2
PgpDQzogVmluZWV0aCBLYXJ1bWFuY2hpIDx2aW5lZXRoLmthcnVtYW5jaGlAYW1kLmNvbT4KQ0M6
IEFiaW4gSm9zZXBoIDxhYmluLmpvc2VwaEBhbWQuY29tPgpDQzogVGjDqW8gTGVicnVuIDx0aGVv
LmxlYnJ1bkBib290bGluLmNvbT4KQ0M6IFJ5YW4uV2FubmVyQG1pY3JvY2hpcC5jb20KQ0M6IEtl
dmluIEhhbyA8aGFva2V4aW5AZ21haWwuY29tPgoKQ29ub3IgRG9vbGV5ICgxMSk6CiAgUmV2ZXJ0
ICJuZXQ6IG1hY2I6IENsZWFuIHVwIHRoZSAudXNyaW8gc2V0dGluZ3MgaW4gbWFjYl9jb25maWcK
ICAgIGluc3RhbmNlcyIKICBuZXQ6IG1hY2I6IHJlbmFtZSBtYWNiX2RlZmF1bHRfdXNyaW8gdG8g
YXQ5MV9kZWZhdWx0X3VzcmlvIGFzIG5vdCBhbGwKICAgIHBsYXRmb3JtcyBoYXZlIG1paSBtb2Rl
IGNvbnRyb2wgaW4gdXNyaW8KICBuZXQ6IG1hY2I6IHNwbGl0IFVTUklPX0hBU19DTEtFTiBjYXBh
YmlsaXR5IGluIHR3bwogIGR0LWJpbmRpbmdzOiBuZXQ6IGNkbnMsbWFjYjogcmVwbGFjZSBjZG5z
LHJlZmNsay1leHQgd2l0aAogICAgY2RucyxyZWZjbGstc291cmNlCiAgbmV0OiBtYWNiOiByZXdv
cmsgdXNyaW8gcmVmY2xrIHNlbGVjdGlvbiBjb2RlCiAgbmV0OiBtYWNiOiBucDQgZG9lc24ndCBu
ZWVkIGEgdXNyaW8gcG9pbnRlcgogIG5ldDogbWFjYjogYWRkIG1wZnMgc3BlY2lmaWMgdXNyaW8g
Y29uZmlndXJhdGlvbgogIG5ldDogbWFjYjogd2FybiBvbiBwY2xrIHVzZSBhcyBhIHRzdV9jbGsg
ZmFsbGJhY2sKICBuZXQ6IG1hY2I6IGNsZWFuIHVwIHRzdSBjbGsgcmF0ZSBhY3F1aXNpdGlvbgog
IGR0LWJpbmRpbmdzOiBuZXQ6IG1hY2I6IGFkZCBwcm9wZXJ0eSBpbmRpY2F0aW5nIHRpbWVyIGFk
anVzdCBtb2RlCiAgbmV0OiBtYWNiOiB0aW1lciBhZGp1c3QgbW9kZSBpcyBub3Qgc3VwcG9ydGVk
CgpUaMOpbyBMZWJydW4gKDMpOgogIG5ldDogbWFjYjogcnVudGltZSBkZXRlY3QgTUFDQl9DQVBT
X1VTUklPX0RJU0FCTEVECiAgbmV0OiBtYWNiOiBzZXQgTUFDQl9DQVBTX1VTUklPX0RJU0FCTEVE
IGlmIG5vIHVzcmlvIGNvbmZpZyBpcyBwcm92aWRlZAogIG5ldDogbWFjYjogZHJvcCB1c3JpbyBw
b2ludGVyIG9uIEV5ZVE1IGNvbmZpZwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5z
LG1hY2IueWFtbCAgICB8ICA3MSArKysrKystCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2IuaCAgICAgICAgICAgfCAgIDggKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9t
YWNiX21haW4uYyAgICAgIHwgMTg3ICsrKysrKysrKysrKystLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAyMTIgaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pCgotLSAKMi41My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
