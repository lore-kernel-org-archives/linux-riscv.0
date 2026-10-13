Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E3CC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxerjrbQkFe5FUDernqA7sau5wQidRhwU4UxeJ/8Ewk=; b=M0yfSWCkdD9gv8
	VeAF9H0020CY5w39v2UZQ5BhFNafqjKe3JqKD/JJwE6o0AseEllCxz9cwrLpMadmmKiK0KmnuSVlb
	9dvq7ABDN4kmCMjpzf3pPl5C/lvl+//vAWHlr19CzZpXiOdbLcp1GQOobjzEDL96EPojGE4UF95lc
	ezw8L/05dkeaEUUGXkcn6AhfT2TsJpbMviyl8r+czKC7khihfyhU9qh9A/iXaG1wQoiHbT22yoPH2
	zo0m/w/QBJ4upWk2tjviNqscbifnD3GgmOMZRkye4X2F5bfUp8QFpoe2np2E5eP6zzhNAI4K1j459
	tPd76YedEAW6MyD1A2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfzk-0000000DdQO-431L;
	Tue, 13 Oct 2026 17:08:56 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfzi-0000000DdO2-0Qh7
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 17:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791911297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LCDAZshFs9QieBawKJLTiEZ04vnvyc3jjuj6TIj2kXSSccaEYlrXyepR3YL+J+zlJuFymqXBVmduxyJQ7QozZ5W/B7kqMuoHv8f6yaRV4WowKk5qo1QidePDpQ3qCJ7X1lBQVp5bCVZ3mgW1ZkCAGmD7+WNZ8SN9Ww9EG2X4s5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791911297; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dl02gomnqfiM20wyvBMjwA2Z00g8ChZY513BoOmAVuU=; 
	b=P5JLmwvKEIo3HqWJromlvdPMhvOvHVW5qE1c5w29PPGb8t3q6JWzfpUzofKtz3fpmAXJ4GpM+5lo1dku9f798yQCBRNTNPWo1NAaK27sUwTA1IUChO0jSnwQMwKSMrwz0ZnZ0XKoqwAQdMo5LqlISKnExjZmS73xWVKMDmUe+hg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791911297;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=dl02gomnqfiM20wyvBMjwA2Z00g8ChZY513BoOmAVuU=;
	b=KiapTGFzcW9BMa5iEWRzL4ywGVomeQ2dCpA4fUivCmVeDKn30aV5KJBW/25XNi1G
	mJuBdVZkKoyx5DaqbA33jQoE4TNhUwSbjItC81Hh5T3P6hka743Dqv1KA8koG7csbHi
	djZv5th67bTQuW6WcTDLW2ktFf4miBL/FM+xcJ2k=
Received: by smtp.zohomail.com with SMTPS id 1791911295666526.175192816721;
	Tue, 13 Oct 2026 10:08:15 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 13 Oct 2026 14:07:40 -0300
Subject: [PATCH v6 1/7] rust: clk: use 'kernel vertical style' for imports
MIME-Version: 1.0
Message-Id: <20261013-clk-type-state-v6-1-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
In-Reply-To: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_100854_194473_41683F92 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

Q29udmVydCBhbGwgaW1wb3J0cyB0byB1c2UgdGhlIG5ldyBpbXBvcnQgc3R5bGUuIFRoaXMgd2ls
bCBtYWtlIGl0IGVhc2llcgp0byBsYW5kIG5ldyBjaGFuZ2VzIGluIHRoZSBmdXR1cmUuIERyb3Ag
dGhlIGBSZXN1bHRgIGltcG9ydCwgd2hpY2ggdGhlCnByZWx1ZGUgYWxyZWFkeSBwcm92aWRlcy4K
Ck5vIGNoYW5nZSBvZiBmdW5jdGlvbmFsaXR5IGltcGxpZWQuCgpMaW5rOiBodHRwczovL2RvY3Mu
a2VybmVsLm9yZy9ydXN0L2NvZGluZy1ndWlkZWxpbmVzLmh0bWwjaW1wb3J0cwpSZXZpZXdlZC1i
eTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBP
bnVyIMOWemthbiA8d29ya0BvbnVyb3prYW4uZGV2PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQWxt
ZWlkYSA8ZGFuaWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbT4KLS0tCiBydXN0L2tlcm5lbC9jbGsu
cnMgfCAyNCArKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2Nsay5y
cyBiL3J1c3Qva2VybmVsL2Nsay5ycwppbmRleCBmMDRmNWM0YTAzZDYuLmM3M2ZlN2M1NzI1MSAx
MDA2NDQKLS0tIGEvcnVzdC9rZXJuZWwvY2xrLnJzCisrKyBiL3J1c3Qva2VybmVsL2Nsay5ycwpA
QCAtOTYsMTEgKzk2LDE3IEBAIG1vZCBjb21tb25fY2xrIHsKICAgICB1c2Ugc3VwZXI6OkhlcnR6
OwogICAgIHVzZSBjcmF0ZTo6ewogICAgICAgICBkZXZpY2U6OkRldmljZSwKLSAgICAgICAgZXJy
b3I6Ontmcm9tX2Vycl9wdHIsIHRvX3Jlc3VsdCwgUmVzdWx0fSwKLSAgICAgICAgcHJlbHVkZTo6
KiwKKyAgICAgICAgZXJyb3I6OnsKKyAgICAgICAgICAgIGZyb21fZXJyX3B0ciwKKyAgICAgICAg
ICAgIHRvX3Jlc3VsdCwgLy8KKyAgICAgICAgfSwKKyAgICAgICAgcHJlbHVkZTo6KiwgLy8KICAg
ICB9OwogCi0gICAgdXNlIGNvcmU6OntvcHM6OkRlcmVmLCBwdHJ9OworICAgIHVzZSBjb3JlOjp7
CisgICAgICAgIG9wczo6RGVyZWYsCisgICAgICAgIHB0ciwgLy8KKyAgICB9OwogCiAgICAgLy8v
IEEgcmVmZXJlbmNlLWNvdW50ZWQgY2xvY2suCiAgICAgLy8vCkBAIC0xMTksOSArMTI1LDExIEBA
IG1vZCBjb21tb25fY2xrIHsKICAgICAvLy8gVGhlIGZvbGxvd2luZyBleGFtcGxlIGRlbW9uc3Ry
YXRlcyBob3cgdG8gb2J0YWluIGFuZCBjb25maWd1cmUgYSBjbG9jayBmb3IgYSBkZXZpY2UuCiAg
ICAgLy8vCiAgICAgLy8vIGBgYAotICAgIC8vLyB1c2Uga2VybmVsOjpjbGs6OntDbGssIEhlcnR6
fTsKKyAgICAvLy8gdXNlIGtlcm5lbDo6Y2xrOjp7CisgICAgLy8vICAgICBDbGssCisgICAgLy8v
ICAgICBIZXJ0eiwKKyAgICAvLy8gfTsKICAgICAvLy8gdXNlIGtlcm5lbDo6ZGV2aWNlOjpEZXZp
Y2U7Ci0gICAgLy8vIHVzZSBrZXJuZWw6OmVycm9yOjpSZXN1bHQ7CiAgICAgLy8vCiAgICAgLy8v
IGZuIGNvbmZpZ3VyZV9jbGsoZGV2OiAmRGV2aWNlKSAtPiBSZXN1bHQgewogICAgIC8vLyAgICAg
bGV0IGNsayA9IENsazo6Z2V0KGRldiwgU29tZShjImFwYl9jbGsiKSk/OwpAQCAtMjkzLDkgKzMw
MSwxMSBAQCBmbiBkcm9wKCZtdXQgc2VsZikgewogICAgIC8vLyBkZXZpY2UuIFRoZSBjb2RlIGZ1
bmN0aW9ucyBjb3JyZWN0bHkgd2hldGhlciBvciBub3QgdGhlIGNsb2NrIGlzIGF2YWlsYWJsZS4K
ICAgICAvLy8KICAgICAvLy8gYGBgCi0gICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6e09wdGlvbmFs
Q2xrLCBIZXJ0en07CisgICAgLy8vIHVzZSBrZXJuZWw6OmNsazo6eworICAgIC8vLyAgICAgSGVy
dHosCisgICAgLy8vICAgICBPcHRpb25hbENsaywKKyAgICAvLy8gfTsKICAgICAvLy8gdXNlIGtl
cm5lbDo6ZGV2aWNlOjpEZXZpY2U7Ci0gICAgLy8vIHVzZSBrZXJuZWw6OmVycm9yOjpSZXN1bHQ7
CiAgICAgLy8vCiAgICAgLy8vIGZuIGNvbmZpZ3VyZV9jbGsoZGV2OiAmRGV2aWNlKSAtPiBSZXN1
bHQgewogICAgIC8vLyAgICAgbGV0IGNsayA9IE9wdGlvbmFsQ2xrOjpnZXQoZGV2LCBTb21lKGMi
YXBiX2NsayIpKT87CgotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
