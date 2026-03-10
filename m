Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD78EB1042
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kwtoX7EkbEeZ8hNjrBhJI4a/orLttVoPQKye+s0Cr8=; b=0JRBbqhNywk+1u
	x0RW/B98y1mY0LtXlZWNgi+hEEnpCiaCArr6R1KLdqp51EcKZEPN3PG3g5a2oO5c5GSKjUspF2t8w
	mTmJP9LVWFt9zbAeoCLJxVbHjRkHjeljcESekNqvmBxQ9JE4o7i0NswStzZcLUfYU9gpmSsQ5Th6p
	c3GqSJy4efqtbuXTBOPPnF2Gxn77ni8dnzjAaFdvyp7W2/jnYbXtzbI/Ma4GdwLjMG49IuEQrXbJZ
	OTb+Qys7kAw3ZFhh34C0+NV1LPrMTAlfWIPBMxPG2WmwTTrEHe2LQGVa8dIOTfJ96PCrYejMAHMZ2
	6sINvOwD1TEtpYYekEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuHl-00000009Bm9-3CVq;
	Tue, 10 Mar 2026 10:25:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuHi-00000009BjD-17iT
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 10:25:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BC3A1A2DAA;
	Tue, 10 Mar 2026 10:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E125060002;
	Tue, 10 Mar 2026 10:25:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 463D410369BAC;
	Tue, 10 Mar 2026 11:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773138347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=71zUaXhdHoKDWjtB0MpHNOgpcJ2zjizbeuue0R2NhYs=;
	b=ohsqZQwQhJncrpf2sUV56DY/Oed/6DOyVDtua+44r0ig+r48WFVmQUWOFuCQyq7RLjALlC
	rk1ctQJbX1gYoXruqKwwWR4K9kh017398iv5o7m28IWra8DVDNpNWdLEuBc2wL7aQH/52m
	hZj+BPUNxKfk10mOMkqCqw+vsaIxjdtxSzybao1oCz6Ik+TjImkUBEzVb+jRUadhp+tP4o
	sUrVctqWiNgJVHLtLwNc2TjE6CapLs2jyxl5XO+3L1ghujyUbobqvvo37zy5qGvjgtE4T2
	pHmkz373PMMSnoO6cOUxPG2J1+y/VzZZFZZx2r4yi5nK4LpOJzGGkHIyi/0oIg==
Mime-Version: 1.0
Date: Tue, 10 Mar 2026 11:25:37 +0100
Message-Id: <DGZ12YVFEPVZ.26EZEGK5DF6D1@bootlin.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Cc: "Philipp Zabel" <p.zabel@pengutronix.de>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Michal Wilczynski" <m.wilczynski@samsung.com>, "Han
 Gao" <gaohan@iscas.ac.cn>, "Yao Zi" <ziyao@disroot.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
 <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
 <57436150684e72049b62657caec544a2f18aab1c.camel@iscas.ac.cn>
In-Reply-To: <57436150684e72049b62657caec544a2f18aab1c.camel@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_032554_450267_EEB7DA40 
X-CRM114-Status: GOOD (  13.68  )
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

SGVsbG8gSWNlbm93eSwKCk9uIE1vbiBNYXIgOSwgMjAyNiBhdCA1OjUxIFBNIENFVCwgSWNlbm93
eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNi0wMy0xMOS6jOeahCAwMDozNSArMDgwMO+8jEljZW5v
d3kgWmhlbmflhpnpgZPvvJoKPiA9PT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09
PQo+PiA+ID4gKwlpZiAoSVNfRVJSKGJyaWRnZSkpCj4+ID4gPiArCQlyZXR1cm4gRVJSX1BUUihQ
VFJfRVJSKGJyaWRnZSkpOwo+PiA+ID4gKwo+PiA+ID4gKwlicmlkZ2UtPmNydGMgPSBjcnRjOwo+
PiA+ID4gKwlicmlkZ2UtPmludGYgPSBpbnRmOwo+PiA+ID4gKwlicmlkZ2UtPm5leHRfYnJpZGdl
ID0gbmV4dDsKPj4gPgo+PiA+IFRoZXJlIGlzIG5vdyBhIG5leHRfYnJpZGdlIGZpZWxkIGluIHN0
cnVjdCBkcm1fYnJpZGdlLCB3aGljaAo+PiA+IGhhbmRsZXMKPj4gPiB0aGUKPj4gPiBicmlkZ2Ug
bGlmZXRpbWUgaW4gYSBzYWZlciB3YXkgYW5kIG1vcmUgc2ltcGx5IFswXSwgc28geW91IGNvdWxk
Cj4+ID4gdXNlCj4+ID4gaXQ6Cj4+Cj4+IEdsYWQgdG8gaGVhciBzdWNoIGEgZmllbGQgZXhpc3Rz
IG5vdy4gV2lsbCBtb3JlIGNvZGUgYWJvdXQKPj4gbmV4dF9icmlkZ2UKPj4gbGlmZXRpbWUgbWFu
YWdlbWVudCBiZWluZyBzaGFyZWQ/Cj4KPiBMb29rcyBsaWtlIG5vdyBtYW55IGRyaXZlcnMgY2Fu
IGp1c3Qgc2hhcmUgdGhlIC5hdHRhY2ggZnVuY3Rpb24sCj4gYmVjYXVzZSB0aGV5J3JlIGFsbCBk
b2luZyB0aGUgc2FtZSB0aGluZzoKPgo+IGBgYAo+IGludCBkcm1fYnJpZGdlX2F0dGFjaF9uZXh0
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gCQkJICAgc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyLAo+IAkJCSAgIGVudW0gZHJtX2JyaWRnZV9hdHRhY2hfZmxhZ3MgZmxhZ3MpCj4gewo+
IAlyZXR1cm4gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdlLT5uZXh0X2JyaWRnZSwK
PiAJCQkJIGJyaWRnZSwgZmxhZ3MpOwo+IH0KPiBgYGAKPgo+IEF0IGxlYXN0IHZzX2JyaWRnZV9h
dHRhY2ggaGVyZSBhbmQgbWVzb25fZW5jb2Rlcl8qX2F0dGFjaCAobmFtZWQKPiBlbmNvZGVyIGJ1
dCB0aGV5J3JlIGJyaWRnZSBkcml2ZXJzIG5vdykgbWF0Y2ggdGhpcyBwYXR0ZXJuICh0aGUgbGF0
dGVyCj4gZG9lcyBhIGNhc3QgZnJvbSBgc3RydWN0IGRybV9icmlkZ2UgKmAgdG8gdGhlaXIgc3Vi
Y2xhc3NlcywgYnV0IHRoZW4KPiBvbmx5IGFjY2Vzc2luZyB0aGUgYGJyaWRnZWAgZmllbGQgb2Yg
dGhlIHN1YmNsYXNzZXMgYW5kIGRvaW5nIHRoZSBzYW1lCj4gdGhpbmdzIGhlcmUpLgoKSW5kZWVk
LCBzZXZlcmFsIGRyaXZlcnMgYXJlIG1vcmUgYW5kIG1vcmUgc2ltaWxhciBpbiB0aGlzIHJlc3Bl
Y3Qgc28gYQpoZWxwZXIgY291bGQgZGVkdXBsaWNhdGUgYSBiaXQgb2YgY29kZSBpbiBhbiBlYXN5
IHdheSBoZXJlLgoKTHVjYQoKLS0KTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
