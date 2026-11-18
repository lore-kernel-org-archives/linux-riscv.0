Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368D7606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvnU8D2K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=MDMIV7gp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7jZYfQtAbU5OBZESZvm7tGz6OVKEqHCxcxdqTWFlMWQ=; b=lvnU8D2KxBV2reQZZuDVw2heUw
	gF/e84UFrNuidFMJtrPTZG2siVSXpjcAgn9zBdsBHA0ACpl1eKkClosfqcnnoAeFrVlycUsR4OlZo
	lIn1FIQNvs+cuj4upCeCj3LwhKC7J4cDLYANTIqzgwClU1uX6sG0EOb0bOfc3UQBpUFnbWKzCwQVA
	z+PIIy9WMUcRwkIZw3+CkeqXL0DTK8fc96w8PMIqUgwxptdpq1aBPjXDKLFE0IFXWNBa4UuN2NT+i
	MnxnXvPgkeA+0FibsGXbCoYxZOgDA4UWsCS4j317tCOKYA4mlylwjkDURD0Lf+WL7QWNN23gBZ3Oe
	0yK/iESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjGo-00000009kOS-0x2p;
	Wed, 18 Nov 2026 17:16:32 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjGl-00000009kM3-2Y7J
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 17:16:29 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D5B9920DC666;
	Wed, 18 Nov 2026 18:16:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id B40A120D4CAF;
	Wed, 18 Nov 2026 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr B40A120D4CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795022180;
	bh=JcG5i3n/enYidgqlQ6vBgqJiTw2tRlwgEdU7NIgWq/M=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=MDMIV7gpFlG4nWKnXQsyR2H8laq+en+JwUex05lJFXzBzE0m+pZAMpTmHq/mYFnhX
	 ETt2+pNDvKWDTSFUo+QIDbBiH5KXmQ/ESS/M8HGhZpr35hqRj9md3ip3C1KlgZb5eZ
	 vUBQ5j4R3PV8UE2Y4TaqWB2pjPohKozY+8duYsblm5XGZDmTbZtWNT66SaQP6mPk/+
	 zV9JEGy4wvx/EKCF/SFdcMG2MibDwPegaIXv/gBw52RmACqBES8sxqAJBZGZNiLe2m
	 Zg0qEf9Lnc2jIs6CIlT0liTD241SrtMPfIrAGKUrwQGzk5+NXbTZE8YYCgewBmLOBR
	 FT2Ro6bq5hdCg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id BA7VGU8kKTYl; Wed, 18 Nov 2026 18:16:20 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 9AC0920DC666;
	Wed, 18 Nov 2026 18:16:19 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Stephen Boyd <sboyd@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yao Zi <me@ziyao.cc>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Date: Wed, 18 Nov 2026 18:15:35 +0100
Message-ID: <20261118171536.197538-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118111528-GKD156369@kernel.org>
References: <20261117205951.140146-3-frederic.mahe@cirad.fr> <20261118111528-GKD156369@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091627_809816_A4C410EB 
X-CRM114-Status: GOOD (  14.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWWl4dW4sCgpUaGFua3MgZm9yIGZvcndhcmRpbmcgaXQgdG8gU3BhY2VtaVQuCgpPbiBXZWQs
IE5vdiAxOCwgMjAyNiBhdCAxMToxNToyOEFNICswMDAwLCBZaXh1biBMYW4gd3JvdGU6Cj4gQWNj
ZXNzIHdoaWNoIHJlZ2lzdGVyPyBpcyB0aGUgUFdNIHJlZ2lzdGVyIGluIFJDUFUyPwoKTm8sIHRo
ZSBoYW5nIGNvbWVzIGJlZm9yZSBhbnkgUFdNIHJlZ2lzdGVyIGFjY2Vzcy4gVGhlIFBXTSBwcm9i
ZQpmaXJzdCBkZWFzc2VydHMgdGhlIHJlc2V0IGFuZCBlbmFibGVzIHRoZSBjbG9jaywgYm90aCBp
bgpSQ1BVMl9QV00yX0NMS19SU1QgKDB4YzA4ODgwMDgsIGluIHRoZSBzeXNjb25fcmNwdTIgcmFu
Z2UpLCBhbmQgdGhhdAphY2Nlc3MgaGFuZ3MuIFRoZSBQV00gcmVnaXN0ZXJzICgweGMwODg4MzAw
KSBhcmUgbmV2ZXIgcmVhY2hlZC4gSQpoYXZlIG5vdCB0ZXN0ZWQgZWFjaCByZWdpc3RlciBvbiBp
dHMgb3duIChldmVyeSBoYW5nIG5lZWRzIGEgcG93ZXIKY3ljbGUpLCBidXQgSSBjYW4gZG8gaXQg
aWYgdGhhdCBoZWxwcy4KCj4gSXQganVzdCBoYXBwZW4gdG8gZml4IHRoZSBpc3N1ZSwgYnV0IGRv
ZXNuJ3Qgc291bmQgbGlrZSBhIGNvcnJlY3QgZml4LAo+IHVzdWFsbHksIGl0IGNhbiBiZSBmaXhl
ZCB3aXRoIGNvcnJlY3QgY2xvY2sgdG9wb2xvZ3kKCkFncmVlZC4gVGhlIHZlbmRvciBrZXJuZWwg
bmV2ZXIgZ2F0ZXMgdGhpcyBjbG9jayBlaXRoZXIKKENMS19JR05PUkVfVU5VU0VEIGluIGNjdS1z
cGFjZW1pdC1rMXguYykuIElmIHBsbDFfYXVkXzI0NXA3IGlzIHRoZQpidXMgY2xvY2sgb2YgdGhl
IFJDUFUyIGJsb2NrLCBpdCBjb3VsZCBiZWNvbWUgYSBjbG9jayBvZiB0aGUKc3lzY29uX3JjcHUy
IG5vZGUsIGFuZCB0aGUgQ0NVIGRyaXZlciB3b3VsZCBlbmFibGUgaXQgYmVmb3JlIGl0cwpmaXJz
dCByZWdpc3RlciBhY2Nlc3MuIEkgd2lsbCB3YWl0IGZvciBTcGFjZW1pVCdzIGFuc3dlciBiZWZv
cmUgdjIuCgo+IG1heWJlIGp1c3QgIkFzc2lzdGVkLWJ5OiBMTE0iCgpUaGF0IHRhZyB3YXMgcmVt
b3ZlZCAoMWUwMzUyOTdmZmRhKSwgc28gaW4gdjIgSSB3aWxsIG1vdmUgdGhlIG5vdGUKdG8gdGhl
IGNvdmVyIGxldHRlciwgYXMgWWFvIFppIHN1Z2dlc3RzLgoKRnLDqWTDqXJpYwoKRnJvbSBmcmVk
ZXJpYy5tYWhlQGNpcmFkLmZyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04
P3E/RnI9QzM9QTlkPUMzPUE5cmljPTIwTWFoPUMzPUE5Pz0gPGZyZWRlcmljLm1haGVAY2lyYWQu
ZnI+ClRvOiBZYW8gWmkgPG1lQHppeWFvLmNjPgpDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiwgWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+LCBUcm95IE1pdGNoZWxsIDx0cm95
Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4sIEJyaWFuIE1hc25leSA8Ym1hc25leStjbGtA
cmVkaGF0LmNvbT4sIEplcm9tZSBCcnVuZXQgPGpicnVuZXQrY2xrQGJheWxpYnJlLmNvbT4sIFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0
QGtlcm5lbC5vcmc+LCBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+LCBIYXlsZW4g
Q2h1IDxoZXlsZW5heUA0ZDIub3JnPiwgSHVuZy1DaHVuIFRzZW5nIDxhbGFuLnRzZW5nLmNzQGdt
YWlsLmNvbT4sIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiwgUGFsbWVyIERhYmJlbHQg
PHBhbG1lckBkYWJiZWx0LmNvbT4sIEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Piwg
QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiwgbGludXgtY2xrQHZnZXIua2VybmVsLm9y
ZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcsIHNwYWNlbWl0QGxpc3RzLmxpbnV4LmRldiwgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwpTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gcmlzY3Y6IHNwYWNlbWl0OiBrMTogUkNQVTIg
UFdNIGNsb2NrcyBhbmQgdGhlIEJQSS1GMyBmYW4KSW4tUmVwbHktVG86IDxhdjNNSTB3Z291M3Bi
YWI4QHBpZT4KUmVmZXJlbmNlczogPDIwMjYxMTE3MjA1OTUxLjE0MDE0Ni0xLWZyZWRlcmljLm1h
aGVAY2lyYWQuZnI+IDxhdjNNSTB3Z291M3BiYWI4QHBpZT4KTUlNRS1WZXJzaW9uOiAxLjAKQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKCkhpIFlhbyBaaSwKCk9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDA0OjAyOjQz
UE0gKzAwMDAsIFlhbyBaaSB3cm90ZToKPiBJIHRoaW5rIHNwYWNlbWl0LGsxLXN5c2Nvbi55YW1s
IHNob3VsZCBwcm9iYWJseSBiZSB1cGRhdGVkIHRvIG1ha2UKPiAnI2Nsb2NrLWNlbGxzJyBwcm9w
ZXJ0eSBtYW5kYXRvcnkgZm9yIHJjcHUyIG5vZGU/IEFuZCBwcm9iYWJseSBhbHNvCj4gdGhlIG90
aGVyIGJsb2NrcyBjYXBhYmxlIG9mIGNsb2NrIHN0dWZmIGFzIGZpeC4uLgoKUmlnaHQuIEluIHYy
LCAjY2xvY2stY2VsbHMgd2lsbCBiZSByZXF1aXJlZCBmb3IKc3BhY2VtaXQsazEtc3lzY29uLXJj
cHUyIChvbiBpdHMgb3duLCBzaW5jZSByY3B1MiB0YWtlcyBubwpvc2MvdmN0Y3hvIGlucHV0cyku
IEZvciB0aGUgb3RoZXIgYmxvY2tzLCBJIHdpbGwgY2hlY2sgd2hpY2ggb25lcwpwcm92aWRlIGNs
b2NrcyBhbmQgc2VuZCBhIHNlcGFyYXRlIGZpeC4KCkZyw6lkw6lyaWMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
